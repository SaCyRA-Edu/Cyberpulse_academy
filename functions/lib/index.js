"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.cybersecurityChat = exports.getPuzzleLeaderboard = exports.getAdminReport = exports.submitPuzzleAnswer = exports.createPuzzle = exports.publishDailyPuzzle = exports.getTodaysPuzzle = exports.onPodcastReportCreated = exports.sendInactivityReminders = exports.submitExam = exports.startExamAttempt = exports.verifyWebRazorpayPayment = exports.createWebRazorpayOrder = exports.verifyRazorpayPayment = exports.createRazorpayOrder = void 0;
const https_1 = require("firebase-functions/v2/https");
const https_2 = require("firebase-functions/v2/https");
// onCallGenkit only exists in newer firebase-functions versions —
// confirmed absent in 6.0.1, present in 7.4.0. This project's
// package.json will need firebase-functions bumped to at least the
// version that introduces it before this deploys successfully.
const v2_1 = require("firebase-functions/v2");
const params_1 = require("firebase-functions/params");
const admin = __importStar(require("firebase-admin"));
const firestore_1 = require("firebase-admin/firestore");
const crypto = __importStar(require("crypto"));
const razorpay_1 = __importDefault(require("razorpay"));
const nodemailer = __importStar(require("nodemailer"));
const genkit_1 = require("genkit");
const googleai_1 = require("@genkit-ai/googleai");
admin.initializeApp();
(0, v2_1.setGlobalOptions)({ maxInstances: 10 });
const db = admin.firestore();
const RAZORPAY_KEY_ID = (0, params_1.defineSecret)("RAZORPAY_KEY_ID");
const RAZORPAY_KEY_SECRET = (0, params_1.defineSecret)("RAZORPAY_KEY_SECRET");
// Moved up from further down in the file (originally declared next to
// sendInactivityReminders) — verifyWebRazorpayPayment needs these too,
// and top-level const declarations are evaluated in file order, so
// referencing them before this point would throw "used before
// initialization" at module load time, not just at call time.
//
// Set once via:
//   firebase functions:secrets:set GMAIL_OAUTH_CLIENT_ID
//   firebase functions:secrets:set GMAIL_OAUTH_CLIENT_SECRET
//   firebase functions:secrets:set GMAIL_OAUTH_REFRESH_TOKEN
const GEMINI_API_KEY = (0, params_1.defineSecret)("GEMINI_API_KEY");
const GMAIL_OAUTH_CLIENT_ID = (0, params_1.defineSecret)("GMAIL_OAUTH_CLIENT_ID");
const GMAIL_OAUTH_CLIENT_SECRET = (0, params_1.defineSecret)("GMAIL_OAUTH_CLIENT_SECRET");
const GMAIL_OAUTH_REFRESH_TOKEN = (0, params_1.defineSecret)("GMAIL_OAUTH_REFRESH_TOKEN");
const SENDER_EMAIL = "sacyra.edu@sacyra.com";
const FALLBACK_PRICE_PAISE = 49900; // ₹499.00
const CURRENCY = "INR";
// Free attempts before a retake purchase is required: 1 initial attempt
// + 2 free retakes = 3 total free attempts. The 4th attempt (the "3rd
// retake") requires purchasing retake access.
const FREE_ATTEMPT_LIMIT = 3;
async function getFullAccessPricePaise() {
    try {
        const doc = await db.collection("config").doc("pricing").get();
        const price = doc.data()?.fullAccessPricePaise;
        if (typeof price === "number" && price > 0) {
            return price;
        }
    }
    catch (_) {
        // fall through to the fallback below
    }
    return FALLBACK_PRICE_PAISE;
}
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
exports.createRazorpayOrder = (0, https_1.onCall)({ secrets: [RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET] }, async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in to make a purchase.");
    }
    const productType = request.data?.productType ?? "full_access";
    if (productType !== "full_access" && productType !== "retake") {
        throw new https_1.HttpsError("invalid-argument", "Invalid product type.");
    }
    const razorpay = new razorpay_1.default({
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
            createdAt: firestore_1.FieldValue.serverTimestamp(),
        });
        return {
            orderId: order.id,
            amount: order.amount,
            currency: order.currency,
            keyId: RAZORPAY_KEY_ID.value(),
        };
    }
    catch (err) {
        throw new https_1.HttpsError("internal", `Could not create Razorpay order: ${err}`);
    }
});
exports.verifyRazorpayPayment = (0, https_1.onCall)({ secrets: [RAZORPAY_KEY_SECRET] }, async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in to verify a payment.");
    }
    const orderId = request.data?.razorpay_order_id;
    const paymentId = request.data?.razorpay_payment_id;
    const signature = request.data?.razorpay_signature;
    if (!orderId || !paymentId || !signature) {
        throw new https_1.HttpsError("invalid-argument", "Missing payment verification fields.");
    }
    const expectedSignature = crypto
        .createHmac("sha256", RAZORPAY_KEY_SECRET.value())
        .update(`${orderId}|${paymentId}`)
        .digest("hex");
    if (expectedSignature !== signature) {
        throw new https_1.HttpsError("permission-denied", "Payment signature verification failed — this payment cannot be trusted.");
    }
    // Look up what this order was actually FOR — never trust a
    // client-supplied product type here.
    const pendingOrderDoc = await db.collection("pendingOrders").doc(orderId).get();
    if (!pendingOrderDoc.exists) {
        throw new https_1.HttpsError("not-found", "No matching order record found for this payment.");
    }
    const pendingOrder = pendingOrderDoc.data();
    if (pendingOrder.uid !== uid) {
        throw new https_1.HttpsError("permission-denied", "This order does not belong to your account.");
    }
    const productType = pendingOrder.productType;
    const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
    const updateData = productType === "retake"
        ? {
            retakeUnlocked: true,
            retakeUnlockedAt: firestore_1.FieldValue.serverTimestamp(),
            retakePaymentId: paymentId,
        }
        : {
            fullAccessPurchased: true,
            fullAccessPurchasedAt: firestore_1.FieldValue.serverTimestamp(),
            fullAccessPaymentId: paymentId,
            fullAccessOrderId: orderId,
        };
    await progressRef.set(updateData, { merge: true });
    await pendingOrderDoc.ref.delete(); // no longer needed once redeemed
    return { success: true, productType };
});
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
exports.createWebRazorpayOrder = (0, https_1.onRequest)({ secrets: [RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET], cors: ALLOWED_WEB_ORIGINS }, async (req, res) => {
    if (req.method !== "POST") {
        res.status(405).json({ error: "Method not allowed." });
        return;
    }
    const email = req.body?.email?.trim().toLowerCase();
    if (!email || !email.includes("@")) {
        res.status(400).json({ error: "A valid email is required." });
        return;
    }
    // Which product this web checkout is for — defaults to full_access so
    // the existing purchase page keeps working unchanged. "retake" is the
    // half-price exam-retake unlock, bought from /purchase?product=retake.
    const productType = (req.body?.productType ?? "full_access");
    if (productType !== "full_access" && productType !== "retake") {
        res.status(400).json({ error: "Invalid product type." });
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
    }
    catch (_) {
        res.status(404).json({
            error: "No app account found with this email. Please create an account in the app first, using this same email, then try again.",
        });
        return;
    }
    // Don't let someone pay twice for the same unlock.
    if (productType === "retake") {
        const progressSnap = await db.collection("users").doc(userRecord.uid).collection("progress").doc("summary").get();
        if (progressSnap.data()?.retakeUnlocked === true) {
            res.status(409).json({ error: "Exam retakes are already unlocked on this account. Open the app and tap \"Already purchased? Refresh access\"." });
            return;
        }
    }
    const razorpay = new razorpay_1.default({
        key_id: RAZORPAY_KEY_ID.value(),
        key_secret: RAZORPAY_KEY_SECRET.value(),
    });
    const basePrice = await getFullAccessPricePaise();
    // Same rule as the in-app createRazorpayOrder: a retake is 50% of the
    // current full-access price.
    const amountPaise = productType === "retake" ? Math.round(basePrice / 2) : basePrice;
    try {
        const order = await razorpay.orders.create({
            amount: amountPaise,
            currency: CURRENCY,
            receipt: `web_${productType}_${Date.now()}`,
            notes: { email, product: productType, source: "web" },
        });
        // Recorded by email instead of uid, since there's no
        // authenticated session on the website to get a uid from.
        await db.collection("pendingOrders").doc(order.id).set({
            email,
            productType,
            source: "web",
            createdAt: firestore_1.FieldValue.serverTimestamp(),
        });
        res.status(200).json({
            orderId: order.id,
            amount: order.amount,
            currency: order.currency,
            keyId: RAZORPAY_KEY_ID.value(),
            productType,
            // Sent back so the page can show "this will unlock access for
            // [name]" before payment — a chance to catch a typo that
            // happens to match a DIFFERENT real account, which the
            // existence check above can't catch on its own (the email is
            // valid, it's just not the one the payer actually meant).
            accountDisplayName: userRecord.displayName || null,
        });
    }
    catch (err) {
        res.status(500).json({ error: `Could not create order: ${err}` });
    }
});
exports.verifyWebRazorpayPayment = (0, https_1.onRequest)({ secrets: [RAZORPAY_KEY_SECRET, GMAIL_OAUTH_CLIENT_ID, GMAIL_OAUTH_CLIENT_SECRET, GMAIL_OAUTH_REFRESH_TOKEN], cors: ALLOWED_WEB_ORIGINS }, async (req, res) => {
    if (req.method !== "POST") {
        res.status(405).json({ error: "Method not allowed." });
        return;
    }
    const orderId = req.body?.razorpay_order_id;
    const paymentId = req.body?.razorpay_payment_id;
    const signature = req.body?.razorpay_signature;
    const email = req.body?.email?.trim().toLowerCase();
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
    const pendingOrder = pendingOrderDoc.data();
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
    }
    catch (_) {
        res.status(404).json({
            error: "No app account found with this email. Please create an account in the app first, then try again.",
        });
        return;
    }
    // What this order was actually FOR comes from the server-side
    // pendingOrders record (older orders without the field are full access).
    const productType = pendingOrder.productType ?? "full_access";
    const progressRef = db.collection("users").doc(userRecord.uid).collection("progress").doc("summary");
    await progressRef.set(productType === "retake"
        ? {
            retakeUnlocked: true,
            retakeUnlockedAt: firestore_1.FieldValue.serverTimestamp(),
            retakePaymentId: paymentId,
            retakeOrderId: orderId,
        }
        : {
            fullAccessPurchased: true,
            fullAccessPurchasedAt: firestore_1.FieldValue.serverTimestamp(),
            fullAccessPaymentId: paymentId,
            fullAccessOrderId: orderId,
        }, { merge: true });
    await pendingOrderDoc.ref.delete();
    const purchaseDate = new Date().toLocaleString("en-IN", {
        dateStyle: "long",
        timeStyle: "short",
        timeZone: "Asia/Kolkata",
    });
    // Best-effort: send a receipt email. Wrapped separately from the
    // purchase recording above — a failure sending this email must
    // never undo or block the actual purchase, which has already
    // succeeded by this point.
    try {
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
        await transporter.sendMail({
            from: `"CyberPulse Academy" <${SENDER_EMAIL}>`,
            to: email,
            subject: productType === "retake"
                ? "Your CyberPulse Academy exam retake purchase — receipt"
                : "Your CyberPulse Academy Full Access purchase — receipt",
            text: `${productType === "retake"
                ? "Thank you for unlocking exam retakes on CyberPulse Academy!"
                : "Thank you for purchasing Full Access to CyberPulse Academy!"}

Order ID: ${orderId}
Payment ID: ${paymentId}
Date: ${purchaseDate}

${productType === "retake"
                ? "Unlimited exam retakes are now active"
                : "Full Access is now active"} on your account (${email}) — open the app
and tap "Refresh access" if it doesn't unlock automatically.

Keep this email as your receipt for this purchase.

Questions? Reply to this email or reach us at sacyra.edu@sacyra.com.`,
        });
    }
    catch (err) {
        console.error(`verifyWebRazorpayPayment: failed to send receipt email: ${err}`);
    }
    res.status(200).json({ success: true, orderId, paymentId, purchaseDate, productType });
});
// ═══════════════════════════════════════════════════════════════════════
// Final exam — batch model with a retake limit.
// ═══════════════════════════════════════════════════════════════════════
// TEMPORARY FOR TESTING — set back to 100 once confirmed working.
const TOTAL_QUESTIONS = 100;
const TIME_LIMIT_SECONDS = 120 * 60;
const PASS_THRESHOLD = 75.0;
function shuffle(arr) {
    const a = [...arr];
    for (let i = a.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
}
exports.startExamAttempt = (0, https_1.onCall)(async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in to start the exam.");
    }
    // Retake limit check — an admin account bypasses this entirely, same
    // as it bypasses the chapter/full-access gates on the client.
    const userDoc = await db.collection("users").doc(uid).get();
    const isAdmin = userDoc.data()?.isAdmin === true;
    const progressDoc = await db.collection("users").doc(uid).collection("progress").doc("summary").get();
    const progressData = progressDoc.exists ? progressDoc.data() : {};
    const attemptsSoFar = (progressData.finalExamHistory ?? []).length;
    const retakeUnlocked = progressData.retakeUnlocked === true;
    if (!isAdmin && !retakeUnlocked && attemptsSoFar >= FREE_ATTEMPT_LIMIT) {
        throw new https_1.HttpsError("resource-exhausted", "retake_limit_reached" // client matches on this exact message to show the retake paywall
        );
    }
    const allDocs = await db.collection("examQuestions").get();
    const allIds = allDocs.docs.map((d) => d.id);
    if (allIds.length === 0) {
        throw new https_1.HttpsError("failed-precondition", "No exam questions are available.");
    }
    const selectedIds = shuffle(allIds).slice(0, Math.min(TOTAL_QUESTIONS, allIds.length));
    const questionsById = new Map(allDocs.docs.map((d) => [d.id, d.data()]));
    const sessionQuestions = selectedIds.map((id) => {
        const data = questionsById.get(id);
        const permutation = shuffle(data.options.map((_, i) => i));
        return { questionId: id, area: data.area, permutation, correctIndex: data.correctIndex };
    });
    const attemptRef = db.collection("users").doc(uid).collection("examAttempts").doc();
    await attemptRef.set({
        uid,
        status: "in_progress",
        startedAt: firestore_1.FieldValue.serverTimestamp(),
        startedAtMillis: Date.now(),
        questions: sessionQuestions,
        totalQuestions: sessionQuestions.length,
    });
    const publicQuestions = sessionQuestions.map((sq) => ({
        questionId: sq.questionId,
        question: questionsById.get(sq.questionId).question,
        options: sq.permutation.map((originalIdx) => questionsById.get(sq.questionId).options[originalIdx]),
    }));
    return {
        attemptId: attemptRef.id,
        timeLimitSeconds: TIME_LIMIT_SECONDS,
        questions: publicQuestions,
    };
});
exports.submitExam = (0, https_1.onCall)(async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in.");
    }
    const attemptId = request.data?.attemptId;
    const answers = request.data?.answers;
    if (!attemptId || !answers) {
        throw new https_1.HttpsError("invalid-argument", "attemptId and answers are required.");
    }
    const attemptRef = db.collection("users").doc(uid).collection("examAttempts").doc(attemptId);
    const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
    return db.runTransaction(async (tx) => {
        const snap = await tx.get(attemptRef);
        const progressSnap = await tx.get(progressRef);
        if (!snap.exists) {
            throw new https_1.HttpsError("not-found", "Exam attempt not found.");
        }
        const session = snap.data();
        if (session.status !== "in_progress") {
            throw new https_1.HttpsError("failed-precondition", "This exam attempt has already been submitted.");
        }
        const questions = session.questions;
        // Server-side enforcement that every question was actually
        // answered — the client already blocks submission for this, but
        // that's a UX convenience, not security; a modified client could
        // skip that check, so it's enforced here too.
        const unanswered = questions.filter((q) => answers[q.questionId] === undefined);
        if (unanswered.length > 0) {
            throw new https_1.HttpsError("failed-precondition", `${unanswered.length} question(s) are unanswered. All questions must be answered before submitting.`);
        }
        let correctCount = 0;
        const areaTotals = {};
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
            completedAt: firestore_1.FieldValue.serverTimestamp(),
            correctCount,
            finalPercentage: percentage,
            finalPassed: passed,
            areaBreakdown: areaTotals,
        });
        const progressData = progressSnap.exists ? progressSnap.data() : {};
        const existingBest = progressData.finalExamScore ?? 0;
        const newBest = percentage > existingBest ? percentage : existingBest;
        const existingHistory = progressData.finalExamHistory ?? [];
        const newHistory = [{ score: percentage, date: new Date().toISOString() }, ...existingHistory];
        // retakeUnlocked is intentionally NOT reset here — once purchased,
        // it stays true permanently, so a single retake purchase unlocks
        // unlimited future attempts rather than needing to be bought again
        // after every single retake.
        tx.set(progressRef, { finalExamScore: newBest, finalExamHistory: newHistory }, { merge: true });
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
const scheduler_1 = require("firebase-functions/v2/scheduler");
const firestore_2 = require("firebase-functions/v2/firestore");
// admin.initializeApp(), const db, nodemailer, and the GMAIL_OAUTH_*
// secrets + SENDER_EMAIL are already declared once, at the top of
// this file (moved there so verifyWebRazorpayPayment could use them
// too) — deliberately not redeclared here.
// Gmail App Password for sacyra.edu@gmail.com — NOT the account's
// normal login password. Generate one at myaccount.google.com under
// Security > 2-Step Verification > App Passwords (requires 2-Step
// Verification to be enabled on that account first). Store it via:
// Google Workspace accounts no longer support App Password-based SMTP
// auth (Google discontinued this for Workspace in May 2025 - personal
// Gmail accounts still support it, Workspace accounts require OAuth2).
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
exports.sendInactivityReminders = (0, scheduler_1.onSchedule)({ schedule: "every 24 hours", secrets: [GMAIL_OAUTH_CLIENT_ID, GMAIL_OAUTH_CLIENT_SECRET, GMAIL_OAUTH_REFRESH_TOKEN] }, async () => {
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
        if (doc.id !== "summary")
            continue; // collectionGroup on "progress" only, filter to the summary doc
        const uid = doc.ref.parent.parent?.id;
        if (!uid)
            continue;
        const data = doc.data();
        // Already passed — nothing "pending" to remind them about.
        const bestScore = data.finalExamScore ?? 0;
        if (bestScore >= 75) {
            skipped++;
            continue;
        }
        const lastActiveAtMillis = data.lastActiveAt?.toMillis();
        const lastReminderSentAtMillis = data.lastReminderSentAt?.toMillis();
        let userRecord;
        try {
            userRecord = await admin.auth().getUser(uid);
        }
        catch (_) {
            skipped++; // account deleted or otherwise unreachable
            continue;
        }
        if (!userRecord.email) {
            skipped++;
            continue;
        }
        let isEligible;
        let reasonNeverStarted;
        if (lastActiveAtMillis === undefined) {
            // Never recorded any activity at all — check account age
            // instead, since there's no lastActiveAt to compare against.
            const createdAtMillis = new Date(userRecord.metadata.creationTime).getTime();
            isEligible = now - createdAtMillis > INACTIVITY_THRESHOLD_MS;
            reasonNeverStarted = true;
        }
        else {
            isEligible = now - lastActiveAtMillis > INACTIVITY_THRESHOLD_MS;
            reasonNeverStarted = false;
        }
        // Don't re-send while they remain continuously inactive — only
        // eligible again if a reminder was never sent, or was sent
        // before their last recorded activity (meaning they came back
        // and then went quiet again since).
        const alreadyRemindedForThisPeriod = lastReminderSentAtMillis !== undefined &&
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
            await doc.ref.set({ lastReminderSentAt: firestore_1.FieldValue.serverTimestamp() }, { merge: true });
            sent++;
        }
        catch (err) {
            console.error(`Failed to email ${userRecord.email}:`, err);
            failed++;
        }
    }
    console.log(`Inactivity reminders: ${sent} sent, ${skipped} skipped, ${failed} failed.`);
});
/**
 * Fires automatically whenever a new document is created in
 * podcastReports (i.e. whenever a user submits the in-app "Report this
 * episode" form) and emails the details to sacyra.edu@sacyra.com, so
 * reports get noticed without needing to check Firestore Console
 * manually. Uses the same Gmail OAuth2 transporter as
 * sendInactivityReminders above — same secrets, same sender.
 */
