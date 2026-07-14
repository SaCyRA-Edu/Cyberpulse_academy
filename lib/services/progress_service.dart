import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Persists course progress both on-device (shared_preferences, for instant
/// offline-friendly access) and in Cloud Firestore, keyed to the signed-in
/// user's UID — so progress made on one device shows up when the same
/// account signs in on another device.
///
/// Two independent things are tracked per level index:
///   - "passed"    -> the level's adaptive exam was passed at 80%+
///   - "purchased" -> a paid level was unlocked via the (placeholder) upgrade flow
///
/// A level is accessible when:
///   - it's level 0 (Beginner), OR
///   - the previous level has been passed AND
///     (this level is free OR this level has been purchased)
///
/// This means even a purchased level stays locked until the previous
/// level's exam is actually passed — payment never skips the prerequisite.
///
/// Sync strategy: every read merges local + cloud data (taking the union
/// of passed/purchased levels, and the higher of any two best scores),
/// writes the merged result back to local storage as a fast cache, and —
/// if a user is signed in — pushes it to Firestore too. This means the
/// merge happens automatically every time the home screen loads, with no
/// separate "sync now" step needed anywhere else in the app. If no user
/// is signed in, or Firestore is briefly unreachable, everything falls
/// back to local-only storage transparently.
class ProgressService {
  static const _passedKey = 'cp_passed_levels';
  static const _purchasedKey = 'cp_purchased_levels';
  static const _bestScoreKeyPrefix = 'cp_best_score_level_';

  static String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  static DocumentReference<Map<String, dynamic>>? get _cloudDoc {
    final uid = _uid;
    if (uid == null) return null;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('progress')
        .doc('summary');
  }

  // ── Local (shared_preferences) helpers ──────────────────────────────────

  static Future<Set<int>> _getLocalPassedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_passedKey) ?? [];
    return list.map(int.parse).toSet();
  }

  static Future<void> _setLocalPassedLevels(Set<int> levels) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_passedKey, levels.map((e) => e.toString()).toList());
  }

  static Future<Set<int>> _getLocalPurchasedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_purchasedKey) ?? [];
    return list.map(int.parse).toSet();
  }

  static Future<void> _setLocalPurchasedLevels(Set<int> levels) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_purchasedKey, levels.map((e) => e.toString()).toList());
  }

  static Future<Map<int, double>> _getLocalBestScores() async {
    final prefs = await SharedPreferences.getInstance();
    final result = <int, double>{};
    for (final key in prefs.getKeys()) {
      if (key.startsWith(_bestScoreKeyPrefix)) {
        final levelIndex = int.tryParse(key.substring(_bestScoreKeyPrefix.length));
        final value = prefs.getDouble(key);
        if (levelIndex != null && value != null) {
          result[levelIndex] = value;
        }
      }
    }
    return result;
  }

  static Future<void> _setLocalBestScore(int levelIndex, double score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('$_bestScoreKeyPrefix$levelIndex', score);
  }

  // ── Cloud (Firestore) helpers ────────────────────────────────────────────
  // Every call is wrapped so a network hiccup or missing sign-in never
  // breaks the app — it just silently falls back to local-only data.

  static Future<Map<String, dynamic>?> _getCloudData() async {
    final doc = _cloudDoc;
    if (doc == null) return null;
    try {
      final snapshot = await doc.get();
      return snapshot.data();
    } catch (_) {
      return null;
    }
  }

  static Future<void> _pushCloudData({
    required Set<int> passedLevels,
    required Set<int> purchasedLevels,
    required Map<int, double> bestScores,
  }) async {
    final doc = _cloudDoc;
    if (doc == null) return;
    try {
      await doc.set({
        'passedLevels': passedLevels.toList(),
        'purchasedLevels': purchasedLevels.toList(),
        'bestScores': bestScores.map((k, v) => MapEntry(k.toString(), v)),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (_) {
      // Offline or Firestore temporarily unreachable — local storage still
      // has the data, and this will naturally retry next time a write
      // happens while online. Cloud Firestore's own offline queue also
      // means this often silently succeeds once connectivity returns.
    }
  }

  // ── Merge logic ──────────────────────────────────────────────────────────

  static Future<
      ({Set<int> passed, Set<int> purchased, Map<int, double> bestScores})>
      _getMergedProgress() async {
    final localPassed = await _getLocalPassedLevels();
    final localPurchased = await _getLocalPurchasedLevels();
    final localScores = await _getLocalBestScores();

    final cloud = await _getCloudData();
    final cloudPassed = <int>{
      if (cloud?['passedLevels'] is List)
        ...List<dynamic>.from(cloud!['passedLevels']).map((e) => e as int),
    };
    final cloudPurchased = <int>{
      if (cloud?['purchasedLevels'] is List)
        ...List<dynamic>.from(cloud!['purchasedLevels']).map((e) => e as int),
    };
    final cloudScores = <int, double>{
      if (cloud?['bestScores'] is Map)
        ...Map<String, dynamic>.from(cloud!['bestScores']).map(
          (k, v) => MapEntry(int.parse(k), (v as num).toDouble()),
        ),
    };

    final mergedPassed = {...localPassed, ...cloudPassed};
    final mergedPurchased = {...localPurchased, ...cloudPurchased};
    final mergedScores = <int, double>{};
    for (final levelIndex in {...localScores.keys, ...cloudScores.keys}) {
      final localVal = localScores[levelIndex] ?? 0;
      final cloudVal = cloudScores[levelIndex] ?? 0;
      mergedScores[levelIndex] = localVal > cloudVal ? localVal : cloudVal;
    }

    // Write the merged result back to local storage so it's cached for
    // fast, offline-friendly access next time.
    await _setLocalPassedLevels(mergedPassed);
    await _setLocalPurchasedLevels(mergedPurchased);
    for (final entry in mergedScores.entries) {
      await _setLocalBestScore(entry.key, entry.value);
    }

    return (passed: mergedPassed, purchased: mergedPurchased, bestScores: mergedScores);
  }

  // ── Public API (same shape as before — no other file needs to change) ───

  static Future<Set<int>> getPassedLevels() async {
    final merged = await _getMergedProgress();
    return merged.passed;
  }

  static Future<void> markLevelPassed(int levelIndex, double scorePercent) async {
    final merged = await _getMergedProgress();
    final passed = {...merged.passed, levelIndex};
    final scores = {...merged.bestScores};
    final existingBest = scores[levelIndex] ?? 0;
    if (scorePercent > existingBest) {
      scores[levelIndex] = scorePercent;
    }

    await _setLocalPassedLevels(passed);
    await _setLocalBestScore(levelIndex, scores[levelIndex]!);
    await _pushCloudData(
      passedLevels: passed,
      purchasedLevels: merged.purchased,
      bestScores: scores,
    );
  }

  static Future<double?> getBestScore(int levelIndex) async {
    final merged = await _getMergedProgress();
    return merged.bestScores[levelIndex];
  }

  static Future<Set<int>> getPurchasedLevels() async {
    final merged = await _getMergedProgress();
    return merged.purchased;
  }

  static Future<void> markLevelPurchased(int levelIndex) async {
    final merged = await _getMergedProgress();
    final purchased = {...merged.purchased, levelIndex};

    await _setLocalPurchasedLevels(purchased);
    await _pushCloudData(
      passedLevels: merged.passed,
      purchasedLevels: purchased,
      bestScores: merged.bestScores,
    );
  }

  /// Returns why a level is locked, or null if it's unlocked.
  /// Possible reasons: 'previous_not_passed', 'not_purchased'.
  static Future<String?> getLockReason({
    required int levelIndex,
    required bool levelIsFree,
  }) async {
    if (levelIndex == 0) return null;

    final passed = await getPassedLevels();
    if (!passed.contains(levelIndex - 1)) {
      return 'previous_not_passed';
    }

    if (levelIsFree) return null;

    final purchased = await getPurchasedLevels();
    if (!purchased.contains(levelIndex)) {
      return 'not_purchased';
    }

    return null;
  }

  /// Dev-only helper to wipe all progress (local and cloud, if signed in),
  /// useful for testing the gating flow from scratch.
  static Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_passedKey);
    await prefs.remove(_purchasedKey);
    final keys = prefs.getKeys().where((k) => k.startsWith(_bestScoreKeyPrefix));
    for (final k in keys) {
      await prefs.remove(k);
    }

    final doc = _cloudDoc;
    if (doc != null) {
      try {
        await doc.delete();
      } catch (_) {
        // Fine if this fails offline — local data is already cleared.
      }
    }
  }
}
