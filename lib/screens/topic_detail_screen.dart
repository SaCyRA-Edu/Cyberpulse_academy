import 'package:flutter/material.dart';
import '../data/levels_data.dart';
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
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildBeginnerTab(),
          _buildUpgradeTab('Intermediate'),
          _buildUpgradeTab('Advanced'),
          _buildUpgradeTab('Expert'),
        ],
      ),
    );
  }

  // -- Beginner Tab (free content) -----------------------------------------

  Widget _buildBeginnerTab() {
    final module = widget.entry.module;
    final lessons = module.lessons;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: Colors.blue.withValues(alpha: 0.06),
            child: ListTile(
              leading: const Icon(Icons.quiz, color: Colors.blue),
              title: Text('${widget.entry.level.title} Level Exam'),
              subtitle: const Text(
                'Adaptive · Test what you\'ve learned',
              ),
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
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lessons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LessonScreen(lesson: lesson),
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
                subtitle: lesson.isAudio
                    ? const Text(
                        'Audio Course',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      )
                    : null,
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              );
            },
          ),
        ),
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
                  const Icon(Icons.workspace_premium,
                      size: 56, color: Colors.white),
                  const SizedBox(height: 12),
                  Text(
                    'Unlock $levelName',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.entry.module.title} — $levelName Level',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What you'll get:",
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            for (final feature in features[levelName]!)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 20),
                    const SizedBox(width: 12),
                    Text(feature,
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                child: Text(
                  'Get $levelName Access',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Payment integration coming soon',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
