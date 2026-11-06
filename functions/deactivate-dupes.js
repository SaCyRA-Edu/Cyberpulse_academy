// Sets active:false on two near-duplicate puzzles so they are never published again.
//   node deactivate-dupes.js          -> preview only
//   node deactivate-dupes.js --apply  -> write
const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
initializeApp({ credential: cert(require("./serviceAccountKey.json")) });
const db = getFirestore();
const apply = process.argv.includes("--apply");
const ids = ["AWNtMQ9rAZXpzTz25RVP", "vGPoe0jlC0pHr040kw53"];
(async () => {
  for (const id of ids) {
    const ref = db.collection("puzzles").doc(id);
    const d = await ref.get();
    if (!d.exists) { console.log(id, "not found"); continue; }
    console.log(id, "| currently active =", d.data().active, "|", JSON.stringify(d.data().question).slice(0, 70));
    if (apply) await ref.update({ active: false });
  }
  console.log(apply ? "Deactivated." : "Preview only. Re-run with --apply to write.");
  process.exit(0);
})().catch((e) => { console.error(e); process.exit(1); });
