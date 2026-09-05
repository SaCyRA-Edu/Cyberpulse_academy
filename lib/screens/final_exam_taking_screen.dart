import 'dart:async';
import 'package:flutter/material.dart';
import '../services/exam_attempt_service.dart';
import 'certificate_screen.dart';

const int _examMinutes = 120;
const double _passThreshold = 75.0;

/// Batch-model exam screen: every question is fetched up front, the
/// user can jump between questions freely, flag any of them for later,
/// change answers as many times as they like, and submit everything
/// together whenever ready. Grading happens once, entirely
/// server-side, at submission — the app never learns a correct answer
/// at any point, before or after.
class FinalExamScreen extends StatefulWidget {
  const FinalExamScreen({super.key});

  @override
  State<FinalExamScreen> createState() => _FinalExamScreenState();
}

class _FinalExamScreenState extends State<FinalExamScreen> {
  bool _loading = true;
  String? _error;
  bool _submitting = false;

  String? _attemptId;
  List<ExamPublicQuestion> _questions = [];
  int _currentIndex = 0;

  final Map<String, int> _answers = {}; // questionId -> selected position
  final Set<String> _flagged = {};

  int _remainingSeconds = _examMinutes * 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await ExamAttemptService.startAttempt();
      setState(() {
        _attemptId = result.attemptId;
        _questions = result.questions;
        _remainingSeconds = result.timeLimitSeconds;
        _loading = false;
      });
      _startTimer();
    } catch (e) {
      setState(() {
        _loading = false;
        _error = 'Could not start the exam: $e';
      });
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() => _remainingSeconds = 0);
        _submit(auto: true);
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  String get _timeFormatted {
    final m = _remainingSeconds ~/ 60;
    final s = _remainingSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  void _toggleFlag(String questionId) {
    setState(() {
      if (_flagged.contains(questionId)) {
        _flagged.remove(questionId);
      } else {
        _flagged.add(questionId);
      }
    });
  }

  Future<void> _submit({bool auto = false}) async {
    // Time-expiry auto-submit bypasses these checks entirely — when
    // time is up, whatever's answered gets graded regardless of flags
    // or gaps, matching how the server-side time enforcement already
    // behaves. Manual submission, however, is now a hard block, not
    // just a warning: every question must be answered and every flag
    // cleared before the button will do anything.
    if (!auto) {
      final unanswered = _questions.length - _answers.length;
      if (unanswered > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'You have $unanswered unanswered question${unanswered == 1 ? '' : 's'}. '
              'All questions must be answered before you can submit.',
            ),
            action: SnackBarAction(label: 'Review', onPressed: _showNavigator),
          ),
        );
        return;
      }
      if (_flagged.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'You have ${_flagged.length} flagged question${_flagged.length == 1 ? '' : 's'} still marked '
              'for review. Unflag ${_flagged.length == 1 ? 'it' : 'them'} before submitting.',
            ),
            action: SnackBarAction(label: 'Review', onPressed: _showNavigator),
          ),
        );
        return;
      }

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Submit exam?'),
          content: const Text('You\'ve answered every question and cleared all flags. Ready to submit?'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Keep Reviewing')),
            TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Submit')),
          ],
        ),
      );
      if (confirmed != true) return;
    }

    setState(() => _submitting = true);
    _timer?.cancel();
    try {
      final result = await ExamAttemptService.submitExam(
        attemptId: _attemptId!,
        answers: _answers,
      );
      // NOTE: markFinalExamAttempt() is deliberately NOT called here
      // anymore. The submitExam Cloud Function already writes
      // finalExamScore and finalExamHistory directly to Firestore as
      // part of its own transaction — that's the authoritative,
      // correct write. Having the client ALSO call
      // ProgressService.markFinalExamAttempt() here raced against that
      // server write, reading a local cache that could be stale (e.g.
      // still reflecting an old attempt) and re-pushing that stale
      // data back to Firestore right after the server had just
      // corrected it — which is what caused every attempt to display
      // the same old score in the history list regardless of the
      // actual result.
      if (!mounted) return;
      final completedAt = DateTime.now(); // captured once, right here, at the true moment of completion
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => FinalExamServerResultsScreen(
            percentage: result.finalPercentage,
            passed: result.finalPassed,
            correctCount: result.correctCount,
            totalQuestions: result.totalQuestions,
            areaBreakdown: result.areaBreakdown,
            secondsUsed: (_examMinutes * 60) - _remainingSeconds,
            completedAt: completedAt,
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _submitting = false;
        _error = 'Could not submit the exam: $e';
      });
    }
  }

  Future<void> _confirmExit() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave the exam?'),
        content: const Text('Your answers so far will be lost if you leave without submitting.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Stay')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Leave')),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  void _showNavigator() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _QuestionNavigatorSheet(
        questions: _questions,
        answers: _answers,
        flagged: _flagged,
        currentIndex: _currentIndex,
        onSelect: (index) {
          setState(() => _currentIndex = index);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _confirmExit();
      },
      child: Scaffold(
        appBar: AppBar(
          title: _loading ? const Text('Final Exam') : Text('Question ${_currentIndex + 1} of ${_questions.length}'),
          automaticallyImplyLeading: false,
          leading: IconButton(icon: const Icon(Icons.close), onPressed: _confirmExit),
          actions: [
            if (!_loading) ...[
              IconButton(icon: const Icon(Icons.grid_view), tooltip: 'Question Navigator', onPressed: _showNavigator),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Text(
                    _timeFormatted,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: _remainingSeconds < 300 ? Colors.red : null,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        body: SafeArea(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              FilledButton(onPressed: _start, child: const Text('Try Again')),
            ],
          ),
        ),
      );
    }

    final question = _questions[_currentIndex];
    final isFlagged = _flagged.contains(question.questionId);
    final selected = _answers[question.questionId];
    final isLast = _currentIndex == _questions.length - 1;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          question.question,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, height: 1.4),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFlagged ? Icons.flag : Icons.outlined_flag,
                          color: isFlagged ? Colors.orange : Colors.grey,
                        ),
                        tooltip: isFlagged ? 'Unflag' : 'Flag for later',
                        onPressed: () => _toggleFlag(question.questionId),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  for (var i = 0; i < question.options.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _OptionTile(
                        text: question.options[i],
                        selected: selected == i,
                        onTap: () => setState(() => _answers[question.questionId] = i),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _showNavigator,
              icon: const Icon(Icons.grid_view, size: 18),
              label: Text('Question Navigator  ·  ${_answers.length}/${_questions.length} answered'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (_currentIndex > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => setState(() => _currentIndex--),
                    child: const Text('Previous'),
                  ),
                ),
              if (_currentIndex > 0) const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: _submitting
                      ? null
                      : () {
                          if (isLast) {
                            _submit();
                          } else {
                            setState(() => _currentIndex++);
                          }
                        },
                  child: _submitting
                      ? const SizedBox(
                          width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                      : Text(
                          isLast ? 'Submit Exam' : 'Next',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _OptionTile({required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
          color: selected ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.06) : null,
        ),
        child: Text(text, style: const TextStyle(fontSize: 14.5)),
      ),
    );
  }
}

