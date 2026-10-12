import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/email_verification_screen.dart';
import 'screens/topics_screen.dart';
import 'screens/chat_screen.dart';
import 'services/chat_overlay_visibility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    // Firebase hasn't been configured yet (firebase_options.dart is still
    // the placeholder). The app still launches so the rest of the course
    // remains usable, but sign-in screens will show a clear error until
    // `flutterfire configure` has been run — see FIREBASE_SETUP.md.
    debugPrint('Firebase failed to initialize: $e');
  }
  runApp(const CyberPulseApp());
}

/// A global key onto MaterialApp's own Navigator — needed because the
/// context available inside MaterialApp's `builder` callback below
/// sits ABOVE the Navigator MaterialApp creates internally, not below
/// it. Navigator.of(context) from within builder has no Navigator
/// ancestor to find from that position in the tree and throws a null
/// check failure; navigatorKey.currentState sidesteps this entirely
/// by referencing the Navigator's state object directly, independent
/// of where in the tree the call happens to originate.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class CyberPulseApp extends StatelessWidget {
  const CyberPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Learning Cybersecurity',
      home: const _RootRouter(),
      // MaterialApp's builder wraps whatever the Navigator currently
      // shows — this is genuinely different from wrapping just
      // TopicsScreen itself, which would only cover the home screen
      // and disappear the moment anything (a lesson, a puzzle, the
      // exam) is pushed on top of it via Navigator.push. Using
      // builder here is what makes the icon float above every screen
      // in the app, matching what was actually asked for.
      builder: (context, child) {
        return Stack(
          children: [
            if (child != null) child,
            const _FloatingChatOverlay(),
          ],
        );
      },
    );
  }
}

/// The floating chatbot icon shown above every screen in the app —
/// only once the user is signed in, since the chatbot itself requires
/// authentication (see the Cloud Function's authPolicy). Listens to
/// authStateChanges independently of _RootRouter's own state, so it
/// stays correct through sign-in/sign-out without needing to thread
/// that state down from the router.
class _FloatingChatOverlay extends StatelessWidget {
  const _FloatingChatOverlay();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService.authStateChanges,
      builder: (context, snapshot) {
        final signedIn = snapshot.data != null;
        if (!signedIn) return const SizedBox.shrink();

        return ValueListenableBuilder<bool>(
          valueListenable: ChatOverlayVisibility.hidden,
          builder: (context, hidden, _) {
            if (hidden) return const SizedBox.shrink();
            return _buildFab(context);
          },
        );
      },
    );
  }

  Widget _buildFab(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 24 + MediaQuery.of(context).padding.bottom,
      child: FloatingActionButton(
        heroTag: 'globalChatButton',
        backgroundColor: const Color(0xFF1565C0),
        onPressed: () {
          rootNavigatorKey.currentState?.push(
            MaterialPageRoute(builder: (_) => const ChatScreen()),
          );
        },
        child: const Icon(Icons.auto_awesome, color: Colors.white),
      ),
    );
  }
}

/// Shows the branded splash screen first, then routes to sign-in, email
/// verification, or straight into the course, depending on sign-in AND
/// verification state — and keeps routing automatically as either
/// changes (e.g. immediately after a successful login, after sign-out,
/// or once a just-registered user actually verifies their email).
class _RootRouter extends StatefulWidget {
  const _RootRouter();

  @override
  State<_RootRouter> createState() => _RootRouterState();
}

class _RootRouterState extends State<_RootRouter> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) setState(() => _showSplash = false);
      // Requested here — after the splash screen completes, once the
      // Activity is genuinely visible on screen — rather than in
      // main() before runApp() even renders anything. Android's
      // permission dialog needs a live, resumed Activity to attach
      // to; requesting this early in the lifecycle can get silently
      // dropped with no dialog ever appearing, which is exactly what
      // happened when this lived in main(). Also moved off waiting
      // for puzzle opt-in specifically — previously, someone who
      // never touched puzzles would never even be asked at all.
      FirebaseMessaging.instance.requestPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Without this, pressing Back here falls through to Android's
    // default behavior once there's nothing left in the Navigator
    // stack to pop — which is finish(), fully destroying the Activity
    // and wiping all in-memory state (including _showSplash above,
    // which is exactly why reopening afterward showed the splash
    // screen again). Home button never touches the Activity at all,
    // which is why it behaved completely differently. canPop: false
    // + explicitly calling SystemNavigator.pop() instead makes Back
    // minimize the app the same way Home does, preserving state.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) SystemNavigator.pop();
      },
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (_showSplash) {
      return const SplashScreen();
    }
    return StreamBuilder(
      stream: AuthService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final user = snapshot.data;
        if (user == null) {
          return const AuthScreen();
        }

        // The critical gate that was missing entirely: only users who
        // have actually verified their email get into the course.
        // Deliberately reading FirebaseAuth.instance.currentUser here
        // rather than trusting `user.emailVerified` from the cached
        // stream snapshot — authStateChanges does NOT refire just
        // because emailVerified flips server-side after the user
        // clicks the link, so this needs a value that reflects the
        // latest `reload()` call, not a stale snapshot from sign-in time.
        final isVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;
        if (!isVerified) {
          return EmailVerificationScreen(
            onVerified: () {
              // authStateChanges won't emit a new event on its own here,
              // so force this router to rebuild — the rebuild re-reads
              // FirebaseAuth.instance.currentUser fresh (see above) and
              // will now see emailVerified == true, routing into the
              // course.
              setState(() {});
            },
          );
        }

        return const TopicsScreen();
      },
    );
  }
}
