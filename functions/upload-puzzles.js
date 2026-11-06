// upload-puzzles.js
//
// Uploads puzzles from a JSON file (written in natural, correct order
// — see puzzles-template.json) directly to Firestore, converting each
// one into the exact shape the app expects and handling the
// display-order shuffling automatically for matching/sequence types,
// so the correct answer is never accidentally visible just from
// looking at what's shown to players.
//
// Setup (same pattern as upload-images.js from earlier in this project):
//   npm install firebase-admin
//   Place your service account key JSON in this same folder as
//   serviceAccountKey.json (Firebase Console → Project Settings →
//   Service Accounts → Generate new private key)
//
// Usage:
//   node upload-puzzles.js puzzles-template.json

const admin = require("firebase-admin");
const fs = require("fs");

const serviceAccount = require("./serviceAccountKey.json");
admin.initializeApp({ credential: admin.credential.cert(serviceAccount) });
const db = admin.firestore();

function shuffle(array) {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

function convertEntry(entry) {
  switch (entry.type) {
    case "mcq":
      if (!entry.prompt || !Array.isArray(entry.options) || entry.options.length < 2 || !entry.correct) {
        throw new Error(`Invalid mcq entry (type: mcq): needs prompt, options (2+), correct`);
      }
      if (!entry.options.includes(entry.correct)) {
        throw new Error(`Invalid mcq entry (type: mcq): correct must exactly match one option`);
      }
      return {
        type: "mcq",
        question: { prompt: entry.prompt, options: entry.options },
        correctAnswer: entry.correct,
      };

    case "spotMistake":
      if (!entry.scenario || !Array.isArray(entry.flags) || entry.flags.length < 2 || !Array.isArray(entry.correctFlags) || entry.correctFlags.length < 1) {
        throw new Error(`Invalid spotMistake entry (type: spotMistake): needs scenario, flags (2+), correctFlags (1+)`);
      }
      for (const c of entry.correctFlags) {
        if (!entry.flags.includes(c)) {
          throw new Error(`Invalid spotMistake entry (type: spotMistake): correctFlags "${c}" must exactly match a flag`);
        }
      }
      return {
        type: "spotMistake",
        question: { scenario: entry.scenario, options: entry.flags },
        correctAnswer: entry.correctFlags,
      };

    case "matching":
      if (!Array.isArray(entry.pairs) || entry.pairs.length < 2) {
        throw new Error(`Invalid matching entry (type: matching): needs pairs (2+)`);
      }
      return {
        type: "matching",
        question: {
          terms: entry.pairs.map((p) => p.term),
          definitions: shuffle(entry.pairs.map((p) => p.definition)), // shuffled so display order never matches correctAnswer's pairing order
        },
        correctAnswer: entry.pairs,
      };

    case "sequence":
      if (!entry.prompt || !Array.isArray(entry.steps) || entry.steps.length < 2) {
        throw new Error(`Invalid sequence entry (type: sequence): needs prompt, steps (2+), in correct order`);
      }
      return {
        type: "sequence",
        question: { prompt: entry.prompt, items: shuffle(entry.steps) }, // shuffled for display — steps itself stays in the true correct order
        correctAnswer: entry.steps,
      };

    default:
      throw new Error(`Unknown puzzle type: ${entry.type}`);
  }
}

async function main() {
  const filePath = process.argv[2];
  if (!filePath) {
    console.error("Usage: node upload-puzzles.js <path-to-json-file>");
    process.exit(1);
  }

  const raw = fs.readFileSync(filePath, "utf8");
  const entries = JSON.parse(raw);

  console.log(`Found ${entries.length} puzzle(s) to upload.`);

  let uploaded = 0;
  for (const entry of entries) {
    try {
      const converted = convertEntry(entry);
      const docRef = await db.collection("puzzles").add({
        ...converted,
        active: true,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        createdBy: "upload-script",
      });
      console.log(`✓ Uploaded ${converted.type} → ${docRef.id}`);
      uploaded++;
    } catch (err) {
      console.error(`✗ Skipped an entry: ${err.message}`);
    }
  }

  console.log(`\nDone. ${uploaded}/${entries.length} puzzles uploaded successfully.`);
  process.exit(0);
}

main().catch((err) => {
  console.error("Script failed:", err);
  process.exit(1);
});
