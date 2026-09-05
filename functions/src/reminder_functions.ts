import { onSchedule } from "firebase-functions/v2/scheduler";
import { defineSecret } from "firebase-functions/params";
import * as admin from "firebase-admin";
import * as nodemailer from "nodemailer";

// NOTE: if admin.initializeApp() already exists elsewhere in your
// functions/src/index.ts (it does, from the Razorpay/exam work),
// remove this line when merging this file in — calling it twice
// throws.
// admin.initializeApp();

const db = admin.firestore();

// Gmail App Password for sacyra.edu@gmail.com — NOT the account's
// normal login password. Generate one at myaccount.google.com under
// Security > 2-Step Verification > App Passwords (requires 2-Step
// Verification to be enabled on that account first). Store it via:
//   firebase functions:secrets:set GMAIL_APP_PASSWORD
const GMAIL_APP_PASSWORD = defineSecret("GMAIL_APP_PASSWORD");
const SENDER_EMAIL = "sacyra.edu@gmail.com";

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
  { schedule: "every 24 hours", secrets: [GMAIL_APP_PASSWORD] },
  async () => {
    const transporter = nodemailer.createTransport({
      service: "gmail",
      auth: { user: SENDER_EMAIL, pass: GMAIL_APP_PASSWORD.value() },
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
        await doc.ref.set({ lastReminderSentAt: admin.firestore.FieldValue.serverTimestamp() }, { merge: true });
        sent++;
      } catch (err) {
        console.error(`Failed to email ${userRecord.email}:`, err);
        failed++;
      }
    }

    console.log(`Inactivity reminders: ${sent} sent, ${skipped} skipped, ${failed} failed.`);
  }
);
