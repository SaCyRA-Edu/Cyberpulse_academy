import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/soc_investigation_data.dart';
import '../services/chat_overlay_visibility.dart';
import '../services/investigation_progress_service.dart';

/// The Pulse — Investigation Practice simulator (Part B).
///
/// Walks a learner through one [InvScenario] in seven stages that mirror
/// the universal workflow taught in SOC Fundamentals:
///   1 Alert  2 Triage  3 Evidence (+ ticket note)  4 FP/TP + why
///   5 Contain & eradicate  6 Classify severity  7 Document.
/// Self-contained: it uses only the scenario data and local state.
class InvestigationScreen extends StatefulWidget {
  final InvScenario scenario;
  const InvestigationScreen({super.key, required this.scenario});

  @override
  State<InvestigationScreen> createState() => _InvestigationScreenState();
}

enum _Kind { alert, mcq, evidence, budget, highlight, sequence, timeline, summary }

class _Stage {
  final String label; // short name shown in the header
  final _Kind kind;
  final InvMcq? mcq;
  const _Stage(this.label, this.kind, [this.mcq]);
}

const _red = Color(0xFFC62828);

class _InvestigationScreenState extends State<InvestigationScreen> {
  late final List<_Stage> _stages;
  int _index = 0;
  int _score = 0;
  int _total = 0;

  @override
  void dispose() {
    // Pulse AI comes back as soon as the investigation is left.
    ChatOverlayVisibility.hidden.value = false;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Pulse AI is inactive during an investigation: working the alert
    // unaided is the whole point of the exercise.
    ChatOverlayVisibility.hidden.value = true;
    final s = widget.scenario;
    _stages = [
      const _Stage('Alert', _Kind.alert),
      _Stage('Triage', _Kind.mcq, s.triage),
      if (s.evidenceBudget != null)
        const _Stage('Evidence', _Kind.budget)
      else
        const _Stage('Evidence', _Kind.evidence),
      if (s.highlight != null) const _Stage('Spot the signs', _Kind.highlight),
      _Stage('Ticket note', _Kind.mcq, s.ticketNote),
      _Stage('FP or TP?', _Kind.mcq, s.verdict),
      _Stage('Why?', _Kind.mcq, s.whyEvidence),
      if (s.timeline != null) const _Stage('Timeline', _Kind.timeline),
      if (s.isTruePositive) const _Stage('Contain', _Kind.sequence),
      _Stage('Severity', _Kind.mcq, s.severity),
      _Stage('Document', _Kind.mcq, s.documentation),
      const _Stage('Result', _Kind.summary),
    ];
  }

  void _next() {
    if (_index < _stages.length - 1) {
      setState(() => _index++);
      if (_stages[_index].kind == _Kind.summary) {
        // Fire-and-forget: saving must never block or break the result screen.
        InvestigationProgressService.recordAttempt(
            widget.scenario.id, _score, _total);
      }
    }
  }

  void _record(bool correct) {
    _total++;
    if (correct) _score++;
  }

