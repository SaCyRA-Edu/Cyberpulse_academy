// Read-only check of the Firestore "puzzles" collection.
// Run from your functions folder: node check-puzzles.js
const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");

const serviceAccount = require("./serviceAccountKey.json");
initializeApp({ credential: cert(serviceAccount) });
const db = getFirestore();

(async () => {
  const snap = await db.collection("puzzles").get();
  const rows = snap.docs.map((d) => {
    const x = d.data();
    return {
      id: d.id,
      type: x.type,
      active: x.active === true,
      asked: x.asked === true,
      releases: x.releaseCount || 0,
      lastUsed: x.lastUsedAt ? x.lastUsedAt.toDate().toISOString().slice(0, 10) : "never",
      q: JSON.stringify(x.question || "").slice(0, 60),
    };
  });

  const active = rows.filter((r) => r.active);
  console.log(`Total: ${rows.length}   Active: ${active.length}   Not yet asked this cycle: ${active.filter((r) => !r.asked).length}`);

  console.log("\nPublishing order (newest first):");
  console.table(rows.filter((r) => r.lastUsed !== "never").sort((a, b) => b.lastUsed.localeCompare(a.lastUsed)));

  const seen = {};
  rows.forEach((r) => (seen[r.q] = (seen[r.q] || []).concat(r.id)));
  const dups = Object.entries(seen).filter(([, ids]) => ids.length > 1);
  console.log(dups.length ? "\nDuplicate questions:" : "\nNo duplicate questions.");
  dups.forEach(([q, ids]) => console.log(q, ids));
  process.exit(0);
})().catch((e) => { console.error(e); process.exit(1); });
