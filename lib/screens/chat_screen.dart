import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/levels_data.dart';
import 'topic_detail_screen.dart';
import 'topics_screen.dart';

/// The cybersecurity chatbot conversation screen — reachable from the
/// floating icon that appears above every screen in the app (see
/// main.dart). Calls the cybersecurityChat Cloud Function (Genkit +
/// Gemini, scoped to cybersecurity topics server-side) and reads/writes
/// chat history directly from users/{uid}/chatMessages, the same
/// collection that function saves to — so history persists across
/// sessions without needing a separate "get history" function call.
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatMessage {
  final String role; // 'user' or 'model'
  final String text;
  // Only ever set on 'model' messages — 'chapter' points at a Read
  // Through module (referenceLabel matches a Module.title in
  // levels_data.dart), 'soc' points at a SOC Fundamentals lesson
  // (tapping opens the whole SOC Fundamentals list, not that specific
  // lesson, per how this was scoped).
  final String? referenceType;
  final String? referenceLabel;
  const _ChatMessage({
    required this.role,
    required this.text,
    this.referenceType,
    this.referenceLabel,
  });
}

class _ChatScreenState extends State<ChatScreen> {
  final List<_ChatMessage> _messages = [];
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _loadingHistory = true;
  bool _sending = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadHistory() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      setState(() => _loadingHistory = false);
      return;
    }
    try {
      final snap = await FirebaseFirestore.instance
          .collection('users').doc(uid).collection('chatMessages')
          .orderBy('timestamp')
          .get();
      final loaded = snap.docs
          .map((d) => _ChatMessage(
                role: d.data()['role'] as String? ?? 'model',
                text: d.data()['text'] as String? ?? '',
                referenceType: d.data()['referenceType'] as String?,
                referenceLabel: d.data()['referenceLabel'] as String?,
              ))
          .toList();
      if (mounted) {
        setState(() {
          _messages.addAll(loaded);
          _loadingHistory = false;
        });
        _scrollToBottom();
      }
    } catch (_) {
      // Best-effort — if history can't be loaded, the user can still
      // start a fresh conversation from here.
      if (mounted) setState(() => _loadingHistory = false);
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _inputController.text.trim();
    if (text.isEmpty || _sending) return;

    setState(() {
      _messages.add(_ChatMessage(role: 'user', text: text));
      _sending = true;
      _error = null;
      _inputController.clear();
    });
    _scrollToBottom();

    try {
      final callable = FirebaseFunctions.instance.httpsCallable('cybersecurityChat');
      final result = await callable.call({'message': text});
      final reply = result.data['reply'] as String? ?? "Sorry, I couldn't generate a response.";
      final referenceType = result.data['referenceType'] as String?;
      final referenceLabel = result.data['referenceLabel'] as String?;
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            role: 'model',
            text: reply,
            referenceType: referenceType,
            referenceLabel: referenceLabel,
          ));
          _sending = false;
        });
        _scrollToBottom();
      }
    } on FirebaseFunctionsException catch (e) {
      // resource-exhausted is the daily-limit case specifically —
      // shown as a friendly banner rather than a generic error, since
      // it's an expected, actionable state, not a failure.
      final message = e.code == 'resource-exhausted'
          ? e.message ?? "You've reached today's question limit."
          : 'Something went wrong. Please try again.';
      if (mounted) {
        setState(() {
          _error = message;
          _sending = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _error = 'Something went wrong. Please check your connection and try again.';
          _sending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.auto_awesome, size: 20),
            SizedBox(width: 8),
            Text('Pulse AI'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _loadingHistory
                ? const Center(child: CircularProgressIndicator())
                : _messages.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) => _buildBubble(_messages[index]),
                      ),
          ),
          if (_error != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange.withValues(alpha: 0.4)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.orange, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(_error!, style: const TextStyle(fontSize: 12.5))),
                ],
              ),
            ),
          if (_sending)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: 18, height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          _buildInputRow(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_awesome, size: 56, color: Colors.blue.shade200),
            const SizedBox(height: 16),
            const Text(
              'Ask me anything about cybersecurity',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Concepts, career advice, or questions about your course content — I\'m here to help.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            Text(
              'Tip: long-press any response to report it.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5, color: Colors.grey.shade500, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBubble(_ChatMessage message) {
    final isUser = message.role == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        // Long-press to report — only meaningful for the AI's own
        // responses, not the user's own messages, so this is only
        // wired up on the model bubble below.
        onLongPress: isUser ? null : () => _showReportDialog(message.text),
        child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.78),
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isUser ? const Color(0xFF1565C0) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: isUser
                ? null
                : [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              isUser
                  ? Text(
                      message.text,
                      style: const TextStyle(fontSize: 14.5, color: Colors.white, height: 1.4),
                    )
                  : _buildFormattedReply(message.text),
              if (!isUser && message.referenceType != null && message.referenceLabel != null) ...[
                const SizedBox(height: 8),
                _buildReferenceChip(message.referenceType!, message.referenceLabel!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Renders the AI's light markdown (**bold**, *italic*, `code`,
  /// "-"/"*"/"1." lists, "#" headings) as styled text, so raw
  /// asterisks never show in a bubble. No extra dependency.
  Widget _buildFormattedReply(String raw) {
    const base = TextStyle(fontSize: 14.5, color: Colors.black87, height: 1.4);
    final lines = raw.replaceAll('\r\n', '\n').split('\n');
    final children = <Widget>[];
    for (final line in lines) {
      final t = line.trimRight();
      if (t.trim().isEmpty) {
        children.add(const SizedBox(height: 6));
        continue;
      }
      final heading = RegExp(r'^\s*#{1,6}\s+(.*)$').firstMatch(t);
      final bullet = RegExp(r'^\s*[-*•]\s+(.*)$').firstMatch(t);
      final numbered = RegExp(r'^\s*(\d+)[.)]\s+(.*)$').firstMatch(t);
      if (heading != null) {
        children.add(Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 2),
          child: Text.rich(_inlineSpans(heading.group(1)!, base.copyWith(fontWeight: FontWeight.bold, fontSize: 15.5))),
        ));
      } else if (bullet != null || numbered != null) {
        final marker = bullet != null ? '•' : '${numbered!.group(1)}.';
        final body = bullet != null ? bullet.group(1)! : numbered!.group(2)!;
        children.add(Padding(
          padding: const EdgeInsets.only(left: 4, top: 2, bottom: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20, child: Text(marker, style: base)),
              Expanded(child: Text.rich(_inlineSpans(body, base))),
            ],
          ),
        ));
      } else {
        children.add(Text.rich(_inlineSpans(t, base)));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  TextSpan _inlineSpans(String text, TextStyle style) {
    final spans = <InlineSpan>[];
    final re = RegExp(r'\*\*(.+?)\*\*|__(.+?)__|`([^`]+)`|\*([^*\s][^*]*?)\*');
    var last = 0;
    for (final m in re.allMatches(text)) {
      if (m.start > last) spans.add(TextSpan(text: text.substring(last, m.start)));
      if (m.group(1) != null || m.group(2) != null) {
        spans.add(TextSpan(text: m.group(1) ?? m.group(2), style: const TextStyle(fontWeight: FontWeight.bold)));
      } else if (m.group(3) != null) {
        spans.add(TextSpan(
          text: m.group(3),
          style: TextStyle(fontFamily: 'monospace', backgroundColor: Colors.grey.shade200, fontSize: style.fontSize! - 1),
        ));
      } else {
        spans.add(TextSpan(text: m.group(4), style: const TextStyle(fontStyle: FontStyle.italic)));
      }
      last = m.end;
    }
    if (last < text.length) spans.add(TextSpan(text: text.substring(last)));
    return TextSpan(style: style, children: spans);
  }

  /// A tappable chip pointing at the course content the reply drew on —
  /// this replaces the old approach of naming the lesson inline in the
  /// AI's own prose, which was easy to miss. Tapping it opens the
  /// relevant chapter/module list (TopicDetailScreen for a Read Through
  /// chapter, via its Module.title; the SOC Fundamentals list for a SOC
  /// lesson) — not the specific lesson itself, per how this was scoped.
  Widget _buildReferenceChip(String referenceType, String referenceLabel) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => _openReference(referenceType, referenceLabel),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: const Color(0xFF1565C0).withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF1565C0).withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.menu_book, size: 14, color: Color(0xFF1565C0)),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                referenceLabel,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1565C0),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xFF1565C0)),
          ],
        ),
      ),
    );
  }

  void _openReference(String referenceType, String referenceLabel) {
    if (referenceType == 'soc') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ThePulseScreen()),
      );
      return;
    }
    // referenceType == 'chapter' — look up the matching TopicEntry by
    // its Module.title (set server-side from the exact same title list
    // the system prompt was given, so this should always find a match;
    // if a chapter is ever renamed without updating that list, this
    // silently does nothing rather than crashing).
    TopicEntry? entry;
    for (final e in allTopics) {
      if (e.module.title == referenceLabel) {
        entry = e;
        break;
      }
    }
    if (entry == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TopicDetailScreen(entry: entry!)),
    );
  }

  /// Same "one-way mailbox" reporting pattern as the podcast's
  /// existing report feature — writes directly to a Firestore
  /// collection the client can create into but never read back,
  /// reviewed only via the Firebase Console. Gives visibility into
  /// misuse attempts or bad model outputs, and matches what Google
  /// Play's Generative AI content policy expects for AI-generated
  /// content.
  Future<void> _showReportDialog(String reportedText) async {
    String reason = 'Inaccurate or misleading information';
    final detailsController = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          scrollable: true,
          title: const Text('Report This Response'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This response is AI-generated. Let us know if something here is wrong.',
                style: TextStyle(fontSize: 12.5, color: Colors.black54),
              ),
              const SizedBox(height: 12),
              for (final option in const [
                'Inaccurate or misleading information',
                'Offensive or inappropriate content',
                'Off-topic / not about cybersecurity',
                'Other',
              ])
                RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(option, style: const TextStyle(fontSize: 13.5)),
                  value: option,
                  groupValue: reason,
                  onChanged: (v) => setDialogState(() => reason = v!),
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
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            FilledButton(
              onPressed: () async {
                Navigator.pop(ctx);
                await _submitReport(reportedText, reason, detailsController.text.trim());
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitReport(String reportedText, String reason, String details) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    try {
      await FirebaseFirestore.instance.collection('chatbotReports').add({
        'uid': uid,
        'reportedText': reportedText,
        'reason': reason,
        'details': details,
        'createdAt': FieldValue.serverTimestamp(),
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thanks — this has been reported.')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not submit report — please try again.')),
        );
      }
    }
  }

  Widget _buildInputRow() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 10, 12, MediaQuery.of(context).padding.bottom + 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6, offset: const Offset(0, -2))],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputController,
              minLines: 1,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Ask a cybersecurity question…',
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFF1565C0),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 18),
              onPressed: _sending ? null : _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
