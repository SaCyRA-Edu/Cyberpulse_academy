import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> vulnerabilitiesThreatsLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Vulnerabilities and Threats: The Full Landscape',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Going Deeper Than the Fundamentals',
        body:
            'The Fundamentals module introduced threats, vulnerabilities, '
            'and risk at a conceptual level. This module goes much '
            'further — examining specific, real vulnerability categories '
            'across hardware, software, and networks, and the specific '
            'attack techniques that exploit each one.',
      ),
      LessonSection(
        heading: 'The Scope: Hardware, Software, and Network Vulnerabilities',
        bullets: [
          'Hardware — firmware flaws, end-of-life devices, Bluetooth weaknesses; covered in the next lesson',
          'Software — operating system flaws, injection attacks, cross-site scripting, buffer overflows; covered across the remaining lessons in this module',
          'Network — many network-specific vulnerabilities were already covered in the Networking module, and this module builds directly on that foundation rather than repeating it',
        ],
      ),
      LessonSection(
        heading: 'The Common Mitigation Toolkit',
        bullets: [
          'Patching — closing known, already-documented vulnerabilities before they can be exploited',
          'Configuration baselines — a documented, known-good configuration standard that systems are built against and periodically checked for drift from',
          'Isolation — segmenting vulnerable or legacy systems that can\'t be immediately patched, limiting what they can reach even if compromised',
          'Compensating controls — additional monitoring or restrictions applied specifically to a system that can\'t receive the ideal fix right away',
        ],
      ),
      LessonSection(
        heading: 'Real-World Vulnerability Exploitation: A History',
        bullets: [
          'Equifax, 2017 — attackers exploited a known, unpatched vulnerability in the Apache Struts web framework, exposing sensitive data for roughly 147 million people; a patch had been available for months before the breach occurred',
          'WannaCry, 2017 — ransomware that spread globally by exploiting a Windows SMB vulnerability that already had an available patch, hitting hospitals, manufacturers, and government agencies that hadn\'t yet applied it',
          'Mirai botnet, 2016 — malware that compromised hundreds of thousands of IoT devices, largely through default or weak factory credentials and unpatched firmware, to launch some of the largest DDoS attacks recorded at the time',
          'Heartbleed, 2014 — a vulnerability in the widely used OpenSSL library that allowed attackers to read sensitive memory contents, including private keys and credentials, from millions of servers worldwide',
        ],
      ),
      LessonSection(
        heading: 'The Pattern Behind Every One of These Incidents',
        body:
            'Notice that most of these incidents didn\'t involve some '
            'exotic, never-before-seen technique — they exploited '
            'vulnerabilities that were already publicly known, often '
            'with a patch already available, simply not yet applied '
            'across every affected system. This single observation is '
            'exactly why patching and configuration management, however '
            'unglamorous, remain consistently the highest-leverage '
            'security investments an organization can make.',
      ),
      LessonSection(
        heading: 'What\'s Ahead in This Module',
        body:
            'The lessons that follow examine hardware vulnerabilities '
            'and Bluetooth-specific risks, mobile device vulnerabilities '
            'and MDM, zero-day vulnerabilities specifically, operating '
            'system vulnerabilities, SQL and XML injection with a hands-'
            'on demonstration, cross-site scripting and XSRF in depth, '
            'and buffer overflow attacks — each building the specific, '
            'technical knowledge needed to recognize and defend against '
            'that particular category.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Hardware Vulnerabilities & Bluetooth Attacks',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Hardware Vulnerabilities Actually Are',
        body:
            'Hardware vulnerabilities are weaknesses in the physical '
            'devices, firmware, and embedded systems an organization '
            'relies on — distinct from vulnerabilities in the software '
            'running on top of that hardware. Because hardware and '
            'firmware are less frequently updated than mainstream '
            'operating systems and applications, vulnerabilities here '
            'often persist far longer, sometimes for the entire '
            'operational life of a device.',
      ),
      LessonSection(
        heading: 'Where Hardware Vulnerabilities Come From',
        bullets: [
          'Firmware — the low-level software controlling a device\'s hardware directly; firmware vulnerabilities can grant an attacker persistence that survives a full operating system reinstall',
          'End-of-life and legacy devices — hardware the manufacturer no longer supports or patches at all, regardless of how severe a newly discovered vulnerability might be',
          'Unpatched systems — devices that could receive a fix but simply haven\'t yet, often because updating requires physical access or scheduled downtime',
          'Misconfigurations — default settings, open management interfaces, or weak default credentials left unchanged from how the device shipped',
        ],
      ),
      LessonSection(
        heading: 'Discovering Hardware Vulnerabilities',
        bullets: [
          'Asset inventory — you cannot assess what you don\'t know exists; a complete, current hardware inventory is the essential starting point',
          'Firmware version auditing — systematically checking installed firmware versions against vendor advisories and known vulnerability databases',
          'Vulnerability scanning — automated tools that can identify many known hardware and firmware weaknesses across a network',
          'Vendor security advisories — proactively monitoring for newly disclosed vulnerabilities affecting hardware already deployed in your environment',
        ],
      ),
      LessonSection(
        heading: 'Protecting Hardware: The Full Toolkit',
        bullets: [
          'Hardening — disabling unused features, interfaces, and default accounts on every device before deployment',
          'Patching — applying firmware and driver updates on a regular, disciplined schedule, not only when a problem is already suspected',
          'Configuration enforcement — using configuration management tools to detect and automatically correct drift away from an approved baseline',
          'Decommissioning — formally retiring end-of-life hardware on a planned schedule, rather than leaving unsupported devices running indefinitely simply because they still technically function',
          'Segmentation — isolating hardware that can\'t be immediately patched or replaced, limiting what it can reach even if compromised',
        ],
      ),
      LessonSection(
        heading: 'Bluetooth Vulnerabilities and Attacks',
        body:
            'Bluetooth\'s convenience — automatic discovery and pairing '
            'with nearby devices — is also its core security weakness. '
            'Two attack patterns are particularly common.',
        bullets: [
          'Insecure pairing — some Bluetooth implementations use weak or predictable pairing codes, or accept pairing requests with minimal verification, letting an attacker complete a connection without genuine authorization',
          'Device spoofing — an attacker impersonates a trusted, previously paired device to gain access, or intercepts data during an insecure pairing exchange',
        ],
      ),
      LessonSection(
        heading: 'Bluetooth Best Practices',
        bullets: [
          'Turn off Bluetooth entirely when not actively in use — the single most effective control, since a disabled radio has no attack surface at all',
          'Use non-discoverable mode by default — preventing a device from broadcasting its presence to every nearby Bluetooth scanner',
          'Only accept pairing with explicitly trusted, verified devices, never accepting unexpected pairing requests',
          'Ensure Bluetooth connections use strong encryption where the device and use case support it, rather than relying on default, potentially weaker settings',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Mobile Vulnerabilities and MDM',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Why Mobile Devices Carry Distinct Risk',
        body:
            'Mobile devices combine sensitive corporate access with '
            'personal use, frequent travel outside any controlled '
            'network, and — especially for personally owned devices — '
            'far less consistent security configuration than a managed '
            'corporate laptop typically receives.',
      ),
      LessonSection(
        heading: 'Sideloading',
        body:
            'Sideloading means installing an application from outside '
            'an official app store, bypassing the vetting process official '
            'stores apply to submitted apps. A sideloaded app can '
            'contain malware, excessive permissions, or backdoors that '
            'would likely have been caught and rejected during an '
            'official store\'s review.',
      ),
      LessonSection(
        heading: 'Jailbreaking and Rooting',
        body:
            'Jailbreaking (iOS) and rooting (Android) remove the '
            'manufacturer\'s built-in security restrictions, granting '
            'the user — and potentially any malicious app — far deeper '
            'system access than the device\'s default security model '
            'ever intended to allow. This directly undermines the '
            'sandboxing and permission model that otherwise limits what '
            'any single compromised app could do.',
      ),
      LessonSection(
        heading: 'Insecure Connections',
        body:
            'Mobile devices frequently connect to untrusted public Wi-Fi '
            'networks, exactly the unsecured-network threat vector '
            'covered in the Threat Actors module — without an active '
            'VPN, traffic on these networks is exposed to interception.',
      ),
      LessonSection(
        heading: 'What MDM Actually Is',
        body:
            'A Mobile Device Management (MDM) solution is centralized '
            'software that lets an organization enforce security policy, '
            'monitor compliance, and remotely manage mobile devices — '
            'whether company-owned or personally owned devices enrolled '
            'for work use — from one central console.',
      ),
      LessonSection(
        heading: 'Where and Why MDM Should Be Used',
        body:
            'Any organization allowing mobile devices — company-issued '
            'or BYOD — to access corporate email, applications, or data '
            'should deploy MDM. Without it, an organization has no '
            'reliable way to verify that a mobile device meets minimum '
            'security requirements, no way to enforce policy consistently '
            'across a genuinely mixed fleet of devices, and no way to '
            'remotely wipe corporate data from a lost or stolen device.',
      ),
      LessonSection(
        heading: 'The Concrete Advantages of MDM',
        bullets: [
          'Enforcing patching — MDM can require devices to be running a minimum OS version before granting access, blocking known-vulnerable devices automatically',
          'Enforcing VPN usage — requiring a VPN connection before allowing access to sensitive corporate resources over any untrusted network',
          'Remote wipe — immediately and remotely erasing corporate data (or the entire device) if it\'s lost, stolen, or an employee departs',
          'App management — controlling exactly which applications are permitted to install or run on managed devices',
          'Compliance reporting — giving security teams centralized visibility into the actual security posture of every enrolled mobile device at any given moment',
        ],
      ),
      LessonSection(
        heading: 'Detecting and Blocking Risky Configurations',
        body:
            'A well-configured MDM solution actively detects jailbroken '
            'or rooted devices and can automatically block corporate '
            'access from them, and can restrict or entirely prevent '
            'sideloading on managed devices — directly closing off the '
            'two most significant mobile-specific vulnerability '
            'categories covered earlier in this lesson.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Zero-Day Vulnerabilities',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'What Makes a Vulnerability a "Zero-Day"',
        body:
            'A zero-day vulnerability is a flaw that\'s unknown to the '
            'software or hardware vendor — meaning zero days have '
            'passed since the vendor became aware of it, and '
            'consequently, no patch exists yet. A zero-day exploit is '
            'the actual attack code or technique that takes advantage of '
            'that unpatched flaw.',
      ),
      LessonSection(
        heading: 'How Attackers Actually Find and Use Them',
        body:
            'Sophisticated attackers — particularly well-resourced '
            'nation-state groups, as covered in the Threat Actors module '
            '— invest significant time and money discovering zero-day '
            'vulnerabilities themselves, or purchase them from '
            'specialized brokers on gray and black markets. Because no '
            'defense specifically anticipates the exact flaw, a zero-day '
            'exploit can succeed even against a fully patched, otherwise '
            'well-defended target — patching, by definition, cannot '
            'protect against a vulnerability nobody yet knows exists.',
      ),
      LessonSection(
        heading: 'A Real-World Example: Stuxnet',
        body:
            'Stuxnet, discovered in 2010, is widely regarded as one of '
            'the most sophisticated pieces of malware ever documented — '
            'it used multiple zero-day vulnerabilities simultaneously to '
            'target industrial control systems, specifically the '
            'programmable logic controllers used in uranium enrichment '
            'centrifuges. Its use of several previously unknown '
            'vulnerabilities at once demonstrated the kind of resources '
            'and sophistication only a very well-funded actor could '
            'realistically bring to bear.',
      ),
      LessonSection(
        heading: 'Why Signature-Based Antivirus Struggles Against Zero-Days',
        body:
            'Traditional antivirus relies heavily on signatures — known '
            'patterns matching previously identified malware. A zero-day '
            'exploit, by definition, has never been seen or catalogued '
            'before, so no signature exists yet to match against. This '
            'is exactly why modern endpoint protection has shifted so '
            'heavily toward behavior-based detection (covered in the '
            'Malware module\'s Attack Techniques lesson) — watching for '
            'suspicious actions and patterns rather than relying purely '
            'on recognizing a known-bad file.',
      ),
      LessonSection(
        heading: 'Best Practices Against Zero-Day Exploitation',
        bullets: [
          'Defense in depth — since no single control can reliably stop an unknown threat, layering multiple independent defenses increases the chance that at least one catches the resulting malicious behavior even if the initial exploit succeeds',
          'Behavior-based detection (EDR) — monitoring for anomalous process behavior rather than relying solely on known signatures',
          'Network segmentation — limiting how far a successful zero-day exploit on one system can spread',
          'Least privilege — minimizing what a successfully exploited process or account can actually do, even after a zero-day succeeds',
          'Rapid patch deployment once a fix is released — the window between a zero-day becoming publicly known and a patch actually being deployed is a second, equally critical period of risk',
          'Threat intelligence — monitoring for indicators associated with active zero-day campaigns, even before your own organization has confirmed direct impact',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Operating System Vulnerabilities',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Why the OS Itself Is Such a High-Value Target',
        body:
            'The operating system sits beneath every application '
            'running on a device, mediating every resource access. A '
            'vulnerability in the OS itself can potentially compromise '
            'every application running on top of it simultaneously, '
            'regardless of how securely any individual application was '
            'built.',
      ),
      LessonSection(
        heading: 'Unpatched Systems',
        body:
            'As emphasized repeatedly throughout this course, the '
            'majority of successful OS-level compromises exploit '
            'vulnerabilities that already have an available patch — '
            'the WannaCry example from this module\'s first lesson is a '
            'direct case in point.',
      ),
      LessonSection(
        heading: 'Zero-Days at the OS Level',
        body:
            'Operating systems, given their scale and complexity, are '
            'frequent targets for zero-day research specifically — a '
            'zero-day in a widely deployed OS potentially affects '
            'billions of devices simultaneously, making OS zero-days '
            'especially valuable to sophisticated attackers.',
      ),
      LessonSection(
        heading: 'Misconfigurations',
        body:
            'An OS with excellent security capability provides very '
            'little actual protection if those capabilities are '
            'disabled, weakened, or left at insecure defaults — an '
            'unpatched OS and a fully patched but badly misconfigured OS '
            'can be equally vulnerable in practice, just through '
            'different root causes.',
      ),
      LessonSection(
        heading: 'Data Exfiltration',
        body:
            'Beyond the initial compromise, OS-level vulnerabilities '
            'often become the mechanism attackers use to actually '
            'extract data — a compromised OS gives an attacker the '
            'system-level access needed to locate, package, and quietly '
            'transmit sensitive data outward, frequently disguised '
            'within traffic patterns that look superficially normal.',
      ),
      LessonSection(
        heading: 'Malicious Updates',
        body:
            'A particularly insidious risk: an attacker who compromises '
            'a software vendor\'s own update infrastructure can push '
            'malware disguised as a legitimate, trusted update, which '
            'then gets installed voluntarily and automatically by every '
            'system that trusts that vendor — a supply chain attack '
            'aimed specifically at the OS or software update mechanism '
            'itself.',
      ),
      LessonSection(
        heading: 'Defense in Depth for the Operating System',
        bullets: [
          'Patching — applying OS updates promptly and consistently, ideally through a managed, tested rollout process',
          'Encryption — protecting data at rest even if OS-level access controls are somehow bypassed',
          'Configuration management — continuously enforcing a documented security baseline rather than trusting default settings',
          'Least privilege — limiting what any single compromised process or account can do even after successful exploitation',
          'Application allowlisting — restricting which software is permitted to execute at all, directly limiting what a malicious update or exploit payload can actually run',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'SQL and XML Injection',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'The Core Idea Behind Every Injection Attack',
        body:
            'Injection attacks exploit applications that fail to '
            'properly separate user-supplied input from the commands or '
            'queries that input gets inserted into — letting an attacker '
            'submit specially crafted input that gets executed as part '
            'of the application\'s own logic, rather than treated as '
            'harmless data.',
      ),
      LessonSection(
        heading: 'SQL Injection',
        body:
            'A web application that builds a database query by directly '
            'concatenating user input into a SQL string, without proper '
            'handling, allows an attacker to inject their own SQL logic. '
            'A classic example: a login form checking a query like '
            '"SELECT * FROM users WHERE username = \'[input]\' AND '
            'password = \'[input]\'" — an attacker entering a username '
            'of \' OR \'1\'=\'1 can transform the query\'s logic entirely, '
            'potentially bypassing the password check altogether because '
            'the injected condition is always true.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Malicious Input Submitted', 'Concatenated Into Query', 'Query Logic Altered', 'Unauthorized Data Access'],
          caption:
              'The core failure is treating user input as trusted, '
              'executable logic rather than as untrusted data to be '
              'safely handled.',
        ),
      ),
      LessonSection(
        heading: 'XML Injection',
        body:
            'The same underlying flaw applies to applications processing '
            'XML data — if user input is inserted directly into an XML '
            'document or query (such as an XPath query) without proper '
            'handling, an attacker can inject malicious XML structure or '
            'logic, potentially extracting data the application never '
            'intended to expose, or bypassing authentication checks '
            'built on XML-based logic in much the same way SQL '
            'injection bypasses database-driven authentication.',
      ),
      LessonSection(
        heading: 'How These Attacks Bypass Authentication',
        body:
            'Both SQL and XML injection can directly undermine '
            'authentication logic specifically, because many login '
            'systems check credentials by building a query or comparison '
            'directly from user-supplied input. If that input isn\'t '
            'properly isolated from the underlying query logic, an '
            'attacker doesn\'t need to actually know a valid password at '
            'all — they can craft input that manipulates the query\'s '
            'own logic to always evaluate as a successful login.',
      ),
      LessonSection(
        heading: 'Defenses: Input Validation, Sanitization, and WAFs',
        bullets: [
          'Input validation — strictly checking that user input matches the exact expected format (a numeric ID field should only ever accept numbers, for instance) before it\'s used anywhere',
          'Parameterized queries (prepared statements) — the single most effective technical defense, keeping user input completely separate from query logic at the database driver level, so injected content can never be interpreted as executable query syntax',
          'Sanitization — removing or escaping characters that carry special meaning in SQL or XML syntax before they\'re used',
          'Web Application Firewalls (WAFs) — inspecting incoming requests for known injection attack patterns and blocking them before they ever reach the application, as covered in the Security Infrastructure lessons',
        ],
      ),
      LessonSection(
        heading: 'A Hands-On Demonstration: SQL Injection Against DVWA',
        body:
            'DVWA (Damn Vulnerable Web Application) is a deliberately '
            'vulnerable web application specifically built for safe, '
            'legal security training and practice — never test '
            'injection techniques against any system you don\'t have '
            'explicit authorization to test, exactly as covered in the '
            'Capstone module\'s Ethical Hacking lesson. In DVWA\'s SQL '
            'injection module, entering a user ID field value like '
            '"1\' OR \'1\'=\'1" into a form that concatenates input '
            'directly into a query returns every single user record in '
            'the database, rather than just the one legitimately '
            'requested record — directly demonstrating how weak input '
            'handling exposes far more data than the application ever '
            'intended. The same category of flaw, in a real login form, '
            'could similarly expose stored password hashes for offline '
            'cracking (as covered in the Cryptography module\'s Hashing '
            'lesson), turning one input validation failure into a full '
            'credential compromise.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Cross-Site Scripting (XSS) and XSRF',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'The Core Idea Behind XSS',
        body:
            'Cross-site scripting occurs when an application allows '
            'user-supplied input containing malicious script code to be '
            'included in a page as though it were legitimate, trusted '
            'content — causing that script to execute in the browser of '
            'anyone who views the affected page, running with the same '
            'trust and access as the legitimate site itself.',
      ),
      LessonSection(
        heading: 'The Three Types of XSS',
        body:
            'XSS attacks are categorized by exactly where and how the '
            'malicious script actually reaches the victim.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.xssTypes),
      ),
      LessonSection(
        heading: 'Reflected XSS',
        body:
            'The malicious script is included directly in a request '
            '(often a URL parameter) and immediately reflected back in '
            'the server\'s response, without being permanently stored '
            'anywhere. A victim typically needs to be tricked into '
            'clicking a specially crafted malicious link for a reflected '
            'attack to actually execute against them.',
      ),
      LessonSection(
        heading: 'Persistent (Stored) XSS',
        body:
            'The malicious script is submitted once — through a comment '
            'field, a profile bio, a forum post — and permanently stored '
            'on the server, then served automatically to every single '
            'visitor who later views that stored content, with no '
            'additional trickery needed for each individual victim.',
      ),
      LessonSection(
        heading: 'DOM-Based XSS',
        body:
            'The malicious script executes purely through client-side '
            'JavaScript manipulating the page\'s Document Object Model '
            '(DOM), without the malicious payload ever necessarily being '
            'sent to or reflected by the server at all — making this '
            'variant particularly difficult for server-side defenses '
            'alone to catch, since the vulnerable logic lives entirely '
            'in client-side code.',
      ),
      LessonSection(
        heading: 'How Cookies and Sessions Make XSS Dangerous',
        body:
            'Web applications commonly use cookies to maintain a logged-'
            'in session after initial authentication. If an XSS payload '
            'successfully executes in a victim\'s browser, it can often '
            'read that victim\'s own session cookie and transmit it to '
            'an attacker — who can then impersonate the victim\'s '
            'authenticated session entirely, without ever needing to '
            'know their actual password.',
      ),
      LessonSection(
        heading: 'Cross-Site Request Forgery (XSRF/CSRF)',
        body:
            'A related but distinct attack: XSRF tricks a victim\'s '
            'browser into submitting an unwanted, unauthorized request '
            'to a site where the victim is already authenticated — '
            'exploiting the fact that browsers automatically attach '
            'existing session cookies to any request sent to that site, '
            'regardless of which page or link actually triggered the '
            'request. A victim visiting a malicious page while still '
            'logged into their bank, for example, could unknowingly '
            'trigger a request that transfers funds, entirely through '
            'their browser silently including their still-valid session '
            'cookie.',
      ),
      LessonSection(
        heading: 'Defenses',
        bullets: [
          'Input validation and output encoding — ensuring any user-supplied content displayed back to other users is properly encoded so it\'s rendered as plain text, not executable script',
          'Content Security Policy (CSP) — a browser-enforced policy restricting which sources of script content a page is even allowed to execute',
          'Anti-CSRF tokens — a unique, unpredictable token embedded in every legitimate form, verified server-side, so a forged request lacking the correct token is automatically rejected',
          'Two-factor authentication — limits the damage even if a session is successfully hijacked through XSS, since sensitive actions may still require a fresh second-factor confirmation',
          'SameSite cookie attributes — a browser-level setting restricting when cookies are automatically included in cross-site requests, directly reducing XSRF\'s effectiveness',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Buffer Overflow',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'What a Buffer Overflow Actually Is',
        body:
            'A buffer is a fixed-size block of memory an application '
            'allocates to temporarily hold data. A buffer overflow '
            'occurs when a program writes more data into that buffer '
            'than it was actually sized to hold, and that excess data '
            'spills over into adjacent memory it was never meant to '
            'touch — memory that may hold other important program data, '
            'including control information the program relies on to '
            'function correctly.',
      ),
      LessonSection(
        heading: 'Overwriting the Stack Return Address',
        body:
            'Program memory commonly uses a structure called the stack '
            'to track function calls, including the return address — '
            'where execution should resume once the current function '
            'finishes. A carefully crafted buffer overflow can '
            'deliberately overwrite that return address with an address '
            'of the attacker\'s own choosing, redirecting program '
            'execution to attacker-controlled code the moment the '
            'current function returns.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Oversized Input Sent', 'Buffer Overflows', 'Return Address Overwritten', 'Remote Code Execution'],
          caption:
              'The entire attack hinges on the program never checking '
              'that the input it received actually fits within the '
              'buffer it allocated for it.',
        ),
      ),
      LessonSection(
        heading: 'Remote Code Execution: The End Goal',
        body:
            'If an attacker successfully redirects execution to code '
            'they control — often malicious code they\'ve also '
            'delivered as part of the same oversized input — they '
            'achieve Remote Code Execution (RCE): running arbitrary code '
            'of their choosing on the target system, frequently with '
            'whatever privilege level the vulnerable, exploited program '
            'itself was running under.',
      ),
      LessonSection(
        heading: 'NOP Slides',
        body:
            'Because an attacker often can\'t predict the exact memory '
            'address their malicious code will land at with perfect '
            'precision, a NOP slide — a sequence of "no operation" '
            'instructions that do nothing except advance execution to '
            'the next instruction — is placed immediately before the '
            'actual malicious payload. Landing execution anywhere within '
            'this NOP slide simply causes execution to slide forward '
            'until it reaches the real payload, significantly improving '
            'the exploit\'s reliability despite imprecise memory address '
            'prediction.',
      ),
      LessonSection(
        heading: 'ASLR: Address Space Layout Randomization',
        body:
            'ASLR is a defensive technique that randomizes where key '
            'memory regions — including the stack, heap, and loaded '
            'libraries — are actually located in memory each time a '
            'program runs. This directly undermines an attacker\'s '
            'ability to reliably predict where their injected code or a '
            'useful existing function will actually end up in memory, '
            'making many buffer overflow exploits substantially less '
            'reliable, though not always completely impossible.',
      ),
      LessonSection(
        heading: 'Other Buffer Overflow Defenses',
        bullets: [
          'Bounds checking — programming languages and libraries that automatically verify data fits within an allocated buffer before writing, preventing the overflow from ever occurring in the first place',
          'Stack canaries — a known, random value placed just before the return address on the stack; if a buffer overflow corrupts this value before reaching the return address, the corruption is detected and the program safely terminates before an attacker\'s overwritten return address is ever actually used',
          'Data Execution Prevention (DEP) — marking memory regions that should only ever contain data as non-executable, preventing injected code sitting in those regions from ever actually running even if it\'s successfully placed there',
          'Using memory-safe programming languages — languages with built-in automatic bounds checking eliminate this entire vulnerability class structurally, rather than relying on the programmer to remember every check manually',
        ],
      ),
    ],
  ),

  // 9 --------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'What did the Equifax, WannaCry, and Mirai incidents all have in common?',
        options: [
          'They all used entirely novel, never-before-seen techniques',
          'They all exploited vulnerabilities that were already known, often with a patch already available but not yet applied',
          'They all targeted only government agencies',
          'None of them involved any vulnerability at all',
        ],
        correctIndex: 1,
        explanation: 'Most major historical breaches exploited already-known vulnerabilities that simply had not been patched yet.',
      ),
      QuizQuestion(
        question: 'Why do hardware vulnerabilities often persist longer than software vulnerabilities?',
        options: [
          'Hardware is always more secure by design',
          'Hardware and firmware are updated less frequently than mainstream software',
          'Hardware vulnerabilities do not actually exist',
          'Hardware cannot be patched under any circumstances',
        ],
        correctIndex: 1,
        explanation: 'Firmware and hardware receive updates far less consistently than operating systems and applications.',
      ),
      QuizQuestion(
        question: 'What is the single most effective Bluetooth security control?',
        options: [
          'Using the strongest available pairing PIN',
          'Turning off Bluetooth entirely when not actively in use',
          'Always using discoverable mode',
          'Pairing with as many devices as possible',
        ],
        correctIndex: 1,
        explanation: 'A disabled Bluetooth radio has no attack surface at all — the most complete protection available.',
      ),
      QuizQuestion(
        question: 'Jailbreaking or rooting a mobile device is risky because it:',
        options: [
          'Automatically installs malware',
          'Removes manufacturer security restrictions, granting deeper access than the device\'s security model intended',
          'Is illegal in all circumstances',
          'Only affects battery life',
        ],
        correctIndex: 1,
        explanation: 'Jailbreaking/rooting undermines the sandboxing and permission model that otherwise limits app behavior.',
      ),
      QuizQuestion(
        question: 'Which MDM capability directly addresses a lost or stolen device?',
        options: ['App management', 'Remote wipe', 'Compliance reporting', 'VPN enforcement'],
        correctIndex: 1,
        explanation: 'Remote wipe lets an organization erase corporate data immediately on a lost or stolen device.',
      ),
      QuizQuestion(
        question: 'Why can a zero-day exploit succeed even against a fully patched system?',
        options: [
          'Patching is never effective',
          'By definition, no patch exists yet for a vulnerability the vendor does not know about',
          'Zero-days only affect unpatched systems',
          'Fully patched systems have no defenses at all',
        ],
        correctIndex: 1,
        explanation: 'Patching cannot protect against a vulnerability that has not yet been discovered or disclosed.',
      ),
      QuizQuestion(
        question: 'Why does signature-based antivirus struggle against zero-day malware?',
        options: [
          'Signature-based antivirus is always disabled by default',
          'A zero-day exploit has never been seen before, so no signature exists yet to match against',
          'Zero-days only target antivirus software directly',
          'Signatures work better against zero-days than any other malware type',
        ],
        correctIndex: 1,
        explanation: 'Signature detection relies on previously cataloged patterns, which a genuinely new zero-day will not match.',
      ),
      QuizQuestion(
        question: 'A malicious update supply chain attack works by:',
        options: [
          'Directly attacking end-user devices with no vendor involvement',
          'Compromising a vendor\'s update infrastructure so malware is disguised as a legitimate trusted update',
          'Only affecting hardware, never software',
          'Requiring physical access to every target device',
        ],
        correctIndex: 1,
        explanation: 'Compromising the update mechanism itself lets malware be voluntarily installed by systems trusting that vendor.',
      ),
      QuizQuestion(
        question: 'In a SQL injection attack, what is the fundamental application failure being exploited?',
        options: [
          'The database is too fast',
          'User input is concatenated directly into a query without being properly separated from executable query logic',
          'The web server uses HTTPS',
          'The application uses too much memory',
        ],
        correctIndex: 1,
        explanation: 'Failing to separate untrusted input from executable query logic is the root cause of SQL injection.',
      ),
      QuizQuestion(
        question: 'What is the single most effective technical defense against SQL injection?',
        options: [
          'Using a longer password',
          'Parameterized queries (prepared statements) that keep user input separate from query logic',
          'Disabling the database entirely',
          'Using a faster web server',
        ],
        correctIndex: 1,
        explanation: 'Parameterized queries prevent injected content from ever being interpreted as executable SQL syntax.',
      ),
      QuizQuestion(
        question: 'In the DVWA demonstration, entering "1\' OR \'1\'=\'1" into a vulnerable field caused:',
        options: [
          'The application to crash entirely',
          'Every user record to be returned instead of just the one legitimately requested',
          'The database to be encrypted',
          'No effect at all',
        ],
        correctIndex: 1,
        explanation: 'The injected condition is always true, causing the query to match and return every record rather than one.',
      ),
      QuizQuestion(
        question: 'What distinguishes Persistent (Stored) XSS from Reflected XSS?',
        options: [
          'Persistent XSS requires no user interaction from the attacker\'s perspective',
          'Persistent XSS is permanently stored on the server and served to every future visitor, while Reflected XSS only appears in an immediate response',
          'Reflected XSS is always more dangerous',
          'They are identical in every way',
        ],
        correctIndex: 1,
        explanation: 'Stored XSS persists and affects every visitor; reflected XSS requires each victim to trigger it individually via a crafted link.',
      ),
      QuizQuestion(
        question: 'Why is DOM-based XSS particularly difficult for server-side defenses to catch?',
        options: [
          'It only affects mobile browsers',
          'The vulnerable logic executes purely in client-side JavaScript, without necessarily involving the server at all',
          'It requires a database to function',
          'It cannot actually execute any code',
        ],
        correctIndex: 1,
        explanation: 'DOM-based XSS lives entirely in client-side code, making server-side input filtering alone insufficient.',
      ),
      QuizQuestion(
        question: 'What does an anti-CSRF token specifically defend against?',
        options: [
          'SQL injection',
          'A forged request from a malicious site being accepted because it lacks the unique, unpredictable token a legitimate form includes',
          'Buffer overflow attacks',
          'DNS spoofing',
        ],
        correctIndex: 1,
        explanation: 'Anti-CSRF tokens let the server reject forged requests that do not include the correct per-session token.',
      ),
      QuizQuestion(
        question: 'A buffer overflow attack that overwrites the stack return address aims to:',
        options: [
          'Simply crash the program with no further effect',
          'Redirect program execution to attacker-controlled code once the current function returns',
          'Encrypt the program\'s memory',
          'Disable the network interface',
        ],
        correctIndex: 1,
        explanation: 'Overwriting the return address redirects execution to code of the attacker\'s choosing.',
      ),
      QuizQuestion(
        question: 'What does ASLR (Address Space Layout Randomization) do to defend against buffer overflow exploits?',
        options: [
          'Encrypts all program memory',
          'Randomizes where key memory regions are located each time a program runs, undermining reliable exploit prediction',
          'Disables the stack entirely',
          'Automatically patches vulnerable code',
        ],
        correctIndex: 1,
        explanation: 'ASLR makes it much harder for an attacker to reliably predict where injected code will end up in memory.',
      ),
    ],
  ),
];
