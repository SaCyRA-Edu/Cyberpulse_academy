import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import 'level_detail_screen.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  // lockReasons[i] == null means level i is unlocked.
  List<String?> _lockReasons = [];
  Map<int, double?> _bestScores = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final reasons = <String?>[];
    final scores = <int, double?>{};
    for (var i = 0; i < allLevels.length; i++) {
      final reason = await ProgressService.getLockReason(
        levelIndex: i,
        levelIsFree: allLevels[i].isFree,
      );
      reasons.add(reason);
      scores[i] = await ProgressService.getBestScore(i);
    }
    setState(() {
      _lockReasons = reasons;
      _bestScores = scores;
      _loading = false;
    });
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('About This Course'),
        content: const Text(
          'CyberPulse Academy is a vendor-neutral cybersecurity '
          'curriculum. The concepts taught — the CIA Triad, least '
          'privilege, defense in depth, Zero Trust, and more — apply '
          'across platforms and aren\'t tied to any single certification '
          'body or vendor product.',
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

  void _showUpgradeDialog(int levelIndex) {
    final level = allLevels[levelIndex];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Unlock ${level.title}'),
        content: const Text(
          'This is a premium level. Real payment processing isn\'t wired '
          'up yet in this build — that needs a payment provider (Stripe, '
          'Google Play Billing, or Apple In-App Purchase) connected to a '
          'merchant account.\n\n'
          'For now, you can simulate unlocking it for testing.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              await ProgressService.markLevelPurchased(levelIndex);
              if (!context.mounted) return;
              Navigator.pop(context);
              _refresh();
            },
            child: const Text('Simulate Purchase (Dev Only)'),
          ),
        ],
      ),
    );
  }

  void _showPrerequisiteDialog(int levelIndex) {
    final previousTitle = allLevels[levelIndex - 1].title;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Level Locked'),
        content: Text(
          'Pass the $previousTitle level exam with a score of 80% or '
          'higher to unlock this level.',
        ),
        actions: [
          FilledButton(
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
      appBar: AppBar(
        title: const Text('CyberPulse Academy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About this course',
            onPressed: _showAbout,
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: allLevels.length,
                itemBuilder: (context, index) {
                  final level = allLevels[index];
                  final lockReason = _lockReasons[index];
                  final isLocked = lockReason != null;
                  final bestScore = _bestScores[index];

                  return _LevelCard(
                    level: level,
                    isLocked: isLocked,
                    bestScore: bestScore,
                    onTap: () async {
                      if (isLocked) {
                        if (lockReason == 'previous_not_passed') {
                          _showPrerequisiteDialog(index);
                        } else if (lockReason == 'not_purchased') {
                          _showUpgradeDialog(index);
                        }
                        return;
                      }
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LevelDetailScreen(
                            level: level,
                            levelIndex: index,
                          ),
                        ),
                      );
                      _refresh();
                    },
                  );
                },
              ),
            ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final Level level;
  final bool isLocked;
  final double? bestScore;
  final VoidCallback onTap;

  const _LevelCard({
    required this.level,
    required this.isLocked,
    required this.bestScore,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    isLocked ? Icons.lock : Icons.school,
                    size: 36,
                    color: isLocked ? Colors.grey : Colors.blue,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          level.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isLocked ? Colors.grey : null,
                          ),
                        ),
                        const SizedBox(height: 2),
                        _PriceBadge(isFree: level.isFree),
                      ],
                    ),
                  ),
                  if (isLocked) const Icon(Icons.lock_outline, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                level.description,
                style: TextStyle(
                  fontSize: 14,
                  color: isLocked ? Colors.grey : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${level.modules.length} modules · ${level.totalLessonCount} lessons + adaptive exam',
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              if (bestScore != null) ...[
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.emoji_events, size: 16, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      'Best exam score: ${bestScore!.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _PriceBadge extends StatelessWidget {
  final bool isFree;

  const _PriceBadge({required this.isFree});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isFree ? Colors.green.withValues(alpha: 0.15) : Colors.amber.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isFree ? 'FREE' : 'PREMIUM',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isFree ? Colors.green[800] : Colors.amber[800],
        ),
      ),
    );
  }
}
