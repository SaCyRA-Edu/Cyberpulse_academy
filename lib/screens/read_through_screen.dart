import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import 'topic_detail_screen.dart';
import 'paywall_screen.dart';

class _ModuleTheme {
  final List<Color> gradient;
  final IconData icon;
  final IconData bgIcon; // large decorative background icon
  const _ModuleTheme(this.gradient, this.icon, this.bgIcon);
}

const Map<String, _ModuleTheme> _moduleThemes = {
  // ── Core Curriculum — Chapters 1–13, each with a distinct color ────────
  'Chapter 1: Cybersecurity Fundamentals': _ModuleTheme(
    [Color(0xFF1565C0), Color(0xFF42A5F5)],
    Icons.security,
    Icons.shield,
  ),
  'Chapter 2: Threats, Attacks & Vulnerabilities': _ModuleTheme(
    [Color(0xFFC62828), Color(0xFFEF5350)],
    Icons.gpp_maybe,
    Icons.warning_amber,
  ),
  'Chapter 3: Network Security': _ModuleTheme(
    [Color(0xFF2E7D32), Color(0xFF66BB6A)],
    Icons.router,
    Icons.lan,
  ),
  'Chapter 4: Identity Access Management': _ModuleTheme(
    [Color(0xFF283593), Color(0xFF7986CB)],
    Icons.badge,
    Icons.fingerprint,
  ),
  'Chapter 5: Cryptography': _ModuleTheme(
    [Color(0xFF00695C), Color(0xFF4DB6AC)],
    Icons.enhanced_encryption,
    Icons.key,
  ),
  'Chapter 6: Secure Protocols': _ModuleTheme(
    [Color(0xFF00838F), Color(0xFF4DD0E1)],
    Icons.lock,
    Icons.https,
  ),
  'Chapter 7: Endpoint Security': _ModuleTheme(
    [Color(0xFFEF6C00), Color(0xFFFFB74D)],
    Icons.laptop_chromebook,
    Icons.devices,
  ),
  'Chapter 8: Identity Federation & SSO': _ModuleTheme(
    [Color(0xFF4527A0), Color(0xFF9575CD)],
    Icons.hub,
    Icons.link,
  ),
  'Chapter 9: Application Security': _ModuleTheme(
    [Color(0xFF4E342E), Color(0xFFA1887F)],
    Icons.web,
    Icons.integration_instructions,
  ),
  'Chapter 10: Cloud Security': _ModuleTheme(
    [Color(0xFF0277BD), Color(0xFF4FC3F7)],
    Icons.cloud,
    Icons.cloud_queue,
  ),
  'Chapter 11: Security Operations': _ModuleTheme(
    [Color(0xFF1A237E), Color(0xFF5C6BC0)],
    Icons.visibility,
    Icons.radar,
  ),
  'Chapter 12: Incident Response': _ModuleTheme(
    [Color(0xFFAD1457), Color(0xFFF06292)],
    Icons.emergency,
    Icons.local_fire_department,
  ),
  'Chapter 13: Governance, Risk & Compliance': _ModuleTheme(
    [Color(0xFFF9A825), Color(0xFFFFD54F)],
    Icons.gavel,
    Icons.fact_check,
  ),

  // ── Bonus Chapters — supplementary modules outside the numbered sequence ──
  'Social Engineering': _ModuleTheme(
    [Color(0xFF6A1B9A), Color(0xFFBA68C8)],
    Icons.psychology_alt,
    Icons.record_voice_over,
  ),
  'Malware': _ModuleTheme(
    [Color(0xFF212121), Color(0xFF757575)],
    Icons.coronavirus,
    Icons.bug_report,
  ),
  'Vulnerabilities and Threats': _ModuleTheme(
    [Color(0xFFBF360C), Color(0xFFFF8A65)],
    Icons.bug_report,
    Icons.warning_amber,
  ),
  'Alerts and Monitoring': _ModuleTheme(
    [Color(0xFF0288D1), Color(0xFF81D4FA)],
    Icons.notifications_active,
    Icons.monitor_heart,
  ),
  'Email Security': _ModuleTheme(
    [Color(0xFF00838F), Color(0xFF80DEEA)],
    Icons.email,
    Icons.mark_email_read,
  ),
  'Windows Security': _ModuleTheme(
    [Color(0xFF0277BD), Color(0xFF29B6F6)],
    Icons.desktop_windows,
    Icons.computer,
  ),
  'Linux Security': _ModuleTheme(
    [Color(0xFFBF360C), Color(0xFFFFAB91)],
    Icons.terminal,
    Icons.code,
  ),
  'Capstone: Applied Defense': _ModuleTheme(
    [Color(0xFFF57F17), Color(0xFFFFD54F)],
    Icons.workspace_premium,
    Icons.military_tech,
  ),
};

