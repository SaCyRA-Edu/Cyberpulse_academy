import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import '../data/levels_data.dart';

enum _DateRange { last7Days, last30Days, allTime }

class AdminReportScreen extends StatefulWidget {
  const AdminReportScreen({super.key});

  @override
  State<AdminReportScreen> createState() => _AdminReportScreenState();
}

class _AdminReportScreenState extends State<AdminReportScreen> {
  bool _loading = true;
  String? _error;
  int _totalUsers = 0;
  List<_UserReportEntry> _users = [];
  _DateRange _selectedRange = _DateRange.last7Days;

  // The single source of truth for "how many lessons are there" — the
  // Core Curriculum's real lesson count from levels_data.dart, so this
  // percentage math never needs a separate update when lessons change.
  late final int _totalCoreLessons = allLevels[0].totalLessonCount;

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
      setState(() {
        _totalUsers = data['totalUsers'] as int? ?? 0;
        _users = rawUsers.map((u) => _UserReportEntry.fromMap(Map<String, dynamic>.from(u))).toList();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = 'Could not load the report: $e';
      });
    }
  }

  int get _newRegistrationsInRange {
    if (_selectedRange == _DateRange.allTime) return _users.length;
    final cutoff = DateTime.now().subtract(
      Duration(days: _selectedRange == _DateRange.last7Days ? 7 : 30),
    );
    return _users.where((u) => u.createdAt != null && u.createdAt!.isAfter(cutoff)).length;
  }

  int get _certificationsCompleted => _users.where((u) => u.certificationCompleted).length;

  int get _fullAccessPurchases => _users.where((u) => u.fullAccessPurchased).length;

  /// Buckets every user's reading completion percentage into 5 ranges.
  /// Percentage is computed here, client-side, against the real
  /// current lesson count — not something the backend hardcodes.
  Map<String, int> get _readingDistribution {
    final buckets = {'0%': 0, '1-25%': 0, '26-50%': 0, '51-75%': 0, '76-99%': 0, '100%': 0};
    for (final u in _users) {
      if (_totalCoreLessons == 0) continue;
      final pct = (u.viewedLessonsCount / _totalCoreLessons * 100).clamp(0, 100);
      if (pct == 0) {
        buckets['0%'] = buckets['0%']! + 1;
      } else if (pct <= 25) {
        buckets['1-25%'] = buckets['1-25%']! + 1;
      } else if (pct <= 50) {
        buckets['26-50%'] = buckets['26-50%']! + 1;
      } else if (pct <= 75) {
        buckets['51-75%'] = buckets['51-75%']! + 1;
      } else if (pct < 100) {
        buckets['76-99%'] = buckets['76-99%']! + 1;
      } else {
        buckets['100%'] = buckets['100%']! + 1;
      }
    }
    return buckets;
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
                        Row(
                          children: [
                            Expanded(child: _buildStatCard('Total Registered Users', '$_totalUsers', Icons.people, Colors.blue)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildNewRegistrationsCard(),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildStatCard(
                                'Certifications Completed',
                                '$_certificationsCompleted',
                                Icons.workspace_premium,
                                Colors.amber.shade800,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildStatCard(
                                'Full Access Purchased',
                                '$_fullAccessPurchases',
                                Icons.lock_open,
                                Colors.green.shade700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildReadingDistributionCard(),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildNewRegistrationsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person_add, color: Colors.deepPurple, size: 22),
              const SizedBox(width: 10),
              const Text('New Registrations', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          SegmentedButton<_DateRange>(
            segments: const [
              ButtonSegment(value: _DateRange.last7Days, label: Text('7 days')),
              ButtonSegment(value: _DateRange.last30Days, label: Text('30 days')),
              ButtonSegment(value: _DateRange.allTime, label: Text('All time')),
            ],
            selected: {_selectedRange},
            onSelectionChanged: (selection) => setState(() => _selectedRange = selection.first),
          ),
          const SizedBox(height: 12),
          Text('$_newRegistrationsInRange', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildReadingDistributionCard() {
    final distribution = _readingDistribution;
    final maxCount = distribution.values.fold(0, (a, b) => a > b ? a : b);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.menu_book, color: Colors.teal, size: 22),
              SizedBox(width: 10),
              Text('Reading Progress Distribution', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          Text(
            '% of Core Curriculum lessons viewed, out of $_totalCoreLessons total',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          for (final entry in distribution.entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  SizedBox(width: 56, child: Text(entry.key, style: const TextStyle(fontSize: 12))),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: maxCount == 0 ? 0 : entry.value / maxCount,
                        minHeight: 14,
                        backgroundColor: Colors.grey.shade100,
                        valueColor: const AlwaysStoppedAnimation(Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(width: 28, child: Text('${entry.value}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _UserReportEntry {
  final DateTime? createdAt;
  final int viewedLessonsCount;
  final bool certificationCompleted;
  final bool fullAccessPurchased;

  _UserReportEntry({
    required this.createdAt,
    required this.viewedLessonsCount,
    required this.certificationCompleted,
    required this.fullAccessPurchased,
  });

  factory _UserReportEntry.fromMap(Map<String, dynamic> map) {
    DateTime? created;
    final rawCreatedAt = map['createdAt'];
    if (rawCreatedAt is String) {
      created = DateTime.tryParse(rawCreatedAt);
    }
    return _UserReportEntry(
      createdAt: created,
      viewedLessonsCount: map['viewedLessonsCount'] as int? ?? 0,
      certificationCompleted: map['certificationCompleted'] == true,
      fullAccessPurchased: map['fullAccessPurchased'] == true,
    );
  }
}
