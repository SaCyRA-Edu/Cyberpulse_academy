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

  /// Signs out of Firebase, Google, and Facebook independently — if any one
  /// provider isn't set up (e.g. Facebook Login hasn't been configured yet)
  /// or throws for any other reason, the others still complete instead of
  /// the whole sign-out silently failing. Firebase's own sign-out (the one
  /// that actually matters for the app's auth-gated navigation) always runs
  /// first and is never blocked by the other two.
  static Future<void> signOut() async {
    // Firebase sign-out first and on its own — this is the one that
    // actually drives the app's authStateChanges-based navigation, so it
    // must not be skipped or delayed by an unrelated provider failure.
    try {
      await _auth.signOut();
    } catch (e) {
      // If even this fails, rethrow — the caller needs to know the actual
      // sign-out (not just the provider cleanup) didn't succeed.
      rethrow;
    }

    // Best-effort cleanup for the social providers — failures here (most
    // commonly Facebook, if Part 4 of FIREBASE_SETUP.md hasn't been done
    // yet) should never block the user from being signed out of the app.
    try {
      await _googleSignIn.signOut();
    } catch (_) {
      // Ignore — Google may not have been the sign-in method used, or the
      // SDK may not be fully configured on this platform.
    }
    try {
      await FacebookAuth.instance.logOut();
    } catch (_) {
      // Ignore — most commonly thrown when Facebook Login hasn't been
      // configured (AndroidManifest.xml / strings.xml from Part 4 of
      // FIREBASE_SETUP.md), which is an optional, deferred setup step.
    }
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
