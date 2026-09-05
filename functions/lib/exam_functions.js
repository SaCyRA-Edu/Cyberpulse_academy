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
exports.submitAnswer = exports.startExamAttempt = exports.verifyRazorpayPayment = exports.createRazorpayOrder = void 0;
const https_1 = require("firebase-functions/v2/https");
const admin = __importStar(require("firebase-admin"));
const v2_1 = require("firebase-functions/v2");
const params_1 = require("firebase-functions/params");
const crypto = __importStar(require("crypto"));
const razorpay_1 = __importDefault(require("razorpay"));
admin.initializeApp();
(0, v2_1.setGlobalOptions)({ maxInstances: 10 });
const db = admin.firestore();
// Stored in Cloud Secret Manager, never in plain source code — see the
// setup instructions for how to set these via `firebase functions:secrets:set`.
const RAZORPAY_KEY_ID = (0, params_1.defineSecret)("RAZORPAY_KEY_ID");
const RAZORPAY_KEY_SECRET = (0, params_1.defineSecret)("RAZORPAY_KEY_SECRET");
// Price now lives in Firestore (config/pricing, field fullAccessPricePaise)
// instead of a hardcoded constant here — change it anytime from the
// Firebase Console with no redeploy needed. This constant is only a
// fallback used if that document is somehow missing, so the purchase
// flow degrades safely instead of breaking outright.
const FALLBACK_PRICE_PAISE = 49900; // ₹499.00
const CURRENCY = "INR";
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
 * Creates a Razorpay Order for the "full access" purchase. The
 * resulting order_id is required before the Flutter app can even open
 * the Razorpay checkout — Razorpay will auto-refund any payment made
 * without a valid, matching order_id.
 */
exports.createRazorpayOrder = (0, https_1.onCall)({ secrets: [RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET] }, async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in to make a purchase.");
    }
    const razorpay = new razorpay_1.default({
        key_id: RAZORPAY_KEY_ID.value(),
        key_secret: RAZORPAY_KEY_SECRET.value(),
    });
    const amountPaise = await getFullAccessPricePaise();
    try {
        const order = await razorpay.orders.create({
            amount: amountPaise,
            currency: CURRENCY,
            // Receipt ties the order back to the user for your own records
            // in the Razorpay dashboard — not used for security, the
            // signature verification step handles that.
            receipt: `full_access_${uid}_${Date.now()}`,
            notes: { uid, product: "full_access" },
        });
        return {
            orderId: order.id,
            amount: order.amount,
            currency: order.currency,
            keyId: RAZORPAY_KEY_ID.value(), // public key — safe to send to the client
        };
    }
    catch (err) {
        throw new https_1.HttpsError("internal", `Could not create Razorpay order: ${err}`);
    }
});
/**
 * Verifies a completed payment's signature server-side before granting
 * access. This is the step that actually protects against a tampered
 * client claiming a payment succeeded when it didn't — the signature
 * can only be produced by someone who has the Key Secret, which never
 * leaves this server.
 */
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
    // Signature is valid — genuinely a real, unmodified payment
    // response from Razorpay. Grant full access, writing to the exact
    // same Firestore path ProgressService already reads from, so the
    // client picks this up automatically on its next refresh with no
    // extra client-side plumbing needed.
    await db
        .collection("users")
        .doc(uid)
        .collection("progress")
        .doc("summary")
        .set({
        fullAccessPurchased: true,
        fullAccessPurchasedAt: admin.firestore.FieldValue.serverTimestamp(),
        fullAccessPaymentId: paymentId,
        fullAccessOrderId: orderId,
    }, { merge: true });
    return { success: true };
});
const db = admin.firestore();
const TOTAL_QUESTIONS = 100;
const TIME_LIMIT_SECONDS = 120 * 60;
const PASS_THRESHOLD = 75.0;
const TIER_ORDER = ["easy", "medium", "hard"];
/**
 * Loads a lightweight index of {id, difficulty} for every question,
 * used to build the per-tier draw pools. Uses a field mask so this
 * doesn't transfer full question text/options/answers for all 262
 * questions on every exam start — just the two fields actually needed
 * here.
 */
