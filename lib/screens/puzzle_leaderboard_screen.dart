import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

/// Shows the top 50 users by cumulative puzzle score, via the
/// getPuzzleLeaderboard Cloud Function — reads across everyone's
/// progress/summary docs server-side (Admin SDK), so no client ever
/// needs direct read access to other users' progress data.
class PuzzleLeaderboardScreen extends StatefulWidget {
  const PuzzleLeaderboardScreen({super.key});

  @override
  State<PuzzleLeaderboardScreen> createState() => _PuzzleLeaderboardScreenState();
}

class _PuzzleLeaderboardScreenState extends State<PuzzleLeaderboardScreen> {
  bool _loading = true;
  String? _error;
  List<_LeaderboardEntry> _entries = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await FirebaseFunctions.instance.httpsCallable('getPuzzleLeaderboard').call();
      final data = Map<String, dynamic>.from(result.data as Map);
      final rawEntries = List<dynamic>.from(data['entries'] ?? []);
      setState(() {
        _entries = rawEntries
            .map((e) => _LeaderboardEntry(
                  displayName: e['displayName'] as String? ?? 'Anonymous',
                  totalScore: (e['totalScore'] as num?)?.toInt() ?? 0,
                  totalCorrect: (e['totalCorrect'] as num?)?.toInt() ?? 0,
                ))
            .toList();
        _loading = false;
      });
    } catch (_) {
      setState(() {
        _loading = false;
        _error = 'Could not load the leaderboard right now.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      appBar: AppBar(title: const Text('Puzzle Leaderboard')),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(child: Text(_error!))
                : _entries.isEmpty
                    ? const Center(child: Text('No scores yet — be the first to answer today\'s puzzle!'))
                    : RefreshIndicator(
                        onRefresh: _load,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: _entries.length,
                          itemBuilder: (context, index) {
                            final entry = _entries[index];
                            final rank = index + 1;
                            return _LeaderboardRow(rank: rank, entry: entry);
                          },
                        ),
                      ),
      ),
    );
  }
}

class _LeaderboardEntry {
  final String displayName;
  final int totalScore;
  final int totalCorrect;
  _LeaderboardEntry({required this.displayName, required this.totalScore, required this.totalCorrect});
}

class _LeaderboardRow extends StatelessWidget {
  final int rank;
  final _LeaderboardEntry entry;
  const _LeaderboardRow({required this.rank, required this.entry});

  Color? get _medalColor => switch (rank) {
        1 => const Color(0xFFFFD700),
        2 => const Color(0xFFC0C0C0),
        3 => const Color(0xFFCD7F32),
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final medalColor = _medalColor;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: medalColor != null ? medalColor.withValues(alpha: 0.5) : Colors.grey.shade200),
      ),
      child: ListTile(
        leading: medalColor != null
            ? Icon(Icons.emoji_events, color: medalColor, size: 28)
            : CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Text('$rank', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
              ),
        title: Text(entry.displayName, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${entry.totalCorrect} correct answer${entry.totalCorrect == 1 ? '' : 's'}'),
        trailing: Text(
          '${entry.totalScore} pts',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
        ),
      ),
    );
  }
}
