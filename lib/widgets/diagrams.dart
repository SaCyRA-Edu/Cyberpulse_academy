import 'dart:math' as math;
import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════════════
// Diagram specification — attached to a LessonSection to render a visual
// ═══════════════════════════════════════════════════════════════════════

enum DiagramType {
  ciaTriad,
  defenseInDepth,
  authFactors,
  riskFormula,
  processFlow,
  killChain,
}

class DiagramSpec {
  final DiagramType type;
  final List<String>? steps; // used by processFlow
  final String? caption;

  const DiagramSpec({required this.type, this.steps, this.caption});
}

/// Dispatches to the correct diagram widget based on [spec.type].
class DiagramView extends StatelessWidget {
  final DiagramSpec spec;

  const DiagramView({super.key, required this.spec});

  @override
  Widget build(BuildContext context) {
    Widget diagram;
    switch (spec.type) {
      case DiagramType.ciaTriad:
        diagram = const CiaTriadDiagram();
        break;
      case DiagramType.defenseInDepth:
        diagram = const DefenseInDepthDiagram();
        break;
      case DiagramType.authFactors:
        diagram = const AuthFactorsDiagram();
        break;
      case DiagramType.riskFormula:
        diagram = const RiskFormulaDiagram();
        break;
      case DiagramType.killChain:
        diagram = const KillChainDiagram();
        break;
      case DiagramType.processFlow:
        diagram = ProcessFlowDiagram(steps: spec.steps ?? const []);
        break;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          diagram,
          if (spec.caption != null) ...[
            const SizedBox(height: 12),
            Text(
              spec.caption!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// CIA Triad — circle divided into 3 equal sections
// ═══════════════════════════════════════════════════════════════════════

class CiaTriadDiagram extends StatelessWidget {
  const CiaTriadDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          width: 240,
          child: CustomPaint(painter: _CiaTriadPainter()),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: const [
            _LegendDot(color: Color(0xFF1565C0), label: 'Confidentiality'),
            _LegendDot(color: Color(0xFF2E7D32), label: 'Integrity'),
            _LegendDot(color: Color(0xFFEF6C00), label: 'Availability'),
          ],
        ),
      ],
    );
  }
}

class _CiaTriadPainter extends CustomPainter {
  static const colors = [
    Color(0xFF1565C0), // Confidentiality
    Color(0xFF2E7D32), // Integrity
    Color(0xFFEF6C00), // Availability
  ];
  static const labels = ['C', 'I', 'A'];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    const sliceAngle = 2 * math.pi / 3;
    const startOffset = -math.pi / 2; // start at top

    for (var i = 0; i < 3; i++) {
      final paint = Paint()..color = colors[i];
      final startAngle = startOffset + i * sliceAngle;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sliceAngle,
        true,
        paint,
      );
    }

    // Divider lines
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;
    for (var i = 0; i < 3; i++) {
      final angle = startOffset + i * sliceAngle;
      canvas.drawLine(
        center,
        Offset(center.dx + radius * math.cos(angle),
            center.dy + radius * math.sin(angle)),
        linePaint,
      );
    }

    // Center circle (white) with shield
    final centerPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius * 0.32, centerPaint);

    final iconPainter = TextPainter(
      text: const TextSpan(
        text: '🛡',
        style: TextStyle(fontSize: 34),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    iconPainter.paint(
      canvas,
      Offset(center.dx - iconPainter.width / 2,
          center.dy - iconPainter.height / 2),
    );

    // Labels in each slice
    for (var i = 0; i < 3; i++) {
      final midAngle = startOffset + (i + 0.5) * sliceAngle;
      final labelRadius = radius * 0.68;
      final pos = Offset(
        center.dx + labelRadius * math.cos(midAngle),
        center.dy + labelRadius * math.sin(midAngle),
      );
      final tp = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(pos.dx - tp.width / 2, pos.dy - tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Defense in Depth — layered pyramid of security controls
// ═══════════════════════════════════════════════════════════════════════

class DefenseInDepthDiagram extends StatelessWidget {
  const DefenseInDepthDiagram({super.key});

  static const layers = [
    ('Perimeter', Icons.fence, Color(0xFF1A237E)),
    ('Network', Icons.lan, Color(0xFF283593)),
    ('Identity', Icons.badge, Color(0xFF303F9F)),
    ('Endpoint', Icons.computer, Color(0xFF3949AB)),
    ('Application', Icons.apps, Color(0xFF3F51B5)),
    ('Data', Icons.storage, Color(0xFF5C6BC0)),
    ('Detection', Icons.visibility, Color(0xFF7986CB)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < layers.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: FractionallySizedBox(
              widthFactor: 1.0 - (i * 0.09),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color: layers[i].$3,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(layers[i].$2, color: Colors.white, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      layers[i].$1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Authentication Factors — 3 cards
// ═══════════════════════════════════════════════════════════════════════

class AuthFactorsDiagram extends StatelessWidget {
  const AuthFactorsDiagram({super.key});

  static const factors = [
    ('Something\nYou Know', Icons.password, Color(0xFF1565C0), 'Password, PIN'),
    ('Something\nYou Have', Icons.smartphone, Color(0xFF2E7D32), 'Phone, token'),
    ('Something\nYou Are', Icons.fingerprint, Color(0xFF6A1B9A), 'Fingerprint, face'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final f in factors)
          Container(
            width: 120,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [f.$3, f.$3.withValues(alpha: 0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(f.$2, color: Colors.white, size: 28),
                const SizedBox(height: 8),
                Text(
                  f.$1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  f.$4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 10),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Risk Formula — Likelihood x Impact = Risk
// ═══════════════════════════════════════════════════════════════════════

class RiskFormulaDiagram extends StatelessWidget {
  const RiskFormulaDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    Widget box(String label, IconData icon, Color color) => Container(
          width: 90,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 22),
              const SizedBox(height: 6),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
          ),
        );

    Widget symbol(String s) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(s,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey)),
        );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          box('Likelihood', Icons.trending_up, const Color(0xFF1565C0)),
          symbol('×'),
          box('Impact', Icons.warning_amber, const Color(0xFFC62828)),
          symbol('='),
          box('Risk', Icons.gpp_maybe, const Color(0xFF6A1B9A)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Generic Process/Workflow Flow — numbered steps connected by arrows
// ═══════════════════════════════════════════════════════════════════════

class ProcessFlowDiagram extends StatelessWidget {
  final List<String> steps;

  const ProcessFlowDiagram({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          _StepBubble(number: i + 1, label: steps[i]),
          if (i != steps.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(Icons.arrow_forward,
                  color: Colors.grey.shade400, size: 20),
            ),
        ],
      ],
    );
  }
}

class _StepBubble extends StatelessWidget {
  final int number;
  final String label;

  const _StepBubble({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF1565C0),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$number',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Kill Chain — 7-stage horizontal/wrapping flow (reuses ProcessFlowDiagram)
// ═══════════════════════════════════════════════════════════════════════

class KillChainDiagram extends StatelessWidget {
  const KillChainDiagram({super.key});

  static const stages = [
    'Recon',
    'Weaponize',
    'Deliver',
    'Exploit',
    'Install',
    'C2',
    'Actions',
  ];

  @override
  Widget build(BuildContext context) {
    return const ProcessFlowDiagram(steps: stages);
  }
}
