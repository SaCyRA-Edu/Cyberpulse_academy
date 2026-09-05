import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Whether the signed-in user can start another exam attempt for free,
/// or needs to purchase retake access first. Deliberately reads
/// Firestore directly rather than going through ProgressService, so
/// this doesn't depend on that file's exact internal structure — the
/// two fields it reads (finalExamHistory, retakeUnlocked, isAdmin) are
/// the same ones the server-side startExamAttempt check already
/// enforces authoritatively; this is only a client-side pre-check for
/// a faster, friendlier UX (showing the retake paywall immediately
/// instead of letting the exam screen open and then fail).
class RetakeEligibility {
  static const freeAttemptLimit = 3; // 1 initial + 2 free retakes

  static Future<bool> canStartFreeAttempt() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return false;

    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.data()?['isAdmin'] == true) return true;

      final progressDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).collection('progress').doc('summary').get();
      final data = progressDoc.data() ?? {};

      if (data['retakeUnlocked'] == true) return true;

      final history = List<dynamic>.from(data['finalExamHistory'] as List? ?? []);
      return history.length < freeAttemptLimit;
    } catch (_) {
      // If this check itself fails (offline, etc.), don't block the
      // user client-side — the server-side check in startExamAttempt
      // is the real, authoritative gate either way.
      return true;
    }
  }
}
