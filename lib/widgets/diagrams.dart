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
  osiLayers,
  networkDevices,
  tlsHandshake,
  threatActorSpectrum,
  attackVectors,
  impersonationForms,
  motivationalTriggers,
  otherSocialEngineering,
  malwareTypes,
  virusTrojanWormTable,
  symmetricAsymmetricTable,
  idsIpsTable,
  networkAppliancesTable,
  ssoComparison,
  xssTypes,
  siemSources,
  assetImage,
  dataTable,
}

class DiagramSpec {
  final DiagramType type;
  final List<String>? steps; // used by processFlow
  final String? caption;
  final String? assetPath; // used by assetImage — path to a bundled image asset
  final List<String>? tableHeaders; // used by dataTable — column headers
  final List<List<String>>? tableRows; // used by dataTable — one list per row, same length as tableHeaders

  const DiagramSpec({
    required this.type,
    this.steps,
    this.caption,
    this.assetPath,
    this.tableHeaders,
    this.tableRows,
  });
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
      case DiagramType.osiLayers:
        diagram = const OsiLayersDiagram();
        break;
      case DiagramType.networkDevices:
        diagram = const NetworkDevicesDiagram();
        break;
      case DiagramType.tlsHandshake:
        diagram = const TlsHandshakeDiagram();
        break;
      case DiagramType.threatActorSpectrum:
        diagram = const ThreatActorSpectrumDiagram();
        break;
      case DiagramType.attackVectors:
        diagram = const AttackVectorsDiagram();
        break;
      case DiagramType.impersonationForms:
        diagram = const ImpersonationFormsDiagram();
        break;
      case DiagramType.motivationalTriggers:
        diagram = const MotivationalTriggersDiagram();
        break;
      case DiagramType.otherSocialEngineering:
        diagram = const OtherSocialEngineeringDiagram();
        break;
      case DiagramType.malwareTypes:
        diagram = const MalwareTypesDiagram();
        break;
      case DiagramType.virusTrojanWormTable:
        diagram = const VirusTrojanWormTableDiagram();
        break;
      case DiagramType.symmetricAsymmetricTable:
        diagram = const SymmetricAsymmetricTableDiagram();
        break;
      case DiagramType.idsIpsTable:
        diagram = const IdsIpsTableDiagram();
        break;
      case DiagramType.networkAppliancesTable:
        diagram = const NetworkAppliancesTableDiagram();
        break;
      case DiagramType.ssoComparison:
        diagram = const SsoComparisonDiagram();
        break;
      case DiagramType.xssTypes:
        diagram = const XssTypesDiagram();
        break;
      case DiagramType.siemSources:
        diagram = const SiemSourcesDiagram();
        break;
      case DiagramType.processFlow:
        diagram = ProcessFlowDiagram(steps: spec.steps ?? const []);
        break;
      case DiagramType.assetImage:
        diagram = ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            spec.assetPath ?? '',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Image could not be loaded — check that the asset path is '
                'declared correctly in pubspec.yaml.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
        );
        break;
      case DiagramType.dataTable:
        diagram = GenericDataTableDiagram(
          headers: spec.tableHeaders ?? const [],
          rows: spec.tableRows ?? const [],
        );
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

// ═══════════════════════════════════════════════════════════════════════
// OSI Layers — 7-layer stack, bottom (Physical) to top (Application)
// ═══════════════════════════════════════════════════════════════════════

class OsiLayersDiagram extends StatelessWidget {
  const OsiLayersDiagram({super.key});

