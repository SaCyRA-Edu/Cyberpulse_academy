import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android_intent_plus/android_intent.dart';

/// Detects whether Indian English (en-IN) voice data is installed for
/// the device's TTS engine, and prompts the user to install it if not
/// — Android only. Android ships the TTS *engine* on every device, but
/// individual language/voice data packs are downloaded separately and
/// can be missing, especially on storage-constrained devices.
///
/// There is no way to force-install this automatically — Android only
/// lets the user do that themselves through system settings. This
/// class detects the gap and makes it easy to fix, nothing more.
class TtsVoiceCheckService {
  static const _promptShownKey = 'cp_tts_india_prompt_shown';
  static const _targetLocale = 'en-IN';

  static Future<bool> _isIndianEnglishInstalled(FlutterTts tts) async {
    if (!Platform.isAndroid) return true; // not applicable elsewhere
    try {
      final installed = await tts.isLanguageInstalled(_targetLocale);
      return installed == true;
    } catch (_) {
      // If the check itself fails, don't nag the user over something
      // we can't actually confirm — fail as "installed" rather than
      // showing a possibly-wrong warning.
      return true;
    }
  }

  /// Call this right before starting narration. Shows nothing if the
  /// voice is already installed. Otherwise: a full explanatory dialog
  /// the very first time this is ever hit for this device, and a
  /// lighter, quicker SnackBar reminder on every attempt after that
  /// (until the voice actually gets installed, at which point this
  /// stops firing entirely).
  static Future<void> checkAndPromptIfNeeded(BuildContext context, FlutterTts tts) async {
    if (!Platform.isAndroid) return;

    final installed = await _isIndianEnglishInstalled(tts);
    if (installed) return;
    if (!context.mounted) return;

    final prefs = await SharedPreferences.getInstance();
    final alreadyShownFullDialog = prefs.getBool(_promptShownKey) ?? false;

    if (!alreadyShownFullDialog) {
      await prefs.setBool(_promptShownKey, true);
      if (!context.mounted) return;
      await _showFullDialog(context);
    } else {
      if (!context.mounted) return;
      _showLightReminder(context);
    }
  }

  static Future<void> _showFullDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.record_voice_over, color: Colors.orange, size: 36),
        title: const Text('Indian English Voice Not Found'),
        content: const Text(
          'Your device doesn\'t have the Indian English (en-IN) voice pack '
          'installed for narration. Lessons will still play using whatever '
          'voice is available, but it may sound less natural.\n\n'
          'You can install it from your device\'s Text-to-Speech settings.',
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Not Now'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              openAndroidTtsSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  static void _showLightReminder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Indian English voice still isn\'t installed on this device.'),
        action: SnackBarAction(label: 'Install', onPressed: openAndroidTtsSettings),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  /// Opens Android's system Text-to-Speech settings screen, where the
  /// user can install additional voice data — the actual install step
  /// has to happen there; there's no way to trigger it directly from
  /// the app.
  static void openAndroidTtsSettings() {
    if (!Platform.isAndroid) return;
    const intent = AndroidIntent(action: 'com.android.settings.TTS_SETTINGS');
    intent.launch();
  }
}
