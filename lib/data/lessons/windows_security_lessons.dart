import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> windowsSecurityLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'Why Windows Is the World\'s Most Targeted OS',
    difficulty: LessonDifficulty.beginner,
    isAudio: true,
    estimatedMinutes: 6,
    sections: [
      LessonSection(
        heading: 'Windows Security — Audio Introduction',
        body:
            'This is an audio lesson. Sit back and listen. A transcript '
            'is shown below.',
      ),
      LessonSection(
        heading: 'The Numbers Tell the Story',
        body:
            'Somewhere between 70 and 75 percent of the world\'s desktop '
            'computers run Windows. In enterprise environments, that '
            'number is even higher. Banks, hospitals, government agencies, '
            'schools, factories — almost all of them run Windows on the '
            'machines their employees use every day. This is exactly '
            'why attackers spend so much effort targeting it.',
      ),
      LessonSection(
        heading: 'It\'s Not That Windows Is Bad',
        body:
            'There\'s a common misconception that Windows is inherently '
            'less secure than other operating systems. That\'s not really '
            'true. Windows is targeted more because there are more '
            'Windows machines to attack — the economics favor it. A piece '
            'of malware that works on Windows potentially works on '
            'hundreds of millions of machines. The same malware targeting '
            'a niche OS reaches a tiny fraction of that. Attackers go '
            'where the targets are.',
      ),
      LessonSection(
        heading: 'The Defender\'s Advantage',
        body:
            'Here\'s the flip side of that equation: because Windows is '
            'so widely targeted, it\'s also one of the most thoroughly '
            'studied platforms from a defensive standpoint. The tooling '
            'is mature, the documentation is extensive, and the security '
            'community has decades of experience hardening it. The '
            'controls you\'ll learn in this module — user account '
            'management, Group Policy, Windows Defender, BitLocker, '
            'event log monitoring — are battle-tested and genuinely '
            'effective when properly configured.',
      ),
      LessonSection(
        heading: 'What You\'ll Learn',
        body:
            'Over the lessons ahead you\'ll understand how Windows '
            'decides who can do what, how attackers try to escalate '
            'their privileges, how to configure and monitor defenses, '
            'and how Active Directory — the identity backbone of most '
            'enterprise Windows environments — works and why protecting '
            'it is so critical. Let\'s get into it.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Security Architecture',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'A Layered Foundation',
        body:
            'Windows security is built as a series of layers, each one '
            'assuming the layer above it might eventually be tricked or '
            'compromised. At the very bottom sits the kernel, which '
            'controls hardware access and enforces process isolation. '
            'Above that runs user mode, where your applications actually '
            'execute. Sitting on top of both is a collection of security '
            'subsystems — most importantly the Security Reference '
            'Monitor (SRM) — that make every single access control '
            'decision on the system: can this process open that file? '
            'Can this user modify that registry key? Every one of those '
            'questions gets answered by the SRM, consistently, every '
            'time.',
      ),
      LessonSection(
        heading: 'Integrity Levels: A Second Dimension of Trust',
        body:
            'Beyond standard file and folder permissions, every process '
            'in modern Windows also runs at an integrity level: '
            'Untrusted, Low, Medium, High, or System. The rule is simple '
            'but powerful — a process running at a lower integrity level '
            'cannot write to objects at a higher integrity level, '
            'regardless of what the file permissions would otherwise '
            'allow. This is precisely why your web browser\'s rendering '
            'engine, which handles untrusted content from the internet, '
            'runs at Low integrity: even if an attacker manages to '
            'exploit a bug in the browser, that compromised process is '
            'still blocked from writing to most of the file system, '
            'because it simply doesn\'t have the integrity level to do so.',
      ),
      LessonSection(
        heading: 'The Security Accounts Manager (SAM)',
        body:
            'Local account credentials are stored as cryptographic '
            'hashes in the registry, in a protected structure called the '
            'SAM database, located at HKLM\\SAM. While Windows is '
            'running, the kernel actively protects this database from '
            'being read directly, even by an administrator account. '
            'However, attackers who obtain offline access to a machine — '
            'through volume shadow copies, a stolen disk image, or tools '
            'like Mimikatz that extract credentials from memory — can '
            'attempt to crack the hashes or use them directly in a '
            '"pass-the-hash" attack without ever needing the plaintext '
            'password.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'User Accounts, Groups & UAC',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'The Account Types You\'ll Encounter',
        bullets: [
          'Standard User — can run most applications and adjust personal settings, but cannot install software system-wide or modify protected configuration',
          'Administrator — has full local control over the system; should never be used for everyday tasks like browsing the web or checking email',
          'Built-in accounts (default Administrator, Guest) — well-known targets that should be disabled or tightly restricted in any managed environment',
          'Service accounts — run background services and should hold only the minimal permissions that specific service actually needs, with no interactive login capability at all',
        ],
      ),
      LessonSection(
        heading: 'User Account Control (UAC)',
        body:
            'UAC is the familiar prompt that appears whenever an action '
            'requires administrator-level rights, and it exists as a '
            'genuine security boundary rather than a mere annoyance. '
            'Even when logged in as an administrator, most day-to-day '
            'operations run at Medium integrity by default; only actions '
            'explicitly elevated through a UAC prompt run at High '
            'integrity. This design specifically targets malware that '
            'tries to make silent system-level changes — without user '
            'awareness, a UAC-protected system forces that malware to '
            'either trigger a visible prompt (tipping off the user) or '
            'find a separate way to bypass UAC entirely, which is '
            'considerably harder than simply running with the rights the '
            'logged-in user already possesses.',
      ),
      LessonSection(
        heading: 'Least Privilege in Everyday Practice',
        body:
            'The security-recommended setup for virtually every Windows '
            'user is straightforward: maintain a standard user account '
            'for daily work, and use a completely separate administrator '
            'account only for the specific moments when elevated access '
            'is genuinely required, such as installing new software or '
            'changing system configuration. This single practice '
            'dramatically limits the blast radius of a compromised '
            'session — malware that infects a session running as a '
            'standard user simply cannot make the same system-wide '
            'changes that malware running as an administrator could.',
      ),
      LessonSection(
        heading: 'Groups: Managing Permissions at Scale',
        body:
            'Rather than assigning permissions to every individual user '
            'account one at a time, Windows lets administrators organize '
            'users into groups and assign permissions to the group as a '
            'whole. A new employee added to the "Finance" group '
            'automatically inherits every permission already granted to '
            'that group, and removing them from the group instantly '
            'revokes that access — far more manageable at scale than '
            'tracking individual permission grants across potentially '
            'thousands of employees.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'NTFS Permissions & File System Security',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Six Core NTFS Permissions',
        bullets: [
          'Full Control — read, write, delete, execute, change permissions, and take ownership of the file or folder',
          'Modify — read, write, delete, and execute, but cannot change permissions or take ownership',
          'Read & Execute — open and run files, or list a folder\'s contents and traverse into subfolders',
          'List Folder Contents — see what files and subfolders exist inside a folder',
          'Read — view a file\'s contents without modifying it',
          'Write — create new files or modify existing ones within the permitted scope',
        ],
      ),
      LessonSection(
        heading: 'Allow, Deny, and Which One Wins',
        body:
            'NTFS permissions can be explicitly set to either Allow or '
            'Deny for any given user or group. When both an Allow and a '
            'Deny entry apply to the same user for the same resource, '
            'Deny always takes precedence, regardless of which one was '
            'configured first or which group has broader Allow rights. '
            'This makes explicit Deny entries a powerful, precise tool '
            'for carving out exceptions — protecting one particularly '
            'sensitive folder from a specific group even when that group '
            'otherwise has broad access to the surrounding directory '
            'structure.',
      ),
      LessonSection(
        heading: 'Inheritance and Effective Permissions',
        body:
            'By default, files and subfolders inherit the permission '
            'settings of their parent folder, which is what makes it '
            'practical to manage permissions across deep, complex '
            'directory structures without configuring every single item '
            'individually. But because a user\'s actual access is the '
            'combined result of every group they belong to plus any '
            'explicit permissions set directly on them, the real, '
            'effective permission a specific user has on a specific '
            'resource can become genuinely difficult to predict just by '
            'looking at the visible settings. Windows provides an '
            '"Effective Access" tab in the Advanced Security Settings '
            'dialog specifically to calculate and display this combined '
            'result for any user you specify.',
      ),
      LessonSection(
        heading: 'Share Permissions vs. NTFS Permissions',
        body:
            'When a folder is accessed over the network rather than '
            'locally, two separate permission systems apply '
            'simultaneously: the share permissions configured when the '
            'folder was shared, and the underlying NTFS permissions on '
            'the folder itself. The more restrictive of the two always '
            'wins. Because managing two overlapping permission systems '
            'invites confusion and misconfiguration, a common and widely '
            'recommended hardening practice is to set share permissions '
            'to "Everyone: Full Control" and then manage all actual '
            'access control exclusively through the far more granular '
            'NTFS permissions underneath.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Active Directory Fundamentals',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'What Active Directory Actually Is',
        body:
            'Active Directory (AD) is Microsoft\'s identity and access '
            'management service for Windows-based networks, and it '
            'serves as the central nervous system for authentication, '
            'authorization, and policy across every machine and user in '
            'an organization\'s Windows environment. When an employee '
            'logs into any company laptop, it\'s AD that verifies their '
            'identity and determines what they\'re allowed to access.',
      ),
      LessonSection(
        heading: 'Key Structural Concepts',
        bullets: [
          'Domain — a logical grouping of users, computers, and resources that all share a common directory database and security policies',
          'Domain Controller (DC) — the server actually running AD, responsible for handling authentication requests and enforcing policy across the domain',
          'Organizational Units (OUs) — containers used to organize users, computers, and groups hierarchically, typically mirroring departmental or geographic structure',
          'Security Groups — collections of users or computers used for assigning permissions and applying Group Policy efficiently',
          'Forest — the broadest AD structure, comprising one or more domains that share a common schema and established trust relationships between them',
        ],
      ),
      LessonSection(
        heading: 'Why Domain Controllers Are the Ultimate Prize',
        body:
            'Compromising a domain controller doesn\'t just compromise '
            'one server — it effectively hands an attacker control over '
            'the entire environment, since every machine and user that '
            'trusts the domain inherits whatever trust decisions the '
            'compromised DC makes. This single fact drives an enormous '
            'amount of enterprise security architecture: domain '
            'controllers typically sit in their own highly restricted '
            'network tier, privileged AD accounts are protected far more '
            'aggressively than standard user accounts, and any activity '
            'touching a domain controller receives disproportionate '
            'monitoring attention compared to ordinary workstation '
            'activity.',
      ),
      LessonSection(
        heading: 'Group Policy: AD\'s Enforcement Arm',
        body:
            'Active Directory delivers most of its practical security '
            'value through Group Policy, which lets administrators push '
            'consistent configuration — password requirements, software '
            'restrictions, security settings, and much more — out to '
            'every machine and user in a domain automatically. This '
            'relationship between AD (providing identity and structure) '
            'and Group Policy (providing centralized enforcement) is '
            'explored in more depth in an upcoming lesson.',
      ),
    ],
  ),

  // 5b -------------------------------------------------------------------
  Lesson(
    title: 'Kerberos & Windows Authentication Protocols',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Why This Fills a Real Gap',
        body:
            'Earlier lessons mentioned pass-the-hash and pass-the-ticket '
            'attacks without fully explaining the authentication protocol '
            'those attacks actually target. Kerberos is the default '
            'authentication protocol in Active Directory environments, '
            'and understanding how it actually works — not just that it '
            'exists — is what lets you understand why certain attacks '
            'against it are possible and how specific defenses close '
            'those gaps.',
      ),
      LessonSection(
        heading: 'The Three Parties in Every Kerberos Exchange',
        bullets: [
          'The client — the user or service requesting access to a resource',
          'The Key Distribution Center (KDC) — runs on every domain controller, combining an Authentication Server and a Ticket Granting Server',
          'The resource server — the file share, database, or application the client actually wants to reach',
        ],
      ),
      LessonSection(
        heading: 'The Ticket Exchange, Step by Step',
        body:
            'When a user logs in, their machine sends an AS-REQ '
            '(Authentication Server Request) to the KDC, proving '
            'knowledge of the user\'s password without ever sending the '
            'password itself. The KDC responds with an AS-REP containing '
            'a Ticket Granting Ticket (TGT) — a time-limited credential '
            'proving the user already authenticated, valid for roughly '
            '10 hours by default. From that point on, whenever the user '
            'wants to access a specific resource, their machine presents '
            'the TGT to the KDC in a TGS-REQ (Ticket Granting Server '
            'Request) and receives back a TGS-REP containing a '
            'service-specific ticket, which is what actually gets '
            'presented to the resource server to gain access.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['AS-REQ', 'TGT Issued', 'TGS-REQ', 'Service Ticket', 'Access Granted'],
          caption:
              'The Kerberos ticket exchange — notice the password itself '
              'is never transmitted at any step after the initial login.',
        ),
      ),
      LessonSection(
        heading: 'Golden Tickets and Silver Tickets',
        body:
            'Kerberos tickets are protected by cryptographic signatures, '
            'but those signatures rely on secret keys stored on the '
            'domain controller. If an attacker manages to steal the '
            'KRBTGT account\'s password hash — the key used to sign every '
            'TGT in the entire domain — they can forge a "Golden '
            'Ticket": a completely valid-looking TGT for any user, '
            'including accounts that don\'t even exist, granting access '
            'that persists even after a compromised account\'s password '
            'is reset. A "Silver Ticket" is the more limited version, '
            'forged using a stolen service account password hash rather '
            'than the KRBTGT hash, granting access to only that specific '
            'service rather than the entire domain. Both attacks explain '
            'why the KRBTGT password is rotated twice, at minimum, '
            'following any suspected domain compromise — rotating it '
            'only once leaves the previous password\'s hash still valid '
            'for a window of time.',
      ),
      LessonSection(
        heading: 'Kerberos vs. NTLM',
        body:
            'NTLM is Windows\' older, weaker authentication protocol, '
            'kept around primarily for backward compatibility with '
            'systems and applications that don\'t support Kerberos. '
            'Unlike Kerberos\'s ticket-based design, NTLM relies on a '
            'challenge-response exchange built around the password '
            'hash itself, which is exactly why NTLM hashes — not '
            'Kerberos tickets — are the target of classic pass-the-hash '
            'attacks. Modern hardening guidance consistently recommends '
            'disabling NTLM wherever possible and monitoring for its '
            'continued use as a sign that some part of the environment '
            'still depends on legacy, weaker authentication.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Defender & Endpoint Detection',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Built-In, Not Bolted On',
        body:
            'Microsoft Defender Antivirus ships built directly into '
            'Windows 10, Windows 11, and Windows Server, providing '
            'real-time, cloud-assisted malware protection without '
            'requiring any third-party software purchase or '
            'installation. Its signature database updates multiple times '
            'daily, and its detection is significantly augmented by '
            'behavior-based analysis that can flag genuinely new, '
            'previously unseen threats based on how they behave rather '
            'than relying solely on matching a known signature.',
      ),
      LessonSection(
        heading: 'Key Protective Features',
        bullets: [
          'Real-time protection — scans files continuously as they\'re created, modified, or downloaded, rather than only during scheduled scans',
          'Cloud-delivered protection — checks suspicious, unrecognized files against Microsoft\'s continuously updated threat intelligence in near real time',
          'Tamper Protection — specifically prevents malware (or an attacker with local access) from disabling Defender itself through registry edits or command-line tools',
          'Controlled Folder Access — blocks unauthorized applications from modifying files within protected folders, directly countering ransomware\'s core behavior of mass file encryption',
          'Attack Surface Reduction (ASR) rules — block specific, well-documented attack techniques at the operating system level, such as Office applications spawning child processes',
        ],
      ),
      LessonSection(
        heading: 'Scaling Up: Microsoft Defender for Endpoint',
        body:
            'In enterprise environments, Defender is frequently paired '
            'with Microsoft Defender for Endpoint (MDE), which adds full '
            'EDR — Endpoint Detection and Response — capability. MDE '
            'gives security teams centralized visibility across every '
            'managed endpoint simultaneously, automated investigation of '
            'suspicious activity, and the ability to isolate a '
            'compromised machine or take other response actions '
            'remotely. Alerts generated by MDE typically feed directly '
            'into a SIEM platform, such as Microsoft Sentinel, for '
            'correlation alongside data from other parts of the '
            'environment.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Group Policy & Security Hardening',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'What Group Policy Objects Actually Do',
        body:
            'Group Policy Objects, universally known as GPOs, let '
            'administrators define a configuration once and apply it '
            'consistently to every targeted user and computer in a '
            'domain — from password complexity rules to screen lock '
            'timeouts to which software is permitted to run — without '
            'ever needing to touch each individual machine by hand. GPOs '
            'link to Active Directory\'s Organizational Units, meaning '
            'different departments or machine types can receive '
            'entirely different policy sets automatically, based purely '
            'on which OU they belong to.',
      ),
      LessonSection(
        heading: 'The Hardening Settings That Matter Most',
        bullets: [
          'Account lockout policy — automatically locks an account after a defined number of failed login attempts, directly blunting brute-force password attacks',
          'Password policy — enforces minimum length, complexity requirements, and maximum password age',
          'Audit policy — determines precisely which security events actually get logged, which directly determines what a SOC can later investigate',
          'Removable media restrictions — prevents USB drives from being used as a malware delivery mechanism or data exfiltration path',
          'AppLocker / Software Restriction Policies — allowlists specifically approved executables, blocking everything else by default rather than trying to blocklist every known-bad program individually',
          'Disabling legacy protocols — turning off outdated, weak protocols like NTLMv1, LM hash storage, and SMBv1, all of which carry well-documented vulnerabilities',
        ],
      ),
      LessonSection(
        heading: 'Starting From a Baseline Rather Than From Scratch',
        body:
            'Microsoft publishes free Security Baselines for every '
            'supported Windows version — essentially pre-built GPO '
            'templates that already encode Microsoft\'s own detailed '
            'hardening recommendations. Adopting a published baseline as '
            'a starting point, then adjusting individual settings to fit '
            'a specific organization\'s actual needs, is dramatically '
            'more efficient and less error-prone than attempting to '
            'build a complete hardening configuration entirely from '
            'first principles.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Windows Firewall',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 7,
    sections: [
      LessonSection(
        heading: 'A Firewall That Travels With Every Machine',
        body:
            'Windows Firewall with Advanced Security is a full-featured, '
            'host-based, stateful firewall built directly into every '
            'copy of Windows, capable of filtering both inbound and '
            'outbound traffic with granular control down to the '
            'individual application or port. Unlike a network firewall '
            'sitting at the perimeter, a host firewall travels with the '
            'device itself — protecting a laptop equally whether it\'s '
            'sitting inside the corporate office or connected to an '
            'entirely untrusted network somewhere else in the world.',
      ),
      LessonSection(
        heading: 'Network Profiles: Context-Aware Protection',
        bullets: [
          'Domain — automatically applied when the machine is connected to its corporate domain; typically the most permissive profile, allowing necessary management traffic',
          'Private — used for trusted networks like a home or small office; a balanced middle ground between usability and protection',
          'Public — automatically applied on untrusted networks such as hotels, airports, or coffee shops; the most restrictive profile by default, specifically designed to protect a device on a network full of unknown, potentially hostile devices',
        ],
      ),
      LessonSection(
        heading: 'Why a Host Firewall Matters Even Inside a Trusted Network',
        body:
            'It\'s tempting to assume that a device sitting safely behind '
            'a strong network perimeter firewall doesn\'t need its own '
            'individual protection as well. This assumption breaks down '
            'the moment any single device inside that perimeter is '
            'compromised — through phishing, a malicious USB drive, or a '
            'supply chain infection, for example. At that point, the '
            'network firewall provides zero additional protection, '
            'because the attacker is already inside the trusted network. '
            'Host firewall rules on every individual machine are '
            'precisely what stops that compromised device from freely '
            'reaching every other machine sitting on the same internal '
            'network, directly limiting lateral movement even after the '
            'perimeter has already been breached.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Event Logs, Auditing & Monitoring',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'The Three Core Windows Event Logs',
        bullets: [
          'Security — records logon and logoff events, account changes, permission modifications, and access attempts; the log a security investigator turns to first',
          'System — captures driver, service, and operating-system-level events',
          'Application — logs events generated by installed software applications rather than the operating system itself',
        ],
      ),
      LessonSection(
        heading: 'Event IDs Worth Memorizing',
        bullets: [
          '4624 — a successful logon, recording who logged in, when, and through what method',
          '4625 — a failed logon attempt; a sudden burst of these from one source is a classic brute-force signature',
          '4648 — a logon using explicit credentials, often an indicator of pass-the-hash or lateral movement activity',
          '4688 — creation of a new process, useful for tracking exactly what commands were executed and when',
          '4720 / 4732 — a new user account was created, or an account was added to a security group',
          '1102 / 4719 — the Security audit log itself was cleared; one of the strongest possible signals that an attacker is actively covering their tracks',
        ],
      ),
      LessonSection(
        heading: 'Why Logs Alone on a Single Machine Aren\'t Enough',
        body:
            'Local event logs are genuinely useful — but they share a '
            'fundamental weakness: an attacker who achieves '
            'administrator-level access on that same machine can simply '
            'delete or alter the very logs that would otherwise reveal '
            'their activity. This is exactly why enterprise environments '
            'forward logs continuously to a centralized platform using '
            'Windows Event Forwarding (WEF) or a dedicated SIEM agent. '
            'Once an event has already left the originating machine and '
            'landed on a separate, more tightly protected central '
            'system, a later compromise of the original machine can no '
            'longer retroactively erase that evidence.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Patch Management & WSUS',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Single Highest-ROI Security Activity',
        body:
            'It bears repeating because it\'s repeatedly proven true in '
            'practice: the overwhelming majority of successful attacks '
            'don\'t rely on some exotic, cutting-edge technique. They '
            'exploit known, publicly documented vulnerabilities that '
            'already have an available patch — one that simply hadn\'t '
            'been applied yet. Consistent, timely patch management '
            'remains one of the single highest-return security '
            'investments any organization can make, precisely because it '
            'closes off entire categories of attack that would otherwise '
            'require essentially no skill for an attacker to exploit.',
      ),
      LessonSection(
        heading: 'From Windows Update to Enterprise-Scale Orchestration',
        bullets: [
          'Windows Update — the built-in consumer-facing mechanism, delivering patches directly from Microsoft to individual machines',
          'WSUS (Windows Server Update Services) — an on-premises service that lets an organization centrally review, test, and approve patches before rolling them out fleet-wide, rather than letting every machine pull updates independently and unpredictably',
          'Microsoft Endpoint Configuration Manager (MECM/SCCM) — enterprise-grade orchestration for patching, software deployment, and compliance reporting across very large, complex fleets',
        ],
      ),
      LessonSection(
        heading: 'A Repeatable Patch Management Workflow',
        body:
            'Mature organizations follow a structured, repeating '
            'process for patching rather than applying updates '
            'haphazardly as they appear.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Identify', 'Test', 'Deploy', 'Verify'],
          caption:
              'A disciplined patch management cycle catches problems in '
              'a staging group before they reach the entire fleet.',
        ),
      ),
      LessonSection(
        heading: 'Balancing Speed Against Stability',
        body:
            'Critical, actively-exploited vulnerabilities — especially '
            'on systems directly exposed to the internet — should '
            'generally be patched within days, not weeks. At the same '
            'time, deploying every patch instantly and blindly across an '
            'entire production fleet carries real risk of its own: '
            'occasionally a patch introduces its own bugs or '
            'compatibility problems. Testing new patches against a small '
            'staging group before wide deployment, wherever practically '
            'feasible, catches most such issues before they can affect '
            'the whole organization. For any system that genuinely '
            'cannot be patched immediately — often due to compatibility '
            'constraints with critical legacy software — compensating '
            'controls, such as blocking the specific vulnerable port or '
            'service at the network level, provide interim protection '
            'until a proper patch can finally be applied.',
      ),
    ],
  ),

  // 11 --------------------------------------------------------------------
  Lesson(
    title: 'BitLocker & Credential Protection',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'BitLocker: Encrypting the Entire Drive',
        body:
            'BitLocker is Windows\' built-in full-disk encryption '
            'feature, encrypting an entire volume using strong AES '
            'encryption (128 or 256 bit, in XTS mode). The practical '
            'benefit is straightforward and significant: if a laptop '
            'protected by BitLocker is lost or stolen while powered off '
            'or locked, the data on it is completely unreadable to '
            'whoever now physically holds the device, unless they also '
            'possess the recovery key or the legitimate user\'s '
            'credentials. BitLocker works best paired with a TPM '
            '(Trusted Platform Module) chip, which seals the encryption '
            'key to that specific piece of hardware and can detect '
            'certain forms of physical tampering with the system.',
      ),
      LessonSection(
        heading: 'Credential Guard: Isolating Secrets From Memory Attacks',
        body:
            'Credential Guard uses virtualization-based security (VBS) '
            'to isolate sensitive stored credentials — NTLM password '
            'hashes and Kerberos tickets — inside a protected, isolated '
            'hypervisor partition that ordinary Windows processes, even '
            'ones running with administrator rights, cannot directly '
            'access. This directly and specifically counters '
            'pass-the-hash and pass-the-ticket attacks, since tools like '
            'Mimikatz that normally extract these credentials straight '
            'from regular system memory simply have nothing to find '
            'there anymore.',
      ),
      LessonSection(
        heading: 'LAPS: Ending the "Every Machine Shares the Same Password" Problem',
        body:
            'A surprisingly common and dangerous default in many '
            'organizations: every machine gets imaged with the identical '
            'local Administrator password, baked directly into the '
            'standard deployment image. The moment an attacker learns '
            'that one shared password — from any single compromised '
            'machine — they immediately have local administrator access '
            'to every other machine built from the same image. The '
            'Local Administrator Password Solution (LAPS) solves this '
            'directly by automatically generating a unique, randomly '
            'rotated local administrator password for every individual '
            'machine, storing each one securely in Active Directory '
            'where only specifically authorized administrators can '
            'retrieve it when genuinely needed.',
      ),
      LessonSection(
        heading: 'Recognizing the Limits of Any Single Control',
        body:
            'None of these three controls is a complete solution on its '
            'own, and understanding their specific limits matters as '
            'much as understanding what they protect. BitLocker protects '
            'data only when the device is powered off or locked — it '
            'does nothing to stop malware running on an already-unlocked '
            'system. Credential Guard protects stored credentials in '
            'memory, but does nothing if a user is directly phished into '
            'typing their password into a fake login page. LAPS solves '
            'password reuse across machines but says nothing about '
            'whether the passwords themselves are strong. This is '
            'exactly the kind of layered thinking — defense in depth — '
            'that the Capstone module later in this course builds into a '
            'complete framework.',
      ),
    ],
  ),

  // 11b -------------------------------------------------------------------
  Lesson(
    title: 'PowerShell Security & the Windows Registry',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'The Windows Registry: A Hierarchical Configuration Database',
        body:
            'The registry stores essentially all of Windows\' '
            'configuration — hardware settings, software configuration, '
            'user preferences, and security policy — organized into a '
            'hierarchy of keys and values, broadly similar in concept to '
            'a filesystem of folders and files. Understanding its '
            'structure matters directly for security because a huge '
            'number of persistence techniques, privilege escalation '
            'paths, and malware configuration changes happen entirely '
            'through registry edits, with no file ever touching disk.',
      ),
      LessonSection(
        heading: 'The Five Root Hives',
        bullets: [
          'HKEY_LOCAL_MACHINE (HKLM) — system-wide settings applying to every user on the machine; commonly abbreviated to just "HKLM" in security writeups',
          'HKEY_CURRENT_USER (HKCU) — settings specific to whichever user is currently logged in',
          'HKEY_USERS — contains the actual profile data for every user account that has ever logged into the machine, with HKCU simply being a live pointer into the currently logged-in user\'s section',
          'HKEY_CLASSES_ROOT — file association and COM object registration data',
          'HKEY_CURRENT_CONFIG — information about the current hardware profile',
        ],
      ),
      LessonSection(
        heading: 'Why Attackers Love the Registry',
        body:
            'A classic and still very common persistence technique adds '
            'an entry under '
            'HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run — any '
            'program listed there launches automatically every time the '
            'machine boots, with no need for a separate scheduled task '
            'or service. Because registry changes are fast, don\'t '
            'require writing a new file to disk, and blend in among '
            'thousands of legitimate entries, they\'re a favorite target '
            'for both persistence and for disabling security tools — '
            'some malware directly edits the registry keys controlling '
            'whether Windows Defender\'s real-time protection is enabled.',
      ),
      LessonSection(
        heading: 'PowerShell Execution Policy: A Speed Bump, Not a Security Boundary',
        body:
            'PowerShell\'s execution policy (Restricted, AllSigned, '
            'RemoteSigned, Unrestricted) controls whether scripts are '
            'allowed to run at all, and if so, whether they need a '
            'digital signature. It\'s important to understand this is a '
            'convenience feature to prevent accidental script execution, '
            'not a genuine security boundary — it can be trivially '
            'bypassed by an attacker who already has code execution, '
            'for instance by piping script contents directly into '
            'PowerShell rather than executing a script file. Relying on '
            'execution policy alone as a defense is a common and '
            'significant misunderstanding.',
      ),
      LessonSection(
        heading: 'The Real PowerShell Defenses',
        bullets: [
          'AMSI (Antimalware Scan Interface) — lets antivirus and EDR products inspect PowerShell script content in memory, even content that\'s deliberately obfuscated, right before it executes',
          'Script Block Logging — records the full, de-obfuscated content of every PowerShell command executed on a system, one of the single highest-value log sources during an investigation involving PowerShell',
          'Constrained Language Mode — restricts PowerShell to a safe subset of its full functionality, blocking direct access to .NET types and Win32 APIs that a script would otherwise be able to call directly',
          'Just Enough Administration (JEA) — lets administrators expose only a narrow, specific set of PowerShell commands to a given role, rather than full unrestricted PowerShell access',
        ],
      ),
      LessonSection(
        heading: 'Why This Matters So Much in Practice',
        body:
            'PowerShell is simultaneously one of the most powerful '
            'legitimate administrative tools on Windows and one of the '
            'most heavily abused tools by attackers, precisely because '
            'it\'s installed by default, extremely capable, and can '
            'execute code entirely from memory without ever writing a '
            'file to disk for antivirus to scan. Modern detection '
            'strategy has shifted accordingly — rather than trying to '
            'block PowerShell outright, which breaks legitimate '
            'administration, security teams focus heavily on logging '
            'and inspecting exactly what PowerShell actually executes, '
            'which is exactly what AMSI and Script Block Logging '
            'together enable.',
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
        question: 'What do Windows integrity levels prevent?',
        options: [
          'Remote logins',
          'Lower-integrity processes from writing to higher-integrity objects',
          'Admins from creating accounts',
          'Antivirus from scanning system files',
        ],
        correctIndex: 1,
        explanation: 'Integrity levels contain what a compromised low-privilege process can do to the rest of the system.',
      ),
      QuizQuestion(
        question: 'In NTFS a Deny entry does what when it conflicts with an Allow?',
        options: ['Allow wins', 'Deny wins and always overrides Allow', 'They cancel out', 'First entry set wins'],
        correctIndex: 1,
        explanation: 'Explicit Deny always overrides Allow in NTFS permissions.',
      ),
      QuizQuestion(
        question: 'Why is the Domain Controller the highest-priority protection target in a Windows environment?',
        options: [
          'It stores all file shares',
          'Compromising it gives control over every machine and user in the domain',
          'It runs antivirus for the network',
          'It controls internet access',
        ],
        correctIndex: 1,
        explanation: 'The DC is the trust root — whoever controls AD controls the entire Windows environment.',
      ),
      QuizQuestion(
        question: 'Which Defender feature specifically addresses ransomware?',
        options: ['SmartScreen', 'Controlled Folder Access', 'Tamper Protection', 'Network Inspection System'],
        correctIndex: 1,
        explanation: 'Controlled Folder Access blocks unauthorized processes from modifying protected folders.',
      ),
      QuizQuestion(
        question: 'Event ID 4625 repeated hundreds of times from one source most likely indicates:',
        options: [
          'A user changing their password',
          'A Group Policy update',
          'A brute-force attack against an account',
          'Antivirus updating signatures',
        ],
        correctIndex: 2,
        explanation: 'Many rapid failed logon events (4625) from one source is a brute-force signature.',
      ),
      QuizQuestion(
        question: 'What problem does LAPS solve?',
        options: [
          'All machines sharing the same local administrator password',
          'Users forgetting their domain password',
          'Weak GPO enforcement',
          'Slow Windows Update',
        ],
        correctIndex: 0,
        explanation: 'LAPS generates unique rotating local admin passwords per machine preventing lateral movement.',
      ),
      QuizQuestion(
        question: 'Credential Guard uses what technology to protect stored credentials?',
        options: [
          'BitLocker encryption',
          'Virtualization-based security isolating credentials in a protected hypervisor partition',
          'A secondary hard drive',
          'The Windows Firewall',
        ],
        correctIndex: 1,
        explanation: 'Credential Guard uses VBS to keep credentials out of reach of tools like Mimikatz.',
      ),
      QuizQuestion(
        question: 'Microsoft Security Baselines are:',
        options: [
          'A list of approved antivirus products',
          'Pre-configured GPO templates incorporating Microsoft hardening recommendations',
          'Factory reset configurations',
          'Minimum hardware requirements for Windows',
        ],
        correctIndex: 1,
        explanation: 'Microsoft Security Baselines are ready-to-deploy GPO hardening templates.',
      ),
      QuizQuestion(
        question: 'UAC exists to:',
        options: [
          'Speed up application launches',
          'Require approval before system-level changes run, preventing silent malware escalation',
          'Replace the need for antivirus',
          'Log every keypress',
        ],
        correctIndex: 1,
        explanation: 'UAC creates a security boundary requiring explicit approval for privileged actions.',
      ),
      QuizQuestion(
        question: 'The SAM database stores:',
        options: ['Encryption keys', 'Local account credential hashes', 'Group Policy settings', 'DNS records'],
        correctIndex: 1,
        explanation: 'SAM stores local account password hashes protected by the kernel while Windows is running.',
      ),
      QuizQuestion(
        question: 'When should the built-in Administrator account be disabled?',
        options: [
          'Never',
          'In most managed environments where dedicated admin accounts exist instead',
          'Only on servers',
          'Only when the machine is offline',
        ],
        correctIndex: 1,
        explanation: 'The default Administrator account is a well-known target and should be disabled in managed environments.',
      ),
      QuizQuestion(
        question: 'WSUS is used for:',
        options: [
          'Wireless security scanning',
          'Centrally controlling and deploying Windows patches across a fleet',
          'User account management',
          'DNS configuration',
        ],
        correctIndex: 1,
        explanation: 'WSUS lets organizations test and approve patches before rolling them out to all machines.',
      ),
      QuizQuestion(
        question: 'Active Directory enables:',
        options: [
          'Wireless network configuration',
          'Centralized identity authentication and policy management across a Windows domain',
          'File compression',
          'Hardware inventory only',
        ],
        correctIndex: 1,
        explanation: 'AD is the identity and access backbone of enterprise Windows environments.',
      ),
      QuizQuestion(
        question: 'The Windows host firewall protects against lateral movement because:',
        options: [
          'It blocks all outbound traffic',
          'It filters traffic per machine even when on a trusted internal network',
          'It replaces network firewalls',
          'It encrypts all files',
        ],
        correctIndex: 1,
        explanation: 'Host firewall rules stop compromised machines from freely reaching other machines on the same network.',
      ),
      QuizQuestion(
        question: 'Windows event log category that shows policy changes and account modifications is:',
        options: ['Application', 'System', 'Security', 'Setup'],
        correctIndex: 2,
        explanation: 'The Security log records authentication events, account changes, and policy modifications.',
      ),
      QuizQuestion(
        question: 'Pass-the-hash attacks use:',
        options: [
          'The plaintext password',
          'The NTLM hash of a password to authenticate without knowing the password itself',
          'A phishing email',
          'A keylogger',
        ],
        correctIndex: 1,
        explanation: 'Pass-the-hash replays a captured hash to authenticate — Credential Guard mitigates this.',
      ),
      QuizQuestion(
        question: 'Service accounts should run with:',
        options: [
          'Full administrator rights for reliability',
          'Minimal permissions needed for that specific service only',
          'No permissions at all',
          'Domain admin rights for compatibility',
        ],
        correctIndex: 1,
        explanation: 'Service accounts following least privilege limit the impact if the service is compromised.',
      ),
      QuizQuestion(
        question: 'BitLocker primarily protects against:',
        options: [
          'Online attacks while the system is running',
          'Data exposure if a device is lost or stolen while powered off',
          'Malware running on an unlocked system',
          'Phishing emails',
        ],
        correctIndex: 1,
        explanation: 'BitLocker encrypts the drive protecting data at rest when the device is off or locked.',
      ),
      QuizQuestion(
        question: 'Attack Surface Reduction (ASR) rules in Windows Defender:',
        options: [
          'Block all network traffic',
          'Block specific known attack techniques at the OS level',
          'Replace Group Policy',
          'Encrypt user files',
        ],
        correctIndex: 1,
        explanation: 'ASR rules directly block specific attacker techniques like Office macro abuse.',
      ),
      QuizQuestion(
        question: 'Which event ID indicates the Security audit log was cleared?',
        options: ['4624', '4688', '1102', '4720'],
        correctIndex: 2,
        explanation: 'Event 1102 (Security log cleared) is a major red flag that an attacker may be covering tracks.',
      ),
      QuizQuestion(
        question: 'VLANs on a managed switch allow:',
        options: [
          'Faster internet speeds',
          'Multiple isolated logical networks on a single physical switch',
          'Automatic IP assignment',
          'Wireless access point configuration',
        ],
        correctIndex: 1,
        explanation: 'VLANs logically separate traffic on the same physical hardware for security and performance.',
      ),
      QuizQuestion(
        question: 'Why should Group Policy be used for Windows hardening rather than manually configuring each machine?',
        options: [
          'GPO is faster to type',
          'GPO applies settings centrally and consistently to all machines automatically',
          'Manual config is more secure',
          'GPO only works on servers',
        ],
        correctIndex: 1,
        explanation: 'Group Policy scales hardening across thousands of machines from a single configuration point.',
      ),
      QuizQuestion(
        question: 'The principle of least privilege on Windows most directly applies to:',
        options: [
          'File compression settings',
          'Every user process and service having only the access they genuinely need',
          'Display resolution',
          'Power management',
        ],
        correctIndex: 1,
        explanation: 'Least privilege on Windows means standard accounts for daily work, not administrator accounts.',
      ),
      QuizQuestion(
        question: 'Event ID 4688 logs:',
        options: [
          'Failed logon attempts',
          'New process creation enabling command execution tracking',
          'Account password changes',
          'Group Policy updates',
        ],
        correctIndex: 1,
        explanation: 'Event 4688 logs every new process created, enabling detection of suspicious command execution.',
      ),
      QuizQuestion(
        question: 'AppLocker is used to:',
        options: [
          'Lock application icons on the taskbar',
          'Allowlist only approved executables preventing unauthorized software from running',
          'Configure network shares',
          'Manage printer access',
        ],
        correctIndex: 1,
        explanation: 'AppLocker controls which applications are permitted to run on a system.',
      ),
      QuizQuestion(
        question: 'In Kerberos, what does the Ticket Granting Ticket (TGT) prove?',
        options: [
          'The user\'s plaintext password',
          'That the user already successfully authenticated, without needing to re-send credentials for each subsequent request',
          'The specific resource server being accessed',
          'The domain controller\'s IP address',
        ],
        correctIndex: 1,
        explanation: 'The TGT is a time-limited proof of prior authentication, used to request service-specific tickets without re-authenticating.',
      ),
      QuizQuestion(
        question: 'A Golden Ticket attack is possible because an attacker has stolen:',
        options: [
          'A single user\'s password',
          'The KRBTGT account\'s password hash, used to sign every TGT in the domain',
          'A BitLocker recovery key',
          'A Windows Defender signature file',
        ],
        correctIndex: 1,
        explanation: 'The KRBTGT hash signs all TGTs domain-wide, so stealing it lets an attacker forge valid tickets for any account.',
      ),
      QuizQuestion(
        question: 'Which registry hive contains settings specific to the currently logged-in user?',
        options: ['HKEY_LOCAL_MACHINE', 'HKEY_CURRENT_USER', 'HKEY_CLASSES_ROOT', 'HKEY_CURRENT_CONFIG'],
        correctIndex: 1,
        explanation: 'HKEY_CURRENT_USER (HKCU) holds settings for whichever user is currently logged in.',
      ),
      QuizQuestion(
        question: 'Why is PowerShell execution policy NOT considered a genuine security boundary?',
        options: [
          'It only works on Windows Server',
          'It can be trivially bypassed by an attacker who already has code execution, such as by piping script content directly into PowerShell',
          'It requires a paid license to enable',
          'It disables all PowerShell functionality',
        ],
        correctIndex: 1,
        explanation: 'Execution policy prevents accidental script execution but is easily bypassed by anyone with existing code execution — it is a convenience feature, not a security control.',
      ),
      QuizQuestion(
        question: 'What does AMSI (Antimalware Scan Interface) allow security tools to do?',
        options: [
          'Block all PowerShell usage entirely',
          'Inspect PowerShell script content in memory, even if deliberately obfuscated, right before it executes',
          'Encrypt PowerShell script files at rest',
          'Automatically patch PowerShell vulnerabilities',
        ],
        correctIndex: 1,
        explanation: 'AMSI exposes script content to antivirus/EDR for inspection immediately before execution, defeating many obfuscation techniques.',
      ),
    ],
  ),
];
