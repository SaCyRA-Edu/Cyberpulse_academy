// Shared content models used across all modules.
//
// A [Lesson] is made up of [LessonSection]s (heading + paragraph + optional
// bullet list). A lesson may also carry a [quiz] — when it does,
// LessonScreen renders an interactive quiz instead of plain reading content.

class LessonSection {
  final String? heading;
  final String? body;
  final List<String>? bullets;

  const LessonSection({this.heading, this.body, this.bullets});
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

  const Lesson({
    required this.title,
    this.sections = const [],
    this.quiz,
    this.isAudio = false,
  });

  bool get isQuiz => quiz != null;
}
