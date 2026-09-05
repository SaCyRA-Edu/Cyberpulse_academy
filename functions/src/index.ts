import { onCall, onRequest, HttpsError } from "firebase-functions/v2/https";
import { setGlobalOptions } from "firebase-functions/v2";
import { defineSecret } from "firebase-functions/params";
import * as admin from "firebase-admin";
import { FieldValue } from "firebase-admin/firestore";
import * as crypto from "crypto";
import Razorpay from "razorpay";

admin.initializeApp();
setGlobalOptions({ maxInstances: 10 });

const db = admin.firestore();

const RAZORPAY_KEY_ID = defineSecret("RAZORPAY_KEY_ID");
const RAZORPAY_KEY_SECRET = defineSecret("RAZORPAY_KEY_SECRET");

const FALLBACK_PRICE_PAISE = 49900; // ₹499.00
const CURRENCY = "INR";

// Free attempts before a retake purchase is required: 1 initial attempt
// + 2 free retakes = 3 total free attempts. The 4th attempt (the "3rd
// retake") requires purchasing retake access.
const FREE_ATTEMPT_LIMIT = 3;

async function getFullAccessPricePaise(): Promise<number> {
  try {
    const doc = await db.collection("config").doc("pricing").get();
    const price = doc.data()?.fullAccessPricePaise;
    if (typeof price === "number" && price > 0) {
      return price;
    }
  } catch (_) {
    // fall through to the fallback below
  }
  return FALLBACK_PRICE_PAISE;
}

type ProductType = "full_access" | "retake";

/**
 * Creates a Razorpay Order for either the initial full-access purchase
 * or a discounted retake unlock (50% of the current full-access
 * price). Which product this order is for is recorded server-side in
 * a pendingOrders document — verifyRazorpayPayment reads that back
 * rather than trusting whatever product type a client might claim
 * when it later calls verify, so a tampered client can't create a
 * cheap retake order and then claim it was actually a full-access
 * purchase.
 */
export const createRazorpayOrder = onCall(
  { secrets: [RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET] },
  async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
      throw new HttpsError("unauthenticated", "You must be signed in to make a purchase.");
    }

    const productType = (request.data?.productType as ProductType | undefined) ?? "full_access";
    if (productType !== "full_access" && productType !== "retake") {
      throw new HttpsError("invalid-argument", "Invalid product type.");
    }

    const razorpay = new Razorpay({
      key_id: RAZORPAY_KEY_ID.value(),
      key_secret: RAZORPAY_KEY_SECRET.value(),
    });

    const basePrice = await getFullAccessPricePaise();
    const amountPaise = productType === "retake" ? Math.round(basePrice / 2) : basePrice;

    try {
      const order = await razorpay.orders.create({
        amount: amountPaise,
        currency: CURRENCY,
        receipt: `${productType}_${uid}_${Date.now()}`,
        notes: { uid, product: productType },
      });

      // Record what this order is actually for, server-side, so
      // verification later can't be tricked by a client-supplied value.
      await db.collection("pendingOrders").doc(order.id).set({
        uid,
        productType,
        createdAt: FieldValue.serverTimestamp(),
      });

      return {
        orderId: order.id,
        amount: order.amount,
        currency: order.currency,
        keyId: RAZORPAY_KEY_ID.value(),
      };
    } catch (err) {
      throw new HttpsError("internal", `Could not create Razorpay order: ${err}`);
    }
  }
);

export const verifyRazorpayPayment = onCall(
  { secrets: [RAZORPAY_KEY_SECRET] },
  async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
      throw new HttpsError("unauthenticated", "You must be signed in to verify a payment.");
    }

    const orderId = request.data?.razorpay_order_id as string | undefined;
    const paymentId = request.data?.razorpay_payment_id as string | undefined;
    const signature = request.data?.razorpay_signature as string | undefined;

    if (!orderId || !paymentId || !signature) {
      throw new HttpsError("invalid-argument", "Missing payment verification fields.");
    }

    const expectedSignature = crypto
      .createHmac("sha256", RAZORPAY_KEY_SECRET.value())
      .update(`${orderId}|${paymentId}`)
      .digest("hex");

    if (expectedSignature !== signature) {
      throw new HttpsError(
        "permission-denied",
        "Payment signature verification failed — this payment cannot be trusted."
      );
    }

    // Look up what this order was actually FOR — never trust a
    // client-supplied product type here.
    const pendingOrderDoc = await db.collection("pendingOrders").doc(orderId).get();
    if (!pendingOrderDoc.exists) {
      throw new HttpsError("not-found", "No matching order record found for this payment.");
    }
    const pendingOrder = pendingOrderDoc.data()!;
    if (pendingOrder.uid !== uid) {
      throw new HttpsError("permission-denied", "This order does not belong to your account.");
    }
    const productType = pendingOrder.productType as ProductType;

    const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
    const updateData: Record<string, unknown> =
      productType === "retake"
        ? {
            retakeUnlocked: true,
            retakeUnlockedAt: FieldValue.serverTimestamp(),
            retakePaymentId: paymentId,
          }
        : {
            fullAccessPurchased: true,
            fullAccessPurchasedAt: FieldValue.serverTimestamp(),
            fullAccessPaymentId: paymentId,
            fullAccessOrderId: orderId,
          };

    await progressRef.set(updateData, { merge: true });
    await pendingOrderDoc.ref.delete(); // no longer needed once redeemed

    return { success: true, productType };
  }
);