_ModuleTheme _themeFor(String title) =>
    _moduleThemes[title] ??
    const _ModuleTheme(
      [Color(0xFF37474F), Color(0xFF78909C)],
      Icons.book,
      Icons.book,
    );

// ── Watermark painter ─────────────────────────────────────────────────────
class _WatermarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'CYBERPULSE',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0x08003580),
          letterSpacing: 4,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final iconPainter = TextPainter(
      text: const TextSpan(
        text: '🛡',
        style: TextStyle(fontSize: 18, color: Color(0x06003580)),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    const rowH = 70.0;
    const colW = 160.0;
    canvas.save();
    canvas.rotate(-math.pi / 8);

    for (double y = -size.height; y < size.height * 2; y += rowH) {
      final offset = (y / rowH).floor().isEven ? 0.0 : colW / 2;
      for (double x = -size.width + offset; x < size.width * 2; x += colW) {
        textPainter.paint(canvas, Offset(x, y));
        iconPainter.paint(canvas, Offset(x + textPainter.width + 6, y + 2));
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_) => false;
}

// ═══════════════════════════════════════════════════════════════════════
// Read Through Screen — this is exactly what used to be shown directly
// on the Learning Cybersecurity home page (Core Curriculum chapter list
// + Bonus Chapters), now moved to its own screen reached via the
// "Read Through" card, alongside the new "Podcast" card. Nothing about
// how this actually behaves has changed — it's a straight extraction.
// ═══════════════════════════════════════════════════════════════════════

class ReadThroughScreen extends StatefulWidget {
  const ReadThroughScreen({super.key});

  @override
  State<ReadThroughScreen> createState() => _ReadThroughScreenState();
}

class _ReadThroughScreenState extends State<ReadThroughScreen> {
  Map<int, double?> _bestScoresByLevel = {};
  bool _hasFullAccess = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final scores = <int, double?>{};
    for (final entry in allTopics) {
      scores[entry.levelIndex] = await ProgressService.getBestScore(entry.levelIndex);
    }
    final hasFullAccess = await ProgressService.hasFullAccess();
    setState(() {
      _bestScoresByLevel = scores;
      _hasFullAccess = hasFullAccess;
      _loading = false;
    });
  }

  bool _canAccess(String moduleTitle) =>
      _hasFullAccess || ProgressService.isChapterFreePreview(moduleTitle);

  Future<void> _showPaywall({String? lockedItemTitle}) async {
    final unlocked = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => PaywallScreen(lockedItemTitle: lockedItemTitle)),
    );
    if (unlocked == true) _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Read Through', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _WatermarkPainter())),
          _loading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    children: [
                      // Topic cards — Core Curriculum only (Chapters 1–13)
                      for (final entry in allTopics.where((e) => e.levelIndex == 0))
                        _TopicCard(
                          entry: entry,
                          bestScore: _bestScoresByLevel[entry.levelIndex],
                          locked: !_canAccess(entry.module.title),
                          onTap: () async {
                            if (!_canAccess(entry.module.title)) {
                              _showPaywall(lockedItemTitle: entry.module.title);
                              return;
                            }
                            await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => TopicDetailScreen(entry: entry)),
                            );
                            _refresh();
                          },
                        ),
                      // Bonus Chapters — collapsed behind a single link
                      Card(
                        margin: const EdgeInsets.only(top: 4, bottom: 20),
                        color: Colors.amber.withValues(alpha: 0.08),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(color: Colors.amber.withValues(alpha: 0.3)),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: const CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Icon(Icons.card_giftcard, color: Colors.white),
                          ),
                          title: const Text('Bonus Chapters', style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${allTopics.where((e) => e.levelIndex == 1).length} supplementary chapters'),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => _BonusChaptersScreen(
                                  bestScoresByLevel: _bestScoresByLevel,
                                  hasFullAccess: _hasFullAccess,
                                ),
                              ),
                            );
                            _refresh();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class _BonusChaptersScreen extends StatelessWidget {
  final Map<int, double?> bestScoresByLevel;
  final bool hasFullAccess;

  const _BonusChaptersScreen({required this.bestScoresByLevel, required this.hasFullAccess});

  Future<void> _showPaywall(BuildContext context, String lockedItemTitle) async {
    await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => PaywallScreen(lockedItemTitle: lockedItemTitle)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bonusTopics = allTopics.where((e) => e.levelIndex == 1).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bonus Chapters',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: _WatermarkPainter()),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard, color: Colors.amber.shade700, size: 22),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Supplementary chapters outside the core 13-chapter '
                        'sequence — dig deeper into specific threats, '
                        'platforms, and the capstone.',
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              for (final entry in bonusTopics)
                _TopicCard(
                  entry: entry,
                  bestScore: bestScoresByLevel[entry.levelIndex],
                  locked: !hasFullAccess,
                  onTap: () async {
                    if (!hasFullAccess) {
                      await _showPaywall(context, entry.module.title);
                      return;
                    }
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TopicDetailScreen(entry: entry),
                      ),
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopicCard extends StatelessWidget {
  final TopicEntry entry;
  final double? bestScore;
  final bool locked;
  final VoidCallback onTap;

  const _TopicCard({
    required this.entry,
    required this.bestScore,
    this.locked = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final module = entry.module;
    final theme = _themeFor(module.title);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: theme.gradient.first.withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              // ── Image banner ───────────────────────────────────────
              SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    // Gradient background
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: theme.gradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    // Large decorative background icon
                    Positioned(
                      right: -20,
                      bottom: -20,
                      child: Icon(
                        theme.bgIcon,
                        size: 120,
                        color: Colors.white.withValues(alpha: 0.12),
                      ),
                    ),
                    // Small dots pattern
                    Positioned.fill(
                      child: CustomPaint(painter: _DotPatternPainter()),
                    ),
                    // Locked overlay — dims the banner and shows a padlock
                    // so locked chapters read as unmistakably locked even
                    // before a user taps them.
                    if (locked)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.45),
                          child: const Center(
                            child: Icon(Icons.lock, color: Colors.white, size: 32),
                          ),
                        ),
                      ),
                    // Module icon badge — fixed top-left position
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(theme.icon, color: Colors.white, size: 24),
                      ),
                    ),
                    // Module title — fixed bottom-left position, max 2 lines
                    Positioned(
                      left: 16,
                      right: 70,
                      bottom: 14,
                      child: Text(
                        module.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ── Info row ──────────────────────────────────────────
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.menu_book,
                        size: 16, color: theme.gradient.first),
                    const SizedBox(width: 6),
                    Text(
                      '${module.lessonCount} lessons',
                      style: TextStyle(
                          fontSize: 13, color: theme.gradient.first),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.headphones,
                        size: 16, color: theme.gradient.first),
                    const SizedBox(width: 4),
                    Text(
                      'Audio included',
                      style: TextStyle(
                          fontSize: 13, color: theme.gradient.first),
                    ),
                    const Spacer(),
                    if (locked)
                      Row(
                        children: [
                          Icon(Icons.lock, size: 15, color: Colors.grey.shade500),
                          const SizedBox(width: 4),
                          Text(
                            'Locked',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    else if (bestScore != null)
                      Row(
                        children: [
                          const Icon(Icons.emoji_events,
                              size: 16, color: Colors.green),
                          const SizedBox(width: 4),
                          Text(
                            '${bestScore!.toStringAsFixed(0)}%',
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    else
                      Icon(Icons.arrow_forward_ios,
                          size: 14, color: Colors.grey.shade400),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Subtle dot pattern painted on the card banner ─────────────────────────
class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.07)
      ..style = PaintingStyle.fill;
    const spacing = 18.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
