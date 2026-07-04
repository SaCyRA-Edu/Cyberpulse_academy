import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> threatActorsLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Actors',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Who Is Actually on the Other Side',
        body:
            'Every security control this course covers exists because '
            'someone, somewhere, might try to defeat it. Understanding '
            'who that "someone" typically is — their skill level, their '
            'resources, and crucially, what they actually want — is what '
            'lets defenders prioritize realistically instead of treating '
            'every possible threat as equally likely and equally severe.',
      ),
      LessonSection(
        heading: 'The Threat Actor Spectrum',
        body:
            'Threat actors span an enormous range of sophistication and '
            'available resources, from someone running a tool they '
            'barely understand to a well-funded government intelligence '
            'operation.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.threatActorSpectrum,
          caption:
              'The same category of attack can look completely '
              'different depending on where the actor behind it sits on '
              'this spectrum.',
        ),
      ),
      LessonSection(
        heading: 'Unskilled Attackers',
        body:
            'Often dismissively called "script kiddies," these actors '
            'run pre-built tools and scripts written by others, without '
            'a deep technical understanding of how those tools actually '
            'work underneath. They\'re largely opportunistic, scanning '
            'broadly for any system with an obvious, easily exploitable '
            'weakness rather than targeting anyone specifically. Low '
            'skill doesn\'t mean low risk — unpatched systems fall to '
            'automated scanning regardless of who\'s running the scan.',
      ),
      LessonSection(
        heading: 'Hacktivists',
        body:
            'Motivated by political or social causes rather than '
            'financial gain, hacktivists typically target organizations '
            'they view as opposed to their cause. Their goal is usually '
            'disruption and public embarrassment — defacing a website, '
            'leaking internal communications, or knocking a service '
            'offline to make a statement — rather than direct financial '
            'theft.',
      ),
      LessonSection(
        heading: 'Organized Crime',
        body:
            'Financially motivated and often surprisingly well-resourced, '
            'organized cybercrime groups run operations resembling '
            'legitimate businesses, complete with specialized roles and '
            'even "ransomware-as-a-service" offerings letting less '
            'technical criminals rent sophisticated tools for a cut of '
            'the proceeds. These groups are responsible for the majority '
            'of ransomware attacks and large-scale data theft for resale.',
      ),
      LessonSection(
        heading: 'Nation-State Actors',
        body:
            'Generally the most highly skilled and best-resourced threat '
            'actors, nation-state groups pursue long-term strategic '
            'objectives on behalf of a government — espionage, '
            'intellectual property theft, or disruption of critical '
            'infrastructure. They\'re willing to spend months or years '
            'patiently working toward a single objective, with access to '
            'custom tools and zero-day vulnerabilities most other actors '
            'simply cannot obtain.',
      ),
      LessonSection(
        heading: 'Internal vs. External Threat Actors',
        body:
            'Beyond category, every threat actor is also either internal '
            'or external to the organization. Internal actors — '
            'employees, contractors, business partners — already possess '
            'legitimate access and system knowledge, which makes them '
            'harder to detect through perimeter defenses but typically '
            'more limited in scope to what their existing access already '
            'covers. External actors must first find a way in, which '
            'gives defenders more opportunities to detect and block them '
            'before they ever reach sensitive systems, but once inside, '
            'an especially skilled external actor may ultimately achieve '
            'access rivaling or exceeding an insider\'s.',
      ),
      LessonSection(
        heading: 'Assessing Resources, Funding & Sophistication',
        body:
            'When evaluating the realistic risk a specific threat actor '
            'poses to a specific organization, three questions matter '
            'most: how much funding do they have access to (a nation-'
            'state can fund years of patient effort; an unskilled '
            'attacker has essentially none), how sophisticated are their '
            'techniques (custom zero-days versus off-the-shelf tools), '
            'and how persistent are they likely to be (a one-off '
            'opportunistic attempt versus a multi-year campaign). '
            'Answering these honestly for your own organization is what '
            'turns an abstract list of threat actor types into an '
            'actual, prioritized risk picture.',
      ),
      LessonSection(
        heading: 'Motivations Behind Cyberattacks',
        bullets: [
          'Data exfiltration — stealing valuable data: customer records, intellectual property, trade secrets',
          'Financial gain — directly monetizing an attack through theft, fraud, or ransomware extortion',
          'Blackmail — threatening to expose stolen or embarrassing data unless payment is made',
          'Service disruption — deliberately taking systems offline, whether for ideological reasons, extortion leverage, or simple sabotage',
          'Espionage — covertly gathering intelligence, typically on behalf of a government or competitor, often over a long and patient timeframe',
        ],
      ),
      LessonSection(
        heading: 'Why Motivation Should Shape Your Defenses',
        body:
            'An organization holding valuable trade secrets should '
            'weigh espionage and data exfiltration heavily. A '
            'consumer-facing retailer processing payment cards should '
            'weigh financial-motivated crime heavily. A controversial '
            'organization in the public eye should factor in hacktivism. '
            'Matching realistic motivation to your organization\'s actual '
            'profile — rather than defending equally against every '
            'motivation in the abstract — is exactly the threat-informed '
            'thinking this lesson is building toward, and the same '
            'thinking you\'ll apply formally in the Risk Management '
            'lesson.',
      ),
      LessonSection(
        heading: 'A Preview: Threat Vectors, Attack Surfaces & Deception',
        body:
            'Knowing who might attack you and why is only half the '
            'picture — the other half is knowing how they\'d actually '
            'reach you (threat vectors and attack surfaces) and how you '
            'might turn the tables using deception technology like '
            'honeypots and honeytokens. Both are covered in full depth '
            'in the lessons ahead in this module.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Shadow IT',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'What Shadow IT Actually Is',
        body:
            'Shadow IT refers to any hardware, software, or cloud '
            'service used within an organization without formal approval '
            'or visibility from the IT or security team. It\'s rarely '
            'malicious in intent — most Shadow IT exists because an '
            'employee found a tool that genuinely helped them work '
            'faster, and simply started using it without going through '
            'an approval process that may have felt slow or unnecessary '
            'for what seemed like a small, harmless decision.',
      ),
      LessonSection(
        heading: 'Common Real-World Examples',
        bullets: [
          'An employee uploading work files to a personal Google Drive or Dropbox account for convenient access from home',
          'A team adopting a project management tool or chat app the IT department never approved or even knows exists',
          'Someone connecting a personal USB drive or external hard disk to a work computer',
          'A department signing up for a SaaS marketing or analytics tool using a company credit card, entirely outside procurement review',
          'An employee using a personal smartphone to access company email without it ever being enrolled in mobile device management',
        ],
      ),
      LessonSection(
        heading: 'Why It Happens So Often',
        body:
            'Shadow IT usually reflects a genuine gap between what '
            'employees need to be productive and what officially '
            'sanctioned tools currently provide. Formal procurement and '
            'security review processes, however necessary, can be slow — '
            'and when someone has an urgent, real problem to solve today, '
            'signing up for a free trial of some tool that solves it '
            'immediately is often simply the path of least resistance, '
            'regardless of the policy technically in place.',
      ),
      LessonSection(
        heading: 'The Real Risks It Introduces',
        bullets: [
          'Data breaches — sensitive data stored in unapproved, unmonitored services has no guarantee of proper security controls, encryption, or backup',
          'Compliance violations — regulations like HIPAA or GDPR require specific handling and location controls for certain data; Shadow IT routinely violates these without anyone realizing it',
          'Loss of visibility — security teams cannot protect, monitor, or investigate incidents involving systems they don\'t even know exist',
          'Inconsistent access control — data leaving approved systems loses whatever access restrictions and audit logging those systems were providing',
          'Unpatched vulnerabilities — unauthorized software and devices don\'t receive the same patch management discipline as approved, inventoried assets',
        ],
      ),
      LessonSection(
        heading: 'Balancing Innovation With Secure Policy',
        body:
            'The goal isn\'t to eliminate Shadow IT through pure '
            'prohibition — that approach consistently fails, since it '
            'doesn\'t address the underlying productivity need driving '
            'it, and simply pushes the same behavior further '
            'underground and harder to detect. More effective '
            'organizations combine clear, reasonably fast-moving '
            'approval processes for new tools, ongoing employee '
            'education about the specific risks involved, and technical '
            'visibility tools — like a Cloud Access Security Broker '
            '(CASB), which was introduced in the Capstone module\'s cloud '
            'security lesson — to actually discover what unsanctioned '
            'services are already in use across the organization, so '
            'gaps can be addressed deliberately rather than through '
            'blanket bans that employees quietly route around anyway.',
      ),
      LessonSection(
        heading: 'A Worked Example',
        body:
            'A marketing team, frustrated waiting weeks for IT to '
            'approve a design collaboration tool, signs up for a '
            'competitor\'s free tier using a personal email address and '
            'starts uploading unreleased product designs and campaign '
            'materials. Months later, that same free-tier account is '
            'compromised in an unrelated breach at the vendor, exposing '
            'the company\'s confidential materials — materials the '
            'security team never knew existed outside approved storage, '
            'and therefore never had any opportunity to protect, back '
            'up, or even include in incident response planning.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Vectors and Attack Surfaces',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Two Related but Distinct Concepts',
        body:
            'A threat vector is the specific path or method an attacker '
            'uses to actually deliver an attack — how they get from '
            '"outside" to "inside." An attack surface is the complete '
            'set of every possible point where an attack could '
            'potentially enter — every vector, added together, across '
            'the entire organization. Put simply: the attack surface is '
            'the whole exposed perimeter; a threat vector is one '
            'specific route across it that an actual attack travels.',
      ),
      LessonSection(
        heading: 'Six Common Threat Vectors',
        body:
            'While there are countless specific attack techniques, most '
            'of them ultimately travel through one of a small number of '
            'common vectors.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.attackVectors,
          caption:
              'Six of the most common threat vectors used to reach a '
              'target — most real attacks travel through one of these.',
        ),
      ),
      LessonSection(
        heading: 'Messages',
        body:
            'Email, SMS, and instant messaging platforms remain the '
            'single most common delivery vector for phishing and social '
            'engineering, precisely because messaging is something '
            'everyone uses constantly and often reviews quickly, without '
            'careful scrutiny. Minimizing exposure here means email '
            'authentication (SPF/DKIM/DMARC, covered in the Email '
            'Security module), user awareness training, and technical '
            'filtering at the gateway.',
      ),
      LessonSection(
        heading: 'Images',
        body:
            'Images can carry hidden malicious content through '
            'steganography (concealing data or code within an image '
            'file\'s pixel data) or by exploiting vulnerabilities in the '
            'software used to render or process the image itself. '
            'Minimizing exposure means keeping image-processing '
            'libraries and viewers patched, and being cautious of '
            'images arriving from unsolicited or unverified sources.',
      ),
      LessonSection(
        heading: 'Files',
        body:
            'Malicious documents, executables disguised with '
            'misleading extensions, and infected archives remain one of '
            'the most direct delivery vectors, especially when a file '
            'arrives as an email attachment or a download from a '
            'compromised website. Minimizing exposure means sandboxing '
            'unknown files before they reach end users, disabling risky '
            'macro execution by default, and restricting which file '
            'types are even allowed through email gateways in the first '
            'place.',
      ),
      LessonSection(
        heading: 'Voice Calls',
        body:
            'Vishing (voice phishing) uses phone calls — increasingly '
            'enhanced with AI voice cloning of a trusted person\'s actual '
            'voice — to socially engineer a victim into revealing '
            'information or taking a harmful action. Minimizing exposure '
            'means training staff to independently verify unexpected '
            'requests through a separate channel, rather than trusting '
            'caller ID or a familiar-sounding voice alone.',
      ),
      LessonSection(
        heading: 'Removable Devices',
        body:
            'USB drives and other removable media can carry malware '
            'that executes automatically when connected, or can simply '
            'be used to exfiltrate data by an insider. The classic '
            '"USB drop" attack leaves an infected drive somewhere an '
            'employee is likely to find and curiously plug in. '
            'Minimizing exposure means disabling autorun, restricting or '
            'monitoring USB port usage on sensitive systems, and '
            'training staff never to plug in unknown media.',
      ),
      LessonSection(
        heading: 'Unsecured Networks',
        body:
            'Public Wi-Fi and other untrusted networks expose traffic '
            'to interception through packet sniffing or man-in-the-'
            'middle attacks, as covered in depth in the Networking '
            'module. Minimizing exposure means using a VPN on untrusted '
            'networks, preferring encrypted protocols (HTTPS, not HTTP) '
            'everywhere, and treating any network you don\'t directly '
            'control as inherently hostile by default.',
      ),
      LessonSection(
        heading: 'Reducing the Overall Attack Surface',
        body:
            'Beyond hardening each individual vector, the broader '
            'strategic goal is minimizing the attack surface itself — '
            'removing anything exposed that doesn\'t genuinely need to '
            'be. Every unused service, every forgotten test system left '
            'running, every employee with more access than their role '
            'requires, adds to the surface an attacker can target, '
            'regardless of which specific vector they ultimately choose '
            'to use.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Outsmarting Threat Actors',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'From Purely Defensive to Actively Deceptive',
        body:
            'Everything covered so far in this module has been about '
            'recognizing and blocking threats. Deception and disruption '
            'technology takes a different, more proactive approach: '
            'deliberately planting convincing fake assets that offer no '
            'legitimate business value, purely so that any interaction '
            'with them is automatically suspicious — no legitimate user '
            'or process has any reason to ever touch them.',
      ),
      LessonSection(
        heading: 'Honeypots',
        body:
            'A honeypot is a decoy system — deliberately made to look '
            'like a genuine, potentially valuable target — deployed '
            'specifically to attract attackers away from real systems '
            'and study their behavior in a controlled, isolated '
            'environment. Because it serves no real business function, '
            'any activity directed at it is inherently suspicious by '
            'definition, giving defenders high-confidence alerts with '
            'very few false positives compared to monitoring genuinely '
            'busy production systems.',
      ),
      LessonSection(
        heading: 'Honeynets',
        body:
            'A honeynet extends the same idea to an entire decoy network '
            '— multiple interconnected honeypots designed to look like a '
            'realistic segment of an organization\'s infrastructure. '
            'This lets defenders observe more sophisticated attacker '
            'behavior, including lateral movement between systems, '
            'rather than just a single point of interaction.',
      ),
      LessonSection(
        heading: 'Honeyfiles',
        body:
            'A honeyfile is a decoy file — perhaps named to look like a '
            'salary spreadsheet, a password list, or sensitive customer '
            'data — placed somewhere an attacker who has gained '
            'unauthorized access is likely to look. The file itself is '
            'fake or contains no genuinely sensitive data, but opening '
            'or copying it triggers a monitored alert, revealing that '
            'someone unauthorized is actively browsing the file system.',
      ),
      LessonSection(
        heading: 'Honeytokens',
        body:
            'A honeytoken is a fake credential, API key, or database '
            'record planted specifically to detect unauthorized use. If '
            'a honeytoken credential is ever used to attempt a login, or '
            'a honeytoken record ever appears in a data dump on a '
            'criminal marketplace, that\'s an unambiguous signal — since '
            'the token was never legitimately issued to anyone or used '
            'by any real system, its use can only mean the token was '
            'stolen, and from where.',
      ),
      LessonSection(
        heading: 'How Deception Actually Plays Out',
        body:
            'Every deception technology above follows the same '
            'underlying detection logic once deployed.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Deploy Decoy', 'Attacker Interacts', 'Alert Triggered', 'Analyze TTPs'],
          caption:
              'Because a decoy has no legitimate purpose, any '
              'interaction with it is a high-confidence signal — a rare '
              'luxury in a field usually fighting alert fatigue.',
        ),
      ),
      LessonSection(
        heading: 'Learning TTPs, Not Just Detecting an Intrusion',
        body:
            'Beyond simple detection, deception technology\'s deeper '
            'value is studying an attacker\'s Tactics, Techniques, and '
            'Procedures (TTPs) — the same concept from the MITRE ATT&CK '
            'framework covered in the SOC Operations module — in a '
            'contained, controlled environment where nothing of real '
            'value is actually at risk. Watching exactly how an attacker '
            'moves through a honeynet, what tools they deploy, and what '
            'they search for reveals genuinely actionable intelligence '
            'that can then improve detection across the real production '
            'environment.',
      ),
      LessonSection(
        heading: 'A Real-World Example',
        body:
            'A financial services company plants a honeytoken — a fake '
            'set of database credentials — inside a configuration file '
            'on a low-priority internal server, a file an attacker who '
            'has already gained a foothold would plausibly search for '
            'and find. Weeks later, those exact fake credentials are '
            'used in a login attempt against the company\'s real, '
            'production customer database from an unfamiliar external '
            'IP address. Because the credentials were never legitimately '
            'issued to anyone, that single login attempt immediately and '
            'unambiguously confirms an active compromise — with far more '
            'certainty and far less noise than any anomaly-based alert '
            'on genuinely used, legitimate credentials could ever '
            'provide.',
      ),
    ],
  ),

  // 5 --------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'Which threat actor type is typically the most well-funded and strategically patient?',
        options: ['Unskilled attacker', 'Hacktivist', 'Nation-state actor', 'Script kiddie'],
        correctIndex: 2,
        explanation: 'Nation-state actors generally have the greatest resources and pursue long-term strategic objectives.',
      ),
      QuizQuestion(
        question: 'What primarily motivates hacktivists?',
        options: ['Financial gain', 'Political or social causes', 'Personal curiosity only', 'Government contracts'],
        correctIndex: 1,
        explanation: 'Hacktivists target organizations they view as opposed to their political or social cause.',
      ),
      QuizQuestion(
        question: 'An insider threat is generally harder to detect through perimeter defenses because:',
        options: [
          'Insiders are always more skilled than external attackers',
          'Insiders already possess legitimate access and system knowledge',
          'Insiders never leave any evidence',
          'Perimeter defenses do not apply to any internal traffic',
        ],
        correctIndex: 1,
        explanation: 'Existing legitimate access lets insider activity blend in more easily than an external attacker forcing their way in.',
      ),
      QuizQuestion(
        question: 'A company holding valuable trade secrets should weigh which motivation most heavily?',
        options: ['Service disruption only', 'Espionage and data exfiltration', 'Blackmail exclusively', 'None — all motivations are equally likely'],
        correctIndex: 1,
        explanation: 'Organizations should prioritize defenses based on the motivations most realistic for their specific profile — trade secrets attract espionage and exfiltration.',
      ),
      QuizQuestion(
        question: 'What is Shadow IT?',
        options: [
          'A type of malware',
          'Hardware, software, or cloud services used within an organization without formal approval or visibility from IT/security',
          'An authorized penetration testing team',
          'A network monitoring tool',
        ],
        correctIndex: 1,
        explanation: 'Shadow IT refers to unapproved, unmonitored tools and services in use across an organization.',
      ),
      QuizQuestion(
        question: 'Why does Shadow IT usually happen, even in well-run organizations?',
        options: [
          'Employees are deliberately trying to cause a breach',
          'A gap exists between what employees need to be productive and what officially sanctioned tools currently provide',
          'IT departments encourage it',
          'It is required by most compliance regulations',
        ],
        correctIndex: 1,
        explanation: 'Shadow IT typically fills a genuine productivity gap rather than reflecting malicious intent.',
      ),
      QuizQuestion(
        question: 'What is the most effective general strategy for managing Shadow IT?',
        options: [
          'A total ban on any unapproved tool with no exceptions',
          'Fast, clear approval processes combined with visibility tools like a CASB, rather than blanket prohibition',
          'Ignoring it entirely since it cannot be controlled',
          'Firing any employee found using an unapproved tool',
        ],
        correctIndex: 1,
        explanation: 'Blanket bans tend to push Shadow IT further underground; visibility and reasonable approval processes work better.',
      ),
      QuizQuestion(
        question: 'What is the difference between a threat vector and an attack surface?',
        options: [
          'They are the same thing',
          'A threat vector is one specific path an attack travels; an attack surface is the complete set of every such possible path',
          'An attack surface only applies to physical security',
          'A threat vector is always software-based',
        ],
        correctIndex: 1,
        explanation: 'The attack surface is the whole exposed perimeter; a vector is one specific route across it.',
      ),
      QuizQuestion(
        question: 'Which of the following is one of the six common threat vectors covered in this lesson?',
        options: ['Weather patterns', 'Removable devices', 'Stock market fluctuations', 'Office furniture'],
        correctIndex: 1,
        explanation: 'Removable devices (like USB drives) are one of the six common vectors, alongside messages, images, files, voice calls, and unsecured networks.',
      ),
      QuizQuestion(
        question: 'What is the classic "USB drop" attack?',
        options: [
          'Physically stealing a USB drive',
          'Leaving an infected USB drive somewhere an employee is likely to find and curiously plug in',
          'Encrypting a USB drive to prevent data theft',
          'A type of DDoS attack against USB ports',
        ],
        correctIndex: 1,
        explanation: 'The USB drop attack relies on human curiosity to get an infected device plugged into a target system.',
      ),
      QuizQuestion(
        question: 'What is a honeypot?',
        options: [
          'A type of firewall rule',
          'A decoy system deployed to attract attackers away from real systems and study their behavior',
          'An encrypted password vault',
          'A backup server used for disaster recovery',
        ],
        correctIndex: 1,
        explanation: 'A honeypot is a deliberately fake target designed to lure and study attackers safely.',
      ),
      QuizQuestion(
        question: 'What is a honeytoken?',
        options: [
          'A physical security badge',
          'A fake credential, API key, or database record planted specifically to detect unauthorized use',
          'A type of two-factor authentication device',
          'A backup encryption key',
        ],
        correctIndex: 1,
        explanation: 'Because a honeytoken is never legitimately issued or used, any use of it unambiguously signals compromise.',
      ),
      QuizQuestion(
        question: 'Why do honeypots and honeytokens generate unusually high-confidence alerts?',
        options: [
          'They use advanced machine learning',
          'They serve no legitimate business function, so any interaction with them is inherently suspicious by definition',
          'They are monitored by more staff than production systems',
          'They automatically block all attackers',
        ],
        correctIndex: 1,
        explanation: 'Because no legitimate user has any reason to touch a decoy, interactions with it carry very few false positives.',
      ),
      QuizQuestion(
        question: 'What is the deeper strategic value of a honeynet beyond simple detection?',
        options: [
          'It replaces the need for a firewall',
          'It lets defenders study an attacker\'s TTPs in a controlled environment, improving detection across real production systems',
          'It automatically patches vulnerabilities',
          'It eliminates the need for incident response planning',
        ],
        correctIndex: 1,
        explanation: 'Observing attacker behavior in a safe, contained honeynet reveals actionable intelligence usable to improve real defenses.',
      ),
      QuizQuestion(
        question: 'A honeyfile is best described as:',
        options: [
          'A real, sensitive file with extra encryption applied',
          'A decoy file placed where an unauthorized user is likely to look, triggering an alert when accessed',
          'A compressed archive of security logs',
          'A file used only for regulatory compliance reporting',
        ],
        correctIndex: 1,
        explanation: 'Honeyfiles contain no genuinely sensitive data — their only purpose is to trigger an alert if accessed.',
      ),
    ],
  ),
];
