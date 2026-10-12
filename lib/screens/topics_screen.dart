import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'lesson_screen.dart';
import '../data/soc_fundamentals_data.dart';
import '../data/soc_investigation_data.dart';
import '../data/soc_detection_data.dart';
import '../data/soc_fundamentals_quiz.dart';
import '../data/soc_email_data.dart';
import '../data/soc_endpoint_data.dart';
import '../data/soc_network_data.dart';
import '../data/soc_cloud_data.dart';
import '../data/soc_ir_data.dart';
import '../data/soc_ops_data.dart';
import '../data/lesson_model.dart';
import 'investigation_screen.dart';
import '../services/investigation_progress_service.dart';
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
  bool _hasDesignPreview = false;
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
    _ensurePuzzleTopicSubscription();
  }

  /// Topic subscriptions belong to a device's FCM token, and a fresh
  /// install (or reinstall, or cleared app data) gets a NEW token that
  /// was never subscribed. Subscribing only inside puzzle_screen's
  /// _optIn() meant anyone who'd already opted in before reinstalling
  /// never got re-subscribed, so daily-puzzle pushes silently never
  /// arrived. Re-asserting the subscription on every launch fixes
  /// that; subscribeToTopic is idempotent, so repeating it is harmless.
  /// Fire-and-forget and fully best-effort — never blocks or breaks
  /// the home screen.
  Future<void> _ensurePuzzleTopicSubscription() async {
    try {
      final uid = AuthService.currentUser?.uid;
      if (uid == null) return;
      final doc = await FirebaseFirestore.instance
          .collection('users').doc(uid).collection('progress').doc('summary').get();
      if (doc.data()?['puzzleSubscribed'] == true) {
        await FirebaseMessaging.instance.subscribeToTopic('daily_puzzle');
      }
    } catch (_) {
      // Offline or unreachable — will simply retry on the next launch.
    }
  }

  Future<void> _refresh() async {
    final finalExamScore = await ProgressService.getFinalExamBestScore();
    final hasFullAccess = await ProgressService.hasFullAccess();
    final isAdmin = await ProgressService.isAdmin();
    final hasDesignPreview = await ProgressService.hasDesignPreview();
    setState(() {
      _finalExamBestScore = finalExamScore;
      _hasFullAccess = hasFullAccess;
      _isAdmin = isAdmin;
      _hasDesignPreview = hasDesignPreview;
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
              : (_hasDesignPreview || true) // two-tile landing for all users
                  ? _buildPreviewHomeLayout()
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
                      ..._buildExistingModeCards(),
                      const SizedBox(height: 16),
                      _buildPulseCard(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ],
        ),
      ),
    );
  }

  /// The exact same 5 cards (Read Through through Video Tutorials,
  /// including the Final Certification Exam card) that have always
  /// been on this screen — extracted into their own method so both
  /// the live layout above AND the Fundamentals Hub screen (shown
  /// only to accounts with hasDesignPreview: true) can render the
  /// identical list without duplicating it in two places that could
  /// drift out of sync.
  List<Widget> _buildExistingModeCards() {
    return [
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
      // Final Certification Exam — positioned here,
      // right after Podcast, so the flow reads as
      // Read Through -> Podcast -> Certification.
      Card(
        margin: const EdgeInsets.only(bottom: 0),
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
      const SizedBox(height: 14),
      _LearningModeCard(
        icon: Icons.smart_display,
        iconColor: Colors.redAccent,
        title: 'Video Tutorials',
        subtitle: 'Short video walkthroughs of key concepts',
        badge: 'Coming Soon',
        onTap: () => _handleComingSoonTap(() async {}),
      ),
    ];
  }

  /// Shown only to accounts with hasDesignPreview: true (see
  /// ProgressService.hasDesignPreview) — the new 2-card top-level
  /// layout: "Cybersecurity Fundamentals" (opens a hub screen showing
  /// the exact same 5 cards from _buildExistingModeCards above) and
  /// "The Pulse (SOC Blue Team)" (currently a placeholder — the actual
  /// investigation simulator content isn't built yet). Every other
  /// account continues to see the unchanged live layout above.
  /// The Pulse entry card: animated heartbeat icon, shown to every user.
  Widget _buildPulseCard() {
    return _TopLevelPillarCard(
      icon: Icons.monitor_heart,
      iconColor: const Color(0xFFC62828),
      title: 'The Pulse',
      subtitleSmall: 'SOC Blue Team',
      subtitle: 'SOC fundamentals, detection, phishing analysis and real '
          'incident investigations',
      outlined: true,
      animateIcon: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ThePulseScreen()),
        );
      },
    );
  }

  Widget _buildPreviewHomeLayout() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        children: [
          _ProgressSummaryCard(finalExamBestScore: _finalExamBestScore),
          const SizedBox(height: 20),
          _TopLevelPillarCard(
            icon: Icons.menu_book,
            iconColor: const Color(0xFF1565C0),
            title: 'Cybersecurity Fundamentals',
            subtitle: 'Read Through, Podcast, Puzzles, Certification Exam & more',
            footerLabel: '5 ways to learn →',
            animateIcon: true,
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _FundamentalsHubScreen(
                    modeCards: _buildExistingModeCards(),
                  ),
                ),
              );
              _refresh();
            },
          ),
          const SizedBox(height: 16),
          _buildPulseCard(),
        ],
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