  Future<bool> _confirmExit() async {
    if (_index == 0 || _stages[_index].kind == _Kind.summary) return true;
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave this investigation?'),
        content: const Text('Your progress in this scenario will be lost.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Keep going')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Leave')),
        ],
      ),
    );
    return leave ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final stage = _stages[_index];
    final s = widget.scenario;
    final progress = (_index + 1) / _stages.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final nav = Navigator.of(context);
        if (await _confirmExit()) nav.pop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F4FF),
        appBar: AppBar(
          backgroundColor: _red,
          foregroundColor: Colors.white,
          title: Text(s.title, style: const TextStyle(fontSize: 16)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.fromLTRB(
                16, 16, 16, 24 + MediaQuery.of(context).viewPadding.bottom),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.smart_toy_outlined,
                        size: 16, color: Colors.grey.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Pulse AI is inactive during investigations. Work it '
                        'like a real analyst; it returns when you leave.',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade800),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'STEP ${_index + 1} OF ${_stages.length}  ·  ${stage.label.toUpperCase()}',
                style: TextStyle(
                    fontSize: 11.5,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
              const SizedBox(height: 10),
              _buildStage(stage),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStage(_Stage stage) {
    final s = widget.scenario;
    switch (stage.kind) {
      case _Kind.alert:
        return _AlertStage(scenario: s, onStart: _next);
      case _Kind.mcq:
        return _McqStage(
          key: ValueKey('mcq-$_index'),
          mcq: stage.mcq!,
          onAnswered: _record,
          onContinue: _next,
        );
      case _Kind.evidence:
        return _EvidenceStage(
          key: const ValueKey('evidence'),
          items: s.evidence,
          onContinue: _next,
        );
      case _Kind.budget:
        return _BudgetEvidenceStage(
          key: const ValueKey('budget'),
          items: s.evidence,
          budget: s.evidenceBudget!,
          onAnswered: _record,
          onContinue: _next,
        );
      case _Kind.highlight:
        return _HighlightStage(
          key: const ValueKey('highlight'),
          data: s.highlight!,
          onAnswered: _record,
          onContinue: _next,
        );
      case _Kind.timeline:
        return _SequenceStage(
          key: const ValueKey('timeline'),
          prompt: s.timeline!.prompt,
          steps: s.timeline!.events,
          explanation: s.timeline!.explanation,
          instruction:
              'Tap events in the order they happened. Tap a numbered event to take it back.',
          poolLabel: 'EVENTS',
          keyTitle: 'Actual order',
          onAnswered: _record,
          onContinue: _next,
        );
      case _Kind.sequence:
        return _SequenceStage(
          key: const ValueKey('sequence'),
          prompt: s.containPrompt,
          steps: s.containSteps,
          explanation: s.containExplanation,
          onAnswered: _record,
          onContinue: _next,
        );
      case _Kind.summary:
        return _SummaryStage(
          scenario: s,
          score: _score,
          total: _total,
          onDone: () => Navigator.pop(context),
        );
    }
  }
}

// ── Shared bits ────────────────────────────────────────────────────────────

Widget _card({required Widget child, Color? color, Color? border}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: border != null ? Border.all(color: border) : null,
      boxShadow: [
        BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2)),
      ],
    ),
    child: child,
  );
}

Widget _primaryButton(String label, VoidCallback? onTap) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: _red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _feedback(bool correct, String explanation) {
  final color = correct ? Colors.green.shade700 : Colors.orange.shade800;
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 14),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withValues(alpha: 0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(correct ? Icons.check_circle : Icons.info, color: color, size: 20),
          const SizedBox(width: 8),
          Text(correct ? 'Correct' : 'Not quite',
              style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ]),
        const SizedBox(height: 8),
        Text(explanation,
            style: TextStyle(fontSize: 13.5, height: 1.4, color: Colors.grey.shade900)),
      ],
    ),
  );
}

// ── Stage 1: alert ─────────────────────────────────────────────────────────

class _AlertStage extends StatelessWidget {
  final InvScenario scenario;
  final VoidCallback onStart;
  const _AlertStage({required this.scenario, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _card(
          border: _red.withValues(alpha: 0.35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Icon(Icons.notifications_active, color: _red),
                const SizedBox(width: 8),
                Text('NEW ALERT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.red.shade800,
                        fontSize: 12)),
              ]),
              const SizedBox(height: 10),
              Text(scenario.alertTitle,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('Source: ${scenario.alertSource}',
                  style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700)),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF10151F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(scenario.alertBody,
                    style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        height: 1.45,
                        color: Color(0xFFD7E2F5))),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'You are the L1 analyst on shift. This alert has just landed in '
          'your queue. Work it through, one step at a time.',
          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 4),
        Text(
          'All names, domains and addresses in this scenario are fictional.',
          style: TextStyle(fontSize: 11.5, color: Colors.grey.shade500),
        ),
        const SizedBox(height: 16),
        _primaryButton('Start investigating', onStart),
      ],
    );
  }
}

// ── Multiple-choice stage ──────────────────────────────────────────────────

class _McqStage extends StatefulWidget {
  final InvMcq mcq;
  final void Function(bool correct) onAnswered;
  final VoidCallback onContinue;
  const _McqStage({
    super.key,
    required this.mcq,
    required this.onAnswered,
    required this.onContinue,
  });

  @override
  State<_McqStage> createState() => _McqStageState();
}

class _McqStageState extends State<_McqStage> {
  int? _selected;
  late final List<int> _order;

  @override
  void initState() {
    super.initState();
    _order = List<int>.generate(widget.mcq.options.length, (i) => i);
    if (!widget.mcq.keepOrder) _order.shuffle(math.Random());
  }

  bool get _answered => _selected != null;

