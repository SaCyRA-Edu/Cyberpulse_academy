import 'package:flutter/material.dart';
import 'certificate_screen.dart';
import 'final_exam_taking_screen.dart';
import 'retake_paywall_screen.dart';
import '../services/retake_eligibility.dart';
import '../services/progress_service.dart';

// Display-only constants for the start screen's info card — the actual
// exam engine (question count, time limit, pass threshold) now lives
// server-side in functions/src/index.ts (startExamAttempt /
// submitAnswer). These must be kept in sync with those server-side
// values by hand, since the client no longer receives them until
// startExamAttempt actually returns — shown here purely so the start
// screen can display accurate expectations before the user begins.
const int _totalQuestions = 100;
const int _examMinutes = 120;
const double _passThreshold = 75.0;

// ═══════════════════════════════════════════════════════════════════════
// Start Screen
// ═══════════════════════════════════════════════════════════════════════

class FinalExamStartScreen extends StatefulWidget {
  const FinalExamStartScreen({super.key});

  @override
  State<FinalExamStartScreen> createState() => _FinalExamStartScreenState();
}

class _FinalExamStartScreenState extends State<FinalExamStartScreen> {
  List<FinalExamAttempt>? _history;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final history = await ProgressService.getFinalExamHistory();
    if (mounted) setState(() => _history = history);
  }

  Future<void> _refreshAfterExam() async {
    await _loadHistory();
  }

  /// Shown right before the exam actually starts — every question and
  /// every answer submission requires a live round trip to the server
  /// under the new server-side grading model, so a dropped connection
  /// genuinely can't be recovered from the way it might have been with
  /// the old fully-local exam engine. Returns true only if the user
  /// explicitly confirms they're ready to proceed.
  Future<bool> _confirmConnectionWarning() async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.wifi_tethering_error_rounded, color: Colors.orange, size: 36),
        title: const Text('Stable Internet Required'),
        content: const Text(
          'This exam requires an active internet connection for its entire '
          'duration. If your connection drops at any point, the exam will '
          'be marked as failed, and this attempt cannot be resumed.\n\n'
          'Please make sure you have a stable connection before continuing.',
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('I Understand, Continue'),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }

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
              const SizedBox(height: 8),
              _AttemptHistorySection(history: _history),
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
                  onPressed: () async {
                    final canStart = await RetakeEligibility.canStartFreeAttempt();
                    if (!canStart) {
                      final unlocked = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(builder: (_) => const RetakePaywallScreen()),
                      );
                      if (unlocked != true) return; // user backed out without purchasing
                    }
                    if (!context.mounted) return;
                    final confirmed = await _confirmConnectionWarning();
                    if (!confirmed) return;
                    if (!context.mounted) return;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FinalExamScreen()),
                    );
                    _refreshAfterExam();
                  },
                  child: Text(
                    (_history?.isNotEmpty ?? false) ? 'Retake Exam' : 'Begin Exam',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // TEMPORARY — remove before release. Lets you preview the
              // certificate screen (and confirm the logo renders) without
              // needing to actually pass the full exam.
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CertificateScreen(scorePercentage: 92.0),
                    ),
                  );
                },
                icon: const Icon(Icons.bug_report, size: 16),
                label: const Text('Debug: Preview Certificate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AttemptHistorySection extends StatelessWidget {
  final List<FinalExamAttempt>? history;

  const _AttemptHistorySection({required this.history});

  @override
  Widget build(BuildContext context) {
    // Still loading, or genuinely no attempts yet — either way, nothing
    // to show. Once the exam is attempted at least once, this section
    // appears automatically.
    if (history == null || history!.isEmpty) return const SizedBox.shrink();

    // getFinalExamHistory() returns most-recent-first, so taking the
    // first 3 gives the last 3 attempts made.
    final recent = history!.take(3).toList();

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.indigo.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.indigo.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.history, size: 18, color: Colors.indigo),
              SizedBox(width: 8),
              Text(
                'Recent Attempts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < recent.length; i++) ...[
            _AttemptRow(attempt: recent[i]),
            if (i < recent.length - 1) const Divider(height: 16),
          ],
        ],
      ),
    );
  }
}

class _AttemptRow extends StatelessWidget {
  final FinalExamAttempt attempt;
  const _AttemptRow({required this.attempt});

  @override
  Widget build(BuildContext context) {
    final passed = attempt.scorePercent >= _passThreshold;
    return Row(
      children: [
        Icon(
          passed ? Icons.check_circle : Icons.cancel,
          size: 18,
          color: passed ? Colors.green : Colors.red.shade300,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            _formatDate(attempt.date),
            style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
          ),
        ),
        Text(
          '${attempt.scorePercent.toStringAsFixed(0)}%',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: passed ? Colors.green.shade700 : Colors.orange.shade800,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    // The stored timestamp comes from the server as UTC (an ISO 8601
    // string ending in "Z"). Without converting to local time first,
    // .hour/.day/.month below would silently return the raw UTC values
    // — displaying, say, a 3:33 AM UTC completion as if it were
    // "3:33 AM" local, when it's actually 9:03 AM IST. This is exactly
    // what caused the exam history and the certificate (which
    // generates its date fresh via DateTime.now(), already local) to
    // show two different times for the same completed attempt.
    final localDate = date.toLocal();
    final now = DateTime.now();
    final diff = now.difference(localDate);
    if (diff.inDays == 0 && now.day == localDate.day) return 'Today, ${_time(localDate)}';
    if (diff.inDays <= 1 && now.day - localDate.day == 1) return 'Yesterday, ${_time(localDate)}';
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[localDate.month - 1]} ${localDate.day}, ${_time(localDate)}';
  }

  String _time(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
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