/// A top-level "pillar" card for the new 2-card preview home layout —
/// visually distinct from _LearningModeCard above (bigger, its own
/// icon treatment, room for a footer link or lock badge) since these
/// two cards need to read as bigger, more significant destinations
/// than the 5 cards nested one level down inside them.
class _TopLevelPillarCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitleSmall;
  final String subtitle;
  final String? footerLabel;
  final String? badge;
  final bool outlined;
  final bool animateIcon;
  final VoidCallback onTap;

  const _TopLevelPillarCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitleSmall,
    required this.subtitle,
    this.footerLabel,
    this.badge,
    this.outlined = false,
    this.animateIcon = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: outlined ? Border.all(color: iconColor.withValues(alpha: 0.4), width: 1.5) : null,
            boxShadow: outlined
                ? null
                : [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  animateIcon
                      ? _PulsingIcon(icon: icon, color: iconColor)
                      : Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: iconColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(icon, color: iconColor, size: 26),
                        ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                        if (subtitleSmall != null)
                          Text(subtitleSmall!, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(subtitle, style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700)),
              const SizedBox(height: 10),
              if (footerLabel != null)
                Text(footerLabel!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: iconColor)),
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badge!.toUpperCase(),
                    style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: iconColor, letterSpacing: 0.5),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The nested "hub" screen shown when tapping the "Cybersecurity
/// Fundamentals" pillar in the preview layout — renders the exact
/// same 5 cards (passed in from _TopicsScreenState.build) that live
/// directly on the current, unchanged home screen for everyone else.
class _FundamentalsHubScreen extends StatelessWidget {
  final List<Widget> modeCards;

  const _FundamentalsHubScreen({required this.modeCards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text('Cybersecurity Fundamentals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: modeCards,
      ),
    );
  }
}

/// Shows the 5 SOC Fundamentals lessons (Part A of the SOC
/// Investigations design — see soc_fundamentals_data.dart) as a
/// reading list. Tapping a lesson reuses the exact same LessonScreen
/// widget the core curriculum already uses — no new reading UI
/// needed. Below the lessons, the Investigation Practice list launches
/// the Part B simulator (see investigation_screen.dart).
class ThePulseScreen extends StatefulWidget {
  const ThePulseScreen();

  @override
  State<ThePulseScreen> createState() => ThePulseScreenState();
}

