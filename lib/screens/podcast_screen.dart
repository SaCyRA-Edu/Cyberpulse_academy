import 'package:flutter/material.dart';
import '../data/levels_data.dart';
import '../services/progress_service.dart';
import 'podcast_data.dart';
import 'podcast_player_screen.dart';
import 'paywall_screen.dart';

/// Entry point for the Podcast learning mode — lists all 13 Core
/// Curriculum chapters (podcast episodes cover the core curriculum
/// only, not Bonus Chapters). Chapter 1 is a free 3-minute preview
/// for everyone (matching the same "Chapter 1 is free" pattern used
/// throughout Read Through); Chapters 2-13 require Full Access, same
/// as the rest of the course.
class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  bool _hasFullAccess = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final hasAccess = await ProgressService.hasFullAccess();
    if (mounted) {
      setState(() {
        _hasFullAccess = hasAccess;
        _loading = false;
      });
    }
  }

  PodcastChapter? _episodesFor(String moduleTitle) {
    for (final chapter in podcastChapters) {
      if (chapter.moduleTitle == moduleTitle) return chapter;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final coreChapters = allTopics.where((e) => e.levelIndex == 0).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Podcast', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.podcasts, color: Colors.deepPurple.shade400, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _hasFullAccess
                              ? 'All 13 core chapters, told as a conversation between two hosts — '
                                  'good for listening on the go, or when reading feels like a lot.'
                              : 'All 13 core chapters, told as a conversation between two hosts. '
                                  'Try Chapter 1 free — unlock the rest with Full Access.',
                          style: const TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                for (final entry in coreChapters)
                  _ChapterPodcastCard(
                    entry: entry,
                    chapter: _episodesFor(entry.module.title),
                    hasFullAccess: _hasFullAccess,
                    isFreeChapter: entry.module.title == 'Chapter 1: Cybersecurity Fundamentals',
                    onReturnFromPaywall: _refresh,
                  ),
              ],
            ),
    );
  }
}

class _ChapterPodcastCard extends StatelessWidget {
  final TopicEntry entry;
  final PodcastChapter? chapter;
  final bool hasFullAccess;
  final bool isFreeChapter;
  final VoidCallback onReturnFromPaywall;

  const _ChapterPodcastCard({
    required this.entry,
    required this.chapter,
    required this.hasFullAccess,
    required this.isFreeChapter,
    required this.onReturnFromPaywall,
  });

  @override
  Widget build(BuildContext context) {
    final hasEpisodes = chapter != null && chapter!.episodes.isNotEmpty;
    final canPlayFreely = hasFullAccess || isFreeChapter;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    entry.module.title,
                    style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold),
                  ),
                ),
                if (!hasEpisodes)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Coming Soon',
                      style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                    ),
                  )
                else if (isFreeChapter && !hasFullAccess)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '3-Min Free Preview',
                      style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                    ),
                  ),
              ],
            ),
            if (hasEpisodes) ...[
              const SizedBox(height: 10),
              for (final episode in chapter!.episodes)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: episode.audioStoragePath == null
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.schedule, color: Colors.grey.shade400, size: 24),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  episode.title,
                                  style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: Colors.grey.shade500),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Coming Soon',
                                  style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                                ),
                              ),
                            ],
                          ),
                        )
                      : InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () async {
                            if (canPlayFreely) {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => PodcastPlayerScreen(episode: episode, moduleTitle: chapter!.moduleTitle)),
                              );
                              onReturnFromPaywall();
                              return;
                            }
                            final unlocked = await Navigator.push<bool>(
                              context,
                              MaterialPageRoute(builder: (_) => PaywallScreen(lockedItemTitle: episode.title)),
                            );
                            if (unlocked == true) onReturnFromPaywall();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: canPlayFreely
                                  ? Colors.deepPurple.withValues(alpha: 0.06)
                                  : Colors.grey.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  canPlayFreely ? Icons.play_circle_fill : Icons.lock,
                                  color: canPlayFreely ? Colors.deepPurple.shade300 : Colors.grey.shade500,
                                  size: 26,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    episode.title,
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: canPlayFreely ? Colors.black87 : Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right, size: 18, color: Colors.grey.shade400),
                              ],
                            ),
                          ),
                        ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
