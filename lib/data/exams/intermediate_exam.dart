import '../exam_model.dart';

const List<ExamQuestion> intermediateExamBank = [
  // -- Easy -----------------------------------------------------------------
  ExamQuestion(
    question: 'Which port is standard for encrypted web traffic (HTTPS)?',
    options: ['21', '80', '443', '53'],
    correctIndex: 2,
    explanation: 'Port 443 is the standard port for HTTPS.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What does DNS primarily do?',
    options: [
      'Encrypts network traffic',
      'Translates domain names into IP addresses',
      'Manages user permissions',
      'Schedules system backups',
    ],
    correctIndex: 1,
    explanation: 'DNS resolves human-readable names into IP addresses.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What is the "principle of least privilege"?',
    options: [
      'Giving every account administrator rights for convenience',
      'Giving users and processes only the access they need to do their job',
      'Disabling all accounts by default',
      'Allowing unrestricted access to shared folders',
    ],
    correctIndex: 1,
    explanation:
        'Least privilege limits access to only what\'s necessary.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What is the main job of a firewall?',
    options: [
      'Translate domain names',
      'Allow or block traffic based on defined rules',
      'Distribute traffic across servers',
      'Encrypt files at rest',
    ],
    correctIndex: 1,
    explanation: 'Firewalls inspect and permit/deny traffic per configured rules.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What does BitLocker primarily protect against?',
    options: [
      'Phishing emails',
      'Data exposure if a device is lost or stolen',
      'Malware running on an unlocked system',
      'Weak Wi-Fi signals',
    ],
    correctIndex: 1,
    explanation: 'BitLocker encrypts the drive, protecting data at rest.',
    difficulty: Difficulty.easy,
  ),

  // -- Medium -----------------------------------------------------------------
  ExamQuestion(
    question: 'Which type of IP address is NOT directly reachable from the '
        'public internet?',
    options: ['Public IP', 'Private IP', 'Static IP', 'Any IPv6 address'],
    correctIndex: 1,
    explanation: 'Private IPs are used inside local networks only.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'An attacker secretly intercepts traffic between two parties '
        'without either side knowing. This is:',
    options: [
      'A denial-of-service attack',
      'DNS tunneling',
      'A man-in-the-middle attack',
      'Subnetting',
    ],
    correctIndex: 2,
    explanation: 'Secretly intercepting communication is a MITM attack.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What is the purpose of User Account Control (UAC) in Windows?',
    options: [
      'To encrypt the hard drive',
      'To require approval before actions needing administrator rights run',
      'To back up files automatically',
      'To block all incoming network traffic',
    ],
    correctIndex: 1,
    explanation:
        'UAC prompts for approval before system-level changes are made.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'In NTFS, what does "Full Control" allow that "Modify" does not?',
    options: [
      'Reading file contents',
      'Changing permissions on the file or folder',
      'Opening the file',
      'Nothing — they are identical',
    ],
    correctIndex: 1,
    explanation: 'Full Control adds the ability to change permissions.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Why might an organization segment its network into smaller '
        'subnets?',
    options: [
      'To make Wi-Fi passwords longer',
      'To limit how far an attacker can move if one segment is compromised',
      'To increase the number of public IPs available',
      'To remove the need for firewalls',
    ],
    correctIndex: 1,
    explanation: 'Segmentation contains the impact of a breach.',
    difficulty: Difficulty.medium,
  ),

  // -- Hard -----------------------------------------------------------------
  ExamQuestion(
    question: 'A VPN protects traffic in transit, but which of these '
        'attack types would it do nothing to stop?',
    options: [
      'Packet sniffing on public Wi-Fi',
      'A phished credential used to log directly into a cloud app',
      'Eavesdropping on an unencrypted hotel network',
      'Interception of traffic on a coffee shop\'s router',
    ],
    correctIndex: 1,
    explanation:
        'A VPN protects data in transit but does nothing once an attacker '
        'has valid, phished credentials.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Which Windows Defender feature is specifically designed to '
        'help defend against ransomware encrypting files?',
    options: ['SmartScreen', 'Controlled Folder Access', 'BitLocker', 'Group Policy'],
    correctIndex: 1,
    explanation:
        'Controlled Folder Access blocks unauthorized apps from modifying '
        'protected folders.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'A receiving mail server checks whether an inbound message '
        'really originated from an authorized server for that domain. '
        'Which DNS-based standard is being used?',
    options: ['SPF', 'NTFS', 'UAC', 'BitLocker'],
    correctIndex: 0,
    explanation:
        'SPF publishes a list of servers authorized to send mail for a '
        'domain.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Why is timely patching considered one of the highest-value '
        'security practices on Windows?',
    options: [
      'It makes the computer boot faster',
      'Most successful attacks exploit known vulnerabilities that already have a patch available',
      'It is required to use Windows Defender at all',
      'It automatically configures the firewall',
    ],
    correctIndex: 1,
    explanation:
        'Attackers frequently exploit known, already-patched '
        'vulnerabilities on unpatched systems.',
    difficulty: Difficulty.hard,
  ),
];
