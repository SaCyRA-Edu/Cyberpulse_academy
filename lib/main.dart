import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
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

/// Shows the branded splash screen first, then routes to either the sign-in
/// screen or straight into the course, depending on whether a user is
/// already signed in — and keeps routing automatically as sign-in state
/// changes (e.g. immediately after a successful login, or after sign-out).
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
        final signedIn = snapshot.data != null;
        return signedIn ? const TopicsScreen() : const AuthScreen();
      },
    );
  }
}
