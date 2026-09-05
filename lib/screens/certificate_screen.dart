import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/cyberpulse_logo.dart';

class CertificateScreen extends StatefulWidget {
  final double scorePercentage;

  /// The actual moment the exam was completed/passed. Optional and
  /// defaults to "now" if not provided (e.g. the debug preview button,
  /// which has no real exam attempt behind it) — but whenever this
  /// screen is reached from an actual passed exam, the caller should
  /// pass the real completion time here. Without this, the certificate
  /// previously showed whatever date happened to be "now" at the
  /// moment someone VIEWED it, rather than the date they actually
  /// passed — causing it to silently disagree with the exam history
  /// list if viewed even a day later.
  final DateTime? dateIssued;

  const CertificateScreen({super.key, required this.scorePercentage, this.dateIssued});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey _certificateKey = GlobalKey();
  bool _generated = false;
  bool _sharing = false;

  // Whether we're still checking for a stored legal name before
  // deciding whether to show the manual entry screen at all.
  bool _checkingStoredName = true;

  static const _navy = Color(0xFF0D1B3E);
  static const _blue = Color(0xFF1565C0);
  static const _gold = Color(0xFFD4AF37);

  @override
  void initState() {
    super.initState();
    _loadStoredLegalName();
  }

  /// Reads the legal name captured once at signup (see auth_screen.dart)
  /// and, if found, skips the manual name-entry screen entirely —
  /// generating the certificate immediately. Falls back to asking
  /// manually only if no stored name exists, which covers accounts
  /// created before this feature existed, or via Google/Facebook
  /// sign-in (which doesn't currently go through the signup form that
  /// captures this field).
  Future<void> _loadStoredLegalName() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      setState(() => _checkingStoredName = false);
      return;
    }
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('progress')
          .doc('summary')
          .get();
      final storedName = (doc.data()?['legalName'] as String?)?.trim();
      if (storedName != null && storedName.isNotEmpty) {
        _nameController.text = storedName;
        setState(() {
          _generated = true;
          _checkingStoredName = false;
        });
        return;
      }
    } catch (_) {
      // Offline or unreachable — fall through to manual entry below
      // rather than getting stuck on a permanent loading state.
    }
    setState(() => _checkingStoredName = false);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String get _formattedDate {
    final date = (widget.dateIssued ?? DateTime.now()).toLocal();
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Renders the certificate widget (via its RepaintBoundary) to a PNG
  /// image in memory, then hands it to the OS share sheet — which is
  /// where the actual "LinkedIn / Facebook / Email / etc." choice lives.
  /// Flutter apps don't (and shouldn't) integrate each social platform's
  /// SDK individually for this; the native share sheet already lists
  /// every installed app capable of receiving an image, and the user
  /// picks whichever they want each time.
  Future<void> _shareCertificate() async {
    if (_sharing) return;
    setState(() => _sharing = true);
    try {
      final boundary =
          _certificateKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;

      // pixelRatio 3.0 renders at roughly 3x the on-screen size, so the
      // shared image looks sharp even on a large display, not just
      // pixel-for-pixel with the phone screen it was captured on.
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;
      final pngBytes = byteData.buffer.asUint8List();

      final file = XFile.fromData(
        pngBytes,
        mimeType: 'image/png',
        name: 'cyberpulse_certificate.png',
      );

      await Share.shareXFiles(
        [file],
        text: 'I just earned my Certificate of Achievement from '
            'CyberPulse Academy with a score of '
            '${widget.scorePercentage.toStringAsFixed(1)}%!',
        subject: 'CyberPulse Academy Certificate of Achievement',
      );
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      appBar: AppBar(
        title: const Text('Certificate of Achievement'),
        backgroundColor: _navy,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: _checkingStoredName
                ? const Padding(
                    padding: EdgeInsets.all(40),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : (_generated ? _buildCertificate() : _buildNameEntry()),
          ),
        ),
      ),
    );
  }

  Widget _buildNameEntry() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CyberPulseLogo(size: 88),
        const SizedBox(height: 20),
        const Text(
          'Enter your name exactly as you\'d like it to appear on your certificate.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 6),
        Text(
          'We\'ll remember this for next time.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _nameController,
          textCapitalization: TextCapitalization.words,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            labelText: 'Full Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: _blue, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: _blue,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: _nameController.text.trim().isEmpty
                ? null
                : () async {
                    setState(() => _generated = true);
                    // Save for next time — this specifically closes
                    // the gap for accounts that never went through
                    // the signup form's legal-name field (Google/
                    // Facebook sign-in, or accounts created before
                    // this feature existed). Fire-and-forget: doesn't
                    // block showing the certificate, and a failure
                    // here just means asking again next time, not a
                    // broken certificate now.
                    final uid = FirebaseAuth.instance.currentUser?.uid;
                    if (uid != null) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .collection('progress')
                          .doc('summary')
                          .set(
                        {'legalName': _nameController.text.trim()},
                        SetOptions(merge: true),
                      );
                    }
                  },
            child: const Text('Generate Certificate'),
          ),
        ),
      ],
    );
  }

  Widget _buildCertificate() {
    final name = _nameController.text.trim();
    return Column(
      children: [
        // No fixed aspect ratio or forced height anywhere below — every
        // box sizes itself to its actual content (mainAxisSize.min,
        // normal top-to-bottom flow with SizedBox spacers instead of
        // spaceBetween inside a rigid box). This is the fix for the
        // "BOTTOM OVERFLOWED" crash: a previous version forced a fixed
        // 3:2 box and let text spaceBetween-stretch inside it, which
        // broke the moment content was taller than that box happened to
        // be on a given screen width. Content-driven sizing can't
        // overflow regardless of name length, description wrapping, or
        // screen width.
        RepaintBoundary(
          key: _certificateKey,
          child: Container(
          width: 360,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_navy, _blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: _blue.withValues(alpha: 0.3), blurRadius: 24, offset: const Offset(0, 10)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                // Abstract brand-toned decorative shapes — painted to
                // whatever size the content Column below ends up being,
                // via Positioned.fill sizing to the Stack's resolved
                // size (which itself comes from the non-positioned
                // content Column, not from this background).
                Positioned.fill(child: CustomPaint(painter: _AbstractShapesPainter())),

                // Content — this Column is the ONLY non-positioned
                // direct child of the Stack, so it determines the
                // Stack's size. Everything sizes naturally from here.
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo badge
                    Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.97),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 8, offset: const Offset(0, 3)),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CyberPulseLogo(size: 24),
                          SizedBox(height: 2),
                          Text(
                            'CyberPulse\nAcademy',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 6.5, fontWeight: FontWeight.bold, color: _navy, height: 1.1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // White content card — height determined entirely
                    // by its own children, no forced size anywhere.
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 16, offset: const Offset(0, 6)),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(22, 22, 22, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header: CERTIFICATE / OF ACHIEVEMENT | name
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CERTIFICATE',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: _navy,
                                      height: 1.1,
                                    ),
                                  ),
                                  Text(
                                    'OF ACHIEVEMENT',
                                    style: TextStyle(
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF757575),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 14),
                              Container(width: 3, height: 46, color: _blue, margin: const EdgeInsets.only(top: 4)),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'PRESENTED TO',
                                      style: TextStyle(
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF757575),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                        color: _blue,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Description
                          Text(
                            'This certifies successful completion of the Final '
                            'Certification Exam with a score of '
                            '${widget.scorePercentage.toStringAsFixed(1)}%, demonstrating '
                            'comprehensive knowledge across the full CyberPulse '
                            'Academy curriculum, awarded $_formattedDate.',
                            style: const TextStyle(fontSize: 11.5, color: Color(0xFF37474F), height: 1.5),
                          ),
                          const SizedBox(height: 20),

                          // Footer: signature line | medal | signature line
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: _AuthoritySignatureBlock(
                                  authorizedName: 'Sacyra Education',
                                ),
                              ),
                              const SizedBox(width: 10),
                              const _StarburstMedal(color: _gold, ribbonColor: _navy),
                              const SizedBox(width: 10),
                              Expanded(child: _SignatureBlock(label: 'Date Issued', value: _formattedDate)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: _blue,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: _sharing ? null : _shareCertificate,
            icon: _sharing
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.share),
            label: Text(_sharing ? 'Preparing...' : 'Share Certificate'),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => _generated = false),
          child: const Text('Edit Name', style: TextStyle(color: _blue)),
        ),
      ],
    );
  }
}

