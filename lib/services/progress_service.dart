import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A single recorded Final Certification Exam attempt — every attempt is
/// kept (not just the best), so users can see their full history.
class FinalExamAttempt {
  final double scorePercent;
  final DateTime date;

  const FinalExamAttempt({required this.scorePercent, required this.date});

  Map<String, dynamic> toJson() => {
        'score': scorePercent,
        'date': date.toIso8601String(),
      };

  factory FinalExamAttempt.fromJson(Map<String, dynamic> json) {
    return FinalExamAttempt(
      scorePercent: (json['score'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );
  }

  /// Unique enough to dedupe the same attempt appearing in both local and
  /// cloud storage after a merge (score + exact timestamp is effectively
  /// unique — two genuinely different attempts won't share both).
  String get _dedupeKey => '${date.toIso8601String()}_$scorePercent';
}

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
  static const _finalExamHistoryKey = 'cp_final_exam_history';
  static const _fullAccessKey = 'cp_full_access_purchased';
  static const _viewedLessonsKey = 'cp_viewed_lessons';
  static const _completedQuizModulesKey = 'cp_completed_quiz_modules';

  static String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  /// Every local (SharedPreferences) key MUST go through this. Without
  /// it, all signed-in users on the same device share the exact same
  /// keys — which was the actual bug behind "a new user immediately
  /// sees a previous user's exam attempts": SharedPreferences is one
  /// shared store per device, not per account, so an unscoped key like
  /// 'cp_final_exam_history' held whichever user last wrote to it,
  /// regardless of who's currently signed in. Falls back to a 'guest'
  /// scope when nobody's signed in (shouldn't normally happen once the
  /// app's auth gate is in place, but keeps this safe either way).
  static String _scoped(String baseKey) => '${_uid ?? "guest"}_$baseKey';

  static DocumentReference<Map<String, dynamic>>? get _cloudDoc {
    final uid = _uid;
    if (uid == null) return null;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('progress')
        .doc('summary');
  }

  /// True if the signed-in user has an `isAdmin: true` flag on their
  /// Firestore profile document — grants full access to every chapter,
  /// practice quiz, and the Final Certification Exam regardless of
  /// purchase status. This is deliberately a Firestore field rather
  /// than a hardcoded list of emails in the app's source code, so:
  ///   - Granting/revoking admin access never requires a new app release
  ///     — just edit the field directly in the Firebase Console.
  ///   - The list of admin accounts isn't visible to anyone who
  ///     decompiles the shipped app (a hardcoded email allowlist would be).
  ///
  /// To grant admin access: Firebase Console → Firestore Database →
  /// `users` collection → find (or create) the document with that
  /// user's UID as the document ID → add a boolean field named
  /// `isAdmin` set to `true`. No code change or app update needed.
  ///
  /// Uses a short-lived in-memory cache so this doesn't add a Firestore
  /// read to every single lock-check call — it's checked once per
  /// session (or after cache expiry) rather than on every chapter tap.
  ///
  /// IMPORTANT: this cache is keyed by UID, not a single shared value.
  /// An earlier version used one plain `bool?` for the whole app, which
  /// meant if an admin account was checked once, ANY other account that
  /// signed in afterward (within the cache window, same running app
  /// session) would silently inherit that cached `true` — exactly the
  /// "every user sees everything unlocked" bug this caused in testing.
  static final Map<String, bool> _isAdminCache = {};
  static final Map<String, DateTime> _isAdminCacheAt = {};
  static const _isAdminCacheTtl = Duration(minutes: 5);

  static Future<bool> isAdmin() async {
    final uid = _uid;
    if (uid == null) return false;

    final cachedAt = _isAdminCacheAt[uid];
    final cacheAge = cachedAt == null ? null : DateTime.now().difference(cachedAt);
    if (_isAdminCache.containsKey(uid) && cacheAge != null && cacheAge < _isAdminCacheTtl) {
      return _isAdminCache[uid]!;
    }

    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final isAdmin = doc.data()?['isAdmin'] == true;
      _isAdminCache[uid] = isAdmin;
      _isAdminCacheAt[uid] = DateTime.now();
      return isAdmin;
    } catch (_) {
      // Offline or unreachable — fail closed (not admin) rather than
      // silently granting full access if Firestore can't be reached.
      return _isAdminCache[uid] ?? false;
    }
  }

  // ── Local (shared_preferences) helpers ──────────────────────────────────