  void _pick(int i) {
    if (_answered) return;
    setState(() => _selected = i);
    widget.onAnswered(i == widget.mcq.correctIndex);
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.mcq;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _card(
          child: Text(m.prompt,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.35)),
        ),
        const SizedBox(height: 12),
        for (final i in _order) _option(i),
        if (_answered) ...[
          _feedback(_selected == m.correctIndex, m.explanation),
          const SizedBox(height: 16),
          _primaryButton('Continue', widget.onContinue),
        ],
      ],
    );
  }

  Widget _option(int i) {
    final m = widget.mcq;
    Color border = Colors.grey.shade300;
    Color fill = Colors.white;
    IconData? trailing;
    Color? trailingColor;
    if (_answered) {
      if (i == m.correctIndex) {
        border = Colors.green.shade600;
        fill = Colors.green.withValues(alpha: 0.07);
        trailing = Icons.check_circle;
        trailingColor = Colors.green.shade700;
      } else if (i == _selected) {
        border = Colors.orange.shade700;
        fill = Colors.orange.withValues(alpha: 0.07);
        trailing = Icons.cancel;
        trailingColor = Colors.orange.shade800;
      }
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _answered ? null : () => _pick(i),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: border, width: 1.5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(m.options[i],
                    style: const TextStyle(fontSize: 14, height: 1.35)),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                Icon(trailing, color: trailingColor, size: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ── Stage 3: evidence ──────────────────────────────────────────────────────

class _EvidenceStage extends StatefulWidget {
  final List<InvEvidence> items;
  final VoidCallback onContinue;
  const _EvidenceStage({super.key, required this.items, required this.onContinue});

  @override
  State<_EvidenceStage> createState() => _EvidenceStageState();
}

class _EvidenceStageState extends State<_EvidenceStage> {
  late final List<bool> _revealed =
      List<bool>.filled(widget.items.length, false);

  int get _count => _revealed.where((r) => r).length;

  @override
  Widget build(BuildContext context) {
    final allDone = _count == widget.items.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _card(
          child: Text(
            'Gather evidence. Tap each source to look inside. A good '
            'analyst checks everything relevant before making a call.',
            style: const TextStyle(fontSize: 15, height: 1.35),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text('$_count of ${widget.items.length} sources checked',
              style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700)),
        ),
        for (var i = 0; i < widget.items.length; i++) _tile(i),
        const SizedBox(height: 12),
        _primaryButton(
          allDone ? 'Continue' : 'Check every source to continue',
          allDone ? widget.onContinue : null,
        ),
      ],
    );
  }

  Widget _tile(int i) {
    final item = widget.items[i];
    final open = _revealed[i];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: open ? null : () => setState(() => _revealed[i] = true),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: open ? const Color(0xFF1565C0) : Colors.grey.shade300,
                width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(open ? Icons.lock_open : Icons.lock_outline,
                    size: 18,
                    color: open ? const Color(0xFF1565C0) : Colors.grey.shade600),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(item.label,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ),
                if (!open)
                  Text('Tap to check',
                      style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
              ]),
              if (open) ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10151F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(item.detail,
                      style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 11.5,
                          height: 1.45,
                          color: Color(0xFFD7E2F5))),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ── Stage 5: containment ordering ──────────────────────────────────────────

class _SequenceStage extends StatefulWidget {
  final String prompt;
  final List<String> steps; // correct order
  final String explanation;
  final String instruction;
  final String poolLabel;
  final String keyTitle;
  final void Function(bool correct) onAnswered;
  final VoidCallback onContinue;
  const _SequenceStage({
    super.key,
    required this.prompt,
    required this.steps,
    required this.explanation,
    this.instruction =
        'Tap actions in the order you would do them. Tap a numbered action to take it back.',
    this.poolLabel = 'AVAILABLE ACTIONS',
    this.keyTitle = 'Recommended order',
    required this.onAnswered,
    required this.onContinue,
  });

  @override
  State<_SequenceStage> createState() => _SequenceStageState();
}

class _SequenceStageState extends State<_SequenceStage> {
  late final List<int> _pool; // step indexes still available, shuffled
  final List<int> _picked = [];
  bool _checked = false;
  bool _correct = false;

  @override
  void initState() {
    super.initState();
    _pool = List<int>.generate(widget.steps.length, (i) => i)
      ..shuffle(math.Random(7));
    // Never present the answer key as the starting order.
    final isSorted = List<int>.generate(_pool.length, (i) => i)
        .asMap()
        .entries
        .every((e) => _pool[e.key] == e.value);
    if (isSorted && _pool.length > 1) {
      final first = _pool.removeAt(0);
      _pool.add(first);
    }
  }

  void _check() {
    final ok = List<int>.generate(widget.steps.length, (i) => i)
        .asMap()
        .entries
        .every((e) => _picked[e.key] == e.value);
    setState(() {
      _checked = true;
      _correct = ok;
    });
    widget.onAnswered(ok);
  }

  @override
  Widget build(BuildContext context) {
    final remaining = _pool.where((i) => !_picked.contains(i)).toList();
    final complete = _picked.length == widget.steps.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _card(
          child: Text(
            '${widget.prompt}\n\n${widget.instruction}',
            style: const TextStyle(fontSize: 15, height: 1.4),
          ),
        ),
        const SizedBox(height: 14),
        Text('YOUR ORDER',
            style: TextStyle(
                fontSize: 11.5,
                letterSpacing: 0.8,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        if (_picked.isEmpty)
          Text('Nothing chosen yet.',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
        for (var n = 0; n < _picked.length; n++) _pickedTile(n),
        const SizedBox(height: 14),
        if (remaining.isNotEmpty) ...[
          Text(widget.poolLabel,
              style: TextStyle(
                  fontSize: 11.5,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600)),
          const SizedBox(height: 8),
          for (final i in remaining) _poolTile(i),
        ],
        if (_checked) ...[
          if (!_correct) _answerKey(),
          _feedback(_correct, widget.explanation),
          const SizedBox(height: 16),
          _primaryButton('Continue', widget.onContinue),
        ] else ...[
          const SizedBox(height: 8),
          _primaryButton(
            complete ? 'Check my order' : 'Place all actions to check',
            complete ? _check : null,
          ),
        ],
      ],
    );
  }

  Widget _pickedTile(int n) {
    final stepIndex = _picked[n];
    Color border = const Color(0xFF1565C0);
    if (_checked) {
      border = stepIndex == n ? Colors.green.shade600 : Colors.orange.shade700;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _checked ? null : () => setState(() => _picked.removeAt(n)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: border, width: 1.5),
          ),
          child: Row(children: [
            CircleAvatar(
              radius: 13,
              backgroundColor: border,
              child: Text('${n + 1}',
                  style: const TextStyle(
                      color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Text(widget.steps[stepIndex],
                    style: const TextStyle(fontSize: 13.5, height: 1.35))),
          ]),
        ),
      ),
    );
  }

  Widget _poolTile(int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _checked ? null : () => setState(() => _picked.add(i)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(children: [
            Icon(Icons.add_circle_outline, size: 20, color: Colors.grey.shade600),
            const SizedBox(width: 10),
            Expanded(
                child: Text(widget.steps[i],
                    style: const TextStyle(fontSize: 13.5, height: 1.35))),
          ]),
        ),
      ),
    );
  }

  Widget _answerKey() {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: _card(
        color: Colors.green.withValues(alpha: 0.05),
        border: Colors.green.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.keyTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green.shade800)),
            const SizedBox(height: 8),
            for (var n = 0; n < widget.steps.length; n++)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('${n + 1}. ${widget.steps[n]}',
                    style: const TextStyle(fontSize: 13, height: 1.35)),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Budgeted evidence: choose which checks are worth running ───────────────

