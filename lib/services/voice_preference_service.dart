import 'package:shared_preferences/shared_preferences.dart';

enum VoiceGender { female, male }

/// Persists the learner's preferred narrator voice gender across lessons.
class VoicePreferenceService {
  static const _key = 'cp_voice_gender_preference';

  static Future<VoiceGender> getPreferredGender() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    return stored == 'male' ? VoiceGender.male : VoiceGender.female;
  }

  static Future<void> setPreferredGender(VoiceGender gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, gender == VoiceGender.male ? 'male' : 'female');
  }
}
