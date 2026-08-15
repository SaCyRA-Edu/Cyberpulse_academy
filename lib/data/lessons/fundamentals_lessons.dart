import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> fundamentalsLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'What Is Cybersecurity?',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'A Business Imperative, Not Just an IT Problem',
        body:
            'In today\'s interconnected world, organizations rely heavily '
            'on digital technologies to conduct business, communicate '
            'with customers, store sensitive information, and deliver '
            'essential services. As organizations embrace cloud '
            'computing, mobile devices, remote work, artificial '
            'intelligence, and the Internet of Things (IoT), the cyber '
            'threat landscape has become increasingly complex.',
      ),
      LessonSection(
        body:
            'Cybersecurity is no longer solely the responsibility of IT '
            'departments. It has become a business imperative that '
            'affects every employee, executive, supplier, and customer. '
            'Modern cyberattacks can disrupt operations, compromise '
            'confidential information, damage an organization\'s '
            'reputation, and result in significant financial losses.',
      ),
      LessonSection(
        heading: 'What This Chapter Covers',
        body:
            'This chapter introduces the fundamental concepts of '
            'cybersecurity, explains why cybersecurity is essential for '
            'organizations of all sizes, and explores the core '
            'principles that guide modern security programs. It covers:',
        bullets: [
          'What is Cybersecurity?',
          'Why Cybersecurity Matters',
          'Digital Assets',
          'The Cyber Threat Landscape',
          'Business Impact of Cyber Incidents',
          'Enterprise Security Foundations',
        ],
      ),
      LessonSection(
        heading: 'Key Terms',
        body:
            'A few terms recur throughout this chapter and the rest of '
            'this course, so it\'s worth anchoring them early:',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Term', 'Definition'],
          tableRows: [
            ['Asset', 'Anything valuable to an organization that requires protection'],
            ['Cybersecurity', 'The practice of protecting systems, networks, applications, and data from cyber threats'],
            ['Threat', 'A potential event capable of exploiting a vulnerability'],
            ['Vulnerability', 'A weakness that can be exploited by a threat'],
            ['Risk', 'The likelihood and impact of a threat exploiting a vulnerability'],
            ['Attack Surface', 'The collection of all possible entry points an attacker can target'],
            ['Incident', 'An event that compromises confidentiality, integrity, or availability'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Why Cybersecurity Matters',
        body:
            'Every organization — regardless of its size or industry — '
            'depends on digital information to conduct business. '
            'Customer records, financial transactions, intellectual '
            'property, cloud applications, and operational technologies '
            'all represent valuable assets that cybercriminals seek to '
            'exploit.',
      ),
      LessonSection(
        body:
            'Cybersecurity is not simply about protecting computers. It '
            'is about protecting the organization\'s ability to operate, '
            'maintain customer trust, comply with regulations, and '
            'achieve its business objectives. A successful cyberattack '
            'can lead to financial losses, operational disruption, legal '
            'penalties, reputational damage, and even threats to public '
            'safety.',
      ),
      LessonSection(
        body:
            'Organizations are more digitally connected than ever '
            'before. Employees access cloud applications from remote '
            'locations, customers interact through online portals, and '
            'business operations depend on interconnected systems that '
            'must remain available and secure. Cybersecurity enables '
            'organizations to operate safely in this digital environment '
            'by reducing risk, protecting critical information, and '
            'ensuring business continuity.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Why Organizations Invest in Cybersecurity',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Why Organizations Invest in Cybersecurity',
        body: 'Organizations invest in cybersecurity to:',
        bullets: [
          'Protect sensitive business data',
          'Maintain customer trust',
          'Prevent financial fraud',
          'Meet regulatory and contractual obligations',
          'Ensure continuous business operations',
          'Protect intellectual property',
          'Safeguard critical infrastructure',
          'Support digital transformation initiatives',
        ],
      ),
      LessonSection(
        body:
            'Cybersecurity enables organizations to protect critical '
            'business functions while supporting growth and innovation.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/business_impact_categories.jpg',
          caption:
              'Cybersecurity investment protects the organization\'s '
              'ability to operate, not just its computers — data, '
              'customer trust, compliance, and continuity all depend on '
              'it.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Cybersecurity should not be viewed as a cost centre. Mature '
            'organisations treat cybersecurity as a strategic business '
            'enabler that supports innovation, digital transformation, '
            'and sustainable growth.',
      ),
      LessonSection(
        heading: 'The Business Impact of Cyber Incidents',
        body:
            'A cyberattack rarely affects only IT systems. Its '
            'consequences often extend across every part of the '
            'organization.',
      ),
      LessonSection(
        heading: 'Financial Impact',
        body: 'Cyber incidents may result in:',
        bullets: [
          'Incident response costs',
          'Legal expenses',
          'Regulatory fines',
          'Business interruption',
          'Customer compensation',
          'Ransom payments (where applicable)',
          'Increased cyber insurance premiums',
        ],
      ),
      LessonSection(
        heading: 'Operational Impact',
        body: 'Security incidents may disrupt:',
        bullets: [
          'Manufacturing',
          'Customer services',
          'Supply chains',
          'Healthcare systems',
          'Financial transactions',
          'Internal business operations',
        ],
      ),
      LessonSection(
        heading: 'Reputational Impact',
        body:
            'Loss of customer confidence can have long-term '
            'consequences, including reduced sales, declining market '
            'value, and difficulty attracting new customers.',
      ),
      LessonSection(
        body:
            'A single cyber incident can create cascading impacts across '
            'the entire organization — a technical failure in one system '
            'quickly becomes a financial, operational, and reputational '
            'problem all at once.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/cyber_incident_cascade.jpg',
          caption:
              'A single cyber incident can create cascading impacts '
              'across the entire organization.',
        ),
      ),
      LessonSection(
        heading: 'Real-World Case Study — Equifax Data Breach (2017)',
        body:
            'Equifax, one of the largest credit reporting agencies in '
            'the United States, suffered a major data breach after '
            'attackers exploited an unpatched web application '
            'vulnerability. Approximately 147 million individuals had '
            'sensitive information exposed, including names, Social '
            'Security numbers, birth dates, addresses, and driver\'s '
            'license information.',
      ),
      LessonSection(
        heading: 'Business Impact',
        bullets: [
          'Significant financial costs',
          'Regulatory investigations',
          'Leadership changes',
          'Long-term reputational damage',
          'Loss of customer confidence',
        ],
      ),
      LessonSection(
        heading: 'Lessons Learned',
        bullets: [
          'Maintain an effective vulnerability management program',
          'Apply security patches promptly',
          'Continuously monitor Internet-facing applications',
          'Maintain accurate asset inventories',
          'Strengthen incident response capabilities',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Enterprise Digital Assets & the CIA Triad',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Enterprise Digital Assets',
        body:
            'Every organization owns assets that require protection. '
            'While some assets are physical, cybersecurity focuses '
            'primarily on protecting digital assets that support '
            'business operations. Common enterprise digital assets '
            'include:',
        bullets: [
          'Customer Information',
          'Employee Records',
          'Financial Data',
          'Intellectual Property',
          'Email Systems',
          'Business Applications',
          'Databases',
          'Cloud Services',
          'Network Infrastructure',
          'Identity and Access Systems',
          'Security Logs',
          'Backup Data',
        ],
      ),
      LessonSection(
        body:
            'These assets span users, endpoints, servers, databases, '
            'applications, cloud services, identity systems, networks, '
            'IoT devices, and security monitoring — encompassing all '
            'the information systems, infrastructure, and identities '
            'that support business operations.',
      ),
      LessonSection(
        heading: 'The CIA Triad',
        body:
            'The Confidentiality, Integrity, and Availability (CIA) '
            'Triad is the foundation of information security. Nearly '
            'every security control implemented within an organization '
            'supports one or more of these three objectives.',
      ),
      LessonSection(
        heading: 'Confidentiality',
        body:
            'Confidentiality ensures that information is accessible '
            'only to authorized individuals. Examples of supporting '
            'controls include:',
        bullets: [
          'Encryption',
          'Multi-Factor Authentication (MFA)',
          'Access Control Lists (ACLs)',
          'Role-Based Access Control (RBAC)',
          'Data Loss Prevention (DLP)',
        ],
      ),
      LessonSection(
        heading: 'Integrity',
        body:
            'Integrity ensures that information remains accurate, '
            'complete, and protected against unauthorized modification. '
            'Examples include:',
        bullets: [
          'Digital Signatures',
          'Hashing',
          'Version Control',
          'Change Management',
          'File Integrity Monitoring',
        ],
      ),
      LessonSection(
        heading: 'Availability',
        body:
            'Availability ensures that systems and information remain '
            'accessible whenever authorized users require them. Examples '
            'include:',
        bullets: [
          'High Availability Clusters',
          'Redundant Infrastructure',
          'Load Balancers',
          'Backups',
          'Disaster Recovery',
        ],
      ),
      LessonSection(
        body:
            'The CIA Triad represents the three primary objectives of '
            'every information security program — nearly any security '
            'control you encounter is ultimately in service of one of '
            'these three goals.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Objective', 'Goal', 'Common Controls', 'Example'],
          tableRows: [
            ['Confidentiality', 'Prevent unauthorized access', 'Encryption, MFA, RBAC', 'Payroll data visible only to HR'],
            ['Integrity', 'Prevent unauthorized changes', 'Hashing, Digital Signatures', 'Financial records remain accurate'],
            ['Availability', 'Ensure continuous access', 'Backups, Clustering, DR', 'Online banking available 24×7'],
          ],
        ),
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'The CIA Triad in Practice',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Real-World Scenario — Ransomware Attack on a Hospital',
        body:
            'A hospital experiences a ransomware attack that encrypts '
            'patient records and critical clinical systems. Looking at '
            'this incident through the lens of the CIA Triad shows '
            'exactly why all three objectives matter together, not just '
            'individually.',
      ),
      LessonSection(
        heading: 'Impact on the CIA Triad',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Security Objective', 'Effect'],
          tableRows: [
            ['Confidentiality', 'Patient records may be stolen before encryption'],
            ['Integrity', 'Medical records could be altered or corrupted'],
            ['Availability', 'Clinical systems become inaccessible, delaying patient care'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Lessons Learned',
        bullets: [
          'Implement network segmentation',
          'Maintain offline backups',
          'Continuously monitor endpoints',
          'Regularly test disaster recovery plans',
          'Conduct security awareness training',
        ],
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Align cybersecurity initiatives with business objectives',
          'Identify and classify critical digital assets',
          'Apply the CIA Triad when designing security controls',
          'Implement layered security (Defense in Depth)',
          'Continuously monitor, assess, and improve the security posture',
        ],
      ),
      LessonSection(
        heading: 'Summary',
        body:
            'This section explored why cybersecurity is essential for '
            'modern organisations and introduced the foundational '
            'security principles that guide every enterprise security '
            'program. Understanding the business value of cybersecurity '
            'and the CIA Triad provides the context needed to explore '
            'threats, attacks, vulnerabilities, and defensive '
            'technologies in the chapters that follow.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'The Modern Cyber Threat Landscape',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'From Hobbyists to Organized Attackers',
        body:
            'The digital world has transformed how organizations conduct '
            'business, communicate with customers, and manage '
            'information. Unfortunately, these same technologies have '
            'also created new opportunities for cybercriminals. Modern '
            'cyber threats are no longer limited to hobbyists '
            'experimenting with computer systems. Today, organizations '
            'face sophisticated attacks from organized crime groups, '
            'nation-state actors, hacktivists, insider threats, and '
            'automated malware campaigns.',
      ),
      LessonSection(
        body:
            'Cybersecurity professionals must understand not only the '
            'technologies used to defend systems but also the '
            'motivations, tactics, and capabilities of the individuals '
            'and groups behind cyberattacks. Understanding the threat '
            'landscape enables organizations to prioritize security '
            'investments, develop effective defense strategies, and '
            'improve incident response capabilities.',
      ),
      LessonSection(
        heading: 'Understanding the Modern Threat Landscape',
        body:
            'The threat landscape refers to the collection of cyber '
            'threats that may target an organization. As organizations '
            'adopt cloud computing, artificial intelligence, Internet of '
            'Things (IoT), mobile devices, and remote work technologies, '
            'the attack surface continues to expand.',
      ),
      LessonSection(
        body:
            'Modern attacks are often automated, financially motivated, '
            'and highly coordinated. Attackers continuously search for '
            'weaknesses in systems, applications, networks, and user '
            'behavior. Today\'s cybersecurity programs must therefore '
            'combine technology, skilled personnel, and well-defined '
            'processes to identify, prevent, detect, and respond to '
            'these evolving threats.',
      ),
      LessonSection(
        heading: 'Threat Sources',
        bullets: [
          'Nation-State Actors',
          'Cybercriminal Organizations',
          'Insider Threats',
          'Hacktivists',
          'Script Kiddies',
          'Third-Party Vendors',
          'Cloud Threats',
          'Supply Chain Attacks',
          'Ransomware Groups',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Cybersecurity is no longer about defending a network '
            'perimeter. Modern organizations must protect users, '
            'identities, endpoints, applications, cloud services, APIs, '
            'and supply chains simultaneously.',
      ),
      LessonSection(
        heading: 'Threat Actors',
        body:
            'A threat actor is any individual or group capable of '
            'carrying out a cyberattack. Different threat actors have '
            'different motivations, capabilities, resources, and attack '
            'techniques — understanding those differences is what lets '
            'defenders prioritize their limited time and budget '
            'sensibly.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Actor Categories',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Cybercriminals',
        body:
            'Cybercriminals conduct attacks primarily for financial '
            'gain. Examples include:',
        bullets: [
          'Ransomware',
          'Banking Trojans',
          'Business Email Compromise (BEC)',
          'Credit card theft',
          'Cryptocurrency theft',
        ],
      ),
      LessonSection(
        heading: 'Nation-State Actors',
        body:
            'Nation-state attackers are sponsored by governments and '
            'typically possess advanced technical capabilities. Common '
            'objectives include:',
        bullets: [
          'Cyber espionage',
          'Intellectual property theft',
          'Military intelligence',
          'Critical infrastructure disruption',
        ],
      ),
      LessonSection(
        heading: 'Hacktivists',
        body:
            'Hacktivists conduct attacks to promote political, '
            'ideological, or social causes. Typical attacks include:',
        bullets: [
          'Website defacement',
          'Distributed Denial of Service (DDoS)',
          'Data leaks',
          'Public exposure campaigns',
        ],
      ),
      LessonSection(
        heading: 'Insider Threats',
        body:
            'Insider threats originate from employees, contractors, or '
            'business partners who have legitimate access to '
            'organizational resources. Insider threats may be malicious, '
            'negligent, or compromised — the access itself is legitimate '
            'in all three cases, which is exactly what makes this '
            'category hard to detect with perimeter-focused controls.',
      ),
      LessonSection(
        heading: 'Script Kiddies',
        body:
            'Script kiddies have limited technical expertise but use '
            'publicly available hacking tools to exploit vulnerable '
            'systems. Although individually less sophisticated, they can '
            'still cause significant disruption by targeting poorly '
            'secured systems.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/threat_actor_comparison.jpg',
          caption:
              'Threat actors differ significantly in capability, '
              'motivation, and objectives — a nation-state group and a '
              'script kiddie may target the same system for very '
              'different reasons and with very different skill.',
        ),
      ),
      LessonSection(
        heading: 'Threat Actors at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Threat Actor', 'Primary Motivation', 'Skill Level', 'Common Targets'],
          tableRows: [
            ['Cybercriminal', 'Financial gain', 'Medium to High', 'Businesses, financial institutions'],
            ['Nation-State', 'Espionage, disruption', 'Very High', 'Governments, critical infrastructure'],
            ['Hacktivist', 'Political or social causes', 'Medium', 'Public organizations'],
            ['Insider', 'Personal, accidental, or malicious', 'Varies', 'Employer'],
            ['Script Kiddie', 'Curiosity, recognition', 'Low', 'Poorly secured systems'],
          ],
        ),
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Understanding the Attack Surface',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'The Attack Surface',
        body:
            'The attack surface is the total collection of points '
            'through which an attacker may attempt to compromise an '
            'organization. As organizations adopt cloud computing, SaaS '
            'applications, mobile devices, APIs, and remote work '
            'technologies, the attack surface continues to expand.',
      ),
      LessonSection(
        heading: 'External Attack Surface',
        body: 'Examples include:',
        bullets: [
          'Internet-facing web servers',
          'VPN gateways',
          'Cloud applications',
          'Public APIs',
          'Email services',
          'DNS infrastructure',
        ],
      ),
      LessonSection(
        heading: 'Internal Attack Surface',
        body: 'Examples include:',
        bullets: [
          'Employee workstations',
          'Internal servers',
          'File shares',
          'Databases',
          'Wireless networks',
          'Identity infrastructure',
        ],
      ),
      LessonSection(
        heading: 'Human Attack Surface',
        body: 'Examples include:',
        bullets: [
          'Employees',
          'Contractors',
          'Vendors',
          'Business partners',
          'Executives',
          'Remote workers',
        ],
      ),
      LessonSection(
        body:
            'The enterprise attack surface includes technology, people, '
            'processes, and third-party relationships — reducing it '
            'means addressing all four categories, not just hardening '
            'servers.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/attack_surface_components.jpg',
          caption:
              'The enterprise attack surface spans external, internal, '
              'and human components — technology, people, processes, and '
              'third-party relationships all contribute entry points.',
        ),
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Threats, Vulnerabilities, Exploits & Risk',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Four Related but Distinct Concepts',
        body:
            'Threats, vulnerabilities, exploits, and risk are closely '
            'related but represent different aspects of cybersecurity — '
            'conflating them makes it hard to have a precise '
            'conversation about what to fix first.',
      ),
      LessonSection(
        heading: 'Threat',
        body:
            'A threat is any circumstance or event capable of causing '
            'harm. Examples: malware, phishing, insider misuse, and '
            'ransomware.',
      ),
      LessonSection(
        heading: 'Vulnerability',
        body:
            'A vulnerability is a weakness that may be exploited. '
            'Examples: missing patches, weak passwords, misconfigured '
            'firewalls, and default credentials.',
      ),
      LessonSection(
        heading: 'Exploit',
        body:
            'An exploit is the method or code used to take advantage of '
            'a vulnerability. Examples: a buffer overflow exploit, a SQL '
            'injection payload, and a remote code execution exploit.',
      ),
      LessonSection(
        heading: 'Risk',
        body:
            'Risk is the likelihood that a threat will exploit a '
            'vulnerability and the resulting business impact.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/threat_vuln_exploit_risk.jpg',
          caption:
              'A threat needs a vulnerability to act on; an exploit is '
              'how it acts; risk is what\'s at stake if it succeeds — '
              'four distinct links in the same chain.',
        ),
      ),
      LessonSection(
        heading: 'These Four Concepts at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Term', 'Definition', 'Example'],
          tableRows: [
            ['Threat', 'Potential cause of harm', 'Ransomware group'],
            ['Vulnerability', 'Weakness', 'Unpatched server'],
            ['Exploit', 'Method used to attack', 'Remote code execution exploit'],
            ['Risk', 'Likelihood × Impact', 'Business disruption'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Real-World Case Study — SolarWinds Supply Chain Attack',
        body:
            'In 2020, attackers compromised the software build process '
            'of SolarWinds, inserting malicious code into legitimate '
            'software updates. Thousands of organizations unknowingly '
            'installed the compromised updates, providing attackers with '
            'access to sensitive environments.',
      ),
      LessonSection(
        heading: 'Lessons Learned',
        bullets: [
          'Monitor third-party suppliers',
          'Validate software integrity',
          'Implement Zero Trust principles',
          'Continuously monitor privileged activity',
          'Strengthen supply chain security',
        ],
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Continuously identify and reduce the attack surface',
          'Maintain an accurate asset inventory',
          'Patch vulnerabilities promptly',
          'Monitor third-party risks',
          'Implement layered security controls',
          'Conduct regular threat intelligence reviews',
          'Build a strong security awareness program',
        ],
      ),
      LessonSection(
        heading: 'Summary',
        body:
            'Modern organizations face threats from a diverse range of '
            'threat actors with varying motivations and capabilities. '
            'Understanding the attack surface and the relationship '
            'between threats, vulnerabilities, exploits, and risk '
            'enables security professionals to prioritize defenses and '
            'make informed risk management decisions. This knowledge '
            'lays the foundation for the more advanced topics covered '
            'throughout this training guide, where we examine common '
            'attack techniques, malware, social engineering, and '
            'enterprise defensive strategies in greater depth.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Governance & Cybersecurity Frameworks',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Cybersecurity as a Strategic Function',
        body:
            'Cybersecurity has evolved beyond technical controls into a '
            'strategic business function. Organizations today operate in '
            'hybrid environments consisting of on-premises '
            'infrastructure, cloud platforms, mobile devices, '
            'Software-as-a-Service (SaaS) applications, and globally '
            'distributed workforces. Protecting these complex '
            'environments requires structured governance, well-defined '
            'security frameworks, layered defenses, continuous '
            'monitoring, and a mature security culture.',
      ),
      LessonSection(
        heading: 'Security Governance',
        body:
            'Security governance establishes the policies, leadership, '
            'decision-making processes, and accountability necessary to '
            'manage cybersecurity across an organization. It ensures '
            'that cybersecurity initiatives support business objectives '
            'while managing risk effectively. A governance program '
            'defines:',
        bullets: [
          'Security policies',
          'Standards',
          'Procedures',
          'Roles and responsibilities',
          'Risk management processes',
          'Compliance requirements',
          'Executive reporting',
        ],
      ),
      LessonSection(
        body:
            'Good governance ensures that cybersecurity decisions are '
            'consistent, measurable, and aligned with organizational '
            'priorities.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/security_governance.jpg',
          caption:
              'Enterprise security governance aligns cybersecurity '
              'strategy with business objectives through leadership, '
              'policies, and accountability.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Organizations with strong governance programs are better '
            'positioned to respond to evolving cyber threats, '
            'demonstrate regulatory compliance, and make informed '
            'security investments.',
      ),
      LessonSection(
        heading: 'Cybersecurity Frameworks',
        body:
            'Cybersecurity frameworks provide structured guidance for '
            'building, assessing, and improving security programs. They '
            'help organizations implement consistent controls, measure '
            'maturity, and align with industry best practices. Commonly '
            'adopted frameworks are covered below.',
      ),
      LessonSection(
        heading: 'NIST Cybersecurity Framework (CSF)',
        body:
            'The NIST CSF organizes cybersecurity activities into six '
            'core functions: Govern, Identify, Protect, Detect, Respond, '
            'and Recover.',
      ),
      LessonSection(
        heading: 'ISO/IEC 27001',
        body:
            'An internationally recognized standard for establishing, '
            'implementing, maintaining, and continually improving an '
            'Information Security Management System (ISMS).',
      ),
      LessonSection(
        heading: 'CIS Critical Security Controls',
        body:
            'A prioritized set of practical controls designed to help '
            'organizations reduce cyber risk through actionable security '
            'measures.',
      ),
      LessonSection(
        heading: 'MITRE ATT&CK',
        body:
            'A knowledge base of real-world adversary tactics, '
            'techniques, and procedures (TTPs). Security teams use '
            'ATT&CK to improve detection capabilities, threat hunting, '
            'and incident response.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Framework', 'Primary Focus', 'Typical Use'],
          tableRows: [
            ['NIST CSF', 'Cybersecurity lifecycle', 'Enterprise security programs'],
            ['ISO/IEC 27001', 'Information Security Management System (ISMS)', 'Governance and certification'],
            ['CIS Controls', 'Practical security controls', 'Operational security improvements'],
            ['MITRE ATT&CK', 'Adversary tactics and techniques', 'Threat detection and threat hunting'],
          ],
        ),
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'GRC & Defense in Depth',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Governance, Risk, and Compliance (GRC)',
        body:
            'GRC integrates governance, risk management, and compliance '
            'into a unified approach that helps organizations make '
            'informed security decisions.',
      ),
      LessonSection(
        heading: 'Governance',
        body:
            'Ensures that cybersecurity supports business objectives '
            'through policies, oversight, and accountability.',
      ),
      LessonSection(
        heading: 'Risk Management',
        body:
            'Identifies, assesses, prioritizes, and treats risks that '
            'could affect business operations.',
      ),
      LessonSection(
        heading: 'Compliance',
        body:
            'Ensures adherence to applicable laws, regulations, '
            'contractual obligations, and industry standards.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/grc_model.jpg',
          caption:
              'GRC ties governance, risk management, and compliance '
              'together into one coordinated approach, rather than '
              'treating each as a separate, disconnected function.',
        ),
      ),
      LessonSection(
        heading: 'Defense in Depth',
        body:
            'Defense in Depth is a layered security strategy that '
            'deploys multiple complementary security controls. If one '
            'control fails, additional controls continue to protect '
            'organizational assets. Typical layers include:',
        bullets: [
          'Physical Security',
          'Perimeter Security',
          'Network Security',
          'Endpoint Security',
          'Identity and Access Management',
          'Application Security',
          'Data Protection',
          'Security Monitoring',
          'Backup and Recovery',
        ],
      ),
      LessonSection(
        body:
            'Defense in Depth reduces organizational risk by applying '
            'multiple layers of complementary security controls — an '
            'attacker who gets past one layer still has to get past the '
            'next.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/defense_in_depth.jpg',
          caption:
              'Defense in Depth reduces organizational risk by applying '
              'multiple layers of complementary security controls.',
        ),
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Zero Trust & the Security Operations Center',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Zero Trust',
        body:
            'Traditional security models assumed that users inside the '
            'corporate network could be trusted. Modern organizations '
            'recognize that threats can originate from both inside and '
            'outside the network. Zero Trust follows the principle of '
            '"Never Trust, Always Verify." Every request for access is '
            'evaluated based on:',
        bullets: [
          'User identity',
          'Device health',
          'Location',
          'Risk level',
          'Application sensitivity',
          'Continuous monitoring',
        ],
      ),
      LessonSection(
        body:
            'Zero Trust continuously validates every access request '
            'before granting access to enterprise resources — trust is '
            'never assumed just because a request came from inside the '
            'network perimeter.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/zero_trust_model.jpg',
          caption:
              'Zero Trust continuously validates every access request '
              'before granting access to enterprise resources.',
        ),
      ),
      LessonSection(
        heading: 'Security Operations Center (SOC)',
        body:
            'A Security Operations Center (SOC) is responsible for '
            'continuously monitoring, detecting, investigating, and '
            'responding to cybersecurity events across the organization. '
            'Typical SOC responsibilities include:',
        bullets: [
          'Security monitoring',
          'Alert triage',
          'Incident response',
          'Threat hunting',
          'Digital forensics',
          'Vulnerability coordination',
          'Security reporting',
        ],
      ),
      LessonSection(
        body:
            'A modern Security Operations Center integrates security '
            'telemetry from across the enterprise to detect and respond '
            'to cyber threats.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/soc_operations.jpg',
          caption:
              'A modern Security Operations Center integrates security '
              'telemetry from across the enterprise to detect and '
              'respond to cyber threats.',
        ),
      ),
      LessonSection(
        heading: 'Real-World Case Study — Colonial Pipeline',
        body:
            'In 2021, Colonial Pipeline experienced a ransomware attack '
            'that disrupted fuel distribution across the eastern United '
            'States. Although operational technology systems were not '
            'directly encrypted, business operations were suspended to '
            'contain the incident.',
      ),
      LessonSection(
        heading: 'Lessons Learned',
        bullets: [
          'Implement Multi-Factor Authentication for remote access',
          'Segment IT and operational technology (OT) networks',
          'Continuously monitor privileged accounts',
          'Maintain tested incident response and business continuity plans',
          'Develop resilient backup and recovery capabilities',
        ],
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Career Pathways in Cybersecurity',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'A Wide Range of Roles',
        body:
            'Cybersecurity offers diverse career opportunities across '
            'technical, operational, governance, and leadership domains. '
            'Common roles include:',
        bullets: [
          'Security Analyst',
          'SOC Analyst',
          'Incident Responder',
          'Threat Hunter',
          'Vulnerability Management Engineer',
          'Penetration Tester',
          'Cloud Security Engineer',
          'Identity and Access Management Engineer',
          'Security Architect',
          'Governance, Risk & Compliance Analyst',
          'Digital Forensics Investigator',
          'Security Manager',
          'Chief Information Security Officer (CISO)',
        ],
      ),
      LessonSection(
        body:
            'Cybersecurity offers multiple career pathways spanning '
            'technical, operational, governance, and executive '
            'leadership roles — there is no single "right" entry point, '
            'and many professionals move between these tracks over the '
            'course of a career.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/cybersecurity_career_paths.jpg',
          caption:
              'Cybersecurity offers multiple career pathways spanning '
              'technical, operational, governance, and executive '
              'leadership roles.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Align cybersecurity strategy with business objectives',
          'Adopt recognized cybersecurity frameworks',
          'Implement Defense in Depth',
          'Embrace Zero Trust principles',
          'Continuously monitor and improve the security posture',
          'Invest in employee awareness and training',
          'Regularly assess risks and update security controls',
          'Foster collaboration between security teams and business units',
        ],
      ),
      LessonSection(
        heading: 'Chapter Summary',
        body:
            'This chapter introduced the core concepts that form the '
            'foundation of cybersecurity. You explored why cybersecurity '
            'is essential, how organizations protect their digital '
            'assets, the principles of confidentiality, integrity, and '
            'availability, the evolving threat landscape, and the '
            'governance structures that enable effective security '
            'programs.',
      ),
      LessonSection(
        body:
            'Cybersecurity is not a single product or technology. It is '
            'a continuous process involving people, processes, '
            'technology, and leadership working together to reduce risk '
            'and support business objectives. These foundational '
            'concepts prepare you to explore the technical aspects of '
            'cybersecurity, including threats, attacks, vulnerabilities, '
            'identity and access management, network security, cloud '
            'security, and incident response in the chapters that '
            'follow.',
      ),
    ],
  ),

  // 13 — Practice Quiz -------------------------------------------------------
  Lesson(
    title: 'Practice Quiz: Cybersecurity Fundamentals',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    quiz: [
      QuizQuestion(
        question: 'Why is cybersecurity considered a business imperative rather than solely an IT responsibility?',
        options: [
          'It only affects the IT department\'s budget',
          'Modern cyberattacks can disrupt operations, compromise information, damage reputation, and cause financial loss across the whole organization',
          'It is required only for publicly traded companies',
          'It has no measurable business impact',
        ],
        correctIndex: 1,
        explanation: 'Cyberattacks affect every part of an organization, not just IT systems, which is why cybersecurity has become a business-wide concern.',
      ),
      QuizQuestion(
        question: 'What does the "A" in the CIA Triad stand for, and what does it guarantee?',
        options: [
          'Authentication — verifying user identity',
          'Availability — systems and information remain accessible to authorized users when needed',
          'Authorization — determining user permissions',
          'Accountability — tracking who did what',
        ],
        correctIndex: 1,
        explanation: 'Availability ensures that systems and information remain accessible whenever authorized users require them, supported by controls like backups, clustering, and disaster recovery.',
      ),
      QuizQuestion(
        question: 'A hospital\'s ransomware attack encrypts patient records, delaying care. Which CIA Triad objective is most directly affected by systems becoming inaccessible?',
        options: [
          'Confidentiality',
          'Integrity',
          'Availability',
          'Accountability',
        ],
        correctIndex: 2,
        explanation: 'When clinical systems become inaccessible, availability is the primary objective affected, even though confidentiality and integrity may also be at risk.',
      ),
      QuizQuestion(
        question: 'What primarily motivates cybercriminals, as distinct from nation-state actors?',
        options: [
          'Political or social causes',
          'Financial gain',
          'Curiosity and recognition',
          'Espionage and military intelligence',
        ],
        correctIndex: 1,
        explanation: 'Cybercriminals conduct attacks primarily for financial gain, such as ransomware, banking trojans, and cryptocurrency theft.',
      ),
      QuizQuestion(
        question: 'Which threat actor category is described as having "advanced technical capabilities" and government sponsorship?',
        options: [
          'Script Kiddies',
          'Hacktivists',
          'Nation-State Actors',
          'Insider Threats',
        ],
        correctIndex: 2,
        explanation: 'Nation-state attackers are sponsored by governments and typically possess advanced technical capabilities, often pursuing espionage or critical infrastructure disruption.',
      ),
      QuizQuestion(
        question: 'An employee accidentally emails a sensitive file to the wrong recipient. What category of threat actor does this represent?',
        options: [
          'Hacktivist',
          'Nation-state actor',
          'Insider threat (negligent)',
          'Script kiddie',
        ],
        correctIndex: 2,
        explanation: 'Insider threats may be malicious, negligent, or compromised — an accidental data exposure by a legitimate employee is a negligent insider threat.',
      ),
      QuizQuestion(
        question: 'Which of the following is part of the External Attack Surface rather than the Internal Attack Surface?',
        options: [
          'Employee workstations',
          'Internal file shares',
          'Internet-facing web servers',
          'Internal identity infrastructure',
        ],
        correctIndex: 2,
        explanation: 'Internet-facing web servers, VPN gateways, and public APIs are part of the external attack surface, exposed directly to the internet.',
      ),
      QuizQuestion(
        question: 'What is the correct relationship between a threat, a vulnerability, and an exploit?',
        options: [
          'A vulnerability uses an exploit to create a threat',
          'A threat is a potential event that could exploit a vulnerability; an exploit is the method used to actually take advantage of it',
          'These three terms are interchangeable',
          'An exploit always precedes a vulnerability',
        ],
        correctIndex: 1,
        explanation: 'A threat is a potential event capable of exploiting a vulnerability, while an exploit is the specific method or code used to actually take advantage of that weakness.',
      ),
      QuizQuestion(
        question: 'How is risk best defined in cybersecurity terms?',
        options: [
          'The total number of vulnerabilities in a system',
          'The likelihood that a threat will exploit a vulnerability, combined with the resulting business impact',
          'The cost of a firewall',
          'The number of employees with administrative access',
        ],
        correctIndex: 1,
        explanation: 'Risk is the likelihood that a threat will exploit a vulnerability and the resulting business impact — combining probability and consequence.',
      ),
      QuizQuestion(
        question: 'What made the SolarWinds attack (2020) a "supply chain attack"?',
        options: [
          'Attackers targeted SolarWinds\' physical warehouses',
          'Attackers compromised the software build process, inserting malicious code into legitimate updates that customers then installed',
          'Attackers only affected SolarWinds\' own internal network',
          'It was a denial-of-service attack against SolarWinds\' website',
        ],
        correctIndex: 1,
        explanation: 'Attackers compromised SolarWinds\' software build process, so thousands of organizations unknowingly installed compromised legitimate updates.',
      ),
      QuizQuestion(
        question: 'Which of the six NIST Cybersecurity Framework (CSF) core functions comes first?',
        options: [
          'Protect',
          'Detect',
          'Govern',
          'Recover',
        ],
        correctIndex: 2,
        explanation: 'The NIST CSF organizes activities into six core functions: Govern, Identify, Protect, Detect, Respond, and Recover.',
      ),
      QuizQuestion(
        question: 'Which framework is described as "a knowledge base of real-world adversary tactics, techniques, and procedures (TTPs)"?',
        options: [
          'ISO/IEC 27001',
          'CIS Critical Security Controls',
          'MITRE ATT&CK',
          'NIST CSF',
        ],
        correctIndex: 2,
        explanation: 'MITRE ATT&CK catalogs real-world adversary tactics, techniques, and procedures, and is widely used to improve detection and threat hunting.',
      ),
      QuizQuestion(
        question: 'In the GRC model, which component "identifies, assesses, prioritizes, and treats risks that could affect business operations"?',
        options: [
          'Governance',
          'Risk Management',
          'Compliance',
          'Defense in Depth',
        ],
        correctIndex: 1,
        explanation: 'Risk Management is the GRC component focused on identifying, assessing, prioritizing, and treating organizational risks.',
      ),
      QuizQuestion(
        question: 'What is the core idea behind Defense in Depth?',
        options: [
          'Relying on a single, very strong security control',
          'Deploying multiple complementary security controls so that if one fails, others continue to protect the organization',
          'Only securing the network perimeter',
          'Outsourcing all security functions to a third party',
        ],
        correctIndex: 1,
        explanation: 'Defense in Depth is a layered security strategy — if one control fails, additional layers continue to provide protection.',
      ),
      QuizQuestion(
        question: 'What does the Zero Trust principle "Never Trust, Always Verify" mean in practice?',
        options: [
          'Users inside the corporate network are automatically trusted',
          'Every access request is evaluated based on identity, device health, location, and risk, regardless of network location',
          'Only external users need to be verified',
          'Verification happens once at initial login and never again',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust continuously evaluates every access request based on multiple factors, rejecting the older assumption that being inside the network implies trustworthiness.',
      ),
      QuizQuestion(
        question: 'Which of the following is NOT a typical Security Operations Center (SOC) responsibility?',
        options: [
          'Alert triage',
          'Threat hunting',
          'Setting corporate financial budgets',
          'Digital forensics',
        ],
        correctIndex: 2,
        explanation: 'SOC responsibilities include security monitoring, alert triage, incident response, threat hunting, digital forensics, vulnerability coordination, and security reporting — not financial budgeting.',
      ),
      QuizQuestion(
        question: 'In the 2021 Colonial Pipeline incident, why were business operations suspended even though OT systems weren\'t directly encrypted?',
        options: [
          'To comply with a government shutdown order',
          'To contain the incident, since IT and OT networks were not adequately segmented',
          'Because the ransomware demanded it',
          'Fuel supplies had physically run out',
        ],
        correctIndex: 1,
        explanation: 'Although OT systems were not directly encrypted, operations were suspended to contain the incident — a key lesson being the importance of segmenting IT and OT networks.',
      ),
      QuizQuestion(
        question: 'Which cybersecurity role is most focused on proactively searching for threats that automated tools have not yet detected?',
        options: [
          'Threat Hunter',
          'Security Architect',
          'GRC Analyst',
          'CISO',
        ],
        correctIndex: 0,
        explanation: 'A Threat Hunter proactively searches for indicators of compromise and attacker activity that hasn\'t triggered automated alerts.',
      ),
      QuizQuestion(
        question: 'Which best describes the relationship between cybersecurity frameworks like NIST CSF and an organization\'s security program?',
        options: [
          'Frameworks replace the need for a security program entirely',
          'Frameworks provide structured guidance for building, assessing, and improving a security program consistently',
          'Frameworks are only relevant to government agencies',
          'Frameworks are legally binding regulations in all countries',
        ],
        correctIndex: 1,
        explanation: 'Cybersecurity frameworks provide structured guidance that helps organizations implement consistent controls and measure security maturity — they inform a program rather than replace it.',
      ),
      QuizQuestion(
        question: 'What is the most accurate summary of what cybersecurity fundamentally is, per this chapter?',
        options: [
          'A single product an organization purchases once',
          'A continuous process involving people, processes, technology, and leadership working together to reduce risk',
          'Exclusively a technical function performed by IT staff',
          'A one-time compliance certification',
        ],
        correctIndex: 1,
        explanation: 'Cybersecurity is a continuous process involving people, processes, technology, and leadership working together — not a single product or one-time achievement.',
      ),
    ],
  ),
];
