import 'package:flutter/material.dart';
import '../data/modules_data.dart';
import 'lesson_screen.dart';

class ModuleScreen extends StatelessWidget {
  final Module module;

  const ModuleScreen({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    final lessons = module.lessons;

    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: ListView.builder(
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
            leading: Icon(lesson.isQuiz ? Icons.quiz : Icons.book),
            title: Text(lesson.title),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