class ThePulseScreenState extends State<ThePulseScreen> {
  Set<String> _viewedLessons = {};
  bool _loading = true;
  bool _investigationsUnlocked = false;
  Map<String, InvestigationResult> _invResults = {};

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final viewed = await ProgressService.getViewedLessons();
    // Investigation Practice is a prerequisite-gated feature: it unlocks
    // once the Final Certification Exam has been passed (75%+). Admins
    // always have access for testing. The first scenario is a free preview
    // for everyone (see InvScenario.isPreview).
    final bestExam = await ProgressService.getFinalExamBestScore();
    final isAdmin = await ProgressService.isAdmin();
    final invResults = await InvestigationProgressService.getResults();
    if (mounted) {
      setState(() {
        _viewedLessons = viewed;
        _invResults = invResults;
        _investigationsUnlocked = isAdmin || (bestExam ?? 0) >= 75;
        _loading = false;
      });
    }
  }

  // Same key format lesson_screen.dart uses when calling
  // markLessonViewed — 'SOC Fundamentals' is this module's moduleTitle,
  // a distinct namespace from the core curriculum's chapter titles so
  // completion here never collides with Read Through progress.
  String _lessonKey(String lessonTitle, [String module = 'SOC Fundamentals']) =>
      '$module::$lessonTitle';

  static const String _detectionModule = 'Logs, SIEM & Detection';
  static const String _emailModule = 'Email & Phishing Analysis';
  static const String _endpointModule = 'Endpoint & Malware Triage';
  static const String _networkModule = 'Network & Traffic Analysis';
  static const String _cloudModule = 'Identity, Cloud & SaaS Investigations';
  static const String _irModule = 'Incident Response & Containment';
  static const String _opsModule = 'Threat Intel, Hunting & SOC Operations';

  // Chapter 1 = the six theory lessons plus its practice test.
  List<Lesson> get _fundamentalsAll =>
      [...socFundamentalsLessons, socFundamentalsPracticeTest];

  int _doneIn(String module, List<Lesson> lessons) => lessons
      .where((l) => _viewedLessons.contains(_lessonKey(l.title, module)))
      .length;

  /// Shown instead of the scenario list's free preview: what an
  /// investigation looks like, before certification unlocks them.
  Widget _sneakPeek() {
    Widget step(IconData i, String t, String d) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(i, size: 18, color: const Color(0xFFC62828)),
              const SizedBox(width: 10),
              Expanded(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '$t  ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                  TextSpan(
                      text: d,
                      style: TextStyle(
                          fontSize: 12.5, color: Colors.grey.shade800)),
                ])),
              ),
            ],
          ),
        );
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.lock_outline, size: 18, color: Colors.amber.shade900),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Unlocks when you pass the Final Certification Exam (75%+)',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade900),
              ),
            ),
          ]),
          const SizedBox(height: 10),
          const Text('What to expect',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          step(Icons.notifications_active, 'Alert.',
              'A realistic alert lands in your queue, just as it would in a SOC.'),
          step(Icons.fact_check, 'Triage and evidence.',
              'Decide what to check first. Some scenarios give a limited evidence budget, so you cannot look at everything.'),
          step(Icons.visibility, 'Spot the signs.',
              'Pick out the suspicious details in logs, headers or commands.'),
          step(Icons.balance, 'Verdict.',
              'True positive, false positive, or genuinely unclear. Some alerts are harmless, and you must say why.'),
          step(Icons.timeline, 'Timeline and containment.',
              'Order the events, then choose containment steps in the right sequence.'),
          step(Icons.description, 'Severity and report.',
              'Rate the impact and write the ticket note a colleague could act on.'),
          const SizedBox(height: 4),
          Text(
            'Pulse AI is switched off during investigations, and your best score on each scenario is saved.',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  /// One collapsible card per chapter: tap the header to show or hide its
  /// lessons. Collapsed by default so the screen stays short.
  Widget _moduleCard(String module, List<Lesson> lessons, IconData icon) {
    final done = _doneIn(module, lessons);
    final complete = done >= lessons.length;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: PageStorageKey<String>('pulse-module-$module'),
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
          leading: CircleAvatar(
            backgroundColor: (complete ? Colors.green : const Color(0xFFC62828))
                .withValues(alpha: 0.12),
            child: Icon(complete ? Icons.check_circle : icon,
                color: complete ? Colors.green : const Color(0xFFC62828)),
          ),
          title: Text(module,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Text(
            _loading
                ? '${lessons.length} lessons'
                : '$done of ${lessons.length} completed',
            style: TextStyle(
                fontSize: 12.5,
                color: complete ? Colors.green.shade800 : Colors.grey.shade700),
          ),
          children: _lessonTiles(module, lessons),
        ),
      ),
    );
  }

  List<Widget> _lessonTiles(String module, List<Lesson> lessons) {
    return [
      for (final lesson in lessons)
        Builder(builder: (context) {
          final isCompleted =
              _viewedLessons.contains(_lessonKey(lesson.title, module));
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            color: isCompleted ? Colors.green.withValues(alpha: 0.06) : null,
            child: ListTile(
              leading: isCompleted
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : CircleAvatar(
                      backgroundColor:
                          const Color(0xFFC62828).withValues(alpha: 0.12),
                      child: Icon(lesson.isQuiz ? Icons.quiz : Icons.menu_book,
                          color: const Color(0xFFC62828)),
                    ),
              title: Text(
                lesson.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isCompleted ? Colors.green.shade800 : null,
                ),
              ),
              subtitle: Text(lesson.isQuiz
                  ? '${lesson.quiz!.length} questions'
                  : '${lesson.estimatedMinutes} min read'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LessonScreen(
                      lesson: lesson,
                      moduleTitle: module,
                    ),
                  ),
                );
                // Refresh on return so a finished lesson shows as completed.
                _loadProgress();
              },
            ),
          );
        }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _doneIn('SOC Fundamentals', _fundamentalsAll) +
        _doneIn(_detectionModule, socDetectionLessons) +
        _doneIn(_emailModule, socEmailLessons) +
        _doneIn(_endpointModule, socEndpointLessons) +
        _doneIn(_networkModule, socNetworkLessons) +
        _doneIn(_cloudModule, socCloudLessons) +
        _doneIn(_irModule, socIrLessons) +
        _doneIn(_opsModule, socOpsLessons);
    final totalCount = _fundamentalsAll.length +
        socDetectionLessons.length +
        socEmailLessons.length +
        socEndpointLessons.length +
        socNetworkLessons.length +
        socCloudLessons.length +
        socIrLessons.length +
        socOpsLessons.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828),
        foregroundColor: Colors.white,
        title: const Text('The Pulse'),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 32 + MediaQuery.of(context).viewPadding.bottom),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.monitor_heart, color: Color(0xFFC62828), size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'SOC Blue Team — learn the fundamentals of incident '
                    'investigation, then practice real scenarios as a SOC '
                    'analyst.',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
                  ),
                ),
              ],
            ),
          ),
          if (!_loading && totalCount > 0)
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$completedCount of $totalCount lessons completed',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: totalCount == 0 ? 0.0 : completedCount / totalCount,
                      minHeight: 6,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        completedCount >= totalCount ? Colors.green : const Color(0xFFC62828),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          _moduleCard('SOC Fundamentals', _fundamentalsAll, Icons.menu_book),
          _moduleCard(_detectionModule, socDetectionLessons, Icons.manage_search),
          _moduleCard(_emailModule, socEmailLessons, Icons.mark_email_read),
          _moduleCard(_endpointModule, socEndpointLessons, Icons.computer),
          _moduleCard(_networkModule, socNetworkLessons, Icons.lan),
          _moduleCard(_cloudModule, socCloudLessons, Icons.cloud_queue),
          _moduleCard(_irModule, socIrLessons, Icons.local_fire_department),
          _moduleCard(_opsModule, socOpsLessons, Icons.radar),
          const SizedBox(height: 4),
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.antiAlias,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                key: const PageStorageKey<String>('pulse-module-investigations'),
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                leading: CircleAvatar(
                  backgroundColor:
                      const Color(0xFFC62828).withValues(alpha: 0.12),
                  child: const Icon(Icons.search, color: Color(0xFFC62828)),
                ),
                title: const Text('Investigation Practice',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  _loading
                      ? '${socInvestigationScenarios.length} scenarios'
                      : '${socInvestigationScenarios.where((x) => _invResults.containsKey(x.id)).length} of ${socInvestigationScenarios.length} scenarios completed',
                  style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700),
                ),
                children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 10),
            child: Text(
              'Work a real alert from first notification to final report, '
              'using the same seven-step workflow you just learned.',
              style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700),
            ),
          ),
          if (!_loading && !_investigationsUnlocked) _sneakPeek(),
          for (final scenario in socInvestigationScenarios)
            Builder(builder: (context) {
              final locked = !_investigationsUnlocked;
              final result = _invResults[scenario.id];
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                color: locked ? Colors.grey.shade100 : null,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: locked
                        ? Colors.grey.withValues(alpha: 0.2)
                        : const Color(0xFFC62828).withValues(alpha: 0.12),
                    child: Icon(
                        locked
                            ? Icons.lock
                            : (result != null ? Icons.check_circle : Icons.search),
                        color: locked
                            ? Colors.grey.shade600
                            : (result != null
                                ? Colors.green.shade700
                                : const Color(0xFFC62828))),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          scenario.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: locked ? Colors.grey.shade700 : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(result == null
                      ? '${scenario.category} · ${scenario.premise}'
                      : '${scenario.category} · Best: ${result.score}/${result.total} (${result.percent.round()}%)'),
                  trailing: Icon(locked ? Icons.lock_outline : Icons.arrow_forward_ios,
                      size: 16, color: locked ? Colors.grey.shade600 : null),
                  onTap: () {
                    if (locked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Investigations unlock after you pass the Final Certification Exam (75%+).'),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InvestigationScreen(scenario: scenario),
                      ),
                    ).then((_) => _loadProgress());
                  },
                ),
              );
            }),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
            child: Text(
              '${socInvestigationScenarios.length} scenarios, from phishing to cloud and AI incidents.',
              style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
            ),
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