// ═══════════════════════════════════════════════════════════════════════
// Web purchase flow — same Razorpay purchase, but triggered from a
// plain webpage on sacyra.com instead of inside the app. There's no
// Firebase Auth session on that webpage (deliberately kept simple,
// rather than bolting Firebase Auth onto the WordPress site), so these
// two mirror createRazorpayOrder / verifyRazorpayPayment above but
// identify the purchaser by EMAIL instead of request.auth.uid. Both
// need CORS enabled, since the calling page lives on a different
// domain than this Cloud Function.
// ═══════════════════════════════════════════════════════════════════════

const ALLOWED_WEB_ORIGINS = ["https://www.sacyra.com", "https://sacyra.com"];

export const createWebRazorpayOrder = onRequest(
  { secrets: [RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET], cors: ALLOWED_WEB_ORIGINS },
  async (req, res) => {
    if (req.method !== "POST") {
      res.status(405).json({ error: "Method not allowed." });
      return;
    }

    const email = (req.body?.email as string | undefined)?.trim().toLowerCase();
    if (!email || !email.includes("@")) {
      res.status(400).json({ error: "A valid email is required." });
      return;
    }

    // Check the account exists BEFORE creating any Razorpay order or
    // accepting any payment — this is what actually prevents someone
    // from paying for an email that has no matching app account. The
    // old version only validated email format, meaning a genuine typo
    // (no matching account) would still result in a real charge
    // before the mismatch was ever discovered, in verifyWebRazorpayPayment.
    let userRecord;
    try {
      userRecord = await admin.auth().getUserByEmail(email);
    } catch (_) {
      res.status(404).json({
        error: "No app account found with this email. Please create an account in the app first, using this same email, then try again.",
      });
      return;
    }

    const razorpay = new Razorpay({
      key_id: RAZORPAY_KEY_ID.value(),
      key_secret: RAZORPAY_KEY_SECRET.value(),
    });

    const amountPaise = await getFullAccessPricePaise();

    try {
      const order = await razorpay.orders.create({
        amount: amountPaise,
        currency: CURRENCY,
        receipt: `web_full_access_${Date.now()}`,
        notes: { email, product: "full_access", source: "web" },
      });

      // Recorded by email instead of uid, since there's no
      // authenticated session on the website to get a uid from.
      await db.collection("pendingOrders").doc(order.id).set({
        email,
        productType: "full_access",
        source: "web",
        createdAt: FieldValue.serverTimestamp(),
      });

      res.status(200).json({
        orderId: order.id,
        amount: order.amount,
        currency: order.currency,
        keyId: RAZORPAY_KEY_ID.value(),
        // Sent back so the page can show "this will unlock access for
        // [name]" before payment — a chance to catch a typo that
        // happens to match a DIFFERENT real account, which the
        // existence check above can't catch on its own (the email is
        // valid, it's just not the one the payer actually meant).
        accountDisplayName: userRecord.displayName || null,
      });
    } catch (err) {
      res.status(500).json({ error: `Could not create order: ${err}` });
    }
  }
);

export const verifyWebRazorpayPayment = onRequest(
  { secrets: [RAZORPAY_KEY_SECRET], cors: ALLOWED_WEB_ORIGINS },
  async (req, res) => {
    if (req.method !== "POST") {
      res.status(405).json({ error: "Method not allowed." });
      return;
    }

    const orderId = req.body?.razorpay_order_id as string | undefined;
    const paymentId = req.body?.razorpay_payment_id as string | undefined;
    const signature = req.body?.razorpay_signature as string | undefined;
    const email = (req.body?.email as string | undefined)?.trim().toLowerCase();

    if (!orderId || !paymentId || !signature || !email) {
      res.status(400).json({ error: "Missing payment verification fields." });
      return;
    }

    const expectedSignature = crypto
      .createHmac("sha256", RAZORPAY_KEY_SECRET.value())
      .update(`${orderId}|${paymentId}`)
      .digest("hex");

    if (expectedSignature !== signature) {
      res.status(403).json({ error: "Payment signature verification failed." });
      return;
    }

    const pendingOrderDoc = await db.collection("pendingOrders").doc(orderId).get();
    if (!pendingOrderDoc.exists) {
      res.status(404).json({ error: "No matching order record found for this payment." });
      return;
    }
    const pendingOrder = pendingOrderDoc.data()!;
    // Confirms the email completing checkout matches the email that
    // requested this specific order — prevents a signature-valid
    // payment from a DIFFERENT order being replayed against a
    // different email than the one that actually paid.
    if (pendingOrder.email !== email) {
      res.status(403).json({ error: "This order does not match the provided email." });
      return;
    }

    // Match the email to an actual app account. If none exists, the
    // purchase can't be linked to anything yet — the website should
    // instruct the buyer to create an app account with this same email
    // first. Deliberately NOT silently granting access to a
    // not-yet-existing account here, to keep this simple and avoid a
    // separate "pending grant" mechanism.
    let userRecord;
    try {
      userRecord = await admin.auth().getUserByEmail(email);
    } catch (_) {
      res.status(404).json({
        error: "No app account found with this email. Please create an account in the app first, then try again.",
      });
      return;
    }

    const progressRef = db.collection("users").doc(userRecord.uid).collection("progress").doc("summary");
    await progressRef.set(
      {
        fullAccessPurchased: true,
        fullAccessPurchasedAt: FieldValue.serverTimestamp(),
        fullAccessPaymentId: paymentId,
        fullAccessOrderId: orderId,
      },
      { merge: true }
    );
    await pendingOrderDoc.ref.delete();

    res.status(200).json({ success: true });
  }
);

