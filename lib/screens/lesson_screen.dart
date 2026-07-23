import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/lesson_model.dart';
import '../services/notes_service.dart';
import '../services/progress_service.dart';
import '../services/voice_preference_service.dart';
import '../widgets/watermark.dart';
import '../widgets/diagrams.dart';

const int _quizLength = 20;
const String _feedbackEmail = 'sacyra@gmail.com';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;
  final String moduleTitle;

  const LessonScreen({
    super.key,
    required this.lesson,
    required this.moduleTitle,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  // Quiz state — shuffled and capped at _quizLength each session.
  late List<QuizQuestion> _activeQuiz;
  late List<int> _selectedAnswers;
  int _currentQuestionIndex = 0;
  bool _quizCompletionRecorded = false;

  // Audio narration state.
  final FlutterTts _tts = FlutterTts();
  bool _isSpeaking = false;
  VoiceGender _voiceGender = VoiceGender.female;
  double _speechRate = kIsWeb ? 1.3 : 0.65;
  List<Map<String, dynamic>> _femaleVoices = [];
  List<Map<String, dynamic>> _maleVoices = [];
  bool _voicesLoaded = false;
  bool _hasAnyIndianVoice = true; // assume true until discovery says otherwise

  // Notes state.
  final TextEditingController _notesController = TextEditingController();
  bool _notesExpanded = false;
  bool _notesLoaded = false;

  @override
  void initState() {
    super.initState();
    final quiz = widget.lesson.quiz;
    if (quiz != null) {
      final shuffled = List<QuizQuestion>.from(quiz)..shuffle(Random());
      _activeQuiz = shuffled.take(_quizLength).toList();
    } else {
      _activeQuiz = [];
    }
    _selectedAnswers = List.filled(_activeQuiz.length, -1);

    ProgressService.markLessonViewed('${widget.moduleTitle}::${widget.lesson.title}');

    _setUpTts();
    _loadNote();
  }

  Future<void> _setUpTts() async {
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _isSpeaking = false);
    });
    _tts.setCancelHandler(() {
      if (mounted) setState(() => _isSpeaking = false);
    });
    _tts.setErrorHandler((msg) {
      if (mounted) setState(() => _isSpeaking = false);
    });

    _voiceGender = await VoicePreferenceService.getPreferredGender();

    // Indian English voice, tuned for a warmer, more natural delivery.
    // Actual voice quality depends on the TTS engine installed on the
    // user's device/browser — Android and Chrome typically ship at least
    // one en-IN voice, but availability (and true male/female variety)
    // varies by device.
    try {
      await _tts.setLanguage('en-IN');
    } catch (_) {
      // Fall back silently if en-IN isn't available on this platform.
    }
    await _tts.setPitch(1.0);
    await _tts.setSpeechRate(_speechRate); // faster, natural conversational pace (~1.3x)
    await _tts.setVolume(1.0);

    await _discoverVoices();
    await _applyPreferredVoice();
  }

  /// Fetches every en-IN voice the device's TTS engine offers and buckets
  /// each one into female/male using whatever gender hint is available —
  /// an explicit 'gender' field if the platform provides one, otherwise
  /// common naming patterns (e.g. "female"/"male" appearing in the voice
  /// name). This is genuinely best-effort: not every platform exposes
  /// reliable gender metadata for its voices.
  Future<void> _discoverVoices() async {
    try {
      final voices = await _tts.getVoices;
      if (voices is! List) return;

      final enInVoices = voices.cast<dynamic>().where((v) {
        final locale = (v['locale'] ?? '').toString().toLowerCase();
        return locale.contains('en-in') || locale.contains('en_in');
      }).toList();

      _hasAnyIndianVoice = enInVoices.isNotEmpty;

      final female = <Map<String, dynamic>>[];
      final male = <Map<String, dynamic>>[];
      final unknown = <Map<String, dynamic>>[];

      for (final v in enInVoices) {
        final map = Map<String, dynamic>.from(v as Map);
        final name = (map['name'] ?? '').toString().toLowerCase();
        final genderField = (map['gender'] ?? '').toString().toLowerCase();
        if (genderField.contains('female') || name.contains('female')) {
          female.add(map);
        } else if (genderField.contains('male') || name.contains('male')) {
          male.add(map);
        } else {
          unknown.add(map);
        }
      }

      // If a platform gives no gender hints at all, split whatever voices
      // exist between the two lists so a choice is still meaningful rather
      // than both options silently resolving to the same single voice.
      if (female.isEmpty && male.isEmpty && unknown.isNotEmpty) {
        for (var i = 0; i < unknown.length; i++) {
          (i.isEven ? female : male).add(unknown[i]);
        }
      }

      if (mounted) {
        setState(() {
          _femaleVoices = female;
          _maleVoices = male;
          _voicesLoaded = true;
        });
      } else {
        _femaleVoices = female;
        _maleVoices = male;
        _voicesLoaded = true;
      }
    } catch (_) {
      // Voice discovery is best-effort; narration still works with
      // whatever default voice the en-IN locale resolves to.
    }
  }

  Future<void> _applyPreferredVoice() async {
    final pool = _voiceGender == VoiceGender.female ? _femaleVoices : _maleVoices;
    final fallbackPool = _voiceGender == VoiceGender.female ? _maleVoices : _femaleVoices;
    final chosen = pool.isNotEmpty ? pool.first : (fallbackPool.isNotEmpty ? fallbackPool.first : null);
    if (chosen == null) return;
    try {
      await _tts.setVoice({
        'name': chosen['name'].toString(),
        'locale': chosen['locale'].toString(),
      });
    } catch (_) {
      // Best-effort — default en-IN locale voice still applies if this fails.
    }
  }

  Future<void> _changeVoiceGender(VoiceGender gender) async {
    if (_voiceGender == gender) return;
    final wasSpeaking = _isSpeaking;
    if (wasSpeaking) await _tts.stop();
    setState(() => _voiceGender = gender);
    await VoicePreferenceService.setPreferredGender(gender);
    await _applyPreferredVoice();
    if (wasSpeaking) {
      setState(() => _isSpeaking = true);
      await _tts.speak(_lessonNarrationText(widget.lesson));
    }
  }

  // Presets roughly map to 1x / 1.3x / 1.6x conversational pace, since
  // flutter_tts normalizes 0.5 as the platform's "normal" speech rate.
  // flutter_tts normalizes speech rate very differently by platform: on
  // Android/iOS the scale is roughly 0.0-1.0 with ~0.5 as "normal" speed,
  // but on web it passes straight through to the browser's Speech
  // Synthesis API, where 1.0 is normal and values above that genuinely
  // speed playback up (commonly usable up to ~2-3x before quality degrades).
  static const List<double> _speedPresets =
      kIsWeb ? [1.0, 1.3, 1.6, 2.0, 2.5] : [0.5, 0.65, 0.8, 1.0];
  static const List<String> _speedLabels =
      kIsWeb ? ['1x', '1.3x', '1.6x', '2x', '2.5x'] : ['1x', '1.3x', '1.6x', '2x'];

  Future<void> _cycleSpeechRate() async {
    final currentIdx = _speedPresets.indexOf(_speechRate);
    final nextIdx = (currentIdx + 1) % _speedPresets.length;
    final wasSpeaking = _isSpeaking;
    if (wasSpeaking) await _tts.stop();
    setState(() => _speechRate = _speedPresets[nextIdx]);
    await _tts.setSpeechRate(_speechRate);
    if (wasSpeaking) {
      setState(() => _isSpeaking = true);
      await _tts.speak(_lessonNarrationText(widget.lesson));
    }
  }

  void _showVoicePicker() {
    final femaleAvailable = _femaleVoices.isNotEmpty || !_voicesLoaded;
    final maleAvailable = _maleVoices.isNotEmpty || !_voicesLoaded;
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Narrator Voice', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            if (_voicesLoaded && !_hasAnyIndianVoice)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade300),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning_amber, color: Colors.orange, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'No Indian English voice was found on this browser/device — '
                        'using the closest available English voice instead. On '
                        'Windows, add an "English (India)" voice under '
                        'Settings > Time & Language > Speech. On Android, install '
                        'it via Google TTS language settings.',
                        style: TextStyle(fontSize: 11.5),
                      ),
                    ),
                  ],
                ),
              )
            else
              Text(
                'Indian English voice — availability depends on your device.',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _VoiceOptionCard(
                    icon: Icons.face_3,
                    label: 'Female Voice',
                    selected: _voiceGender == VoiceGender.female,
                    enabled: femaleAvailable,
                    onTap: () {
                      _changeVoiceGender(VoiceGender.female);
                      Navigator.pop(ctx);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _VoiceOptionCard(
                    icon: Icons.face,
                    label: 'Male Voice',
                    selected: _voiceGender == VoiceGender.male,
                    enabled: maleAvailable,
                    onTap: () {
                      _changeVoiceGender(VoiceGender.male);
                      Navigator.pop(ctx);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadNote() async {
    final note =
        await NotesService.getNote(widget.moduleTitle, widget.lesson.title);
    if (mounted) {
      _notesController.text = note;
      setState(() => _notesLoaded = true);
    }
  }

  @override
  void dispose() {
    _tts.stop();
    _notesController.dispose();
    super.dispose();
  }

  String _lessonNarrationText(Lesson lesson) {
    final buffer = StringBuffer();
    for (final section in lesson.sections) {
      if (section.heading != null) buffer.writeln(section.heading);
      if (section.body != null) buffer.writeln(section.body);
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
    var score = 0;
    for (var i = 0; i < _activeQuiz.length; i++) {
      if (_selectedAnswers[i] == _activeQuiz[i].correctIndex) score++;
    }
    return score;
  }

  bool get _allAnswered => !_selectedAnswers.contains(-1);
  int get _answeredCount => _selectedAnswers.where((a) => a != -1).length;

  Future<void> _sendFeedback() async {
    final subject =
        Uri.encodeComponent('CyberPulse Feedback: ${widget.lesson.title}');
    final body = Uri.encodeComponent(
      'Module: ${widget.moduleTitle}\nLesson: ${widget.lesson.title}\n\n'
      'Your feedback:\n',
    );
    final uri = Uri.parse('mailto:$_feedbackEmail?subject=$subject&body=$body');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not open an email app. Send feedback directly to $_feedbackEmail',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        actions: [
          if (!lesson.isQuiz)
            IconButton(
              icon: const Icon(Icons.record_voice_over),
              tooltip: 'Choose narrator voice',
              onPressed: _showVoicePicker,
            ),
          if (!lesson.isQuiz)
            TextButton.icon(
              onPressed: _cycleSpeechRate,
              icon: const Icon(Icons.speed, size: 18),
              label: Text(_speedLabels[_speedPresets.indexOf(_speechRate)]),
            ),
          if (!lesson.isQuiz && !lesson.isAudio)
            IconButton(
              icon: Icon(_isSpeaking ? Icons.stop_circle : Icons.volume_up),
              tooltip: _isSpeaking ? 'Stop narration' : 'Listen to this lesson',
              onPressed: _toggleNarration,
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            color: Colors.black12,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            width: double.infinity,
            child: Row(
              children: [
                const Icon(Icons.timer_outlined, size: 14),
                const SizedBox(width: 4),
                Text(
                  '~${lesson.estimatedMinutes} min',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: CyberPulseWatermark()),
          lesson.isQuiz
              ? _buildQuiz(_activeQuiz)
              : lesson.isAudio
                  ? _buildAudioLesson(lesson)
                  : _buildReadingContent(lesson),
        ],
      ),
    );
  }

  // -- Audio Lesson ---------------------------------------------------------

  Widget _buildAudioLesson(Lesson lesson) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 6),
                const Text('Audio Course',
                    style: TextStyle(fontSize: 13, color: Colors.white70)),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  icon: Icon(_isSpeaking ? Icons.stop_rounded : Icons.play_arrow_rounded, size: 28),
                  label: Text(_isSpeaking ? 'Stop' : 'Play',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: _toggleNarration,
                ),
                const SizedBox(height: 12),
                Text(
                  _isSpeaking ? 'Now playing — follow along below' : 'Tap Play to listen to this lesson',
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Transcript',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                const Divider(height: 20),
                for (final section in lesson.sections) _buildSection(section),
                _buildNotesSection(),
                _buildFeedbackSection(),
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
          _buildNotesSection(),
          _buildFeedbackSection(),
        ],
      ),
    );
  }

  Widget _buildSection(LessonSection section) {
    if (section.diagram != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DiagramView(spec: section.diagram!),
      );
    }
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
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          if (section.body != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(section.body!, style: const TextStyle(fontSize: 18, height: 1.4)),
            ),
          if (section.bullets != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final bullet in section.bullets!)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('•  $bullet', style: const TextStyle(fontSize: 18, height: 1.4)),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  // -- Notes ------------------------------------------------------------------

  Widget _buildNotesSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.amber.withValues(alpha: 0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _notesExpanded = !_notesExpanded),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Icon(Icons.edit_note, color: Colors.orange),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text('My Notes',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Icon(_notesExpanded ? Icons.expand_less : Icons.expand_more),
                ],
              ),
            ),
          ),
          if (_notesExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: _notesLoaded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: _notesController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Write your own notes about this lesson...',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            icon: const Icon(Icons.save, size: 18),
                            label: const Text('Save Note'),
                            onPressed: () async {
                              await NotesService.saveNote(
                                widget.moduleTitle,
                                widget.lesson.title,
                                _notesController.text,
                              );
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Note saved'), duration: Duration(seconds: 1)),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  // -- Feedback -----------------------------------------------------------

  Widget _buildFeedbackSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.feedback_outlined, color: Colors.grey),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Spotted an issue or have a suggestion for this lesson?',
              style: TextStyle(fontSize: 13),
            ),
          ),
          TextButton(
            onPressed: _sendFeedback,
            child: const Text('Send Feedback'),
          ),
        ],
      ),
    );
  }

  // -- Practice Quiz ---------------------------------------------------------
  // Non-linear navigation (jump to any question via the navigator, like the
  // Final Exam) combined with immediate per-answer feedback — tap an option
  // and instantly see whether it's correct, with the explanation shown right
  // away, rather than waiting until every question is answered to submit.

  Widget _buildQuiz(List<QuizQuestion> quiz) {
    if (quiz.isEmpty) return const SizedBox.shrink();
    final q = quiz[_currentQuestionIndex];
    final selected = _selectedAnswers[_currentQuestionIndex];
    final isAnswered = selected != -1;

    return Column(
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
                    Text(
                      'Question ${_currentQuestionIndex + 1} of ${quiz.length}',
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Score: $_score / $_answeredCount answered',
                        style: TextStyle(fontSize: 12, color: Colors.green.shade800, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: (_currentQuestionIndex + 1) / quiz.length,
                    minHeight: 5,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  q.question,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.4),
                ),
                const SizedBox(height: 18),
                for (var optIndex = 0; optIndex < q.options.length; optIndex++)
                  _buildQuizOption(q, optIndex, selected, isAnswered),
                if (isAnswered) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: (selected == q.correctIndex ? Colors.green : Colors.orange).withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: (selected == q.correctIndex ? Colors.green : Colors.orange).withValues(alpha: 0.35),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          selected == q.correctIndex ? Icons.check_circle : Icons.info_outline,
                          size: 18,
                          color: selected == q.correctIndex ? Colors.green.shade700 : Colors.orange.shade800,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            q.explanation,
                            style: TextStyle(fontSize: 13.5, height: 1.4, color: Colors.grey.shade800),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                _buildFeedbackSection(),
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
                  onPressed: _currentQuestionIndex > 0
                      ? () => setState(() => _currentQuestionIndex--)
                      : null,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showQuizNavigator(quiz),
                    icon: const Icon(Icons.grid_view, size: 18),
                    label: const Text('Navigator'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: _allAnswered
                        ? () => setState(() {
                              final shuffled = List<QuizQuestion>.from(widget.lesson.quiz!)
                                ..shuffle(Random());
                              _activeQuiz = shuffled.take(_quizLength).toList();
                              _selectedAnswers = List.filled(_activeQuiz.length, -1);
                              _currentQuestionIndex = 0;
                              _quizCompletionRecorded = false;
                            })
                        : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: _allAnswered ? Colors.green.shade700 : null,
                    ),
                    child: Text(_allAnswered ? 'Retake (New Questions)' : 'Answer All to Retake'),
                  ),
                ),
                IconButton(
                  onPressed: _currentQuestionIndex < quiz.length - 1
                      ? () => setState(() => _currentQuestionIndex++)
                      : null,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuizOption(QuizQuestion q, int optIndex, int selected, bool isAnswered) {
    Color borderColor = Colors.grey.shade300;
    Color? fillColor;
    Widget? trailingIcon;

    if (isAnswered) {
      if (optIndex == q.correctIndex) {
        borderColor = Colors.green;
        fillColor = Colors.green.withValues(alpha: 0.08);
        trailingIcon = const Icon(Icons.check_circle, color: Colors.green, size: 20);
      } else if (optIndex == selected) {
        borderColor = Colors.red;
        fillColor = Colors.red.withValues(alpha: 0.08);
        trailingIcon = const Icon(Icons.cancel, color: Colors.red, size: 20);
      }
    } else if (optIndex == selected) {
      borderColor = Colors.indigo;
      fillColor = Colors.indigo.withValues(alpha: 0.06);
    }

    return InkWell(
      onTap: isAnswered
          ? null
          : () {
              setState(() {
                _selectedAnswers[_currentQuestionIndex] = optIndex;
              });
              if (_allAnswered && !_quizCompletionRecorded) {
                _quizCompletionRecorded = true;
                if (_score >= (_activeQuiz.length * 0.8).ceil()) {
                  ProgressService.markTopicQuizPassed(widget.moduleTitle);
                }
              }
            },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: fillColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: (isAnswered || optIndex == selected) ? 2 : 1),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 13,
              backgroundColor: borderColor.withValues(alpha: isAnswered || optIndex == selected ? 1 : 0.15),
              child: Text(
                String.fromCharCode(65 + optIndex),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: (isAnswered || optIndex == selected) ? Colors.white : Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(q.options[optIndex], style: const TextStyle(fontSize: 15))),
            if (trailingIcon != null) trailingIcon,
          ],
        ),
      ),
    );
  }

  void _showQuizNavigator(List<QuizQuestion> quiz) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.55,
          minChildSize: 0.35,
          maxChildSize: 0.85,
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
                    spacing: 12,
                    children: [
                      _navigatorLegendDot(Colors.green, 'Correct'),
                      _navigatorLegendDot(Colors.red, 'Incorrect'),
                      _navigatorLegendDot(Colors.grey.shade300, 'Unanswered'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      itemCount: quiz.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, i) {
                        final answer = _selectedAnswers[i];
                        Color bg = Colors.grey.shade200;
                        Color fg = Colors.black87;
                        if (answer != -1) {
                          final correct = answer == quiz[i].correctIndex;
                          bg = correct ? Colors.green : Colors.red;
                          fg = Colors.white;
                        }
                        final isCurrent = i == _currentQuestionIndex;
                        return InkWell(
                          onTap: () {
                            setState(() => _currentQuestionIndex = i);
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

  Widget _navigatorLegendDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

class _VoiceOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  const _VoiceOptionCard({
    required this.icon,
    required this.label,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: selected ? Colors.indigo.withValues(alpha: 0.08) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? Colors.indigo : Colors.grey.shade300, width: selected ? 2 : 1),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: enabled ? (selected ? Colors.indigo : Colors.grey.shade700) : Colors.grey.shade400),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: enabled ? (selected ? Colors.indigo : Colors.black87) : Colors.grey.shade400,
              ),
            ),
            if (!enabled) ...[
              const SizedBox(height: 2),
              Text('Not available', style: TextStyle(fontSize: 10, color: Colors.grey.shade400)),
            ],
          ],
        ),
      ),
    );
  }
}
