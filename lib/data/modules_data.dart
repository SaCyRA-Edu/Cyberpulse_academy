import 'package:flutter/material.dart';
import 'lesson_model.dart';
import 'lessons/fundamentals_lessons.dart';
import 'lessons/networking_lessons.dart';
import 'lessons/windows_security_lessons.dart';
import 'lessons/linux_security_lessons.dart';
import 'lessons/soc_operations_lessons.dart';
import 'lessons/email_security_lessons.dart';

class Module {
  final String title;
  final IconData icon;
  final String difficulty;
  final int xpReward;
  final List<Lesson> lessons;

  const Module({
    required this.title,
    required this.icon,
    required this.difficulty,
    required this.xpReward,
    required this.lessons,
  });

  int get lessonCount => lessons.length;
}

final List<Module> allModules = [
  Module(
    title: 'Cybersecurity Fundamentals',
    icon: Icons.security,
    difficulty: 'Beginner',
    xpReward: 100,
    lessons: fundamentalsLessons,
  ),
  Module(
    title: 'Networking',
    icon: Icons.router,
    difficulty: 'Beginner',
    xpReward: 120,
    lessons: networkingLessons,
  ),
  Module(
    title: 'Windows Security',
    icon: Icons.desktop_windows,
    difficulty: 'Intermediate',
    xpReward: 150,
    lessons: windowsSecurityLessons,
  ),
  Module(
    title: 'Linux Security',
    icon: Icons.terminal,
    difficulty: 'Intermediate',
    xpReward: 150,
    lessons: linuxSecurityLessons,
  ),
  Module(
    title: 'SOC Operations',
    icon: Icons.visibility,
    difficulty: 'Advanced',
    xpReward: 200,
    lessons: socOperationsLessons,
  ),
  Module(
    title: 'Email Security',
    icon: Icons.email,
    difficulty: 'Beginner',
    xpReward: 110,
    lessons: emailSecurityLessons,
  ),
];
