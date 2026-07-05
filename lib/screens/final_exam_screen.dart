import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../data/lesson_model.dart';
import '../data/final_exam_data.dart';
import 'certificate_screen.dart';

const int _totalQuestions = 100;
const int _examMinutes = 120;
const double _passThreshold = 75.0;

// ═══════════════════════════════════════════════════════════════════════
// Start Screen
// ═══════════════════════════════════════════════════════════════════════

class FinalExamStartScreen extends StatelessWidget {
  const FinalExamStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Final Certification Exam')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade700, Colors.indigo.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.workspace_premium, size: 56, color: Colors.white),
                    const SizedBox(height: 12),
                    const Text(
                      'Final Certification Exam',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Covers every topic in this course',
                      style: TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _InfoRow(icon: Icons.quiz, label: 'Questions', value: '$_totalQuestions'),
              _InfoRow(icon: Icons.timer, label: 'Time Limit', value: '$_examMinutes minutes'),
              _InfoRow(icon: Icons.grade, label: 'Passing Score', value: '${_passThreshold.toInt()}%'),
              _InfoRow(icon: Icons.workspace_premium, label: 'On Passing', value: 'Certificate awarded'),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amber.shade300),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Once started, the timer cannot be paused. You can flag '
                        'questions and revisit them using the question navigator '
                        'before submitting.',
                        style: TextStyle(fontSize: 12.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FinalExamScreen()),
                    );
                  },
                  child: const Text('Begin Exam', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.indigo),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Exam Screen
// ═══════════════════════════════════════════════════════════════════════

class FinalExamScreen extends StatefulWidget {
  const FinalExamScreen({super.key});

  @override
  State<FinalExamScreen> createState() => _FinalExamScreenState();
}

class _FinalExamScreenState extends State<FinalExamScreen> {
  late List<QuizQuestion> _questions;
  late List<int?> _answers;
  late List<bool> _flagged;
  int _currentIndex = 0;

