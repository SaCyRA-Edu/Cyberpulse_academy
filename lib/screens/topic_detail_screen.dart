import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../data/domains_data.dart';
import '../widgets/watermark.dart';
import 'lesson_screen.dart';
import 'level_exam_screen.dart';

const List<String> _tabs = ['Beginner', 'Intermediate', 'Advanced', 'Expert'];

class TopicDetailScreen extends StatefulWidget {
  final TopicEntry entry;

  const TopicDetailScreen({super.key, required this.entry});

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry.module.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((t) => Tab(text: t)).toList(),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
        ),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: CyberPulseWatermark()),
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildBeginnerTab(),
              _buildUpgradeTab('Intermediate'),
              _buildUpgradeTab('Advanced'),
              _buildUpgradeTab('Expert'),
            ],
          ),
        ],
      ),
    );
  }

  // -- Beginner Tab (free content) -----------------------------------------

  Widget _buildBeginnerTab() {
    final module = widget.entry.module;
    final lessons = module.lessons;
    final totalMinutes = lessons.fold<int>(0, (sum, l) => sum + l.estimatedMinutes);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: _DomainRatioCard(primaryDomainIndex: module.primaryDomainIndex),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: Colors.blue.withValues(alpha: 0.06),
            child: ListTile(
              leading: const Icon(Icons.quiz, color: Colors.blue),
              title: Text('${widget.entry.level.title} Level Exam'),
              subtitle: const Text('Adaptive · Test what you\'ve learned'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LevelExamScreen(
                      level: widget.entry.level,
                      levelIndex: widget.entry.levelIndex,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Lessons',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('~$totalMinutes min total',
                  style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
        ),
        for (final lesson in lessons)
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonScreen(
                    lesson: lesson,
                    moduleTitle: module.title,
                  ),
                ),
              );
            },
            leading: Icon(
              lesson.isAudio
                  ? Icons.headphones
                  : lesson.isQuiz
                      ? Icons.quiz_outlined
                      : Icons.menu_book,
              color: lesson.isAudio ? Colors.blue : null,
            ),
            title: Text(lesson.title),
            subtitle: Row(
              children: [
                if (lesson.isAudio) ...[
                  const Text('Audio Course',
                      style: TextStyle(fontSize: 12, color: Colors.blue)),
                  const Text(' · ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
                Text('~${lesson.estimatedMinutes} min',
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  // -- Upgrade Tab (paid levels) -------------------------------------------

  Widget _buildUpgradeTab(String levelName) {
    final features = {
      'Intermediate': [
        'In-depth technical lessons',
        'Hands-on practice scenarios',
        'Intermediate-level adaptive exam',
        'Certificate of completion',
      ],
      'Advanced': [
        'Advanced attack & defense techniques',
        'Real-world case studies',
        'Advanced adaptive exam',
        'Certificate of completion',
      ],
      'Expert': [
        'Expert-level capstone content',
        'Threat modeling & ethical hacking',
        'Expert adaptive exam',
        'Professional certificate',
      ],
    };

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.workspace_premium, size: 56, color: Colors.white),
                  const SizedBox(height: 12),
                  Text(
                    'Unlock $levelName',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.entry.module.title} — $levelName Level',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("What you'll get:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            for (final feature in features[levelName]!)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 20),
                    const SizedBox(width: 12),
                    Text(feature, style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Unlock $levelName'),
                      content: const Text(
                        'Payment processing is coming soon. '
                        'We\'ll notify you as soon as this level '
                        'is available for purchase.',
                      ),
                      actions: [
                        FilledButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Got it'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Get $levelName Access',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Payment integration coming soon',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ── CompTIA Security+ domain ratio card ────────────────────────────────────

class _DomainRatioCard extends StatelessWidget {
  final int primaryDomainIndex;

  const _DomainRatioCard({required this.primaryDomainIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.pie_chart, size: 18, color: Colors.blueGrey),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Aligned with CompTIA Security+ (SY0-701)',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < securityPlusDomains.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: _DomainBar(
                domain: securityPlusDomains[i],
                highlighted: i == primaryDomainIndex,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            'This topic primarily builds your knowledge in '
            '"${securityPlusDomains[primaryDomainIndex].name}."',
            style: const TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class _DomainBar extends StatelessWidget {
  final SecurityDomain domain;
  final bool highlighted;

  const _DomainBar({required this.domain, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(domain.icon, size: 14, color: highlighted ? domain.color : Colors.grey.shade400),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Text(
            domain.name,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: highlighted ? FontWeight.bold : FontWeight.normal,
              color: highlighted ? Colors.black87 : Colors.grey.shade600,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: domain.examWeightPercent / 30,
              minHeight: 8,
              backgroundColor: Colors.grey.shade100,
              color: highlighted ? domain.color : Colors.grey.shade300,
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 32,
          child: Text(
            '${domain.examWeightPercent}%',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: highlighted ? FontWeight.bold : FontWeight.normal,
              color: highlighted ? domain.color : Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}
