import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

/// Admin-only puzzle creation screen — redesigned around a single
/// paste-friendly text box per type, since typing into many small
/// separate fields (4 options, several flags, etc.) one at a time was
/// genuinely tedious on a mobile keyboard. Each type has a simple
/// labeled-line format (shown as hint text) that gets parsed into the
/// same data shape createPuzzle already expects — nothing changed on
/// the backend side, just how the content gets typed in here.
class AdminPuzzleScreen extends StatefulWidget {
  const AdminPuzzleScreen({super.key});

  @override
  State<AdminPuzzleScreen> createState() => _AdminPuzzleScreenState();
}

enum _PuzzleType { mcq, spotMistake, matching, sequence }

extension on _PuzzleType {
  String get apiValue => switch (this) {
        _PuzzleType.mcq => 'mcq',
        _PuzzleType.spotMistake => 'spotMistake',
        _PuzzleType.matching => 'matching',
        _PuzzleType.sequence => 'sequence',
      };

  String get label => switch (this) {
        _PuzzleType.mcq => 'Multiple Choice',
        _PuzzleType.spotMistake => 'Spot the Mistake',
        _PuzzleType.matching => 'Matching (Term \u2194 Definition)',
        _PuzzleType.sequence => 'Correct Sequence',
      };

  /// Shown as the text field's hint — a realistic filled-in example
  /// (not just abstract labels), since that's the fastest way to
  /// understand a format when you're on mobile and don't want to
  /// switch screens to read separate instructions.
  String get formatExample => switch (this) {
        _PuzzleType.mcq => 'Prompt: What is phishing?\n'
            'Option: A type of malware\n'
            'Option: A social engineering attack using deceptive messages\n'
            'Option: A firewall misconfiguration\n'
            'Option: A network protocol\n'
            'Correct: A social engineering attack using deceptive messages',
        _PuzzleType.spotMistake => 'Scenario: Ravi gets an unexpected email attachment '
            'named Invoice_Update.exe. It says "Open immediately to avoid '
            'account suspension." He opens it without checking the sender.\n'
            'Flag: The attachment is an .exe file\n'
            'Flag: The message creates urgency\n'
            'Flag: He never checked who sent it\n'
            'Flag: The email had a logo\n'
            'Correct: The attachment is an .exe file\n'
            'Correct: The message creates urgency\n'
            'Correct: He never checked who sent it',
        _PuzzleType.matching => 'Pair: Asset | Anything of value to an organization that needs protecting\n'
            'Pair: Threat | Any potential event that could cause harm\n'
            'Pair: Vulnerability | A weakness that could be exploited',
        _PuzzleType.sequence => 'Prompt: Put these attack lifecycle stages in the correct order\n'
            'Step: Reconnaissance\n'
            'Step: Weaponization\n'
            'Step: Delivery\n'
            'Step: Exploitation',
      };
}

class _AdminPuzzleScreenState extends State<AdminPuzzleScreen> {
  _PuzzleType _type = _PuzzleType.mcq;
  final _pasteController = TextEditingController();
  bool _submitting = false;
  String? _parseError;

  @override
  void dispose() {
    _pasteController.dispose();
    super.dispose();
  }

  /// Splits pasted text into lines, matches each against a label
  /// (case-insensitive, tolerant of extra spacing), and returns the
  /// text after the label. Blank lines are skipped.
  List<MapEntry<String, String>> _parseLabeledLines(String text) {
    final result = <MapEntry<String, String>>[];
    for (final rawLine in text.split('\n')) {
      final line = rawLine.trim();
      if (line.isEmpty) continue;
      final colonIndex = line.indexOf(':');
      if (colonIndex == -1) continue;
      final label = line.substring(0, colonIndex).trim().toLowerCase();
      final value = line.substring(colonIndex + 1).trim();
      if (value.isNotEmpty) result.add(MapEntry(label, value));
    }
    return result;
  }