/// A heartbeat-style pulsing icon: the icon itself scales in a
/// "lub-dub" rhythm (a quick pulse, a smaller second pulse, then a
/// pause — mimicking an actual heartbeat) while two rings
/// continuously expand outward from behind it and fade, like a
/// sonar/vibration ping. Built for "The Pulse" card specifically —
/// see _TopLevelPillarCard's animateIcon parameter.
class _PulsingIcon extends StatefulWidget {
  final IconData icon;
  final Color color;

  const _PulsingIcon({required this.icon, required this.color});

  @override
  State<_PulsingIcon> createState() => _PulsingIconState();
}

class _PulsingIconState extends State<_PulsingIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _heartbeatScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    // The "lub-dub" heartbeat curve: quick pulse up, back down, a
    // smaller second pulse, back down, then a pause before the next
    // beat — rather than a plain smooth sine-wave pulse, which reads
    // as more mechanical than an actual heartbeat.
    _heartbeatScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.16).chain(CurveTween(curve: Curves.easeOut)), weight: 12),
      TweenSequenceItem(tween: Tween(begin: 1.16, end: 1.0).chain(CurveTween(curve: Curves.easeIn)), weight: 13),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1).chain(CurveTween(curve: Curves.easeOut)), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0).chain(CurveTween(curve: Curves.easeIn)), weight: 10),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 55),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Renders one expanding, fading ring. [phaseOffset] staggers a
  /// second ring half a cycle behind the first, so a new ring starts
  /// expanding just as the previous one finishes fading — continuous
  /// outward motion rather than one ring pulsing in isolation.
  Widget _buildRing(double phaseOffset) {
    final t = (_controller.value + phaseOffset) % 1.0;
    return Opacity(
      opacity: (1.0 - t) * 0.5,
      child: Transform.scale(
        scale: 1.0 + t * 0.5,
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: widget.color, width: 2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: 66,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              _buildRing(0.0),
              _buildRing(0.5),
              Transform.scale(
                scale: _heartbeatScale.value,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(widget.icon, color: widget.color, size: 26),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
