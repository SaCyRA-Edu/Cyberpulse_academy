import '../lesson_model.dart';

const List<Lesson> capstoneLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Defense in Depth',
    sections: [
      LessonSection(
        heading: 'One Control Is Never Enough',
        body:
            'Defense in depth means layering multiple, independent '
            'security controls so that if one fails, others are still in '
            'place to catch the problem. By this point you\'ve studied '
            'controls at every layer — network, endpoint, identity, '
            'detection — and a mature security program weaves them '
            'together rather than relying on any single one.',
      ),
      LessonSection(
        heading: 'A Worked Example',
        body:
            'Consider a phishing email that slips past a spam filter. '
            'Defense in depth might still stop the attack through: email '
            'link-scanning, endpoint protection blocking the resulting '
            'malware, network segmentation limiting lateral movement, and '
            'finally a SOC analyst catching the unusual activity in the '
            'SIEM. No single layer was perfect — together, they held.',
      ),
      LessonSection(
        heading: 'Why This Mindset Matters at the Expert Level',
        body:
            'Junior practitioners often look for "the" fix. Experienced '
            'practitioners design for failure at every layer, because '
            'they assume — correctly — that any individual control can and '
            'eventually will fail.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Modeling',
    sections: [
      LessonSection(
        heading: 'What is Threat Modeling?',
        body:
            'Threat modeling is a structured way to ask "what could go '
            'wrong, and where?" before something is built or deployed, '
            'rather than discovering the answer the hard way after an '
            'incident.',
      ),
      LessonSection(
        heading: 'A Simple Framework: STRIDE',
        body:
            'One widely used framework breaks threats into six '
            'categories, each tied to a security property:',
        bullets: [
          'Spoofing — pretending to be something or someone else',
          'Tampering — modifying data or code without authorization',
          'Repudiation — denying having performed an action',
          'Information Disclosure — exposing data to unauthorized parties',
          'Denial of Service — degrading or denying availability',
          'Elevation of Privilege — gaining capabilities beyond what was granted',
        ],
      ),
      LessonSection(
        heading: 'Putting It Into Practice',
        body:
            'A practical threat model usually starts with a diagram of the '
            'system, identifies trust boundaries (where data crosses from '
            'one trust level to another), and then walks through each '
            'STRIDE category for every boundary — asking what could go '
            'wrong and whether an existing control already addresses it.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Ethical Hacking & Authorized Testing',
    sections: [
      LessonSection(
        heading: 'What Penetration Testing Is',
        body:
            'Penetration testing simulates an attacker\'s approach against '
            'a system — with explicit, written authorization — to find '
            'exploitable weaknesses before a real attacker does.',
      ),
      LessonSection(
        heading: 'Why Authorization Is the Whole Point',
        body:
            'The single thing separating a penetration tester from an '
            'attacker is permission. Legitimate testing always starts with '
            'a signed Rules of Engagement document defining exactly what\'s '
            'in scope, what techniques are allowed, and who to contact if '
            'something unexpected happens. Testing systems without '
            'explicit authorization is illegal in most jurisdictions, '
            'regardless of intent.',
      ),
      LessonSection(
        heading: 'The General Phases',
        bullets: [
          'Scoping & Rules of Engagement — agreeing what\'s being tested and how',
          'Reconnaissance — gathering information about the target within scope',
          'Testing — attempting to find and validate weaknesses',
          'Reporting — documenting findings with enough detail for the organization to fix them',
          'Remediation Verification — confirming fixes actually worked',
        ],
      ),
      LessonSection(
        heading: 'Related Concepts',
        bullets: [
          'Vulnerability scanning — automated discovery of known weaknesses, often a precursor to manual testing',
          'Bug bounty programs — organizations inviting researchers to report findings, within published scope, for a reward',
          'Red team vs. Blue team — red teams simulate attackers, blue teams defend; purple teaming combines both for shared learning',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Digital Forensics Fundamentals',
    sections: [
      LessonSection(
        heading: 'What Digital Forensics Is For',
        body:
            'Digital forensics is the practice of preserving, collecting, '
            'and analyzing digital evidence in a way that\'s reliable '
            'enough to support an investigation — and, where needed, hold '
            'up legally.',
      ),
      LessonSection(
        heading: 'Chain of Custody',
        body:
            'Every step of who handled evidence, when, and how must be '
            'documented. If this chain is broken, the evidence\'s '
            'reliability — and sometimes its admissibility — can be '
            'challenged.',
      ),
      LessonSection(
        heading: 'Core Principles',
        bullets: [
          'Preserve original evidence — work from copies/images, never the original where possible',
          'Document everything — timestamps, actions taken, tools used',
          'Maintain integrity — use hashing to prove evidence wasn\'t altered during analysis',
          'Order of volatility — collect the most easily lost evidence first (e.g. memory contents before disk contents)',
        ],
      ),
      LessonSection(
        heading: 'How This Connects to Incident Response',
        body:
            'Forensics and incident response overlap heavily — a SOC '
            'investigating a breach is often doing lightweight forensics '
            'in real time, while dedicated forensic specialists may later '
            'perform a deeper, more rigorous analysis for legal or '
            'insurance purposes.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Architecture & Zero Trust',
    sections: [
      LessonSection(
        heading: 'From Perimeter to Zero Trust',
        body:
            'Traditional security architecture assumed a strong perimeter '
            '— trust everything inside the network, be suspicious of '
            'everything outside it. Zero Trust rejects that assumption '
            'entirely: trust nothing by default, and verify every request '
            'regardless of where it originates.',
      ),
      LessonSection(
        heading: 'Core Zero Trust Principles',
        bullets: [
          'Verify explicitly — authenticate and authorize every request, every time',
          'Use least privilege access — grant the minimum access needed, and nothing more',
          'Assume breach — design systems expecting that some component will eventually be compromised',
        ],
      ),
      LessonSection(
        heading: 'Why This Shift Happened',
        body:
            'Cloud services, remote work, and mobile devices broke the old '
            'idea of a single network "perimeter." Users and data now live '
            'everywhere — so security had to move from "defend the '
            'boundary" to "verify every interaction."',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Governance, Risk & Compliance (GRC)',
    sections: [
      LessonSection(
        heading: 'What GRC Covers',
        bullets: [
          'Governance — the structures and decision-making that direct a security program',
          'Risk — identifying, assessing, and managing risk (building on the Risk Management lesson earlier in this course)',
          'Compliance — meeting legal, regulatory, and contractual obligations',
        ],
      ),
      LessonSection(
        heading: 'Why Frameworks Matter',
        body:
            'Rather than reinventing security programs from scratch, most '
            'organizations build on established, vendor-neutral '
            'frameworks — such as the NIST Cybersecurity Framework or '
            'ISO/IEC 27001 — that describe what a mature program should '
            'cover, without dictating specific products.',
      ),
      LessonSection(
        heading: 'Compliance Isn\'t the Same as Security',
        body:
            'Passing an audit confirms an organization met a defined '
            'baseline — it doesn\'t guarantee the organization is actually '
            'secure. Treating compliance as the finish line, rather than '
            'the floor, is one of the more common mistakes in mature '
            'security programs.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Bringing It All Together',
    sections: [
      LessonSection(
        heading: 'How the Pieces Fit',
        body:
            'Across this course, you\'ve covered the foundations '
            '(Fundamentals, Email Security), the infrastructure layer '
            '(Networking, Windows Security), the operating system and '
            'detection layer (Linux Security, SOC Operations), and now the '
            'strategic layer (threat modeling, testing, forensics, '
            'architecture, governance). Real security work moves fluidly '
            'across all of these — an incident might start with a phishing '
            'email and end with a forensic report informing a governance '
            'policy change.',
      ),
      LessonSection(
        heading: 'Staying Vendor-Neutral',
        body:
            'Notice that nothing in this course was tied to a specific '
            'product or certification body. The concepts here — CIA '
            'Triad, defense in depth, least privilege, Zero Trust, GRC '
            'frameworks — apply whether you\'re working with Windows, '
            'Linux, AWS, on-premises infrastructure, or anything else. '
            'Vendor-specific tools change constantly; these principles are '
            'what stay useful.',
      ),
      LessonSection(
        heading: 'Where to Go From Here',
        body:
            'This course is a strong foundation, not a finish line. '
            'From here, many people specialize — into SOC/detection, '
            'penetration testing, cloud security, governance/compliance, '
            'or security engineering — building deeper expertise on top of '
            'the broad base you\'ve built across these four levels.',
      ),
    ],
  ),

  // 8 ------------------------------------------------------------------ Quiz
  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'What does "defense in depth" mean?',
        options: [
          'Relying on a single very strong control',
          'Layering multiple independent controls so one failure doesn\'t mean total compromise',
          'Only securing the network perimeter',
          'Avoiding the use of firewalls',
        ],
        correctIndex: 1,
        explanation:
            'Defense in depth layers controls so failures at one layer '
            'are caught by another.',
      ),
      QuizQuestion(
        question: 'In the STRIDE threat model, what does the "S" stand for?',
        options: ['Sabotage', 'Spoofing', 'Scanning', 'Segmentation'],
        correctIndex: 1,
        explanation: 'Spoofing means pretending to be something or someone else.',
      ),
      QuizQuestion(
        question: 'What single thing legally separates a penetration tester '
            'from an attacker?',
        options: [
          'Using more advanced tools',
          'Explicit, written authorization to test',
          'Working only at night',
          'Being employed by a large company',
        ],
        correctIndex: 1,
        explanation:
            'Authorization is what makes testing legal and legitimate.',
      ),
      QuizQuestion(
        question: 'In digital forensics, what does "order of volatility" '
            'guide?',
        options: [
          'Which evidence to collect first, based on how easily it could be lost',
          'The order employees are interviewed',
          'How loudly an alarm should sound',
          'The order software updates are installed',
        ],
        correctIndex: 0,
        explanation:
            'More volatile evidence (like memory contents) should be '
            'collected before more persistent evidence (like disk data).',
      ),
      QuizQuestion(
        question: 'Which principle is central to a Zero Trust architecture?',
        options: [
          'Trust everything inside the network perimeter',
          'Verify every request explicitly, regardless of origin',
          'Disable all authentication for internal traffic',
          'Rely on a single perimeter firewall',
        ],
        correctIndex: 1,
        explanation:
            'Zero Trust verifies every request rather than assuming '
            'internal traffic is safe.',
      ),
      QuizQuestion(
        question: 'Why is "compliance" not the same thing as "security"?',
        options: [
          'They are exactly the same',
          'Passing an audit confirms a defined baseline was met, not that the organization is fully secure',
          'Compliance only applies to small companies',
          'Security frameworks never include compliance requirements',
        ],
        correctIndex: 1,
        explanation:
            'Compliance is a floor, not a guarantee of actual security.',
      ),
      QuizQuestion(
        question: 'Why is this course described as "vendor-neutral"?',
        options: [
          'It only covers free software',
          'The core concepts taught apply across platforms and aren\'t tied to a specific product or certification body',
          'It avoids teaching any technical detail',
          'It only covers cloud providers',
        ],
        correctIndex: 1,
        explanation:
            'Concepts like the CIA Triad, least privilege, and Zero Trust '
            'apply regardless of vendor or platform.',
      ),
    ],
  ),
];
