import 'package:flutter/material.dart';
import 'lesson_model.dart';
import 'exam_model.dart';
import 'domains_data.dart';
import 'lessons/fundamentals_lessons.dart';
import 'lessons/threats_attacks_lessons.dart';
import 'lessons/social_engineering_lessons.dart';
import 'lessons/malware_lessons.dart';
import 'lessons/cryptography_lessons.dart';
import 'lessons/iam_lessons.dart';
import 'lessons/vulnerabilities_threats_lessons.dart';
import 'lessons/alerts_monitoring_lessons.dart';
import 'lessons/incident_response_lessons.dart';
import 'lessons/email_security_lessons.dart';
import 'lessons/networking_lessons.dart';
import 'lessons/endpoint_security_lessons.dart';
import 'lessons/secure_protocols_lessons.dart';
import 'lessons/windows_security_lessons.dart';
import 'lessons/linux_security_lessons.dart';
import 'lessons/soc_operations_lessons.dart';
import 'lessons/cloud_security_lessons.dart';
import 'lessons/application_security_lessons.dart';
import 'lessons/identity_federation_sso_lessons.dart';
import 'lessons/grc_lessons.dart';
import 'lessons/capstone_lessons.dart';
import 'exams/beginner_exam.dart';
import 'exams/intermediate_exam.dart';
import 'exams/advanced_exam.dart';
import 'exams/expert_exam.dart';

class Module {
  final String title;
  final IconData icon;
  final int xpReward;
  final List<Lesson> lessons;

  /// Index into [securityPlusDomains] — the CompTIA Security+ domain this
  /// module primarily reinforces.
  final int primaryDomainIndex;

  const Module({
    required this.title,
    required this.icon,
    required this.xpReward,
    required this.lessons,
    required this.primaryDomainIndex,
  });

  SecurityDomain get primaryDomain => securityPlusDomains[primaryDomainIndex];

  int get lessonCount => lessons.length;
}

/// A Level is the top-level unit of the course. The course is organized as
/// a single numbered Core Curriculum (Chapters 1-13) followed by a Bonus
/// Chapters section containing supplementary modules outside the core
/// numbered sequence.
///
/// [isFree] marks a level as freely accessible without purchase.
class Level {
  final String title;
  final String description;
  final bool isFree;
  final List<Module> modules;
  final List<ExamQuestion> examBank;

  const Level({
    required this.title,
    required this.description,
    required this.isFree,
    required this.modules,
    required this.examBank,
  });

  int get totalLessonCount =>
      modules.fold(0, (sum, m) => sum + m.lessonCount);
}

