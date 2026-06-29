import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CyberPulseApp());
}

class CyberPulseApp extends StatelessWidget {
  const CyberPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CyberPulse Academy',
      home: const SplashScreen(),
    );
  }
}