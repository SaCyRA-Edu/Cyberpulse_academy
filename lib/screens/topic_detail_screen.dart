import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../data/lesson_model.dart';
import '../data/domains_data.dart';
import '../widgets/watermark.dart';
import 'lesson_screen.dart';
import 'level_exam_screen.dart';

class TopicDetailScreen extends StatelessWidget {
  final TopicEntry entry;

  const TopicDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final module = entry.module;
    final lessons = module.lessons;
    final totalMinutes = lessons.fold<int>(0, (sum, l) => sum + l.estimatedMinutes);

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
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: _DomainRatioCard(primaryDomainIndex: module.primaryDomainIndex),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.blue.withValues(alpha: 0.06),
                  child: ListTile(
                    leading: const Icon(Icons.quiz, color: Colors.blue),
                    title: Text('${entry.level.title} Level Exam'),
                    subtitle: const Text('Adaptive · Test what you\'ve learned'),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Lessons',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('~$totalMinutes min total',
                        style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
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
                  subtitle: Row(
                    children: [
                      _DifficultyBadge(difficulty: lesson.difficulty),
                      const SizedBox(width: 8),
                      if (lesson.isAudio) ...[
                        const Text('Audio',
                            style: TextStyle(fontSize: 12, color: Colors.blue)),
                        const Text(' · ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                      Text('~${lesson.estimatedMinutes} min',
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
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

// ── Per-lesson difficulty badge ─────────────────────────────────────────────

class _DifficultyBadge extends StatelessWidget {
  final LessonDifficulty difficulty;

  const _DifficultyBadge({required this.difficulty});

  Color get _color {
    switch (difficulty) {
      case LessonDifficulty.beginner:
        return Colors.green;
      case LessonDifficulty.intermediate:
        return Colors.orange;
      case LessonDifficulty.advanced:
        return Colors.deepOrange;
      case LessonDifficulty.expert:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        difficulty.label,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: _color),
      ),
    );
  }
}

// ── CompTIA Security+ domain ratio card ────────────────────────────────────

class _DomainRatioCard extends StatelessWidget {
  final int primaryDomainIndex;

  const _DomainRatioCard({required this.primaryDomainIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.pie_chart, size: 18, color: Colors.blueGrey),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Aligned with CompTIA Security+ (SY0-701)',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < securityPlusDomains.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: _DomainBar(
                domain: securityPlusDomains[i],
                highlighted: i == primaryDomainIndex,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            'This topic primarily builds your knowledge in '
            '"${securityPlusDomains[primaryDomainIndex].name}."',
            style: const TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class _DomainBar extends StatelessWidget {
  final SecurityDomain domain;
  final bool highlighted;

  const _DomainBar({required this.domain, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(domain.icon, size: 14, color: highlighted ? domain.color : Colors.grey.shade400),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Text(
            domain.name,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: highlighted ? FontWeight.bold : FontWeight.normal,
              color: highlighted ? Colors.black87 : Colors.grey.shade600,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: domain.examWeightPercent / 30,
              minHeight: 8,
              backgroundColor: Colors.grey.shade100,
              color: highlighted ? domain.color : Colors.grey.shade300,
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 32,
          child: Text(
            '${domain.examWeightPercent}%',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: highlighted ? FontWeight.bold : FontWeight.normal,
              color: highlighted ? domain.color : Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}
