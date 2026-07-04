// Shared content models used across all modules.
//
// A [Lesson] is made up of [LessonSection]s (heading + paragraph + optional
// bullet list + optional diagram). A lesson may also carry a [quiz] — when
// it does, LessonScreen renders an interactive quiz instead of plain
// reading content.

import '../widgets/diagrams.dart';

enum LessonDifficulty { beginner, intermediate, advanced, expert }

extension LessonDifficultyLabel on LessonDifficulty {
  String get label {
    switch (this) {
      case LessonDifficulty.beginner:
        return 'Beginner';
      case LessonDifficulty.intermediate:
        return 'Intermediate';
      case LessonDifficulty.advanced:
        return 'Advanced';
      case LessonDifficulty.expert:
        return 'Expert';
    }
  }
}

class LessonSection {
  final String? heading;
  final String? body;
  final List<String>? bullets;
  final DiagramSpec? diagram;

  const LessonSection({this.heading, this.body, this.bullets, this.diagram});
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class Lesson {
  final String title;
  final List<LessonSection> sections;
  final List<QuizQuestion>? quiz;
  final bool isAudio;
  final LessonDifficulty difficulty;

  /// Estimated minutes to complete this lesson (reading or listening).
  final int estimatedMinutes;

  const Lesson({
    required this.title,
    this.sections = const [],
    this.quiz,
    this.isAudio = false,
    this.estimatedMinutes = 5,
    this.difficulty = LessonDifficulty.beginner,
  });

  bool get isQuiz => quiz != null;
}