/// Shows the actual signature image of the authorized person at Sacyra
/// Education, positioned above the "Verified By" line and name — this
/// is what makes the certificate look genuinely signed, rather than
/// just stating a name in plain text.
///
/// Fetched from Firebase Storage (path: Signatures/authorized_signature.png)
/// rather than bundled into the app, so it can be swapped out anytime
/// (a different authorized person, an updated signature) just by
/// replacing the file in Storage — no app rebuild or store
/// resubmission needed.
class _AuthoritySignatureBlock extends StatelessWidget {
  final String authorizedName;
  const _AuthoritySignatureBlock({required this.authorizedName});

  static Future<String>? _cachedUrl;

  static Future<String> _resolveUrl() {
    // Only cache a SUCCESSFUL resolution — caching the raw Future
    // directly (via ??=) meant that if the very first attempt failed
    // (e.g. tested before the file was uploaded, or before the
    // Storage rule was published), that failed Future stayed cached
    // for the rest of the app session, silently blocking every
    // future attempt from ever retrying, even after the real problem
    // was fixed. This version only writes to the cache once a real
    // URL has actually come back.
    if (_cachedUrl != null) return _cachedUrl!;
    final future = FirebaseStorage.instance.ref('Signatures/authorized_signature.png').getDownloadURL();
    future.then((url) => _cachedUrl = Future.value(url));
    return future;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 32,
          child: FutureBuilder<String>(
            future: _resolveUrl(),
            builder: (context, snapshot) {
              // Degrades gracefully to just an empty space (then the
              // text-only block below) if the signature is still
              // loading, missing from Storage, or unreachable —
              // never crashes or blocks rendering the rest of the
              // certificate.
              if (!snapshot.hasData) return const SizedBox.shrink();
              return CachedNetworkImage(
                imageUrl: snapshot.data!,
                fit: BoxFit.contain,
                alignment: Alignment.bottomLeft,
                errorWidget: (context, url, error) => const SizedBox.shrink(),
                placeholder: (context, url) => const SizedBox.shrink(),
              );
            },
          ),
        ),
        const SizedBox(height: 2),
        Container(height: 1, color: const Color(0xFF37474F)),
        const SizedBox(height: 6),
        const Text('Verified By',
            style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF0D1B3E))),
        Text(
          authorizedName,
          style: const TextStyle(fontSize: 9.5, color: Color(0xFF757575)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _SignatureBlock extends StatelessWidget {
  final String label;
  final String value;
  const _SignatureBlock({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Matches the 32px image + 2px gap reserved above the line in
        // _AuthoritySignatureBlock (the "Verified By" block next to
        // this one in the footer row) — without this, the two
        // horizontal signature lines sit at different heights, making
        // the footer look visually lopsided even though nothing is
        // technically broken.
        const SizedBox(height: 34),
        Container(height: 1, color: const Color(0xFF37474F)),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF0D1B3E))),
        Text(
          value,
          style: const TextStyle(fontSize: 9.5, color: Color(0xFF757575)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// A circular starburst medal (spiky outer edge, like a rosette seal)
/// with a two-tailed ribbon hanging below it — built entirely from
/// Flutter shapes (CustomPainter), given a fixed, known SizedBox so it
/// can never affect the surrounding layout's height calculation.
class _StarburstMedal extends StatelessWidget {
  final Color color;
  final Color ribbonColor;
  const _StarburstMedal({required this.color, required this.ribbonColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 70,
      child: CustomPaint(
        painter: _StarburstMedalPainter(medalColor: color, ribbonColor: ribbonColor),
      ),
    );
  }
}

class _StarburstMedalPainter extends CustomPainter {
  final Color medalColor;
  final Color ribbonColor;
  _StarburstMedalPainter({required this.medalColor, required this.ribbonColor});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    const cy = 23.0;
    const outerR = 21.0;
    const innerR = 16.5;
    const points = 13;

    final ribbonPaint = Paint()..color = ribbonColor;
    final leftTail = Path()
      ..moveTo(cx - 10, cy + 9)
      ..lineTo(cx - 10, size.height)
      ..lineTo(cx, size.height - 10)
      ..lineTo(cx, cy + 9)
      ..close();
    canvas.drawPath(leftTail, ribbonPaint);
    final rightTail = Path()
      ..moveTo(cx, cy + 9)
      ..lineTo(cx, size.height - 10)
      ..lineTo(cx + 10, size.height)
      ..lineTo(cx + 10, cy + 9)
      ..close();
    canvas.drawPath(rightTail, Paint()..color = ribbonColor.withValues(alpha: 0.8));

    final starPath = Path();
    for (var i = 0; i < points * 2; i++) {
      final angle = (i * math.pi) / points;
      final r = i.isEven ? outerR : innerR;
      final x = cx + r * math.cos(angle - math.pi / 2);
      final y = cy + r * math.sin(angle - math.pi / 2);
      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }
    }
    starPath.close();
    canvas.drawPath(starPath, Paint()..color = medalColor);

    canvas.drawCircle(Offset(cx, cy), innerR - 1, Paint()..color = Colors.white);
    canvas.drawCircle(
      Offset(cx, cy),
      innerR - 4.5,
      Paint()
        ..color = medalColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.1,
    );
    canvas.drawCircle(Offset(cx, cy), innerR - 5.5, Paint()..color = medalColor);

    _drawStar(canvas, Offset(cx, cy), 6, Colors.white);
  }

  void _drawStar(Canvas canvas, Offset center, double r, Color color) {
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final angle = (i * math.pi) / 5;
      final radius = i.isEven ? r : r * 0.45;
      final x = center.dx + radius * math.cos(angle - math.pi / 2);
      final y = center.dy + radius * math.sin(angle - math.pi / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _StarburstMedalPainter oldDelegate) => false;
}

/// Abstract brand-toned decorative shapes filling the background —
/// scales automatically to whatever size the Stack resolves to (driven
/// by the content Column, not by this painter).
class _AbstractShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    void blob(Offset center, double r, Color color, double opacity) {
      canvas.drawCircle(center, r, Paint()..color = color.withValues(alpha: opacity));
    }

    blob(Offset(w * 0.75, h * 0.08), w * 0.14, const Color(0xFF1E88E5), 0.35);
    blob(Offset(w * 0.95, h * 0.85), w * 0.16, const Color(0xFF1565C0), 0.3);

    final tealBlob = Path()
      ..moveTo(w * 0.55, -h * 0.05)
      ..quadraticBezierTo(w * 0.85, -h * 0.03, w * 1.02, h * 0.18)
      ..quadraticBezierTo(w * 1.05, h * 0.30, w * 0.95, h * 0.40)
      ..lineTo(w * 0.55, -h * 0.05)
      ..close();
    canvas.drawPath(tealBlob, Paint()..color = const Color(0xFF26C6DA).withValues(alpha: 0.25));

    final cyanBlob = Path()
      ..moveTo(-w * 0.05, h * 0.95)
      ..quadraticBezierTo(w * 0.08, h * 0.78, w * 0.22, h * 0.94)
      ..quadraticBezierTo(w * 0.28, h * 1.02, w * 0.15, h * 1.02)
      ..lineTo(-w * 0.05, h * 1.02)
      ..close();
    canvas.drawPath(cyanBlob, Paint()..color = const Color(0xFF4FC3F7).withValues(alpha: 0.2));

    final linePaint = Paint()
      ..color = const Color(0xFF26C6DA).withValues(alpha: 0.25)
      ..strokeWidth = 1;
    for (var i = 0; i < 4; i++) {
      final offset = i * (w * 0.05);
      canvas.drawLine(
        Offset(w * 0.6 + offset, 0),
        Offset(w, h * 0.18 - offset * 0.5),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _AbstractShapesPainter oldDelegate) => false;
}
