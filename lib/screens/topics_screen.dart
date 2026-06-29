import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import 'topic_detail_screen.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  List<String?> _lockReasons = [];
  Map<int, double?> _bestScoresByLevel = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final reasons = <String?>[];
    final scores = <int, double?>{};
    for (final entry in allTopics) {
      final reason = await ProgressService.getLockReason(
        levelIndex: entry.levelIndex,
        levelIsFree: entry.level.isFree,
      );
      reasons.add(reason);
      scores[entry.levelIndex] = await ProgressService.getBestScore(entry.levelIndex);
    }
    setState(() {
      _lockReasons = reasons;
      _bestScoresByLevel = scores;
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
          'body or vendor product.\n\n'
          'Each topic below is tagged with the level it belongs to. '
          'Beginner is free; Intermediate, Advanced, and Expert unlock '
          'once you pass the previous level\'s exam at 80%+.',
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

  void _showUpgradeDialog(TopicEntry entry) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Unlock ${entry.level.title}'),
        content: const Text(
          'This topic belongs to a premium level. Real payment processing '
          'isn\'t wired up yet in this build — that needs a payment '
          'provider (Stripe, Google Play Billing, or Apple In-App '
          'Purchase) connected to a merchant account.\n\n'
          'For now, you can simulate unlocking it for testing.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              await ProgressService.markLevelPurchased(entry.levelIndex);
              if (!dialogContext.mounted) return;
              Navigator.pop(dialogContext);
              _refresh();
            },
            child: const Text('Simulate Purchase (Dev Only)'),
          ),
        ],
      ),
    );
  }

  void _showPrerequisiteDialog(TopicEntry entry) {
    final previousTitle = allLevels[entry.levelIndex - 1].title;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Topic Locked'),
        content: Text(
          'This topic belongs to the ${entry.level.title} level. Pass the '
          '$previousTitle level exam with a score of 80% or higher to '
          'unlock it.',
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
                itemCount: allTopics.length,
                itemBuilder: (context, index) {
                  final entry = allTopics[index];
                  final lockReason = _lockReasons[index];
                  final isLocked = lockReason != null;
                  final bestScore = _bestScoresByLevel[entry.levelIndex];

                  return _TopicCard(
                    entry: entry,
                    isLocked: isLocked,
                    bestScore: bestScore,
                    onTap: () async {
                      if (isLocked) {
                        if (lockReason == 'previous_not_passed') {
                          _showPrerequisiteDialog(entry);
                        } else if (lockReason == 'not_purchased') {
                          _showUpgradeDialog(entry);
                        }
                        return;
                      }
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TopicDetailScreen(entry: entry),
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

class _TopicCard extends StatelessWidget {
  final TopicEntry entry;
  final bool isLocked;
  final double? bestScore;
  final VoidCallback onTap;

  const _TopicCard({
    required this.entry,
    required this.isLocked,
    required this.bestScore,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final module = entry.module;
    final level = entry.level;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(
                isLocked ? Icons.lock : module.icon,
                size: 32,
                color: isLocked ? Colors.grey : Colors.blue,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: isLocked ? Colors.grey : null,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _LevelBadge(levelTitle: level.title, dimmed: isLocked),
                        const SizedBox(width: 6),
                        _PriceBadge(isFree: level.isFree, dimmed: isLocked),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${module.lessonCount} lessons',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    if (bestScore != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.emoji_events, size: 14, color: Colors.green),
                          const SizedBox(width: 4),
                          Text(
                            '${level.title} exam best: ${bestScore!.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 12,
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
              if (isLocked)
                const Icon(Icons.lock_outline, color: Colors.grey)
              else
                const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  final String levelTitle;
  final bool dimmed;

  const _LevelBadge({required this.levelTitle, required this.dimmed});

  @override
  Widget build(BuildContext context) {
    final color = dimmed ? Colors.grey : Colors.blue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        levelTitle.toUpperCase(),
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}

class _PriceBadge extends StatelessWidget {
  final bool isFree;
  final bool dimmed;

  const _PriceBadge({required this.isFree, required this.dimmed});

  @override
  Widget build(BuildContext context) {
    final color = dimmed ? Colors.grey : (isFree ? Colors.green : Colors.amber[800]!);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isFree ? 'FREE' : 'PREMIUM',
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
