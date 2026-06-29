import 'package:flutter/material.dart';
import '../data/lesson_model.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  // Quiz state: selected option index per question (-1 = unanswered).
  late List<int> _selectedAnswers;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    final quiz = widget.lesson.quiz;
    _selectedAnswers = quiz != null ? List.filled(quiz.length, -1) : [];
  }

  int get _score {
    final quiz = widget.lesson.quiz;
    if (quiz == null) return 0;
    var score = 0;
    for (var i = 0; i < quiz.length; i++) {
      if (_selectedAnswers[i] == quiz[i].correctIndex) score++;
    }
    return score;
  }

  bool get _allAnswered => !_selectedAnswers.contains(-1);

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: lesson.isQuiz ? _buildQuiz(lesson.quiz!) : _buildReadingContent(lesson),
    );
  }

  // -- Reading-style lesson ------------------------------------------------

  Widget _buildReadingContent(Lesson lesson) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final section in lesson.sections) _buildSection(section),
        ],
      ),
    );
  }

  Widget _buildSection(LessonSection section) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (section.heading != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                section.heading!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (section.body != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                section.body!,
                style: const TextStyle(fontSize: 18, height: 1.4),
              ),
            ),
          if (section.bullets != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final bullet in section.bullets!)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      '•  $bullet',
                      style: const TextStyle(fontSize: 18, height: 1.4),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  // -- Quiz -----------------------------------------------------------------

  Widget _buildQuiz(List<QuizQuestion> quiz) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Test what you\'ve learned across this module.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          if (_submitted) _buildScoreBanner(quiz.length),
          for (var i = 0; i < quiz.length; i++) _buildQuestion(i, quiz[i]),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitted
                  ? () => setState(() {
                        _submitted = false;
                        _selectedAnswers =
                            List.filled(quiz.length, -1);
                      })
                  : (_allAnswered ? () => setState(() => _submitted = true) : null),
              child: Text(_submitted ? 'Retake Quiz' : 'Submit Quiz'),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildScoreBanner(int total) {
    final score = _score;
    final passed = score >= (total * 0.7).ceil();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: passed ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: passed ? Colors.green : Colors.orange,
        ),
      ),
      child: Row(
        children: [
          Icon(
            passed ? Icons.emoji_events : Icons.refresh,
            color: passed ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'You scored $score / $total'
              '${passed ? ' — nice work!' : ' — review the explanations and try again.'}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(int index, QuizQuestion q) {
    final selected = _selectedAnswers[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1}. ${q.question}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (var optIndex = 0; optIndex < q.options.length; optIndex++)
            _buildOption(index, q, optIndex, selected),
          if (_submitted) ...[
            const SizedBox(height: 8),
            Text(
              q.explanation,
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOption(int qIndex, QuizQuestion q, int optIndex, int selected) {
    Color? tileColor;
    if (_submitted) {
      if (optIndex == q.correctIndex) {
        tileColor = Colors.green.withOpacity(0.15);
      } else if (optIndex == selected) {
        tileColor = Colors.red.withOpacity(0.15);
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<int>(
        contentPadding: EdgeInsets.zero,
        dense: true,
        value: optIndex,
        groupValue: selected == -1 ? null : selected,
        title: Text(q.options[optIndex], style: const TextStyle(fontSize: 15)),
        onChanged: _submitted
            ? null
            : (value) {
                setState(() {
                  _selectedAnswers[qIndex] = value!;
                });
              },
      ),
    );
  }
}