class _BudgetEvidenceStage extends StatefulWidget {
  final List<InvEvidence> items;
  final int budget;
  final void Function(bool correct) onAnswered;
  final VoidCallback onContinue;
  const _BudgetEvidenceStage({
    super.key,
    required this.items,
    required this.budget,
    required this.onAnswered,
    required this.onContinue,
  });

  @override
  State<_BudgetEvidenceStage> createState() => _BudgetEvidenceStageState();
}

class _BudgetEvidenceStageState extends State<_BudgetEvidenceStage> {
  final Set<int> _chosen = {};
  bool _ran = false;
  bool _correct = false;

  List<int> get _keyIndexes => [
        for (var i = 0; i < widget.items.length; i++)
          if (widget.items[i].relevance == 2) i
      ];

  void _toggle(int i) {
    if (_ran) return;
    setState(() {
      if (_chosen.contains(i)) {
        _chosen.remove(i);
      } else if (_chosen.length < widget.budget) {
        _chosen.add(i);
      }
    });
  }

  void _run() {
    final missed = _keyIndexes.where((i) => !_chosen.contains(i)).toList();
    setState(() {
      _ran = true;
      _correct = missed.isEmpty;
    });
    widget.onAnswered(missed.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _card(
          child: Text(
            'Time is limited. You can run only ${widget.budget} checks out of '
            '${widget.items.length} possible sources. Choose the ones most '
            'likely to settle the case.',
            style: const TextStyle(fontSize: 15, height: 1.4),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text('Checks selected: ${_chosen.length} of ${widget.budget}',
              style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700)),
        ),
        if (!_ran) ...[
          for (var i = 0; i < widget.items.length; i++) _pickTile(i),
          const SizedBox(height: 12),
          _primaryButton(
            _chosen.isEmpty ? 'Select at least one check' : 'Run selected checks',
            _chosen.isEmpty ? null : _run,
          ),
        ] else
          ..._results(),
      ],
    );
  }

  Widget _pickTile(int i) {
    final chosen = _chosen.contains(i);
    final full = !chosen && _chosen.length >= widget.budget;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: full ? null : () => _toggle(i),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: chosen ? const Color(0xFF1565C0).withValues(alpha: 0.06) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: chosen ? const Color(0xFF1565C0) : Colors.grey.shade300,
                width: 1.5),
          ),
          child: Row(children: [
            Icon(chosen ? Icons.check_box : Icons.check_box_outline_blank,
                color: full ? Colors.grey.shade400 : const Color(0xFF1565C0)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(widget.items[i].label,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: full ? Colors.grey.shade500 : null)),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _resultTile(InvEvidence e, {required String tag, required Color color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: Text(e.label,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(tag,
                    style: TextStyle(
                        fontSize: 10.5, fontWeight: FontWeight.bold, color: color)),
              ),
            ]),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF10151F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(e.detail,
                  style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11.5,
                      height: 1.45,
                      color: Color(0xFFD7E2F5))),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _results() {
    final missed =
        _keyIndexes.where((i) => !_chosen.contains(i)).map((i) => widget.items[i]).toList();
    final noise = _chosen
        .where((i) => widget.items[i].relevance == 0)
        .map((i) => widget.items[i].label)
        .toList();
    final widgets = <Widget>[
      for (final i in _chosen)
        _resultTile(
          widget.items[i],
          tag: widget.items[i].relevance == 2
              ? 'KEY'
              : (widget.items[i].relevance == 1 ? 'USEFUL' : 'NOT RELEVANT'),
          color: widget.items[i].relevance == 2
              ? Colors.green.shade700
              : (widget.items[i].relevance == 1
                  ? const Color(0xFF1565C0)
                  : Colors.grey.shade600),
        ),
    ];
    if (missed.isNotEmpty) {
      widgets.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          'A teammate checked the sources you skipped and shares the key results:',
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
        ),
      ));
      for (final e in missed) {
        widgets.add(_resultTile(e, tag: 'KEY (MISSED)', color: Colors.orange.shade800));
      }
    }
    final text = StringBuffer();
    if (_correct) {
      text.write('You went straight to the evidence that settles the case. ');
    } else {
      text.write('You missed ${missed.length} key '
          '${missed.length == 1 ? 'source' : 'sources'}: '
          '${missed.map((e) => e.label).join('; ')}. ');
    }
    if (noise.isNotEmpty) {
      text.write('You also spent ${noise.length == 1 ? 'a check' : 'checks'} on '
          'something unrelated: ${noise.join('; ')}. ');
    }
    text.write('In real investigations time is short, so pick the sources that '
        'answer "what happened, from where, and what did they do next?" first.');
    widgets.add(_feedback(_correct, text.toString()));
    widgets.add(const SizedBox(height: 16));
    widgets.add(_primaryButton('Continue', widget.onContinue));
    return widgets;
  }
}

