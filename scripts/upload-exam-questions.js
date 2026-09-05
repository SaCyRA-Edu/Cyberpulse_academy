/**
 * upload-exam-questions.js
 *
 * One-time migration script: uploads all 262 exam questions (with their
 * correct answers) into a Firestore collection that ONLY Cloud Functions
 * can read — never the client app directly. This is the foundation of
 * Option B: since clients can never fetch this collection themselves
 * (see the security rules below), the answer key genuinely never
 * reaches a device, closing the "decompile the APK to see every
 * answer" risk that existed when questions were compiled into the app.
 *
 * USAGE:
 *   1. npm install firebase-admin
 *   2. Put service-account-key.json in this folder (same one used for
 *      the image upload script earlier)
 *   3. node upload-exam-questions.js
 *
 * Safe to re-run — each question gets a stable, deterministic document
 * ID derived from its position in the source file, so re-running
 * overwrites rather than duplicates.
 */

const admin = require("firebase-admin");
const fs = require("fs");
const path = require("path");

admin.initializeApp({
  credential: admin.credential.cert(require("./service-account-key.json")),
});

const db = admin.firestore();

async function main() {
  const dataPath = path.join(__dirname, "exam_questions_export.json");
  const questions = JSON.parse(fs.readFileSync(dataPath, "utf8"));
  console.log(`Uploading ${questions.length} questions...`);

  const collection = db.collection("examQuestions");
  let batch = db.batch();
  let opsInBatch = 0;
  let uploaded = 0;

  for (let i = 0; i < questions.length; i++) {
    const q = questions[i];
    const docId = `q${String(i).padStart(4, "0")}`; // q0000, q0001, ...
    const docRef = collection.doc(docId);

    batch.set(docRef, {
      question: q.question,
      options: q.options,
      correctIndex: q.correctIndex,
      explanation: q.explanation,
      area: q.area,
      difficulty: q.difficulty,
    });

    opsInBatch++;
    uploaded++;

    // Firestore batches cap at 500 operations — flush before hitting that.
    if (opsInBatch >= 400) {
      await batch.commit();
      batch = db.batch();
      opsInBatch = 0;
      console.log(`  ...${uploaded}/${questions.length} uploaded`);
    }
  }

  if (opsInBatch > 0) {
    await batch.commit();
  }

  console.log(`\nDone. ${uploaded} questions uploaded to examQuestions/.`);
}

main().catch((err) => {
  console.error("Script failed:", err);
  process.exit(1);
});