// ═══════════════════════════════════════════════════════════════════════
// Final exam — batch model with a retake limit.
// ═══════════════════════════════════════════════════════════════════════

// TEMPORARY FOR TESTING — set back to 100 once confirmed working.
const TOTAL_QUESTIONS = 100;
const TIME_LIMIT_SECONDS = 120 * 60;
const PASS_THRESHOLD = 75.0;

interface StoredQuestion {
  question: string;
  options: string[];
  correctIndex: number;
  explanation: string;
  area: string;
  difficulty: string;
}

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

export const startExamAttempt = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new HttpsError("unauthenticated", "You must be signed in to start the exam.");
  }

  // Retake limit check — an admin account bypasses this entirely, same
  // as it bypasses the chapter/full-access gates on the client.
  const userDoc = await db.collection("users").doc(uid).get();
  const isAdmin = userDoc.data()?.isAdmin === true;

  const progressDoc = await db.collection("users").doc(uid).collection("progress").doc("summary").get();
  const progressData = progressDoc.exists ? progressDoc.data()! : {};
  const attemptsSoFar = ((progressData.finalExamHistory as unknown[] | undefined) ?? []).length;
  const retakeUnlocked = progressData.retakeUnlocked === true;

  if (!isAdmin && !retakeUnlocked && attemptsSoFar >= FREE_ATTEMPT_LIMIT) {
    throw new HttpsError(
      "resource-exhausted",
      "retake_limit_reached" // client matches on this exact message to show the retake paywall
    );
  }

  const allDocs = await db.collection("examQuestions").get();
  const allIds = allDocs.docs.map((d) => d.id);
  if (allIds.length === 0) {
    throw new HttpsError("failed-precondition", "No exam questions are available.");
  }

  const selectedIds = shuffle(allIds).slice(0, Math.min(TOTAL_QUESTIONS, allIds.length));
  const questionsById = new Map(allDocs.docs.map((d) => [d.id, d.data() as StoredQuestion]));

  const sessionQuestions = selectedIds.map((id) => {
    const data = questionsById.get(id)!;
    const permutation = shuffle(data.options.map((_, i) => i));
    return { questionId: id, area: data.area, permutation, correctIndex: data.correctIndex };
  });

  const attemptRef = db.collection("users").doc(uid).collection("examAttempts").doc();
  await attemptRef.set({
    uid,
    status: "in_progress",
    startedAt: FieldValue.serverTimestamp(),
    startedAtMillis: Date.now(),
    questions: sessionQuestions,
    totalQuestions: sessionQuestions.length,
  });

  const publicQuestions = sessionQuestions.map((sq) => ({
    questionId: sq.questionId,
    question: questionsById.get(sq.questionId)!.question,
    options: sq.permutation.map((originalIdx) => questionsById.get(sq.questionId)!.options[originalIdx]),
  }));

  return {
    attemptId: attemptRef.id,
    timeLimitSeconds: TIME_LIMIT_SECONDS,
    questions: publicQuestions,
  };
});

