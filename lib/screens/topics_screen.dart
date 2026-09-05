import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import '../services/auth_service.dart';
import '../services/activity_tracker.dart';
import 'final_exam_screen.dart';
import 'account_screen.dart';
import 'paywall_screen.dart';
import 'read_through_screen.dart';
import 'podcast_screen.dart';
import 'puzzle_screen.dart';
import 'admin_report_screen.dart';
import '../widgets/cyberpulse_logo.dart';
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

// ── Screen ────────────────────────────────────────────────────────────────
class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  double? _finalExamBestScore;
  bool _hasFullAccess = false;
  bool _isAdmin = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
    // Fire-and-forget: records "the user was active today" for the
    // inactivity-reminder email job. TopicsScreen is the home screen,
    // so its initState firing is a reliable "opened the app" signal —
    // no need to await this or block on it.
    ActivityTracker.recordActivity();
  }

  Future<void> _refresh() async {
    final finalExamScore = await ProgressService.getFinalExamBestScore();
    final hasFullAccess = await ProgressService.hasFullAccess();
    final isAdmin = await ProgressService.isAdmin();
    setState(() {
      _finalExamBestScore = finalExamScore;
      _hasFullAccess = hasFullAccess;
      _isAdmin = isAdmin;
      _loading = false;
    });
  }

  /// For cards still in development (Podcast, Video Tutorials,
  /// Puzzles & Games): admins get real access for testing; everyone
  /// else sees a friendly "not yet" message instead of navigating in.
  void _handleComingSoonTap(Future<void> Function() onAdminTap) {
    if (_isAdmin) {
      onAdminTap();
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("This one's still cooking — hang tight, it's coming soon!")),
    );
  }

  Future<void> _showPaywall({String? lockedItemTitle}) async {
    final unlocked = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => PaywallScreen(lockedItemTitle: lockedItemTitle)),
    );
    if (unlocked == true) _refresh();
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('About Learning Cybersecurity'),
        content: const Text(
          'Sacyra makes cybersecurity practical, engaging, and accessible for everyone '
          'Learn through real-world scenarios '
          ' practise your skills, and build confidence that '
          'goes beyond the classroom. '
          'Learn. Practise. Advocate. — and make cybersecurity part of everyday life. '
          
          ,
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
            const CyberPulseLogo(
              size: 24,
              lightShade: Color(0xFF64B5F6),
              darkShade: Color(0xFFFFFFFF),
              outline: Color(0xFFFFFFFF),
              pulseColor: Color(0xFF0D47A1),
            ),
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
          if (_isAdmin)
            IconButton(
              icon: const Icon(Icons.bar_chart, color: Colors.white),
              tooltip: 'Admin Report',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AdminReportScreen()),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            tooltip: 'My Account',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            tooltip: 'About',
            onPressed: _showAbout,
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
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
                            Expanded(
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
                                    '${allTopics.where((e) => e.levelIndex == 0).length} chapters · Fundamentals to GRC',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Welcome message + Final Exam status notification
                      _ProgressSummaryCard(
                        finalExamBestScore: _finalExamBestScore,
                      ),
                      // Final Certification Exam
                      Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        color: Colors.indigo.withValues(alpha: 0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(color: Colors.indigo.withValues(alpha: 0.25)),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Icon(
                              _hasFullAccess ? Icons.workspace_premium : Icons.lock,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('Final Certification Exam',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            _hasFullAccess
                                ? '100 questions · 120 min · 75% to pass'
                                : 'Requires full access · tap to unlock',
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            if (!_hasFullAccess) {
                              _showPaywall(lockedItemTitle: 'Final Certification Exam');
                              return;
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const FinalExamStartScreen()),
                            );
                          },
                        ),
                      ),
                      // Learning mode selector — "Read Through" is
                      // fully live for everyone. "Podcast", "Video
                      // Tutorials", and "Puzzles & Games" are still in
                      // development: admins get real access to test
                      // them, everyone else sees a friendly "coming
                      // soon" message on tap instead of navigating in.
                      // Built as a repeated card pattern so adding a
                      // fully-launched mode later is just deleting one
                      // "comingSoon: true" flag, not a redesign.
                      _LearningModeCard(
                        icon: Icons.menu_book,
                        iconColor: Colors.blue,
                        title: 'Read Through',
                        subtitle: 'The full written course — 13 chapters plus bonus content',
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ReadThroughScreen()),
                          );
                          _refresh();
                        },
                      ),
                      const SizedBox(height: 14),
                      _LearningModeCard(
                        icon: Icons.extension,
                        iconColor: Colors.teal,
                        title: 'Cybersecurity Puzzles & Games',
                        subtitle: 'Test what you know with quick, playful challenges',
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const PuzzleScreen()),
                          );
                          _refresh();
                        },
                      ),
                      const SizedBox(height: 14),
                      _LearningModeCard(
                        icon: Icons.podcasts,
                        iconColor: Colors.deepPurple,
                        title: 'Podcast',
                        subtitle: 'All 13 core chapters, told as a conversation between two hosts',
                        badge: _hasFullAccess ? null : 'Chapter 1 Free',
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const PodcastScreen()),
                          );
                          _refresh();
                        },
                      ),
                      const SizedBox(height: 14),
                      _LearningModeCard(
                        icon: Icons.smart_display,
                        iconColor: Colors.redAccent,
                        title: 'Video Tutorials',
                        subtitle: 'Short video walkthroughs of key concepts',
                        badge: 'Coming Soon',
                        onTap: () => _handleComingSoonTap(() async {}),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ],
        ),
      ),
    );
  }
}

