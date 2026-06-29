import 'package:flutter/material.dart';
import 'lesson_model.dart';
import 'exam_model.dart';
import 'lessons/fundamentals_lessons.dart';
import 'lessons/email_security_lessons.dart';
import 'lessons/networking_lessons.dart';
import 'lessons/windows_security_lessons.dart';
import 'lessons/linux_security_lessons.dart';
import 'lessons/soc_operations_lessons.dart';
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

  const Module({
    required this.title,
    required this.icon,
    required this.xpReward,
    required this.lessons,
  });

  int get lessonCount => lessons.length;
}

/// A Level is the top-level unit of the course (Beginner / Intermediate /
/// Advanced / Expert). Each level bundles one or more [Module]s plus an
/// adaptive [examBank] used for the gating Level Exam.
///
/// [isFree] only ever applies to the first level — everything else is
/// gated behind [isFree] == false AND requires the previous level's exam
/// to be passed at 80%+, regardless of payment status.
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
    title: 'Beginner',
    description: 'Core security concepts and email safety. Free to start.',
    isFree: true,
    modules: [
      Module(
        title: 'Cybersecurity Fundamentals',
        icon: Icons.security,
        xpReward: 100,
        lessons: fundamentalsLessons,
      ),
      Module(
        title: 'Email Security',
        icon: Icons.email,
        xpReward: 100,
        lessons: emailSecurityLessons,
      ),
    ],
    examBank: beginnerExamBank,
  ),
  Level(
    title: 'Intermediate',
    description: 'Networking fundamentals and Windows hardening.',
    isFree: false,
    modules: [
      Module(
        title: 'Networking',
        icon: Icons.router,
        xpReward: 130,
        lessons: networkingLessons,
      ),
      Module(
        title: 'Windows Security',
        icon: Icons.desktop_windows,
        xpReward: 130,
        lessons: windowsSecurityLessons,
      ),
    ],
    examBank: intermediateExamBank,
  ),
  Level(
    title: 'Advanced',
    description: 'Linux hardening and Security Operations Center skills.',
    isFree: false,
    modules: [
      Module(
        title: 'Linux Security',
        icon: Icons.terminal,
        xpReward: 160,
        lessons: linuxSecurityLessons,
      ),
      Module(
        title: 'SOC Operations',
        icon: Icons.visibility,
        xpReward: 160,
        lessons: socOperationsLessons,
      ),
    ],
    examBank: advancedExamBank,
  ),
  Level(
    title: 'Expert',
    description:
        'Capstone: threat modeling, ethical hacking, forensics, Zero '
        'Trust, and GRC — tying every prior level together.',
    isFree: false,
    modules: [
      Module(
        title: 'Capstone: Applied Defense',
        icon: Icons.workspace_premium,
        xpReward: 250,
        lessons: capstoneLessons,
      ),
    ],
    examBank: expertExamBank,
  ),
];
