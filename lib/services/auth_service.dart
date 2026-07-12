import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

/// Wraps Firebase Authentication with Google, Facebook, and Email/Password
/// sign-in, giving the rest of the app one simple, consistent API regardless
/// of which method a learner actually used to sign in.
class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  /// Emits the current user (or null when signed out) every time auth
  /// state changes — used by main.dart to decide which screen to show.
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  static User? get currentUser => _auth.currentUser;

  // ── Email / Password ──────────────────────────────────────────────────

  static Future<UserCredential> registerWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user?.updateDisplayName(displayName);
    await credential.user?.reload();
    return credential;
  }

  static Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  // ── Google ───────────────────────────────────────────────────────────

  static Future<UserCredential?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null; // user cancelled the picker

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return _auth.signInWithCredential(credential);
  }

  // ── Facebook ─────────────────────────────────────────────────────────

  static Future<UserCredential?> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);
    if (result.status != LoginStatus.success || result.accessToken == null) {
      return null; // user cancelled, or Facebook denied the request
    }
    final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
    return _auth.signInWithCredential(credential);
  }

  // ── Sign out ─────────────────────────────────────────────────────────

  static Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
      FacebookAuth.instance.logOut(),
    ]);
  }

  /// Turns Firebase's error codes into short, human-readable messages —
  /// FirebaseAuthException.message is often too technical to show directly.
  static String friendlyError(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'email-already-in-use':
          return 'An account already exists with that email. Try signing in instead.';
        case 'invalid-email':
          return 'That email address doesn\'t look valid.';
        case 'weak-password':
          return 'Please choose a stronger password (at least 6 characters).';
        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-credential':
          return 'Incorrect email or password.';
        case 'too-many-requests':
          return 'Too many attempts. Please wait a moment and try again.';
        case 'network-request-failed':
          return 'Network error — check your connection and try again.';
        default:
          return error.message ?? 'Something went wrong. Please try again.';
      }
    }
    return 'Something went wrong. Please try again.';
  }
}
