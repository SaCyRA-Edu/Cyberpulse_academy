import '../exam_model.dart';

const List<ExamQuestion> advancedExamBank = [
  // -- Easy -----------------------------------------------------------------
  ExamQuestion(
    question: 'Why is it recommended to avoid daily work as the root user '
        'on Linux?',
    options: [
      'Root accounts run slower',
      'Root has unrestricted access, so mistakes or compromises have far greater impact',
      'Root accounts cannot connect to the internet',
      'It is required by most package managers',
    ],
    correctIndex: 1,
    explanation:
        'Because root has unrestricted access, errors or compromises while '
        'using it affect the entire system.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What is the main benefit of sudo over logging in directly as root?',
    options: [
      'It disables all logging',
      'It allows fine-grained, auditable elevated access without sharing the root password',
      'It is required to install any software',
      'It automatically encrypts the file system',
    ],
    correctIndex: 1,
    explanation: 'sudo provides controlled, logged elevated access.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What is the primary purpose of a Security Operations Center (SOC)?',
    options: [
      'Writing marketing material',
      'Continuously monitoring systems and coordinating response to security incidents',
      'Managing payroll',
      'Designing new software features',
    ],
    correctIndex: 1,
    explanation: 'A SOC\'s core role is monitoring, detection, and response.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Which SOC tier typically performs the first review of an incoming alert?',
    options: ['Tier 1', 'Tier 2', 'Tier 3', 'SOC Manager'],
    correctIndex: 0,
    explanation: 'Tier 1 analysts perform initial triage.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What does a SIEM mainly help a SOC do?',
    options: [
      'Write security policies',
      'Collect and correlate logs from across the organization to surface potential incidents',
      'Encrypt laptops',
      'Manage employee onboarding',
    ],
    correctIndex: 1,
    explanation: 'A SIEM aggregates and correlates log data.',
    difficulty: Difficulty.easy,
  ),

  // -- Medium -----------------------------------------------------------------
  ExamQuestion(
    question: 'In a permission string "rwxr-xr--", what access does '
        '"everyone else" have?',
    options: [
      'Read, write, and execute',
      'Read and execute',
      'Read only',
      'No access at all',
    ],
    correctIndex: 2,
    explanation: 'The final three characters "r--" mean read-only.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Why is SSH key-based authentication generally more secure '
        'than password authentication?',
    options: [
      'Keys are shorter than passwords',
      'The private key never travels over the network and is far harder to brute-force',
      'Keys never need to be stored anywhere',
      'It removes the need for a firewall',
    ],
    correctIndex: 1,
    explanation:
        'The private key stays on the client, making key-based login much '
        'more resistant to brute-force attacks.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What is an "Indicator of Compromise" (IOC)?',
    options: [
      'A formal policy document',
      'An observable sign a system may be compromised, like a known-malicious IP',
      'A type of firewall rule',
      'A SOC performance metric',
    ],
    correctIndex: 1,
    explanation: 'IOCs are observable artifacts suggesting compromise.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'In the incident response lifecycle, what comes immediately '
        'after "Containment"?',
    options: ['Identification', 'Eradication', 'Preparation', 'Recovery'],
    correctIndex: 1,
    explanation: 'After containment comes eradication — removing the threat.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What do SELinux and AppArmor both provide?',
    options: [
      'Disk encryption',
      'An additional layer of mandatory access control restricting what programs can do',
      'A graphical desktop environment',
      'A package manager replacement',
    ],
    correctIndex: 1,
    explanation: 'Both restrict program behavior beyond standard permissions.',
    difficulty: Difficulty.medium,
  ),

  // -- Hard -----------------------------------------------------------------
  ExamQuestion(
    question: 'A SOC analyst notices a failed login, an unusual file '
        'download, and a new outbound connection within minutes of each '
        'other on the same host. Individually each event is low-severity. '
        'What is this scenario illustrating?',
    options: [
      'Why MFA is unnecessary',
      'The value of correlation — combining weak individual signals into a stronger pattern',
      'A false positive that should always be ignored',
      'A reason to disable logging',
    ],
    correctIndex: 1,
    explanation:
        'SIEM correlation reveals patterns that no single log entry would '
        'show alone.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'A Linux admin grants every user broad sudo rights instead '
        'of disabling root, intending to improve security. What problem '
        'does this actually create?',
    options: [
      'It has no real downside',
      'It effectively recreates unrestricted root access under a different name',
      'It disables SSH entirely',
      'It removes the need for file permissions',
    ],
    correctIndex: 1,
    explanation:
        'Overly broad sudo access defeats the purpose of fine-grained, '
        'least-privilege control.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Why do many incident response processes include a '
        '"Lessons Learned" phase after recovery?',
    options: [
      'It is legally required everywhere',
      'To feed what was learned back into detection, policy, and training so gaps aren\'t exploited again',
      'To assign blame to specific employees',
      'It is optional and rarely useful',
    ],
    correctIndex: 1,
    explanation: 'Reviewing incidents helps close the gaps that were exploited.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'What is MITRE ATT&CK best described as, and why do SOC '
        'teams use it?',
    options: [
      'An antivirus product used to block malware automatically',
      'A knowledge base cataloging attacker tactics/techniques, giving analysts a shared vocabulary to map observed behavior',
      'A type of firewall configuration',
      'A password policy standard',
    ],
    correctIndex: 1,
    explanation:
        'ATT&CK provides a common language for describing and detecting '
        'attacker behavior.',
    difficulty: Difficulty.hard,
  ),
];
