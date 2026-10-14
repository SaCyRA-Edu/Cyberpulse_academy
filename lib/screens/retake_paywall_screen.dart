import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shown when a user has used up their free exam attempts (1 initial +
/// 2 retakes) and wants to try again. A single purchase at half the
/// full-access price unlocks unlimited further attempts permanently —
/// see `retakeUnlocked` in functions/src/index.ts, which is set once
/// and never reset.
///
/// Same flow as the Full Access paywall: payment happens on sacyra.com
/// (opened in the browser), the server matches the payer's email to
/// their app account and sets `retakeUnlocked`, and "Already purchased?
/// Refresh access" here re-checks that flag. There is no in-app payment
/// checkout.
class RetakePaywallScreen extends StatefulWidget {
  const RetakePaywallScreen({super.key});

  @override
  State<RetakePaywallScreen> createState() => _RetakePaywallScreenState();
}

class _RetakePaywallScreenState extends State<RetakePaywallScreen> {
  static const _navy = Color(0xFF0D1B3E);
  static const _blue = Color(0xFF1565C0);

  static const _purchaseUrl = 'https://www.sacyra.com/purchase?product=retake';

  bool _checking = false;
  String? _error;

  Future<void> _openPurchasePage() async {
    setState(() => _error = null);
    final launched = await launchUrl(Uri.parse(_purchaseUrl), mode: LaunchMode.externalApplication);
    if (!launched && mounted) {
      setState(() => _error = 'Could not open the purchase page. Please visit $_purchaseUrl in your browser.');
    }
  }

  /// Re-checks whether this account now has retake access — the way
  /// someone returns to the app after paying on the website.
  Future<void> _refreshAccess() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      setState(() => _error = 'You must be signed in to check your purchase.');
      return;
    }
    setState(() {
      _checking = true;
      _error = null;
    });

    bool unlocked = false;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('progress')
          .doc('summary')
          .get();
      unlocked = doc.data()?['retakeUnlocked'] == true;
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _checking = false;
        _error = 'Could not check your purchase right now. Please try again.';
      });
      return;
    }

    if (!mounted) return;
    setState(() => _checking = false);
    if (unlocked) {
      Navigator.of(context).pop(true); // true = "unlocked, please retry starting the exam"
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No purchase found for this account yet. If you just paid, this can take a minute to sync — try again shortly.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        title: const Text('Retake Limit Reached'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            const Icon(Icons.hourglass_bottom, size: 72, color: _blue),
            const SizedBox(height: 20),
            const Text(
              'You\'ve used your free attempts',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: _navy),
            ),
            const SizedBox(height: 8),
            Text(
              'Your first attempt plus 2 free retakes are complete. '
              'Unlock unlimited further attempts at half the Full Access price, '
              'with a one-time purchase on our website.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: Colors.blue.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Use the same email you signed into this app with when you pay on the website — that\'s how we match your purchase to your account.',
                      style: TextStyle(fontSize: 12, color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (_error != null)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_error!, style: const TextStyle(fontSize: 12.5))),
                  ],
                ),
              ),
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: _blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _openPurchasePage,
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('Unlock Retakes on Our Website', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _checking ? null : _refreshAccess,
                child: Text(
                  _checking ? 'Checking...' : 'Already purchased? Refresh access',
                  style: const TextStyle(color: _blue),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Not now', style: TextStyle(color: Colors.grey.shade600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
