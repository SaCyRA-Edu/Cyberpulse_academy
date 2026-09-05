import 'package:firebase_auth/firebase_auth.dart';

/// Thin wrapper around Firebase Auth's built-in email verification —
/// no backend of your own required, since Firebase sends the email
/// itself. This works on the free Spark plan.
class EmailVerificationService {
  static User? get _user => FirebaseAuth.instance.currentUser;

  /// Sends (or resends) the verification link to the current user's
  /// email. Throws a [FirebaseAuthException] on failure — most notably
  /// `too-many-requests` if called too frequently, which Firebase
  /// itself rate-limits without any extra code needed here.
  static Future<void> sendVerificationEmail() async {
    final user = _user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'no-current-user',
        message: 'No signed-in user to send a verification email to.',
      );
    }
    await user.sendEmailVerification();
  }

  /// Refreshes the current user's data from Firebase and returns
  /// whether their email is now verified. Call this after the user
  /// says they've clicked the link — Firebase Auth doesn't push
  /// verification status to the client automatically, so a manual
  /// reload is required to see an up-to-date value.
  static Future<bool> checkVerified() async {
    final user = _user;
    if (user == null) return false;
    await user.reload();
    return FirebaseAuth.instance.currentUser?.emailVerified ?? false;
  }

  static String? get currentUserEmail => _user?.email;
}
