import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../screens/puzzle_screen.dart';
import 'analytics_log.dart';

/// Makes tapping a push notification open the right screen.
///
/// Before this existed, tapping "Today's puzzle is live!" only opened
/// the app on the home screen, because nothing listened for the tap.
///
/// How it works:
///  - [init] is called once from main.dart (after the splash screen).
///    It checks whether the app was LAUNCHED by a notification tap
///    (getInitialMessage) and listens for taps while the app is in the
///    background (onMessageOpenedApp).
///  - The target screen is remembered as "pending".
///  - [openPendingIfReady] opens it as soon as the user is signed in
///    and the home screen is on screen (TopicsScreen calls it).
///
/// The server sends `data: { screen: "puzzle" }` with the daily puzzle
/// notification. Older notifications without that field are still
/// recognised by a title containing "puzzle".
class NotificationRouter {
  static GlobalKey<NavigatorState>? _navKey;
  static String? _pendingScreen;
  static bool _initialized = false;

  static Future<void> init(GlobalKey<NavigatorState> navKey) async {
    if (_initialized) return;
    _initialized = true;
    _navKey = navKey;
    try {
      final initial = await FirebaseMessaging.instance.getInitialMessage();
      if (initial != null) _remember(initial);
    } catch (_) {}
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _remember(message);
      openPendingIfReady();
    });
  }

  static String? _screenFor(RemoteMessage message) {
    final screen = message.data['screen'];
    if (screen is String && screen.isNotEmpty) return screen;
    final title = (message.notification?.title ?? '').toLowerCase();
    if (title.contains('puzzle')) return 'puzzle';
    return null;
  }

  static void _remember(RemoteMessage message) {
    final screen = _screenFor(message);
    if (screen == null) return;
    _pendingScreen = screen;
    AnalyticsLog.log('notification_opened');
  }

  /// Opens the remembered screen, if any. Returns true when it opened
  /// something, so callers can skip other pop-ups for this launch.
  static bool openPendingIfReady() {
    final screen = _pendingScreen;
    final navigator = _navKey?.currentState;
    if (screen == null || navigator == null) return false;
    if (FirebaseAuth.instance.currentUser == null) return false;
    _pendingScreen = null;
    switch (screen) {
      case 'puzzle':
        navigator.push(MaterialPageRoute(builder: (_) => const PuzzleScreen()));
        return true;
      default:
        return false;
    }
  }
}
