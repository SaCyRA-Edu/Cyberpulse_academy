import '../lesson_model.dart';

const List<Lesson> linuxSecurityLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'Linux: The Invisible OS Running the World',
    isAudio: true,
    sections: [
      LessonSection(
        heading: 'Linux Security — Audio Introduction',
        body:
            'This is an audio lesson. Sit back and listen. A transcript '
            'is shown below.',
      ),
      LessonSection(
        heading: 'You\'re Already Using It',
        body:
            'If you\'ve sent an email, loaded a website, used a streaming '
            'service, or made a payment online in the last 24 hours — '
            'you\'ve interacted with a Linux system. Linux runs roughly '
            '96 percent of the world\'s web servers, nearly all cloud '
            'infrastructure, the majority of supercomputers, and most '
            'Android devices. It\'s the engine behind the modern internet, '
            'and almost nobody outside the tech industry knows it exists.',
      ),
      LessonSection(
        heading: 'Why It\'s Worth Learning to Secure',
        body:
            'Because Linux runs so much critical infrastructure, '
            'attackers spend enormous effort targeting it. A compromised '
            'Linux server can mean a data breach, ransomware encrypting '
            'databases, a botnet node sending millions of spam emails, '
            'or a cryptominer silently consuming cloud resources at '
            'your expense. The consequences of a poorly secured Linux '
            'server are often larger than a single endpoint compromise.',
      ),
      LessonSection(
        heading: 'The Unix Philosophy',
        body:
            'Linux inherits the Unix security model: everything is a '
            'file, every process runs as a user, and the kernel '
            'mediates all access. This simplicity is a strength — '
            'the model is predictable and auditable. But it also means '
            'that small misconfigurations can have large consequences. '
            'A file with the wrong permissions, a service running as '
            'root unnecessarily, a forgotten user account — any of '
            'these can be the foothold that turns into a full compromise.',
      ),
      LessonSection(
        heading: 'What This Module Covers',
        body:
            'You\'ll learn how Linux manages users and permissions, '
            'how to configure SSH securely, how to set up firewalls, '
            'what mandatory access control adds on top of standard '
            'permissions, how to read logs effectively, and how to '
            'harden a system from a fresh install to something you can '
            'put on the internet with confidence.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Linux Security Architecture',
    sections: [
      LessonSection(
        heading: 'The Linux Security Model',
        body:
            'Linux security is built on Unix foundations: everything is a '
            'file, every process runs as a user, and the kernel mediates '
            'all access. The kernel\'s Linux Security Module (LSM) '
            'framework supports pluggable security systems like SELinux '
            'and AppArmor sitting above standard DAC permissions.',
      ),
      LessonSection(
        heading: 'DAC vs. MAC',
        bullets: [
          'DAC (Discretionary Access Control) — the standard Unix permissions model; owners set permissions on their own files',
          'MAC (Mandatory Access Control) — the kernel enforces a system-wide policy regardless of what the file owner requests; SELinux and AppArmor implement MAC',
        ],
      ),
      LessonSection(
        heading: 'Kernel Security Features',
        bullets: [
          'Namespaces — process isolation (used by containers)',
          'cgroups — resource limitation per process group',
          'seccomp — system call filtering (limits what syscalls a process can make)',
          'Capabilities — fine-grained privilege splitting (rather than all-or-nothing root)',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'Users, Groups & the Root Account',
    sections: [
      LessonSection(
        heading: 'The User Model',
        body:
            'Every process runs as a user (UID). UID 0 is root — '
            'unrestricted access to the entire system. All other UIDs '
            'are constrained by file permissions, capabilities, and MAC '
            'policies.',
      ),
      LessonSection(
        heading: 'Key Files',
        bullets: [
          '/etc/passwd — username, UID, GID, home directory, shell (no passwords here in modern systems)',
          '/etc/shadow — hashed passwords and aging info; readable only by root',
          '/etc/group — group memberships',
          '/etc/sudoers — sudo access configuration; always edit with visudo',
        ],
      ),
      LessonSection(
        heading: 'Service Accounts',
        body:
            'System services should run as dedicated, low-privilege service '
            'accounts (e.g. www-data for Apache), not as root. If a '
            'service is compromised, the attacker inherits only that '
            'account\'s permissions — not full system control.',
      ),
    ],
  ),

  Lesson(
    title: 'File Permissions, SUID, SGID & Sticky Bit',
    sections: [
      LessonSection(
        heading: 'Standard Permissions',
        body:
            'Read (r=4), write (w=2), execute (x=1) for owner, group, '
            'and others. Octal notation: chmod 750 sets rwxr-x---. '
            'List permissions with ls -la.',
      ),
      LessonSection(
        heading: 'Special Permission Bits',
        bullets: [
          'SUID (Set User ID) — executes as the file\'s owner rather than the invoking user; dangerous if set on custom scripts (attackers hunt for writable SUID binaries)',
          'SGID (Set Group ID) — executes with the file\'s group permissions; files created in an SGID directory inherit the directory\'s group',
          'Sticky bit — on directories, allows only the file owner (or root) to delete files; used on /tmp to prevent users deleting each other\'s files',
        ],
      ),
      LessonSection(
        heading: 'Finding Dangerous SUID Files',
        body:
            'A key hardening step is auditing all SUID binaries on a '
            'system: `find / -perm -4000 -type f 2>/dev/null`. Compare '
            'against a known-good baseline. Any unexpected SUID binary '
            '— especially a shell or custom script — is a critical '
            'finding.',
      ),
    ],
  ),

  Lesson(
    title: 'sudo Configuration & Privilege Management',
    sections: [
      LessonSection(
        heading: 'How sudo Works',
        body:
            'sudo runs a command as another user (typically root) based '
            'on rules in /etc/sudoers. It logs every invocation to '
            '/var/log/auth.log, creating an audit trail of privileged '
            'actions with the invoking user\'s identity.',
      ),
      LessonSection(
        heading: '/etc/sudoers Syntax',
        body:
            'Format: `user ALL=(ALL) ALL` means the user can run any '
            'command as any user from any host. The most secure approach '
            'is the opposite: grant only specific commands to specific '
            'users for specific purposes. Use `visudo` to edit — it '
            'validates syntax before saving.',
      ),
      LessonSection(
        heading: 'Common Misconfigurations',
        bullets: [
          'NOPASSWD — allows sudo without entering a password; risky if the session is unattended',
          'Wildcard abuse — a rule like `sudo /usr/bin/vim *` may allow full root shell via vim\'s shell command',
          'Overly broad grants — giving everyone full sudo defeats the purpose entirely',
          'World-writable scripts in sudo rules — an attacker who can write to a sudo-listed script gets root',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'SSH Hardening & Key Management',
    sections: [
      LessonSection(
        heading: 'The sshd_config Hardening Checklist',
        bullets: [
          'PermitRootLogin no — never allow direct root SSH login',
          'PasswordAuthentication no — disable passwords in favour of keys',
          'PubkeyAuthentication yes — enable key-based login',
          'AllowUsers or AllowGroups — whitelist which accounts can SSH in',
          'MaxAuthTries 3 — limit brute-force attempts per connection',
          'Protocol 2 — SSH protocol 1 is broken; ensure only protocol 2 is used',
          'ClientAliveInterval / ClientAliveCountMax — disconnect idle sessions',
        ],
      ),
      LessonSection(
        heading: 'Key Management Best Practices',
        bullets: [
          'Use Ed25519 or RSA 4096-bit keys; avoid older key types',
          'Always use a passphrase on private keys',
          'Audit ~/.ssh/authorized_keys on all servers regularly for unexpected entries',
          'Rotate keys when staff leave or when compromise is suspected',
        ],
      ),
      LessonSection(
        heading: 'Fail2Ban',
        body:
            'Fail2Ban watches SSH logs and automatically bans IPs that '
            'exceed a failed-login threshold. It significantly reduces '
            'noise from automated brute-force scanners.',
      ),
    ],
  ),

  Lesson(
    title: 'iptables, nftables & ufw',
    sections: [
      LessonSection(
        heading: 'The Linux Firewall Stack',
        body:
            'Linux\'s kernel firewall is netfilter. User-space tools '
            'configure it: iptables (traditional), nftables (modern '
            'replacement), ufw (Ubuntu\'s simple front-end), and '
            'firewalld (Red Hat\'s zone-based front-end).',
      ),
      LessonSection(
        heading: 'A Sensible Default Policy',
        bullets: [
          'Default INPUT policy: DROP — deny all inbound unless explicitly allowed',
          'Default FORWARD policy: DROP',
          'Default OUTPUT policy: ACCEPT (or restrict for high-security systems)',
          'Explicit ACCEPT rules only for required services (e.g. port 22 from management IPs, port 443)',
        ],
      ),
      LessonSection(
        heading: 'ufw Quick Reference',
        bullets: [
          'ufw enable — activate the firewall',
          'ufw default deny incoming — block all inbound by default',
          'ufw allow ssh — permit SSH (port 22)',
          'ufw allow from 10.0.0.0/8 to any port 443 — restrict HTTPS to an internal range',
          'ufw status verbose — view current rules',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'SELinux & AppArmor: Mandatory Access Control',
    sections: [
      LessonSection(
        heading: 'Why Standard Permissions Are Not Enough',
        body:
            'DAC permissions say what a user can do to a file. MAC '
            'enforces policy on what a specific program can do — '
            'regardless of what user it runs as. If a web server is '
            'compromised, MAC can prevent it from reading /etc/passwd '
            'or connecting to unexpected network ports, even though '
            'it runs as root.',
      ),
      LessonSection(
        heading: 'SELinux',
        body:
            'SELinux (Red Hat, CentOS, Fedora) assigns security contexts '
            '(labels) to every process and file. Policy rules define '
            'what contexts can interact with what. Three modes: '
            'Enforcing (policy enforced), Permissive (logs violations '
            'but doesn\'t block), Disabled (off). Never run production '
            'systems in Permissive or Disabled mode.',
      ),
      LessonSection(
        heading: 'AppArmor',
        body:
            'AppArmor (Ubuntu, Debian) uses profiles per-application '
            'defining exactly what files and capabilities each program '
            'can access. Easier to manage than SELinux for many teams; '
            'profiles are path-based rather than label-based.',
      ),
    ],
  ),

  Lesson(
    title: 'System Logging, journald & Audit Framework',
    sections: [
      LessonSection(
        heading: 'Key Log Locations',
        bullets: [
          '/var/log/auth.log (Debian/Ubuntu) or /var/log/secure (RHEL/CentOS) — SSH, sudo, su events',
          '/var/log/syslog or /var/log/messages — general system events',
          'journalctl — queries systemd\'s journal (structured, binary log)',
          '/var/log/audit/audit.log — Linux Audit Framework output (requires auditd)',
        ],
      ),
      LessonSection(
        heading: 'Linux Audit Framework (auditd)',
        body:
            'auditd is a kernel-level auditing system that can log any '
            'system call, file access, or network event. Rules are added '
            'via auditctl or /etc/audit/rules.d/. Useful audit rules '
            'include watching changes to /etc/passwd, /etc/sudoers, and '
            'execution of privileged commands.',
      ),
      LessonSection(
        heading: 'Centralizing Logs',
        body:
            'Local logs can be tampered with or deleted by an attacker '
            'who achieves root. Forward logs in near-real-time to a '
            'remote syslog server or SIEM using rsyslog, syslog-ng, '
            'or Filebeat. Once an event is on a remote server, the '
            'attacker can\'t retroactively erase it.',
      ),
    ],
  ),

  Lesson(
    title: 'Intrusion Detection: Tripwire & AIDE',
    sections: [
      LessonSection(
        heading: 'File Integrity Monitoring (FIM)',
        body:
            'FIM tools take a cryptographic baseline of important system '
            'files and compare the live system against it periodically. '
            'Any unexpected change to a monitored file — /bin/ls, '
            '/etc/passwd, a web application binary — triggers an alert. '
            'Attackers who modify system files to persist or escalate '
            'privileges leave a detectable footprint.',
      ),
      LessonSection(
        heading: 'AIDE & Tripwire',
        bullets: [
          'AIDE (Advanced Intrusion Detection Environment) — open-source FIM; builds a database from a baseline snapshot then checks for drift',
          'Tripwire — commercial and open-source versions; more configurable policy; widely used in enterprise Linux environments',
          'Both should run regularly (daily via cron) and report to a SIEM or email alert',
        ],
      ),
      LessonSection(
        heading: 'Host-Based IDS Limitations',
        body:
            'A sophisticated attacker with root can disable or corrupt '
            'the FIM tool itself. The baseline database should be stored '
            'on read-only or write-once media, and FIM checks should '
            'run from a separate monitoring system where possible.',
      ),
    ],
  ),

  Lesson(
    title: 'Patch Management & System Hardening',
    sections: [
      LessonSection(
        heading: 'Package Management & Security Updates',
        bullets: [
          'apt (Debian/Ubuntu) — `apt update && apt upgrade` fetches and installs updates',
          'dnf/yum (RHEL/CentOS/Fedora) — `dnf update --security` applies security-only patches',
          'unattended-upgrades (Ubuntu) — automatically installs security patches without manual intervention',
          'Kernel updates require a reboot — track patched-but-unrebooted systems in your inventory',
        ],
      ),
      LessonSection(
        heading: 'Attack Surface Reduction',
        bullets: [
          'Remove packages not actively needed: `apt remove telnet ftp rsh-server`',
          'Disable unused services: `systemctl disable --now service-name`',
          'Remove world-writable files and SUID binaries not in the known-good baseline',
          'Disable IPv6 if not in use (removes a commonly overlooked attack surface)',
          'Set a login banner (/etc/issue.net) and configure session timeouts',
        ],
      ),
      LessonSection(
        heading: 'CIS Benchmarks',
        body:
            'The Center for Internet Security publishes free, detailed '
            'hardening guides for every major Linux distribution — '
            'covering hundreds of specific configuration recommendations '
            'with rationale for each. Using a CIS Benchmark as a '
            'checklist is one of the fastest ways to harden a new system.',
      ),
    ],
  ),

  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'What does the SUID bit on an executable do?',
        options: [
          'Prevents the file from being deleted',
          'Runs the executable with the file owner\'s privileges rather than the invoking user\'s',
          'Makes the file world-readable',
          'Encrypts the file at rest',
        ],
        correctIndex: 1,
        explanation: 'SUID runs the binary as its owner — dangerous if that owner is root and the binary can be exploited.',
      ),
      QuizQuestion(
        question: 'Why should you always edit /etc/sudoers with visudo?',
        options: [
          'visudo makes the file executable',
          'visudo validates syntax before saving, preventing a broken sudoers file that could lock out admin access',
          'visudo encrypts the file',
          'Direct editing is not permitted by the filesystem',
        ],
        correctIndex: 1,
        explanation: 'A syntax error in sudoers can prevent all sudo access — visudo catches it before saving.',
      ),
      QuizQuestion(
        question: 'What is the key difference between DAC and MAC?',
        options: [
          'DAC is faster; MAC is slower',
          'DAC lets owners set permissions on their own files; MAC enforces a system-wide policy regardless of owner wishes',
          'MAC is only available on Windows',
          'DAC and MAC are the same thing',
        ],
        correctIndex: 1,
        explanation: 'MAC enforces a kernel-level policy that overrides what individual users/owners can configure.',
      ),
      QuizQuestion(
        question: 'Which SSH configuration option should be set to "no" to '
            'significantly reduce brute-force attack risk?',
        options: [
          'Protocol',
          'X11Forwarding',
          'PasswordAuthentication',
          'TCPKeepAlive',
        ],
        correctIndex: 2,
        explanation: 'Disabling password authentication forces key-based login, which cannot be brute-forced in the traditional sense.',
      ),
      QuizQuestion(
        question: 'The ufw command "ufw default deny incoming" does what?',
        options: [
          'Blocks all outbound traffic',
          'Disables the firewall',
          'Sets the default policy to drop all inbound connections not explicitly allowed',
          'Allows all inbound traffic from the local network',
        ],
        correctIndex: 2,
        explanation: 'A default deny-incoming policy is the standard secure baseline for a Linux server firewall.',
      ),
      QuizQuestion(
        question: 'Where would you look first to see recent failed SSH '
            'login attempts on an Ubuntu server?',
        options: [
          '/etc/sshd_config',
          '/var/log/auth.log',
          '/etc/passwd',
          '/proc/net/tcp',
        ],
        correctIndex: 1,
        explanation: '/var/log/auth.log records authentication events including SSH failures on Debian/Ubuntu systems.',
      ),
      QuizQuestion(
        question: 'What does a File Integrity Monitor (FIM) tool do?',
        options: [
          'Encrypts important system files',
          'Compares live system files against a cryptographic baseline to detect unexpected changes',
          'Blocks unauthorized file downloads',
          'Compresses log files automatically',
        ],
        correctIndex: 1,
        explanation: 'FIM tools detect when important files (binaries, configs) are modified, which can indicate a compromise.',
      ),
    ],
  ),
];
