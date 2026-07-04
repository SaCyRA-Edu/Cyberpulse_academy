import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> linuxSecurityLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'Linux: The Invisible OS Running the World',
    difficulty: LessonDifficulty.beginner,
    isAudio: true,
    estimatedMinutes: 6,
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
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'A Model Built on Simplicity',
        body:
            'Linux security rests on a small set of foundational ideas '
            'inherited directly from Unix, and understanding them '
            'thoroughly makes almost everything else in this module '
            'click into place. Every single object on the system — a '
            'text file, a directory, a running process, even a network '
            'socket or a hardware device — is represented as a file. '
            'Every process runs under the identity of some specific user. '
            'And the kernel, sitting beneath everything else, mediates '
            'every single access decision, with no exceptions.',
      ),
      LessonSection(
        heading: 'DAC vs. MAC: Two Very Different Kinds of Control',
        bullets: [
          'DAC (Discretionary Access Control) — the traditional Unix permissions model, where the owner of a file gets to decide who else can read, write, or execute it',
          'MAC (Mandatory Access Control) — a kernel-enforced policy layered on top of DAC that overrides what any individual file owner might otherwise want to allow; SELinux and AppArmor both implement MAC',
        ],
      ),
      LessonSection(
        heading: 'Why the Distinction Actually Matters',
        body:
            'DAC alone has a fundamental limitation: if a process gets '
            'compromised while running as a particular user, it inherits '
            'every permission that user\'s account has, full stop. MAC '
            'exists specifically to close this gap. Even if an attacker '
            'fully compromises a web server process running as root, a '
            'properly configured MAC policy can still prevent that '
            'compromised process from reading unrelated files like '
            '/etc/passwd or opening unexpected network connections — '
            'because the kernel enforces the MAC policy independently of '
            'whatever DAC permissions would otherwise technically allow.',
      ),
      LessonSection(
        heading: 'Modern Kernel Isolation Features',
        bullets: [
          'Namespaces — isolate what a process can see: its own view of the process list, network interfaces, and filesystem mounts; this is the fundamental technology underlying containers',
          'cgroups (control groups) — limit and account for the resources (CPU, memory, disk I/O) a process or group of processes is allowed to consume',
          'seccomp — restricts which specific system calls a process is permitted to make, shrinking the kernel attack surface available to that process',
          'Capabilities — split root\'s traditionally all-or-nothing power into dozens of individual, separately grantable privileges, so a process can be given exactly the one specific elevated capability it needs rather than full root',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Users, Groups & the Root Account',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Root: Total Power, Total Responsibility',
        body:
            'Every process and file on a Linux system is tied to a '
            'user, and one user in particular — root, with user ID 0 — '
            'has unrestricted access to essentially everything on the '
            'system, bypassing standard permission checks entirely. This '
            'is exactly why day-to-day work should never be done '
            'logged in directly as root: a mistake made as root, or '
            'malware that manages to execute in a root session, has the '
            'same unrestricted reach as any legitimate root '
            'administrative action.',
      ),
      LessonSection(
        heading: 'Groups: Managing Permissions Without Repetition',
        body:
            'Groups let an administrator grant a specific permission set '
            'once to a group, then simply add or remove individual users '
            'from that group as needed, rather than configuring access '
            'rights one user at a time. A single user account can belong '
            'to multiple groups simultaneously, inheriting the combined '
            'permissions of every group they\'re a member of.',
      ),
      LessonSection(
        heading: 'The Key Files Behind the Scenes',
        bullets: [
          '/etc/passwd — basic account information: username, user ID, group ID, home directory, and default shell; readable by anyone, but no longer stores actual passwords on modern systems',
          '/etc/shadow — the actual hashed passwords and password aging information, readable only by root for obvious security reasons',
          '/etc/group — defines which users belong to which groups',
        ],
      ),
      LessonSection(
        heading: 'Service Accounts: Root Isn\'t Always the Answer',
        body:
            'System services — web servers, databases, mail servers — '
            'should almost always run under dedicated, low-privilege '
            'service accounts specifically created for that purpose '
            '(such as www-data for a web server), rather than running as '
            'root. If an attacker manages to compromise a service '
            'running under a restricted service account, they inherit '
            'only that account\'s limited permissions — a meaningfully '
            'different, far less catastrophic outcome than inheriting '
            'full, unrestricted root access.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'File Permissions, SUID, SGID & Sticky Bit',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Reading a Standard Permission String',
        body:
            'Every Linux file carries three permission types — read (r), '
            'write (w), and execute (x) — applied separately to three '
            'distinct categories: the file\'s owner, its group, and '
            'everyone else. A permission string like "rwxr-xr--" breaks '
            'down into three groups of three characters: the owner can '
            'read, write, and execute; the group can read and execute '
            'but not write; and everyone else can only read. The chmod '
            'command changes these permissions, and its octal shorthand '
            '(chmod 750, for example) is a compact way to express the '
            'exact same rwxr-x--- combination.',
      ),
      LessonSection(
        heading: 'SUID: A Permission That Deserves Real Scrutiny',
        body:
            'The Set User ID (SUID) bit, when applied to an executable '
            'file, causes it to run with the permissions of the file\'s '
            'owner rather than the permissions of whoever actually '
            'launched it. This exists for legitimate reasons — the '
            'passwd command, for instance, needs SUID root privileges '
            'to modify the protected /etc/shadow file on behalf of an '
            'ordinary user changing their own password. But an '
            'unexpected or custom SUID binary, particularly one owned '
            'by root, is one of the very first things attackers hunt for '
            'once they\'ve gained any initial foothold, since exploiting '
            'a flaw in such a binary can provide an immediate path to '
            'full root privileges.',
      ),
      LessonSection(
        heading: 'SGID and the Sticky Bit',
        bullets: [
          'SGID on an executable — runs with the file\'s group permissions rather than the invoking user\'s group',
          'SGID on a directory — any new file created inside automatically inherits that directory\'s group, useful for shared team directories',
          'Sticky bit — applied to a directory, restricts file deletion so that only the file\'s own owner (or root) can remove it, even if other users technically have write access to the directory; this is exactly why /tmp is safe for many users to share without them deleting each other\'s files',
        ],
      ),
      LessonSection(
        heading: 'A Practical Auditing Habit',
        body:
            'A genuinely useful, low-effort security habit is running '
            'find / -perm -4000 -type f periodically to list every '
            'SUID binary currently present on a system, then comparing '
            'that list against a known, trusted baseline. Any unexpected '
            'addition — particularly a shell interpreter or a custom '
            'script suddenly carrying SUID root — is a serious red flag '
            'worth investigating immediately, since it may indicate an '
            'attacker has already established a stealthy path to '
            'privilege escalation.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'sudo Configuration & Privilege Management',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Why sudo Exists At All',
        body:
            'sudo allows an authorized, specifically designated user to '
            'run a particular command with elevated privileges — '
            'typically as root — without ever needing to log in directly '
            'as root or know the root password. Every sudo invocation is '
            'logged to /var/log/auth.log, creating a clear, attributable '
            'audit trail showing exactly who ran what elevated command '
            'and precisely when they ran it.',
      ),
      LessonSection(
        heading: 'The /etc/sudoers File and visudo',
        body:
            'Access rules are defined in /etc/sudoers, and this file '
            'should always be edited using the visudo command rather '
            'than a regular text editor, because visudo validates the '
            'file\'s syntax before saving it. A single typo in a '
            'directly-edited sudoers file can leave the entire system '
            'without any working sudo access whatsoever — potentially '
            'locking every administrator out of the elevated access they '
            'need to even fix the mistake.',
      ),
      LessonSection(
        heading: 'Fine-Grained Rules Beat All-or-Nothing Access',
        body:
            'A rule as broad as "user ALL=(ALL) ALL" grants a user the '
            'ability to run absolutely any command as any user on any '
            'host — effectively equivalent to full root access. The far '
            'more secure and genuinely useful approach is granting '
            'access to only the specific commands a particular role '
            'actually needs — a database administrator might be granted '
            'sudo rights only to restart the database service and read '
            'its logs, nothing more.',
      ),
      LessonSection(
        heading: 'Common sudo Misconfigurations to Watch For',
        bullets: [
          'NOPASSWD entries — allow sudo commands to run without any password prompt at all; convenient for automation, but risky on an unattended, unlocked session',
          'Wildcard abuse — a rule like sudo /usr/bin/vim * can often be exploited to spawn a full root shell using vim\'s built-in shell command feature, completely defeating the intended restriction',
          'Overly broad grants — handing out effectively unrestricted sudo access "to be safe" simply recreates the exact unrestricted-root problem sudo was designed to solve in the first place',
          'World-writable scripts referenced in a sudo rule — if any regular user can modify a script that\'s allowed to run via sudo, they\'ve effectively been handed root access through that script',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'SSH Hardening & Key Management',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'The sshd_config Hardening Checklist',
        bullets: [
          'PermitRootLogin no — never allow direct root login over SSH; force administrators to log in as a named user and use sudo, preserving an accountable audit trail',
          'PasswordAuthentication no — disable password-based login entirely in favor of key-based authentication',
          'PubkeyAuthentication yes — explicitly enable key-based login',
          'AllowUsers or AllowGroups — maintain an explicit allowlist of exactly which accounts are permitted to connect via SSH at all',
          'MaxAuthTries 3 — cap the number of authentication attempts permitted per connection, slowing down brute-force attempts',
          'ClientAliveInterval / ClientAliveCountMax — automatically disconnect idle sessions that have stopped responding',
        ],
      ),
      LessonSection(
        heading: 'Why Key-Based Login Is Genuinely Stronger',
        body:
            'With key-based authentication, a private key never travels '
            'across the network at all — it stays permanently on the '
            'client machine, and only cryptographic proof of possessing '
            'it is ever transmitted. This makes brute-forcing SSH access '
            'effectively impractical compared to guessing a password, '
            'since there\'s no password to guess in the first place — an '
            'attacker would instead need to somehow steal the actual '
            'private key file itself.',
      ),
      LessonSection(
        heading: 'Key Management Best Practices',
        bullets: [
          'Prefer Ed25519 keys, or RSA at 4096 bits if Ed25519 isn\'t supported by a given system',
          'Always protect a private key with a strong passphrase, so a stolen key file alone isn\'t immediately usable',
          'Regularly audit every server\'s ~/.ssh/authorized_keys file for unexpected or unrecognized entries',
          'Immediately rotate and revoke keys whenever an employee with access leaves, or whenever a key\'s compromise is even suspected',
        ],
      ),
      LessonSection(
        heading: 'Fail2Ban: Automatically Blocking Repeat Offenders',
        body:
            'Fail2Ban continuously monitors authentication logs and '
            'automatically bans, at the firewall level, any IP address '
            'that exceeds a configured threshold of failed login '
            'attempts within a given time window. It won\'t stop a '
            'genuinely determined, patient attacker distributing '
            'attempts across many different IP addresses, but it '
            'dramatically reduces the constant background noise '
            'generated by the automated scanning bots that relentlessly '
            'probe internet-facing SSH ports around the clock.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'iptables, nftables & ufw',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'One Kernel Firewall, Several Front-Ends',
        body:
            'The Linux kernel\'s actual packet-filtering engine is '
            'called netfilter, and several different user-space tools '
            'exist to configure it, each aimed at a different balance of '
            'simplicity versus granular control: iptables (the '
            'traditional, long-standing tool), nftables (its modern '
            'successor with cleaner syntax and better performance), ufw '
            '(Uncomplicated Firewall, popular on Ubuntu and Debian for '
            'its simplicity), and firewalld (Red Hat\'s zone-based '
            'management approach).',
      ),
      LessonSection(
        heading: 'A Sensible Default Policy',
        body:
            'A well-established, secure baseline for any Linux server\'s '
            'firewall configuration: set the default policy to drop all '
            'inbound traffic that isn\'t explicitly permitted, then add '
            'narrow, specific rules allowing only the exact ports and '
            'services that server genuinely needs to expose. This "deny '
            'by default, explicitly allow what\'s needed" approach '
            'ensures that any service accidentally left running — one '
            'nobody remembered to properly configure or intended to '
            'expose — stays blocked by default rather than silently '
            'reachable from the internet.',
      ),
      LessonSection(
        heading: 'A Quick ufw Reference',
        bullets: [
          'ufw default deny incoming — sets the secure baseline described above',
          'ufw allow ssh — permits SSH traffic on its standard port',
          'ufw allow from 10.0.0.0/8 to any port 443 — restricts HTTPS access to only an internal network range',
          'ufw enable — activates the firewall with the currently configured rule set',
          'ufw status verbose — displays every currently active rule for review',
        ],
      ),
      LessonSection(
        heading: 'Firewalls Are One Layer, Not the Whole Defense',
        body:
            'A correctly configured host firewall blocks unwanted '
            'network access very effectively, but it does nothing '
            'whatsoever to protect against a vulnerability in a service '
            'that\'s deliberately, legitimately exposed — like a flaw in '
            'the web server software itself listening on the permitted '
            'port 443. This is exactly why firewalling is always '
            'described as one layer within a broader defense-in-depth '
            'strategy, working alongside patching, hardening, and '
            'monitoring rather than replacing any of them.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'SELinux & AppArmor: Mandatory Access Control',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Going Beyond What Standard Permissions Can Express',
        body:
            'Standard Unix permissions answer the question "what can '
            'this user do to this file?" Mandatory Access Control '
            'answers a fundamentally different, more specific question: '
            '"what is this particular program allowed to do, regardless '
            'of which user is running it?" If a web server process is '
            'compromised through a vulnerability, MAC can still prevent '
            'that exact same process from reading /etc/passwd or opening '
            'an unexpected outbound network connection — even if the web '
            'server happens to be running as root, and even though root '
            'would normally have unrestricted access to do exactly that.',
      ),
      LessonSection(
        heading: 'SELinux: Label-Based, Comprehensive Policy',
        body:
            'SELinux, common on Red Hat, CentOS, and Fedora systems, '
            'assigns a security context — essentially a descriptive '
            'label — to every single process and file on the system. '
            'Detailed policy rules then define precisely which contexts '
            'are permitted to interact with which other contexts. '
            'SELinux operates in one of three distinct modes: Enforcing '
            '(the policy is actively applied and violations are '
            'blocked), Permissive (violations are only logged for review '
            'but never actually blocked), and Disabled (SELinux plays no '
            'role at all). Running any genuinely production system in '
            'Permissive or Disabled mode defeats the entire purpose of '
            'having SELinux installed in the first place.',
      ),
      LessonSection(
        heading: 'AppArmor: Simpler, Path-Based Confinement',
        body:
            'AppArmor, the default on Ubuntu and Debian, takes a '
            'generally simpler approach: rather than a comprehensive '
            'label-based system covering the entire OS, it uses '
            'per-application profiles that reference specific file '
            'paths and system capabilities directly. This tends to be '
            'noticeably easier for smaller teams to understand, author, '
            'and maintain compared to writing full SELinux policy, at '
            'some cost in the granularity SELinux offers.',
      ),
      LessonSection(
        heading: 'Why This Extra Layer Is Worth the Complexity',
        body:
            'Both SELinux and AppArmor add real operational overhead — '
            'writing correct policies, debugging why a legitimate action '
            'was unexpectedly blocked, and maintaining those policies as '
            'applications change over time. But the payoff is genuinely '
            'significant: MAC is frequently what stops an initial '
            'application-level compromise from escalating into a full '
            'system takeover, containing an attacker\'s foothold to '
            'exactly the resources their compromised process was already '
            'authorized to touch — and nothing more.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'System Logging, journald & Audit Framework',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Where Linux Actually Keeps Its Logs',
        bullets: [
          '/var/log/auth.log (Debian/Ubuntu) or /var/log/secure (RHEL/CentOS) — authentication events: SSH logins, sudo usage, and failed access attempts',
          '/var/log/syslog or /var/log/messages — general, system-wide event logging',
          'journalctl — queries systemd\'s structured, binary journal, standard on most modern distributions',
          '/var/log/audit/audit.log — detailed output from the Linux Audit Framework, when auditd is installed and configured',
        ],
      ),
      LessonSection(
        heading: 'The Linux Audit Framework (auditd)',
        body:
            'auditd operates at the kernel level and can log virtually '
            'any system call, file access, or command execution you '
            'configure it to watch — a level of granularity far beyond '
            'what standard authentication and syslog logging provides on '
            'their own. Rules are added through auditctl for immediate '
            'effect, or defined persistently in '
            '/etc/audit/rules.d/ for rules that need to survive a '
            'reboot. Commonly monitored targets include any modification '
            'to /etc/passwd or /etc/sudoers, and execution of specific '
            'high-privilege commands.',
      ),
      LessonSection(
        heading: 'Why Local Logs Alone Aren\'t Trustworthy Evidence',
        body:
            'An attacker who successfully gains root access on a Linux '
            'system can simply edit or delete the very logs that would '
            'otherwise reveal their activity — local logs are only as '
            'trustworthy as the system they live on remains uncompromised. '
            'The standard mitigation is forwarding logs continuously, in '
            'near real time, to a separate remote syslog server or SIEM '
            'platform using tools like rsyslog, syslog-ng, or Filebeat. '
            'Once a log entry has already left the originating machine, '
            'a subsequent compromise of that machine can no longer '
            'retroactively erase the evidence sitting safely on the '
            'remote system.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Intrusion Detection: Tripwire & AIDE',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'File Integrity Monitoring: Detecting Silent Changes',
        body:
            'File Integrity Monitoring (FIM) tools take a cryptographic '
            'snapshot of important system files at a known-good moment, '
            'then periodically re-check the live system against that '
            'baseline, flagging any unexpected change. Attackers who '
            'modify system binaries or configuration files to maintain '
            'persistent access, or to escalate privileges, leave a '
            'detectable fingerprint in exactly this way — a file that '
            'quietly changed when nobody authorized a legitimate update.',
      ),
      LessonSection(
        heading: 'Setting Up a FIM Baseline',
        body:
            'Establishing effective file integrity monitoring follows a '
            'straightforward, repeatable process: build an initial '
            'baseline of known-good file hashes on a freshly configured, '
            'trusted system; run periodic scheduled checks comparing the '
            'live system against that baseline; and investigate and '
            'alert on any discrepancy that turns up.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Baseline', 'Scheduled Scan', 'Compare', 'Alert'],
          caption:
              'A FIM tool repeats this cycle continuously, comparing the '
              'live system against the trusted baseline.',
        ),
      ),
      LessonSection(
        heading: 'AIDE and Tripwire',
        bullets: [
          'AIDE (Advanced Intrusion Detection Environment) — a free, open-source FIM tool that builds a baseline database and then checks for drift against it on a scheduled basis',
          'Tripwire — available in both open-source and commercial versions, offering more flexible, configurable policy; widely deployed in larger enterprise environments',
          'Either tool should run on a regular, automated schedule (typically via cron) and report any findings to a SIEM platform or via email alert rather than requiring someone to manually check the output',
        ],
      ),
      LessonSection(
        heading: 'A Genuine Limitation Worth Knowing',
        body:
            'A sufficiently capable attacker who achieves root access '
            'can potentially disable the FIM tool itself, or even '
            'corrupt its baseline database to hide their own changes '
            'from future comparisons. The strongest mitigation is '
            'storing that baseline database on read-only or write-once '
            'media that even a fully compromised system can\'t modify, '
            'and ideally running the actual comparison checks from a '
            'separate, independent monitoring system entirely — one the '
            'attacker never gained access to in the first place.',
      ),
    ],
  ),

  // 11 --------------------------------------------------------------------
  Lesson(
    title: 'Patch Management & System Hardening',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Package Managers Are Also Your Security Update Mechanism',
        bullets: [
          'apt (Debian/Ubuntu) — "apt update && apt upgrade" fetches package lists and installs available updates',
          'dnf/yum (RHEL/CentOS/Fedora) — "dnf update --security" applies specifically security-related patches',
          'unattended-upgrades (Ubuntu) — automatically installs security patches on a schedule without requiring manual intervention',
          'Kernel updates specifically require a reboot to actually take effect — tracking which systems have a patched kernel installed but haven\'t yet rebooted into it is an easy gap to overlook',
        ],
      ),
      LessonSection(
        heading: 'Shrinking the Attack Surface',
        bullets: [
          'Remove packages that aren\'t genuinely needed: "apt remove telnet ftp rsh-server" eliminates several historically insecure services in one step',
          'Disable any service that isn\'t actively required: "systemctl disable --now service-name" both stops it immediately and prevents it restarting on the next boot',
          'Periodically audit for world-writable files and unexpected SUID binaries that fall outside your known-good baseline',
          'Disable IPv6 entirely if it\'s genuinely not in use — it\'s a commonly overlooked parallel attack surface that\'s easy to forget about while focused on securing IPv4',
        ],
      ),
      LessonSection(
        heading: 'CIS Benchmarks: A Detailed, Ready-Made Checklist',
        body:
            'The Center for Internet Security publishes free, extremely '
            'detailed hardening benchmarks covering every major Linux '
            'distribution, specifying hundreds of individual '
            'configuration recommendations along with a clear rationale '
            'for each one. Working through a published CIS Benchmark '
            'systematically, item by item, is one of the fastest and '
            'most thorough ways to harden a freshly deployed system, and '
            'is far more comprehensive than attempting to recall best '
            'practices purely from memory.',
      ),
      LessonSection(
        heading: 'Hardening Is a Practice, Not a One-Time Event',
        body:
            'A server hardened perfectly on the day it was deployed can '
            'still drift out of compliance over time — a new service '
            'gets installed for a legitimate reason and never properly '
            'restricted, a firewall rule gets loosened temporarily for '
            'troubleshooting and never tightened back up. Periodic '
            're-auditing against your hardening baseline, not just a '
            'one-time hardening pass at initial deployment, is what '
            'keeps a system\'s actual security posture matching its '
            'intended one over the full course of its operational '
            'lifetime.',
      ),
    ],
  ),

  // 12 --------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
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
          'DAC lets owners set permissions on their own files while MAC enforces a system-wide policy regardless of owner wishes',
          'MAC is only available on Windows',
          'DAC and MAC are the same thing',
        ],
        correctIndex: 1,
        explanation: 'MAC enforces a kernel-level policy that overrides what individual users/owners can configure.',
      ),
      QuizQuestion(
        question: 'Which SSH configuration option should be set to "no" to significantly reduce brute-force attack risk?',
        options: ['Protocol', 'X11Forwarding', 'PasswordAuthentication', 'TCPKeepAlive'],
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
        question: 'Where would you look first to see recent failed SSH login attempts on an Ubuntu server?',
        options: ['/etc/sshd_config', '/var/log/auth.log', '/etc/passwd', '/proc/net/tcp'],
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
      QuizQuestion(
        question: 'Linux capabilities allow:',
        options: [
          'Full root access',
          'Fine-grained privilege splitting giving a process only specific elevated rights it needs',
          'Read-only filesystem access',
          'Automatic security updates',
        ],
        correctIndex: 1,
        explanation: 'Capabilities break root privileges into individual units, granting only what a process actually needs.',
      ),
      QuizQuestion(
        question: 'The /etc/shadow file stores:',
        options: [
          'Basic user account info',
          'Hashed passwords and aging information readable only by root',
          'Group memberships',
          'SSH public keys',
        ],
        correctIndex: 1,
        explanation: '/etc/shadow holds password hashes and is readable only by root for security.',
      ),
      QuizQuestion(
        question: 'auditd allows you to:',
        options: [
          'Automatically patch packages',
          'Log kernel-level system calls, file access, and network events for auditing',
          'Configure AppArmor profiles',
          'Manage cron jobs',
        ],
        correctIndex: 1,
        explanation: 'The Linux Audit Framework records granular system activity for security monitoring and compliance.',
      ),
      QuizQuestion(
        question: 'A world-writable script listed in a sudo rule is dangerous because:',
        options: [
          'It runs slower',
          'Any user who can write to that script can modify it to execute arbitrary code as root',
          'It disables logging',
          'It breaks SELinux',
        ],
        correctIndex: 1,
        explanation: 'A writable sudo-listed script is effectively a path to root for any user who can write it.',
      ),
      QuizQuestion(
        question: 'Fail2Ban is used to:',
        options: [
          'Encrypt disk partitions',
          'Automatically ban IPs that exceed failed login thresholds reducing brute-force noise',
          'Configure firewall zones',
          'Monitor DNS queries',
        ],
        correctIndex: 1,
        explanation: 'Fail2Ban watches logs and blocks repeat offenders automatically.',
      ),
      QuizQuestion(
        question: 'CIS Benchmarks provide:',
        options: [
          'Vendor-specific product licenses',
          'Free detailed hardening checklists for major Linux distributions',
          'Automated patch deployment',
          'Commercial SIEM rules',
        ],
        correctIndex: 1,
        explanation: 'CIS Benchmarks are authoritative, vendor-neutral hardening guides for specific systems.',
      ),
      QuizQuestion(
        question: 'The sticky bit on a directory means:',
        options: [
          'The directory cannot be renamed',
          'Only the file owner or root can delete files in that directory',
          'Files inherit the directory group',
          'The directory is hidden',
        ],
        correctIndex: 1,
        explanation: 'The sticky bit prevents users from deleting each other\'s files in shared directories like /tmp.',
      ),
      QuizQuestion(
        question: 'Removing unnecessary packages from a Linux server is an example of:',
        options: ['Performance tuning', 'Attack surface reduction', 'Log management', 'Network segmentation'],
        correctIndex: 1,
        explanation: 'Every installed package is potential attack surface — removing unused ones reduces risk.',
      ),
      QuizQuestion(
        question: 'SELinux contexts label:',
        options: [
          'Files only',
          'Every process and file, enabling policy rules to control what can interact with what',
          'Network interfaces only',
          'User passwords',
        ],
        correctIndex: 1,
        explanation: 'SELinux assigns security contexts to all objects enabling mandatory policy enforcement.',
      ),
      QuizQuestion(
        question: 'Why should Linux services run as dedicated service accounts rather than root?',
        options: [
          'Service accounts are faster',
          'A compromised service inherits only that account\'s permissions, not full system control',
          'Root cannot run background services',
          'Service accounts use less memory',
        ],
        correctIndex: 1,
        explanation: 'Least privilege for services limits the blast radius if a service is exploited.',
      ),
      QuizQuestion(
        question: 'SSH key-based authentication is more secure than passwords primarily because:',
        options: [
          'Keys are shorter to type',
          'The private key never travels over the network and cannot be brute-forced like a password',
          'Keys never expire',
          'Keys are stored in plaintext',
        ],
        correctIndex: 1,
        explanation: 'The private key stays on the client and its cryptographic strength resists brute force.',
      ),
      QuizQuestion(
        question: 'Running "find / -perm -4000" on a Linux system reveals:',
        options: [
          'All world-writable files',
          'All SUID binaries on the system',
          'All running processes',
          'All open network ports',
        ],
        correctIndex: 1,
        explanation: 'This command finds all SUID binaries — a key step in security auditing.',
      ),
      QuizQuestion(
        question: 'Centralized log forwarding via rsyslog or Filebeat is important because:',
        options: [
          'It makes logs load faster',
          'Local logs can be deleted by an attacker with root but remote logs are already preserved',
          'It compresses logs automatically',
          'It is required for GDPR compliance',
        ],
        correctIndex: 1,
        explanation: 'Remote log forwarding preserves evidence that a local attacker could otherwise destroy.',
      ),
      QuizQuestion(
        question: 'AppArmor profiles are:',
        options: [
          'Based on SELinux contexts',
          'Per-application, path-based rules defining what files and capabilities each program can access',
          'Network firewall rules',
          'Cron job definitions',
        ],
        correctIndex: 1,
        explanation: 'AppArmor confines individual applications using path-based profiles.',
      ),
      QuizQuestion(
        question: 'Disabling a service with "systemctl disable --now" achieves:',
        options: [
          'Deletes the service binary',
          'Stops the service immediately and prevents it starting on future reboots',
          'Removes the service account',
          'Locks the service configuration file',
        ],
        correctIndex: 1,
        explanation: 'Disabling unused services immediately and persistently reduces the attack surface.',
      ),
      QuizQuestion(
        question: 'PermitRootLogin no in sshd_config means:',
        options: [
          'Root cannot log in locally',
          'Root cannot SSH in directly, forcing use of a regular account and sudo',
          'Root password is disabled',
          'Root account is deleted',
        ],
        correctIndex: 1,
        explanation: 'Blocking direct root SSH login forces use of auditable per-user accounts with sudo.',
      ),
      QuizQuestion(
        question: 'nftables is:',
        options: [
          'A database management tool',
          'The modern replacement for iptables for Linux firewall configuration',
          'A network monitoring framework',
          'An SSH alternative',
        ],
        correctIndex: 1,
        explanation: 'nftables is the modern Linux kernel firewall framework replacing the older iptables.',
      ),
      QuizQuestion(
        question: 'The order of volatility principle in forensics applied to Linux means:',
        options: [
          'Patch in order of severity',
          'Collect memory and running process state before disk images',
          'Delete old logs first',
          'Update packages before investigating',
        ],
        correctIndex: 1,
        explanation: 'More volatile evidence like RAM contents disappears first and must be captured before less volatile disk data.',
      ),
    ],
  ),
];