  static Future<Set<int>> _getLocalPassedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_scoped(_passedKey)) ?? [];
    return list.map(int.parse).toSet();
  }

  static Future<void> _setLocalPassedLevels(Set<int> levels) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_scoped(_passedKey), levels.map((e) => e.toString()).toList());
  }

  static Future<Set<int>> _getLocalPurchasedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_scoped(_purchasedKey)) ?? [];
    return list.map(int.parse).toSet();
  }

  static Future<void> _setLocalPurchasedLevels(Set<int> levels) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_scoped(_purchasedKey), levels.map((e) => e.toString()).toList());
  }

  static Future<Map<int, double>> _getLocalBestScores() async {
    final prefs = await SharedPreferences.getInstance();
    final result = <int, double>{};
    final scopedPrefix = _scoped(_bestScoreKeyPrefix);
    for (final key in prefs.getKeys()) {
      if (key.startsWith(scopedPrefix)) {
        final levelIndex = int.tryParse(key.substring(scopedPrefix.length));
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
    await prefs.setDouble('${_scoped(_bestScoreKeyPrefix)}$levelIndex', score);
  }

  static Future<double?> _getLocalFinalExamScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_scoped(_finalExamScoreKey));
  }

  static Future<void> _setLocalFinalExamScore(double score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_scoped(_finalExamScoreKey), score);
  }

  static Future<List<FinalExamAttempt>> _getLocalFinalExamHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_scoped(_finalExamHistoryKey));
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list
          .map((e) => FinalExamAttempt.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return []; // corrupted/legacy data — fail safe rather than crash
    }
  }

  static Future<void> _setLocalFinalExamHistory(List<FinalExamAttempt> history) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _scoped(_finalExamHistoryKey),
      jsonEncode(history.map((a) => a.toJson()).toList()),
    );
  }

  static Future<bool> _getLocalFullAccess() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_scoped(_fullAccessKey)) ?? false;
  }

  static Future<void> _setLocalFullAccess(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_scoped(_fullAccessKey), value);
  }

  static Future<Set<String>> _getLocalViewedLessons() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_scoped(_viewedLessonsKey)) ?? []).toSet();
  }

  static Future<void> _setLocalViewedLessons(Set<String> lessonKeys) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_scoped(_viewedLessonsKey), lessonKeys.toList());
  }

  static Future<Set<String>> _getLocalCompletedQuizModules() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_scoped(_completedQuizModulesKey)) ?? []).toSet();
  }

  static Future<void> _setLocalCompletedQuizModules(Set<String> modules) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_scoped(_completedQuizModulesKey), modules.toList());
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
    List<FinalExamAttempt>? finalExamHistory,
    Set<String>? viewedLessons,
    Set<String>? completedQuizModules,
    bool? fullAccessPurchased,
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
      if (finalExamHistory != null) {
        data['finalExamHistory'] = finalExamHistory.map((a) => a.toJson()).toList();
      }
      if (viewedLessons != null) {
        data['viewedLessons'] = viewedLessons.toList();
      }
      if (completedQuizModules != null) {
        data['completedQuizModules'] = completedQuizModules.toList();
      }
      if (fullAccessPurchased != null) {
        data['fullAccessPurchased'] = fullAccessPurchased;
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
      ({Set<int> passed, Set<int> purchased, Map<int, double> bestScores, double? finalExamScore, List<FinalExamAttempt> finalExamHistory, Set<String> viewedLessons, Set<String> completedQuizModules, bool fullAccessPurchased})>
      _getMergedProgress() async {
    final localPassed = await _getLocalPassedLevels();
    final localPurchased = await _getLocalPurchasedLevels();
    final localScores = await _getLocalBestScores();
    final localFinalExam = await _getLocalFinalExamScore();
    final localFinalExamHistory = await _getLocalFinalExamHistory();
    final localViewed = await _getLocalViewedLessons();
    final localCompletedQuizzes = await _getLocalCompletedQuizModules();
    final localFullAccess = await _getLocalFullAccess();

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
    final cloudFinalExamHistory = <FinalExamAttempt>[
      if (cloud?['finalExamHistory'] is List)
        ...List<dynamic>.from(cloud!['finalExamHistory'])
            .map((e) => FinalExamAttempt.fromJson(Map<String, dynamic>.from(e as Map))),
    ];
    final cloudViewed = <String>{
      if (cloud?['viewedLessons'] is List)
        ...List<dynamic>.from(cloud!['viewedLessons']).map((e) => e.toString()),
    };
    final cloudCompletedQuizzes = <String>{
      if (cloud?['completedQuizModules'] is List)
        ...List<dynamic>.from(cloud!['completedQuizModules']).map((e) => e.toString()),
    };
    final cloudFullAccess = cloud?['fullAccessPurchased'] == true;

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
    // Union local + cloud attempt records, deduping any attempt that
    // shows up in both (same score at the same timestamp), then sort
    // most-recent-first for display.
    final historyByKey = <String, FinalExamAttempt>{};
    for (final a in [...localFinalExamHistory, ...cloudFinalExamHistory]) {
      historyByKey[a._dedupeKey] = a;
    }
    final mergedFinalExamHistory = historyByKey.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    final mergedViewed = {...localViewed, ...cloudViewed};
    final mergedCompletedQuizzes = {...localCompletedQuizzes, ...cloudCompletedQuizzes};
    // Once purchased, always purchased — a purchase recorded on either
    // device (local or cloud) should never be "lost" by the merge, so
    // this is OR, not "whichever is more recent" the way scores are.
    final mergedFullAccess = localFullAccess || cloudFullAccess;

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
    await _setLocalFinalExamHistory(mergedFinalExamHistory);
    await _setLocalViewedLessons(mergedViewed);
    await _setLocalCompletedQuizModules(mergedCompletedQuizzes);
    await _setLocalFullAccess(mergedFullAccess);

    return (
      passed: mergedPassed,
      purchased: mergedPurchased,
      bestScores: mergedScores,
      finalExamScore: mergedFinalExam,
      finalExamHistory: mergedFinalExamHistory,
      viewedLessons: mergedViewed,
      completedQuizModules: mergedCompletedQuizzes,
      fullAccessPurchased: mergedFullAccess,
    );
  }

  // ── Public API (same shape as before — no other file needs to change) ───

  /// The one chapter available without purchase — deliberately a fixed,
  /// specific chapter (not random) so it can be consistently marketed
  /// ("Try Chapter 1 free") and always gives new users the same,
  /// representative first impression of the course.
  static const freePreviewChapterTitle = 'Chapter 1: Cybersecurity Fundamentals';

  static bool isChapterFreePreview(String moduleTitle) =>
      moduleTitle == freePreviewChapterTitle;

  /// True if the user should see every chapter, every practice quiz, and
  /// the Final Certification Exam unlocked — either because they're an
  /// admin (see [isAdmin]) or because they've purchased full access.
  static Future<bool> hasFullAccess() async {
    if (await isAdmin()) return true;
    final merged = await _getMergedProgress();
    return merged.fullAccessPurchased;
  }

  /// A single chapter is accessible if it's the free preview chapter, OR
  /// the user has full access (admin or purchased). Every other chapter,
  /// every other chapter's practice quiz, and the Final Exam should all
  /// be checked against [hasFullAccess] directly rather than this method,
  /// since they have no free-preview exception of their own.
  static Future<bool> canAccessChapter(String moduleTitle) async {
    if (isChapterFreePreview(moduleTitle)) return true;
    return hasFullAccess();
  }

  /// Marks full access as purchased. Call this from wherever your actual
  /// payment flow (Play Billing / App Store In-App Purchase) confirms a
  /// successful purchase — this method itself does NOT process any
  /// payment, the same way the pre-existing [markLevelPurchased] never
  /// did either. Wire this to your real billing SDK's purchase-success
  /// callback when that's implemented.
  static Future<void> markFullAccessPurchased() async {
    final merged = await _getMergedProgress();
    await _setLocalFullAccess(true);
    await _pushCloudData(
      passedLevels: merged.passed,
      purchasedLevels: merged.purchased,
      bestScores: merged.bestScores,
      fullAccessPurchased: true,
    );
  }

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
  /// exam is submitted (pass or fail) — every attempt is kept in history,
  /// while [getFinalExamBestScore] continues to track only the highest.
  static Future<void> markFinalExamAttempt(double scorePercent) async {
    final merged = await _getMergedProgress();
    final existingBest = merged.finalExamScore ?? 0;
    final newBest = scorePercent > existingBest ? scorePercent : existingBest;

    final newHistory = [
      FinalExamAttempt(scorePercent: scorePercent, date: DateTime.now()),
      ...merged.finalExamHistory,
    ];

    await _setLocalFinalExamScore(newBest);
    await _setLocalFinalExamHistory(newHistory);
    await _pushCloudData(
      passedLevels: merged.passed,
      purchasedLevels: merged.purchased,
      bestScores: merged.bestScores,
      finalExamScore: newBest,
      finalExamHistory: newHistory,
    );
  }

  /// The highest Final Certification Exam score achieved so far, or null
  /// if it has never been attempted.
  static Future<double?> getFinalExamBestScore() async {
    final merged = await _getMergedProgress();
    return merged.finalExamScore;
  }

  /// Every recorded Final Certification Exam attempt, most recent first.
  /// Empty if the exam has never been attempted.
  static Future<List<FinalExamAttempt>> getFinalExamHistory() async {
    final merged = await _getMergedProgress();
    return merged.finalExamHistory;
  }

  /// Convenience — total number of Final Certification Exam attempts made.
  static Future<int> getFinalExamAttemptCount() async {
    final merged = await _getMergedProgress();
    return merged.finalExamHistory.length;
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
    if (await isAdmin()) return null; // admins bypass every lock

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
  /// useful for testing the gating flow from scratch. Only clears data
  /// scoped to the CURRENT signed-in user — it was never correct for
  /// this to touch every device-wide key anyway, but that mattered even
  /// more once keys became per-user scoped.
  static Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_scoped(_passedKey));
    await prefs.remove(_scoped(_purchasedKey));
    await prefs.remove(_scoped(_finalExamScoreKey));
    await prefs.remove(_scoped(_finalExamHistoryKey));
    await prefs.remove(_scoped(_viewedLessonsKey));
    await prefs.remove(_scoped(_completedQuizModulesKey));
    final scopedScorePrefix = _scoped(_bestScoreKeyPrefix);
    final keys = prefs.getKeys().where((k) => k.startsWith(scopedScorePrefix));
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
