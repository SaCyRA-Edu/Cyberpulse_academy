import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'podcast_data.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import 'paywall_screen.dart';

/// Plays a real, pre-recorded/generated audio file for a podcast
/// episode (e.g. a NotebookLM Audio Overview), streamed from Firebase
/// Storage — genuine human-quality expression, laughs, and pacing that
/// on-device TTS can't produce. [episode.lines] is still shown below
/// the player as a readable transcript, but no longer drives playback.
class PodcastPlayerScreen extends StatefulWidget {
  final PodcastEpisode episode;

  /// Matches Module.title in levels_data.dart exactly — used to look
  /// up that chapter's actual lesson list, so "What's Covered" always
  /// reflects the real curriculum rather than a separately
  /// hand-maintained copy of the same titles.
  final String moduleTitle;

  const PodcastPlayerScreen({super.key, required this.episode, required this.moduleTitle});

  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> with SingleTickerProviderStateMixin {
  final AudioPlayer _player = AudioPlayer();
  bool _loading = true;
  String? _error;
  bool _hasFullAccess = false;
  bool _previewLimitReached = false;

  // Free preview cap for users without full access — matches the
  // "Chapter 1 is free" pattern already used for Read Through.
  // Applied to whichever episode is open here, not hardcoded to a
  // specific chapter check, so it stays correct even if reached by
  // some future navigation path other than the current Chapter-1-only
  // gating in podcast_screen.dart.
  static const _previewLimit = Duration(minutes: 3);

  late final AnimationController _pulseController;

  // Saved playback position persists per-episode (keyed by storage
  // path) via SharedPreferences, so leaving and returning to the same
  // episode resumes where you left off instead of restarting from
  // 0:00. Cleared automatically once an episode finishes, so a
  // completed episode starts fresh next time rather than "resuming"
  // right at the end.
  String get _positionPrefsKey => 'podcast_position_${widget.episode.audioStoragePath}';

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _loadAudio();
    _checkFullAccess();
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _clearSavedPosition();
      }
    });
    _player.positionStream.listen((position) {
      if (!_hasFullAccess && !_previewLimitReached && position >= _previewLimit) {
        _previewLimitReached = true;
        _player.pause();
        _showPreviewLimitDialog();
      }
    });
  }

  Future<void> _checkFullAccess() async {
    final hasAccess = await ProgressService.hasFullAccess();
    if (mounted) setState(() => _hasFullAccess = hasAccess);
  }

  Future<void> _showPreviewLimitDialog() async {
    if (!mounted) return;
    final unlocked = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Liked what you heard?'),
        content: const Text(
          'That was just a free 3-minute taste of this episode. '
          'Unlock Full Access to hear this one all the way through — '
          'plus every other chapter, quiz, and the Final Certification Exam.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Maybe Later')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Unlock Full Access')),
        ],
      ),
    );
    if (unlocked == true && mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => PaywallScreen(lockedItemTitle: widget.episode.title)),
      );
      _checkFullAccess(); // in case they completed the purchase
    }
  }

  Future<void> _loadAudio() async {
    final path = widget.episode.audioStoragePath;
    if (path == null) {
      setState(() {
        _loading = false;
        _error = 'No audio file is set up for this episode yet.';
      });
      return;
    }
    try {
      final url = await FirebaseStorage.instance.ref(path).getDownloadURL();
      await _player.setUrl(url);

      final prefs = await SharedPreferences.getInstance();
      final savedMillis = prefs.getInt(_positionPrefsKey);
      if (savedMillis != null && savedMillis > 0) {
        await _player.seek(Duration(milliseconds: savedMillis));
      }

      setState(() => _loading = false);
    } catch (e) {
      setState(() {
        _loading = false;
        _error = 'Could not load audio: $e';
      });
    }
  }

  Future<void> _savePosition() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_positionPrefsKey, _player.position.inMilliseconds);
  }

  Future<void> _clearSavedPosition() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_positionPrefsKey);
  }

  @override
  void dispose() {
    _savePosition(); // fire-and-forget: best effort, screen is closing regardless
    _pulseController.dispose();
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  /// Google Play's Generative AI content policy requires an in-app way
  /// for users to flag AI-generated content as offensive or
  /// inaccurate. Reports are written to a top-level Firestore
  /// collection for review — never readable by clients themselves,
  /// only writable, so this can't be used to see what others reported.
  Future<void> _showReportDialog() async {
    String? selectedReason;
    final detailsController = TextEditingController();

    final reasons = [
      'Inaccurate or misleading information',
      'Offensive or inappropriate content',
      'Technical issue with the audio',
      'Other',
    ];

    final submitted = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Report This Episode'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This audio is generated by AI. Let us know if something here is wrong.',
                style: TextStyle(fontSize: 12.5, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              for (final reason in reasons)
                RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(reason, style: const TextStyle(fontSize: 13.5)),
                  value: reason,
                  groupValue: selectedReason,
                  onChanged: (value) => setDialogState(() => selectedReason = value),
                ),
              const SizedBox(height: 8),
              TextField(
                controller: detailsController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Additional details (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
            FilledButton(
              onPressed: selectedReason == null ? null : () => Navigator.pop(context, true),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );

    if (submitted != true || selectedReason == null) return;

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You must be signed in to submit a report.')),
        );
      }
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('podcastReports').add({
        'uid': uid,
        'episodeTitle': widget.episode.title,
        'audioStoragePath': widget.episode.audioStoragePath,
        'reason': selectedReason,
        'details': detailsController.text.trim(),
        'reportedAt': FieldValue.serverTimestamp(),
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thanks — your report has been submitted.')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not submit your report. Please try again.')),
        );
      }
    }
  }

  /// Full AI-content disclosure — required by both Apple and Google
  /// Play policy for apps featuring AI-generated/synthetic media.
  /// Placed directly below the audio player (not above it, and not
  /// tucked into a menu), per the exact placement and wording
  /// requirements this was written against.
  Widget _buildAiDisclosureBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      color: Colors.deepPurple.withValues(alpha: 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.smart_toy_outlined, size: 16, color: Colors.deepPurple.shade400),
              const SizedBox(width: 6),
              Text(
                'AI-Generated Content Disclosure',
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade400),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'This audio overview is generated using artificial intelligence '
            '(Google Gemini Notebook Audio Overview technology). The hosts, '
            'voices, and dialogue are entirely AI-created and do not '
            'represent real human speakers or live interviews. This content '
            'is provided for informational and educational purposes only.',
            style: TextStyle(fontSize: 11.5, height: 1.5, color: Colors.deepPurple.shade400.withValues(alpha: 0.9)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4527A0),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.episode.title, style: const TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: const Icon(Icons.flag_outlined),
            tooltip: 'Report this episode',
            onPressed: _showReportDialog,
          ),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error_outline, size: 48, color: Colors.red),
                          const SizedBox(height: 12),
                          Text(_error!, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      _buildPlayerControls(),
                      _buildAiDisclosureBanner(),
                      const Divider(height: 1),
                      Expanded(child: _buildTranscript()),
                    ],
                  ),
      ),
    );
  }

  /// One expanding, fading ring for the broadcast animation. [phase]
  /// runs 0.0 -> 1.0 repeatedly; the ring starts at the icon circle's
  /// own size and fully transparent-in, then grows outward while
  /// fading to nothing — three of these at staggered phases (see
  /// caller) create a continuous "signal going out" effect.
  Widget _buildRipple(double phase) {
    final size = 96 + (phase * 100);
    final opacity = (1 - phase) * 0.55;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF7C4DFF).withValues(alpha: opacity), width: 2.5),
      ),
    );
  }

  Widget _buildPlayerControls() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4527A0), Color(0xFFF7F5FF)],
          stops: [0.0, 1.0],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      child: Column(
        children: [
          StreamBuilder<PlayerState>(
            stream: _player.playerStateStream,
            builder: (context, snapshot) {
              final playing = snapshot.data?.playing ?? false;
              if (playing) {
                if (!_pulseController.isAnimating) _pulseController.repeat();
              } else {
                _pulseController.stop();
              }
              return SizedBox(
                width: 200,
                height: 200,
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // Three broadcast rings, staggered so one is
                        // always mid-expansion — this reads as a much
                        // more visible "actively playing" signal than
                        // animating the icon or its background circle
                        // directly, which was too subtle to notice.
                        if (playing)
                          for (final offset in [0.0, 0.33, 0.66])
                            _buildRipple((_pulseController.value + offset) % 1.0),
                        child!,
                      ],
                    );
                  },
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF7C4DFF), Color(0xFF4527A0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Icon(Icons.podcasts, size: 44, color: Colors.white),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 14, offset: const Offset(0, 6))],
            ),
            child: Column(
              children: [
                StreamBuilder<Duration?>(
                  stream: _player.durationStream,
                  builder: (context, durationSnapshot) {
                    final duration = durationSnapshot.data ?? Duration.zero;
                    return StreamBuilder<Duration>(
                      stream: _player.positionStream,
                      builder: (context, positionSnapshot) {
                        final position = positionSnapshot.data ?? Duration.zero;
                        final clampedPosition = position > duration ? duration : position;
                        return Column(
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 3,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                              ),
                              child: Slider(
                                value: clampedPosition.inMilliseconds.toDouble(),
                                max: duration.inMilliseconds > 0 ? duration.inMilliseconds.toDouble() : 1,
                                activeColor: const Color(0xFF4527A0),
                                onChanged: (value) {
                                  _player.seek(Duration(milliseconds: value.toInt()));
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_formatDuration(clampedPosition), style: const TextStyle(fontSize: 11.5, color: Colors.grey)),
                                  Text(_formatDuration(duration), style: const TextStyle(fontSize: 11.5, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.replay_10, size: 28, color: Color(0xFF4527A0)),
                        onPressed: () {
                          final newPosition = _player.position - const Duration(seconds: 10);
                          _player.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    StreamBuilder<PlayerState>(
                      stream: _player.playerStateStream,
                      builder: (context, snapshot) {
                        final playing = snapshot.data?.playing ?? false;
                        final processingState = snapshot.data?.processingState;
                        final isLoading = processingState == ProcessingState.loading ||
                            processingState == ProcessingState.buffering;
                        return SizedBox(
                          width: 64,
                          height: 64,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFF4527A0),
                              shape: const CircleBorder(),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (playing) {
                                      _player.pause();
                                      _savePosition();
                                    } else if (processingState == ProcessingState.completed) {
                                      _player.seek(Duration.zero);
                                      _player.play();
                                    } else {
                                      _player.play();
                                    }
                                  },
                            child: Center(
                              child: isLoading
                                  ? const SizedBox(
                                      width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                                  : Icon(playing ? Icons.pause : Icons.play_arrow, size: 32, color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.forward_10, size: 28, color: Color(0xFF4527A0)),
                        onPressed: () {
                          final duration = _player.duration ?? Duration.zero;
                          final newPosition = _player.position + const Duration(seconds: 10);
                          _player.seek(newPosition > duration ? duration : newPosition);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Fills the space where a transcript would otherwise leave a blank
  /// area (none of the 13 chapter episodes have transcript data yet)
  /// with something genuinely useful for a learning app: the actual
  /// lesson titles from this chapter, looked up live from
  /// levels_data.dart rather than duplicated into podcast_data.dart —
  /// so it can never drift out of sync with the real curriculum.
  Widget _buildTopicsCovered() {
    Module? matchedModule;
    for (final level in allLevels) {
      for (final module in level.modules) {
        if (module.title == widget.moduleTitle) {
          matchedModule = module;
          break;
        }
      }
      if (matchedModule != null) break;
    }

    if (matchedModule == null || matchedModule.lessons.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      children: [
        Text(
          'What\'s Covered in This Episode',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 4),
        Text(
          'This episode walks through everything in ${matchedModule.title}:',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 14),
        for (int i = 0; i < matchedModule.lessons.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7C4DFF).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF4527A0)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    matchedModule.lessons[i].title,
                    style: const TextStyle(fontSize: 13.5, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildTranscript() {
    if (widget.episode.lines.isEmpty) return _buildTopicsCovered();
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      children: [
        Text('Transcript', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
        const SizedBox(height: 10),
        for (final line in widget.episode.lines)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                children: [
                  TextSpan(
                    text: '${line.speaker == PodcastSpeaker.hostA ? 'Maya' : 'Alex'}: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: line.speaker == PodcastSpeaker.hostA ? Colors.blue.shade700 : Colors.deepPurple.shade700,
                    ),
                  ),
                  TextSpan(text: line.text),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