// ── Highlight the indicators ───────────────────────────────────────────────

class _HighlightStage extends StatefulWidget {
  final InvHighlight data;
  final void Function(bool correct) onAnswered;
  final VoidCallback onContinue;
  const _HighlightStage({
    super.key,
    required this.data,
    required this.onAnswered,
    required this.onContinue,
  });

  @override
  State<_HighlightStage> createState() => _HighlightStageState();
}

class _HighlightStageState extends State<_HighlightStage> {
  final Set<int> _picked = {};
  bool _checked = false;

  int get _suspiciousTotal => widget.data.lines.where((l) => l.suspicious).length;

  void _check() {
    final lines = widget.data.lines;
    final found = _picked.where((i) => lines[i].suspicious).length;
    final falseAlarms = _picked.length - found;
    setState(() => _checked = true);
    widget.onAnswered(found == _suspiciousTotal && falseAlarms == 0);
  }

  @override
  Widget build(BuildContext context) {
    final lines = widget.data.lines;
    final found = _picked.where((i) => lines[i].suspicious).length;
    final falseAlarms = _picked.length - found;
    final perfect = found == _suspiciousTotal && falseAlarms == 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _card(
          child: Text(widget.data.prompt,
              style: const TextStyle(fontSize: 15, height: 1.4)),
        ),
        const SizedBox(height: 12),
        for (var i = 0; i < lines.length; i++) _lineTile(i),
        if (_checked) ...[
          _feedback(
            perfect,
            'You found $found of $_suspiciousTotal suspicious lines'
            '${falseAlarms > 0 ? ' and flagged $falseAlarms normal ${falseAlarms == 1 ? 'line' : 'lines'}' : ''}. '
            '${widget.data.explanation}',
          ),
          const SizedBox(height: 16),
          _primaryButton('Continue', widget.onContinue),
        ] else ...[
          const SizedBox(height: 8),
          _primaryButton(
            _picked.isEmpty ? 'Tap lines to flag them' : 'Submit (${_picked.length} flagged)',
            _picked.isEmpty ? null : _check,
          ),
        ],
      ],
    );
  }

  Widget _lineTile(int i) {
    final line = widget.data.lines[i];
    final picked = _picked.contains(i);
    Color border = Colors.grey.shade300;
    Color fill = Colors.white;
    String? tag;
    Color tagColor = Colors.grey;
    if (_checked) {
      if (line.suspicious && picked) {
        border = Colors.green.shade600;
        fill = Colors.green.withValues(alpha: 0.07);
        tag = 'FOUND';
        tagColor = Colors.green.shade700;
      } else if (line.suspicious && !picked) {
        border = Colors.orange.shade700;
        fill = Colors.orange.withValues(alpha: 0.07);
        tag = 'MISSED';
        tagColor = Colors.orange.shade800;
      } else if (!line.suspicious && picked) {
        border = Colors.red.shade400;
        fill = Colors.red.withValues(alpha: 0.05);
        tag = 'NORMAL';
        tagColor = Colors.red.shade600;
      }
    } else if (picked) {
      border = const Color(0xFFC62828);
      fill = const Color(0xFFC62828).withValues(alpha: 0.06);
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: _checked
            ? null
            : () => setState(() {
                  if (!_picked.add(i)) _picked.remove(i);
                }),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: border, width: 1.5),
          ),
          child: Row(children: [
            if (!_checked)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(picked ? Icons.flag : Icons.flag_outlined,
                    size: 18,
                    color: picked ? const Color(0xFFC62828) : Colors.grey.shade400),
              ),
            Expanded(
              child: Text(line.text,
                  style: const TextStyle(
                      fontFamily: 'monospace', fontSize: 11.5, height: 1.4)),
            ),
            if (tag != null) ...[
              const SizedBox(width: 8),
              Text(tag,
                  style: TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold, color: tagColor)),
            ],
          ]),
        ),
      ),
    );
  }
}

// ── Final stage: result ────────────────────────────────────────────────────

class _SummaryStage extends StatelessWidget {
  final InvScenario scenario;
  final int score;
  final int total;
  final VoidCallback onDone;
  const _SummaryStage({
    required this.scenario,
    required this.score,
    required this.total,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    final pct = total == 0 ? 0 : (score * 100 / total).round();
    final strong = pct >= 75;
    final color = strong ? Colors.green.shade700 : Colors.orange.shade800;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _card(
          child: Column(
            children: [
              Icon(strong ? Icons.workspace_premium : Icons.school, size: 44, color: color),
              const SizedBox(height: 8),
              Text('Investigation complete',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(scenario.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
              const SizedBox(height: 16),
              Text('$score / $total',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: color)),
              Text('decisions correct first time ($pct%)',
                  style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700)),
              const SizedBox(height: 14),
              Text(
                strong
                    ? 'Solid work. You followed the workflow: triage, evidence, a '
                        'reasoned call, containment, severity, then a clear report.'
                    : 'Good effort. Review the explanations above and the SOC '
                        'Fundamentals lessons, then try the scenario again.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13.5, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _primaryButton('Back to The Pulse', onDone),
      ],
    );
  }
}
