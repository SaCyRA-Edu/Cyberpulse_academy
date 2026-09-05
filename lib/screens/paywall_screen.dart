import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/progress_service.dart';
import '../widgets/cyberpulse_logo.dart';

/// Shown when a user taps a locked chapter, locked bonus chapter, or the
/// Final Certification Exam without full access.
///
/// Purchases no longer happen inside the app — this screen redirects
/// to a purchase page on sacyra.com instead, where the user completes
/// payment with the same email they use to sign into the app. A
/// server-side Cloud Function matches that email to their account and
/// grants access; "Refresh access" on this screen re-checks that.
///
/// This intentionally removes the in-app Razorpay checkout that used
/// to live here (see PurchaseService, which this screen no longer
/// uses at all) — payment now happens entirely on the website.
class PaywallScreen extends StatefulWidget {
  /// Optional — the specific thing that was tapped, shown in the
  /// headline (e.g. "Chapter 7: Endpoint Security" or "Final
  /// Certification Exam"). Falls back to generic copy if omitted.
  final String? lockedItemTitle;

  const PaywallScreen({super.key, this.lockedItemTitle});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  static const _navy = Color(0xFF0D1B3E);
  static const _blue = Color(0xFF1565C0);

  // The "was" price shown struck through, for the inaugural launch
  // offer, plus the current real price — both purely display text
  // here, since the actual charge amount is now determined entirely
  // by whatever the website purchase page shows/charges, not by this
  // screen or any Firestore config it reads.
  static const _regularPriceDisplay = '₹999';
  static const _currentPriceDisplay = '₹499';

  static const _purchaseUrl = 'https://www.sacyra.com/purchase';

  bool _checkingExistingAccess = false;
  String? _loadError;

  Future<void> _openPurchasePage() async {
    final uri = Uri.parse(_purchaseUrl);
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && mounted) {
      setState(() => _loadError = 'Could not open the purchase page. Please visit $_purchaseUrl in your browser.');
    }
  }

  /// Re-checks whether this account now has full access — the actual
  /// way someone returns to the app after buying on the website and
  /// picks up their unlocked access.
  Future<void> _refreshAccessStatus() async {
    setState(() => _checkingExistingAccess = true);
    final hasAccess = await ProgressService.hasFullAccess();
    if (!mounted) return;
    setState(() => _checkingExistingAccess = false);
    if (hasAccess) {
      Navigator.of(context).pop(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No purchase found for this account yet. If you just paid, this can take a minute to sync — try again shortly.')),
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
        title: const Text('Unlock Full Access'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            const Center(child: CyberPulseLogo(size: 90)),
            const SizedBox(height: 20),
            Text(
              widget.lockedItemTitle != null
                  ? '"${widget.lockedItemTitle}" requires full access'
                  : 'This content requires full access',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: _navy),
            ),
            const SizedBox(height: 8),
            Text(
              'Chapter 1 is free to explore. Unlock everything else with '
              'a one-time purchase on our website.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'LAUNCH OFFER',
                      style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Colors.deepOrange, letterSpacing: 0.5),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _regularPriceDisplay,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        _currentPriceDisplay,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _navy),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _FeatureRow(icon: Icons.menu_book, text: 'All 13 core chapters + 8 bonus chapters'),
                  _FeatureRow(icon: Icons.quiz_outlined, text: 'Every practice quiz, fully unlocked'),
                  _FeatureRow(icon: Icons.workspace_premium, text: 'Final Certification Exam (100 adaptive questions)'),
                  _FeatureRow(icon: Icons.verified, text: 'Shareable Certificate of Achievement on passing'),
                  _FeatureRow(icon: Icons.sync, text: 'Progress synced across all your devices', showDivider: false),
                ],
              ),
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
            const SizedBox(height: 20),
            if (_loadError != null)
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
                    Expanded(child: Text(_loadError!, style: const TextStyle(fontSize: 12.5))),
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
                label: const Text('Purchase on Our Website', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _checkingExistingAccess ? null : _refreshAccessStatus,
                child: Text(
                  _checkingExistingAccess ? 'Checking...' : 'Already purchased? Refresh access',
                  style: TextStyle(color: _blue),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Maybe later', style: TextStyle(color: Colors.grey.shade600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool showDivider;

  const _FeatureRow({required this.icon, required this.text, this.showDivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 20, color: const Color(0xFF1565C0)),
              const SizedBox(width: 12),
              Expanded(child: Text(text, style: const TextStyle(fontSize: 13.5))),
            ],
          ),
        ),
        if (showDivider) Divider(height: 1, color: Colors.grey.shade200),
      ],
    );
  }
}
