import '../lesson_model.dart';

const List<Lesson> fundamentalsLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'Why Cybersecurity Matters Today',
    isAudio: true,
    sections: [
      LessonSection(
        heading: 'Welcome to CyberPulse Academy',
        body:
            'Welcome. This is an audio lesson — sit back and listen as we '
            'walk through why cybersecurity has become one of the most '
            'important topics of our time. A transcript is shown below if '
            'you\'d like to follow along.',
      ),
      LessonSection(
        heading: 'The World Has Changed',
        body:
            'Think about how much of your life exists online. Your bank '
            'account. Your medical records. Your messages with family. '
            'Your work documents. In the space of a generation, virtually '
            'every meaningful thing we do — communicate, shop, work, '
            'access healthcare, run businesses — happens through connected '
            'systems. And that means every one of those things can '
            'potentially be reached, disrupted, or stolen.',
      ),
      LessonSection(
        heading: 'The Numbers Are Staggering',
        body:
            'Cybercrime costs the global economy trillions of dollars '
            'every year. The average time it takes an organization to '
            'detect a breach is measured in months — not hours. And the '
            'fastest-growing category of attack isn\'t some exotic piece '
            'of technology: it\'s a convincing email, sent to one person, '
            'who clicks a link. The most expensive breaches often start '
            'with the simplest tricks.',
      ),
      LessonSection(
        heading: 'It\'s Not Just a Technical Problem',
        body:
            'Here\'s something that surprises a lot of people: most '
            'security failures aren\'t caused by a failure of technology. '
            'They\'re caused by a failure of process, or a failure of '
            'awareness. An unpatched server. A password reused across '
            'accounts. An employee who didn\'t know what a phishing email '
            'looked like. This is actually good news — it means that '
            'knowledge is one of the most powerful defensive tools we '
            'have. Which is why you\'re here.',
      ),
      LessonSection(
        heading: 'What You\'ll Build in This Course',
        body:
            'Over the lessons ahead, you\'re going to build a real '
            'understanding of how attacks work, why defenses are designed '
            'the way they are, and how to think about security the way a '
            'professional does. Not memorizing vendor products. Not '
            'chasing certifications. Genuine understanding, applicable '
            'anywhere. Let\'s get started.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'What is Cybersecurity?',
    sections: [
      LessonSection(
        heading: 'A Working Definition',
        body:
            'Cybersecurity is the practice of protecting computers, '
            'networks, applications, and data from unauthorized access, '
            'attacks, and damage. It combines technology, processes, and '
            'people — all three matter equally.',
      ),
      LessonSection(
        heading: 'The Core Security Domains',
        bullets: [
          'Network Security — protecting the pathways data travels through',
          'Application Security — building software that resists abuse',
          'Endpoint Security — securing laptops, phones, and servers',
          'Identity & Access Management — controlling who can do what',
          'Cloud Security — protecting data and services hosted off-premises',
          'Security Operations — detecting and responding to incidents',
          'Governance, Risk & Compliance — aligning security with business and legal requirements',
        ],
      ),
      LessonSection(
        heading: 'Defense Requires All Three Pillars',
        body:
            'Technology controls like firewalls and encryption can only '
            'do so much. Processes — the documented steps people follow '
            '— fill the gaps between tools. And people, through awareness '
            'and training, remain both the most exploited weakness and the '
            'most powerful last line of defense.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'The CIA Triad: Confidentiality, Integrity & Availability',
    sections: [
      LessonSection(
        heading: 'The Foundation of Every Security Decision',
        body:
            'Almost every security control ever designed exists to protect '
            'one or more of three properties. Together they form the CIA '
            'Triad — the lens through which professionals analyze risk.',
      ),
      LessonSection(
        heading: 'Confidentiality',
        body:
            'Only authorized parties can access sensitive information. '
            'A confidentiality failure means data reaches someone it '
            'shouldn\'t — through a breach, an insecure email, or '
            'overly broad access permissions.',
        bullets: [
          'Controls: encryption, access control lists, need-to-know policies',
          'Failure example: a cloud storage bucket left publicly readable',
        ],
      ),
      LessonSection(
        heading: 'Integrity',
        body:
            'Data is accurate and hasn\'t been altered without '
            'authorization. An integrity failure means information was '
            'modified — by an attacker, a buggy system, or an accident — '
            'without anyone knowing.',
        bullets: [
          'Controls: cryptographic hashing, digital signatures, audit logs',
          'Failure example: malware silently changing a financial transaction',
        ],
      ),
      LessonSection(
        heading: 'Availability',
        body:
            'Systems and data are accessible to authorized users when '
            'needed. An availability failure means legitimate users are '
            'blocked — whether by a DDoS attack, hardware failure, or '
            'ransomware.',
        bullets: [
          'Controls: redundancy, load balancing, backups, DDoS mitigation',
          'Failure example: hospital records system taken offline during a shift',
        ],
      ),
      LessonSection(
        heading: 'Trade-offs Are Unavoidable',
        body:
            'Making data highly available often increases its exposure. '
            'Locking it down tightly can hurt usability. Good security '
            'design balances all three properties based on the actual '
            'sensitivity and criticality of the system.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Threats, Vulnerabilities & Risk',
    sections: [
      LessonSection(
        heading: 'Three Distinct Concepts',
        bullets: [
          'Threat — anything that could cause harm: an attacker, a flood, a disgruntled employee',
          'Vulnerability — a weakness a threat could exploit: unpatched software, weak password, open port',
          'Risk — the combination of likelihood and impact: how likely is the threat to exploit this vulnerability, and how bad would it be?',
        ],
      ),
      LessonSection(
        heading: 'The Attack Surface',
        body:
            'The attack surface is everything exposed to potential '
            'attackers — open ports, public-facing applications, employee '
            'email addresses, physical entry points. Reducing the attack '
            'surface means removing or restricting things that don\'t '
            'need to be exposed.',
      ),
      LessonSection(
        heading: 'Common Threat Categories',
        bullets: [
          'Malware — ransomware, spyware, trojans, worms',
          'Social engineering — phishing, vishing, pretexting',
          'Insider threats — malicious or negligent employees/contractors',
          'Supply chain attacks — compromising a trusted vendor to reach their customers',
          'Zero-day exploits — attacks on vulnerabilities unknown to the vendor',
          'Denial of Service — overwhelming systems to deny legitimate access',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Who Are the Attackers?',
    sections: [
      LessonSection(
        heading: 'Understanding Threat Actors',
        body:
            'Not all attackers are alike. Understanding who is likely to '
            'target you — and why — helps you prioritize where to spend '
            'your defensive effort.',
      ),
      LessonSection(
        heading: 'Threat Actor Types',
        bullets: [
          'Script kiddies — low-skill, use pre-built tools, largely opportunistic',
          'Hacktivists — ideologically motivated, targeting organizations they oppose',
          'Organized crime — financially motivated, well-resourced, often running ransomware or fraud operations',
          'Nation-state actors — highly skilled, strategic long-term objectives, significant resources',
          'Insiders — employees or contractors misusing legitimate access, either maliciously or negligently',
          'Industrial spies — targeting intellectual property for competitive or national advantage',
        ],
      ),
      LessonSection(
        heading: 'Motivations Shape Methods',
        body:
            'A nation-state adversary targeting infrastructure behaves '
            'very differently from a ransomware gang targeting a hospital. '
            'Your defenses should reflect the realistic threats you face — '
            'which means understanding your own value as a target.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Authentication & Access Control',
    sections: [
      LessonSection(
        heading: 'Authentication vs. Authorization',
        bullets: [
          'Authentication — proving identity: "Who are you?"',
          'Authorization — defining permissions: "What are you allowed to do?"',
          'Both must work correctly — authentication alone doesn\'t prevent an authorized user from doing something they shouldn\'t, and authorization alone means nothing if identity isn\'t verified first',
        ],
      ),
      LessonSection(
        heading: 'Authentication Factors',
        bullets: [
          'Something you know — password, PIN',
          'Something you have — phone, hardware token, smart card',
          'Something you are — fingerprint, face, iris',
        ],
      ),
      LessonSection(
        heading: 'Multi-Factor Authentication (MFA)',
        body:
            'MFA combines two or more factors. A stolen password is no '
            'longer enough — an attacker also needs the second factor. '
            'This single control stops the vast majority of account '
            'takeover attacks.',
      ),
      LessonSection(
        heading: 'The Principle of Least Privilege',
        body:
            'Every user, process, and system should have only the minimum '
            'access needed to do its job — nothing more. Limiting access '
            'limits the blast radius when any single account or component '
            'is compromised.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Cryptography in Plain English',
    sections: [
      LessonSection(
        heading: 'What Cryptography Does',
        body:
            'Cryptography converts readable data (plaintext) into an '
            'unreadable form (ciphertext) so only authorized parties '
            'can read it. It also provides tools for verifying integrity '
            'and authenticating identity.',
      ),
      LessonSection(
        heading: 'Symmetric vs. Asymmetric Encryption',
        bullets: [
          'Symmetric — one shared key encrypts and decrypts. Fast, but both parties must securely exchange that key.',
          'Asymmetric — two mathematically linked keys: a public key (share freely) and a private key (never share). Solves the key-exchange problem. Used in HTTPS, SSH, digital signatures.',
        ],
      ),
      LessonSection(
        heading: 'Hashing',
        body:
            'Hashing converts data into a fixed-length fingerprint. '
            'Unlike encryption, it\'s one-way — you can\'t reverse it. '
            'Used to verify file integrity and to store passwords without '
            'keeping the plaintext.',
      ),
      LessonSection(
        heading: 'Where You See This Every Day',
        bullets: [
          'HTTPS — encrypts traffic between browser and website',
          'Password storage — sites store hashes, not your actual password',
          'Code signing — verifying downloaded software wasn\'t tampered with',
          'Email signing — proving a message genuinely came from the claimed sender',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Network Security Overview',
    sections: [
      LessonSection(
        heading: 'Why Networks Are Such a Big Target',
        body:
            'Networks carry everything — credentials, financial data, '
            'private communications, intellectual property. Compromising '
            'a network gives an attacker visibility into and movement '
            'across everything connected to it.',
      ),
      LessonSection(
        heading: 'Key Network Security Concepts',
        bullets: [
          'Segmentation — dividing networks so a breach in one area doesn\'t expose everything',
          'Firewalls — enforcing rules about what traffic is permitted to flow where',
          'Intrusion Detection/Prevention — monitoring for and blocking suspicious traffic',
          'Encryption in transit — ensuring data can\'t be read if intercepted (TLS/HTTPS/VPN)',
          'Network monitoring — logging traffic patterns to detect anomalies',
        ],
      ),
      LessonSection(
        heading: 'Common Network Attacks',
        bullets: [
          'Man-in-the-middle — intercepting communications between two parties',
          'Packet sniffing — capturing unencrypted traffic',
          'DNS spoofing — redirecting users to malicious sites via fake DNS responses',
          'DDoS — flooding systems to deny legitimate access',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Risk Management',
    sections: [
      LessonSection(
        heading: 'The Core Formula',
        body:
            'Risk = Likelihood × Impact. A highly likely threat with '
            'minimal impact may be a lower priority than a less likely '
            'threat that could be catastrophic. Risk management is about '
            'allocating limited resources where they matter most.',
      ),
      LessonSection(
        heading: 'The Risk Management Process',
        bullets: [
          'Identify — what assets exist and what could threaten them',
          'Assess — how likely is each threat, and how severe is the impact',
          'Treat — decide how to respond (avoid, mitigate, transfer, or accept)',
          'Monitor — risks change as technology and business evolve; reassess regularly',
        ],
      ),
      LessonSection(
        heading: 'Four Risk Treatment Strategies',
        bullets: [
          'Avoid — eliminate the activity that creates the risk',
          'Mitigate — implement controls to reduce likelihood or impact',
          'Transfer — shift financial exposure to a third party (e.g. cyber insurance)',
          'Accept — consciously take on the risk because it\'s low enough or too costly to address',
        ],
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Security Policies & Governance',
    sections: [
      LessonSection(
        heading: 'Why Written Policies Matter',
        body:
            'Technology controls without policy are incomplete — they '
            'don\'t tell employees what\'s expected, don\'t establish '
            'accountability, and don\'t satisfy auditors. Policies turn '
            'security intent into enforceable, auditable rules.',
      ),
      LessonSection(
        heading: 'Essential Policy Types',
        bullets: [
          'Acceptable Use Policy (AUP) — what employees may and may not do with company systems',
          'Password Policy — complexity, rotation, and storage requirements',
          'Incident Response Policy — steps to follow when a security event occurs',
          'Data Classification Policy — how to label and handle data by sensitivity',
          'Change Management Policy — ensuring system changes are reviewed and authorized before deployment',
          'BYOD Policy — rules for personal devices accessing company resources',
        ],
      ),
      LessonSection(
        heading: 'Governance Frameworks',
        body:
            'Rather than building a security program from scratch, most '
            'organizations adopt a framework — NIST CSF, ISO 27001, CIS '
            'Controls — that maps what a mature program looks like. These '
            'are vendor-neutral and platform-agnostic, which is why this '
            'course is built around concepts, not products.',
      ),
    ],
  ),

  // 11 ----------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'Which part of the CIA Triad ensures systems remain '
            'accessible to authorized users when needed?',
        options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
        correctIndex: 2,
        explanation: 'Availability means authorized users can access systems and data when they need them.',
      ),
      QuizQuestion(
        question: 'What is the difference between a threat and a vulnerability?',
        options: [
          'They mean the same thing',
          'A threat is a weakness; a vulnerability is a source of harm',
          'A threat is a potential source of harm; a vulnerability is a weakness that could be exploited',
          'Vulnerabilities only apply to hardware',
        ],
        correctIndex: 2,
        explanation: 'Threat = potential danger. Vulnerability = the gap that threat could exploit.',
      ),
      QuizQuestion(
        question: 'Which authentication factor is a hardware token?',
        options: ['Something you know', 'Something you have', 'Something you are', 'Something you feel'],
        correctIndex: 1,
        explanation: 'A hardware token is a physical device — something you have.',
      ),
      QuizQuestion(
        question: 'Why is hashing used for storing passwords instead of encryption?',
        options: [
          'Hashing is faster than encryption',
          'Hashing is reversible, so passwords can be recovered',
          'Hashing is one-way, so even if the stored hash leaks, the original password isn\'t directly recoverable',
          'Encryption doesn\'t work on passwords',
        ],
        correctIndex: 2,
        explanation: 'One-way hashing means a leaked database doesn\'t hand attackers plaintext passwords directly.',
      ),
      QuizQuestion(
        question: 'A company buys cyber insurance instead of building '
            'extra controls for a low-probability risk. Which strategy is this?',
        options: ['Avoid', 'Mitigate', 'Transfer', 'Accept'],
        correctIndex: 2,
        explanation: 'Shifting financial exposure to an insurer is risk transfer.',
      ),
      QuizQuestion(
        question: 'Which threat actor type is typically the most well-funded '
            'and strategically motivated?',
        options: ['Script kiddies', 'Hacktivists', 'Nation-state actors', 'Insiders'],
        correctIndex: 2,
        explanation: 'Nation-state actors have the greatest resources and long-term strategic goals.',
      ),
      QuizQuestion(
        question: 'What does the Principle of Least Privilege mean?',
        options: [
          'All users should have administrator rights for efficiency',
          'Users and processes should have only the minimum access required to do their job',
          'Privileged accounts should never be used',
          'Passwords should be at least 8 characters long',
        ],
        correctIndex: 1,
        explanation: 'Least privilege limits access to minimize the impact of a compromised account.',
      ),
      QuizQuestion(
        question: 'Which of the following is a governance framework used to '
            'structure an organization\'s security program?',
        options: ['BitLocker', 'NIST Cybersecurity Framework', 'WPA3', 'SMTP'],
        correctIndex: 1,
        explanation: 'The NIST CSF is a widely used, vendor-neutral framework for organizing a security program.',
      ),
    ],
  ),
];
