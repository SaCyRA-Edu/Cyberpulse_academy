import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import '../data/levels_data.dart';

enum _Range { days14, days30 }

/// Admin-only report: registrations and activity per DAY, learner
/// funnel, age groups, locations, and per-user progress.
///
/// All "day" maths uses India time (UTC+5:30) to match the server's
/// day keys, regardless of the admin's phone time zone.
class AdminReportScreen extends StatefulWidget {
  const AdminReportScreen({super.key});

  @override
  State<AdminReportScreen> createState() => _AdminReportScreenState();
}

class _AdminReportScreenState extends State<AdminReportScreen> {
  bool _loading = true;
  String? _error;
  int _totalUsers = 0;
  List<_UserEntry> _users = [];
  Map<String, _DayStats> _daily = {};
  DateTime _today = _istNow();
  _Range _range = _Range.days14;

  // Core Curriculum's real lesson count, so reading % never needs a
  // separate update when lessons change.
  late final int _totalCoreLessons = allLevels[0].totalLessonCount;

  static const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  static DateTime _istNow() => DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
  static DateTime _toIst(DateTime d) => d.toUtc().add(const Duration(hours: 5, minutes: 30));
  static String _two(int n) => n.toString().padLeft(2, '0');
  static String _key(DateTime d) => '${d.year}-${_two(d.month)}-${_two(d.day)}';
  static String _label(DateTime d) => '${d.day} ${_months[d.month - 1]}';

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
      final result = await FirebaseFunctions.instance.httpsCallable('getAdminReport').call();
      final data = Map<String, dynamic>.from(result.data as Map);
      final rawUsers = List<dynamic>.from(data['users'] ?? []);
      final rawDaily = List<dynamic>.from(data['daily'] ?? []);
      final daily = <String, _DayStats>{};
      for (final d in rawDaily) {
        final m = Map<String, dynamic>.from(d as Map);
        daily[m['day'] as String] = _DayStats.fromMap(m);
      }
      final todayStr = data['today'] as String?;
      setState(() {
        _totalUsers = data['totalUsers'] as int? ?? 0;
        _users = rawUsers.map((u) => _UserEntry.fromMap(Map<String, dynamic>.from(u as Map))).toList();
        _users.sort((a, b) => b.lastSeen.compareTo(a.lastSeen));
        _daily = daily;
        _today = todayStr != null ? (DateTime.tryParse(todayStr) ?? _istNow()) : _istNow();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = 'Could not load the report: $e';
      });
    }
  }

  int get _rangeDays => _range == _Range.days14 ? 14 : 30;

  /// Oldest-first list of the last N days, ending today.
  List<DateTime> get _days {
    final base = DateTime(_today.year, _today.month, _today.day);
    return [for (var i = _rangeDays - 1; i >= 0; i--) base.subtract(Duration(days: i))];
  }

  Map<String, int> get _registrationsByDay {
    final map = <String, int>{};
    for (final u in _users) {
      final c = u.createdAt;
      if (c == null) continue;
      final k = _key(_toIst(c));
      map[k] = (map[k] ?? 0) + 1;
    }
    return map;
  }

  int _pct(_UserEntry u) {
    if (_totalCoreLessons == 0) return 0;
    return (u.viewedLessonsCount / _totalCoreLessons * 100).clamp(0, 100).round();
  }

  Map<String, int> _countBy(String? Function(_UserEntry) pick) {
    final map = <String, int>{};
    for (final u in _users) {
      final v = pick(u) ?? 'Not provided';
      map[v] = (map[v] ?? 0) + 1;
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      appBar: AppBar(title: const Text('Admin Report')),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(child: Padding(padding: const EdgeInsets.all(24), child: Text(_error!, textAlign: TextAlign.center)))
                : RefreshIndicator(
                    onRefresh: _load,
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _buildSummary(),
                        const SizedBox(height: 12),
                        _buildRangeToggle(),
                        const SizedBox(height: 12),
                        _buildRegistrationsPerDay(),
                        const SizedBox(height: 12),
                        _buildActivePerDay(),
                        const SizedBox(height: 12),
                        _buildFunnel(),
                        const SizedBox(height: 12),
                        _buildDistribution(
                          title: 'Location (state / country)',
                          icon: Icons.place,
                          color: Colors.indigo,
                          counts: _countBy((u) => u.country == 'IN' || u.country == null ? (u.state ?? u.country) : u.country),
                        ),
                        const SizedBox(height: 12),
                        _buildReadingDistribution(),
                        const SizedBox(height: 12),
                        _buildUserList(),
                      ],
                    ),
                  ),
      ),
    );
  }

  // ── Building blocks ────────────────────────────────────────────────────
  BoxDecoration get _cardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))],
      );

  Widget _card({required String title, required IconData icon, required Color color, String? subtitle, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
          ],
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _statTile(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _barRow(String label, int value, int maxValue, Color color, {double labelWidth = 70}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(width: labelWidth, child: Text(label, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: maxValue == 0 ? 0 : value / maxValue,
                minHeight: 14,
                backgroundColor: Colors.grey.shade100,
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(width: 30, child: Text('$value', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  // ── Sections ───────────────────────────────────────────────────────────
  Widget _buildSummary() {
    final todayKey = _key(_today);
    final newToday = _registrationsByDay[todayKey] ?? 0;
    final activeToday = _daily[todayKey]?.activeUsers ?? 0;
    final certified = _users.where((u) => u.certificationCompleted).length;
    final purchased = _users.where((u) => u.fullAccessPurchased).length;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _statTile('Total registered', '$_totalUsers', Icons.people, Colors.blue),
        _statTile('New today', '$newToday', Icons.person_add, Colors.deepPurple),
        _statTile('Active today', '$activeToday', Icons.bolt, Colors.orange.shade800),
        _statTile('Certified', '$certified', Icons.workspace_premium, Colors.amber.shade800),
        _statTile('Full access purchased', '$purchased', Icons.lock_open, Colors.green.shade700),
        _statTile('Puzzle players', '${_users.where((u) => u.puzzleSubscribed).length}', Icons.extension, Colors.teal),
      ],
    );
  }

  Widget _buildRangeToggle() {
    return SegmentedButton<_Range>(
      segments: const [
        ButtonSegment(value: _Range.days14, label: Text('Last 14 days')),
        ButtonSegment(value: _Range.days30, label: Text('Last 30 days')),
      ],
      selected: {_range},
      onSelectionChanged: (s) => setState(() => _range = s.first),
    );
  }

  Widget _buildRegistrationsPerDay() {
    final regs = _registrationsByDay;
    final days = _days;
    final counts = [for (final d in days) regs[_key(d)] ?? 0];
    final maxValue = counts.fold(0, (a, b) => a > b ? a : b);
    final total = counts.fold(0, (a, b) => a + b);
    return _card(
      title: 'New registrations per day',
      icon: Icons.person_add,
      color: Colors.deepPurple,
      subtitle: '$total in the last $_rangeDays days (India time)',
      child: Column(
        children: [
          for (var i = days.length - 1; i >= 0; i--)
            _barRow(_label(days[i]), counts[i], maxValue, Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildActivePerDay() {
    final days = _days;
    final active = [for (final d in days) _daily[_key(d)]?.activeUsers ?? 0];
    final maxValue = active.fold(0, (a, b) => a > b ? a : b);
    final today = _daily[_key(_today)];
    return _card(
      title: 'Active users per day',
      icon: Icons.bolt,
      color: Colors.orange.shade800,
      subtitle: 'Unique people who opened the app. Counting starts from the day this update was released.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _chip('Puzzle opened today', today?.events['puzzle_opened'] ?? 0),
              _chip('Puzzle answered today', today?.events['puzzle_answered'] ?? 0),
              _chip('Opened from notification today', today?.events['notification_opened'] ?? 0),
            ],
          ),
          const SizedBox(height: 14),
          for (var i = days.length - 1; i >= 0; i--)
            _barRow(_label(days[i]), active[i], maxValue, Colors.orange.shade700),
        ],
      ),
    );
  }

  Widget _chip(String text, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
      child: Text('$text: $value', style: const TextStyle(fontSize: 11.5)),
    );
  }

  /// Where learners drop off, step by step.
  Widget _buildFunnel() {
    final started = _users.where((u) => u.viewedLessonsCount > 0).length;
    final half = _users.where((u) => _pct(u) >= 50).length;
    final examTaken = _users.where((u) => u.finalExamAttempts > 0).length;
    final certified = _users.where((u) => u.certificationCompleted).length;
    final purchased = _users.where((u) => u.fullAccessPurchased).length;
    final steps = <MapEntry<String, int>>[
      MapEntry('Registered', _users.length),
      MapEntry('Started reading', started),
      MapEntry('Read 50%+', half),
      MapEntry('Took the exam', examTaken),
      MapEntry('Passed (certified)', certified),
      MapEntry('Bought full access', purchased),
    ];
    final maxValue = _users.length;
    return _card(
      title: 'Learner funnel',
      icon: Icons.filter_alt,
      color: Colors.blue,
      subtitle: 'How far each registered user got',
      child: Column(
        children: [
          for (final s in steps) _barRow(s.key, s.value, maxValue, Colors.blue, labelWidth: 110),
        ],
      ),
    );
  }

  Widget _buildDistribution({
    required String title,
    required IconData icon,
    required Color color,
    required Map<String, int> counts,
    List<String>? order,
  }) {
    final keys = counts.keys.toList();
    if (order != null) {
      keys.sort((a, b) {
        final ia = order.indexOf(a);
        final ib = order.indexOf(b);
        return (ia == -1 ? 999 : ia).compareTo(ib == -1 ? 999 : ib);
      });
    } else {
      keys.sort((a, b) => counts[b]!.compareTo(counts[a]!));
    }
    final maxValue = counts.values.fold(0, (a, b) => a > b ? a : b);
    return _card(
      title: title,
      icon: icon,
      color: color,
      subtitle: 'Approximate, from network address. Fills in as people open the updated app.',
      child: Column(
        children: [
          for (final k in keys) _barRow(k, counts[k]!, maxValue, color, labelWidth: 120),
        ],
      ),
    );
  }

  Widget _buildReadingDistribution() {
    final buckets = {'0%': 0, '1-25%': 0, '26-50%': 0, '51-75%': 0, '76-99%': 0, '100%': 0};
    for (final u in _users) {
      if (_totalCoreLessons == 0) continue;
      final pct = u.viewedLessonsCount / _totalCoreLessons * 100;
      final key = pct <= 0
          ? '0%'
          : pct <= 25
              ? '1-25%'
              : pct <= 50
                  ? '26-50%'
                  : pct <= 75
                      ? '51-75%'
                      : pct < 100
                          ? '76-99%'
                          : '100%';
      buckets[key] = buckets[key]! + 1;
    }
    final maxValue = buckets.values.fold(0, (a, b) => a > b ? a : b);
    return _card(
      title: 'Reading progress distribution',
      icon: Icons.menu_book,
      color: Colors.teal,
      subtitle: '% of Core Curriculum lessons viewed, out of $_totalCoreLessons total',
      child: Column(
        children: [
          for (final e in buckets.entries) _barRow(e.key, e.value, maxValue, Colors.teal, labelWidth: 56),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return _card(
      title: 'Users and their progress',
      icon: Icons.groups,
      color: Colors.blueGrey,
      subtitle: 'Most recently active first. Tap a user for details.',
      child: Column(
        children: [
          for (final u in _users) _buildUserTile(u),
        ],
      ),
    );
  }

  String _ago(DateTime? d) {
    if (d == null) return 'never';
    final diff = DateTime.now().toUtc().difference(d.toUtc());
    if (diff.inMinutes < 60) return '${diff.inMinutes.clamp(0, 59)}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  String _stage(_UserEntry u) {
    if (u.fullAccessPurchased) return 'Purchased';
    if (u.certificationCompleted) return 'Certified';
    if (u.finalExamAttempts > 0) return 'Took exam';
    if (u.viewedLessonsCount > 0) return 'Reading';
    return 'Just registered';
  }

  Widget _buildUserTile(_UserEntry u) {
    final place = [u.city, u.state, u.country].whereType<String>().where((e) => e.isNotEmpty).join(', ');
    final exam = u.finalExamBest == null ? 'no attempts' : 'best ${u.finalExamBest!.round()}% in ${u.finalExamAttempts} attempt(s)';
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(left: 4, bottom: 10),
        title: Text(u.name, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
        subtitle: Text(
          '${_stage(u)}  |  reading ${_pct(u)}%  |  active ${_ago(u.lastSeen)}',
          style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: [
          _detail('Email', u.email ?? '-'),
          _detail('Joined', u.createdAt == null ? '-' : _label(_toIst(u.createdAt!))),
          _detail('Reading', '${u.viewedLessonsCount} of $_totalCoreLessons lessons (${_pct(u)}%)'),
          _detail('Final exam', exam),
          _detail('Puzzles', '${u.puzzleTotalCorrect} correct, ${u.puzzleTotalScore} points${u.puzzleSubscribed ? '' : ' (not opted in)'}'),
          _detail('Location', place.isEmpty ? 'Not known yet' : place),
        ],
      ),
    );
  }

  Widget _detail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 78, child: Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600))),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}

class _DayStats {
  final int activeUsers;
  final Map<String, int> events;
  _DayStats({required this.activeUsers, required this.events});

  factory _DayStats.fromMap(Map<String, dynamic> map) {
    final rawEvents = map['events'] is Map ? Map<String, dynamic>.from(map['events'] as Map) : <String, dynamic>{};
    return _DayStats(
      activeUsers: (map['activeUsers'] as num?)?.toInt() ?? 0,
      events: rawEvents.map((k, v) => MapEntry(k, (v as num).toInt())),
    );
  }
}

class _UserEntry {
  final String name;
  final String? email;
  final DateTime? createdAt;
  final DateTime? lastActiveAt;
  final DateTime? lastSignIn;
  final int viewedLessonsCount;
  final bool certificationCompleted;
  final bool fullAccessPurchased;
  final double? finalExamBest;
  final int finalExamAttempts;
  final int puzzleTotalScore;
  final int puzzleTotalCorrect;
  final bool puzzleSubscribed;
  final String? country;
  final String? state;
  final String? city;

  _UserEntry({
    required this.name,
    required this.email,
    required this.createdAt,
    required this.lastActiveAt,
    required this.lastSignIn,
    required this.viewedLessonsCount,
    required this.certificationCompleted,
    required this.fullAccessPurchased,
    required this.finalExamBest,
    required this.finalExamAttempts,
    required this.puzzleTotalScore,
    required this.puzzleTotalCorrect,
    required this.puzzleSubscribed,
    required this.country,
    required this.state,
    required this.city,
  });

  /// Best available "last seen": app activity first, then last sign-in,
  /// then the registration time.
  DateTime get lastSeen =>
      lastActiveAt ?? lastSignIn ?? createdAt ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  static DateTime? _date(dynamic raw) => raw is String ? DateTime.tryParse(raw) : null;
  static String? _text(dynamic raw) => raw is String && raw.trim().isNotEmpty ? raw : null;

  factory _UserEntry.fromMap(Map<String, dynamic> m) {
    return _UserEntry(
      name: _text(m['name']) ?? 'User',
      email: _text(m['email']),
      createdAt: _date(m['createdAt']),
      lastActiveAt: _date(m['lastActiveAt']),
      lastSignIn: _date(m['lastSignIn']),
      viewedLessonsCount: (m['viewedLessonsCount'] as num?)?.toInt() ?? 0,
      certificationCompleted: m['certificationCompleted'] == true,
      fullAccessPurchased: m['fullAccessPurchased'] == true,
      finalExamBest: (m['finalExamBest'] as num?)?.toDouble(),
      finalExamAttempts: (m['finalExamAttempts'] as num?)?.toInt() ?? 0,
      puzzleTotalScore: (m['puzzleTotalScore'] as num?)?.toInt() ?? 0,
      puzzleTotalCorrect: (m['puzzleTotalCorrect'] as num?)?.toInt() ?? 0,
      puzzleSubscribed: m['puzzleSubscribed'] == true,
      country: _text(m['country']),
      state: _text(m['state']),
      city: _text(m['city']),
    );
  }
}