exports.onPodcastReportCreated = (0, firestore_2.onDocumentCreated)({
    document: "podcastReports/{reportId}",
    region: "us-central1", // matches every other function and the Firestore database's actual location — deploying without this defaulted to asia-south1, a region mismatch that could keep the trigger from firing reliably
    secrets: [GMAIL_OAUTH_CLIENT_ID, GMAIL_OAUTH_CLIENT_SECRET, GMAIL_OAUTH_REFRESH_TOKEN],
}, async (event) => {
    const report = event.data?.data();
    if (!report) {
        console.log("onPodcastReportCreated: no data on the created document, skipping.");
        return;
    }
    // Look up the reporter's email for a more useful notification —
    // the report itself only stores their uid. Best-effort: if the
    // account was somehow deleted since, fall back to showing the uid
    // instead of failing the whole notification.
    let reporterEmail = report.uid;
    try {
        const userRecord = await admin.auth().getUser(report.uid);
        reporterEmail = userRecord.email || report.uid;
    }
    catch (_) {
        // Account no longer exists or lookup failed — uid fallback above is fine.
    }
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
    const subject = `Podcast report: ${report.episodeTitle || "Unknown episode"}`;
    const bodyText = `A podcast episode was reported.

Episode: ${report.episodeTitle || "Unknown"}
Audio path: ${report.audioStoragePath || "Unknown"}
Reason: ${report.reason || "Not specified"}
Details: ${report.details || "(none provided)"}
Reported by: ${reporterEmail}

View all reports in Firestore Console under the podcastReports collection.`;
    try {
        await transporter.sendMail({
            from: `"CyberPulse Academy" <${SENDER_EMAIL}>`,
            to: SENDER_EMAIL,
            subject,
            text: bodyText,
        });
        console.log(`onPodcastReportCreated: notification email sent for report ${event.params.reportId}.`);
    }
    catch (err) {
        console.error(`onPodcastReportCreated: failed to send notification email: ${err}`);
    }
});
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
exports.getTodaysPuzzle = (0, https_1.onCall)(async () => {
    const activeSnap = await db.collection("puzzles").where("active", "==", true).get();
    if (activeSnap.empty)
        return { available: false };
    let todaysPuzzle = null;
    let mostRecentAt = 0;
    for (const doc of activeSnap.docs) {
        const usedAt = doc.data().lastUsedAt?.toMillis() ?? 0;
        if (usedAt > mostRecentAt) {
            mostRecentAt = usedAt;
            todaysPuzzle = doc;
        }
    }
    if (!todaysPuzzle)
        return { available: false };
    const data = todaysPuzzle.data();
    return {
        available: true,
        type: data.type,
        question: data.question, // display data only - never correctAnswer
    };
});
exports.publishDailyPuzzle = (0, scheduler_1.onSchedule)({ schedule: "0 9 * * *", timeZone: "Asia/Kolkata" }, async () => {
    const activeSnap = await db.collection("puzzles").where("active", "==", true).get();
    if (activeSnap.empty) {
        console.log("publishDailyPuzzle: no active puzzles, skipping today.");
        return;
    }
    // Find whichever puzzle was used most recently (yesterday's pick,
    // under normal daily operation) so it can be explicitly excluded.
    let mostRecentDoc = null;
    let mostRecentAt = 0;
    for (const doc of activeSnap.docs) {
        const usedAt = doc.data().lastUsedAt?.toMillis() ?? 0;
        if (usedAt > mostRecentAt) {
            mostRecentAt = usedAt;
            mostRecentDoc = doc;
        }
    }
    // "asked" flag: every puzzle that has been published is marked
    // asked:true (see the set() below), and only puzzles NOT yet asked
    // are eligible. When every active puzzle has been asked once, a new
    // cycle starts: all flags are cleared and the pick is random again
    // (still never yesterday's puzzle, unless it is the only one).
    let pool = activeSnap.docs.filter((doc) => doc.data().asked !== true && doc.id !== mostRecentDoc?.id);
    if (pool.length === 0) {
        const unasked = activeSnap.docs.filter((doc) => doc.data().asked !== true);
        if (unasked.length > 0) {
            pool = unasked; // the only unasked puzzle is yesterday's: better to repeat once than publish nothing
        }
        else {
            const resetBatch = db.batch();
            for (const doc of activeSnap.docs)
                resetBatch.update(doc.ref, { asked: false });
            await resetBatch.commit();
            const fresh = activeSnap.docs.filter((doc) => doc.id !== mostRecentDoc?.id);
            pool = fresh.length > 0 ? fresh : activeSnap.docs;
            console.log("publishDailyPuzzle: every puzzle has been asked, starting a new cycle.");
        }
    }
    const chosen = pool[Math.floor(Math.random() * pool.length)];
    await chosen.ref.set({
        lastUsedAt: firestore_1.FieldValue.serverTimestamp(),
        releaseCount: firestore_1.FieldValue.increment(1),
        correctCountToday: 0,
        asked: true,
    }, { merge: true });
    // Best-effort: notify everyone subscribed to the daily_puzzle topic
    // (subscribed client-side in puzzle_screen.dart when a user opts in).
    // Wrapped separately from the puzzle-selection logic above so a
    // notification-sending failure never prevents the actual puzzle
    // publish from completing — the notification is a convenience on
    // top of that, not a dependency of it.
    try {
        await admin.messaging().send({
            topic: "daily_puzzle",
            notification: {
                title: "Today's puzzle is live!",
                body: "A new cybersecurity puzzle just dropped — test yourself and climb the leaderboard.",
            },
        });
        console.log("publishDailyPuzzle: notification sent to daily_puzzle topic.");
    }
    catch (err) {
        console.error(`publishDailyPuzzle: failed to send notification: ${err}`);
    }
    console.log(`publishDailyPuzzle: published puzzle ${chosen.id} (type: ${chosen.data().type}).`);
});
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
function checkPuzzleAnswer(puzzleType, correctData, submitted) {
    switch (puzzleType) {
        case "mcq": {
            // correctData: string (the correct option text)
            // submitted: string
            const correct = correctData?.trim().toLowerCase();
            const answer = submitted?.trim().toLowerCase();
            return !!correct && correct === answer;
        }
        case "spotMistake": {
            // correctData: string[] (the correct flag texts, order doesn't matter)
            // submitted: string[] (the flags the user selected)
            if (!Array.isArray(correctData) || !Array.isArray(submitted))
                return false;
            const normalize = (arr) => arr.map((s) => String(s).trim().toLowerCase()).sort();
            const correctSet = normalize(correctData);
            const submittedSet = normalize(submitted);
            return (correctSet.length === submittedSet.length &&
                correctSet.every((val, i) => val === submittedSet[i]));
        }
        case "matching": {
            // correctData: { term: string, definition: string }[]
            // submitted: same shape - every pair must match, order doesn't matter
            if (!Array.isArray(correctData) || !Array.isArray(submitted))
                return false;
            if (correctData.length !== submitted.length)
                return false;
            const normalizePair = (p) => `${String(p?.term ?? "").trim().toLowerCase()}|${String(p?.definition ?? "").trim().toLowerCase()}`;
            const correctSet = new Set(correctData.map(normalizePair));
            const submittedSet = new Set(submitted.map(normalizePair));
            if (correctSet.size !== submittedSet.size)
                return false;
            for (const pair of correctSet)
                if (!submittedSet.has(pair))
                    return false;
            return true;
        }
        case "sequence": {
            // correctData: string[] (the items in correct order)
            // submitted: string[] (the order the user arranged them in) -
            // order DOES matter here, unlike the other array-based types
            if (!Array.isArray(correctData) || !Array.isArray(submitted))
                return false;
            if (correctData.length !== submitted.length)
                return false;
            return correctData.every((val, i) => String(val).trim().toLowerCase() === String(submitted[i]).trim().toLowerCase());
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
exports.createPuzzle = (0, https_1.onCall)(async (request) => {
    const uid = request.auth?.uid;
    if (!uid)
        throw new https_1.HttpsError("unauthenticated", "Sign in required.");
    const callerDoc = await db.collection("users").doc(uid).get();
    if (callerDoc.data()?.isAdmin !== true) {
        throw new https_1.HttpsError("permission-denied", "Admin access required.");
    }
    const { type, question, correctAnswer } = request.data ?? {};
    const validTypes = ["mcq", "spotMistake", "matching", "sequence"];
    if (!validTypes.includes(type)) {
        throw new https_1.HttpsError("invalid-argument", `type must be one of: ${validTypes.join(", ")}`);
    }
    if (!question) {
        throw new https_1.HttpsError("invalid-argument", "question is required.");
    }
    if (correctAnswer === undefined || correctAnswer === null) {
        throw new https_1.HttpsError("invalid-argument", "correctAnswer is required.");
    }
    const docRef = await db.collection("puzzles").add({
        type,
        question, // shape depends on type - see PUZZLE_SCHEMA notes above submitPuzzleAnswer
        correctAnswer, // shape depends on type - never sent to clients (see getTodaysPuzzle)
        active: true,
        createdAt: firestore_1.FieldValue.serverTimestamp(),
        createdBy: uid,
    });
    return { puzzleId: docRef.id };
});
exports.submitPuzzleAnswer = (0, https_1.onCall)(async (request) => {
    const uid = request.auth?.uid;
    if (!uid)
        throw new https_1.HttpsError("unauthenticated", "Sign in required.");
    // Free opt-in gate: the puzzle is visible to everyone, but only
    // users who've opted in can actually submit an answer. Checked here
    // server-side too — a greyed-out button on the client is a UX
    // signal, not a real enforcement, since someone could otherwise call
    // this function directly.
    const progressCheckRef = db.collection("users").doc(uid).collection("progress").doc("summary");
    const progressCheckSnap = await progressCheckRef.get();
    if (progressCheckSnap.data()?.puzzleSubscribed !== true) {
        throw new https_1.HttpsError("permission-denied", "Opt in to the puzzle game to submit an answer.");
    }
    // "answer" can be a string (mcq) or an array/object (the other
    // three types) - shape depends on today's puzzle type, checked below.
    const submittedAnswer = request.data?.answer;
    if (submittedAnswer === undefined || submittedAnswer === null) {
        throw new https_1.HttpsError("invalid-argument", "Missing answer.");
    }
    const activeSnap = await db.collection("puzzles").where("active", "==", true).get();
    if (activeSnap.empty)
        throw new https_1.HttpsError("failed-precondition", "No puzzle is available right now.");
    let todaysPuzzle = null;
    let mostRecentAt = 0;
    for (const doc of activeSnap.docs) {
        const usedAt = doc.data().lastUsedAt?.toMillis() ?? 0;
        if (usedAt > mostRecentAt) {
            mostRecentAt = usedAt;
            todaysPuzzle = doc;
        }
    }
    if (!todaysPuzzle)
        throw new https_1.HttpsError("failed-precondition", "No puzzle is available right now.");
    const puzzleData = todaysPuzzle.data();
    const puzzleType = puzzleData.type;
    const isCorrect = checkPuzzleAnswer(puzzleType, puzzleData.correctAnswer, submittedAnswer);
    const todayKey = new Date().toLocaleDateString("en-CA", { timeZone: "Asia/Kolkata" }); // YYYY-MM-DD
    const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
    const puzzleRef = todaysPuzzle.ref;
    const result = await db.runTransaction(async (tx) => {
        const progressSnap = await tx.get(progressRef);
        const lastAttemptDate = progressSnap.data()?.puzzleLastAttemptDate;
        if (lastAttemptDate === todayKey) {
            throw new https_1.HttpsError("already-exists", "You've already attempted today's puzzle.");
        }
        let pointsEarned = 0;
        let wasBonus = false;
        if (isCorrect) {
            const freshPuzzle = await tx.get(puzzleRef);
            const currentCorrectCount = freshPuzzle.data()?.correctCountToday ?? 0;
            const newCorrectCount = currentCorrectCount + 1;
            wasBonus = newCorrectCount <= PUZZLE_BONUS_THRESHOLD;
            pointsEarned = wasBonus ? PUZZLE_BONUS_POINTS : PUZZLE_STANDARD_POINTS;
            tx.set(puzzleRef, { correctCountToday: newCorrectCount }, { merge: true });
        }
        tx.set(progressRef, {
            puzzleLastAttemptDate: todayKey,
            puzzleTotalScore: firestore_1.FieldValue.increment(pointsEarned),
            puzzleTotalCorrect: firestore_1.FieldValue.increment(isCorrect ? 1 : 0),
        }, { merge: true });
        return { correct: isCorrect, pointsEarned, wasBonus, correctAnswer: puzzleData.correctAnswer };
    });
    return result;
});
/**
 * Returns the top N users by cumulative puzzle score, for the
 * leaderboard screen. Reads across the same progress/summary docs
 * used everywhere else — no dedicated leaderboard collection to keep
 * in sync.
 */
exports.getAdminReport = (0, https_1.onCall)(async (request) => {
    const uid = request.auth?.uid;
    if (!uid)
        throw new https_1.HttpsError("unauthenticated", "Sign in required.");
    const callerDoc = await db.collection("users").doc(uid).get();
    if (callerDoc.data()?.isAdmin !== true) {
        throw new https_1.HttpsError("permission-denied", "Admin access required.");
    }
    // Fetch every registered user via the Auth Admin SDK (paginated —
    // listUsers returns at most 1000 per page, so this loops until
    // there's no pageToken left). This is the source of truth for
    // registration counts/dates, separate from Firestore progress data.
    const authUsers = [];
    let pageToken = undefined;
    do {
        const result = await admin.auth().listUsers(1000, pageToken);
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
    const perUserData = await Promise.all(authUsers.map(async (u) => {
        const progressDoc = await db.collection("users").doc(u.uid).collection("progress").doc("summary").get();
        const data = progressDoc.data();
        const viewedLessonsCount = Array.isArray(data?.viewedLessons) ? data.viewedLessons.length : 0;
        const finalExamHistory = Array.isArray(data?.finalExamHistory) ? data.finalExamHistory : [];
        const certificationCompleted = finalExamHistory.some((attempt) => (attempt?.score ?? 0) >= 75);
        const fullAccessPurchased = data?.fullAccessPurchased === true;
        return {
            createdAt: u.createdAt,
            viewedLessonsCount,
            certificationCompleted,
            fullAccessPurchased,
        };
    }));
    return { totalUsers: authUsers.length, users: perUserData };
});
exports.getPuzzleLeaderboard = (0, https_1.onCall)(async () => {
    const snap = await db
        .collectionGroup("progress")
        .where("puzzleTotalScore", ">", 0)
        .orderBy("puzzleTotalScore", "desc")
        .limit(50)
        .get();
    const entries = await Promise.all(snap.docs.map(async (doc) => {
        const uid = doc.ref.parent.parent?.id;
        let displayName = "Anonymous";
        if (uid) {
            try {
                const userRecord = await admin.auth().getUser(uid);
                displayName = userRecord.displayName || userRecord.email || "Anonymous";
            }
            catch (_) {
                // Account may have been deleted — keep the generic fallback.
            }
        }
        return {
            displayName,
            totalScore: doc.data().puzzleTotalScore ?? 0,
            totalCorrect: doc.data().puzzleTotalCorrect ?? 0,
        };
    }));
    return { entries };
});
// ═══════════════════════════════════════════════════════════════════════
// Cybersecurity Chatbot — floating in-app assistant, powered by Gemini
// via Genkit. Scoped specifically to cybersecurity topics, both for
// user experience (this is a cybersecurity learning app, not a general
// chatbot) and for Google Play policy compliance: Play's 2025
// generative-AI policy makes the developer responsible for preventing
// offensive/off-topic generation, not just relying on the model
// provider's own default safety filtering.
//
// Rate limiting: 5 questions/day for accounts without Full Access,
// unlimited for Full Access — same "free taste, paid unlocks more"
// pattern as the rest of the app (Chapter 1 free, 3-minute podcast
// preview, etc.), and it bounds cost exposure on free accounts since
// each question is a real, billed Gemini API call.
//
// Chat history: saved to users/{uid}/chatMessages, so conversations
// persist across sessions rather than resetting each time the app
// reopens.
// ═══════════════════════════════════════════════════════════════════════
const ai = (0, genkit_1.genkit)({
    plugins: [(0, googleai_1.googleAI)()],
    // This was the actual root cause of every chatbot request failing
    // with a 500 — generate() has no built-in default and throws
    // INVALID_ARGUMENT without one explicitly set. gemini-2.5-flash
    // (originally set based on docs available at the time) turned out
    // to already be deprecated for new users by the time this actually
    // ran — Google's own API error response explicitly named
    // gemini-3.8-flash as its replacement, which is what's used here.
    // Worth knowing: model names in this space move fast enough that
    // whatever's current when this comment was written may itself be
    // outdated later — if this error recurs with a different suggested
    // model name, that's the one to switch to.
    model: googleai_1.googleAI.model("gemini-3.8-flash"),
});
const FREE_DAILY_QUESTION_LIMIT = 3;
const FULL_ACCESS_WINDOW_QUESTION_LIMIT = 10;
const CHAT_HISTORY_CONTEXT_MESSAGES = 10; // how many recent messages to send back to Gemini for context, keeping each request bounded in size/cost
// ─── Reference-link support ──────────────────────────────────────────────
// Every title here must exactly match a Module.title in levels_data.dart
// (Core Curriculum + Bonus Chapters) or a Lesson.title in
// soc_fundamentals_data.dart. Kept as plain string lists here rather than
// imported from the Flutter app (different language/repo) — if a chapter
// or SOC lesson is ever renamed on the client, this list needs updating
// to match, or that title simply won't be recognized as referenceable
// below (falls back to no reference link, never a broken one).
const READ_THROUGH_CHAPTER_TITLES = [
    "Chapter 1: Cybersecurity Fundamentals",
    "Chapter 2: Threats, Attacks & Vulnerabilities",
    "Chapter 3: Network Security",
    "Chapter 4: Identity Access Management",
    "Chapter 5: Cryptography",
    "Chapter 6: Secure Protocols",
    "Chapter 7: Endpoint Security",
    "Chapter 8: Identity Federation & SSO",
    "Chapter 9: Application Security",
    "Chapter 10: Cloud Security",
    "Chapter 11: Security Operations",
    "Chapter 12: Incident Response",
    "Chapter 13: Governance, Risk & Compliance",
    "Social Engineering",
    "Malware",
    "Vulnerabilities and Threats",
    "Alerts and Monitoring",
    "Email Security",
    "Windows Security",
    "Linux Security",
    "Capstone: Applied Defense",
];
const SOC_FUNDAMENTALS_LESSON_TITLES = [
    "What a SOC Actually Is",
    "The Investigation Workflow",
    "Classifying Incident Severity",
    "Documentation Discipline",
    "Root Cause Analysis",
    "Communicating an Incident",
];
// The tag the model is asked to emit on its own final line when a reply
// clearly maps to one specific chapter/lesson — parsed and stripped out
// server-side below, never shown to the user as raw text. A plain text
// tag (rather than Genkit's structured `output: {schema}` mode) was the
// simpler, more robust choice here: it degrades gracefully (worst case
// the model omits it and no reference is shown) instead of a
// malformed-JSON failure mode.
const REFERENCE_TAG_REGEX = /\n?\[\[REF:(CHAPTER|SOC)\|([^\]]+)\]\]\s*$/;
const CYBERSECURITY_CHATBOT_SYSTEM_PROMPT = `You are the in-app assistant for CyberPulse Academy, a cybersecurity
learning app. You ONLY answer questions related to cybersecurity,
information security, and directly related topics (networking
security, privacy, safe online practices, IT security careers and
certifications, and questions about this app's own course content).

If a user asks something unrelated to cybersecurity, politely decline
and redirect them back to cybersecurity topics — do not answer general
knowledge questions, generate creative writing, write code unrelated to
security, or engage with requests for harmful, offensive, or
inappropriate content of any kind, even if framed as hypothetical or
educational.

Keep answers clear, accurate, and appropriately concise for a mobile
chat interface — a few short paragraphs at most unless the user asks
for more depth. When relevant, connect answers back to concepts covered
in CyberPulse Academy's own course content.

REFERENCING COURSE CONTENT:
This app has two curricula you can point users to — the Read Through
course (13 core chapters plus bonus chapters) and the SOC Fundamentals
lessons (part of "The Pulse" module). Their exact titles are:

Read Through chapters:
${READ_THROUGH_CHAPTER_TITLES.map((t) => `- ${t}`).join("\n")}

SOC Fundamentals lessons:
${SOC_FUNDAMENTALS_LESSON_TITLES.map((t) => `- ${t}`).join("\n")}

Whenever your answer touches a topic covered by one of these chapters
or lessons, end your entire reply with a final line in exactly this
format (nothing else on that line), choosing the SINGLE closest match
even if it is not a perfect one (for example, a question about phishing
maps to "Social Engineering"; passwords or MFA map to "Chapter 4:
Identity Access Management"):
[[REF:CHAPTER|<exact title from the list above>]]
or
[[REF:SOC|<exact title from the list above>]]

Rules for this tag: always include it for cybersecurity concept
questions that relate to course content. Omit it only for greetings,
off-topic refusals, or questions with no relation to any listed title.
Never invent a title that isn't in the lists above. Never include more
than one tag. Never mention or explain the tag to the user — it is
stripped out before they see your reply.`;
const cybersecurityChatFlow = ai.defineFlow({
    name: "cybersecurityChatFlow",
    inputSchema: genkit_1.z.object({ message: genkit_1.z.string().min(1).max(2000) }),
    outputSchema: genkit_1.z.object({
        reply: genkit_1.z.string(),
        referenceType: genkit_1.z.enum(["chapter", "soc"]).nullable(),
        referenceLabel: genkit_1.z.string().nullable(),
    }),
}, async (input, { context }) => {
    // context.auth is populated by onCallGenkit from the caller's
    // Firebase Auth token — see firebase-functions' Genkit
    // authentication docs. If this ever comes back undefined, the
    // authPolicy below should already have rejected the call before
    // reaching here.
    const uid = context?.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in to use the chatbot.");
    }
    // Manual kill-switch for one specific account, set via Firebase
    // Console the same way isAdmin is — chatDisabled: true on the
    // root users/{uid} document. Lets a single misusing account be
    // cut off from just this feature without banning them from the
    // rest of the app.
    const userDoc = await db.collection("users").doc(uid).get();
    if (userDoc.data()?.chatDisabled === true) {
        throw new https_1.HttpsError("permission-denied", "The chatbot is currently unavailable for this account.");
    }
    const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
    const progressSnap = await progressRef.get();
    const progressData = progressSnap.data() ?? {};
    const hasFullAccess = progressData.fullAccessPurchased === true;
    // Rate limit check — both tiers are capped, just at different
    // limits and window lengths, since even Full Access questions are
    // a genuine, real cost per call. Only CHECKED here — the actual
    // increment happens later, only after a successful reply.
    // Incrementing unconditionally here was a real bug caught earlier:
    // every failed attempt silently consumed a question from the
    // user's quota despite them never actually getting an answer.
    //
    // Free tier: a calendar-day window (YYYY-MM-DD, UTC), same
    // mechanism as before, just a lower limit.
    //
    // Full Access: a fixed 6-hour window (00:00/06:00/12:00/18:00
    // UTC) rather than a rolling one — identified by a
    // "YYYY-MM-DD_Q<0-3>" string, so the count simply resets whenever
    // that identifier no longer matches the stored one, the same
    // reset-by-comparison approach as the daily window, just at finer
    // granularity.
    const now = new Date();
    const today = now.toISOString().slice(0, 10); // YYYY-MM-DD, UTC
    const currentWindowId = `${today}_Q${Math.floor(now.getUTCHours() / 6)}`;
    let currentCount;
    let limit;
    let exhaustedMessage;
    if (hasFullAccess) {
        const storedWindowId = progressData.chatQuestionsWindowId;
        const storedCount = progressData.chatQuestionsInWindow ?? 0;
        currentCount = storedWindowId === currentWindowId ? storedCount : 0;
        limit = FULL_ACCESS_WINDOW_QUESTION_LIMIT;
        exhaustedMessage = `You've reached the limit of ${FULL_ACCESS_WINDOW_QUESTION_LIMIT} questions for this period. This resets every 6 hours — please try again shortly.`;
    }
    else {
        const storedDate = progressData.chatQuestionsResetDate;
        const storedCount = progressData.chatQuestionsToday ?? 0;
        currentCount = storedDate === today ? storedCount : 0;
        limit = FREE_DAILY_QUESTION_LIMIT;
        exhaustedMessage = `You've reached today's limit of ${FREE_DAILY_QUESTION_LIMIT} questions. Unlock Full Access for a higher limit, or try again tomorrow.`;
    }
    if (currentCount >= limit) {
        throw new https_1.HttpsError("resource-exhausted", exhaustedMessage);
    }
    const chatMessagesRef = db.collection("users").doc(uid).collection("chatMessages");
    // Pull recent history for context, oldest-first, bounded so the
    // request sent to Gemini stays a reasonable, predictable size.
    const historySnap = await chatMessagesRef
        .orderBy("timestamp", "desc")
        .limit(CHAT_HISTORY_CONTEXT_MESSAGES)
        .get();
    let history = historySnap.docs
        .map((doc) => doc.data())
        .reverse()
        .map((m) => ({
        role: m.role === "model" ? "model" : "user",
        content: [{ text: m.text }],
    }));
    // Gemini requires chat history to start with a "user" turn. Each
    // exchange saves a user+model pair together, but limiting to the
    // last N messages by count can land mid-pair once there's enough
    // history — cutting off a user message while its paired model
    // reply survives the limit, leaving that orphaned model message
    // first. That orphaned reply can't be used without its own
    // question anyway, so just drop it.
    if (history.length > 0 && history[0].role === "model") {
        history = history.slice(1);
    }
    const result = await ai.generate({
        system: CYBERSECURITY_CHATBOT_SYSTEM_PROMPT,
        messages: history,
        prompt: input.message,
        // Explicit, strict safety thresholds — a second layer beyond
        // the system prompt alone, since prompt instructions can
        // sometimes be worked around with clever phrasing. Set to the
        // strictest common threshold (blocking even low-probability
        // harmful content) rather than relying on whatever the API's
        // own defaults happen to be.
        config: {
            safetySettings: [
                { category: "HARM_CATEGORY_HARASSMENT", threshold: "BLOCK_LOW_AND_ABOVE" },
                { category: "HARM_CATEGORY_HATE_SPEECH", threshold: "BLOCK_LOW_AND_ABOVE" },
                { category: "HARM_CATEGORY_SEXUALLY_EXPLICIT", threshold: "BLOCK_LOW_AND_ABOVE" },
                { category: "HARM_CATEGORY_DANGEROUS_CONTENT", threshold: "BLOCK_LOW_AND_ABOVE" },
            ],
        },
    });
    // If the safety settings above blocked the response, result.text
    // comes back empty rather than throwing — handle this explicitly
    // so the user sees a clear message instead of a blank reply.
    const rawReply = result.text.trim().length > 0
        ? result.text
        : "I'm not able to help with that request. Please ask a cybersecurity-related question instead.";
    // Pull the optional [[REF:CHAPTER|...]] / [[REF:SOC|...]] tag off
    // the end of the reply, if present, and validate it against the
    // known title lists above before trusting it — the model could in
    // principle hallucinate a title that isn't real, or malform the
    // tag, and this must never surface a broken reference link to the
    // user. Falls back to no reference at all rather than a bad one.
    let reply = rawReply;
    let referenceType = null;
    let referenceLabel = null;
    console.log(`cybersecurityChatFlow: raw reply tail: ${JSON.stringify(rawReply.slice(-160))}`);
    const tagMatch = rawReply.match(REFERENCE_TAG_REGEX);
    if (tagMatch) {
        const [, rawType, rawLabel] = tagMatch;
        const label = rawLabel.trim();
        const isValidChapter = rawType === "CHAPTER" && READ_THROUGH_CHAPTER_TITLES.includes(label);
        const isValidSoc = rawType === "SOC" && SOC_FUNDAMENTALS_LESSON_TITLES.includes(label);
        if (isValidChapter || isValidSoc) {
            referenceType = isValidChapter ? "chapter" : "soc";
            referenceLabel = label;
        }
        // Strip the tag regardless of whether it validated — it should
        // never be shown to the user as raw text, even when it didn't
        // match a real title.
        reply = rawReply.slice(0, tagMatch.index).trimEnd();
    }
    // Only now, after a genuine successful reply, count this against
    // the relevant limit — a failed attempt above never reaches this
    // line at all, so it never consumes the user's quota.
    if (hasFullAccess) {
        await progressRef.set({ chatQuestionsInWindow: currentCount + 1, chatQuestionsWindowId: currentWindowId }, { merge: true });
    }
    else {
        await progressRef.set({ chatQuestionsToday: currentCount + 1, chatQuestionsResetDate: today }, { merge: true });
    }
    // Save both sides of this exchange — best-effort in the sense
    // that a save failure shouldn't hide a reply the user already
    // received, but genuinely worth knowing about if it happens.
    const batch = db.batch();
    batch.set(chatMessagesRef.doc(), { role: "user", text: input.message, timestamp: firestore_1.FieldValue.serverTimestamp() });
    batch.set(chatMessagesRef.doc(), {
        role: "model",
        text: reply,
        referenceType,
        referenceLabel,
        timestamp: firestore_1.FieldValue.serverTimestamp(),
    });
    try {
        await batch.commit();
    }
    catch (err) {
        console.error(`cybersecurityChatFlow: failed to save chat history for ${uid}: ${err}`);
    }
    return { reply, referenceType, referenceLabel };
});
exports.cybersecurityChat = (0, https_2.onCallGenkit)({
    secrets: [GEMINI_API_KEY],
    // Requires a signed-in user — matches every other sensitive
    // function in this file. Genkit's Firebase auth helpers also
    // support requiring specific claims (e.g. hasClaim("email_verified"))
    // if stricter gating is wanted later.
    authPolicy: (auth) => auth !== undefined,
}, cybersecurityChatFlow);
//# sourceMappingURL=index.js.map