/// Bottom sheet grid showing every question's status at a glance —
/// answered (filled), flagged (orange border), unanswered (outline),
/// current (highlighted) — tap any number to jump straight there.
class _QuestionNavigatorSheet extends StatelessWidget {
  final List<ExamPublicQuestion> questions;
  final Map<String, int> answers;
  final Set<String> flagged;
  final int currentIndex;
  final void Function(int index) onSelect;

  const _QuestionNavigatorSheet({
    required this.questions,
    required this.answers,
    required this.flagged,
    required this.currentIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Question Navigator', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 12,
                children: [
                  _LegendDot(color: Colors.green, label: 'Answered'),
                  _LegendDot(color: Colors.grey.shade300, label: 'Unanswered'),
                  _LegendDot(color: Colors.orange, label: 'Flagged'),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final q = questions[index];
                    final isAnswered = answers.containsKey(q.questionId);
                    final isFlagged = flagged.contains(q.questionId);
                    final isCurrent = index == currentIndex;
                    return InkWell(
                      onTap: () => onSelect(index),
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // Flagged status gets its own background tint,
                              // independent of the current-question border —
                              // so a flagged AND current question still
                              // clearly shows both states at once, instead
                              // of the current-question border silently
                              // overriding the flag color the way it used to.
                              color: isFlagged
                                  ? Colors.orange.withValues(alpha: 0.18)
                                  : (isAnswered ? Colors.green.withValues(alpha: 0.15) : Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isCurrent ? Theme.of(context).colorScheme.primary : Colors.transparent,
                                width: 2.5,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isAnswered ? Colors.green.shade800 : Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          // Flag badge — always visible when flagged,
                          // regardless of the answered/current state, so
                          // there's no combination of states where it
                          // becomes hard to spot.
                          if (isFlagged)
                            Positioned(
                              top: -4,
                              right: -4,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                                child: const Icon(Icons.flag, size: 10, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        );
      },
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11.5)),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════
// Results Screen — score, pass/fail, and area breakdown only. No
// answer review, per your request.
// ═══════════════════════════════════════════════════════════════════════

class FinalExamServerResultsScreen extends StatelessWidget {
  final double percentage;
  final bool passed;
  final int correctCount;
  final int totalQuestions;
  final List<ExamAreaResult> areaBreakdown;
  final int secondsUsed;
  final DateTime completedAt;

  const FinalExamServerResultsScreen({
    super.key,
    required this.percentage,
    required this.passed,
    required this.correctCount,
    required this.totalQuestions,
    required this.areaBreakdown,
    required this.secondsUsed,
    required this.completedAt,
  });

  String get _timeUsedFormatted {
    final m = secondsUsed ~/ 60;
    final s = secondsUsed % 60;
    return '${m}m ${s}s';
  }

  Color _colorFor(double ratio) {
    if (ratio >= 0.8) return Colors.green;
    if (ratio >= 0.5) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final sorted = [...areaBreakdown]..sort((a, b) => (a.correct / a.total).compareTo(b.correct / b.total));

    return Scaffold(
      appBar: AppBar(title: const Text('Exam Results'), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: passed
                      ? [Colors.green.shade700, Colors.green.shade400]
                      : [Colors.red.shade700, Colors.red.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(passed ? Icons.emoji_events : Icons.refresh, color: Colors.white, size: 56),
                  const SizedBox(height: 12),
                  Text(
                    passed ? 'Congratulations — You Passed!' : 'Not Quite — Keep Studying',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text('${percentage.toStringAsFixed(1)}%',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('$correctCount correct out of $totalQuestions',
                      style: const TextStyle(fontSize: 14, color: Colors.white70)),
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
            const SizedBox(height: 20),
            if (sorted.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
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
                    const Row(
                      children: [
                        Icon(Icons.bar_chart, size: 18, color: Colors.blueGrey),
                        SizedBox(width: 8),
                        Text('Areas Breakdown', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text('Based on the questions this attempt actually covered',
                        style: TextStyle(fontSize: 11.5, color: Colors.grey.shade500, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 14),
                    for (final entry in sorted) ...[
                      _AreaRow(
                        area: entry.area,
                        correct: entry.correct,
                        total: entry.total,
                        color: _colorFor(entry.correct / entry.total),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
            const SizedBox(height: 24),
            if (passed)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.amber.shade700, padding: const EdgeInsets.symmetric(vertical: 16)),
                  icon: const Icon(Icons.workspace_premium),
                  label: const Text('Get Your Certificate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CertificateScreen(scorePercentage: percentage, dateIssued: completedAt)),
                    );
                  },
                ),
              ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
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
          color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

class _AreaRow extends StatelessWidget {
  final String area;
  final int correct;
  final int total;
  final Color color;

  const _AreaRow({required this.area, required this.correct, required this.total, required this.color});

  @override
  Widget build(BuildContext context) {
    final ratio = correct / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(area,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(width: 8),
            Text('$correct/$total', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(value: ratio, minHeight: 7, backgroundColor: Colors.grey.shade100, color: color),
        ),
      ],
    );
  }
}
