import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/cyberpulse_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D1B3E), Color(0xFF1565C0), Color(0xFF0D47A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Watermark pattern
          Positioned.fill(
            child: CustomPaint(painter: _SplashPatternPainter()),
          ),
          // Content
          Center(
            child: SizedBox(
              width: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo — the raster mark already includes the
                  // "CyberPulse Academy" wordmark, so it needs to render
                  // large enough to stay legible, and un-cropped (no
                  // circular mask, which would clip the ribbon/text).
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.4),
                          blurRadius: 40,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    child: const CyberPulseLogo(size: 240),
                  ),
                  const SizedBox(height: 20),
                  // App name
                  const Text(
                    'Learning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  const Text(
                    'CYBERSECURITY',
                    style: TextStyle(
                      color: Color(0xFF90CAF9),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 8,
                    ),
                  ),
                  const SizedBox(height: 18),
                  // Mission tagline
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'SaCyra makes cybersecurity practical, engaging, '
                      'and accessible for everyone.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Learn. Practise. Advocate.',
                      style:
                          TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 48),
                  const SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Vendor-neutral · Fundamentals to GRC',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Concentric circles emanating from logo area
    final center = Offset(size.width / 2, size.height * 0.35);
    for (double r = 60; r < size.width * 1.5; r += 60) {
      canvas.drawCircle(center, r, paint);
    }

    // Diagonal grid lines
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.03)
      ..strokeWidth = 1;
    for (double x = -size.height; x < size.width + size.height; x += 40) {
      canvas.drawLine(Offset(x, 0), Offset(x + size.height, size.height), linePaint);
    }

    // Dot grid
    final dotPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..style = PaintingStyle.fill;
    for (double x = 0; x < size.width; x += 30) {
      for (double y = 0; y < size.height; y += 30) {
        canvas.drawCircle(Offset(x, y), 1.5, dotPaint);
      }
    }

    // CYBERPULSE watermark text pattern
    final textStyle = const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: Color(0x08FFFFFF),
      letterSpacing: 3,
    );
    canvas.save();
    canvas.rotate(-math.pi / 8);
    for (double y = -size.height; y < size.height * 2; y += 60) {
      for (double x = -size.width; x < size.width * 2; x += 140) {
        final tp = TextPainter(
          text: TextSpan(text: 'LEARN CYBERSECURITY', style: textStyle),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(x, y));
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_) => false;
}
