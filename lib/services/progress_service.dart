import 'package:shared_preferences/shared_preferences.dart';

/// Persists course progress on-device using shared_preferences.
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
class ProgressService {
  static const _passedKey = 'cp_passed_levels';
  static const _purchasedKey = 'cp_purchased_levels';
  static const _bestScoreKeyPrefix = 'cp_best_score_level_';

  static Future<Set<int>> getPassedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_passedKey) ?? [];
    return list.map(int.parse).toSet();
  }

  static Future<void> markLevelPassed(int levelIndex, double scorePercent) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getPassedLevels();
    current.add(levelIndex);
    await prefs.setStringList(
      _passedKey,
      current.map((e) => e.toString()).toList(),
    );

    final bestKey = '$_bestScoreKeyPrefix$levelIndex';
    final existingBest = prefs.getDouble(bestKey) ?? 0;
    if (scorePercent > existingBest) {
      await prefs.setDouble(bestKey, scorePercent);
    }
  }

  static Future<double?> getBestScore(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('$_bestScoreKeyPrefix$levelIndex');
  }

  static Future<Set<int>> getPurchasedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_purchasedKey) ?? [];
    return list.map(int.parse).toSet();
  }

  static Future<void> markLevelPurchased(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getPurchasedLevels();
    current.add(levelIndex);
    await prefs.setStringList(
      _purchasedKey,
      current.map((e) => e.toString()).toList(),
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

  /// Dev-only helper to wipe all progress, useful for testing the gating
  /// flow from scratch.
  static Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_passedKey);
    await prefs.remove(_purchasedKey);
    final keys = prefs.getKeys().where((k) => k.startsWith(_bestScoreKeyPrefix));
    for (final k in keys) {
      await prefs.remove(k);
    }
  }
}
