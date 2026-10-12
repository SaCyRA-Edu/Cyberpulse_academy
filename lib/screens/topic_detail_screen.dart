import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import '../widgets/watermark.dart';
import 'lesson_screen.dart';

class TopicDetailScreen extends StatefulWidget {
  final TopicEntry entry;

  const TopicDetailScreen({super.key, required this.entry});

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  Set<String> _viewedLessons = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final viewed = await ProgressService.getViewedLessons();
    if (mounted) {
      setState(() {
        _viewedLessons = viewed;
        _loading = false;
      });
    }
  }

  /// Same key format lesson_screen.dart uses when calling
  /// markLessonViewed — moduleTitle::lessonTitle — so this must stay
  /// in sync with that exact string construction.
  String _lessonKey(String moduleTitle, String lessonTitle) => '$moduleTitle::$lessonTitle';

  @override
  Widget build(BuildContext context) {
    final module = widget.entry.module;
    final lessons = module.lessons;

    final completedCount = lessons.where((l) => _viewedLessons.contains(_lessonKey(module.title, l.title))).length;
    final totalCount = lessons.length;
    final progressFraction = totalCount == 0 ? 0.0 : completedCount / totalCount;

    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: CyberPulseWatermark()),
          ListView(
            children: [
              if (!_loading && totalCount > 0)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$completedCount of $totalCount lessons completed',
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${(progressFraction * 100).round()}%',
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: progressFraction,
                          minHeight: 6,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            progressFraction >= 1.0 ? Colors.green : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text('Lessons',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              for (final lesson in lessons)
                Builder(builder: (context) {
                  final isCompleted = _viewedLessons.contains(_lessonKey(module.title, lesson.title));
                  return ListTile(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LessonScreen(
                            lesson: lesson,
                            moduleTitle: module.title,
                          ),
                        ),
                      );
                      // Refresh completion status on return, so a lesson
                      // just finished shows as completed immediately
                      // rather than only after leaving and re-entering
                      // this whole screen.
                      _loadProgress();
                    },
                    tileColor: isCompleted ? Colors.green.withValues(alpha: 0.06) : null,
                    leading: isCompleted
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : Icon(
                            lesson.isAudio
                                ? Icons.headphones
                                : lesson.isQuiz
                                    ? Icons.quiz_outlined
                                    : Icons.menu_book,
                            color: lesson.isAudio ? Colors.blue : null,
                          ),
                    title: Text(
                      lesson.title,
                      style: isCompleted ? const TextStyle(color: Colors.green, fontWeight: FontWeight.w600) : null,
                    ),
                    subtitle: lesson.isAudio
                        ? const Text('Audio',
                            style: TextStyle(fontSize: 12, color: Colors.blue))
                        : null,
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  );
                }),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
