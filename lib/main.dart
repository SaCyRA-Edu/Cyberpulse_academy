import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/email_verification_screen.dart';
import 'screens/topics_screen.dart';

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

class CyberPulseApp extends StatelessWidget {
  const CyberPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning Cybersecurity',
      home: const _RootRouter(),
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
    });
  }

  @override
  Widget build(BuildContext context) {
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
