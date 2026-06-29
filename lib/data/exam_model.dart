/// Model for the adaptive Level Exams (distinct from the lighter per-module
/// practice quizzes in lesson_model.dart).
///
/// Each [ExamQuestion] is tagged with a [Difficulty]. The exam engine
/// (see LevelExamScreen) starts at medium difficulty and adjusts the next
/// question up or down based on whether the previous answer was correct —
/// a simple, transparent, rule-based form of adaptive testing.

enum Difficulty { easy, medium, hard }

extension DifficultyWeight on Difficulty {
  /// Harder questions are worth more toward the final score.
  int get weight {
    switch (this) {
      case Difficulty.easy:
        return 1;
      case Difficulty.medium:
        return 2;
      case Difficulty.hard:
        return 3;
    }
  }

  String get label {
    switch (this) {
      case Difficulty.easy:
        return 'Easy';
      case Difficulty.medium:
        return 'Medium';
      case Difficulty.hard:
        return 'Hard';
    }
  }
}

class ExamQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final Difficulty difficulty;

  const ExamQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.difficulty,
  });
}
