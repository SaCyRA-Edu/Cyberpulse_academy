import 'package:flutter/foundation.dart';

/// Controls whether the global floating chatbot icon (see main.dart's
/// _FloatingChatOverlay) is shown. Defaults to visible everywhere;
/// screens that need it hidden — the Final Certification Exam and
/// practice quizzes specifically, since a chatbot floating over a
/// timed assessment is an obvious way to look up answers — set this
/// to true in initState() and MUST set it back to false in dispose(),
/// or the icon stays hidden app-wide after leaving that screen.
///
/// A plain ValueNotifier rather than anything more elaborate,
/// deliberately: this is a single global on/off switch, not
/// per-screen state that needs its own model.
class ChatOverlayVisibility {
  static final ValueNotifier<bool> hidden = ValueNotifier(false);
}
