import 'dart:ui' show PlatformDispatcher;

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Tiny first-party event log. Sends a handful of whitelisted event
/// names to the `logAppEvent` Cloud Function, which stores them so the
/// Admin Report can show daily activity. Fire-and-forget and fully
/// best-effort: it never throws and never blocks the UI.
///
/// Allowed names (must match ALLOWED_APP_EVENTS in functions/index.ts):
/// app_open, puzzle_opened, puzzle_answered, notification_opened.
class AnalyticsLog {
  static bool _appOpenLoggedThisSession = false;

  static Future<void> log(String name) async {
    if (FirebaseAuth.instance.currentUser == null) return;
    try {
      final payload = <String, dynamic>{'name': name};
      if (name == 'app_open') {
        // Coarse location only: the phone's region setting and time zone.
        // No permission prompt and no GPS.
        final country = PlatformDispatcher.instance.locale.countryCode;
        if (country != null && country.isNotEmpty) payload['country'] = country;
        payload['timeZone'] = DateTime.now().timeZoneName;
      }
      await FirebaseFunctions.instance.httpsCallable('logAppEvent').call(payload);
    } catch (_) {
      // Offline or unreachable — analytics must never affect the app.
    }
  }

  /// Logs `app_open` once per app session (not on every home-screen
  /// rebuild), so "daily active users" counts people, not rebuilds.
  static void logAppOpenOnce() {
    if (_appOpenLoggedThisSession) return;
    _appOpenLoggedThisSession = true;
    log('app_open');
  }
}
