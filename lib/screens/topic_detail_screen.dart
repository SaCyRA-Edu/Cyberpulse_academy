import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import 'lesson_screen.dart';
import 'level_exam_screen.dart';

const List<String> _levelOrder = ['Beginner', 'Intermediate', 'Advanced', 'Expert'];

class TopicDetailScreen extends StatelessWidget {
  final TopicEntry entry;

  const TopicDetailScreen({super.key, required this.entry});

  void _showLevelInfo(BuildContext context, String tappedLevel) {
    final isActive = tappedLevel == entry.level.title;
    if (isActive) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${entry.module.title} belongs to the ${entry.level.title} level, '
          'not $tappedLevel.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final module = entry.module;
    final lessons = module.lessons;

    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: _LevelTabStrip(
              activeLevel: entry.level.title,
              onTap: (tapped) => _showLevelInfo(context, tapped),
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
      ),
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
