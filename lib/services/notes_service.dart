import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists free-text notes a learner writes against a specific lesson,
/// keyed by a stable "moduleTitle::lessonTitle" string so notes don't
/// collide between lessons that share a title (e.g. every module has a
/// "Practice Quiz").
///
/// Storage model: a local SharedPreferences cache for instant, fully
/// offline-capable reads/writes, backed by Firestore as the
/// cross-device source of truth — the same pattern already used for
/// exam progress in ProgressService. Firestore's own SDK also keeps an
/// offline cache, so writes made while offline queue up and sync
/// automatically once connectivity returns.
class NotesService {
  static String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  /// Every local key MUST go through this. Without it, two different
  /// accounts signed in on the same device would read and overwrite
  /// each other's notes — the exact bug this class previously had,
  /// matching what was found and fixed in ProgressService.
  static String _localKey(String moduleTitle, String lessonTitle) =>
      '${_uid ?? "guest"}_cp_notes_${moduleTitle}_$lessonTitle';

  /// Firestore document IDs can't contain '/', so this defensively
  /// strips any that might appear in a title, even though none of the
  /// current chapter/lesson titles actually do.
  static String _cloudDocId(String moduleTitle, String lessonTitle) =>
      '${moduleTitle}__$lessonTitle'.replaceAll('/', '-');

  static DocumentReference<Map<String, dynamic>>? _cloudDoc(
      String moduleTitle, String lessonTitle) {
    final uid = _uid;
    if (uid == null) return null;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('notes')
        .doc(_cloudDocId(moduleTitle, lessonTitle));
  }

  static Future<String> _getLocalNote(String moduleTitle, String lessonTitle) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localKey(moduleTitle, lessonTitle)) ?? '';
  }

  static Future<void> _setLocalNote(
      String moduleTitle, String lessonTitle, String note) async {
    final prefs = await SharedPreferences.getInstance();
    if (note.trim().isEmpty) {
      await prefs.remove(_localKey(moduleTitle, lessonTitle));
    } else {
      await prefs.setString(_localKey(moduleTitle, lessonTitle), note);
    }
  }

  /// Returns the note for this lesson. Prefers Firestore (so edits made
  /// on another device show up here too), falling back to the local
  /// cache if signed out, offline, or the Firestore read fails for any
  /// reason — this method should never throw or leave the UI stuck.
  static Future<String> getNote(String moduleTitle, String lessonTitle) async {
    final localNote = await _getLocalNote(moduleTitle, lessonTitle);

    final doc = _cloudDoc(moduleTitle, lessonTitle);
    if (doc == null) return localNote; // signed out — local only

    try {
      final snap = await doc.get();
      final cloudNote = snap.data()?['text'] as String?;

      if (cloudNote != null) {
        // Keep the local cache in sync with what Firestore actually has,
        // so the next offline read (or the next getNote call) is
        // instant and correct without needing a network round trip.
        if (cloudNote != localNote) {
          await _setLocalNote(moduleTitle, lessonTitle, cloudNote);
        }
        return cloudNote;
      }

      // No cloud document yet, but a local note exists — this is the
      // one-time migration path for notes written before Firestore sync
      // existed. Push it up so it starts syncing going forward.
      if (localNote.isNotEmpty) {
        await doc.set({
          'text': localNote,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
      return localNote;
    } catch (_) {
      // Offline or Firestore unreachable — the local cache (which may
      // itself be empty) is the best available answer right now.
      return localNote;
    }
  }

  /// Saves the note both locally (instant, always succeeds) and to
  /// Firestore (so it syncs to other devices). The Firestore write is
  /// fire-and-forget with respect to the caller — if it's offline,
  /// Firestore's own SDK queues the write and sends it once back
  /// online, same as the rest of this app's cloud sync.
  static Future<void> saveNote(
      String moduleTitle, String lessonTitle, String note) async {
    await _setLocalNote(moduleTitle, lessonTitle, note);

    final doc = _cloudDoc(moduleTitle, lessonTitle);
    if (doc == null) return; // signed out — local save above is enough

    try {
      if (note.trim().isEmpty) {
        await doc.delete();
      } else {
        await doc.set({
          'text': note,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
    } catch (_) {
      // Local save already succeeded, so the note isn't lost — this
      // will naturally reconcile next time getNote() runs online.
    }
  }
}
