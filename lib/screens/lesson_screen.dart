import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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

  // Audio narration state.
  final FlutterTts _tts = FlutterTts();
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    final quiz = widget.lesson.quiz;
    _selectedAnswers = quiz != null ? List.filled(quiz.length, -1) : [];

    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _isSpeaking = false);
    });
    _tts.setCancelHandler(() {
      if (mounted) setState(() => _isSpeaking = false);
    });
    _tts.setErrorHandler((msg) {
      if (mounted) setState(() => _isSpeaking = false);
    });
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  String _lessonNarrationText(Lesson lesson) {
    final buffer = StringBuffer();
    for (final section in lesson.sections) {
      if (section.heading != null) {
        buffer.writeln(section.heading);
      }
      if (section.body != null) {
        buffer.writeln(section.body);
      }
      if (section.bullets != null) {
        for (final bullet in section.bullets!) {
          buffer.writeln(bullet);
        }
      }
    }
    return buffer.toString();
  }

  Future<void> _toggleNarration() async {
    if (_isSpeaking) {
      await _tts.stop();
      setState(() => _isSpeaking = false);
    } else {
      setState(() => _isSpeaking = true);
      await _tts.speak(_lessonNarrationText(widget.lesson));
    }
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
        actions: [
          if (!lesson.isQuiz && !lesson.isAudio)
            IconButton(
              icon: Icon(_isSpeaking ? Icons.stop_circle : Icons.volume_up),
              tooltip: _isSpeaking ? 'Stop narration' : 'Listen to this lesson',
              onPressed: _toggleNarration,
            ),
        ],
      ),
      body: lesson.isQuiz
          ? _buildQuiz(lesson.quiz!)
          : lesson.isAudio
              ? _buildAudioLesson(lesson)
              : _buildReadingContent(lesson),
    );
  }

  // -- Audio Lesson ---------------------------------------------------------

  Widget _buildAudioLesson(Lesson lesson) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Audio player panel
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.blue.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.headphones, size: 64, color: Colors.white),
                const SizedBox(height: 16),
                Text(
                  lesson.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Audio Course',
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: Icon(
                        _isSpeaking ? Icons.stop_rounded : Icons.play_arrow_rounded,
                        size: 28,
                      ),
                      label: Text(
                        _isSpeaking ? 'Stop' : 'Play',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _toggleNarration,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  _isSpeaking
                      ? 'Now playing — follow along below'
                      : 'Tap Play to listen to this lesson',
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),

          // Transcript
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transcript',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const Divider(height: 20),
                for (final section in lesson.sections)
                  _buildSection(section),
              ],
            ),
          ),
        ],
      ),
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

  // -- Practice Quiz ---------------------------------------------------------

  Widget _buildQuiz(List<QuizQuestion> quiz) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Test what you\'ve learned across this module. (80% needed to pass)',
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
                        _selectedAnswers = List.filled(quiz.length, -1);
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
    final passed = score >= (total * 0.8).ceil();
    final suffix = passed
        ? ' — nice work, that\'s 80%+!'
        : ' — review the explanations and try again.';
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: passed ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
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
              'You scored $score / $total$suffix',
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
        tileColor = Colors.green.withValues(alpha: 0.15);
      } else if (optIndex == selected) {
        tileColor = Colors.red.withValues(alpha: 0.15);
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