export const submitExam = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new HttpsError("unauthenticated", "You must be signed in.");
  }

  const attemptId = request.data?.attemptId as string | undefined;
  const answers = request.data?.answers as Record<string, number> | undefined;
  if (!attemptId || !answers) {
    throw new HttpsError("invalid-argument", "attemptId and answers are required.");
  }

  const attemptRef = db.collection("users").doc(uid).collection("examAttempts").doc(attemptId);
  const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");

  return db.runTransaction(async (tx) => {
    const snap = await tx.get(attemptRef);
    const progressSnap = await tx.get(progressRef);

    if (!snap.exists) {
      throw new HttpsError("not-found", "Exam attempt not found.");
    }
    const session = snap.data()!;
    if (session.status !== "in_progress") {
      throw new HttpsError("failed-precondition", "This exam attempt has already been submitted.");
    }

    const questions: { questionId: string; area: string; permutation: number[]; correctIndex: number }[] =
      session.questions;

    // Server-side enforcement that every question was actually
    // answered — the client already blocks submission for this, but
    // that's a UX convenience, not security; a modified client could
    // skip that check, so it's enforced here too.
    const unanswered = questions.filter((q) => answers[q.questionId] === undefined);
    if (unanswered.length > 0) {
      throw new HttpsError(
        "failed-precondition",
        `${unanswered.length} question(s) are unanswered. All questions must be answered before submitting.`
      );
    }

    let correctCount = 0;
    const areaTotals: Record<string, { correct: number; total: number }> = {};

    for (const q of questions) {
      areaTotals[q.area] = areaTotals[q.area] || { correct: 0, total: 0 };
      areaTotals[q.area].total++;
      const selectedPosition = answers[q.questionId];
      const originalIndexPicked = q.permutation[selectedPosition];
      if (originalIndexPicked === q.correctIndex) {
        correctCount++;
        areaTotals[q.area].correct++;
      }
    }

    const percentage = (correctCount / questions.length) * 100;
    const passed = percentage >= PASS_THRESHOLD;

    tx.update(attemptRef, {
      status: "completed",
      completedAt: FieldValue.serverTimestamp(),
      correctCount,
      finalPercentage: percentage,
      finalPassed: passed,
      areaBreakdown: areaTotals,
    });

    const progressData = progressSnap.exists ? progressSnap.data()! : {};
    const existingBest = (progressData.finalExamScore as number | undefined) ?? 0;
    const newBest = percentage > existingBest ? percentage : existingBest;
    const existingHistory = (progressData.finalExamHistory as unknown[] | undefined) ?? [];
    const newHistory = [{ score: percentage, date: new Date().toISOString() }, ...existingHistory];
    // retakeUnlocked is intentionally NOT reset here — once purchased,
    // it stays true permanently, so a single retake purchase unlocks
    // unlimited future attempts rather than needing to be bought again
    // after every single retake.
    tx.set(
      progressRef,
      { finalExamScore: newBest, finalExamHistory: newHistory },
      { merge: true }
    );

    return {
      finalPercentage: percentage,
      finalPassed: passed,
      correctCount,
      totalQuestions: questions.length,
      areaBreakdown: Object.entries(areaTotals).map(([area, v]) => ({
        area,
        correct: v.correct,
        total: v.total,
      })),
    };
  });
});
import { onSchedule } from "firebase-functions/v2/scheduler";
import * as nodemailer from "nodemailer";

// admin.initializeApp() and const db are already declared once, at the
// top of this file from the Razorpay/exam work — deliberately not
// redeclared here.

// Gmail App Password for sacyra.edu@gmail.com — NOT the account's
// normal login password. Generate one at myaccount.google.com under
// Security > 2-Step Verification > App Passwords (requires 2-Step
// Verification to be enabled on that account first). Store it via:
// Google Workspace accounts no longer support App Password-based SMTP
// auth (Google discontinued this for Workspace in May 2025 - personal
// Gmail accounts still support it, Workspace accounts require OAuth2).
// Set these via:
//   firebase functions:secrets:set GMAIL_OAUTH_CLIENT_ID
//   firebase functions:secrets:set GMAIL_OAUTH_CLIENT_SECRET
//   firebase functions:secrets:set GMAIL_OAUTH_REFRESH_TOKEN
const GMAIL_OAUTH_CLIENT_ID = defineSecret("GMAIL_OAUTH_CLIENT_ID");
const GMAIL_OAUTH_CLIENT_SECRET = defineSecret("GMAIL_OAUTH_CLIENT_SECRET");
const GMAIL_OAUTH_REFRESH_TOKEN = defineSecret("GMAIL_OAUTH_REFRESH_TOKEN");
const SENDER_EMAIL = "sacyra.edu@sacyra.com";

// TEMPORARY FOR TESTING — 2 minutes instead of a real day, so you don't
// have to wait 24 hours to verify this works. Set back to
// `24 * 60 * 60 * 1000` once confirmed working, then redeploy again.
const INACTIVITY_THRESHOLD_MS = 24 * 60 * 60 * 1000; // 1 day

/**
 * Runs once every 24 hours. Finds users who either (a) created an
 * account but never opened a single lesson, or (b) went quiet for 24+
 * hours after previously being active, and haven't already passed the
 * final exam — then emails each one a reminder, once per inactivity
 * period (won't re-send daily nags to someone who remains inactive;
 * only fires again if they became active and then went quiet again).
 */
