import 'package:flutter/material.dart';

/// The app's official shield-and-ribbon logo mark.
///
/// This renders the actual CyberPulse Academy brand image
/// (assets/images/cyberpulse_logo.png) rather than a vector drawing. The
/// public API is kept identical to the previous CustomPainter-based
/// version — [size], [showBackgroundCircle], [backgroundCircleColor], and
/// the shade/outline/pulse color parameters all still exist — so every
/// existing call site across the app keeps compiling unchanged.
///
/// Note: the source artwork bakes in the "CYBERPULSE ACADEMY" wordmark and
/// "A SACYRA COMPANY" tagline, so it reads clearly at splash-screen sizes
/// (100px+) but the text becomes illegible at small icon sizes (e.g. a
/// 24px app bar icon). If a small-icon-only usage ever looks too busy,
/// crop a shield-only variant for that specific spot rather than shrinking
/// this asset further.
class CyberPulseLogo extends StatelessWidget {
  final double size;

  /// Retained for API compatibility with the previous vector logo.
  /// The raster artwork is pre-colored, so these no longer tint the mark,
  /// but are kept so existing call sites don't need to change.
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
    final image = Image.asset(
      'assets/images/cyberpulse_logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );

    if (!showBackgroundCircle) return image;

    // Preserve the circular badge treatment some call sites (e.g. the
    // splash screen) rely on, now sitting behind the raster logo instead
    // of the old vector shield.
    final pad = size * 0.08;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundCircleColor,
      ),
      padding: EdgeInsets.all(pad),
      child: Image.asset(
        'assets/images/cyberpulse_logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
