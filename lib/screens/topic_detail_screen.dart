import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import 'lesson_screen.dart';
import 'level_exam_screen.dart';

const List<String> _levelOrder = ['Beginner', 'Intermediate', 'Advanced', 'Expert'];

class TopicDetailScreen extends StatefulWidget {
  final TopicEntry entry;

  const TopicDetailScreen({super.key, required this.entry});

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  bool _loading = true;
  String? _lockReason; // null = unlocked

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final reason = await ProgressService.getLockReason(
      levelIndex: widget.entry.levelIndex,
      levelIsFree: widget.entry.level.isFree,
    );
    setState(() {
      _lockReason = reason;
      _loading = false;
    });
  }

  void _showUpgradeDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Unlock ${widget.entry.level.title}'),
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
              await ProgressService.markLevelPurchased(widget.entry.levelIndex);
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

  void _showLevelInfo(String tappedLevel) {
    final isActive = tappedLevel == widget.entry.level.title;
    if (isActive) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${widget.entry.module.title} belongs to the '
          '${widget.entry.level.title} level, not $tappedLevel.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry.module.title),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : (_lockReason != null ? _buildLockedView() : _buildUnlockedView()),
    );
  }

  // -- Locked state -----------------------------------------------------------

  Widget _buildLockedView() {
    final level = widget.entry.level;
    final isPrereqIssue = _lockReason == 'previous_not_passed';
    final previousTitle = widget.entry.levelIndex > 0
        ? allLevels[widget.entry.levelIndex - 1].title
        : '';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 64, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              '${widget.entry.module.title} is locked',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              isPrereqIssue
                  ? 'This topic belongs to the ${level.title} level. Pass '
                      'the $previousTitle level exam with a score of 80% or '
                      'higher to unlock it.'
                  : 'This topic belongs to the ${level.title} level, which '
                      'is a premium level.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            if (!isPrereqIssue)
              FilledButton(
                onPressed: _showUpgradeDialog,
                child: const Text('Unlock This Level'),
              )
            else
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Topics'),
              ),
          ],
        ),
      ),
    );
  }

  // -- Unlocked state ---------------------------------------------------------

  Widget _buildUnlockedView() {
    final entry = widget.entry;
    final module = entry.module;
    final lessons = module.lessons;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: _LevelTabStrip(
            activeLevel: entry.level.title,
            onTap: _showLevelInfo,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            color: Colors.blue.withValues(alpha: 0.06),
            child: ListTile(
              leading: const Icon(Icons.quiz, color: Colors.blue),
              title: Text('${entry.level.title} Level Exam'),
              subtitle: const Text(
                'Adaptive · 80% required to pass and unlock the next level',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LevelExamScreen(
                      level: entry.level,
                      levelIndex: entry.levelIndex,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lessons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LessonScreen(lesson: lesson),
                    ),
                  );
                },
                leading: Icon(lesson.isQuiz ? Icons.quiz_outlined : Icons.book),
                title: Text(lesson.title),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LevelTabStrip extends StatelessWidget {
  final String activeLevel;
  final void Function(String tappedLevel) onTap;

  const _LevelTabStrip({required this.activeLevel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final levelTitle in _levelOrder)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: _LevelTab(
                title: levelTitle,
                isActive: levelTitle == activeLevel,
                onTap: () => onTap(levelTitle),
              ),
            ),
          ),
      ],
    );
  }
}

class _LevelTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _LevelTab({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