  /// Parses the pasted text for the currently selected type into
  /// {question, correctAnswer} — the exact shape createPuzzle expects.
  /// Returns null and sets _parseError on any validation failure.
  Map<String, dynamic>? _parseCurrentType() {
    final lines = _parseLabeledLines(_pasteController.text);

    switch (_type) {
      case _PuzzleType.mcq:
        final prompt = lines.firstWhere((e) => e.key == 'prompt', orElse: () => const MapEntry('', '')).value;
        final options = lines.where((e) => e.key == 'option').map((e) => e.value).toList();
        final correct = lines.firstWhere((e) => e.key == 'correct', orElse: () => const MapEntry('', '')).value;
        if (prompt.isEmpty) return _fail('Missing a "Prompt:" line.');
        if (options.length < 2) return _fail('Need at least 2 "Option:" lines.');
        if (correct.isEmpty) return _fail('Missing a "Correct:" line.');
        if (!options.contains(correct)) return _fail('The "Correct:" line must exactly match one of the "Option:" lines.');
        return {
          'question': {'prompt': prompt, 'options': options},
          'correctAnswer': correct,
        };

      case _PuzzleType.spotMistake:
        final scenario = lines.firstWhere((e) => e.key == 'scenario', orElse: () => const MapEntry('', '')).value;
        final flags = lines.where((e) => e.key == 'flag').map((e) => e.value).toList();
        final correctFlags = lines.where((e) => e.key == 'correct').map((e) => e.value).toList();
        if (scenario.isEmpty) return _fail('Missing a "Scenario:" line.');
        if (flags.length < 2) return _fail('Need at least 2 "Flag:" lines.');
        if (correctFlags.isEmpty) return _fail('Need at least 1 "Correct:" line.');
        for (final c in correctFlags) {
          if (!flags.contains(c)) return _fail('"Correct: $c" must exactly match one of the "Flag:" lines.');
        }
        return {
          'question': {'scenario': scenario, 'options': flags},
          'correctAnswer': correctFlags,
        };

      case _PuzzleType.matching:
        final pairs = <Map<String, String>>[];
        for (final e in lines.where((e) => e.key == 'pair')) {
          final parts = e.value.split('|');
          if (parts.length != 2) return _fail('Each "Pair:" line needs a | between term and definition.');
          pairs.add({'term': parts[0].trim(), 'definition': parts[1].trim()});
        }
        if (pairs.length < 2) return _fail('Need at least 2 "Pair:" lines.');
        final terms = pairs.map((p) => p['term']!).toList();
        final definitions = List<String>.from(pairs.map((p) => p['definition']!))..shuffle();
        return {
          'question': {'terms': terms, 'definitions': definitions},
          'correctAnswer': pairs,
        };

      case _PuzzleType.sequence:
        final prompt = lines.firstWhere((e) => e.key == 'prompt', orElse: () => const MapEntry('', '')).value;
        final steps = lines.where((e) => e.key == 'step').map((e) => e.value).toList();
        if (prompt.isEmpty) return _fail('Missing a "Prompt:" line.');
        if (steps.length < 2) return _fail('Need at least 2 "Step:" lines, in the correct order.');
        final shuffledForDisplay = List<String>.from(steps)..shuffle();
        return {
          'question': {'prompt': prompt, 'items': shuffledForDisplay},
          'correctAnswer': steps,
        };
    }
  }

  Map<String, dynamic>? _fail(String message) {
    _parseError = message;
    return null;
  }

  Future<void> _submit() async {
    setState(() => _parseError = null);

    final parsed = _parseCurrentType();
    if (parsed == null) {
      setState(() {}); // _parseError was already set by _fail
      return;
    }

    setState(() => _submitting = true);
    try {
      await FirebaseFunctions.instance.httpsCallable('createPuzzle').call({
        'type': _type.apiValue,
        'question': parsed['question'],
        'correctAnswer': parsed['correctAnswer'],
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Puzzle created successfully.')));
        _pasteController.clear();
      }
    } on FirebaseFunctionsException catch (e) {
      setState(() => _parseError = e.message ?? 'Could not create the puzzle.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Puzzle')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<_PuzzleType>(
              initialValue: _type,
              decoration: const InputDecoration(labelText: 'Puzzle Type', border: OutlineInputBorder()),
              items: _PuzzleType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.label))).toList(),
              onChanged: (v) => setState(() {
                _type = v!;
                _parseError = null;
              }),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(8)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, size: 16, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Type or paste content below using this format:',
                      style: TextStyle(fontSize: 12, color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _pasteController,
              maxLines: 12,
              minLines: 8,
              style: const TextStyle(fontSize: 13.5, fontFamily: 'monospace'),
              decoration: InputDecoration(
                hintText: _type.formatExample,
                hintStyle: const TextStyle(fontSize: 12, fontFamily: 'monospace', color: Colors.grey),
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            if (_parseError != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, size: 16, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(child: Text(_parseError!, style: const TextStyle(fontSize: 12.5, color: Colors.red))),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _submitting ? null : _submit,
                child: _submitting
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.5))
                    : const Text('Create Puzzle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
