/// One line of dialogue in a podcast-style episode, spoken by one of
/// two hosts. Kept as a data structure for potential future use (e.g.
/// transcripts), though the current NotebookLM-generated episodes
/// don't populate this — see PodcastEpisode.lines below.
enum PodcastSpeaker { hostA, hostB }

class DialogueLine {
  final PodcastSpeaker speaker;
  final String text;
  const DialogueLine(this.speaker, this.text);
}

class PodcastEpisode {
  final String title;
  final List<DialogueLine> lines;

  /// Path in Firebase Storage to the actual recorded/generated audio
  /// for this episode (from NotebookLM's Audio Overview) — when
  /// present, the player streams this real audio instead of using
  /// on-device TTS.
  final String? audioStoragePath;

  const PodcastEpisode({required this.title, required this.lines, this.audioStoragePath});
}

/// Chapters with no episodes yet show as "Coming Soon" in the UI —
/// this is deliberately how new chapters get added over time, rather
/// than needing every chapter converted before shipping any of them.
class PodcastChapter {
  final String moduleTitle; // matches levels_data.dart module.title exactly
  final List<PodcastEpisode> episodes;
  const PodcastChapter({required this.moduleTitle, required this.episodes});
}

// One episode per chapter — the whole chapter's content generated as a
// single NotebookLM Audio Overview, rather than one per individual
// lesson (see the earlier per-lesson approach this replaced).
const _chapter1 = PodcastEpisode(
  title: 'Chapter 1: Cybersecurity Fundamentals',
  audioStoragePath: 'PodcastAudio/Chapter1.m4a',
  lines: [],
);

const _chapter2 = PodcastEpisode(
  title: 'Chapter 2: Threats, Attacks & Vulnerabilities',
  audioStoragePath: 'PodcastAudio/Chapter2.m4a',
  lines: [],
);

const _chapter3 = PodcastEpisode(
  title: 'Chapter 3: Network Security',
  audioStoragePath: 'PodcastAudio/Chapter3.m4a',
  lines: [],
);

const _chapter4 = PodcastEpisode(
  title: 'Chapter 4: Identity Access Management',
  audioStoragePath: 'PodcastAudio/Chapter4.m4a',
  lines: [],
);

const _chapter5 = PodcastEpisode(
  title: 'Chapter 5: Cryptography',
  audioStoragePath: 'PodcastAudio/Chapter5.m4a',
  lines: [],
);

const _chapter6 = PodcastEpisode(
  title: 'Chapter 6: Secure Protocols',
  audioStoragePath: 'PodcastAudio/Chapter6.m4a',
  lines: [],
);

const _chapter7 = PodcastEpisode(
  title: 'Chapter 7: Endpoint Security',
  audioStoragePath: 'PodcastAudio/Chapter7.m4a',
  lines: [],
);

const _chapter8 = PodcastEpisode(
  title: 'Chapter 8: Identity Federation & SSO',
  audioStoragePath: 'PodcastAudio/Chapter8.m4a',
  lines: [],
);

const _chapter9 = PodcastEpisode(
  title: 'Chapter 9: Application Security',
  audioStoragePath: 'PodcastAudio/Chapter9.m4a',
  lines: [],
);

const _chapter10 = PodcastEpisode(
  title: 'Chapter 10: Cloud Security',
  audioStoragePath: 'PodcastAudio/Chapter10.m4a',
  lines: [],
);

const _chapter11 = PodcastEpisode(
  title: 'Chapter 11: Security Operations',
  audioStoragePath: 'PodcastAudio/Chapter11.m4a',
  lines: [],
);

const _chapter12 = PodcastEpisode(
  title: 'Chapter 12: Incident Response',
  audioStoragePath: 'PodcastAudio/Chapter12.m4a',
  lines: [],
);

const _chapter13 = PodcastEpisode(
  title: 'Chapter 13: Governance, Risk & Compliance',
  audioStoragePath: 'PodcastAudio/Chapter13.m4a',
  lines: [],
);

/// All podcast content, keyed by chapter — one episode per chapter.
/// Chapters not listed here would show as "Coming Soon" in the UI;
/// with all 13 core chapters now covered, that only applies to Bonus
/// Chapters going forward, if podcast episodes are ever made for those.
const List<PodcastChapter> podcastChapters = [
  PodcastChapter(moduleTitle: 'Chapter 1: Cybersecurity Fundamentals', episodes: [_chapter1]),
  PodcastChapter(moduleTitle: 'Chapter 2: Threats, Attacks & Vulnerabilities', episodes: [_chapter2]),
  PodcastChapter(moduleTitle: 'Chapter 3: Network Security', episodes: [_chapter3]),
  PodcastChapter(moduleTitle: 'Chapter 4: Identity Access Management', episodes: [_chapter4]),
  PodcastChapter(moduleTitle: 'Chapter 5: Cryptography', episodes: [_chapter5]),
  PodcastChapter(moduleTitle: 'Chapter 6: Secure Protocols', episodes: [_chapter6]),
  PodcastChapter(moduleTitle: 'Chapter 7: Endpoint Security', episodes: [_chapter7]),
  PodcastChapter(moduleTitle: 'Chapter 8: Identity Federation & SSO', episodes: [_chapter8]),
  PodcastChapter(moduleTitle: 'Chapter 9: Application Security', episodes: [_chapter9]),
  PodcastChapter(moduleTitle: 'Chapter 10: Cloud Security', episodes: [_chapter10]),
  PodcastChapter(moduleTitle: 'Chapter 11: Security Operations', episodes: [_chapter11]),
  PodcastChapter(moduleTitle: 'Chapter 12: Incident Response', episodes: [_chapter12]),
  PodcastChapter(moduleTitle: 'Chapter 13: Governance, Risk & Compliance', episodes: [_chapter13]),
];