final List<Level> allLevels = [
  Level(
    title: 'Core Curriculum',
    description:
        'The main 13-chapter course, in order — from cybersecurity '
        'fundamentals through governance, risk, and compliance.',
    isFree: true,
    modules: [
      Module(
        title: 'Chapter 1: Cybersecurity Fundamentals',
        icon: Icons.security,
        xpReward: 100,
        lessons: fundamentalsLessons,
        primaryDomainIndex: 0, // General Security Concepts
      ),
      Module(
        title: 'Chapter 2: Threats, Attacks & Vulnerabilities',
        icon: Icons.gpp_maybe,
        xpReward: 130,
        lessons: threatsAttacksLessons,
        primaryDomainIndex: 1, // Threats, Vulnerabilities & Mitigations
      ),
      Module(
        title: 'Chapter 3: Network Security',
        icon: Icons.router,
        xpReward: 130,
        lessons: networkingLessons,
        primaryDomainIndex: 2, // Security Architecture
      ),
      Module(
        title: 'Chapter 4: Identity Access Management',
        icon: Icons.badge,
        xpReward: 130,
        lessons: iamLessons,
        primaryDomainIndex: 0, // General Security Concepts
      ),
      Module(
        title: 'Chapter 5: Cryptography',
        icon: Icons.enhanced_encryption,
        xpReward: 150,
        lessons: cryptographyLessons,
        primaryDomainIndex: 0, // General Security Concepts
      ),
      Module(
        title: 'Chapter 6: Secure Protocols',
        icon: Icons.lock,
        xpReward: 160,
        lessons: secureProtocolsLessons,
        primaryDomainIndex: 2, // Security Architecture
      ),
      Module(
        title: 'Chapter 7: Endpoint Security',
        icon: Icons.laptop_chromebook,
        xpReward: 160,
        lessons: endpointSecurityLessons,
        primaryDomainIndex: 2, // Security Architecture
      ),
      Module(
        title: 'Chapter 8: Identity Federation & SSO',
        icon: Icons.hub,
        xpReward: 190,
        lessons: identityFederationSsoLessons,
        primaryDomainIndex: 0, // General Security Concepts
      ),
      Module(
        title: 'Chapter 9: Application Security',
        icon: Icons.web,
        xpReward: 200,
        lessons: applicationSecurityLessons,
        primaryDomainIndex: 2, // Security Architecture
      ),
      Module(
        title: 'Chapter 10: Cloud Security',
        icon: Icons.cloud,
        xpReward: 200,
        lessons: cloudSecurityLessons,
        primaryDomainIndex: 2, // Security Architecture
      ),
      Module(
        title: 'Chapter 11: Security Operations',
        icon: Icons.visibility,
        xpReward: 160,
        lessons: socOperationsLessons,
        primaryDomainIndex: 3, // Security Operations
      ),
      Module(
        title: 'Chapter 12: Incident Response',
        icon: Icons.emergency,
        xpReward: 130,
        lessons: incidentResponseLessons,
        primaryDomainIndex: 3, // Security Operations
      ),
      Module(
        title: 'Chapter 13: Governance, Risk & Compliance',
        icon: Icons.gavel,
        xpReward: 180,
        lessons: grcLessons,
        primaryDomainIndex: 4, // Security Program Management & Oversight
      ),
    ],
    examBank: [
      ...beginnerExamBank,
      ...intermediateExamBank,
      ...advancedExamBank,
    ],
  ),
  Level(
    title: 'Bonus Chapters',
    description:
        'Supplementary chapters outside the core 13-chapter sequence — '
        'dig deeper into specific threats, platforms, and the capstone.',
    isFree: true,
    modules: [
      Module(
        title: 'Social Engineering',
        icon: Icons.psychology_alt,
        xpReward: 110,
        lessons: socialEngineeringLessons,
        primaryDomainIndex: 1, // Threats, Vulnerabilities & Mitigations
      ),
      Module(
        title: 'Malware',
        icon: Icons.coronavirus,
        xpReward: 120,
        lessons: malwareLessons,
        primaryDomainIndex: 1, // Threats, Vulnerabilities & Mitigations
      ),
      Module(
        title: 'Vulnerabilities and Threats',
        icon: Icons.bug_report,
        xpReward: 130,
        lessons: vulnerabilitiesThreatsLessons,
        primaryDomainIndex: 1, // Threats, Vulnerabilities & Mitigations
      ),
      Module(
        title: 'Alerts and Monitoring',
        icon: Icons.notifications_active,
        xpReward: 130,
        lessons: alertsMonitoringLessons,
        primaryDomainIndex: 3, // Security Operations
      ),
      Module(
        title: 'Email Security',
        icon: Icons.email,
        xpReward: 100,
        lessons: emailSecurityLessons,
        primaryDomainIndex: 1, // Threats, Vulnerabilities & Mitigations
      ),
      Module(
        title: 'Windows Security',
        icon: Icons.desktop_windows,
        xpReward: 130,
        lessons: windowsSecurityLessons,
        primaryDomainIndex: 2, // Security Architecture
      ),
      Module(
        title: 'Linux Security',
        icon: Icons.terminal,
        xpReward: 160,
        lessons: linuxSecurityLessons,
        primaryDomainIndex: 3, // Security Operations
      ),
      Module(
        title: 'Capstone: Applied Defense',
        icon: Icons.workspace_premium,
        xpReward: 250,
        lessons: capstoneLessons,
        primaryDomainIndex: 4, // Security Program Management & Oversight
      ),
    ],
    examBank: expertExamBank,
  ),
];

/// A single navigable topic (= one Module) paired with the Level it
/// belongs to. This flattens the Level -> Modules tree into one flat list
/// so the Topics screen can list every topic up front, while each topic
/// still carries its level for badging, lock checks, and exam routing.
class TopicEntry {
  final Module module;
  final Level level;
  final int levelIndex;

  const TopicEntry({
    required this.module,
    required this.level,
    required this.levelIndex,
  });
}

final List<TopicEntry> allTopics = [
  for (var i = 0; i < allLevels.length; i++)
    for (final module in allLevels[i].modules)
      TopicEntry(module: module, level: allLevels[i], levelIndex: i),
];
