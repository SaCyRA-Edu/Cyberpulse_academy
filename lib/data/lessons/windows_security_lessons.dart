import '../lesson_model.dart';

const List<Lesson> windowsSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Security Architecture',
    sections: [
      LessonSection(
        heading: 'The Windows Security Model',
        body:
            'Windows uses a layered security model: at the bottom is the '
            'kernel (hardware access, process isolation), above that is '
            'user mode (where applications run), and at the top is a set '
            'of security subsystems including the Security Reference '
            'Monitor (SRM), which enforces access control decisions.',
      ),
      LessonSection(
        heading: 'Processes & Integrity Levels',
        body:
            'Every process in Windows runs at an integrity level: '
            'Untrusted, Low, Medium, High, or System. A process at a '
            'lower integrity level cannot write to objects at a higher '
            'level — a core mechanism that contains what compromised '
            'browser tabs or downloaded files can do.',
      ),
      LessonSection(
        heading: 'The Security Accounts Manager (SAM)',
        body:
            'SAM stores local account credentials as hashes on disk '
            '(in the registry at HKLM\\SAM). It is protected by the '
            'kernel and cannot be read while Windows is running. '
            'Attackers who obtain a copy (through shadow copies, offline '
            'access, or tools like Mimikatz) can attempt to crack or '
            'pass those hashes.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'User Accounts, Groups & UAC',
    sections: [
      LessonSection(
        heading: 'Account Types',
        bullets: [
          'Standard User — can run applications, change personal settings; cannot install software or modify system config',
          'Administrator — full local system control; should not be used for day-to-day work',
          'Built-in accounts (Administrator, Guest) — should be disabled or tightly controlled in managed environments',
          'Service accounts — run background services; should have minimal permissions and no interactive login',
        ],
      ),
      LessonSection(
        heading: 'User Account Control (UAC)',
        body:
            'UAC is the prompt that appears when an action requires '
            'administrator rights. It creates a security boundary: even '
            'if you\'re logged in as an administrator, most operations '
            'run at medium integrity until explicitly elevated. This '
            'slows down malware that tries to make system changes silently.',
      ),
      LessonSection(
        heading: 'Least Privilege in Practice',
        body:
            'The correct setup for most users: a standard account for '
            'day-to-day work, a separate administrator account used only '
            'when needed for maintenance. This limits the impact of a '
            'compromised user session significantly.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'NTFS Permissions & File System Security',
    sections: [
      LessonSection(
        heading: 'NTFS Permission Types',
        bullets: [
          'Full Control — read, write, delete, execute, change permissions, and take ownership',
          'Modify — read, write, delete, execute (but not change permissions)',
          'Read & Execute — open and run files',
          'List Folder Contents — see what\'s in a folder',
          'Read — view file contents',
          'Write — create and modify files',
        ],
      ),
      LessonSection(
        heading: 'Allow vs. Deny',
        body:
            'NTFS has explicit Allow and explicit Deny entries. Deny '
            'always overrides Allow when both apply to the same user. '
            'Careful use of Deny can protect sensitive paths from specific '
            'accounts even when broad Allow rules exist.',
      ),
      LessonSection(
        heading: 'Inheritance & Effective Permissions',
        body:
            'By default, child files and folders inherit permissions from '
            'their parent. Effective permissions for a user are the '
            'combined result of all group memberships and explicit '
            'assignments — you can view these in the "Effective Access" '
            'tab in the file\'s Properties → Security dialog.',
      ),
      LessonSection(
        heading: 'Share Permissions vs. NTFS',
        body:
            'When accessing files over a network share, both share '
            'permissions and NTFS permissions apply — the more restrictive '
            'of the two wins. A common hardening practice is to set share '
            'permissions to "Everyone: Full Control" and manage access '
            'entirely through NTFS permissions, which are more granular.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Active Directory Fundamentals',
    sections: [
      LessonSection(
        heading: 'What Active Directory Is',
        body:
            'Active Directory (AD) is Microsoft\'s identity and access '
            'management service for Windows domains. It centralizes '
            'authentication, authorization, and policy for all machines '
            'and users in an organization\'s Windows environment.',
      ),
      LessonSection(
        heading: 'Key AD Concepts',
        bullets: [
          'Domain — a logical grouping of users, computers, and resources sharing a common directory',
          'Domain Controller (DC) — the server running AD, handling authentication and policy',
          'Organizational Units (OUs) — containers for organizing objects within a domain',
          'Groups — collections of users or computers for policy and permission assignment',
          'Forest — one or more domains sharing a schema and trust relationships',
        ],
      ),
      LessonSection(
        heading: 'Why AD Is Such a High-Value Target',
        body:
            'Compromising a domain controller gives an attacker control '
            'over the entire environment — every machine, every user, '
            'every application that trusts the domain. This is why '
            'protecting the DC tier and privileged AD accounts is one '
            'of the most critical security priorities in any Windows '
            'environment.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Defender & Endpoint Detection',
    sections: [
      LessonSection(
        heading: 'Microsoft Defender Antivirus',
        body:
            'Built into Windows 10/11 and Windows Server, Defender '
            'provides real-time, cloud-assisted malware protection with '
            'no third-party software required. Its signature database '
            'is updated multiple times daily and augmented with '
            'behaviour-based detection.',
      ),
      LessonSection(
        heading: 'Key Defender Features',
        bullets: [
          'Real-time protection — scans files as they\'re created, modified, or downloaded',
          'Cloud-delivered protection — checks suspicious samples against Microsoft\'s threat intelligence',
          'Tamper protection — prevents attackers from disabling Defender via registry or CLI changes',
          'Controlled Folder Access — blocks unauthorized processes from modifying protected folders (anti-ransomware)',
          'Attack Surface Reduction (ASR) rules — blocks specific attack techniques at the OS level',
        ],
      ),
      LessonSection(
        heading: 'Microsoft Defender for Endpoint (MDE)',
        body:
            'The enterprise extension of Defender adds EDR (Endpoint '
            'Detection and Response) capability: centralized visibility '
            'across all endpoints, hunting, automated investigation, '
            'and response. Alerts from MDE feed directly into a SIEM '
            'or the Microsoft Sentinel SIEM.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Group Policy & Security Hardening',
    sections: [
      LessonSection(
        heading: 'What Group Policy Does',
        body:
            'Group Policy Objects (GPOs) apply configuration settings '
            'to users and computers in an AD domain — from password '
            'complexity rules to software restrictions to screen lock '
            'timeouts — without touching each machine individually.',
      ),
      LessonSection(
        heading: 'Essential Security Settings via GPO',
        bullets: [
          'Account lockout policy — lock accounts after N failed attempts to block brute force',
          'Password policy — minimum length, complexity, maximum age',
          'Audit policy — configure what security events are logged',
          'Restrict removable media — prevent USB drives from being used as malware delivery',
          'AppLocker / Software Restriction Policies — allowlist approved executables only',
          'Disable legacy protocols — NTLMv1, LM hash, SMBv1',
        ],
      ),
      LessonSection(
        heading: 'Security Baselines',
        body:
            'Microsoft publishes free Security Baselines for each Windows '
            'version — pre-configured GPO templates incorporating '
            'Microsoft\'s own hardening recommendations. Using a baseline '
            'as a starting point is far more efficient than building '
            'hardening settings from scratch.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Firewall',
    sections: [
      LessonSection(
        heading: 'Windows Firewall with Advanced Security',
        body:
            'Windows includes a host-based stateful firewall that '
            'provides inbound and outbound filtering per-application '
            'and per-port. Unlike a network firewall, it protects the '
            'individual machine even when on a trusted internal network — '
            'limiting lateral movement from a compromised machine nearby.',
      ),
      LessonSection(
        heading: 'Network Profiles',
        bullets: [
          'Domain — applied when connected to a corporate domain; typically permissive for management traffic',
          'Private — applied to trusted home/office networks; balanced',
          'Public — applied to untrusted networks (hotels, coffee shops); most restrictive',
        ],
      ),
      LessonSection(
        heading: 'Why Host Firewall Matters Even on Protected Networks',
        body:
            'A network firewall protects the perimeter. But once an '
            'attacker is inside — via phishing, a compromised VPN, or a '
            'supply chain infection — host-based firewall rules are what '
            'stop them from moving laterally from machine to machine '
            'uninhibited.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Event Logs, Auditing & Monitoring',
    sections: [
      LessonSection(
        heading: 'The Three Core Logs',
        bullets: [
          'Security log — authentication events, account changes, policy changes, logon/logoff',
          'System log — driver, service, and OS-level events',
          'Application log — events generated by installed applications',
        ],
      ),
      LessonSection(
        heading: 'Critical Security Event IDs',
        bullets: [
          '4624 — Successful logon (who logged on, when, how)',
          '4625 — Failed logon (watch for bursts = brute force)',
          '4648 — Logon with explicit credentials (pass-the-hash indicator)',
          '4688 — New process created (command execution)',
          '4720/4732 — User account created / added to security group',
          '1102/4719 — Security audit log cleared (attacker covering tracks)',
        ],
      ),
      LessonSection(
        heading: 'Forwarding Logs to a SIEM',
        body:
            'Individual machine logs are useful, but in an enterprise, '
            'logs must be centralized — forwarded via Windows Event '
            'Forwarding (WEF) or a SIEM agent to a central platform '
            'where they can be correlated, retained, and searched across '
            'all machines simultaneously.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Patch Management & WSUS',
    sections: [
      LessonSection(
        heading: 'Why Unpatched Systems Are the Biggest Risk',
        body:
            'Most successful attacks exploit known, already-patched '
            'vulnerabilities. The average time between a CVE being '
            'published and exploitation in the wild has shrunk to days '
            'or even hours for high-profile vulnerabilities. Patch '
            'management is consistently the highest-ROI security activity.',
      ),
      LessonSection(
        heading: 'Windows Update & WSUS',
        bullets: [
          'Windows Update — the built-in mechanism delivering patches directly from Microsoft',
          'WSUS (Windows Server Update Services) — on-premises service for controlling, testing, and approving patches before rolling them out to the fleet',
          'Microsoft Endpoint Configuration Manager (MECM/SCCM) — enterprise-grade patch orchestration at scale',
        ],
      ),
      LessonSection(
        heading: 'A Practical Patching Strategy',
        bullets: [
          'Critical and high-severity patches: target ≤72 hours, especially for internet-facing systems',
          'Test in a staging group before deploying broadly where possible',
          'Have compensating controls (block the vulnerable port/service) for systems that can\'t be immediately patched',
          'Track compliance — know exactly which machines are missing which patches',
        ],
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'BitLocker & Credential Protection',
    sections: [
      LessonSection(
        heading: 'BitLocker Drive Encryption',
        body:
            'BitLocker encrypts the entire volume using AES-XTS 128 or '
            '256 bit. When a laptop is lost or stolen and powered off, '
            'the data on it is unreadable without the recovery key or '
            'the user\'s credentials. Works best with a TPM chip which '
            'seals the encryption key to the hardware, detecting tampering.',
      ),
      LessonSection(
        heading: 'Credential Guard',
        body:
            'Credential Guard uses virtualization-based security (VBS) '
            'to isolate stored credentials (NTLM hashes, Kerberos '
            'tickets) in a protected hypervisor partition. This directly '
            'mitigates pass-the-hash and pass-the-ticket attacks by '
            'preventing tools like Mimikatz from reading credentials '
            'from memory.',
      ),
      LessonSection(
        heading: 'LAPS: Local Administrator Password Solution',
        body:
            'By default, many organizations image all machines with '
            'the same local Administrator password — meaning one '
            'compromised machine immediately compromises all others. '
            'LAPS automatically generates and rotates unique local '
            'admin passwords per machine, stored securely in AD.',
      ),
    ],
  ),

  // 11 ----------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'What does Windows integrity levels prevent?',
        options: [
          'Users logging in from remote locations',
          'Lower-integrity processes from writing to higher-integrity objects',
          'Administrators from creating new accounts',
          'Antivirus from scanning system files',
        ],
        correctIndex: 1,
        explanation: 'Integrity levels contain what a compromised low-privilege process (like a browser) can do to the rest of the system.',
      ),
      QuizQuestion(
        question: 'In NTFS permissions, what does a Deny entry do when it conflicts with an Allow?',
        options: [
          'The Allow wins',
          'The Deny wins and always overrides Allow',
          'They cancel each other out',
          'The result depends on which was set first',
        ],
        correctIndex: 1,
        explanation: 'Explicit Deny always overrides Allow in NTFS permissions.',
      ),
      QuizQuestion(
        question: 'Why is a Domain Controller the highest-priority protection '
            'target in a Windows environment?',
        options: [
          'It stores all the file shares',
          'Compromising it gives an attacker control over every machine and user in the domain',
          'It runs antivirus for the whole network',
          'It controls internet access',
        ],
        correctIndex: 1,
        explanation: 'The DC is the trust root — whoever controls AD controls the entire environment.',
      ),
      QuizQuestion(
        question: 'Which Windows Defender feature specifically addresses ransomware?',
        options: [
          'SmartScreen',
          'Controlled Folder Access',
          'Tamper Protection',
          'Network Inspection System',
        ],
        correctIndex: 1,
        explanation: 'Controlled Folder Access blocks unauthorized processes from modifying protected folders.',
      ),
      QuizQuestion(
        question: 'Event ID 4625 repeated hundreds of times from a single '
            'source in the Security log most likely indicates:',
        options: [
          'A user changing their password',
          'A Group Policy update',
          'A brute-force attack against an account',
          'Antivirus updating signatures',
        ],
        correctIndex: 2,
        explanation: 'Many failed logon events (4625) in rapid succession from one source is a brute-force signature.',
      ),
      QuizQuestion(
        question: 'What problem does LAPS solve?',
        options: [
          'All machines having the same local administrator password',
          'Users forgetting their domain password',
          'Weak GPO enforcement',
          'Slow Windows Update downloads',
        ],
        correctIndex: 0,
        explanation: 'LAPS generates unique, rotated local admin passwords per machine, preventing lateral movement via shared passwords.',
      ),
      QuizQuestion(
        question: 'What does Credential Guard use to protect stored credentials?',
        options: [
          'BitLocker encryption',
          'Virtualization-based security to isolate credentials in a protected hypervisor partition',
          'A secondary hard drive',
          'The Windows Firewall',
        ],
        correctIndex: 1,
        explanation: 'Credential Guard uses VBS to keep credentials out of reach of tools like Mimikatz.',
      ),
      QuizQuestion(
        question: 'Which is the best description of Windows Security Baselines?',
        options: [
          'A list of approved third-party antivirus products',
          'Pre-configured GPO templates from Microsoft incorporating hardening recommendations',
          'A backup configuration for factory resetting Windows',
          'The minimum hardware requirements for Windows',
        ],
        correctIndex: 1,
        explanation: 'Microsoft Security Baselines are ready-to-deploy GPO hardening templates.',
      ),
    ],
  ),
];
