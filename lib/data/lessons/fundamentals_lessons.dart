import '../lesson_model.dart';

const List<Lesson> fundamentalsLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Cybersecurity',
    sections: [
      LessonSection(
        heading: 'What is Cybersecurity?',
        body:
            'Cybersecurity is the practice of protecting computers, networks, '
            'applications, and data from unauthorized access, attacks, and '
            'damage. It combines technology, processes, and people to keep '
            'information systems safe.',
      ),
      LessonSection(
        heading: 'Why It Matters',
        bullets: [
          'Protects personal information from theft and misuse',
          'Prevents financial fraud against individuals and businesses',
          'Secures the systems organizations depend on to operate',
          'Protects governments and critical infrastructure',
          'Ensures people\'s privacy is respected',
        ],
      ),
      LessonSection(
        heading: 'Key Domains of Cybersecurity',
        body:
            'Cybersecurity isn\'t one single discipline — it\'s a set of '
            'overlapping specialties that work together:',
        bullets: [
          'Network Security — protecting the pathways data travels through',
          'Application Security — building software that resists abuse',
          'Endpoint Security — securing laptops, phones, and servers',
          'Identity & Access Management — controlling who can do what',
          'Cloud Security — protecting data and services hosted off-site',
          'Security Operations — detecting and responding to incidents',
        ],
      ),
      LessonSection(
        heading: 'Looking Ahead',
        body:
            'Over the next lessons, you\'ll build on this foundation — '
            'starting with the three core goals every security control is '
            'designed to support: the CIA Triad.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'CIA Triad',
    sections: [
      LessonSection(
        heading: 'What is the CIA Triad?',
        body:
            'The CIA Triad is the foundational model for thinking about '
            'security. Almost every control you\'ll ever study exists to '
            'support one (or more) of these three goals.',
      ),
      LessonSection(
        heading: 'Confidentiality',
        body:
            'Only authorized people or systems can access data. If '
            'confidentiality fails, sensitive information is exposed to '
            'someone who shouldn\'t see it.',
        bullets: [
          'Examples of controls: encryption, access permissions, need-to-know policies',
          'A confidentiality failure: a database leak exposing customer records',
        ],
      ),
      LessonSection(
        heading: 'Integrity',
        body:
            'Data is accurate and hasn\'t been altered without authorization '
            '— whether by an attacker, a bug, or an accident.',
        bullets: [
          'Examples of controls: hashing, digital signatures, version control, audit logs',
          'An integrity failure: an attacker quietly changing a bank transfer amount',
        ],
      ),
      LessonSection(
        heading: 'Availability',
        body:
            'Systems and data are accessible to authorized users whenever '
            'they\'re needed.',
        bullets: [
          'Examples of controls: backups, redundancy, load balancing, DDoS protection',
          'An availability failure: a hospital\'s patient records system going down during a shift',
        ],
      ),
      LessonSection(
        heading: 'Balancing the Three',
        body:
            'The triad often involves trade-offs. Locking data down tightly '
            'can hurt availability; making something highly available can '
            'create more ways to access it. Good security design balances '
            'all three based on what the data and system actually need.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Threats & Vulnerabilities',
    sections: [
      LessonSection(
        heading: 'Threat vs. Vulnerability vs. Risk',
        bullets: [
          'Threat — anything that could cause harm (an attacker, a flood, a disgruntled employee)',
          'Vulnerability — a weakness that a threat could exploit (unpatched software, weak password)',
          'Risk — the likelihood and impact of a threat actually exploiting a vulnerability',
        ],
      ),
      LessonSection(
        heading: 'Common Threat Types',
        bullets: [
          'Malware — malicious software designed to damage or exploit systems',
          'Phishing — deceptive messages tricking people into giving up information',
          'Social engineering — manipulating people rather than systems',
          'Insider threats — harm caused by employees or trusted partners',
          'Denial-of-Service (DoS/DDoS) — overwhelming a system to take it offline',
          'Ransomware — malware that locks data and demands payment',
          'Supply chain attacks — compromising a trusted vendor to reach their customers',
        ],
      ),
      LessonSection(
        heading: 'Common Vulnerability Types',
        bullets: [
          'Unpatched or outdated software',
          'Weak or reused passwords',
          'Misconfigured systems (open ports, default settings left in place)',
          'Lack of employee security awareness',
          'Zero-day flaws — vulnerabilities unknown to the vendor',
        ],
      ),
      LessonSection(
        heading: 'Who Are the Threat Actors?',
        bullets: [
          'Script kiddies — low-skill attackers using existing tools',
          'Hacktivists — motivated by political or social causes',
          'Organized crime — financially motivated, often well-resourced',
          'Nation-states — highly skilled, well-funded, strategic goals',
          'Insiders — employees or contractors misusing legitimate access',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Authentication',
    sections: [
      LessonSection(
        heading: 'Authentication vs. Authorization',
        body:
            'These two terms are often confused. Authentication answers '
            '"who are you?" — proving identity. Authorization answers "what '
            'are you allowed to do?" — deciding permissions once identity is '
            'confirmed.',
      ),
      LessonSection(
        heading: 'The Three Authentication Factors',
        bullets: [
          'Something you know — a password or PIN',
          'Something you have — a phone, hardware token, or smart card',
          'Something you are — a fingerprint, face, or other biometric',
        ],
      ),
      LessonSection(
        heading: 'Multi-Factor Authentication (MFA)',
        body:
            'MFA combines two or more of these factors so that a stolen '
            'password alone isn\'t enough to break in. It\'s one of the '
            'single most effective controls against account takeover.',
      ),
      LessonSection(
        heading: 'Single Sign-On (SSO)',
        body:
            'SSO lets a user authenticate once and access multiple '
            'connected applications without logging in again to each one — '
            'improving both convenience and centralized control.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use long, unique passwords — ideally generated and stored in a password manager',
          'Enable MFA wherever it\'s offered',
          'Never reuse passwords across important accounts',
          'Be cautious of unexpected login or verification prompts',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Cryptography Basics',
    sections: [
      LessonSection(
        heading: 'What is Cryptography?',
        body:
            'Cryptography transforms readable data ("plaintext") into an '
            'unreadable form ("ciphertext") so that only someone with the '
            'right key can read it. It underpins confidentiality and '
            'integrity across the internet.',
      ),
      LessonSection(
        heading: 'Symmetric vs. Asymmetric Encryption',
        bullets: [
          'Symmetric encryption — the same key encrypts and decrypts the data. Fast, but the key must be shared securely between parties.',
          'Asymmetric encryption — uses a public key (shared openly) to encrypt and a private key (kept secret) to decrypt. Slower, but solves the key-sharing problem.',
        ],
      ),
      LessonSection(
        heading: 'Hashing vs. Encryption',
        body:
            'Encryption is reversible — you decrypt it back to the original '
            'with the right key. Hashing is one-way: it turns data into a '
            'fixed-length fingerprint that can\'t be reversed. Hashing is '
            'used to verify integrity and to store passwords without '
            'keeping the original text.',
      ),
      LessonSection(
        heading: 'Digital Signatures & Certificates',
        body:
            'A digital signature proves that a message came from a '
            'specific sender and wasn\'t altered. A digital certificate '
            'binds a public key to an identity (like a website), letting '
            'your browser confirm it\'s really talking to the site it '
            'thinks it is.',
      ),
      LessonSection(
        heading: 'Where You See This Every Day',
        bullets: [
          'HTTPS — encrypts traffic between your browser and a website',
          'End-to-end encrypted messaging apps',
          'Password storage using hashing',
          'Code-signing that verifies software hasn\'t been tampered with',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Risk Management',
    sections: [
      LessonSection(
        heading: 'What is Risk?',
        body:
            'In security, risk is generally thought of as a combination of '
            'how likely a threat is to exploit a vulnerability, and how '
            'much damage it would cause if it did — roughly, '
            'likelihood × impact.',
      ),
      LessonSection(
        heading: 'The Risk Management Process',
        bullets: [
          'Identify — what assets exist, and what could threaten them?',
          'Assess — how likely is each threat, and how severe is the impact?',
          'Treat — decide how to respond to each risk',
          'Monitor — risks change over time, so reassess regularly',
        ],
      ),
      LessonSection(
        heading: 'Ways to Treat a Risk',
        bullets: [
          'Avoid — stop the activity that creates the risk',
          'Mitigate — reduce the likelihood or impact with controls',
          'Transfer — shift the risk elsewhere, e.g. cyber insurance',
          'Accept — knowingly take on the risk because it\'s low enough or too costly to address',
        ],
      ),
      LessonSection(
        heading: 'Why Organizations Do This',
        body:
            'No organization can eliminate all risk or defend against '
            'everything equally. Risk management lets teams prioritize — '
            'spending the most effort on the threats that matter most to '
            'their specific business.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Policies',
    sections: [
      LessonSection(
        heading: 'What Are Security Policies?',
        body:
            'Security policies are formal, written rules that define how an '
            'organization expects people and systems to behave in order to '
            'protect information. They turn security strategy into '
            'something enforceable and auditable.',
      ),
      LessonSection(
        heading: 'Common Policy Types',
        bullets: [
          'Acceptable Use Policy (AUP) — what employees can and can\'t do with company systems',
          'Password Policy — minimum requirements for creating and managing passwords',
          'Incident Response Policy — what to do when something goes wrong',
          'Data Classification Policy — how to label and handle data based on sensitivity',
          'Bring Your Own Device (BYOD) Policy — rules for personal devices accessing company resources',
        ],
      ),
      LessonSection(
        heading: 'Why Policies Matter',
        bullets: [
          'Create consistent expectations across the whole organization',
          'Support legal and regulatory compliance',
          'Provide a basis for accountability when something goes wrong',
          'Give employees clear guidance instead of guesswork',
        ],
      ),
      LessonSection(
        heading: 'The Policy Lifecycle',
        body:
            'Policies aren\'t "set and forget." A healthy lifecycle looks '
            'like: develop the policy, communicate it clearly to everyone '
            'affected, enforce it consistently, and review it periodically '
            'as risks and technology change.',
      ),
    ],
  ),

  // 8 ------------------------------------------------------------------ Quiz
  Lesson(
    title: 'Final Quiz',
    quiz: [
      QuizQuestion(
        question: 'Which of the following best defines cybersecurity?',
        options: [
          'Writing software faster',
          'Protecting computers, networks, applications, and data from unauthorized access and damage',
          'Designing user interfaces',
          'Managing employee payroll systems',
        ],
        correctIndex: 1,
        explanation:
            'Cybersecurity is about protecting systems and data from '
            'unauthorized access, attacks, and damage.',
      ),
      QuizQuestion(
        question: 'In the CIA Triad, what does "Integrity" refer to?',
        options: [
          'Only authorized users can read the data',
          'Systems remain accessible when needed',
          'Data has not been altered without authorization',
          'Employees behave honestly',
        ],
        correctIndex: 2,
        explanation:
            'Integrity means data stays accurate and unaltered unless '
            'changed by an authorized action.',
      ),
      QuizQuestion(
        question: 'A hospital\'s patient records system goes offline during '
            'a shift. Which part of the CIA Triad was most directly '
            'affected?',
        options: [
          'Confidentiality',
          'Integrity',
          'Availability',
          'Authentication',
        ],
        correctIndex: 2,
        explanation:
            'Systems being inaccessible when needed is an availability '
            'failure.',
      ),
      QuizQuestion(
        question: 'What is the key difference between a threat and a '
            'vulnerability?',
        options: [
          'They mean the same thing',
          'A threat is a weakness; a vulnerability is anything that could cause harm',
          'A threat is anything that could cause harm; a vulnerability is a weakness that could be exploited',
          'A vulnerability only applies to software',
        ],
        correctIndex: 2,
        explanation:
            'A threat is a potential danger; a vulnerability is the gap a '
            'threat could exploit.',
      ),
      QuizQuestion(
        question: 'Which threat actor type is typically the most '
            'well-funded and strategically motivated?',
        options: ['Script kiddies', 'Hacktivists', 'Nation-states', 'Insiders'],
        correctIndex: 2,
        explanation:
            'Nation-state actors generally have the most resources and '
            'long-term strategic objectives.',
      ),
      QuizQuestion(
        question: 'What does Multi-Factor Authentication (MFA) add on top '
            'of a password?',
        options: [
          'A second form of proof, such as a phone or fingerprint',
          'A faster login process',
          'A way to skip authentication entirely',
          'A backup password',
        ],
        correctIndex: 0,
        explanation:
            'MFA requires an additional factor beyond "something you know," '
            'so a password alone isn\'t enough to log in.',
      ),
      QuizQuestion(
        question: 'Which statement about encryption and hashing is '
            'correct?',
        options: [
          'Both are reversible with the right key',
          'Encryption is reversible; hashing is one-way',
          'Hashing is reversible; encryption is one-way',
          'Neither can be reversed under any circumstances',
        ],
        correctIndex: 1,
        explanation:
            'Encryption can be decrypted with the correct key; hashing '
            'produces a one-way fingerprint that isn\'t meant to be '
            'reversed.',
      ),
      QuizQuestion(
        question: 'A company decides to purchase cyber insurance instead '
            'of building extra defenses for a low-probability risk. Which '
            'risk treatment strategy is this?',
        options: ['Avoid', 'Mitigate', 'Transfer', 'Accept'],
        correctIndex: 2,
        explanation:
            'Shifting the financial impact of a risk to a third party, '
            'like an insurer, is risk transfer.',
      ),
      QuizQuestion(
        question: 'Which policy would define what employees are allowed to '
            'do with company laptops and accounts?',
        options: [
          'Incident Response Policy',
          'Data Classification Policy',
          'Acceptable Use Policy',
          'BYOD Policy',
        ],
        correctIndex: 2,
        explanation:
            'The Acceptable Use Policy governs how employees may use '
            'company systems and accounts.',
      ),
      QuizQuestion(
        question: 'What is the main purpose of a digital certificate?',
        options: [
          'To speed up internet connections',
          'To bind a public key to a verified identity, such as a website',
          'To store a user\'s password securely',
          'To compress data before sending it',
        ],
        correctIndex: 1,
        explanation:
            'A digital certificate ties a public key to an identity so '
            'others can trust who they\'re really communicating with.',
      ),
    ],
  ),
];
