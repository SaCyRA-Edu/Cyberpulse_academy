import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Records that the signed-in user was just active in the app. The
/// scheduled sendInactivityReminders Cloud Function reads this
/// timestamp to decide who's gone quiet for 24+ hours and should get
/// a reminder email.
///
/// Call ONCE per app session is enough — e.g. right after the router
/// in main.dart confirms a user is signed in, or in TopicsScreen's
/// initState. No need to call this on every single screen navigation;
/// "opened the app today" is a perfectly good activity signal, doesn't
/// need to be more granular than that.
///
/// Deliberately a standalone, self-contained call (direct Firestore
/// write) rather than folded into ProgressService, so it can be added
/// without needing to touch that file's existing, more complex merge
/// logic.
class ActivityTracker {
  static Future<void> recordActivity() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('progress')
          .doc('summary')
          .set(
        {'lastActiveAt': FieldValue.serverTimestamp()},
        SetOptions(merge: true),
      );
    } catch (_) {
      // Offline or unreachable — not critical if this occasionally
      // fails to record; worst case, that session doesn't count
      // toward "recently active" and a reminder email might fire a
      // little more eagerly than ideal, which is a minor inconvenience,
      // not a functional break.
    }
  }
}