export const sendInactivityReminders = onSchedule(
  { schedule: "every 24 hours", secrets: [GMAIL_OAUTH_CLIENT_ID, GMAIL_OAUTH_CLIENT_SECRET, GMAIL_OAUTH_REFRESH_TOKEN] },
  async () => {
    const transporter = nodemailer.createTransport({
      service: "gmail",
      auth: {
        type: "OAuth2",
        user: SENDER_EMAIL,
        clientId: GMAIL_OAUTH_CLIENT_ID.value(),
        clientSecret: GMAIL_OAUTH_CLIENT_SECRET.value(),
        refreshToken: GMAIL_OAUTH_REFRESH_TOKEN.value(),
      },
    });

    const now = Date.now();

    // All per-user progress summaries, wherever they live in the
    // hierarchy — collectionGroup finds every doc inside any
    // "progress" subcollection across all users; filtered to just the
    // "summary" doc ID below, as a safety net in case any other
    // document ever ends up in a "progress" subcollection.
    const progressSnaps = await db.collectionGroup("progress").get();

    let sent = 0;
    let skipped = 0;
    let failed = 0;

    for (const doc of progressSnaps.docs) {
      if (doc.id !== "summary") continue; // collectionGroup on "progress" only, filter to the summary doc

      const uid = doc.ref.parent.parent?.id;
      if (!uid) continue;

      const data = doc.data();

      // Already passed — nothing "pending" to remind them about.
      const bestScore = (data.finalExamScore as number | undefined) ?? 0;
      if (bestScore >= 75) {
        skipped++;
        continue;
      }

      const lastActiveAtMillis = (data.lastActiveAt as admin.firestore.Timestamp | undefined)?.toMillis();
      const lastReminderSentAtMillis = (data.lastReminderSentAt as admin.firestore.Timestamp | undefined)?.toMillis();

      let userRecord;
      try {
        userRecord = await admin.auth().getUser(uid);
      } catch (_) {
        skipped++; // account deleted or otherwise unreachable
        continue;
      }
      if (!userRecord.email) {
        skipped++;
        continue;
      }

      let isEligible: boolean;
      let reasonNeverStarted: boolean;

      if (lastActiveAtMillis === undefined) {
        // Never recorded any activity at all — check account age
        // instead, since there's no lastActiveAt to compare against.
        const createdAtMillis = new Date(userRecord.metadata.creationTime).getTime();
        isEligible = now - createdAtMillis > INACTIVITY_THRESHOLD_MS;
        reasonNeverStarted = true;
      } else {
        isEligible = now - lastActiveAtMillis > INACTIVITY_THRESHOLD_MS;
        reasonNeverStarted = false;
      }

      // Don't re-send while they remain continuously inactive — only
      // eligible again if a reminder was never sent, or was sent
      // before their last recorded activity (meaning they came back
      // and then went quiet again since).
      const alreadyRemindedForThisPeriod =
        lastReminderSentAtMillis !== undefined &&
        (lastActiveAtMillis === undefined || lastReminderSentAtMillis >= lastActiveAtMillis);

      if (!isEligible || alreadyRemindedForThisPeriod) {
        skipped++;
        continue;
      }

      const subject = reasonNeverStarted
        ? "Your CyberPulse Academy course is waiting for you"
        : "Don't lose momentum — continue your CyberPulse Academy course";

      const bodyIntro = reasonNeverStarted
        ? "You created an account but haven't started your first lesson yet."
        : "It's been a day since your last visit, and your course and Final Certification Exam are still waiting.";

      try {
        await transporter.sendMail({
          from: `"CyberPulse Academy" <${SENDER_EMAIL}>`,
          to: userRecord.email,
          subject,
          // Plain-text alternative alongside the HTML version -
          // legitimate transactional email should include both
          // (multipart/alternative); HTML-only is a minor spam signal
          // some filters weigh, since spam senders often skip this.
          text: `${subject}\n\n${bodyIntro}\n\nCybersecurity skills build up fastest with regular, short sessions — jump back in for even 10 minutes today to keep your progress moving.\n\nCyberPulse Academy — A SaCyra Company`,
          html: `
            <div style="font-family: Arial, sans-serif; max-width: 480px; margin: 0 auto;">
              <h2 style="color: #0D1B3E;">${subject}</h2>
              <p>${bodyIntro}</p>
              <p>Cybersecurity skills build up fastest with regular, short sessions —
                 jump back in for even 10 minutes today to keep your progress moving.</p>
              <p style="margin-top: 24px; color: #757575; font-size: 12px;">
                CyberPulse Academy — A SaCyra Company
              </p>
            </div>
          `,
        });
        await doc.ref.set({ lastReminderSentAt: FieldValue.serverTimestamp() }, { merge: true });
        sent++;
      } catch (err) {
        console.error(`Failed to email ${userRecord.email}:`, err);
        failed++;
      }
    }

    console.log(`Inactivity reminders: ${sent} sent, ${skipped} skipped, ${failed} failed.`);
  }
);

// ═══════════════════════════════════════════════════════════════════════
// Daily Puzzle + Leaderboard
// ═══════════════════════════════════════════════════════════════════════
//
// Deliberately just ONE new collection: puzzles/{id}. Each document IS
// a puzzle — content, answer, active flag, and lastUsedAt —
// no separate "bank" vs "today's pick" collection. "Today's puzzle" is
// simply whichever active puzzle has the most recent lastUsedAt.
//
// No separate attempts/leaderboard collections either — puzzle score
// and last-attempt date are stored as fields directly on the SAME
// users/{uid}/progress/summary doc already used for legal name, exam
// history, and activity tracking. The leaderboard is a collectionGroup
// query across that same existing data, matching the pattern already
// used by sendInactivityReminders above.

