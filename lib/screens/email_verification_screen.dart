import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/email_verification_service.dart';

/// Shown right after account creation, asking the user to click the
/// verification link Firebase just emailed them. Push this immediately
/// after createUserWithEmailAndPassword succeeds — see the integration
/// notes at the bottom of this file for exactly where that call goes.
class EmailVerificationScreen extends StatefulWidget {
  /// Called once verification is confirmed (either via the automatic
  /// background check or the user tapping "I've verified my email").
  /// This screen does not navigate on its own — the caller decides what
  /// "done" means for their specific signup flow.
  final VoidCallback onVerified;

  const EmailVerificationScreen({super.key, required this.onVerified});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  static const _navy = Color(0xFF0D1B3E);
  static const _blue = Color(0xFF1565C0);
  static const _resendCooldownSeconds = 60;

  bool _checking = false;
  bool _resending = false;
  String? _error;
  int _cooldownRemaining = 0;
  Timer? _cooldownTimer;
  Timer? _autoPollTimer;
  bool _verifiedAndHandled = false;

  @override
  void initState() {
    super.initState();
    _sendInitialEmail();
    // Poll quietly in the background every few seconds, so a user who
    // clicks the link and returns to the app doesn't have to remember
    // to tap "I've verified" themselves — nice UX, but the manual
    // button below remains as a reliable fallback either way.
    _autoPollTimer = Timer.periodic(const Duration(seconds: 4), (_) => _silentCheck());
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    _autoPollTimer?.cancel();
    super.dispose();
  }

  Future<void> _sendInitialEmail() async {
    try {
      await EmailVerificationService.sendVerificationEmail();
      _startCooldown();
    } on FirebaseAuthException catch (e) {
      if (mounted) setState(() => _error = _friendlyError(e));
    }
  }

  void _startCooldown() {
    setState(() => _cooldownRemaining = _resendCooldownSeconds);
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldownRemaining <= 1) {
        timer.cancel();
        setState(() => _cooldownRemaining = 0);
      } else {
        setState(() => _cooldownRemaining--);
      }
    });
  }

  Future<void> _silentCheck() async {
    if (_verifiedAndHandled) return;
    final verified = await EmailVerificationService.checkVerified();
    if (verified && mounted && !_verifiedAndHandled) {
      _verifiedAndHandled = true;
      _autoPollTimer?.cancel();
      widget.onVerified();
    }
  }

  Future<void> _manualCheck() async {
    setState(() {
      _checking = true;
      _error = null;
    });
    final verified = await EmailVerificationService.checkVerified();
    if (!mounted) return;
    setState(() => _checking = false);
    if (verified) {
      _verifiedAndHandled = true;
      _autoPollTimer?.cancel();
      widget.onVerified();
    } else {
      setState(() => _error = "Not verified yet — click the link in the email first, then try again.");
    }
  }

  Future<void> _resend() async {
    setState(() {
      _resending = true;
      _error = null;
    });
    try {
      await EmailVerificationService.sendVerificationEmail();
      _startCooldown();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification email resent.')),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _error = _friendlyError(e));
    } finally {
      if (mounted) setState(() => _resending = false);
    }
  }

  String _friendlyError(FirebaseAuthException e) {
    switch (e.code) {
      case 'too-many-requests':
        return 'Too many requests — please wait a bit before trying again.';
      default:
        return e.message ?? 'Something went wrong sending the verification email.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = EmailVerificationService.currentUserEmail ?? 'your email';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your Email'),
        backgroundColor: _navy,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.mark_email_read_outlined, size: 64, color: _blue),
              const SizedBox(height: 20),
              const Text(
                'Check your inbox',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: 'We sent a verification link to ',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  children: [
                    TextSpan(text: email, style: const TextStyle(fontWeight: FontWeight.bold, color: _navy)),
                    const TextSpan(text: '. Click the link, then return here.'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'This page checks automatically every few seconds — '
                'you can also tap the button below once you\'ve clicked the link.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(_error!, style: TextStyle(color: Colors.red.shade700, fontSize: 13), textAlign: TextAlign.center),
              ],
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: _blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: _checking ? null : _manualCheck,
                  child: _checking
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text("I've verified my email"),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: (_cooldownRemaining > 0 || _resending) ? null : _resend,
                child: Text(
                  _resending
                      ? 'Sending...'
                      : _cooldownRemaining > 0
                          ? 'Resend email in ${_cooldownRemaining}s'
                          : 'Resend verification email',
                  style: TextStyle(color: _cooldownRemaining > 0 ? Colors.grey : _blue),
                ),
              ),
              // Escape hatch — without this, a user who mistyped their
              // email at signup (or wants to use a different account)
              // would be permanently stuck on this screen with no way
              // forward, since it's the router's default view for any
              // signed-in-but-unverified user.
              TextButton(
                onPressed: () async {
                  await AuthService.signOut();
                },
                child: Text(
                  'Wrong email? Sign out and try again',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────
// INTEGRATION NOTES — where this plugs into your existing signup flow
// ─────────────────────────────────────────────────────────────────────
//
// In your registration screen, find where the account is created, e.g.:
//
//   final credential = await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: email, password: password);
//
// Immediately after that succeeds (and BEFORE navigating the user into
// the main app / marking signup complete), push this screen:
//
//   if (!mounted) return;
//   await Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (_) => EmailVerificationScreen(
//         onVerified: () {
//           Navigator.of(context).pop();
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (_) => const TopicsScreen()),
//           );
//         },
//       ),
//     ),
//   );
//
// Anywhere else in the app that should gate access based on
// verification status, check Firebase Auth's own field directly (no
// Firestore flag needed this time, unlike the OTP approach — Firebase
// sets this for you once the link is clicked):
//
//   await FirebaseAuth.instance.currentUser?.reload();
//   final isVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;
//
// One more thing worth doing: on every future login (not just signup),
// check `emailVerified` and route unverified users back to this screen
// instead of straight into the app — otherwise someone who signs up,
// closes the app before verifying, and logs back in later would skip
// verification entirely.
