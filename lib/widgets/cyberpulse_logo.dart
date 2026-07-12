import 'package:flutter/material.dart';

/// The app's shield-and-pulse logo mark, drawn as a vector (CustomPainter)
/// rather than a raster image — stays crisp at any size and can be
/// recolored to match any theme, with no image asset to manage.
class CyberPulseLogo extends StatelessWidget {
  final double size;
  final Color lightShade;
  final Color darkShade;
  final Color outline;
  final Color pulseColor;
  final bool showBackgroundCircle;
  final Color backgroundCircleColor;

  const CyberPulseLogo({
    super.key,
    this.size = 96,
    this.lightShade = const Color(0xFF1E88E5),
    this.darkShade = const Color(0xFF0D47A1),
    this.outline = const Color(0xFF0A2E6B),
    this.pulseColor = Colors.white,
    this.showBackgroundCircle = false,
    this.backgroundCircleColor = const Color(0xFF1565C0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CyberPulseLogoPainter(
          lightShade: lightShade,
          darkShade: darkShade,
          outline: outline,
          pulseColor: pulseColor,
          showBackgroundCircle: showBackgroundCircle,
          backgroundCircleColor: backgroundCircleColor,
        ),
      ),
    );
  }
}

class _CyberPulseLogoPainter extends CustomPainter {
  final Color lightShade;
  final Color darkShade;
  final Color outline;
  final Color pulseColor;
  final bool showBackgroundCircle;
  final Color backgroundCircleColor;

  _CyberPulseLogoPainter({
    required this.lightShade,
    required this.darkShade,
    required this.outline,
    required this.pulseColor,
    required this.showBackgroundCircle,
    required this.backgroundCircleColor,
  });

  // Shield outline, expressed as fractions of the widget's own bounding
  // box (0..1) so the same path scales cleanly to any requested size.
  Path _shieldPath(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    path.moveTo(0.5 * w, 0);
    path.lineTo(1.0 * w, 0.1136 * h);
    path.lineTo(1.0 * w, 0.5 * h);
    path.cubicTo(1.0 * w, 0.75 * h, 0.833 * w, 0.909 * h, 0.5 * w, 1.0 * h);
    path.cubicTo(0.25 * w, 0.909 * h, 0 * w, 0.75 * h, 0 * w, 0.5 * h);
    path.lineTo(0, 0.1136 * h);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double pad = 0;
    if (showBackgroundCircle) {
      final circlePaint = Paint()..color = backgroundCircleColor;
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2,
        circlePaint,
      );
      pad = size.width * 0.16;
    }

    final shieldRect = Rect.fromLTWH(
      pad,
      pad + (showBackgroundCircle ? size.height * 0.04 : 0),
      size.width - pad * 2,
      size.height - pad * 2 - (showBackgroundCircle ? size.height * 0.04 : 0),
    );
    final shieldSize = shieldRect.size;

    canvas.save();
    canvas.translate(shieldRect.left, shieldRect.top);

    final shieldPath = _shieldPath(shieldSize);

    // Clip to the shield silhouette, then paint the two-tone halves inside it.
    canvas.save();
    canvas.clipPath(shieldPath);

    final leftPaint = Paint()..color = lightShade;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, shieldSize.width / 2, shieldSize.height),
      leftPaint,
    );
    final rightPaint = Paint()..color = darkShade;
    canvas.drawRect(
      Rect.fromLTWH(shieldSize.width / 2, 0, shieldSize.width / 2, shieldSize.height),
      rightPaint,
    );

    // Heartbeat pulse line through the center.
    final pulsePath = Path();
    final pts = [
      Offset(0, 0.523 * shieldSize.height),
      Offset(0.208 * shieldSize.width, 0.523 * shieldSize.height),
      Offset(0.292 * shieldSize.width, 0.364 * shieldSize.height),
      Offset(0.400 * shieldSize.width, 0.682 * shieldSize.height),
      Offset(0.483 * shieldSize.width, 0.455 * shieldSize.height),
      Offset(0.567 * shieldSize.width, 0.523 * shieldSize.height),
      Offset(1.000 * shieldSize.width, 0.523 * shieldSize.height),
    ];
    pulsePath.moveTo(pts.first.dx, pts.first.dy);
    for (final p in pts.skip(1)) {
      pulsePath.lineTo(p.dx, p.dy);
    }
    final pulsePaint = Paint()
      ..color = pulseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = shieldSize.width * 0.045
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(pulsePath, pulsePaint);

    canvas.restore(); // end clip

    // Outline stroke on top.
    final outlinePaint = Paint()
      ..color = outline
      ..style = PaintingStyle.stroke
      ..strokeWidth = shieldSize.width * 0.035;
    canvas.drawPath(shieldPath, outlinePaint);

    canvas.restore(); // end translate
  }

  @override
  bool shouldRepaint(covariant _CyberPulseLogoPainter oldDelegate) {
    return oldDelegate.lightShade != lightShade ||
        oldDelegate.darkShade != darkShade ||
        oldDelegate.outline != outline ||
        oldDelegate.pulseColor != pulseColor ||
        oldDelegate.showBackgroundCircle != showBackgroundCircle ||
        oldDelegate.backgroundCircleColor != backgroundCircleColor;
  }
}
