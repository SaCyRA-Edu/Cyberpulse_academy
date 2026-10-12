import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Best result a learner has achieved on one Investigation Practice scenario.
class InvestigationResult {
  final int score;
  final int total;
  final int attempts;

  const InvestigationResult({
    required this.score,
    required this.total,
    this.attempts = 1,
  });

  double get percent => total == 0 ? 0 : score * 100 / total;

  Map<String, dynamic> toJson() =>
      {'score': score, 'total': total, 'attempts': attempts};

  factory InvestigationResult.fromJson(Map<String, dynamic> j) =>
      InvestigationResult(
        score: (j['score'] as num?)?.toInt() ?? 0,
        total: (j['total'] as num?)?.toInt() ?? 0,
        attempts: (j['attempts'] as num?)?.toInt() ?? 1,
      );
}

/// Saves each learner's completed Investigation Practice scenarios and best
/// scores, on-device (SharedPreferences, scoped by uid like ProgressService)
/// and in Firestore at users/{uid}/progress/investigations — covered by the
/// existing rule for users/{userId}/progress/{document=**}.
///
/// Merge rule: best percentage wins; attempts take the higher count.
class InvestigationProgressService {
  static const _localKey = 'investigation_results';

  static String? get _uid => FirebaseAuth.instance.currentUser?.uid;
  static String get _scopedKey => '${_uid ?? "guest"}_$_localKey';

  static DocumentReference<Map<String, dynamic>>? get _cloudDoc {
    final uid = _uid;
    if (uid == null) return null;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('progress')
        .doc('investigations');
  }

  static Future<Map<String, InvestigationResult>> _readLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_scopedKey);
    if (raw == null) return {};
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      return decoded.map((k, v) => MapEntry(
          k, InvestigationResult.fromJson(Map<String, dynamic>.from(v as Map))));
    } catch (_) {
      return {};
    }
  }

  static Future<void> _writeLocal(Map<String, InvestigationResult> m) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _scopedKey, jsonEncode(m.map((k, v) => MapEntry(k, v.toJson()))));
  }

  static Future<Map<String, InvestigationResult>> _readCloud() async {
    final doc = _cloudDoc;
    if (doc == null) return {};
    try {
      final snap = await doc.get();
      final results = snap.data()?['results'];
      if (results is! Map) return {};
      return results.map((k, v) => MapEntry(
          k.toString(),
          InvestigationResult.fromJson(Map<String, dynamic>.from(v as Map))));
    } catch (_) {
      return {}; // offline — local data still works
    }
  }

  static InvestigationResult _better(
      InvestigationResult a, InvestigationResult b) {
    final best = b.percent > a.percent ? b : a;
    return InvestigationResult(
      score: best.score,
      total: best.total,
      attempts: a.attempts > b.attempts ? a.attempts : b.attempts,
    );
  }

  static Map<String, InvestigationResult> _merge(
      Map<String, InvestigationResult> a, Map<String, InvestigationResult> b) {
    final out = Map<String, InvestigationResult>.from(a);
    b.forEach((k, v) {
      out[k] = out.containsKey(k) ? _better(out[k]!, v) : v;
    });
    return out;
  }

  /// All saved results (local + cloud merged), keyed by scenario id.
  static Future<Map<String, InvestigationResult>> getResults() async {
    final merged = _merge(await _readLocal(), await _readCloud());
    await _writeLocal(merged);
    return merged;
  }

  /// Records one finished attempt. Keeps the best score, counts attempts.
  static Future<void> recordAttempt(
      String scenarioId, int score, int total) async {
    final merged = await getResults();
    final prev = merged[scenarioId];
    final attempt = InvestigationResult(
        score: score, total: total, attempts: (prev?.attempts ?? 0) + 1);
    merged[scenarioId] = prev == null ? attempt : _better(prev, attempt);
    // _better keeps the max attempts of the two; make sure the new count wins.
    merged[scenarioId] = InvestigationResult(
      score: merged[scenarioId]!.score,
      total: merged[scenarioId]!.total,
      attempts: attempt.attempts,
    );
    await _writeLocal(merged);
    final doc = _cloudDoc;
    if (doc != null) {
      try {
        await doc.set({
          'results': merged.map((k, v) => MapEntry(k, v.toJson())),
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      } catch (_) {
        // Offline: saved locally, will merge up on the next successful write.
      }
    }
  }

  /// Call from ProgressService.resetAll() if you want a full reset to also
  /// clear investigation results.
  static Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_scopedKey);
    final doc = _cloudDoc;
    if (doc != null) {
      try {
        await doc.delete();
      } catch (_) {}
    }
  }
}
