import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/progress_service.dart';
import 'admin_puzzle_screen.dart';
import 'puzzle_leaderboard_screen.dart';

/// Today's puzzle, visible to every signed-in user regardless of
/// opt-in status — only the ability to actually SUBMIT an answer is
/// gated behind having opted into the puzzle game. This matches the
/// "browse first, participate if you want" experience: nothing about
/// seeing the puzzle requires opting in, only answering it does.
class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  bool _loading = true;
  bool _available = false;
  Map<String, dynamic>? _question;
  String? _type;

  bool _subscribed = false;
  bool _isAdmin = false;
  bool _alreadyAttemptedToday = false;
  bool _submitting = false;
  _SubmitResult? _result;

  // Answer-in-progress state, shape depends on _type.
  int? _mcqSelectedIndex;
  final Set<String> _selectedFlags = {};
  final Map<String, String> _matchedPairs = {}; // term -> definition
  String? _pendingTermSelection;
  List<String> _sequenceOrder = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final progressDoc = uid == null
          ? null
          : await FirebaseFirestore.instance.collection('users').doc(uid).collection('progress').doc('summary').get();
      final subscribed = progressDoc?.data()?['puzzleSubscribed'] == true;
      final todayKey = DateTime.now().toIso8601String().substring(0, 10); // approximate; server enforces the real check
      final lastAttempt = progressDoc?.data()?['puzzleLastAttemptDate'] as String?;

      final result = await FirebaseFunctions.instance.httpsCallable('getTodaysPuzzle').call();
      final data = Map<String, dynamic>.from(result.data as Map);
      final isAdmin = await ProgressService.isAdmin();

      setState(() {
        _available = data['available'] == true;
        _question = data['question'] == null ? null : Map<String, dynamic>.from(data['question']);
        _type = data['type'] as String?;
        _subscribed = subscribed;
        _isAdmin = isAdmin;
        _alreadyAttemptedToday = lastAttempt != null && lastAttempt == todayKey;
        _loading = false;
        if (_type == 'sequence' && _question?['items'] != null) {
          _sequenceOrder = List<String>.from(_question!['items']);
        }
      });
    } catch (_) {
      setState(() {
        _loading = false;
        _available = false;
      });
    }
  }

  Future<void> _optIn() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    await FirebaseFirestore.instance.collection('users').doc(uid).collection('progress').doc('summary').set(
      {'puzzleSubscribed': true},
      SetOptions(merge: true),
    );
    setState(() => _subscribed = true);
  }

  bool get _canSubmit {
    if (!_subscribed || _alreadyAttemptedToday || _submitting) return false;
    switch (_type) {
      case 'mcq':
        return _mcqSelectedIndex != null;
      case 'spotMistake':
        return _selectedFlags.isNotEmpty;
      case 'matching':
        final terms = List<String>.from(_question?['terms'] ?? []);
        return _matchedPairs.length == terms.length;
      case 'sequence':
        return true; // any order can be submitted
      default:
        return false;
    }
  }

  Future<void> _submit() async {
    dynamic answer;
    switch (_type) {
      case 'mcq':
        answer = (_question!['options'] as List)[_mcqSelectedIndex!];
        break;
      case 'spotMistake':
        answer = _selectedFlags.toList();
        break;
      case 'matching':
        answer = _matchedPairs.entries.map((e) => {'term': e.key, 'definition': e.value}).toList();
        break;
      case 'sequence':
        answer = _sequenceOrder;
        break;
    }

    setState(() => _submitting = true);
    try {
      final result = await FirebaseFunctions.instance.httpsCallable('submitPuzzleAnswer').call({'answer': answer});
      final data = Map<String, dynamic>.from(result.data as Map);
      setState(() {
        _result = _SubmitResult(
          correct: data['correct'] == true,
          pointsEarned: data['pointsEarned'] as int? ?? 0,
          wasBonus: data['wasBonus'] == true,
        );
        _alreadyAttemptedToday = true;
      });
    } on FirebaseFunctionsException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'Could not submit your answer.')));
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      appBar: AppBar(
        title: const Text('Today\'s Puzzle'),
        actions: [
          IconButton(
            icon: const Icon(Icons.leaderboard_outlined),
            tooltip: 'Leaderboard',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PuzzleLeaderboardScreen()));
            },
          ),
          if (_isAdmin)
            IconButton(
              icon: const Icon(Icons.add_box_outlined),
              tooltip: 'Create Puzzle (Admin)',
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminPuzzleScreen()));
                _load();
              },
            ),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : !_available
                ? const Center(child: Text('No puzzle is available right now — check back soon.'))
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      if (!_subscribed) _buildOptInBanner(),
                      _buildQuestionBody(),
                      const SizedBox(height: 20),
                      if (_result != null) _buildResultCard() else _buildSubmitButton(),
                    ],
                  ),
      ),
    );
  }

  Widget _buildOptInBanner() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Want to play?', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text(
            'Opt in (free) to submit answers, earn points, and appear on the leaderboard. '
            'You can still read today\'s puzzle either way.',
            style: TextStyle(fontSize: 12.5),
          ),
          const SizedBox(height: 10),
          FilledButton(onPressed: _optIn, child: const Text('Opt In — It\'s Free')),
        ],
      ),
    );
  }

  Widget _buildQuestionBody() {
    switch (_type) {
      case 'mcq':
        return _buildMcqBody();
      case 'spotMistake':
        return _buildSpotMistakeBody();
      case 'matching':
        return _buildMatchingBody();
      case 'sequence':
        return _buildSequenceBody();
      default:
        return const Text('This puzzle type isn\'t supported yet.');
    }
  }

  Widget _buildMcqBody() {
    final options = List<String>.from(_question?['options'] ?? []);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_question?['prompt'] ?? '', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            for (int i = 0; i < options.length; i++)
              RadioListTile<int>(
                contentPadding: EdgeInsets.zero,
                title: Text(options[i]),
                value: i,
                groupValue: _mcqSelectedIndex,
                onChanged: _subscribed && !_alreadyAttemptedToday ? (v) => setState(() => _mcqSelectedIndex = v) : null,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpotMistakeBody() {
    final options = List<String>.from(_question?['options'] ?? []);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_question?['scenario'] ?? '', style: const TextStyle(fontSize: 14, height: 1.5)),
            const SizedBox(height: 12),
            const Text('Select every warning sign you can find:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
            for (final flag in options)
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(flag),
                value: _selectedFlags.contains(flag),
                onChanged: _subscribed && !_alreadyAttemptedToday
                    ? (checked) => setState(() {
                          if (checked == true) {
                            _selectedFlags.add(flag);
                          } else {
                            _selectedFlags.remove(flag);
                          }
                        })
                    : null,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchingBody() {
    final terms = List<String>.from(_question?['terms'] ?? []);
    final definitions = List<String>.from(_question?['definitions'] ?? []);
    final canInteract = _subscribed && !_alreadyAttemptedToday;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tap a term, then tap its matching definition:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: terms.map((term) {
                final isMatched = _matchedPairs.containsKey(term);
                final isPending = _pendingTermSelection == term;
                return ChoiceChip(
                  label: Text(isMatched ? '$term ✓' : term),
                  selected: isPending,
                  onSelected: !canInteract || isMatched
                      ? null
                      : (_) => setState(() => _pendingTermSelection = isPending ? null : term),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: definitions.map((def) {
                final isUsed = _matchedPairs.containsValue(def);
                return ActionChip(
                  label: Text(def),
                  backgroundColor: isUsed ? Colors.grey.shade200 : null,
                  onPressed: !canInteract || isUsed || _pendingTermSelection == null
                      ? null
                      : () => setState(() {
                            _matchedPairs[_pendingTermSelection!] = def;
                            _pendingTermSelection = null;
                          }),
                );
              }).toList(),
            ),
            if (_matchedPairs.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Divider(),
              const Text('Your matches:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              for (final entry in _matchedPairs.entries)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Expanded(child: Text('${entry.key} → ${entry.value}', style: const TextStyle(fontSize: 12.5))),
                      if (canInteract)
                        IconButton(
                          icon: const Icon(Icons.close, size: 16),
                          onPressed: () => setState(() => _matchedPairs.remove(entry.key)),
                        ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSequenceBody() {
    final canInteract = _subscribed && !_alreadyAttemptedToday;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_question?['prompt'] ?? '', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            const Text('Use the arrows to put these in the correct order:', style: TextStyle(fontSize: 12.5, color: Colors.grey)),
            const SizedBox(height: 8),
            for (int i = 0; i < _sequenceOrder.length; i++)
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    CircleAvatar(radius: 11, child: Text('${i + 1}', style: const TextStyle(fontSize: 11))),
                    const SizedBox(width: 10),
                    Expanded(child: Text(_sequenceOrder[i])),
                    IconButton(
                      icon: const Icon(Icons.arrow_upward, size: 18),
                      onPressed: !canInteract || i == 0
                          ? null
                          : () => setState(() {
                                final item = _sequenceOrder.removeAt(i);
                                _sequenceOrder.insert(i - 1, item);
                              }),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_downward, size: 18),
                      onPressed: !canInteract || i == _sequenceOrder.length - 1
                          ? null
                          : () => setState(() {
                                final item = _sequenceOrder.removeAt(i);
                                _sequenceOrder.insert(i + 1, item);
                              }),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    String label;
    if (_alreadyAttemptedToday) {
      label = 'Already attempted today';
    } else if (!_subscribed) {
      label = 'Opt in above to submit';
    } else {
      label = 'Submit Answer';
    }
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: _canSubmit ? _submit : null,
        child: _submitting
            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.5))
            : Text(label),
      ),
    );
  }

  Widget _buildResultCard() {
    final r = _result!;
    return Card(
      color: r.correct ? Colors.green.withValues(alpha: 0.08) : Colors.red.withValues(alpha: 0.08),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(r.correct ? Icons.check_circle : Icons.cancel, size: 40, color: r.correct ? Colors.green : Colors.red),
            const SizedBox(height: 8),
            Text(
              r.correct ? 'Correct!' : 'Not quite',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (r.correct) ...[
              const SizedBox(height: 4),
              Text('+${r.pointsEarned} points${r.wasBonus ? ' (early bonus!)' : ''}'),
            ],
          ],
        ),
      ),
    );
  }
}

class _SubmitResult {
  final bool correct;
  final int pointsEarned;
  final bool wasBonus;
  _SubmitResult({required this.correct, required this.pointsEarned, required this.wasBonus});
}
