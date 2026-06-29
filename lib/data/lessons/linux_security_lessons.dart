import '../lesson_model.dart';

const List<Lesson> linuxSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Linux Users & Groups',
    sections: [
      LessonSection(
        heading: 'The User Model',
        body:
            'Every process and file on a Linux system is tied to a user. '
            'The root user has unrestricted access to the entire system — '
            'which is exactly why day-to-day work should be done as a '
            'regular user, not as root.',
      ),
      LessonSection(
        heading: 'Groups',
        body:
            'Groups let administrators assign permissions to multiple '
            'users at once, rather than configuring access user by user. '
            'A user can belong to several groups simultaneously.',
      ),
      LessonSection(
        heading: 'Key Files',
        bullets: [
          '/etc/passwd — basic user account information',
          '/etc/shadow — stores hashed passwords (not readable by regular users)',
          '/etc/group — group membership information',
        ],
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'File Permissions',
    sections: [
      LessonSection(
        heading: 'Read, Write, Execute',
        body:
            'Linux permissions are built from three actions — read (r), '
            'write (w), and execute (x) — applied separately to the file\'s '
            'owner, its group, and everyone else.',
      ),
      LessonSection(
        heading: 'Reading Permission Strings',
        body:
            'A permission string like "rwxr-xr--" breaks down into three '
            'sets of three: the owner can read/write/execute, the group '
            'can read/execute, and everyone else can only read.',
      ),
      LessonSection(
        heading: 'Key Commands',
        bullets: [
          'chmod — changes permissions (e.g. chmod 750 file)',
          'chown — changes the file\'s owner and/or group',
          'ls -l — lists files along with their permissions',
        ],
      ),
      LessonSection(
        heading: 'A Security Principle',
        body:
            'Permissions should be set as tightly as possible while still '
            'letting the system function — a world-writable file or an '
            'unnecessarily executable script is an easy target.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'sudo & Privilege Escalation',
    sections: [
      LessonSection(
        heading: 'Why sudo Exists',
        body:
            'sudo lets an authorized user run a specific command with '
            'elevated (often root) privileges, without logging in as root '
            'directly. This keeps a clear audit trail of who ran what, '
            'and when.',
      ),
      LessonSection(
        heading: 'Configuring sudo Access',
        body:
            'The /etc/sudoers file (edited safely with the visudo command) '
            'defines exactly which users or groups can run which commands '
            'as which user — allowing very fine-grained control instead of '
            'all-or-nothing root access.',
      ),
      LessonSection(
        heading: 'A Common Risk',
        body:
            'Granting overly broad sudo access (or disabling root entirely '
            'but giving everyone full sudo rights) defeats the purpose — '
            'it just recreates unrestricted root access under a different '
            'name. Grant only what\'s needed.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'SSH Security',
    sections: [
      LessonSection(
        heading: 'What is SSH?',
        body:
            'SSH (Secure Shell) is the standard way to remotely and '
            'securely administer Linux systems — encrypting the entire '
            'session, including any passwords or commands typed.',
      ),
      LessonSection(
        heading: 'Key-Based Authentication',
        body:
            'Instead of logging in with a password, SSH supports key '
            'pairs: a private key kept secret on your machine, and a '
            'public key placed on the server. This is generally more '
            'secure than passwords because the private key never travels '
            'over the network and is far harder to brute-force.',
      ),
      LessonSection(
        heading: 'Common SSH Hardening Steps',
        bullets: [
          'Disable direct root login over SSH',
          'Disable password authentication in favor of key-based login',
          'Change the default port (22) to reduce automated scanning noise — a minor speed bump, not a real defense on its own',
          'Use a firewall to restrict which IP addresses can connect',
          'Keep the SSH server software patched',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Linux Firewalls',
    sections: [
      LessonSection(
        heading: 'How Linux Filters Traffic',
        body:
            'Linux\'s firewall capability is built into the kernel '
            '(netfilter), and is usually managed through a friendlier '
            'front-end tool rather than configured directly.',
      ),
      LessonSection(
        heading: 'Common Front-End Tools',
        bullets: [
          'ufw (Uncomplicated Firewall) — simple syntax, popular on Ubuntu/Debian systems',
          'firewalld — zone-based management, common on Red Hat/Fedora systems',
          'iptables/nftables — the lower-level tools these front-ends configure under the hood',
        ],
      ),
      LessonSection(
        heading: 'A Sound Default Policy',
        body:
            'A common, sensible baseline is to deny all inbound traffic by '
            'default, then explicitly allow only the specific ports and '
            'services a system actually needs to expose.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Logging & Auditing',
    sections: [
      LessonSection(
        heading: 'Where Linux Keeps Logs',
        bullets: [
          '/var/log/auth.log (or /var/log/secure) — authentication attempts and sudo usage',
          '/var/log/syslog (or /var/log/messages) — general system activity',
          'journalctl — queries logs managed by systemd, common on modern distributions',
        ],
      ),
      LessonSection(
        heading: 'What to Watch For',
        bullets: [
          'Repeated failed SSH login attempts from the same source',
          'Unexpected new user accounts or sudo grants',
          'Cron jobs or services that weren\'t set up by an administrator',
        ],
      ),
      LessonSection(
        heading: 'Centralizing Logs',
        body:
            'On a single machine, local logs are useful — but in larger '
            'environments, logs are typically forwarded to a central '
            'logging system or SIEM so they can be correlated across many '
            'systems and aren\'t lost if a machine is compromised or wiped.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Patching & System Hardening',
    sections: [
      LessonSection(
        heading: 'Package Management',
        body:
            'Linux distributions manage software through package managers '
            '(such as apt, yum/dnf, or pacman), which also handle security '
            'updates. Keeping packages current is one of the highest-value '
            'habits in Linux security.',
      ),
      LessonSection(
        heading: 'Reducing the Attack Surface',
        bullets: [
          'Remove or disable services that aren\'t actually needed',
          'Avoid running unnecessary software with root privileges',
          'Keep the kernel and all installed packages up to date',
        ],
      ),
      LessonSection(
        heading: 'Mandatory Access Control',
        body:
            'Beyond standard permissions, tools like SELinux (common on '
            'Red Hat-based systems) and AppArmor (common on Ubuntu) add an '
            'extra enforcement layer — restricting exactly what each '
            'program is allowed to do, even if it\'s running with elevated '
            'privileges.',
      ),
    ],
  ),

  // 8 ------------------------------------------------------------------ Quiz
  Lesson(
    title: 'Final Quiz',
    quiz: [
      QuizQuestion(
        question: 'Why is it recommended to avoid doing day-to-day work '
            'as the root user?',
        options: [
          'Root accounts run slower',
          'Root has unrestricted access, so mistakes or compromises have much greater impact',
          'Root accounts cannot connect to the internet',
          'It is required by most package managers',
        ],
        correctIndex: 1,
        explanation:
            'Because root has unrestricted access, any error or '
            'compromise while using it can affect the entire system.',
      ),
      QuizQuestion(
        question: 'In a permission string like "rwxr-xr--", what access '
            'does "everyone else" (the last three characters) have?',
        options: [
          'Read, write, and execute',
          'Read and execute',
          'Read only',
          'No access at all',
        ],
        correctIndex: 2,
        explanation:
            'The final three characters represent "others" — here, '
            '"r--" means read-only access.',
      ),
      QuizQuestion(
        question: 'What is the main benefit of using sudo instead of '
            'logging in directly as root?',
        options: [
          'It disables all logging',
          'It allows fine-grained, auditable elevated access without sharing the root password',
          'It is required to install any software',
          'It automatically encrypts the file system',
        ],
        correctIndex: 1,
        explanation:
            'sudo provides controlled, logged access to specific elevated '
            'commands without requiring direct root login.',
      ),
      QuizQuestion(
        question: 'Why is SSH key-based authentication generally '
            'considered more secure than password authentication?',
        options: [
          'Keys are shorter than passwords',
          'The private key never travels over the network and is far harder to brute-force',
          'Keys never need to be stored anywhere',
          'It removes the need for a firewall',
        ],
        correctIndex: 1,
        explanation:
            'The private key stays on the client and isn\'t transmitted, '
            'making key-based login much more resistant to brute-force '
            'attacks than passwords.',
      ),
      QuizQuestion(
        question: 'What is a sensible default firewall policy on a Linux '
            'server?',
        options: [
          'Allow all inbound traffic by default',
          'Deny all inbound traffic by default, then explicitly allow what\'s needed',
          'Disable the firewall entirely for performance',
          'Only filter outbound traffic',
        ],
        correctIndex: 1,
        explanation:
            'Denying everything by default and explicitly allowing only '
            'required services minimizes the attack surface.',
      ),
      QuizQuestion(
        question: 'Which log file would typically show failed SSH login '
            'attempts on a Debian/Ubuntu system?',
        options: [
          '/var/log/auth.log',
          '/etc/passwd',
          '/etc/sudoers',
          '/var/log/dpkg.log',
        ],
        correctIndex: 0,
        explanation:
            '/var/log/auth.log records authentication-related events, '
            'including SSH login attempts.',
      ),
      QuizQuestion(
        question: 'What do SELinux and AppArmor both provide?',
        options: [
          'Disk encryption',
          'An additional layer of mandatory access control restricting what programs can do',
          'A graphical desktop environment',
          'A package manager replacement',
        ],
        correctIndex: 1,
        explanation:
            'Both are mandatory access control systems that restrict '
            'program behavior beyond standard file permissions.',
      ),
      QuizQuestion(
        question: 'Why is keeping packages updated considered a '
            'high-value security habit on Linux?',
        options: [
          'It changes the system\'s IP address',
          'It frequently includes fixes for known security vulnerabilities',
          'It is required to use sudo',
          'It disables unused services automatically',
        ],
        correctIndex: 1,
        explanation:
            'Package updates regularly include patches for known '
            'vulnerabilities that attackers actively look for.',
      ),
    ],
  ),
];
