import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../widgets/watermark.dart';
import 'lesson_screen.dart';

class TopicDetailScreen extends StatelessWidget {
  final TopicEntry entry;

  const TopicDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final module = entry.module;
    final lessons = module.lessons;

    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: CyberPulseWatermark()),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text('Lessons',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              for (final lesson in lessons)
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonScreen(
                          lesson: lesson,
                          moduleTitle: module.title,
                        ),
                      ),
                    );
                  },
                  leading: Icon(
                    lesson.isAudio
                        ? Icons.headphones
                        : lesson.isQuiz
                            ? Icons.quiz_outlined
                            : Icons.menu_book,
                    color: lesson.isAudio ? Colors.blue : null,
                  ),
                  title: Text(lesson.title),
                  subtitle: lesson.isAudio
                      ? const Text('Audio',
                          style: TextStyle(fontSize: 12, color: Colors.blue))
                      : null,
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
