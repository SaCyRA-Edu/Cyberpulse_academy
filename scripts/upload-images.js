/**
 * upload-images.js
 *
 * One-time migration script: uploads every image under assets/images/
 * to Firebase Storage, using the EXACT SAME relative path as the
 * Storage object key (e.g. local assets/images/fundamentals/cia_triad.jpg
 * uploads to Storage path assets/images/fundamentals/cia_triad.jpg).
 *
 * This is deliberate — it means every `assetPath: 'assets/images/...'`
 * string already sitting in your 21 *_lessons.dart chapter files can be
 * reused as-is to reference the Storage object, with ZERO changes
 * needed to any of those content files. Only the widget that actually
 * renders images (diagrams.dart) needs to change how it interprets
 * that string — from "load this as a bundled Flutter asset" to "fetch
 * this from Storage" — everything else stays exactly the same.
 *
 * USAGE:
 *   1. npm install firebase-admin
 *   2. Authenticate locally (pick ONE):
 *        a) gcloud auth application-default login
 *           (requires the Google Cloud CLI — see cloud.google.com/sdk)
 *        b) OR download a service account key from Firebase Console →
 *           Project Settings → Service Accounts → Generate new private
 *           key, save it as service-account-key.json next to this
 *           script, and uncomment the credential line below.
 *   3. Update BUCKET_NAME below to your actual Storage bucket name
 *      (Firebase Console → Storage → shows it at the top, usually
 *      something like your-project-id.firebasestorage.app).
 *   4. node upload-images.js
 *
 * Safe to re-run — it overwrites existing objects at the same path
 * rather than erroring, so you can run it again after adding new
 * images later without needing to track what's already uploaded.
 */

const admin = require("firebase-admin");
const path = require("path");
const fs = require("fs");

// ── Configuration — update these two lines ──────────────────────────
const BUCKET_NAME = "cybersecurity-pulse-9841d.firebasestorage.app";
const LOCAL_IMAGES_ROOT = path.join(__dirname, "..", "assets", "images");
// ──────────────────────────────────────────────────────────────────

admin.initializeApp({
  credential: admin.credential.cert(require("./service-account-key.json")),
  storageBucket: BUCKET_NAME,
});

const bucket = admin.storage().bucket();

function walkDirectory(dir) {
  const results = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      results.push(...walkDirectory(fullPath));
    } else if (/\.(jpe?g|png|webp)$/i.test(entry.name)) {
      results.push(fullPath);
    }
  }
  return results;
}

async function main() {
  if (!fs.existsSync(LOCAL_IMAGES_ROOT)) {
    console.error(`Could not find ${LOCAL_IMAGES_ROOT} — check LOCAL_IMAGES_ROOT is correct.`);
    process.exit(1);
  }

  const files = walkDirectory(LOCAL_IMAGES_ROOT);
  console.log(`Found ${files.length} images to upload.\n`);

  const projectRoot = path.join(__dirname, "..");
  let uploaded = 0;
  let failed = 0;

  for (const localFilePath of files) {
    // Storage path mirrors the path relative to the project root, e.g.
    // "assets/images/fundamentals/cia_triad.jpg" — matching exactly
    // what's already hardcoded as assetPath in your Dart lesson files.
    const storagePath = path.relative(projectRoot, localFilePath).replace(/\\/g, "/");

    try {
      await bucket.upload(localFilePath, {
        destination: storagePath,
        metadata: {
          cacheControl: "public, max-age=31536000", // 1 year — images are static, never change in place
        },
      });
      uploaded++;
      if (uploaded % 25 === 0) {
        console.log(`  ...${uploaded}/${files.length} uploaded`);
      }
    } catch (err) {
      failed++;
      console.error(`FAILED: ${storagePath} — ${err.message}`);
    }
  }

  console.log(`\nDone. ${uploaded} uploaded, ${failed} failed.`);
  if (failed > 0) {
    console.log("Re-run this script to retry failed uploads — it's safe to re-run.");
  }
}

main().catch((err) => {
  console.error("Script failed:", err);
  process.exit(1);
});
