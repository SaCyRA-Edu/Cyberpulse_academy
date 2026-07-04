import 'package:flutter/material.dart';

/// One of the five CompTIA Security+ (SY0-701) exam domains, with its
/// official exam weighting. Every module in this course is mapped to the
/// domain it primarily reinforces via [Module.primaryDomainIndex].
class SecurityDomain {
  final String name;
  final int examWeightPercent;
  final Color color;
  final IconData icon;

  const SecurityDomain({
    required this.name,
    required this.examWeightPercent,
    required this.color,
    required this.icon,
  });
}

const List<SecurityDomain> securityPlusDomains = [
  SecurityDomain(
    name: 'General Security Concepts',
    examWeightPercent: 12,
    color: Color(0xFF1565C0),
    icon: Icons.security,
  ),
  SecurityDomain(
    name: 'Threats, Vulnerabilities & Mitigations',
    examWeightPercent: 22,
    color: Color(0xFFC62828),
    icon: Icons.warning_amber,
  ),
  SecurityDomain(
    name: 'Security Architecture',
    examWeightPercent: 18,
    color: Color(0xFF2E7D32),
    icon: Icons.account_tree,
  ),
  SecurityDomain(
    name: 'Security Operations',
    examWeightPercent: 28,
    color: Color(0xFF6A1B9A),
    icon: Icons.visibility,
  ),
  SecurityDomain(
    name: 'Security Program Management & Oversight',
    examWeightPercent: 20,
    color: Color(0xFFEF6C00),
    icon: Icons.gavel,
  ),
];