  late int _remainingSeconds;
  Timer? _timer;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    final shuffled = List<QuizQuestion>.from(finalExamQuestions)..shuffle(Random());
    _questions = shuffled.take(_totalQuestions).toList();
    _answers = List<int?>.filled(_questions.length, null);
    _flagged = List<bool>.filled(_questions.length, false);
    _remainingSeconds = _examMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() => _remainingSeconds = 0);
        _autoSubmit();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final m = _remainingSeconds ~/ 60;
    final s = _remainingSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  int get _answeredCount => _answers.where((a) => a != null).length;

  void _autoSubmit() {
    if (_submitted) return;
    _submitted = true;
    _goToResults();
  }

  void _goToResults() {
    _timer?.cancel();
    final secondsUsed = _examMinutes * 60 - _remainingSeconds;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => FinalExamResultsScreen(
          questions: _questions,
          answers: _answers,
          secondsUsed: secondsUsed,
        ),
      ),
    );
  }

  Future<void> _confirmSubmit() async {
    final unanswered = _questions.length - _answeredCount;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Submit Exam?'),
        content: Text(
          unanswered > 0
              ? 'You have $unanswered unanswered question(s). Once submitted, you cannot return to the exam.'
              : 'You have answered every question. Once submitted, you cannot return to the exam.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Keep Working')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Submit')),
        ],
      ),
    );
    if (confirmed == true) {
      _submitted = true;
      _goToResults();
    }
  }

  Future<bool> _confirmExit() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Exit Exam?'),
        content: const Text(
          'Leaving now will end your exam attempt and it will be scored as-is. Continue?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Stay')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Exit & Submit'),
          ),
        ],
      ),
    );
    return confirmed == true;
  }

  void _showNavigator() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question Navigator', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 10,
                    children: [
                      _legendDot(Colors.green, 'Answered'),
                      _legendDot(Colors.orange, 'Flagged'),
                      _legendDot(Colors.grey.shade300, 'Unanswered'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      itemCount: _questions.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, i) {
                        final answered = _answers[i] != null;
                        final flagged = _flagged[i];
                        Color bg = Colors.grey.shade200;
                        Color fg = Colors.black87;
                        if (flagged) {
                          bg = Colors.orange;
                          fg = Colors.white;
                        } else if (answered) {
                          bg = Colors.green;
                          fg = Colors.white;
                        }
                        final isCurrent = i == _currentIndex;
                        return InkWell(
                          onTap: () {
                            setState(() => _currentIndex = i);
                            Navigator.pop(ctx);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: bg,
                              borderRadius: BorderRadius.circular(8),
                              border: isCurrent ? Border.all(color: Colors.indigo, width: 2) : null,
                            ),
                            alignment: Alignment.center,
                            child: Text('${i + 1}', style: TextStyle(color: fg, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_currentIndex];
    final lowTime = _remainingSeconds <= 300; // last 5 minutes

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldExit = await _confirmExit();
        if (shouldExit && context.mounted) {
          _submitted = true;
          _goToResults();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Question ${_currentIndex + 1} of ${_questions.length}'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: lowTime ? Colors.red.withValues(alpha: 0.15) : Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.timer, size: 16, color: lowTime ? Colors.red : null),
                  const SizedBox(width: 6),
                  Text(
                    _formattedTime,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: lowTime ? Colors.red : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              minHeight: 4,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$_answeredCount of ${_questions.length} answered',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                        TextButton.icon(
                          onPressed: () => setState(() => _flagged[_currentIndex] = !_flagged[_currentIndex]),
                          icon: Icon(
                            _flagged[_currentIndex] ? Icons.flag : Icons.outlined_flag,
                            color: _flagged[_currentIndex] ? Colors.orange : Colors.grey,
                            size: 18,
                          ),
                          label: Text(
                            _flagged[_currentIndex] ? 'Flagged' : 'Flag for Review',
                            style: TextStyle(color: _flagged[_currentIndex] ? Colors.orange : Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      q.question,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.4),
                    ),
                    const SizedBox(height: 20),
                    for (var i = 0; i < q.options.length; i++)
                      _OptionTile(
                        letter: String.fromCharCode(65 + i),
                        text: q.options[i],
                        selected: _answers[_currentIndex] == i,
                        onTap: () => setState(() => _answers[_currentIndex] = i),
                      ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 6, offset: const Offset(0, -2))],
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _currentIndex > 0 ? () => setState(() => _currentIndex--) : null,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _showNavigator,
                        icon: const Icon(Icons.grid_view, size: 18),
                        label: const Text('Navigator'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton(
                        onPressed: _confirmSubmit,
                        style: FilledButton.styleFrom(backgroundColor: Colors.green.shade700),
                        child: const Text('Submit'),
                      ),
                    ),
                    IconButton(
                      onPressed: _currentIndex < _questions.length - 1
                          ? () => setState(() => _currentIndex++)
                          : null,
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String letter;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _OptionTile({
    required this.letter,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? Colors.indigo.withValues(alpha: 0.08) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? Colors.indigo : Colors.grey.shade300, width: selected ? 2 : 1),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: selected ? Colors.indigo : Colors.grey.shade200,
              child: Text(
                letter,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Results Screen
// ═══════════════════════════════════════════════════════════════════════

class FinalExamResultsScreen extends StatelessWidget {
  final List<QuizQuestion> questions;
  final List<int?> answers;
  final int secondsUsed;

  const FinalExamResultsScreen({
    super.key,
    required this.questions,
    required this.answers,
    required this.secondsUsed,
  });

  int get _score {
    var s = 0;
    for (var i = 0; i < questions.length; i++) {
      if (answers[i] == questions[i].correctIndex) s++;
    }
    return s;
  }

  double get _percentage => (_score / questions.length) * 100;
  bool get _passed => _percentage >= _passThreshold;

  String get _timeUsedFormatted {
    final m = secondsUsed ~/ 60;
    final s = secondsUsed % 60;
    return '${m}m ${s}s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Results'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _passed
                      ? [Colors.green.shade700, Colors.green.shade400]
                      : [Colors.red.shade700, Colors.red.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(_passed ? Icons.emoji_events : Icons.refresh, color: Colors.white, size: 56),
                  const SizedBox(height: 12),
                  Text(
                    _passed ? 'Congratulations — You Passed!' : 'Not Quite — Keep Studying',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_percentage.toStringAsFixed(1)}%',
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    '$_score correct out of ${questions.length}',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _StatCard(label: 'Passing Score', value: '${_passThreshold.toInt()}%')),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(label: 'Time Used', value: _timeUsedFormatted)),
              ],
            ),
            const SizedBox(height: 24),
            if (_passed)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: const Icon(Icons.workspace_premium),
                  label: const Text('Get Your Certificate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CertificateScreen(scorePercentage: _percentage),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.fact_check_outlined),
                label: const Text('Review Answers'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => _ReviewScreen(questions: questions, answers: answers),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Return to Course'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Review Screen
// ═══════════════════════════════════════════════════════════════════════

class _ReviewScreen extends StatelessWidget {
  final List<QuizQuestion> questions;
  final List<int?> answers;

  const _ReviewScreen({required this.questions, required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review Answers')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: questions.length,
        itemBuilder: (context, i) {
          final q = questions[i];
          final selected = answers[i];
          final correct = selected == q.correctIndex;
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border.all(color: correct ? Colors.green.shade200 : Colors.red.shade200),
              borderRadius: BorderRadius.circular(10),
              color: correct ? Colors.green.withValues(alpha: 0.04) : Colors.red.withValues(alpha: 0.04),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(correct ? Icons.check_circle : Icons.cancel, color: correct ? Colors.green : Colors.red, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text('${i + 1}. ${q.question}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                for (var o = 0; o < q.options.length; o++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '${String.fromCharCode(65 + o)}. ${q.options[o]}'
                      '${o == q.correctIndex ? '  [correct]' : (o == selected ? '  [your answer]' : '')}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: o == q.correctIndex ? FontWeight.bold : FontWeight.normal,
                        color: o == q.correctIndex
                            ? Colors.green.shade800
                            : (o == selected ? Colors.red.shade800 : Colors.black87),
                      ),
                    ),
                  ),
                const SizedBox(height: 6),
                Text(q.explanation, style: TextStyle(fontSize: 12.5, fontStyle: FontStyle.italic, color: Colors.grey.shade700)),
              ],
            ),
          );
        },
      ),
    );
  }
}