const PUZZLE_BONUS_THRESHOLD = 10; // first N correct answers get the bonus
const PUZZLE_BONUS_POINTS = 50;
const PUZZLE_STANDARD_POINTS = 20;

/**
 * Runs once daily at a fixed time (9:00 AM IST). Picks a random active
 * puzzle, EXCLUDING whichever one was most recently used (i.e.
 * yesterday's) — a hard guarantee against an immediate repeat, not
 * just a soft preference, regardless of how small the puzzle bank is
 * (as long as there are at least 2 active puzzles).
 */
/**
 * Returns today's puzzle with ONLY its safe, public display fields —
 * question, never correctAnswer. This is the sole way
 * the client ever sees puzzle content; direct Firestore reads of the
 * puzzles collection are blocked entirely in security rules, so
 * there's no path for a client to read correctAnswer straight off the
 * document (Firestore rules can only allow/deny a whole document, not
 * hide individual fields within one).
 */
export const getTodaysPuzzle = onCall(async () => {
  const activeSnap = await db.collection("puzzles").where("active", "==", true).get();
  if (activeSnap.empty) return { available: false };

  let todaysPuzzle: FirebaseFirestore.QueryDocumentSnapshot | null = null;
  let mostRecentAt = 0;
  for (const doc of activeSnap.docs) {
    const usedAt = (doc.data().lastUsedAt as admin.firestore.Timestamp | undefined)?.toMillis() ?? 0;
    if (usedAt > mostRecentAt) {
      mostRecentAt = usedAt;
      todaysPuzzle = doc;
    }
  }
  if (!todaysPuzzle) return { available: false };

  const data = todaysPuzzle.data();
  return {
    available: true,
    type: data.type,
    question: data.question, // display data only - never correctAnswer
  };
});

export const publishDailyPuzzle = onSchedule(
  { schedule: "0 9 * * *", timeZone: "Asia/Kolkata" },
  async () => {
    const activeSnap = await db.collection("puzzles").where("active", "==", true).get();
    if (activeSnap.empty) {
      console.log("publishDailyPuzzle: no active puzzles, skipping today.");
      return;
    }

    // Find whichever puzzle was used most recently (yesterday's pick,
    // under normal daily operation) so it can be explicitly excluded.
    let mostRecentDoc: FirebaseFirestore.QueryDocumentSnapshot | null = null;
    let mostRecentAt = 0;
    for (const doc of activeSnap.docs) {
      const usedAt = (doc.data().lastUsedAt as admin.firestore.Timestamp | undefined)?.toMillis() ?? 0;
      if (usedAt > mostRecentAt) {
        mostRecentAt = usedAt;
        mostRecentDoc = doc;
      }
    }

    const candidates = activeSnap.docs.filter((doc) => doc.id !== mostRecentDoc?.id);
    // Only fall back to including yesterday's puzzle if it's truly the
    // only active puzzle in the whole bank — better to repeat once
    // than publish nothing.
    const pool = candidates.length > 0 ? candidates : activeSnap.docs;

    const chosen = pool[Math.floor(Math.random() * pool.length)];

    await chosen.ref.set(
      { lastUsedAt: FieldValue.serverTimestamp(), releaseCount: FieldValue.increment(1), correctCountToday: 0 },
      { merge: true }
    );

    console.log(`publishDailyPuzzle: published puzzle ${chosen.id} (type: ${chosen.data().type}).`);
  }
);

/**
 * Called when a user submits an answer to today's puzzle. "Today's
 * puzzle" is looked up fresh each time (the active puzzle with the
 * most recent lastUsedAt) rather than relying on a separately-stored
 * pointer, since that's the only piece of truth this simplified
 * design needs. Validates server-side, enforces one attempt per user
 * per day, and awards points — bonus for the first
 * PUZZLE_BONUS_THRESHOLD correct answers, standard after that. Runs
 * inside a transaction so simultaneous submissions can't create a race
 * condition around the bonus cutoff.
 */
/**
 * Compares a submitted answer against the correct answer, with
 * comparison logic that depends entirely on the puzzle's type — each
 * format stores its answer differently, so each needs its own check.
 * All four require an EXACT match to count as correct (no partial
 * credit) - simplest, least ambiguous rule to start with.
 */