// ── Progress Summary Card ────────────────────────────────────────────────
class _ProgressSummaryCard extends StatelessWidget {
  final double? finalExamBestScore;

  const _ProgressSummaryCard({
    required this.finalExamBestScore,
  });

  @override
  Widget build(BuildContext context) {
    final user = AuthService.currentUser;
    final name = (user?.displayName?.trim().isNotEmpty ?? false)
        ? user!.displayName!.split(' ').first
        : 'Learner';
    final photoUrl = user?.photoURL;
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    final finalExamPassed = (finalExamBestScore ?? 0) >= 75;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xFF1565C0),
                backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
                child: photoUrl == null
                    ? Text(initial,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text('Welcome back, $name',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Notification: whether the Final Certification Exam has been
          // taken yet — this is the ONLY status shown here now, per
          // request, replacing the practice-exam completion percentage
          // and progress bar that used to live in this card.
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: finalExamPassed
                  ? Colors.green.withValues(alpha: 0.08)
                  : Colors.grey.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  finalExamPassed ? Icons.workspace_premium : Icons.quiz_outlined,
                  size: 18,
                  color: finalExamPassed ? Colors.green.shade700 : Colors.grey.shade500,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    finalExamPassed
                        ? 'Final Certification Exam passed'
                        : (finalExamBestScore != null
                            ? 'Final Certification Exam: not yet passed'
                            : 'Final Certification Exam: not yet attempted'),
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: finalExamPassed ? Colors.green.shade800 : Colors.grey.shade700,
                    ),
                  ),
                ),
                if (finalExamBestScore != null)
                  Text(
                    '${finalExamBestScore!.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: finalExamPassed ? Colors.green.shade800 : Colors.grey.shade600,
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

// ── Learning mode selector card ─────────────────────────────────────────
// Reused for "Read Through", "Podcast", and any future modes (video,
// etc.) — one consistent card shape, so adding a new mode later is a
// single new instantiation of this widget, not new layout code.
class _LearningModeCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String? badge;
  final VoidCallback onTap;

  const _LearningModeCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: iconColor.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: iconColor.withValues(alpha: 0.18)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (badge != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: iconColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              badge!,
                              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }
}
