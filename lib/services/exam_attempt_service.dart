import 'package:cloud_functions/cloud_functions.dart';

class ExamPublicQuestion {
  final String questionId;
  final String question;
  final List<String> options;

  const ExamPublicQuestion({
    required this.questionId,
    required this.question,
    required this.options,
  });

  factory ExamPublicQuestion.fromMap(Map<String, dynamic> map) {
    return ExamPublicQuestion(
      questionId: map['questionId'] as String,
      question: map['question'] as String,
      options: List<String>.from(map['options'] as List),
    );
  }
}

class ExamAreaResult {
  final String area;
  final int correct;
  final int total;
  const ExamAreaResult({required this.area, required this.correct, required this.total});

  factory ExamAreaResult.fromMap(Map<String, dynamic> map) {
    return ExamAreaResult(
      area: map['area'] as String,
      correct: (map['correct'] as num).toInt(),
      total: (map['total'] as num).toInt(),
    );
  }
}

class ExamStartResult {
  final String attemptId;
  final int timeLimitSeconds;
  final List<ExamPublicQuestion> questions;

  const ExamStartResult({
    required this.attemptId,
    required this.timeLimitSeconds,
    required this.questions,
  });
}

class ExamFinalResult {
  final double finalPercentage;
  final bool finalPassed;
  final int correctCount;
  final int totalQuestions;
  final List<ExamAreaResult> areaBreakdown;

  const ExamFinalResult({
    required this.finalPercentage,
    required this.finalPassed,
    required this.correctCount,
    required this.totalQuestions,
    required this.areaBreakdown,
  });
}

/// Batch exam model: [startAttempt] hands over every question up front
/// (never the correct answers), the app lets the user navigate freely
/// and flag questions, and [submitExam] grades everything in one shot
/// when the user is ready to finish. There is no per-question round
/// trip and no post-exam answer review — only the final score,
/// pass/fail, and area breakdown come back.
class ExamAttemptService {
  static final _functions = FirebaseFunctions.instance;

  static Future<ExamStartResult> startAttempt() async {
    final result = await _functions.httpsCallable('startExamAttempt').call();
    final data = Map<String, dynamic>.from(result.data as Map);
    final rawQuestions = List<dynamic>.from(data['questions'] as List);
    return ExamStartResult(
      attemptId: data['attemptId'] as String,
      timeLimitSeconds: (data['timeLimitSeconds'] as num).toInt(),
      questions: rawQuestions
          .map((e) => ExamPublicQuestion.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }

  /// [answers] maps questionId -> selected position (0-based, in the
  /// shuffled order that question was shown). Questions the user never
  /// answered should simply be absent from the map.
  static Future<ExamFinalResult> submitExam({
    required String attemptId,
    required Map<String, int> answers,
  }) async {
    final result = await _functions.httpsCallable('submitExam').call({
      'attemptId': attemptId,
      'answers': answers,
    });
    final data = Map<String, dynamic>.from(result.data as Map);
    final rawBreakdown = List<dynamic>.from(data['areaBreakdown'] as List);
    return ExamFinalResult(
      finalPercentage: (data['finalPercentage'] as num).toDouble(),
      finalPassed: data['finalPassed'] as bool,
      correctCount: (data['correctCount'] as num).toInt(),
      totalQuestions: (data['totalQuestions'] as num).toInt(),
      areaBreakdown: rawBreakdown
          .map((e) => ExamAreaResult.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }
}
