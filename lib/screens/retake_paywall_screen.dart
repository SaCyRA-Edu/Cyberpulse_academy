import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/purchase_service.dart';

/// Shown when a user has used up their free exam attempts (1 initial +
/// 2 retakes) and wants to try again. A single purchase at half the
/// full-access price unlocks unlimited further attempts permanently —
/// see `retakeUnlocked` in functions/src/index.ts, which is set once
/// and never reset.
class RetakePaywallScreen extends StatefulWidget {
  const RetakePaywallScreen({super.key});

  @override
  State<RetakePaywallScreen> createState() => _RetakePaywallScreenState();
}

class _RetakePaywallScreenState extends State<RetakePaywallScreen> {
  static const _navy = Color(0xFF0D1B3E);
  static const _blue = Color(0xFF1565C0);

  bool _purchasing = false;
  bool _loadingPrice = true;
  String? _price;
  String? _error;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    PurchaseService.initialize(
      onPurchaseSuccess: () {
        if (!mounted) return;
        setState(() => _purchasing = false);
        Navigator.of(context).pop(true); // true = "unlocked, please retry starting the exam"
      },
      onPurchaseError: (message) {
        if (!mounted) return;
        setState(() {
          _purchasing = false;
          _error = message;
        });
      },
    );
    final price = await PurchaseService.priceFor(PurchaseProductType.retake);
    if (mounted) {
      setState(() {
        _price = price;
        _loadingPrice = false;
      });
    }
  }

  @override
  void dispose() {
    PurchaseService.dispose();
    super.dispose();
  }

  Future<void> _buy() async {
    final email = FirebaseAuth.instance.currentUser?.email;
    if (email == null) {
      setState(() => _error = 'You must be signed in with an email to purchase.');
      return;
    }
    setState(() {
      _purchasing = true;
      _error = null;
    });
    await PurchaseService.buyProduct(
      productType: PurchaseProductType.retake,
      userEmail: email,
      userName: FirebaseAuth.instance.currentUser?.displayName,
    );
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
              'Unlock unlimited further attempts at half the original price.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 28),
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
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: _blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: (_purchasing || _loadingPrice) ? null : _buy,
                child: (_purchasing || _loadingPrice)
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                      )
                    : Text(
                        _price != null ? 'Unlock Retakes — $_price' : 'Unlock Retakes',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            const SizedBox(height: 10),
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
