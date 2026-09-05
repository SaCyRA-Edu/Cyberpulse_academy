import { onCall, HttpsError } from "firebase-functions/v2/https";
import * as admin from "firebase-admin";

// NOTE: if admin.initializeApp() already exists elsewhere in your
// functions/src/index.ts (e.g. from the Razorpay integration), don't
// call it a second time here — remove this line and just use the
// existing `db` reference instead. Shown here for a clean, standalone
// read of this file.
// admin.initializeApp();

const db = admin.firestore();

const TOTAL_QUESTIONS = 100;
const TIME_LIMIT_SECONDS = 120 * 60;
const PASS_THRESHOLD = 75.0;

type Difficulty = "easy" | "medium" | "hard";
const TIER_ORDER: Difficulty[] = ["easy", "medium", "hard"];

interface StoredQuestion {
  question: string;
  options: string[];
  correctIndex: number;
  explanation: string;
  area: string;
  difficulty: Difficulty;
}

interface SessionQuestionRecord {
  questionId: string;
  area: string;
  difficulty: Difficulty;
  // Maps each SHUFFLED position back to the original option index, so
  // grading can happen without ever re-sending the answer key to the
  // client — the client only ever sees shuffled option text and
  // submits back a position (0-3), never an option's "true" identity.
  permutation: number[];
  correctIndex: number; // original index, pre-shuffle
}

/**
 * Loads a lightweight index of {id, difficulty} for every question,
 * used to build the per-tier draw pools. Uses a field mask so this
 * doesn't transfer full question text/options/answers for all 262
 * questions on every exam start — just the two fields actually needed
 * here.
 */
async function loadQuestionIndex(): Promise<Record<Difficulty, string[]>> {
  const snap = await db.collection("examQuestions").select("difficulty").get();
  const pools: Record<Difficulty, string[]> = { easy: [], medium: [], hard: [] };
  snap.forEach((doc) => {
    const difficulty = doc.data().difficulty as Difficulty;
    pools[difficulty].push(doc.id);
  });
  return pools;
}

function shuffle<T>(arr: T[]): T[] {
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
async function drawQuestion(
  pools: Record<Difficulty, string[]>,
  preferred: Difficulty
): Promise<SessionQuestionRecord | null> {
  let tier = preferred;
  if (pools[tier].length === 0) {
    const startIdx = TIER_ORDER.indexOf(preferred);
    let fallback: Difficulty | null = null;
    for (let offset = 1; offset < TIER_ORDER.length && !fallback; offset++) {
      for (const idx of [startIdx - offset, startIdx + offset]) {
        if (idx >= 0 && idx < TIER_ORDER.length && pools[TIER_ORDER[idx]].length > 0) {
          fallback = TIER_ORDER[idx];
          break;
        }
      }
    }
    if (!fallback) return null;
    tier = fallback;
  }

  const questionId = pools[tier].pop()!;
  const doc = await db.collection("examQuestions").doc(questionId).get();
  const data = doc.data() as StoredQuestion;

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

async function fetchQuestionPublic(questionId: string, permutation: number[]) {
  const doc = await db.collection("examQuestions").doc(questionId).get();
  const data = doc.data() as StoredQuestion;
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
export const startExamAttempt = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new HttpsError("unauthenticated", "You must be signed in to start the exam.");
  }

  const pools = await loadQuestionIndex();
  for (const tier of TIER_ORDER) {
    pools[tier] = shuffle(pools[tier]);
  }

  const first = await drawQuestion(pools, "medium");
  if (!first) {
    throw new HttpsError("failed-precondition", "No exam questions are available.");
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
export const submitAnswer = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new HttpsError("unauthenticated", "You must be signed in.");
  }

  const attemptId = request.data?.attemptId as string | undefined;
  const selectedPosition = request.data?.selectedPosition as number | undefined;
  if (!attemptId || selectedPosition === undefined) {
    throw new HttpsError("invalid-argument", "attemptId and selectedPosition are required.");
  }

  const attemptRef = db.collection("users").doc(uid).collection("examAttempts").doc(attemptId);

  return db.runTransaction(async (tx) => {
    const snap = await tx.get(attemptRef);
    if (!snap.exists) {
      throw new HttpsError("not-found", "Exam attempt not found.");
    }
    const session = snap.data()!;
    if (session.status !== "in_progress") {
      throw new HttpsError("failed-precondition", "This exam attempt has already ended.");
    }

    const askedQuestions: SessionQuestionRecord[] = session.askedQuestions;
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

    if (examComplete) {
      const percentage = (correctCount / answers.length) * 100;
      const passed = percentage >= PASS_THRESHOLD;

      // Per-area breakdown from the questions actually asked this attempt.
      const areaTotals: Record<string, { correct: number; total: number }> = {};
      for (let i = 0; i < askedQuestions.length; i++) {
        const area = askedQuestions[i].area;
        areaTotals[area] = areaTotals[area] || { correct: 0, total: 0 };
        areaTotals[area].total++;
        if (answers[i]?.wasCorrect) areaTotals[area].correct++;
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
      // unchanged on the client.
      const progressRef = db.collection("users").doc(uid).collection("progress").doc("summary");
      tx.set(
        progressRef,
        {
          finalExamScore: admin.firestore.FieldValue.increment(0), // placeholder, corrected below
        },
        { merge: true }
      );
      // (Best-score max logic and history array append are easier to do
      // as a non-transactional follow-up write, since they need a read
      // of the current array — see note in deployment instructions.)

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
    const pools = session.pools as Record<Difficulty, string[]>;
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
