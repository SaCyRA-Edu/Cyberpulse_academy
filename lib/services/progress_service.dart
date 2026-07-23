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
  static const _finalExamScoreKey = 'cp_final_exam_best_score';
  static const _viewedLessonsKey = 'cp_viewed_lessons';
  static const _completedQuizModulesKey = 'cp_completed_quiz_modules';

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

  static Future<double?> _getLocalFinalExamScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_finalExamScoreKey);
  }

  static Future<void> _setLocalFinalExamScore(double score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_finalExamScoreKey, score);
  }

  static Future<Set<String>> _getLocalViewedLessons() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_viewedLessonsKey) ?? []).toSet();
  }

  static Future<void> _setLocalViewedLessons(Set<String> lessonKeys) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_viewedLessonsKey, lessonKeys.toList());
  }

  static Future<Set<String>> _getLocalCompletedQuizModules() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_completedQuizModulesKey) ?? []).toSet();
  }

  static Future<void> _setLocalCompletedQuizModules(Set<String> modules) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_completedQuizModulesKey, modules.toList());
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
    double? finalExamScore,
    Set<String>? viewedLessons,
    Set<String>? completedQuizModules,
  }) async {
    final doc = _cloudDoc;
    if (doc == null) return;
    try {
      final data = <String, dynamic>{
        'passedLevels': passedLevels.toList(),
        'purchasedLevels': purchasedLevels.toList(),
        'bestScores': bestScores.map((k, v) => MapEntry(k.toString(), v)),
        'updatedAt': FieldValue.serverTimestamp(),
      };
      if (finalExamScore != null) {
        data['finalExamScore'] = finalExamScore;
      }
      if (viewedLessons != null) {
        data['viewedLessons'] = viewedLessons.toList();
      }
      if (completedQuizModules != null) {
        data['completedQuizModules'] = completedQuizModules.toList();
      }
      await doc.set(data, SetOptions(merge: true));
    } catch (_) {
      // Offline or Firestore temporarily unreachable — local storage still
      // has the data, and this will naturally retry next time a write
      // happens while online. Cloud Firestore's own offline queue also
      // means this often silently succeeds once connectivity returns.
    }
  }

  // ── Merge logic ──────────────────────────────────────────────────────────

  static Future<
      ({Set<int> passed, Set<int> purchased, Map<int, double> bestScores, double? finalExamScore, Set<String> viewedLessons, Set<String> completedQuizModules})>
      _getMergedProgress() async {
    final localPassed = await _getLocalPassedLevels();
    final localPurchased = await _getLocalPurchasedLevels();
    final localScores = await _getLocalBestScores();
    final localFinalExam = await _getLocalFinalExamScore();
    final localViewed = await _getLocalViewedLessons();
    final localCompletedQuizzes = await _getLocalCompletedQuizModules();

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
    final cloudFinalExam = (cloud?['finalExamScore'] as num?)?.toDouble();
    final cloudViewed = <String>{
      if (cloud?['viewedLessons'] is List)
        ...List<dynamic>.from(cloud!['viewedLessons']).map((e) => e.toString()),
    };
    final cloudCompletedQuizzes = <String>{
      if (cloud?['completedQuizModules'] is List)
        ...List<dynamic>.from(cloud!['completedQuizModules']).map((e) => e.toString()),
    };

    final mergedPassed = {...localPassed, ...cloudPassed};
    final mergedPurchased = {...localPurchased, ...cloudPurchased};
    final mergedScores = <int, double>{};
    for (final levelIndex in {...localScores.keys, ...cloudScores.keys}) {
      final localVal = localScores[levelIndex] ?? 0;
      final cloudVal = cloudScores[levelIndex] ?? 0;
      mergedScores[levelIndex] = localVal > cloudVal ? localVal : cloudVal;
    }
    double? mergedFinalExam;
    if (localFinalExam != null || cloudFinalExam != null) {
      mergedFinalExam = (localFinalExam ?? 0) > (cloudFinalExam ?? 0)
          ? (localFinalExam ?? cloudFinalExam)
          : (cloudFinalExam ?? localFinalExam);
    }
    final mergedViewed = {...localViewed, ...cloudViewed};
    final mergedCompletedQuizzes = {...localCompletedQuizzes, ...cloudCompletedQuizzes};

    // Write the merged result back to local storage so it's cached for
    // fast, offline-friendly access next time.
    await _setLocalPassedLevels(mergedPassed);
    await _setLocalPurchasedLevels(mergedPurchased);
    for (final entry in mergedScores.entries) {
      await _setLocalBestScore(entry.key, entry.value);
    }
    if (mergedFinalExam != null) {
      await _setLocalFinalExamScore(mergedFinalExam);
    }
    await _setLocalViewedLessons(mergedViewed);
    await _setLocalCompletedQuizModules(mergedCompletedQuizzes);

    return (
      passed: mergedPassed,
      purchased: mergedPurchased,
      bestScores: mergedScores,
      finalExamScore: mergedFinalExam,
      viewedLessons: mergedViewed,
      completedQuizModules: mergedCompletedQuizzes,
    );
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
      finalExamScore: merged.finalExamScore,
    );
  }

  /// Records a Final Certification Exam attempt. Call this whenever the
  /// exam is submitted (pass or fail) — only the highest score achieved is
  /// ever kept, same pattern as level exam scores.
  static Future<void> markFinalExamAttempt(double scorePercent) async {
    final merged = await _getMergedProgress();
    final existingBest = merged.finalExamScore ?? 0;
    final newBest = scorePercent > existingBest ? scorePercent : existingBest;

    await _setLocalFinalExamScore(newBest);
    await _pushCloudData(
      passedLevels: merged.passed,
      purchasedLevels: merged.purchased,
      bestScores: merged.bestScores,
      finalExamScore: newBest,
    );
  }

  /// The highest Final Certification Exam score achieved so far, or null
  /// if it has never been attempted.
  static Future<double?> getFinalExamBestScore() async {
    final merged = await _getMergedProgress();
    return merged.finalExamScore;
  }

  /// Marks a specific lesson as viewed. `lessonKey` should be a stable,
  /// unique identifier for the lesson — lesson_screen.dart uses
  /// "moduleTitle::lessonTitle", which is unique across the whole course
  /// and stable across sessions (unlike, say, a list index that could
  /// shift if lessons are reordered).
  static Future<void> markLessonViewed(String lessonKey) async {
    final merged = await _getMergedProgress();
    if (merged.viewedLessons.contains(lessonKey)) return; // already recorded
    final viewed = {...merged.viewedLessons, lessonKey};

    await _setLocalViewedLessons(viewed);
    await _pushCloudData(
      passedLevels: merged.passed,
      purchasedLevels: merged.purchased,
      bestScores: merged.bestScores,
      finalExamScore: merged.finalExamScore,
      viewedLessons: viewed,
    );
  }

  /// Every lesson key marked as viewed so far. Used to compute overall
  /// course completion percentage against the total number of lessons
  /// across every module.
  static Future<Set<String>> getViewedLessons() async {
    final merged = await _getMergedProgress();
    return merged.viewedLessons;
  }

  /// Marks a topic module's practice quiz as passed. `moduleTitle` should
  /// be the module's title (e.g. "Networking") — each topic module has
  /// exactly one practice quiz, so this is a stable, unique key. Course
  /// completion percentage is based on this: how many of the course's
  /// topic modules have a passed practice quiz, out of the total.
  static Future<void> markTopicQuizPassed(String moduleTitle) async {
    final merged = await _getMergedProgress();
    if (merged.completedQuizModules.contains(moduleTitle)) return; // already recorded
    final completed = {...merged.completedQuizModules, moduleTitle};

    await _setLocalCompletedQuizModules(completed);
    await _pushCloudData(
      passedLevels: merged.passed,
      purchasedLevels: merged.purchased,
      bestScores: merged.bestScores,
      finalExamScore: merged.finalExamScore,
      viewedLessons: merged.viewedLessons,
      completedQuizModules: completed,
    );
  }

  /// Every topic module title whose practice quiz has been passed.
  static Future<Set<String>> getCompletedQuizModules() async {
    final merged = await _getMergedProgress();
    return merged.completedQuizModules;
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
