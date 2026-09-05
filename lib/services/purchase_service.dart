import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

/// What kind of purchase is being made — determines both the price
/// (retake is 50% of full access) and what gets unlocked server-side
/// once payment is verified. See createRazorpayOrder /
/// verifyRazorpayPayment in functions/src/index.ts.
enum PurchaseProductType { fullAccess, retake }

extension on PurchaseProductType {
  String get wireValue => this == PurchaseProductType.retake ? 'retake' : 'full_access';
}

/// Wraps Razorpay Checkout. The original full-access purchase flow
/// (initialize / buy / displayPrice) is unchanged from before — retake
/// support is added alongside it as new methods (buyProduct,
/// priceFor), so nothing that already calls the original API needs to
/// change.
class PurchaseService {
  static final Razorpay _razorpay = Razorpay();
  static bool _initialized = false;

  static void Function()? _onSuccess;
  static void Function(String message)? _onError;

  static String? _pendingOrderId;

  static String? displayPrice;
  static bool displayPriceLoaded = false;

  static Future<void> initialize({
    required void Function() onPurchaseSuccess,
    required void Function(String message) onPurchaseError,
  }) async {
    _onSuccess = onPurchaseSuccess;
    _onError = onPurchaseError;

    if (!_initialized) {
      _initialized = true;
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    }

    if (!displayPriceLoaded) {
      displayPrice = await priceFor(PurchaseProductType.fullAccess);
      displayPriceLoaded = true;
    }
  }

  static void dispose() {
    _razorpay.clear();
    _initialized = false;
  }

  /// Reads the real full-access price from Firestore (config/pricing).
  /// The retake price is always exactly half of this, computed the
  /// same way server-side, so the two prices can never drift apart.
  static Future<String?> priceFor(PurchaseProductType type) async {
    try {
      final doc = await FirebaseFirestore.instance.collection('config').doc('pricing').get();
      final paise = doc.data()?['fullAccessPricePaise'] as num?;
      if (paise == null || paise <= 0) return null;
      final baseRupees = paise / 100;
      final amount = type == PurchaseProductType.retake ? baseRupees / 2 : baseRupees;
      return amount == amount.roundToDouble() ? '₹${amount.toInt()}' : '₹${amount.toStringAsFixed(2)}';
    } catch (_) {
      return null;
    }
  }

  /// Original full-access purchase call — unchanged behavior.
  static Future<void> buy({
    required String userEmail,
    String? userPhone,
    String? userName,
  }) {
    return buyProduct(
      productType: PurchaseProductType.fullAccess,
      userEmail: userEmail,
      userPhone: userPhone,
      userName: userName,
    );
  }

  /// General-purpose purchase call supporting either product type.
  static Future<void> buyProduct({
    required PurchaseProductType productType,
    required String userEmail,
    String? userPhone,
    String? userName,
  }) async {
    try {
      final result = await FirebaseFunctions.instance.httpsCallable('createRazorpayOrder').call({
        'productType': productType.wireValue,
      });
      final data = Map<String, dynamic>.from(result.data as Map);

      _pendingOrderId = data['orderId'] as String;

      final options = {
        'key': data['keyId'],
        'amount': data['amount'],
        'currency': data['currency'],
        'order_id': _pendingOrderId,
        'name': 'CyberPulse Academy',
        'description':
            productType == PurchaseProductType.retake ? 'Unlock One More Exam Retake' : 'Unlock Full Access',
        'prefill': {
          'email': userEmail,
          if (userPhone != null) 'contact': userPhone,
          if (userName != null) 'name': userName,
        },
        'theme': {'color': '#1565C0'},
      };

      _razorpay.open(options);
    } on FirebaseFunctionsException catch (e) {
      _onError?.call(e.message ?? 'Could not start the purchase. Please try again.');
    } catch (e) {
      _onError?.call('Could not start the purchase: $e');
    }
  }

  static Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      await FirebaseFunctions.instance.httpsCallable('verifyRazorpayPayment').call({
        'razorpay_order_id': response.orderId ?? _pendingOrderId,
        'razorpay_payment_id': response.paymentId,
        'razorpay_signature': response.signature,
      });
      _onSuccess?.call();
    } on FirebaseFunctionsException catch (e) {
      _onError?.call(
        'Payment was received but could not be verified: ${e.message ?? "unknown error"}. '
        'If this persists, contact support with your payment ID: ${response.paymentId}',
      );
    } catch (e) {
      _onError?.call('Payment verification failed: $e');
    }
  }

  static void _handlePaymentError(PaymentFailureResponse response) {
    if (response.code == Razorpay.PAYMENT_CANCELLED) return;
    _onError?.call(response.message ?? 'Payment failed. Please try again.');
  }

  static void _handleExternalWallet(ExternalWalletResponse response) {
    // No action needed — Razorpay's SDK handles the handoff.
  }
}
