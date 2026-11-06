// Read-only: prints full text of suspected duplicate puzzles and whether they match.
// Run from the functions folder: node show-dupes.js
const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
initializeApp({ credential: cert(require("./serviceAccountKey.json")) });
const db = getFirestore();

const groups = {
  "Four people accessed a sensitive document": ["0jbgQe7QQeWtSb4K758F", "PcSVRKVvlnqU11epRyAS", "iSayGgxEk3sByT966P0A"],
  "At 09:00 suspicious email": ["4kZWMqPMCOH6g6m6FkJq", "O81tE08jWc0sL29HpJTp", "zHmMg26PYJXFjNePtLu2"],
  "Three IT administrators": ["AWNtMQ9rAZXpzTz25RVP", "gQgF9xJDxwe9QPQCE5j0"],
  "Contractor three-month project": ["NiisxtG20f0Be0qdNt2i", "vGPoe0jlC0pHr040kw53"],
};

(async () => {
  for (const [title, ids] of Object.entries(groups)) {
    console.log("\n==== " + title + " ====");
    const texts = [];
    for (const id of ids) {
      const d = await db.collection("puzzles").doc(id).get();
      const x = d.data() || {};
      const q = JSON.stringify(x.question);
      const a = JSON.stringify(x.correctAnswer);
      texts.push(q + "|" + a);
      const used = x.lastUsedAt ? x.lastUsedAt.toDate().toISOString().slice(0, 10) : "never published";
      console.log(`\n[${id}] active=${x.active} asked=${x.asked === true} lastUsed=${used}\nQ: ${q}\nA: ${a}`);
    }
    console.log("\n=> " + (new Set(texts).size === 1 ? "IDENTICAL (true duplicates)" : "DIFFERENT text (variants, compare above)"));
  }
  process.exit(0);
})().catch((e) => { console.error(e); process.exit(1); });