async function loadQuestionIndex() {
    const snap = await db.collection("examQuestions").select("difficulty").get();
    const pools = { easy: [], medium: [], hard: [] };
    snap.forEach((doc) => {
        const difficulty = doc.data().difficulty;
        pools[difficulty].push(doc.id);
    });
    return pools;
}
function shuffle(arr) {
    const a = [...arr];
    for (let i = a.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
}
/**
 * Draws one question from the preferred tier's remaining pool,
 * falling back to the nearest non-empty tier if exhausted — the same
 * fallback rule the original Flutter-only engine used. Mutates the
 * pools object (removes the drawn ID) and returns null if every pool
 * is empty.
 */
async function drawQuestion(pools, preferred) {
    // NOTE: the examQuestions read below intentionally uses a plain
    // .get(), not tx.get() — it's called from inside submitAnswer's
    // transaction, but examQuestions documents are immutable reference
    // data (uploaded once by upload-exam-questions.js, never modified
    // afterward), so there's no consistency risk in reading them outside
    // strict transactional isolation. Only the mutable session state
    // (the attempt and progress documents) needs true transactional reads.
    let tier = preferred;
    if (pools[tier].length === 0) {
        const startIdx = TIER_ORDER.indexOf(preferred);
        let fallback = null;
        for (let offset = 1; offset < TIER_ORDER.length && !fallback; offset++) {
            for (const idx of [startIdx - offset, startIdx + offset]) {
                if (idx >= 0 && idx < TIER_ORDER.length && pools[TIER_ORDER[idx]].length > 0) {
                    fallback = TIER_ORDER[idx];
                    break;
                }
            }
        }
        if (!fallback)
            return null;
        tier = fallback;
    }
    const questionId = pools[tier].pop();
    const doc = await db.collection("examQuestions").doc(questionId).get();
    const data = doc.data();
    const indices = shuffle(data.options.map((_, i) => i));
    const permutation = indices; // permutation[shuffledPos] = originalIndex
    return {
        questionId,
        area: data.area,
        difficulty: data.difficulty,
        permutation,
        correctIndex: data.correctIndex,
    };
}
async function fetchQuestionPublic(questionId, permutation) {
    const doc = await db.collection("examQuestions").doc(questionId).get();
    const data = doc.data();
    return {
        questionId,
        question: data.question,
        // Reordered per the permutation, so the client never sees which
        // position was originally "correct" — there's no positional
        // pattern for a client to observe, and no answer key to extract.
        options: permutation.map((originalIdx) => data.options[originalIdx]),
    };
}
/**
 * Starts a new exam attempt: builds the tier pools, draws the first
 * (medium-tier) question, creates a session document, and returns the
 * sanitized first question. The correctIndex for every question drawn
 * during this attempt lives ONLY in this session document, which
 * clients cannot read directly (see security rules) — only this
 * function and submitAnswer, running with Admin SDK privileges, ever
 * see it.
 */
exports.startExamAttempt = (0, https_1.onCall)(async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in to start the exam.");
    }
    const pools = await loadQuestionIndex();
    for (const tier of TIER_ORDER) {
        pools[tier] = shuffle(pools[tier]);
    }
    const first = await drawQuestion(pools, "medium");
    if (!first) {
        throw new https_1.HttpsError("failed-precondition", "No exam questions are available.");
    }
    const attemptRef = db.collection("users").doc(uid).collection("examAttempts").doc();
    await attemptRef.set({
        uid,
        status: "in_progress",
        startedAt: admin.firestore.FieldValue.serverTimestamp(),
        startedAtMillis: Date.now(),
        currentTier: "medium",
        pools,
        askedQuestions: [first],
        answers: [], // parallel array — filled in as submitAnswer is called
        correctCount: 0,
        totalQuestions: TOTAL_QUESTIONS,
    });
    const publicQuestion = await fetchQuestionPublic(first.questionId, first.permutation);
    return {
        attemptId: attemptRef.id,
        totalQuestions: TOTAL_QUESTIONS,
        timeLimitSeconds: TIME_LIMIT_SECONDS,
        questionNumber: 1,
        question: publicQuestion,
    };
});
/**
 * Submits an answer for the CURRENT (most recently drawn, not yet
 * answered) question in the given attempt, grades it server-side
 * against the real answer key, adapts the difficulty tier, and either
 * returns the next question or — if this was the last question —
 * finalizes the attempt and returns the full results.
 */
