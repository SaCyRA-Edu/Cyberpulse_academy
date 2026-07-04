import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A diagonal, repeating "CYBERPULSE" watermark painted very faintly behind
/// content. Wrap any screen's Stack with this as the bottom-most layer.
class CyberPulseWatermark extends StatelessWidget {
  final Color color;
  final double opacity;

  const CyberPulseWatermark({
    super.key,
    this.color = const Color(0xFF003580),
    this.opacity = 0.035,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _WatermarkPainter(color: color, opacity: opacity),
        size: Size.infinite,
      ),
    );
  }
}

class _WatermarkPainter extends CustomPainter {
  final Color color;
  final double opacity;

  _WatermarkPainter({required this.color, required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color.withValues(alpha: opacity),
      letterSpacing: 3,
    );

    const rowH = 64.0;
    const colW = 150.0;
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-math.pi / 8);
    canvas.translate(-size.width / 2, -size.height / 2);

    for (double y = -size.height; y < size.height * 2; y += rowH) {
      final offset = (y / rowH).floor().isEven ? 0.0 : colW / 2;
      for (double x = -size.width + offset; x < size.width * 2; x += colW) {
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
  bool shouldRepaint(covariant _WatermarkPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.opacity != opacity;
}
