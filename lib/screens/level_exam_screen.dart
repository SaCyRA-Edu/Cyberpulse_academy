import 'dart:math';
import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../data/exam_model.dart';
import '../services/progress_service.dart';

const int _examLength = 10;
const double _passThreshold = 80.0;

class LevelExamScreen extends StatefulWidget {
  final Level level;
  final int levelIndex;

  const LevelExamScreen({
    super.key,
    required this.level,
    required this.levelIndex,
  });

  @override
  State<LevelExamScreen> createState() => _LevelExamScreenState();
}

class _LevelExamScreenState extends State<LevelExamScreen> {
  late List<List<ExamQuestion>> _pools; // [easy, medium, hard]
  final List<ExamQuestion> _asked = [];
  final List<int> _selectedAnswers = [];
  final List<bool> _correctness = [];

  int _difficultyIndex = 1; // start at medium
  int? _currentSelection;
  bool _currentAnswered = false;
  bool _examFinished = false;

  int _score = 0;
  int _maxScore = 0;

  late int _examLengthForThisExam;

  @override
  void initState() {
    super.initState();
    _setUpPools();
    _examLengthForThisExam = min(_examLength, widget.level.examBank.length);
    _pickNextQuestion();
  }

  void _setUpPools() {
    final rng = Random();
    List<ExamQuestion> byDifficulty(Difficulty d) {
      final list = widget.level.examBank.where((q) => q.difficulty == d).toList();
      list.shuffle(rng);
      return list;
    }

    _pools = [
      byDifficulty(Difficulty.easy),
      byDifficulty(Difficulty.medium),
      byDifficulty(Difficulty.hard),
    ];
  }

  ExamQuestion? _pickFrom(int desiredIndex) {
    final order = <int>[desiredIndex];
    for (var d = 1; d <= 2; d++) {
      if (desiredIndex - d >= 0) order.add(desiredIndex - d);
      if (desiredIndex + d <= 2) order.add(desiredIndex + d);
    }
    for (final idx in order) {
      if (_pools[idx].isNotEmpty) {
        return _pools[idx].removeAt(0);
      }
    }
    return null;
  }

  void _pickNextQuestion() {
    final next = _pickFrom(_difficultyIndex);
    if (next == null) {
      _finishExam();
      return;
    }
    setState(() {
      _asked.add(next);
      _currentSelection = null;
      _currentAnswered = false;
    });
  }

  void _selectAnswer(int optionIndex) {
    if (_currentAnswered) return;
    final current = _asked.last;
    final correct = optionIndex == current.correctIndex;

    setState(() {
      _currentSelection = optionIndex;
      _currentAnswered = true;
      _selectedAnswers.add(optionIndex);
      _correctness.add(correct);

      _maxScore += current.difficulty.weight;
      if (correct) {
        _score += current.difficulty.weight;
        _difficultyIndex = min(_difficultyIndex + 1, 2);
      } else {
        _difficultyIndex = max(_difficultyIndex - 1, 0);
      }
    });
  }

  void _next() {
    if (_asked.length >= _examLengthForThisExam) {
      _finishExam();
    } else {
      _pickNextQuestion();
    }
  }

  Future<void> _finishExam() async {
    final percent = _maxScore == 0 ? 0.0 : (_score / _maxScore) * 100;
    setState(() => _examFinished = true);
    if (percent >= _passThreshold) {
      await ProgressService.markLevelPassed(widget.levelIndex, percent);
    }
  }

  void _retake() {
    setState(() {
      _asked.clear();
      _selectedAnswers.clear();
      _correctness.clear();
      _difficultyIndex = 1;
      _score = 0;
      _maxScore = 0;
      _examFinished = false;
      _setUpPools();
    });
    _pickNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.level.title} Exam'),
      ),
      body: _examFinished ? _buildResults() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    if (_asked.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    final q = _asked.last;
    final questionNumber = _asked.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question $questionNumber of $_examLengthForThisExam',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              _DifficultyChip(difficulty: q.difficulty),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: questionNumber / _examLengthForThisExam,
            minHeight: 6,
            borderRadius: BorderRadius.circular(6),
          ),
          const SizedBox(height: 24),
          Text(
            q.question,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < q.options.length; i++) _buildOption(q, i),
          if (_currentAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                q.explanation,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _next,
                child: Text(
                  questionNumber >= _examLengthForThisExam
                      ? 'See Results'
                      : 'Next Question',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOption(ExamQuestion q, int optIndex) {
    Color? tileColor;
    if (_currentAnswered) {
      if (optIndex == q.correctIndex) {
        tileColor = Colors.green.withOpacity(0.15);
      } else if (optIndex == _currentSelection) {
        tileColor = Colors.red.withOpacity(0.15);
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: tileColor,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile<int>(
        value: optIndex,
        groupValue: _currentSelection,
        title: Text(q.options[optIndex]),
        onChanged: _currentAnswered ? null : (v) => _selectAnswer(v!),
      ),
    );
  }

  Widget _buildResults() {
    final percent = _maxScore == 0 ? 0.0 : (_score / _maxScore) * 100;
    final passed = percent >= _passThreshold;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: passed ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: passed ? Colors.green : Colors.orange),
            ),
            child: Column(
              children: [
                Icon(
                  passed ? Icons.emoji_events : Icons.refresh,
                  size: 48,
                  color: passed ? Colors.green : Colors.orange,
                ),
                const SizedBox(height: 12),
                Text(
                  '${percent.toStringAsFixed(0)}%',
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  passed
                      ? 'Passed! ${widget.level.title} is complete — the next level is now unlocked (if its prerequisites are met).'
                      : 'Not quite — you need 80% to pass. Review the explanations below and try again.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Review',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < _asked.length; i++) _buildReviewRow(i),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back to Level'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _retake,
                  child: const Text('Retake Exam'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildReviewRow(int index) {
    final q = _asked[index];
    final correct = _correctness[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            correct ? Icons.check_circle : Icons.cancel,
            color: correct ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}. ${q.question}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'Correct answer: ${q.options[q.correctIndex]}',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  final Difficulty difficulty;

  const _DifficultyChip({required this.difficulty});

  Color get _color {
    switch (difficulty) {
      case Difficulty.easy:
        return Colors.green;
      case Difficulty.medium:
        return Colors.orange;
      case Difficulty.hard:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        difficulty.label,
        style: TextStyle(color: _color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
