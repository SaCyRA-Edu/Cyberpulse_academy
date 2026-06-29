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
      scores[entry.levelIndex] = await ProgressService.getBestScore(entry.levelIndex);
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
        title: const Text('About This Course'),
        content: const Text(
          'CyberPulse Academy is a vendor-neutral cybersecurity '
          'curriculum. The concepts taught — the CIA Triad, least '
          'privilege, defense in depth, Zero Trust, and more — apply '
          'across platforms and aren\'t tied to any single certification '
          'body or vendor product.\n\n'
          'Beginner topics are free and open. Intermediate, Advanced, and '
          'Expert topics unlock once you pass the previous level\'s exam '
          'at 80%+ — open one of those topics to see what\'s needed.',
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
                  final bestScore = _bestScoresByLevel[entry.levelIndex];

                  return _TopicCard(
                    entry: entry,
                    bestScore: bestScore,
                    onTap: () async {
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
              Icon(module.icon, size: 32, color: Colors.blue),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.title,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