exports.submitAnswer = (0, https_1.onCall)(async (request) => {
    const uid = request.auth?.uid;
    if (!uid) {
        throw new https_1.HttpsError("unauthenticated", "You must be signed in.");
    }
    const attemptId = request.data?.attemptId;
    const selectedPosition = request.data?.selectedPosition;
    if (!attemptId || selectedPosition === undefined) {
        throw new https_1.HttpsError("invalid-argument", "attemptId and selectedPosition are required.");
    }
    const attemptRef = db.collection("users").doc(uid).collection("examAttempts").doc(attemptId);
    const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
    return db.runTransaction(async (tx) => {
        // Firestore transactions require every read before any write, so
        // the progress doc is read here unconditionally — even though it's
        // only actually used if this turns out to be the final question —
        // rather than reading it later inside the completion branch.
        const snap = await tx.get(attemptRef);
        const progressSnap = await tx.get(progressRef);
        if (!snap.exists) {
            throw new https_1.HttpsError("not-found", "Exam attempt not found.");
        }
        const session = snap.data();
        if (session.status !== "in_progress") {
            throw new https_1.HttpsError("failed-precondition", "This exam attempt has already ended.");
        }
        // Server-side time enforcement — without this, nothing stops a
        // modified client from simply never calling submitAnswer until
        // it's ready, giving unlimited time despite the displayed
        // countdown. The client-side timer is purely a UX convenience;
        // this check is what actually matters.
        const elapsedSeconds = (Date.now() - session.startedAtMillis) / 1000;
        if (elapsedSeconds > TIME_LIMIT_SECONDS) {
            const percentage = ((session.correctCount || 0) / Math.max(session.answers?.length || 1, 1)) * 100;
            tx.update(attemptRef, {
                status: "completed",
                completedAt: admin.firestore.FieldValue.serverTimestamp(),
                finalPercentage: percentage,
                finalPassed: percentage >= PASS_THRESHOLD,
                endedReason: "time_expired",
            });
            recordProgress(percentage);
            throw new https_1.HttpsError("deadline-exceeded", "Time expired — this attempt has been submitted with your answers so far.");
        }
        const askedQuestions = session.askedQuestions;
        const current = askedQuestions[askedQuestions.length - 1];
        // Grade using the server-held permutation — never trusting
        // anything about correctness from the client, only which position
        // they clicked.
        const originalIndexPicked = current.permutation[selectedPosition];
        const wasCorrect = originalIndexPicked === current.correctIndex;
        const answers = [...(session.answers || []), { questionId: current.questionId, selectedPosition, wasCorrect }];
        const correctCount = (session.correctCount || 0) + (wasCorrect ? 1 : 0);
        // Adapt tier: correct -> up, wrong -> down (same rule the
        // client-only engine used).
        const tierIdx = TIER_ORDER.indexOf(session.currentTier);
        const nextTierIdx = wasCorrect
            ? Math.min(tierIdx + 1, TIER_ORDER.length - 1)
            : Math.max(tierIdx - 1, 0);
        const nextTier = TIER_ORDER[nextTierIdx];
        const examComplete = answers.length >= session.totalQuestions;
        function recordProgress(percentage) {
            const progressData = progressSnap.exists ? progressSnap.data() : {};
            const existingBest = progressData.finalExamScore ?? 0;
            const newBest = percentage > existingBest ? percentage : existingBest;
            const existingHistory = progressData.finalExamHistory ?? [];
            const newHistory = [
                { score: percentage, date: new Date().toISOString() },
                ...existingHistory,
            ];
            tx.set(progressRef, { finalExamScore: newBest, finalExamHistory: newHistory }, { merge: true });
        }
        if (examComplete) {
            const percentage = (correctCount / answers.length) * 100;
            const passed = percentage >= PASS_THRESHOLD;
            // Per-area breakdown from the questions actually asked this attempt.
            const areaTotals = {};
            for (let i = 0; i < askedQuestions.length; i++) {
                const area = askedQuestions[i].area;
                areaTotals[area] = areaTotals[area] || { correct: 0, total: 0 };
                areaTotals[area].total++;
                if (answers[i]?.wasCorrect)
                    areaTotals[area].correct++;
            }
            tx.update(attemptRef, {
                status: "completed",
                answers,
                correctCount,
                completedAt: admin.firestore.FieldValue.serverTimestamp(),
                finalPercentage: percentage,
                finalPassed: passed,
                areaBreakdown: areaTotals,
            });
            // Record the attempt in the same place ProgressService already
            // reads from, so history/best-score tracking keeps working
            // unchanged on the client — same "keep the highest score,
            // prepend to history" logic markFinalExamAttempt used to do
            // client-side, now done server-side where it can't be spoofed.
            recordProgress(percentage);
            return {
                examComplete: true,
                wasCorrect,
                finalPercentage: percentage,
                finalPassed: passed,
                correctCount,
                totalQuestions: answers.length,
                areaBreakdown: Object.entries(areaTotals).map(([area, v]) => ({
                    area,
                    correct: v.correct,
                    total: v.total,
                })),
            };
        }
        // Not complete — draw the next question.
        const pools = session.pools;
        const next = await drawQuestion(pools, nextTier);
        if (!next) {
            // Pool genuinely exhausted before reaching totalQuestions — end
            // the attempt early rather than error.
            const percentage = (correctCount / answers.length) * 100;
            tx.update(attemptRef, {
                status: "completed",
                answers,
                correctCount,
                completedAt: admin.firestore.FieldValue.serverTimestamp(),
                finalPercentage: percentage,
                finalPassed: percentage >= PASS_THRESHOLD,
            });
            recordProgress(percentage);
            return {
                examComplete: true,
                wasCorrect,
                finalPercentage: percentage,
                finalPassed: percentage >= PASS_THRESHOLD,
                correctCount,
                totalQuestions: answers.length,
                areaBreakdown: [],
            };
        }
        tx.update(attemptRef, {
            askedQuestions: [...askedQuestions, next],
            answers,
            correctCount,
            currentTier: nextTier,
            pools,
        });
        const publicQuestion = await fetchQuestionPublic(next.questionId, next.permutation);
        return {
            examComplete: false,
            wasCorrect,
            questionNumber: answers.length + 1,
            question: publicQuestion,
        };
    });
});
//# sourceMappingURL=exam_functions.js.map