  // (layer number, name, icon, color, example attack at this layer)
  static const layers = [
    (7, 'Application', Icons.language, Color(0xFF6A1B9A), 'SQL injection, phishing'),
    (6, 'Presentation', Icons.transform, Color(0xFF7B1FA2), 'Encryption downgrade'),
    (5, 'Session', Icons.link, Color(0xFF8E24AA), 'Session hijacking'),
    (4, 'Transport', Icons.swap_vert, Color(0xFFAB47BC), 'SYN flood'),
    (3, 'Network', Icons.public, Color(0xFFBA68C8), 'IP spoofing'),
    (2, 'Data Link', Icons.cable, Color(0xFFCE93D8), 'ARP spoofing'),
    (1, 'Physical', Icons.settings_ethernet, Color(0xFFE1BEE7), 'Cable tapping'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final l in layers)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: l.$4,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${l.$1}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(l.$3, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l.$2,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
                Flexible(
                  child: Text(
                    l.$5,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Network Devices — Hub vs Switch vs Firewall comparison
// ═══════════════════════════════════════════════════════════════════════

class NetworkDevicesDiagram extends StatelessWidget {
  const NetworkDevicesDiagram({super.key});

  static const devices = [
    (
      'Hub',
      Icons.hub,
      Color(0xFF757575),
      'Broadcasts every packet to all connected devices — no intelligence, no security',
    ),
    (
      'Switch',
      Icons.lan,
      Color(0xFF1565C0),
      'Forwards traffic only to the intended device, based on MAC address',
    ),
    (
      'Firewall',
      Icons.security,
      Color(0xFFC62828),
      'Inspects traffic and allows or blocks it based on defined rules',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final d in devices)
          Container(
            width: 140,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: d.$3.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: d.$3.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: d.$3, shape: BoxShape.circle),
                  child: Icon(d.$2, color: Colors.white, size: 22),
                ),
                const SizedBox(height: 8),
                Text(d.$1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14, color: d.$3)),
                const SizedBox(height: 6),
                Text(
                  d.$4,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11, color: Colors.black87),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// TLS / VPN Handshake — client/server sequence diagram
// ═══════════════════════════════════════════════════════════════════════

class TlsHandshakeDiagram extends StatelessWidget {
  const TlsHandshakeDiagram({super.key});

  static const steps = [
    ('ClientHello', 'right', 'Client proposes TLS version & cipher suites'),
    ('ServerHello + Certificate', 'left', 'Server picks a cipher suite & sends its certificate'),
    ('Key Exchange', 'right', 'Client verifies the certificate, negotiates a shared key'),
    ('Finished — Encrypted Session', 'both', 'Both sides switch to fast symmetric encryption'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _endpoint('Client', Icons.computer, const Color(0xFF1565C0)),
            _endpoint('Server', Icons.dns, const Color(0xFF2E7D32)),
          ],
        ),
        const SizedBox(height: 4),
        for (final s in steps) _stepRow(s.$1, s.$2, s.$3),
      ],
    );
  }

  Widget _endpoint(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12)),
      ],
    );
  }

  Widget _stepRow(String label, String direction, String caption) {
    IconData arrow;
    switch (direction) {
      case 'right':
        arrow = Icons.arrow_forward;
        break;
      case 'left':
        arrow = Icons.arrow_back;
        break;
      default:
        arrow = Icons.sync_alt;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: Divider(thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(arrow, size: 16, color: Colors.grey.shade600),
              ),
              const Expanded(child: Divider(thickness: 1)),
            ],
          ),
          Text(label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 2),
          Text(
            caption,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Threat Actor Spectrum — sophistication gradient from low to high
// ═══════════════════════════════════════════════════════════════════════

class ThreatActorSpectrumDiagram extends StatelessWidget {
  const ThreatActorSpectrumDiagram({super.key});

  static const actors = [
    ('Unskilled Attacker', Color(0xFF66BB6A)),
    ('Hacktivist', Color(0xFFAED581)),
    ('Insider', Color(0xFFFFD54F)),
    ('Organized Crime', Color(0xFFFF8A65)),
    ('Nation-State', Color(0xFFE57373)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: actors.map((a) => a.$2).toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Lower sophistication\n& resources',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('Higher sophistication\n& resources',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            for (final a in actors)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: a.$2.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: a.$2),
                ),
                child: Text(
                  a.$1,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: a.$2),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Attack Vectors — 6 common vectors used to reach a target
// ═══════════════════════════════════════════════════════════════════════

class AttackVectorsDiagram extends StatelessWidget {
  const AttackVectorsDiagram({super.key});

  static const vectors = [
    ('Messages', Icons.sms, Color(0xFF1565C0)),
    ('Images', Icons.image, Color(0xFF6A1B9A)),
    ('Files', Icons.insert_drive_file, Color(0xFFC62828)),
    ('Voice Calls', Icons.phone, Color(0xFF2E7D32)),
    ('Removable Devices', Icons.usb, Color(0xFFEF6C00)),
    ('Unsecured Networks', Icons.wifi_off, Color(0xFF37474F)),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final v in vectors)
          Container(
            width: 100,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: v.$3.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: v.$3.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                Icon(v.$2, color: v.$3, size: 22),
                const SizedBox(height: 6),
                Text(
                  v.$1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: v.$3),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Impersonation Forms — 4 forms of impersonation-driven social engineering
// ═══════════════════════════════════════════════════════════════════════

class ImpersonationFormsDiagram extends StatelessWidget {
  const ImpersonationFormsDiagram({super.key});

  static const forms = [
    ('Impersonation', Icons.theater_comedy, Color(0xFF1565C0), 'Posing as a trusted person'),
    ('Brand Impersonation', Icons.branding_watermark, Color(0xFF6A1B9A), 'Faking a trusted company'),
    ('Typosquatting', Icons.text_fields, Color(0xFFC62828), 'Near-identical lookalike domains'),
    ('Watering Hole', Icons.pool, Color(0xFF2E7D32), 'Compromising a site victims trust'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final f in forms)
          Container(
            width: 130,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: f.$3.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: f.$3.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                Icon(f.$2, color: f.$3, size: 24),
                const SizedBox(height: 6),
                Text(f.$1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: f.$3)),
                const SizedBox(height: 4),
                Text(f.$4,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10, color: Colors.black87)),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Motivational Triggers — the 6 psychological levers social engineers use
// ═══════════════════════════════════════════════════════════════════════

class MotivationalTriggersDiagram extends StatelessWidget {
  const MotivationalTriggersDiagram({super.key});

  static const triggers = [
    ('Authority', Icons.gavel, Color(0xFF1565C0)),
    ('Urgency', Icons.timer, Color(0xFFC62828)),
    ('Social Proof', Icons.groups, Color(0xFF2E7D32)),
    ('Scarcity', Icons.hourglass_bottom, Color(0xFFEF6C00)),
    ('Likability', Icons.favorite, Color(0xFFAD1457)),
    ('Fear', Icons.warning_amber, Color(0xFF37474F)),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final t in triggers)
          Container(
            width: 96,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: t.$3,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(t.$2, color: Colors.white, size: 22),
                const SizedBox(height: 6),
                Text(
                  t.$1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Other Social Engineering Attacks — physical & opportunistic techniques
// ═══════════════════════════════════════════════════════════════════════

class OtherSocialEngineeringDiagram extends StatelessWidget {
  const OtherSocialEngineeringDiagram({super.key});

  static const attacks = [
    ('Diversion Theft', Icons.local_shipping),
    ('Hoaxes', Icons.report_problem),
    ('Shoulder Surfing', Icons.visibility),
    ('Dumpster Diving', Icons.delete_outline),
    ('Eavesdropping', Icons.hearing),
    ('Baiting', Icons.usb),
    ('Piggybacking', Icons.people_alt),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        for (final a in attacks)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(a.$2, size: 14, color: Colors.deepPurple),
                const SizedBox(width: 6),
                Text(a.$1, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Malware Types — grid of the major malware categories
// ═══════════════════════════════════════════════════════════════════════

class MalwareTypesDiagram extends StatelessWidget {
  const MalwareTypesDiagram({super.key});

  static const types = [
    ('Virus', Icons.coronavirus, Color(0xFFC62828)),
    ('Worm', Icons.bug_report, Color(0xFF6A1B9A)),
    ('Trojan', Icons.card_giftcard, Color(0xFFEF6C00)),
    ('Ransomware', Icons.lock, Color(0xFF1565C0)),
    ('Spyware', Icons.visibility, Color(0xFF2E7D32)),
    ('Rootkit', Icons.vpn_key_off, Color(0xFF37474F)),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final t in types)
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: t.$3,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(t.$2, color: Colors.white, size: 24),
                const SizedBox(height: 6),
                Text(
                  t.$1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Virus vs Trojan vs Worm — side-by-side comparison table
// ═══════════════════════════════════════════════════════════════════════

class VirusTrojanWormTableDiagram extends StatelessWidget {
  const VirusTrojanWormTableDiagram({super.key});

  static const rows = [
    ('Needs a host file?', 'Yes', 'No', 'Yes'),
    ('Self-replicates?', 'Yes (needs user action)', 'Yes (fully automatic)', 'No'),
    ('Disguises itself?', 'Sometimes', 'No', 'Yes — always'),
    ('Spreads across a network alone?', 'No', 'Yes', 'No'),
  ];

  @override
  Widget build(BuildContext context) {
    Widget headerCell(String text, Color color) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: color,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        );

    Widget bodyCell(String text, {bool bold = false}) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, fontWeight: bold ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        );

    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            headerCell('Virus', const Color(0xFFC62828)),
            headerCell('Worm', const Color(0xFF6A1B9A)),
            headerCell('Trojan', const Color(0xFFEF6C00)),
          ],
        ),
        for (var i = 0; i < rows.length; i++)
          Container(
            decoration: BoxDecoration(
              color: i.isEven ? Colors.grey.shade50 : Colors.white,
              border: const Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: bodyCell(rows[i].$1, bold: true)),
                bodyCell(rows[i].$2),
                bodyCell(rows[i].$3),
                bodyCell(rows[i].$4),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Symmetric vs Asymmetric — side-by-side comparison table
// ═══════════════════════════════════════════════════════════════════════

class SymmetricAsymmetricTableDiagram extends StatelessWidget {
  const SymmetricAsymmetricTableDiagram({super.key});

  static const rows = [
    ('Number of keys', '1 shared secret key', '2 mathematically linked keys (public + private)'),
    ('Speed', 'Fast', 'Slower'),
    ('Key distribution', 'Hard — must share the secret key safely', 'Easy — the public key can be shared openly'),
    ('Typical use', 'Encrypting large volumes of data', 'Key exchange, digital signatures, authentication'),
    ('Example algorithms', 'AES, DES, 3DES, Blowfish', 'RSA, ECC, Diffie-Hellman'),
  ];

  @override
  Widget build(BuildContext context) {
    Widget headerCell(String text, Color color) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: color,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        );

    Widget bodyCell(String text, {bool bold = false}) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, fontWeight: bold ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        );

    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            headerCell('Symmetric', const Color(0xFF1565C0)),
            headerCell('Asymmetric', const Color(0xFF6A1B9A)),
          ],
        ),
        for (var i = 0; i < rows.length; i++)
          Container(
            decoration: BoxDecoration(
              color: i.isEven ? Colors.grey.shade50 : Colors.white,
              border: const Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: bodyCell(rows[i].$1, bold: true)),
                bodyCell(rows[i].$2),
                bodyCell(rows[i].$3),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// IDS vs IPS — side-by-side comparison table
// ═══════════════════════════════════════════════════════════════════════

class IdsIpsTableDiagram extends StatelessWidget {
  const IdsIpsTableDiagram({super.key});

  static const rows = [
    ('Position', 'Out-of-band (monitors a copy of traffic)', 'Inline (traffic passes through it)'),
    ('Action taken', 'Alerts only — no direct blocking', 'Actively blocks malicious traffic'),
    ('Risk of false positives', 'Lower impact — a false alert is just noise', 'Higher impact — a false block can disrupt legitimate traffic'),
    ('Typical role', 'Visibility and forensic logging', 'Real-time active prevention'),
  ];

  @override
  Widget build(BuildContext context) {
    Widget headerCell(String text, Color color) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: color,
            child: Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        );

    Widget bodyCell(String text, {bool bold = false}) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          ),
        );

    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            headerCell('IDS', const Color(0xFF1565C0)),
            headerCell('IPS', const Color(0xFFC62828)),
          ],
        ),
        for (var i = 0; i < rows.length; i++)
          Container(
            decoration: BoxDecoration(
              color: i.isEven ? Colors.grey.shade50 : Colors.white,
              border: const Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: bodyCell(rows[i].$1, bold: true)),
                bodyCell(rows[i].$2),
                bodyCell(rows[i].$3),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Network Appliances — hardware / software / cloud comparison table
// ═══════════════════════════════════════════════════════════════════════

class NetworkAppliancesTableDiagram extends StatelessWidget {
  const NetworkAppliancesTableDiagram({super.key});

  static const rows = [
    ('Load Balancer', 'F5 BIG-IP', 'NGINX, HAProxy', 'AWS ELB, Azure Load Balancer'),
    ('Proxy Server', 'Blue Coat appliance', 'Squid, NGINX', 'AWS API Gateway, Azure App Proxy'),
    ('Jump Server', 'Dedicated hardened host', 'Bastion host software', 'AWS Systems Manager, Entra PIM'),
  ];

  @override
  Widget build(BuildContext context) {
    Widget headerCell(String text) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF37474F),
            child: Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
          ),
        );

    Widget bodyCell(String text, {bool bold = false}) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          ),
        );

    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            headerCell('Hardware'),
            headerCell('Software'),
            headerCell('Cloud'),
          ],
        ),
        for (var i = 0; i < rows.length; i++)
          Container(
            decoration: BoxDecoration(
              color: i.isEven ? Colors.grey.shade50 : Colors.white,
              border: const Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: bodyCell(rows[i].$1, bold: true)),
                bodyCell(rows[i].$2),
                bodyCell(rows[i].$3),
                bodyCell(rows[i].$4),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// SSO vs Traditional Login — side-by-side comparison
// ═══════════════════════════════════════════════════════════════════════

class SsoComparisonDiagram extends StatelessWidget {
  const SsoComparisonDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    Widget column(String title, Color color, List<String> apps, bool sso) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: color)),
              const SizedBox(height: 8),
              if (sso)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
                  child: const Text('One Login',
                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              const SizedBox(height: 8),
              for (final app in apps)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: color.withValues(alpha: 0.4)),
                    ),
                    child: Text(
                      sso ? app : '$app\n(own login)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        column('Traditional Login', const Color(0xFFC62828), ['App A', 'App B', 'App C'], false),
        column('Single Sign-On', const Color(0xFF2E7D32), ['App A', 'App B', 'App C'], true),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// XSS Types — Reflected, Persistent, DOM-based
// ═══════════════════════════════════════════════════════════════════════

class XssTypesDiagram extends StatelessWidget {
  const XssTypesDiagram({super.key});

  static const types = [
    ('Reflected', Icons.replay, Color(0xFF1565C0), 'Payload bounces back in the immediate server response'),
    ('Persistent', Icons.storage, Color(0xFFC62828), 'Payload is stored on the server, served to every future visitor'),
    ('DOM-based', Icons.code, Color(0xFF6A1B9A), 'Payload executes purely in client-side JavaScript, never touching the server'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final t in types)
          Container(
            width: 150,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: t.$3.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: t.$3.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                Icon(t.$2, color: t.$3, size: 24),
                const SizedBox(height: 6),
                Text(t.$1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: t.$3)),
                const SizedBox(height: 4),
                Text(
                  t.$4,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10, color: Colors.black87),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// SIEM Sources — hub-and-spoke: on-prem and SaaS sources feeding a SIEM
// ═══════════════════════════════════════════════════════════════════════

class SiemSourcesDiagram extends StatelessWidget {
  const SiemSourcesDiagram({super.key});

  static const onPrem = [
    ('Infra', Icons.dns),
    ('Endpoints', Icons.computer),
    ('Network Devices', Icons.router),
  ];

  static const saas = [
    ('Entra ID', Icons.badge),
    ('AWS', Icons.cloud),
    ('GCP', Icons.cloud_queue),
    ('Microsoft 365', Icons.email),
  ];

  @override
  Widget build(BuildContext context) {
    Widget sourceChip(String label, IconData icon, Color color) => Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 12, color: color),
              const SizedBox(width: 4),
              Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        );

    return Column(
      children: [
        Text('On-Premises', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
        const SizedBox(height: 4),
        Wrap(
          alignment: WrapAlignment.center,
          children: [for (final s in onPrem) sourceChip(s.$1, s.$2, const Color(0xFF1565C0))],
        ),
        const SizedBox(height: 8),
        Icon(Icons.arrow_downward, size: 16, color: Colors.grey.shade400),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF6A1B9A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.hub, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text('SIEM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Icon(Icons.arrow_upward, size: 16, color: Colors.grey.shade400),
        const SizedBox(height: 8),
        Text('Cloud / SaaS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
        const SizedBox(height: 4),
        Wrap(
          alignment: WrapAlignment.center,
          children: [for (final s in saas) sourceChip(s.$1, s.$2, const Color(0xFF2E7D32))],
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Generic Data Table — a real, aligned table for any headers/rows given
// via DiagramSpec, with horizontal scroll for wide tables on narrow screens
// ═══════════════════════════════════════════════════════════════════════

class GenericDataTableDiagram extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final Color headerColor;

  const GenericDataTableDiagram({
    super.key,
    required this.headers,
    required this.rows,
    this.headerColor = const Color(0xFF1565C0),
  });

  @override
  Widget build(BuildContext context) {
    if (headers.isEmpty) return const SizedBox.shrink();

    Widget cell(String text, {bool isHeader = false}) => Container(
          constraints: const BoxConstraints(minWidth: 90, maxWidth: 220),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          child: Text(
            text,
            style: TextStyle(
              fontSize: isHeader ? 12 : 11.5,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.white : Colors.black87,
              height: 1.3,
            ),
          ),
        );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.grey.shade200, width: 1),
            verticalInside: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: [
            TableRow(
              decoration: BoxDecoration(color: headerColor),
              children: [for (final h in headers) cell(h, isHeader: true)],
            ),
            for (var i = 0; i < rows.length; i++)
              TableRow(
                decoration: BoxDecoration(
                  color: i.isEven ? Colors.grey.shade50 : Colors.white,
                ),
                children: [for (final c in rows[i]) cell(c)],
              ),
          ],
        ),
      ),
    );
  }
}
