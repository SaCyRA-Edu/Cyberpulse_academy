import 'package:shared_preferences/shared_preferences.dart';

/// Persists free-text notes a learner writes against a specific lesson,
/// keyed by a stable "moduleTitle::lessonTitle" string so notes don't
/// collide between lessons that share a title (e.g. every module has a
/// "Practice Quiz").
class NotesService {
  static String _key(String moduleTitle, String lessonTitle) =>
      'cp_notes_${moduleTitle}_$lessonTitle';

  static Future<String> getNote(String moduleTitle, String lessonTitle) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key(moduleTitle, lessonTitle)) ?? '';
  }

  static Future<void> saveNote(
      String moduleTitle, String lessonTitle, String note) async {
    final prefs = await SharedPreferences.getInstance();
    if (note.trim().isEmpty) {
      await prefs.remove(_key(moduleTitle, lessonTitle));
    } else {
      await prefs.setString(_key(moduleTitle, lessonTitle), note);
    }
  }
}
