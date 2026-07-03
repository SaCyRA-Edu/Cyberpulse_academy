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
  ExamQuestion(
    question: 'NTFS effective permissions are determined by:',
    options: ['Only the most permissive rule', 'The combination of all group memberships and explicit assignments with Deny overriding Allow', 'Only the owner permission', 'The last permission set wins'],
    correctIndex: 1,
    explanation: 'Effective permissions combine all applicable rules with explicit Deny always winning.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Which Windows log event ID indicates a successful logon?',
    options: ['4625', '4624', '4688', '1102'],
    correctIndex: 1,
    explanation: 'Event 4624 records every successful logon including who logged in when and how.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'A network IDS is described as passive. This means:',
    options: ['It has no network connection', 'It monitors and alerts on suspicious traffic but does not block it', 'It only monitors outbound traffic', 'It requires manual checking daily'],
    correctIndex: 1,
    explanation: 'An IDS is passive — it detects and alerts. An IPS actively blocks.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'VLANs improve security by:',
    options: ['Encrypting all traffic', 'Creating logical network segments on a shared physical switch isolating different device groups', 'Blocking all external traffic', 'Replacing firewalls'],
    correctIndex: 1,
    explanation: 'VLANs segment traffic logically preventing different device groups from communicating freely.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Why is port 445 (SMB) particularly dangerous when exposed to the internet?',
    options: ['It uses UDP which is unreliable', 'SMB vulnerabilities have been used for major ransomware propagation including WannaCry', 'Port 445 is always unencrypted', 'SMB does not support authentication'],
    correctIndex: 1,
    explanation: 'SMB vulnerabilities were exploited by WannaCry and other major ransomware outbreaks.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'TLS 1.3 compared to older TLS versions is:',
    options: ['Slower and less secure', 'Faster and more secure with mandatory forward secrecy and removal of weak cipher suites', 'Identical in security but faster', 'Only supported on Linux'],
    correctIndex: 1,
    explanation: 'TLS 1.3 removed weak cipher suites mandatory forward secrecy and reduced handshake latency.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'What does Windows Firewall Tamper Protection prevent?',
    options: ['Users from changing their password', 'Attackers from disabling Defender via registry changes or command line', 'Guest accounts from browsing the web', 'Software from using the network'],
    correctIndex: 1,
    explanation: 'Tamper Protection prevents malware and attackers from turning off Windows Defender.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'The deny-by-default firewall policy means:',
    options: ['Block everything including legitimate traffic', 'Block all traffic not explicitly permitted by a rule', 'Only block traffic from known-bad IPs', 'Deny all outbound traffic'],
    correctIndex: 1,
    explanation: 'Deny by default ensures only specifically authorized traffic flows — everything else is blocked.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Group Policy Objects (GPOs) are applied to:',
    options: ['Individual files only', 'Users and computers in Active Directory OUs domains and sites', 'Network switches only', 'Only Windows Server machines'],
    correctIndex: 1,
    explanation: 'GPOs apply settings to users and computers organized in AD Organizational Units.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'A packet capture showing unencrypted HTTP traffic reveals a username and password. This demonstrates the risk of:',
    options: ['Using HTTP instead of HTTPS for sensitive traffic', 'Running too many browser tabs', 'Using a wired connection', 'Having a long password'],
    correctIndex: 0,
    explanation: 'Unencrypted HTTP exposes all data including credentials to anyone who can see the traffic.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What does patching the kernel on Linux or Windows require that application patches typically do not?',
    options: ['A code review', 'A system reboot to load the new kernel into memory', 'Disabling antivirus first', 'Network disconnection'],
    correctIndex: 1,
    explanation: 'Kernel patches require a reboot because the new kernel must be loaded into memory to take effect.',
    difficulty: Difficulty.medium,
  ),

];