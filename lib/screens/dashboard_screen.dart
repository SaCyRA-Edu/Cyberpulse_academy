import 'package:flutter/material.dart';
import '../data/modules_data.dart';
import '../widgets/module_card.dart';
import 'module_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberPulse Academy'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: allModules.length,
        itemBuilder: (context, index) {
          final module = allModules[index];
          return ModuleCard(
            title: module.title,
            icon: module.icon,
            lessonCount: module.lessonCount,
            difficulty: module.difficulty,
            progress: 0.0,
            xpReward: module.xpReward,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ModuleScreen(module: module),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