function checkPuzzleAnswer(puzzleType: string, correctData: any, submitted: any): boolean {
  switch (puzzleType) {
    case "mcq": {
      // correctData: string (the correct option text)
      // submitted: string
      const correct = (correctData as string | undefined)?.trim().toLowerCase();
      const answer = (submitted as string | undefined)?.trim().toLowerCase();
      return !!correct && correct === answer;
    }

    case "spotMistake": {
      // correctData: string[] (the correct flag texts, order doesn't matter)
      // submitted: string[] (the flags the user selected)
      if (!Array.isArray(correctData) || !Array.isArray(submitted)) return false;
      const normalize = (arr: unknown[]) =>
        arr.map((s) => String(s).trim().toLowerCase()).sort();
      const correctSet = normalize(correctData);
      const submittedSet = normalize(submitted);
      return (
        correctSet.length === submittedSet.length &&
        correctSet.every((val, i) => val === submittedSet[i])
      );
    }

    case "matching": {
      // correctData: { term: string, definition: string }[]
      // submitted: same shape - every pair must match, order doesn't matter
      if (!Array.isArray(correctData) || !Array.isArray(submitted)) return false;
      if (correctData.length !== submitted.length) return false;
      const normalizePair = (p: any) =>
        `${String(p?.term ?? "").trim().toLowerCase()}|${String(p?.definition ?? "").trim().toLowerCase()}`;
      const correctSet = new Set(correctData.map(normalizePair));
      const submittedSet = new Set(submitted.map(normalizePair));
      if (correctSet.size !== submittedSet.size) return false;
      for (const pair of correctSet) if (!submittedSet.has(pair)) return false;
      return true;
    }

    case "sequence": {
      // correctData: string[] (the items in correct order)
      // submitted: string[] (the order the user arranged them in) -
      // order DOES matter here, unlike the other array-based types
      if (!Array.isArray(correctData) || !Array.isArray(submitted)) return false;
      if (correctData.length !== submitted.length) return false;
      return correctData.every(
        (val, i) => String(val).trim().toLowerCase() === String(submitted[i]).trim().toLowerCase()
      );
    }

    default:
      return false;
  }
}

/**
 * Admin-only: creates a new puzzle document. This is the ONLY write
 * path into the puzzles collection (clients can't write directly, per
 * the security rules), so this function is what an admin-facing
 * screen in the app calls to actually add content — covering all 4
 * puzzle types through the same endpoint via the "type" field.
 */
export const createPuzzle = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) throw new HttpsError("unauthenticated", "Sign in required.");

  const callerDoc = await db.collection("users").doc(uid).get();
  if (callerDoc.data()?.isAdmin !== true) {
    throw new HttpsError("permission-denied", "Admin access required.");
  }

  const { type, question, correctAnswer } = request.data ?? {};

  const validTypes = ["mcq", "spotMistake", "matching", "sequence"];
  if (!validTypes.includes(type)) {
    throw new HttpsError("invalid-argument", `type must be one of: ${validTypes.join(", ")}`);
  }
  if (!question) {
    throw new HttpsError("invalid-argument", "question is required.");
  }
  if (correctAnswer === undefined || correctAnswer === null) {
    throw new HttpsError("invalid-argument", "correctAnswer is required.");
  }

  const docRef = await db.collection("puzzles").add({
    type,
    question, // shape depends on type - see PUZZLE_SCHEMA notes above submitPuzzleAnswer
    correctAnswer, // shape depends on type - never sent to clients (see getTodaysPuzzle)
    active: true,
    createdAt: FieldValue.serverTimestamp(),
    createdBy: uid,
  });

  return { puzzleId: docRef.id };
});

export const submitPuzzleAnswer = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) throw new HttpsError("unauthenticated", "Sign in required.");

  // Free opt-in gate: the puzzle is visible to everyone, but only
  // users who've opted in can actually submit an answer. Checked here
  // server-side too — a greyed-out button on the client is a UX
  // signal, not a real enforcement, since someone could otherwise call
  // this function directly.
  const progressCheckRef = db.collection("users").doc(uid).collection("progress").doc("summary");
  const progressCheckSnap = await progressCheckRef.get();
  if (progressCheckSnap.data()?.puzzleSubscribed !== true) {
    throw new HttpsError("permission-denied", "Opt in to the puzzle game to submit an answer.");
  }

  // "answer" can be a string (mcq) or an array/object (the other
  // three types) - shape depends on today's puzzle type, checked below.
  const submittedAnswer = request.data?.answer;
  if (submittedAnswer === undefined || submittedAnswer === null) {
    throw new HttpsError("invalid-argument", "Missing answer.");
  }

  const activeSnap = await db.collection("puzzles").where("active", "==", true).get();
  if (activeSnap.empty) throw new HttpsError("failed-precondition", "No puzzle is available right now.");

  let todaysPuzzle: FirebaseFirestore.QueryDocumentSnapshot | null = null;
  let mostRecentAt = 0;
  for (const doc of activeSnap.docs) {
    const usedAt = (doc.data().lastUsedAt as admin.firestore.Timestamp | undefined)?.toMillis() ?? 0;
    if (usedAt > mostRecentAt) {
      mostRecentAt = usedAt;
      todaysPuzzle = doc;
    }
  }
  if (!todaysPuzzle) throw new HttpsError("failed-precondition", "No puzzle is available right now.");

  const puzzleData = todaysPuzzle.data();
  const puzzleType = puzzleData.type as string;
  const isCorrect = checkPuzzleAnswer(puzzleType, puzzleData.correctAnswer, submittedAnswer);

  const todayKey = new Date().toLocaleDateString("en-CA", { timeZone: "Asia/Kolkata" }); // YYYY-MM-DD
  const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
  const puzzleRef = todaysPuzzle.ref;

  const result = await db.runTransaction(async (tx) => {
    const progressSnap = await tx.get(progressRef);
    const lastAttemptDate = progressSnap.data()?.puzzleLastAttemptDate as string | undefined;
    if (lastAttemptDate === todayKey) {
      throw new HttpsError("already-exists", "You've already attempted today's puzzle.");
    }

    let pointsEarned = 0;
    let wasBonus = false;

    if (isCorrect) {
      const freshPuzzle = await tx.get(puzzleRef);
      const currentCorrectCount = (freshPuzzle.data()?.correctCountToday as number | undefined) ?? 0;
      const newCorrectCount = currentCorrectCount + 1;
      wasBonus = newCorrectCount <= PUZZLE_BONUS_THRESHOLD;
      pointsEarned = wasBonus ? PUZZLE_BONUS_POINTS : PUZZLE_STANDARD_POINTS;

      tx.set(puzzleRef, { correctCountToday: newCorrectCount }, { merge: true });
    }

    tx.set(
      progressRef,
      {
        puzzleLastAttemptDate: todayKey,
        puzzleTotalScore: FieldValue.increment(pointsEarned),
        puzzleTotalCorrect: FieldValue.increment(isCorrect ? 1 : 0),
      },
      { merge: true }
    );

    return { correct: isCorrect, pointsEarned, wasBonus };
  });

  return result;
});

