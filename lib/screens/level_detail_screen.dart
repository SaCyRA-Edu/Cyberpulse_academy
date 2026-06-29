import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import 'module_screen.dart';
import 'level_exam_screen.dart';

class LevelDetailScreen extends StatelessWidget {
  final Level level;
  final int levelIndex;

  const LevelDetailScreen({
    super.key,
    required this.level,
    required this.levelIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(level.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            level.description,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          const Text(
            'Modules',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (final module in level.modules)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Icon(module.icon, color: Colors.blue),
                title: Text(module.title),
                subtitle: Text(
                  '${module.lessonCount} lessons · ${module.xpReward} XP',
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ModuleScreen(module: module),
                    ),
                  );
                },
              ),
            ),
          const SizedBox(height: 20),
          const Text(
            'Level Exam',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            color: Colors.blue.withOpacity(0.06),
            child: ListTile(
              leading: const Icon(Icons.quiz, color: Colors.blue),
              title: Text('${level.title} Exam (Adaptive)'),
              subtitle: const Text(
                'Difficulty adjusts to your answers · 80% required to pass '
                'and unlock the next level',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LevelExamScreen(
                      level: level,
                      levelIndex: levelIndex,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
