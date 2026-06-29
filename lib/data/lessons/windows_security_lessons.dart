import '../lesson_model.dart';

const List<Lesson> windowsSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Accounts & Permissions',
    sections: [
      LessonSection(
        heading: 'User Account Types',
        bullets: [
          'Standard user — can run most applications but can\'t make system-wide changes',
          'Administrator — can install software, change settings, and manage other accounts',
          'Built-in accounts (like the default Administrator) — should be disabled or tightly controlled in most environments',
        ],
      ),
      LessonSection(
        heading: 'The Principle of Least Privilege',
        body:
            'Users and processes should only have the access they actually '
            'need to do their job — nothing more. Running day-to-day work '
            'from a standard account, rather than an administrator account, '
            'limits the damage if that account is ever compromised.',
      ),
      LessonSection(
        heading: 'User Account Control (UAC)',
        body:
            'UAC is the prompt that appears when an action requires '
            'administrator approval. It exists specifically so that '
            'malware running silently in the background can\'t make '
            'system-level changes without the user noticing.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'NTFS Permissions',
    sections: [
      LessonSection(
        heading: 'What is NTFS?',
        body:
            'NTFS is the file system Windows uses on most modern drives. '
            'It supports detailed permissions controlling who can read, '
            'write, modify, or execute specific files and folders.',
      ),
      LessonSection(
        heading: 'Core Permission Types',
        bullets: [
          'Read — view file contents',
          'Write — add or change content',
          'Modify — change or delete a file',
          'Full Control — all of the above, plus the ability to change permissions',
        ],
      ),
      LessonSection(
        heading: 'Inheritance',
        body:
            'By default, files and subfolders inherit permissions from '
            'their parent folder. This makes managing permissions at scale '
            'much easier — set the rule once at the top, and it applies '
            'down the tree, unless explicitly overridden.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Defender & Endpoint Protection',
    sections: [
      LessonSection(
        heading: 'Built-In Protection',
        body:
            'Windows Defender (Microsoft Defender Antivirus) is built '
            'into modern Windows and provides real-time scanning, '
            'behavior-based detection, and cloud-assisted threat '
            'intelligence — all without needing third-party software.',
      ),
      LessonSection(
        heading: 'Key Features',
        bullets: [
          'Real-time protection — scans files as they\'re accessed',
          'Cloud-delivered protection — checks suspicious files against Microsoft\'s threat database',
          'Controlled Folder Access — blocks unauthorized apps from changing protected folders (helps against ransomware)',
          'SmartScreen — warns before running unrecognized apps or visiting risky sites',
        ],
      ),
      LessonSection(
        heading: 'Endpoint Detection & Response (EDR)',
        body:
            'In business environments, Defender is often paired with EDR '
            'tools (like Microsoft Defender for Endpoint) that give '
            'security teams visibility across many machines, plus the '
            'ability to investigate and respond to incidents centrally.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Group Policy & Hardening',
    sections: [
      LessonSection(
        heading: 'What is Group Policy?',
        body:
            'Group Policy lets administrators centrally configure '
            'settings across many Windows machines at once — password '
            'rules, software restrictions, screen lock timeouts, and much '
            'more — rather than configuring each device individually.',
      ),
      LessonSection(
        heading: 'Common Hardening Settings',
        bullets: [
          'Enforce strong password and account lockout policies',
          'Disable unused services and legacy protocols',
          'Restrict who can log in locally or remotely',
          'Apply application allowlisting to block unauthorized software',
        ],
      ),
      LessonSection(
        heading: 'Baselines',
        body:
            'Many organizations start from a published security baseline '
            '(such as Microsoft\'s own hardening guides) and adjust it for '
            'their needs, rather than building hardening settings from '
            'scratch.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Logging & Event Viewer',
    sections: [
      LessonSection(
        heading: 'Why Logging Matters',
        body:
            'Windows records system activity in event logs — and those '
            'logs are often the first place defenders look when '
            'investigating suspicious behavior.',
      ),
      LessonSection(
        heading: 'Key Log Categories',
        bullets: [
          'Security — logon/logoff events, account changes, access attempts',
          'System — driver and service-level events',
          'Application — events generated by installed software',
        ],
      ),
      LessonSection(
        heading: 'Events Worth Watching',
        bullets: [
          'Repeated failed logon attempts (possible brute-force activity)',
          'A standard account suddenly being added to an admin group',
          'Security logs being cleared (a common move attackers make to hide their tracks)',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Patch Management',
    sections: [
      LessonSection(
        heading: 'Why Patching Is Critical',
        body:
            'Most successful attacks don\'t rely on brand-new techniques — '
            'they exploit known vulnerabilities that already have a '
            'patch available, simply because the patch was never applied.',
      ),
      LessonSection(
        heading: 'Windows Update',
        body:
            'Windows Update delivers security patches, feature updates, '
            'and driver updates. In managed environments, organizations '
            'often use tools like Windows Server Update Services (WSUS) to '
            'test and roll out patches in a controlled way.',
      ),
      LessonSection(
        heading: 'Patch Management Best Practices',
        bullets: [
          'Apply critical security patches promptly',
          'Test patches in a staging environment before wide deployment, where possible',
          'Track which systems are missing patches',
          'Have a plan for systems that can\'t be patched immediately (compensating controls)',
        ],
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'BitLocker & Data Protection',
    sections: [
      LessonSection(
        heading: 'What is BitLocker?',
        body:
            'BitLocker is Windows\' built-in full-disk encryption feature. '
            'It encrypts an entire drive so that if a device is lost or '
            'stolen, the data on it is unreadable without the recovery key '
            'or the legitimate user\'s credentials.',
      ),
      LessonSection(
        heading: 'How It Helps',
        bullets: [
          'Protects data at rest if a laptop is lost or stolen',
          'Works automatically once configured, with minimal user impact',
          'Pairs well with a TPM (Trusted Platform Module) chip for secure key storage',
        ],
      ),
      LessonSection(
        heading: 'It\'s Not a Complete Solution',
        body:
            'BitLocker protects data when a device is powered off or '
            'locked. It doesn\'t protect against malware running while '
            'the system is unlocked, or against a user who is tricked into '
            'handing over access voluntarily — so it works best as one '
            'layer alongside other controls.',
      ),
    ],
  ),

  // 8 ------------------------------------------------------------------ Quiz
  Lesson(
    title: 'Final Quiz',
    quiz: [
      QuizQuestion(
        question: 'What is the "principle of least privilege"?',
        options: [
          'Giving every user administrator rights for convenience',
          'Giving users and processes only the access they need to do their job',
          'Disabling all user accounts by default',
          'Allowing unrestricted access to shared folders',
        ],
        correctIndex: 1,
        explanation:
            'Least privilege limits access to only what\'s necessary, '
            'reducing the impact if an account is compromised.',
      ),
      QuizQuestion(
        question: 'What is the purpose of User Account Control (UAC)?',
        options: [
          'To encrypt the hard drive',
          'To require approval before actions that need administrator rights run',
          'To back up user files automatically',
          'To block all incoming network traffic',
        ],
        correctIndex: 1,
        explanation:
            'UAC prompts for approval before system-level changes are '
            'made, helping prevent silent, unauthorized changes.',
      ),
      QuizQuestion(
        question: 'In NTFS, what does the "Full Control" permission allow '
            'a user to do that "Modify" does not?',
        options: [
          'Read file contents',
          'Change permissions on the file or folder',
          'Open the file',
          'Nothing — they are identical',
        ],
        correctIndex: 1,
        explanation:
            'Full Control includes everything Modify allows, plus the '
            'ability to change permissions.',
      ),
      QuizQuestion(
        question: 'Which Windows Defender feature is specifically '
            'designed to help defend against ransomware?',
        options: [
          'SmartScreen',
          'Controlled Folder Access',
          'BitLocker',
          'Group Policy',
        ],
        correctIndex: 1,
        explanation:
            'Controlled Folder Access blocks unauthorized applications '
            'from modifying files in protected folders.',
      ),
      QuizQuestion(
        question: 'What is Group Policy primarily used for?',
        options: [
          'Encrypting individual files',
          'Centrally configuring settings across many machines',
          'Scanning for malware',
          'Managing DNS records',
        ],
        correctIndex: 1,
        explanation:
            'Group Policy lets administrators apply consistent settings '
            'across many Windows machines from one place.',
      ),
      QuizQuestion(
        question: 'Which Windows event log category would show failed '
            'logon attempts?',
        options: ['Application', 'System', 'Security', 'Setup'],
        correctIndex: 2,
        explanation:
            'The Security log records logon/logoff activity and access '
            'attempts.',
      ),
      QuizQuestion(
        question: 'Why is timely patching considered one of the most '
            'important security practices?',
        options: [
          'It makes the computer run faster',
          'Most successful attacks exploit known vulnerabilities that already have a patch available',
          'It is required to use Windows Defender',
          'It automatically encrypts all files',
        ],
        correctIndex: 1,
        explanation:
            'Attackers frequently exploit known, already-patched '
            'vulnerabilities on systems that haven\'t been updated.',
      ),
      QuizQuestion(
        question: 'What does BitLocker primarily protect against?',
        options: [
          'Phishing emails',
          'Data exposure if a device is lost or stolen',
          'Malware running on an unlocked system',
          'Weak passwords',
        ],
        correctIndex: 1,
        explanation:
            'BitLocker encrypts the drive so data is unreadable without '
            'proper credentials or a recovery key, protecting data at '
            'rest.',
      ),
    ],
  ),
];