/**
 * Returns the top N users by cumulative puzzle score, for the
 * leaderboard screen. Reads across the same progress/summary docs
 * used everywhere else — no dedicated leaderboard collection to keep
 * in sync.
 */
export const getAdminReport = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) throw new HttpsError("unauthenticated", "Sign in required.");

  const callerDoc = await db.collection("users").doc(uid).get();
  if (callerDoc.data()?.isAdmin !== true) {
    throw new HttpsError("permission-denied", "Admin access required.");
  }

  // Fetch every registered user via the Auth Admin SDK (paginated —
  // listUsers returns at most 1000 per page, so this loops until
  // there's no pageToken left). This is the source of truth for
  // registration counts/dates, separate from Firestore progress data.
  const authUsers: { uid: string; createdAt: string }[] = [];
  let pageToken: string | undefined = undefined;
  do {
    const result: admin.auth.ListUsersResult = await admin.auth().listUsers(1000, pageToken);
    for (const userRecord of result.users) {
      // metadata.creationTime comes back as an RFC-1123-style string
      // (e.g. "Thu, 01 Jan 2026 00:00:00 GMT"), not ISO8601 — Dart's
      // DateTime.tryParse() can't reliably parse that format, so it's
      // converted here at the source rather than risk silently
      // failing to parse on the client and breaking every date-range
      // calculation.
      authUsers.push({ uid: userRecord.uid, createdAt: new Date(userRecord.metadata.creationTime).toISOString() });
    }
    pageToken = result.pageToken;
  } while (pageToken);

  // For each user, pull just what's needed from their progress/summary
  // doc. Returns RAW counts (e.g. viewedLessonsCount), not
  // percentages — turning that into "% of reading completed" needs
  // dividing by the total lesson count, which lives in the Flutter
  // app's levels_data.dart, not duplicated here. Doing the percentage
  // math client-side means this never needs updating when lessons are
  // added or changed.
  //
  // NOTE: this does one Firestore read per user. Fine at current scale;
  // if the user base grows substantially, this would benefit from
  // batching reads or maintaining running aggregate counters instead
  // of recomputing from scratch on every call.
  const perUserData = await Promise.all(
    authUsers.map(async (u) => {
      const progressDoc = await db.collection("users").doc(u.uid).collection("progress").doc("summary").get();
      const data = progressDoc.data();
      const viewedLessonsCount = Array.isArray(data?.viewedLessons) ? data!.viewedLessons.length : 0;
      const finalExamHistory = Array.isArray(data?.finalExamHistory) ? data!.finalExamHistory : [];
      const certificationCompleted = finalExamHistory.some(
        (attempt: { score?: number }) => (attempt?.score ?? 0) >= 75
      );
      const fullAccessPurchased = data?.fullAccessPurchased === true;
      return {
        createdAt: u.createdAt,
        viewedLessonsCount,
        certificationCompleted,
        fullAccessPurchased,
      };
    })
  );

  return { totalUsers: authUsers.length, users: perUserData };
});

export const getPuzzleLeaderboard = onCall(async () => {
  const snap = await db
    .collectionGroup("progress")
    .where("puzzleTotalScore", ">", 0)
    .orderBy("puzzleTotalScore", "desc")
    .limit(50)
    .get();

  const entries = await Promise.all(
    snap.docs.map(async (doc) => {
      const uid = doc.ref.parent.parent?.id;
      let displayName = "Anonymous";
      if (uid) {
        try {
          const userRecord = await admin.auth().getUser(uid);
          displayName = userRecord.displayName || userRecord.email || "Anonymous";
        } catch (_) {
          // Account may have been deleted — keep the generic fallback.
        }
      }
      return {
        displayName,
        totalScore: doc.data().puzzleTotalScore ?? 0,
        totalCorrect: doc.data().puzzleTotalCorrect ?? 0,
      };
    })
  );

  return { entries };
});
