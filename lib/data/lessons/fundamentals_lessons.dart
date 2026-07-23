import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> fundamentalsLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'What Is Cybersecurity?',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'A World Built on Digital Technology',
        body:
            'In today\'s interconnected world, organizations rely '
            'heavily on digital technologies to conduct business, '
            'communicate with customers, store sensitive information, '
            'and deliver essential services. As organizations embrace '
            'cloud computing, mobile devices, remote work, artificial '
            'intelligence, and the Internet of Things (IoT), the cyber '
            'threat landscape has become increasingly complex.',
      ),
      LessonSection(
        heading: 'A Business Imperative, Not Just an IT Task',
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
        bullets: [
          'What is cybersecurity?',
          'Why cybersecurity matters',
          'Information security vs. cybersecurity',
          'People, process, and technology',
          'Digital assets',
          'The cyber threat landscape',
          'Business impact of cyber incidents',
          'Enterprise security foundations',
        ],
      ),
      LessonSection(
        heading: 'Key Terms',
      ),
      LessonSection(
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
        heading: 'Information Security vs. Cybersecurity',
        body:
            'These two terms are often used interchangeably, but they '
            'aren\'t quite identical. Information security is the '
            'broader discipline — protecting information in any form, '
            'whether digital, printed, or spoken. Cybersecurity is a '
            'subset of information security specifically focused on '
            'protecting digital systems, networks, applications, and '
            'data from cyber threats. Every cybersecurity control is '
            'also an information security control, but information '
            'security also covers things like physical document '
            'shredding and verbal confidentiality that fall outside '
            'cybersecurity\'s scope.',
      ),
      LessonSection(
        heading: 'People, Process, and Technology',
        body:
            'Effective cybersecurity depends on three interconnected '
            'pillars working together — no single pillar can carry a '
            'security program alone.',
        bullets: [
          'People — employees, security teams, and leadership who understand their security responsibilities and follow good practices',
          'Process — the policies, procedures, and workflows that define how security is actually implemented and maintained day to day',
          'Technology — the tools and systems (firewalls, encryption, monitoring platforms) that enforce and support security objectives',
        ],
      ),
      LessonSection(
        heading: 'Why All Three Pillars Matter Together',
        body:
            'An organization with excellent security technology but '
            'untrained employees remains vulnerable to phishing and '
            'social engineering. An organization with well-trained '
            'staff but no formal processes struggles to respond '
            'consistently to incidents. Mature security programs '
            'invest in all three pillars simultaneously, rather than '
            'treating cybersecurity as purely a technology purchase.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Why Cybersecurity Matters',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Every Organization Depends on Digital Information',
        body:
            'Every organization — regardless of its size or industry — '
            'depends on digital information to conduct business. '
            'Customer records, financial transactions, intellectual '
            'property, cloud applications, and operational technologies '
            'all represent valuable assets that cybercriminals seek to '
            'exploit.',
      ),
      LessonSection(
        heading: 'More Than Just Protecting Computers',
        body:
            'Cybersecurity is not simply about protecting computers. '
            'It is about protecting the organization\'s ability to '
            'operate, maintain customer trust, comply with regulations, '
            'and achieve its business objectives. A successful '
            'cyberattack can lead to financial losses, operational '
            'disruption, legal penalties, reputational damage, and even '
            'threats to public safety.',
      ),
      LessonSection(
        heading: 'Why Organizations Invest in Cybersecurity',
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
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_4_why_invest.jpg',
          caption:
              'Cybersecurity enables organizations to protect critical '
              'business functions while supporting growth and innovation.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Cybersecurity should not be viewed as a cost center. '
            'Mature organizations treat cybersecurity as a strategic '
            'business enabler that supports innovation, digital '
            'transformation, and sustainable growth.',
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
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_5_business_impact.jpg',
          caption: 'A single cyber incident can create cascading impacts across the entire organization.',
        ),
      ),
      LessonSection(
        heading: 'Real-World Case Study: The Equifax Data Breach (2017)',
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
          'Continuously monitor internet-facing applications',
          'Maintain accurate asset inventories',
          'Strengthen incident response capabilities',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Enterprise Digital Assets & The CIA Triad',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Assets That Require Protection',
        body:
            'Every organization owns assets that require protection. '
            'While some assets are physical, cybersecurity focuses '
            'primarily on protecting digital assets that support '
            'business operations.',
      ),
      LessonSection(
        heading: 'Common Enterprise Digital Assets',
        bullets: [
          'Customer information',
          'Employee records',
          'Financial data',
          'Intellectual property',
          'Email systems',
          'Business applications',
          'Databases',
          'Cloud services',
          'Network infrastructure',
          'Identity and access systems',
          'Security logs',
          'Backup data',
        ],
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
            'only to authorized individuals.',
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
            'complete, and protected against unauthorized modification.',
        bullets: [
          'Digital signatures',
          'Hashing',
          'Version control',
          'Change management',
          'File integrity monitoring',
        ],
      ),
      LessonSection(
        heading: 'Availability',
        body:
            'Availability ensures that systems and information remain '
            'accessible whenever authorized users require them.',
        bullets: [
          'High availability clusters',
          'Redundant infrastructure',
          'Load balancers',
          'Backups',
          'Disaster recovery',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_7_cia_triad.jpg',
          caption: 'The CIA Triad represents the three primary objectives of every information security program.',
        ),
      ),
      LessonSection(
        heading: 'CIA Triad at a Glance',
      ),
      LessonSection(
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
      LessonSection(
        heading: 'Real-World Scenario: Ransomware Attack on a Hospital',
        body:
            'A hospital experiences a ransomware attack that encrypts '
            'patient records and critical clinical systems.',
      ),
      LessonSection(
        heading: 'Impact on the CIA Triad',
      ),
      LessonSection(
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
            'This lesson explored why cybersecurity is essential for '
            'modern organizations and introduced the foundational '
            'security principles that guide every enterprise security '
            'program. Understanding the business value of cybersecurity '
            'and the CIA Triad provides the context needed to explore '
            'threats, attacks, vulnerabilities, and defensive '
            'technologies in the lessons that follow.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'The Modern Threat Landscape & Threat Actors',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Cyberattacks Have Evolved Far Beyond Hobbyists',
        body:
            'The digital world has transformed how organizations '
            'conduct business, communicate with customers, and manage '
            'information. Unfortunately, these same technologies have '
            'also created new opportunities for cybercriminals. Modern '
            'cyber threats are no longer limited to hobbyists '
            'experimenting with computer systems. Today, organizations '
            'face sophisticated attacks from organized crime groups, '
            'nation-state actors, hacktivists, insider threats, and '
            'automated malware campaigns.',
      ),
      LessonSection(
        heading: 'Understanding the People Behind the Attacks',
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
        heading: 'What "Threat Landscape" Means',
        body:
            'The threat landscape refers to the collection of cyber '
            'threats that may target an organization. As organizations '
            'adopt cloud computing, artificial intelligence, Internet '
            'of Things (IoT), mobile devices, and remote work '
            'technologies, the attack surface continues to expand.',
      ),
      LessonSection(
        heading: 'Modern Attacks Are Automated and Coordinated',
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
          'Nation-state actors',
          'Cybercriminal organizations',
          'Insider threats',
          'Hacktivists',
          'Script kiddies',
          'Third-party vendors',
          'Cloud threats',
          'Supply chain attacks',
          'Ransomware groups',
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
            'techniques.',
      ),
      LessonSection(
        heading: 'Cybercriminals',
        body: 'Cybercriminals conduct attacks primarily for financial gain.',
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
            'typically possess advanced technical capabilities.',
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
            'ideological, or social causes.',
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
            'organizational resources.',
        bullets: ['Malicious', 'Negligent', 'Compromised'],
      ),
      LessonSection(
        heading: 'Script Kiddies',
        body:
            'Script kiddies have limited technical expertise but use '
            'publicly available hacking tools to exploit vulnerable '
            'systems. Although individually less sophisticated, they '
            'can still cause significant disruption by targeting '
            'poorly secured systems.',
      ),
      LessonSection(
        heading: 'Third-Party and Vendor Threats',
        body:
            'Vendors and business partners with legitimate, trusted '
            'access to an organization\'s environment represent a '
            'distinct and often underestimated category of risk — '
            'attackers frequently target the weaker security of a '
            'trusted third party specifically because it grants '
            'indirect access into an otherwise well-defended '
            'organization.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_9_threat_actors.jpg',
          caption: 'Organizations face cyber threats from a wide range of actors with different motivations, skills, methods, and targets.',
        ),
      ),
      LessonSection(
        heading: 'Threat Actor Comparison',
      ),
      LessonSection(
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

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'The Enterprise Attack Surface',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Every Possible Entry Point, All At Once',
        body:
            'The attack surface is the total collection of points '
            'through which an attacker may attempt to compromise an '
            'organization. As organizations adopt cloud computing, '
            'SaaS applications, mobile devices, APIs, and remote work '
            'technologies, the attack surface continues to expand.',
      ),
      LessonSection(
        heading: 'External Attack Surface',
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
        heading: 'A Genuinely Comprehensive Picture',
        body:
            'The enterprise attack surface includes technology, '
            'people, processes, and third-party relationships — an '
            'organization that only thinks about its external '
            'attack surface is missing most of the actual picture.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_10_attack_surface.jpg',
          caption: 'Attackers can target many entry points across people, technology, processes, and third-party relationships.',
        ),
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Threats, Vulnerabilities, Exploits & Risk',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Four Closely Related, Distinct Concepts',
        body:
            'These four concepts are closely related but represent '
            'different aspects of cybersecurity.',
      ),
      LessonSection(
        heading: 'Threat',
        body: 'A threat is any circumstance or event capable of causing harm.',
        bullets: ['Malware', 'Phishing', 'Insider misuse', 'Ransomware'],
      ),
      LessonSection(
        heading: 'Vulnerability',
        body: 'A vulnerability is a weakness that may be exploited.',
        bullets: ['Missing patches', 'Weak passwords', 'Misconfigured firewalls', 'Default credentials'],
      ),
      LessonSection(
        heading: 'Exploit',
        body: 'An exploit is the method or code used to take advantage of a vulnerability.',
        bullets: ['Buffer overflow exploit', 'SQL injection payload', 'Remote code execution exploit'],
      ),
      LessonSection(
        heading: 'Risk',
        body:
            'Risk is the likelihood that a threat will exploit a '
            'vulnerability and the resulting business impact.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Threat', 'Identifies Vulnerability', 'Exploit', 'Security Incident', 'Business Risk', 'Mitigation Controls'],
          caption: 'The full progression from threat to mitigation — understanding each link in this chain is core to how security professionals reason about risk.',
        ),
      ),
      LessonSection(
        heading: 'The Four Terms, Side by Side',
      ),
      LessonSection(
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
        heading: 'Real-World Case Study: The SolarWinds Supply Chain Attack',
        body:
            'In 2020, attackers compromised the software build process '
            'of SolarWinds, inserting malicious code into legitimate '
            'software updates. Thousands of organizations unknowingly '
            'installed the compromised updates, providing attackers '
            'with access to sensitive environments.',
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
            'lays the foundation for the lessons that follow, which '
            'examine how organizations govern, structure, and operate '
            'their security programs.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Governance & Frameworks',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Cybersecurity as a Strategic Business Function',
        body:
            'Cybersecurity has evolved beyond technical controls into a '
            'strategic business function. Organizations today operate '
            'in hybrid environments consisting of on-premises '
            'infrastructure, cloud platforms, mobile devices, '
            'Software-as-a-Service (SaaS) applications, and globally '
            'distributed workforces. Protecting these complex '
            'environments requires structured governance, well-defined '
            'security frameworks, layered defenses, continuous '
            'monitoring, and a mature security culture.',
      ),
      LessonSection(
        heading: 'What Security Governance Establishes',
        body:
            'Security governance establishes the policies, leadership, '
            'decision-making processes, and accountability necessary to '
            'manage cybersecurity across an organization. It ensures '
            'that cybersecurity initiatives support business objectives '
            'while managing risk effectively.',
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
        heading: 'Why Good Governance Matters',
        body:
            'Good governance ensures that cybersecurity decisions are '
            'consistent, measurable, and aligned with organizational '
            'priorities. Enterprise security governance aligns '
            'cybersecurity strategy with business objectives through '
            'leadership, policies, and accountability.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_12_governance_model.jpg',
          caption: 'A top-down governance structure with continuous feedback loops ensures security aligns with business objectives and risk appetite.',
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
            'maturity, and align with industry best practices.',
      ),
      LessonSection(
        heading: 'NIST Cybersecurity Framework (CSF)',
        body: 'The NIST CSF organizes cybersecurity activities into six core functions:',
        bullets: ['Govern', 'Identify', 'Protect', 'Detect', 'Respond', 'Recover'],
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
            'organizations reduce cyber risk through actionable '
            'security measures.',
      ),
      LessonSection(
        heading: 'MITRE ATT&CK',
        body:
            'A knowledge base of real-world adversary tactics, '
            'techniques, and procedures (TTPs). Security teams use '
            'ATT&CK to improve detection capabilities, threat hunting, '
            'and incident response.',
      ),
      LessonSection(
        heading: 'Common Cybersecurity Frameworks Compared',
      ),
      LessonSection(
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

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Governance, Risk & Compliance (GRC)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'A Unified Approach to Informed Decisions',
        body:
            'GRC integrates governance, risk management, and '
            'compliance into a unified approach that helps organizations '
            'make informed security decisions.',
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
      ),
      LessonSection(
        heading: 'The GRC Workflow',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Business Objectives', 'Identify Assets', 'Assess Risks', 'Implement Security Controls', 'Monitor & Audit', 'Improve Controls', 'Continuous Governance'],
          caption: 'GRC is a continuous cycle, not a one-time project — it feeds back into itself as business objectives and the threat landscape evolve.',
        ),
      ),
      LessonSection(
        heading: 'Why GRC Matters in Practice',
        body:
            'Without GRC, security decisions risk becoming disconnected '
            'from actual business priorities — a security team might '
            'invest heavily in controls that don\'t map to the '
            'organization\'s real risk profile, or worse, remain '
            'unaware of a compliance obligation until an audit reveals '
            'the gap. GRC keeps governance, risk, and compliance moving '
            'together rather than as three separate, uncoordinated '
            'functions.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Defense in Depth & Zero Trust',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'A Layered Security Strategy',
        body:
            'Defense in Depth is a layered security strategy that '
            'deploys multiple complementary security controls. If one '
            'control fails, additional controls continue to protect '
            'organizational assets.',
      ),
      LessonSection(
        heading: 'Typical Layers',
        bullets: [
          'Physical security',
          'Perimeter security',
          'Network security',
          'Endpoint security',
          'Identity and access management',
          'Application security',
          'Data protection',
          'Security monitoring',
          'Backup and recovery',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_15_defense_in_depth.jpg',
          caption: 'Multiple layers of security controls work together to protect critical business data. If one layer is breached, additional layers help prevent or limit the impact.',
        ),
      ),
      LessonSection(
        heading: 'Zero Trust',
        body:
            'Traditional security models assumed that users inside the '
            'corporate network could be trusted. Modern organizations '
            'recognize that threats can originate from both inside and '
            'outside the network.',
      ),
      LessonSection(
        heading: '"Never Trust, Always Verify"',
        body: 'Every request for access is evaluated based on:',
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
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_16_zero_trust.jpg',
          caption: 'Zero Trust continuously validates every access request before granting access to enterprise resources.',
        ),
      ),
      LessonSection(
        heading: 'How Defense in Depth and Zero Trust Reinforce Each Other',
        body:
            'These two concepts aren\'t competing philosophies — '
            'Zero Trust\'s continuous verification is itself one of the '
            'layers within a broader Defense in Depth strategy. A '
            'mature security program applies Zero Trust principles at '
            'the identity and access layer, while still maintaining '
            'every other layer of Defense in Depth around it.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Security Operations Center (SOC)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'The Team That Watches Everything',
        body:
            'A Security Operations Center (SOC) is responsible for '
            'continuously monitoring, detecting, investigating, and '
            'responding to cybersecurity events across the '
            'organization.',
      ),
      LessonSection(
        heading: 'Typical SOC Responsibilities',
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
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_17_soc.jpg',
          caption: 'A modern Security Operations Center integrates security telemetry from across the enterprise to detect and respond to cyber threats.',
        ),
      ),
      LessonSection(
        heading: 'Real-World Case Study: Colonial Pipeline',
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

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Cybersecurity Career Pathways',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'A Field With Room for Every Kind of Strength',
        body:
            'Cybersecurity offers diverse career opportunities across '
            'technical, operational, governance, and leadership '
            'domains.',
      ),
      LessonSection(
        heading: 'Common Roles',
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
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/fundamentals/fig_1_18_career_roadmap.jpg',
          caption: 'A progressive path from entry-level IT roles to executive leadership in cybersecurity.',
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
        heading: 'Cybersecurity Is a Continuous Process',
        body:
            'Cybersecurity is not a single product or technology. It is '
            'a continuous process involving people, processes, '
            'technology, and leadership working together to reduce risk '
            'and support business objectives. These foundational '
            'concepts prepare you to explore the technical aspects of '
            'cybersecurity, including threats, attacks, vulnerabilities, '
            'identity and access management, network security, cloud '
            'security, and incident response in the modules that follow.',
      ),
      LessonSection(
        heading: 'Glossary',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Term', 'Definition'],
          tableRows: [
            ['Governance', 'The system of policies, leadership, and accountability that directs cybersecurity activities'],
            ['Defense in Depth', 'A layered security strategy using multiple complementary controls'],
            ['Zero Trust', 'A security model based on continuous verification of every access request'],
            ['GRC', 'Governance, Risk, and Compliance; an integrated approach to managing organizational security'],
            ['SOC', 'Security Operations Center responsible for monitoring, detecting, and responding to security incidents'],
            ['NIST CSF', 'A cybersecurity framework that organizes security activities into Govern, Identify, Protect, Detect, Respond, and Recover'],
          ],
        ),
      ),
    ],
  ),

  // 12 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 18,
    quiz: [
      QuizQuestion(
        question: 'Why has cybersecurity become a business imperative rather than purely an IT responsibility?',
        options: [
          'Because IT departments no longer exist',
          'Because modern cyberattacks can disrupt operations, compromise information, damage reputation, and cause financial losses across the entire organization',
          'Because regulators require it exclusively',
          'Because only executives are affected by cyber incidents',
        ],
        correctIndex: 1,
        explanation: 'Cyberattacks affect every part of a business, not just technical systems, making cybersecurity a shared responsibility across the organization.',
      ),
      QuizQuestion(
        question: 'What is the relationship between information security and cybersecurity?',
        options: [
          'They are entirely unrelated disciplines',
          'Cybersecurity is a subset of information security, focused specifically on protecting digital systems, networks, applications, and data',
          'Information security is a subset of cybersecurity',
          'They are legally required to be treated as identical in every organization',
        ],
        correctIndex: 1,
        explanation: 'Information security is the broader discipline covering all forms of information; cybersecurity specifically addresses digital systems and data.',
      ),
      QuizQuestion(
        question: 'What are the three pillars that effective cybersecurity depends on?',
        options: [
          'Firewalls, antivirus, and encryption',
          'People, process, and technology',
          'Confidentiality, integrity, and availability',
          'Governance, risk, and compliance',
        ],
        correctIndex: 1,
        explanation: 'People, process, and technology must work together — no single pillar can carry a security program alone.',
      ),
      QuizQuestion(
        question: 'In the Equifax breach, what specifically allowed attackers to succeed?',
        options: [
          'A brand new, never-before-seen zero-day exploit',
          'An unpatched web application vulnerability, despite a fix already being available',
          'A phishing email sent to employees',
          'A stolen employee laptop',
        ],
        correctIndex: 1,
        explanation: 'The vulnerability was known and patchable — the affected systems simply weren\'t updated in time.',
      ),
      QuizQuestion(
        question: 'Which CIA Triad objective is directly supported by hashing and digital signatures?',
        options: ['Confidentiality', 'Integrity', 'Availability', 'Accountability'],
        correctIndex: 1,
        explanation: 'Hashing and digital signatures detect unauthorized changes to data, which is the core goal of integrity.',
      ),
      QuizQuestion(
        question: 'In the hospital ransomware scenario, why is Availability specifically affected?',
        options: [
          'Because patient records are permanently deleted',
          'Because encrypted clinical systems become inaccessible, delaying patient care',
          'Because passwords are stolen',
          'Because the hospital\'s reputation is damaged',
        ],
        correctIndex: 1,
        explanation: 'Ransomware directly attacks availability by making systems and data inaccessible to authorized users who need them.',
      ),
      QuizQuestion(
        question: 'Which threat actor category is specifically noted for exploiting trusted relationships to gain indirect access into an otherwise well-defended organization?',
        options: ['Script kiddies', 'Hacktivists', 'Third-party and vendor threats', 'Nation-state actors'],
        correctIndex: 2,
        explanation: 'Vendors and partners with legitimate access represent a distinct risk category, since attackers can use a weaker-security vendor as a path into a stronger-security target.',
      ),
      QuizQuestion(
        question: 'What does the "human attack surface" specifically include?',
        options: [
          'Only external attackers',
          'Employees, contractors, vendors, business partners, executives, and remote workers',
          'Only IT staff',
          'Only customers',
        ],
        correctIndex: 1,
        explanation: 'The human attack surface covers everyone with some form of access to organizational resources, not just technical staff.',
      ),
      QuizQuestion(
        question: 'In the Threat -> Vulnerability -> Exploit -> Risk chain, what comes immediately after "Exploit"?',
        options: ['Mitigation Controls', 'Security Incident', 'Business Objectives', 'Vulnerability'],
        correctIndex: 1,
        explanation: 'An exploit taking advantage of a vulnerability results in a security incident, which then translates into business risk.',
      ),
      QuizQuestion(
        question: 'What made the SolarWinds attack effective at compromising thousands of organizations simultaneously?',
        options: [
          'A brute-force attack against each victim individually',
          'Malicious code inserted into the legitimate software build process, distributed through trusted, routine updates',
          'A phishing campaign sent to every affected company',
          'A publicly known vulnerability in Windows',
        ],
        correctIndex: 1,
        explanation: 'By compromising the build process itself, attackers turned a trusted update mechanism into their delivery method.',
      ),
      QuizQuestion(
        question: 'Which six core functions does the NIST Cybersecurity Framework organize activities into?',
        options: [
          'Plan, Build, Run, Monitor, Audit, Report',
          'Govern, Identify, Protect, Detect, Respond, Recover',
          'Prevent, Detect, Respond, Recover, Audit, Improve',
          'Assess, Design, Implement, Test, Deploy, Maintain',
        ],
        correctIndex: 1,
        explanation: 'NIST CSF\'s six functions are Govern, Identify, Protect, Detect, Respond, and Recover.',
      ),
      QuizQuestion(
        question: 'What is ISO/IEC 27001 primarily used for?',
        options: [
          'Documenting adversary tactics and techniques',
          'Establishing, implementing, maintaining, and continually improving an Information Security Management System (ISMS)',
          'Providing a prioritized list of practical technical controls only',
          'Replacing the need for a SOC entirely',
        ],
        correctIndex: 1,
        explanation: 'ISO/IEC 27001 is an internationally recognized standard specifically for building and certifying an ISMS.',
      ),
      QuizQuestion(
        question: 'In GRC, what does the "Risk Management" pillar specifically involve?',
        options: [
          'Ensuring adherence to laws and regulations only',
          'Identifying, assessing, prioritizing, and treating risks that could affect business operations',
          'Setting the overall business strategy',
          'Hiring security staff',
        ],
        correctIndex: 1,
        explanation: 'Risk management is specifically about identifying and addressing risks — distinct from governance and compliance, though all three work together.',
      ),
      QuizQuestion(
        question: 'What is the core principle behind Zero Trust?',
        options: [
          '"Trust but verify occasionally"',
          '"Never Trust, Always Verify" — every access request is continuously evaluated regardless of location',
          '"Trust everyone inside the corporate network by default"',
          '"Verify once at login, then trust for the entire session"',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust explicitly rejects the old assumption that internal network location implies trustworthiness — every request is evaluated continuously.',
      ),
      QuizQuestion(
        question: 'How do Defense in Depth and Zero Trust relate to each other?',
        options: [
          'They are competing, incompatible philosophies',
          'Zero Trust\'s continuous verification is itself one layer within a broader Defense in Depth strategy',
          'Zero Trust replaces the need for Defense in Depth entirely',
          'Defense in Depth only applies to physical security',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust principles are typically applied at the identity and access layer, working alongside every other Defense in Depth layer rather than replacing them.',
      ),
      QuizQuestion(
        question: 'In the Colonial Pipeline attack, what specific gap allowed the initial compromise?',
        options: [
          'A directly encrypted operational technology system',
          'A compromised VPN account lacking multi-factor authentication',
          'A phishing email sent to the control room',
          'An unpatched firewall',
        ],
        correctIndex: 1,
        explanation: 'The attackers used a compromised VPN account that had no MFA protecting it — the OT systems themselves were never directly encrypted.',
      ),
      QuizQuestion(
        question: 'What are the typical core functions of a SOC?',
        options: [
          'Sales, marketing, and customer support',
          'Security monitoring, alert triage, incident response, threat hunting, digital forensics, and reporting',
          'Software development only',
          'Physical building security exclusively',
        ],
        correctIndex: 1,
        explanation: 'A SOC\'s responsibilities span the full detection-to-response lifecycle, not just monitoring alone.',
      ),
      QuizQuestion(
        question: 'According to the career roadmap, which role typically comes right before "Security Architect / Threat Hunter" in a progressive cybersecurity career path?',
        options: ['IT Support / Help Desk', 'SOC Analyst', 'Senior Security Engineer / Incident Responder', 'Chief Information Security Officer (CISO)'],
        correctIndex: 2,
        explanation: 'The progression flows: IT Support -> SOC Analyst -> Security Engineer -> Senior Security Engineer/Incident Responder -> Security Architect/Threat Hunter -> Security Manager -> CISO.',
      ),
      QuizQuestion(
        question: 'What does the term "Attack Surface" mean?',
        options: [
          'Only the physical hardware an attacker could steal',
          'The collection of all possible entry points an attacker can target',
          'A single, specific vulnerability in an application',
          'The total number of employees at an organization',
        ],
        correctIndex: 1,
        explanation: 'Attack surface is a broad concept covering every possible point of entry — external, internal, and human — not just one specific weakness.',
      ),
      QuizQuestion(
        question: 'Why is cybersecurity described as "a continuous process" rather than a single product?',
        options: [
          'Because it only needs to be addressed once during initial system setup',
          'Because it requires people, processes, technology, and leadership working together continuously to reduce risk as threats and business needs evolve',
          'Because software licenses simply need periodic renewal',
          'Because only the IT department needs to stay continuously engaged',
        ],
        correctIndex: 1,
        explanation: 'Cybersecurity is an ongoing discipline requiring continuous attention across people, process, and technology together — never a one-time purchase or setup.',
      ),
    ],
  ),
];
