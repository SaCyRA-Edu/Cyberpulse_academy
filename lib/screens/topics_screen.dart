import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import 'topic_detail_screen.dart';

// ── Per-module visual theme ───────────────────────────────────────────────
class _ModuleTheme {
  final List<Color> gradient;
  final IconData icon;
  final IconData bgIcon; // large decorative background icon
  const _ModuleTheme(this.gradient, this.icon, this.bgIcon);
}

const Map<String, _ModuleTheme> _moduleThemes = {
  'Cybersecurity Fundamentals': _ModuleTheme(
    [Color(0xFF1565C0), Color(0xFF42A5F5)],
    Icons.security,
    Icons.shield,
  ),
  'Threat Actors': _ModuleTheme(
    [Color(0xFFB71C1C), Color(0xFFEF5350)],
    Icons.person_search,
    Icons.gps_fixed,
  ),
  'Social Engineering': _ModuleTheme(
    [Color(0xFF4527A0), Color(0xFF9575CD)],
    Icons.psychology_alt,
    Icons.record_voice_over,
  ),
  'Malware': _ModuleTheme(
    [Color(0xFF212121), Color(0xFF757575)],
    Icons.coronavirus,
    Icons.bug_report,
  ),
  'Cryptography': _ModuleTheme(
    [Color(0xFF00695C), Color(0xFF4DB6AC)],
    Icons.enhanced_encryption,
    Icons.key,
  ),
  'Identity Access Management': _ModuleTheme(
    [Color(0xFF283593), Color(0xFF7986CB)],
    Icons.badge,
    Icons.fingerprint,
  ),
  'Vulnerabilities and Threats': _ModuleTheme(
    [Color(0xFFBF360C), Color(0xFFFF8A65)],
    Icons.bug_report,
    Icons.warning_amber,
  ),
  'Alerts and Monitoring': _ModuleTheme(
    [Color(0xFF0277BD), Color(0xFF4FC3F7)],
    Icons.notifications_active,
    Icons.monitor_heart,
  ),
  'Security Incident Response': _ModuleTheme(
    [Color(0xFFAD1457), Color(0xFFF06292)],
    Icons.emergency,
    Icons.local_fire_department,
  ),
  'Email Security': _ModuleTheme(
    [Color(0xFF6A1B9A), Color(0xFFCE93D8)],
    Icons.email,
    Icons.mark_email_read,
  ),
  'Networking': _ModuleTheme(
    [Color(0xFF00695C), Color(0xFF4DB6AC)],
    Icons.router,
    Icons.lan,
  ),
  'Windows Security': _ModuleTheme(
    [Color(0xFF0277BD), Color(0xFF29B6F6)],
    Icons.desktop_windows,
    Icons.computer,
  ),
  'Linux Security': _ModuleTheme(
    [Color(0xFFBF360C), Color(0xFFFF8A65)],
    Icons.terminal,
    Icons.code,
  ),
  'SOC Operations': _ModuleTheme(
    [Color(0xFF1A237E), Color(0xFF5C6BC0)],
    Icons.visibility,
    Icons.radar,
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
        text: 'LEARN CYBERSECURITY',
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

// ── Screen ────────────────────────────────────────────────────────────────
class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  Map<int, double?> _bestScoresByLevel = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final scores = <int, double?>{};
    for (final entry in allTopics) {
      scores[entry.levelIndex] =
          await ProgressService.getBestScore(entry.levelIndex);
    }
    setState(() {
      _bestScoresByLevel = scores;
      _loading = false;
    });
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('About Learning Cybersecurity'),
        content: const Text(
          'Learning Cybersecurity is a vendor-neutral cybersecurity '
          'curriculum aligned with CompTIA Security+ (SY0-701). Every '
          'topic contains lessons spanning Beginner through Expert '
          'difficulty — look for the colored badge on each lesson. '
          'Pass each level\'s adaptive exam at 80%+ to track your '
          'progress.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.shield, color: Colors.white, size: 22),
            const SizedBox(width: 8),
            const Text(
              'Learning Cybersecurity',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            tooltip: 'About',
            onPressed: _showAbout,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Watermark background
          Positioned.fill(
            child: CustomPaint(painter: _WatermarkPainter()),
          ),
          // Content
          _loading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1565C0), Color(0xFF1976D2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.school,
                                color: Colors.white, size: 36),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Start Learning',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '7 topics · Beginner to Expert',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Topic cards
                      for (var i = 0; i < allTopics.length; i++)
                        _TopicCard(
                          entry: allTopics[i],
                          bestScore: _bestScoresByLevel[allTopics[i].levelIndex],
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    TopicDetailScreen(entry: allTopics[i]),
                              ),
                            );
                            _refresh();
                          },
                        ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

// ── Topic Card ────────────────────────────────────────────────────────────
class _TopicCard extends StatelessWidget {
  final TopicEntry entry;
  final double? bestScore;
  final VoidCallback onTap;

  const _TopicCard({
    required this.entry,
    required this.bestScore,
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
                    if (bestScore != null)
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
