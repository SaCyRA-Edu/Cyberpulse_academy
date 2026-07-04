import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> capstoneLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'From Beginner to Security Professional: Your Roadmap',
    difficulty: LessonDifficulty.beginner,
    isAudio: true,
    estimatedMinutes: 6,
    sections: [
      LessonSection(
        heading: 'Capstone — Audio Introduction',
        body:
            'This is an audio lesson. Sit back and listen. A transcript '
            'is shown below.',
      ),
      LessonSection(
        heading: 'You\'ve Come a Long Way',
        body:
            'Think about where you started. The CIA Triad might have '
            'been a new concept. You probably hadn\'t thought carefully '
            'about how email actually works, or what a SOC analyst does '
            'at 3 AM, or why the root account on a Linux server is '
            'something to treat with such care. Now you understand all '
            'of that — and more. You have a foundation that most people '
            'in non-security IT roles don\'t have.',
      ),
      LessonSection(
        heading: 'What This Module Is About',
        body:
            'The Capstone isn\'t just more content to absorb. It\'s about '
            'synthesis — taking everything you\'ve learned and connecting '
            'it into a coherent picture of how real security programs '
            'are designed, maintained, and improved. Threat modeling. '
            'Ethical hacking methodology. Digital forensics. Zero Trust '
            'architecture. Governance, Risk, and Compliance. These '
            'aren\'t separate topics — they\'re all expressions of the '
            'same underlying question: how do you build and run a system '
            'that people can trust?',
      ),
      LessonSection(
        heading: 'Where Security Careers Go From Here',
        body:
            'Security is one of the few fields where deep specialization '
            'and broad generalism are both valuable career paths. Some '
            'professionals go deep into one area — penetration testing, '
            'forensics, detection engineering, cloud security. Others '
            'stay broad, working across governance, risk, and multiple '
            'technical domains. Neither path is wrong. What this course '
            'has built is the foundation that makes either direction '
            'possible.',
      ),
      LessonSection(
        heading: 'A Note on Continuous Learning',
        body:
            'Cybersecurity changes faster than almost any other field. '
            'New attack techniques emerge constantly. New platforms '
            'create new attack surfaces. The specific tools and vendor '
            'products will evolve. What won\'t change are the principles '
            'you\'ve internalized — the CIA Triad, least privilege, '
            'defense in depth, Zero Trust, risk-based thinking. These '
            'are the constants that make sense of everything new you\'ll '
            'encounter. Take them with you.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Architecture: Defense in Depth',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'The Core Principle, Revisited One Last Time',
        body:
            'You\'ve encountered pieces of this idea throughout the '
            'course — a firewall backed up by endpoint protection, MFA '
            'backed up by least privilege, a network firewall backed up '
            'by a host firewall. Defense in depth is the name for '
            'deliberately layering multiple, genuinely independent '
            'security controls so that if any single one fails, others '
            'remain standing behind it. No individual control is ever '
            'treated as sufficient on its own — each layer is designed '
            'assuming the layer in front of it may eventually be '
            'bypassed.',
      ),
      LessonSection(
        heading: 'The Layers, End to End',
        bullets: [
          'Perimeter — firewalls, DDoS mitigation, and network-edge monitoring',
          'Network — segmentation, IDS/IPS, and encrypted transit',
          'Identity — MFA, least privilege, and privileged access workstations',
          'Endpoint — EDR, file integrity monitoring, patch management, and application control',
          'Application — input validation, web application firewalls, dependency scanning, and secure development practices',
          'Data — encryption at rest, data loss prevention, and data classification',
          'Detection — SIEM, SOC operations, threat hunting, and incident response',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.defenseInDepth,
          caption:
              'Each layer assumes the one before it may fail — a breach '
              'has to get through all of them to succeed.',
        ),
      ),
      LessonSection(
        heading: 'A Worked Example That Ties the Whole Course Together',
        body:
            'Consider a phishing email that manages to slip past the '
            'email gateway\'s spam filter — the exact scenario from your '
            'Email Security module. In a defense-in-depth environment, '
            'that\'s not the end of the story. Endpoint protection can '
            'still block the malware the email tried to deliver. If '
            'that fails too, network segmentation limits how far any '
            'resulting compromise can spread. And if an attacker still '
            'manages to establish a foothold, a SOC analyst monitoring '
            'the SIEM eventually notices the unusual activity and '
            'escalates it. No single layer needed to be perfect — '
            'together, they held.',
      ),
      LessonSection(
        heading: 'Why This Mindset Separates Architects From Practitioners',
        body:
            'Junior security practitioners often instinctively look for '
            '"the" fix — the one control that solves the problem. '
            'Experienced security architects think differently: they '
            'design deliberately for failure at every layer, because '
            'they\'ve learned, usually the hard way, that any individual '
            'control can and eventually will fail. This shift in '
            'mindset — from finding the fix to designing for resilience '
            '— is one of the most significant transitions in moving from '
            'security practitioner to security architect.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Modeling with STRIDE & PASTA',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Why Threat Model Before Building, Not After',
        body:
            'Finding a vulnerability during design, before a single line '
            'of code is written, is dramatically cheaper than finding '
            'the same vulnerability after deployment — and immeasurably '
            'cheaper than discovering it because an attacker found it '
            'first. Threat modeling is the structured, disciplined '
            'process for systematically asking "what could go wrong '
            'here?" during design, rather than treating security as an '
            'afterthought bolted on once a system already exists.',
      ),
      LessonSection(
        heading: 'STRIDE: Six Categories of Threat',
        bullets: [
          'Spoofing — pretending to be something or someone else',
          'Tampering — unauthorized modification of data or code',
          'Repudiation — denying having performed a specific action',
          'Information Disclosure — exposing data to parties who shouldn\'t see it',
          'Denial of Service — degrading or completely denying availability',
          'Elevation of Privilege — gaining capabilities beyond what was ever authorized',
        ],
      ),
      LessonSection(
        heading: 'Noticing STRIDE\'s Direct Connection to the CIA Triad',
        body:
            'If several of these categories feel familiar, that\'s '
            'because STRIDE is essentially the CIA Triad from your very '
            'first module, reorganized into a more actionable, '
            'threat-oriented lens. Tampering and Information Disclosure '
            'map directly onto Integrity and Confidentiality '
            'respectively. Denial of Service maps directly onto '
            'Availability. Spoofing, Repudiation, and Elevation of '
            'Privilege add authentication, accountability, and '
            'authorization as additional dimensions the original triad '
            'doesn\'t explicitly separate out.',
      ),
      LessonSection(
        heading: 'PASTA: A More Comprehensive, Risk-Centric Alternative',
        body:
            'PASTA (Process for Attack Simulation and Threat Analysis) '
            'is a seven-stage methodology that moves systematically from '
            'business objectives, through detailed technical '
            'decomposition of the system, all the way to active attack '
            'simulation and concrete risk mitigation planning. It\'s '
            'considerably more comprehensive than STRIDE alone, and '
            'better suited to complex systems where genuine business '
            'risk context matters just as much as technical '
            'vulnerability detail.',
      ),
      LessonSection(
        heading: 'A Practical Threat Modeling Workflow',
        body:
            'Regardless of which specific methodology a team chooses, a '
            'practical threat model generally follows the same core '
            'sequence.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Diagram', 'Identify Threats', 'Assess', 'Mitigate', 'Validate'],
          caption:
              'This sequence repeats as a system evolves — a threat '
              'model built once at launch quickly goes stale.',
        ),
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Ethical Hacking Methodology',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'What Actually Makes Testing "Ethical"',
        body:
            'The single thing separating a penetration tester from a '
            'criminal attacker isn\'t skill, tools, or technique — it\'s '
            'explicit, documented, written authorization. The Rules of '
            'Engagement (RoE) document defines precisely what systems '
            'are in scope, which specific techniques are permitted, who '
            'to contact if something unexpected happens during testing, '
            'and how any discovered sensitive data must be handled. '
            'Testing systems without an RoE in place — regardless of how '
            'good the underlying intentions might be — is illegal in '
            'most jurisdictions, full stop.',
      ),
      LessonSection(
        heading: 'The Standard Phases of an Engagement',
        bullets: [
          'Scoping & RoE — formally agreeing what\'s in scope and precisely which techniques are permitted before any testing begins',
          'Reconnaissance — gathering information both passively (OSINT, DNS records, Shodan) and actively (scanning, enumeration)',
          'Vulnerability Analysis — systematically identifying potential weaknesses across the in-scope systems',
          'Exploitation — attempting to actually validate and exploit the findings identified during analysis',
          'Post-Exploitation — demonstrating real, concrete impact through privilege escalation, lateral movement, or actual data access',
          'Reporting — thoroughly documenting every finding, the supporting evidence, and clear remediation guidance',
          'Remediation Verification — confirming after the fact that fixes were actually implemented and genuinely effective',
        ],
      ),
      LessonSection(
        heading: 'Penetration Testing vs. Red Teaming',
        bullets: [
          'Penetration test — a time-boxed engagement providing comprehensive technical coverage of a clearly defined scope; primarily focused on finding vulnerabilities',
          'Red team — an objective-based, typically longer-horizon simulation of a real adversary; focused specifically on testing an organization\'s detection and response capability, not just finding flaws',
          'Purple team — red and blue teams working together deliberately and collaboratively, using the exercise itself to directly improve detection coverage rather than treating it purely as a pass/fail test',
        ],
      ),
      LessonSection(
        heading: 'Connecting This Back to the SOC Module',
        body:
            'Remember from your SOC Operations module how MITRE ATT&CK '
            'gives defenders a shared vocabulary for describing attacker '
            'behavior? Ethical hackers use exactly the same framework '
            'from the opposite direction — planning an engagement around '
            'specific ATT&CK techniques, then reporting findings mapped '
            'back to that same framework, so the defending SOC can '
            'directly translate red team findings into concrete '
            'detection engineering priorities.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Digital Forensics & Chain of Custody',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'What Makes Forensics Different From Ordinary Investigation',
        body:
            'Digital forensics is the collection, preservation, and '
            'analysis of digital evidence conducted in a manner that\'s '
            'reliable, repeatable, and where necessary, legally '
            'defensible in court. Every single action taken on a piece '
            'of evidence must be justified and thoroughly documented — '
            'this discipline is what separates forensics from ordinary, '
            'informal technical investigation.',
      ),
      LessonSection(
        heading: 'Chain of Custody: The Non-Negotiable Requirement',
        body:
            'Every step touching a piece of evidence — who collected it, '
            'exactly how, precisely when, where it was subsequently '
            'stored, and who accessed it afterward — must be documented '
            'meticulously. A broken chain of custody can render '
            'otherwise compelling evidence inadmissible in legal '
            'proceedings, and can undermine confidence in an entire '
            'investigation\'s findings even outside a courtroom.',
      ),
      LessonSection(
        heading: 'Core Forensic Principles',
        bullets: [
          'Work from copies — never analyze the original evidence directly; create a verified forensic image and confirm its integrity with a cryptographic hash before beginning any analysis',
          'Order of volatility — collect the most easily lost evidence first: memory (RAM) and running process state, then network connection state, then disk contents last',
          'Document everything — every timestamp, every command run, every tool used, and every finding, without exception',
          'Verify integrity throughout — hash evidence immediately at the point of acquisition, and re-verify that hash before and after every stage of analysis',
        ],
      ),
      LessonSection(
        heading: 'Memory Forensics: Evidence That Exists Nowhere Else',
        body:
            'RAM contains running processes, active network connections, '
            'encryption keys, and credentials that frequently don\'t '
            'exist anywhere on disk at all. Tools like Volatility analyze '
            'memory dumps captured from a live or recently-powered '
            'system to uncover injected malware, complete command '
            'history, and attacker infrastructure that would otherwise '
            'remain completely invisible to an investigator working from '
            'disk images alone.',
      ),
      LessonSection(
        heading: 'How This Overlaps With Incident Response',
        body:
            'Recall from your SOC Operations module that containment '
            'deliberately avoids immediately reimaging a compromised '
            'machine, specifically to preserve exactly this kind of '
            'volatile evidence. Forensics and incident response overlap '
            'heavily in practice — a SOC investigating an active breach '
            'is effectively performing lightweight forensics in real '
            'time, while dedicated forensic specialists may later conduct '
            'a far deeper, more rigorous analysis specifically for legal '
            'proceedings or insurance claims.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Zero Trust Architecture',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Why the Old Perimeter Model Stopped Working',
        body:
            'The traditional "castle and moat" security model assumed '
            'that everything inside the network perimeter could be '
            'trusted, while everything outside it was treated with '
            'suspicion. Cloud services, remote work, personal devices, '
            'and increasingly sophisticated phishing have made "inside '
            'the network" an essentially meaningless boundary — an '
            'employee working from a coffee shop on a personal laptop, '
            'accessing a cloud application, was never genuinely "inside" '
            'anything a traditional perimeter could actually protect.',
      ),
      LessonSection(
        heading: 'The Three Zero Trust Principles',
        bullets: [
          'Verify explicitly — authenticate and authorize every single request using all available signal: identity, device health, location, and observed behavior patterns',
          'Use least privilege access — grant only the minimum access genuinely required, using just-in-time and just-enough-access wherever practically possible',
          'Assume breach — design every system on the explicit assumption that some component will eventually be compromised, and engineer specifically to minimize blast radius and lateral movement when it happens',
        ],
      ),
      LessonSection(
        heading: 'Recognizing Zero Trust as a Synthesis of Everything You\'ve Learned',
        body:
            'Zero Trust isn\'t really a brand-new idea — it\'s a formal '
            'name for combining principles you\'ve already studied '
            'throughout this course into one coherent architecture. '
            'Least privilege from your very first module. MFA and strong '
            'authentication from the same module. Network segmentation '
            'and microsegmentation from Networking. Continuous monitoring '
            'from SOC Operations. Zero Trust\'s genuine contribution is '
            'insisting that all of these principles apply everywhere, '
            'continuously, rather than being relaxed once something is '
            'considered "inside" a trusted boundary.',
      ),
      LessonSection(
        heading: 'The Six Zero Trust Pillars',
        bullets: [
          'Identity — strong authentication, MFA, and continuous identity risk scoring',
          'Devices — verifying device health and compliance before granting any access',
          'Network — microsegmentation and encrypted traffic even between systems on the "same" network',
          'Applications — application-level access control and cloud access security brokers',
          'Data — classification, data loss prevention, encryption, and rights management',
          'Visibility & Analytics — comprehensive logging and analysis feeding back across every other pillar',
        ],
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud Security Architecture',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'The Shared Responsibility Model',
        body:
            'Cloud security responsibility is genuinely split between '
            'the cloud provider and the customer, and exactly where that '
            'line falls depends heavily on the specific service model in '
            'use. In IaaS (Infrastructure as a Service, like a raw '
            'virtual machine), the customer is responsible for '
            'everything from the operating system upward. In PaaS '
            '(Platform as a Service), the provider takes on '
            'considerably more of that responsibility. In SaaS '
            '(Software as a Service), the customer is primarily '
            'responsible for their own data and who has access to it — '
            'the underlying infrastructure and application itself belong '
            'entirely to the provider.',
      ),
      LessonSection(
        heading: 'Misconfigurations, Not Exotic Attacks, Cause Most Cloud Breaches',
        bullets: [
          'Publicly accessible storage buckets (Amazon S3, Azure Blob Storage) — consistently one of the single most common sources of large-scale data breaches',
          'Overly permissive IAM roles — granting far broader cloud permissions than a role genuinely needs, directly violating least privilege',
          'No MFA enforced on cloud console access — leaving the entire cloud environment protected by password alone',
          'Security groups or network security groups with 0.0.0.0/0 inbound rules on sensitive ports — effectively exposing a service to the entire internet',
          'Logging disabled entirely — CloudTrail, Azure Monitor, or GCP Audit Logs left inactive, eliminating visibility into what actually happened during an incident',
        ],
      ),
      LessonSection(
        heading: 'Purpose-Built Cloud Security Tooling',
        bullets: [
          'CSPM (Cloud Security Posture Management) — continuously and automatically audits cloud configuration against best practices, flagging exactly these kinds of misconfigurations',
          'CWPP (Cloud Workload Protection Platform) — secures individual workloads: virtual machines, containers, and serverless functions',
          'CASB (Cloud Access Security Broker) — sits between users and cloud services, monitoring and controlling how those services are actually used',
          'Native provider tools — AWS Security Hub, Microsoft Defender for Cloud, and Google Cloud Security Command Center all provide built-in visibility for their respective platforms',
        ],
      ),
      LessonSection(
        heading: 'Why This Requires Rethinking Some Earlier Assumptions',
        body:
            'Notice how several concepts from earlier in the course need '
            'genuine reinterpretation in a cloud context. Network '
            'segmentation, from your Networking module, still matters '
            'enormously — but it now happens through security groups and '
            'virtual private clouds rather than physical switches and '
            'VLANs. Least privilege still matters — but it now applies '
            'to IAM roles and API permissions rather than traditional '
            'Unix file permissions. The underlying principles carry over '
            'directly; only their specific technical implementation '
            'changes.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Governance, Risk & Compliance (GRC)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Three Components of GRC',
        bullets: [
          'Governance — the decision-making structures, formal policies, and accountability frameworks that direct an organization\'s entire security program',
          'Risk — identifying, assessing, treating, and continuously monitoring risk across the organization, directly building on your Fundamentals module\'s risk management process',
          'Compliance — meeting the specific legal, regulatory, and contractual obligations an organization is actually subject to, such as GDPR, HIPAA, or PCI-DSS',
        ],
      ),
      LessonSection(
        heading: 'The Major Frameworks You\'ll Encounter',
        bullets: [
          'NIST Cybersecurity Framework (CSF) — vendor-neutral, organized around five core functions: Identify, Protect, Detect, Respond, Recover',
          'ISO/IEC 27001 — an international standard defining requirements for a full Information Security Management System (ISMS), and one an organization can be formally, externally audited and certified against',
          'NIST SP 800-53 — a highly detailed control catalog widely used by US federal agencies and their contractors',
          'CIS Controls — a pragmatic, prioritized list of 18 controls that\'s become a popular, accessible starting point for organizations building a program essentially from scratch',
        ],
      ),
      LessonSection(
        heading: 'Compliance Is a Floor, Never a Ceiling',
        body:
            'Passing a compliance audit confirms that an organization '
            'met a specific, defined baseline on the specific date that '
            'audit took place. It says nothing whatsoever about whether '
            'that organization remains secure the following day, the '
            'following month, or against a threat the underlying '
            'standard simply never anticipated. Mature, genuinely '
            'effective security programs treat compliance frameworks as '
            'a floor to build upward from, never as a ceiling defining '
            '"done."',
      ),
      LessonSection(
        heading: 'Why GRC Sits at the Top of This Course\'s Structure',
        body:
            'Notice that GRC is the domain that ties every earlier '
            'module together into one coherent whole. Governance sets '
            'the policies you studied back in Fundamentals. Risk '
            'management prioritizes exactly which technical controls '
            '— from Networking, Windows, Linux, SOC operations — actually '
            'get built and in what order. Compliance ensures the whole '
            'program actually satisfies real external legal and '
            'contractual obligations. GRC isn\'t a separate, isolated '
            'topic bolted onto security — it\'s the connective structure '
            'that turns a scattered collection of individual technical '
            'controls into an actual, coherent program.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Building a Security Program from Scratch',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Where Every New Security Program Should Actually Start',
        body:
            'Most brand-new security programs fail not because of a '
            'shortage of good intentions, but because they try to do far '
            'too much simultaneously right from day one. The correct '
            'starting point is always the same, regardless of '
            'organization size or industry: understand precisely what '
            'assets actually exist, identify the most realistic threats '
            'to those specific assets, and determine which gaps carry '
            'the highest genuine risk. Everything else in the program '
            'flows logically from that initial foundation.',
      ),
      LessonSection(
        heading: 'A Practical Maturity Progression',
        body:
            'Security programs generally mature through a recognizable, '
            'sequential set of stages rather than jumping straight to '
            'advanced capability.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Basic Hygiene', 'Visibility', 'Proactive Defense', 'Adaptive'],
          caption:
              'Skipping straight to advanced capabilities like threat '
              'hunting before basic hygiene (patching, MFA, backups) is '
              'in place is a common, costly mistake.',
        ),
      ),
      LessonSection(
        heading: 'What Each Stage Actually Involves',
        bullets: [
          'Basic hygiene — asset inventory, patch management, MFA, backups, and a documented incident response plan',
          'Visibility — centralized logging, SIEM, EDR, and formal vulnerability management',
          'Proactive defense — threat hunting, detection engineering, red team exercises, and a functioning GRC program',
          'Adaptive — continuous improvement, deep threat intelligence integration, and advanced automation across the entire program',
        ],
      ),
      LessonSection(
        heading: 'Translating Technical Risk Into Business Risk',
        body:
            'Security spending is ultimately always a business decision, '
            'made by leaders who control budgets and typically think in '
            'terms of business outcomes rather than technical detail. '
            'Those leaders need risk explained in terms they can '
            'directly act on — potential financial impact, concrete '
            'regulatory exposure, tangible reputational risk — rather '
            'than a raw technical CVE severity score that means little '
            'outside a security team. A meaningful part of any security '
            'professional\'s actual job, at every level, is learning to '
            'translate technical risk into the business risk language '
            'that leadership can genuinely use to make good decisions.',
      ),
    ],
  ),

  // 9b -----------------------------------------------------------------
  Lesson(
    title: 'Security Infrastructure',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Applying Enterprise Security Across Domains 3 and 4',
        body:
            'This new set of lessons applies the enterprise security '
            'principles you\'ve already studied — defense in depth, '
            'least privilege, Zero Trust — specifically to the physical '
            'and logical infrastructure an organization actually runs '
            'on. It spans two closely related CompTIA Security+ '
            'domains: Security Architecture (how infrastructure is '
            'designed) and Security Operations (how it\'s actually '
            'run and defended day to day).',
      ),
      LessonSection(
        heading: 'A Real-Time Enterprise Security Architecture',
        body:
            'A typical enterprise architecture layers several distinct '
            'controls between the untrusted internet and sensitive '
            'internal systems.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Internet', 'Perimeter Firewall', 'IDS/IPS', 'DMZ', 'Internal Network'],
          caption:
              'Traffic crosses multiple independent inspection points '
              'before ever reaching sensitive internal systems — '
              'defense in depth applied directly to network design.',
        ),
      ),
      LessonSection(
        heading: 'What This Set of Lessons Covers',
        bullets: [
          'Ports and Protocols — the addressing layer every other control operates on top of',
          'Firewalls — from basic packet filtering to modern NGFW, UTM, and cloud-based deployments',
          'IDS/IPS — detecting and actively blocking malicious traffic',
          'Network Appliances — load balancers, proxies, jump servers, and sensors',
          'Port Security — securing the physical and logical network edge',
          'Securing Network Communications — VPN, TLS, and IPsec protecting data in transit',
          'SD-WAN and SASE — the modern, cloud-native evolution of enterprise connectivity and security',
          'Selecting Infrastructure Controls — a risk-based methodology for choosing what to actually deploy',
        ],
      ),
      LessonSection(
        heading: 'Why This Matters Beyond Individual Components',
        body:
            'None of the specific technologies covered in the lessons '
            'ahead matter in isolation — a firewall without a '
            'segmentation strategy behind it, or a VPN without an '
            'understanding of what it does and doesn\'t protect, '
            'provides far less real security than the same components '
            'deployed as part of a deliberate, layered architecture. '
            'This module builds that architectural thinking directly on '
            'top of the individual technologies.',
      ),
    ],
  ),

  // 9c -----------------------------------------------------------------
  Lesson(
    title: 'Ports and Protocols',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'A Refresher, With Enterprise Depth Added',
        body:
            'The Networking module already introduced ports as the '
            'numbered doors services listen on. This lesson adds the '
            'enterprise-level detail needed to actually design and '
            'audit firewall rules around them.',
      ),
      LessonSection(
        heading: 'Inbound vs. Outbound Traffic',
        body:
            'Inbound traffic originates outside a network boundary and '
            'attempts to enter — a client connecting to your web server. '
            'Outbound traffic originates inside the boundary and '
            'attempts to leave — your web server connecting out to a '
            'software update server. Firewall rules almost always treat '
            'these directions differently: inbound traffic is typically '
            'far more restricted by default, since it represents '
            'someone external initiating contact, while outbound '
            'traffic often has broader default allowances, though '
            'increasingly, restricting outbound traffic too (to prevent '
            'data exfiltration or C2 callbacks) is considered a security '
            'best practice.',
      ),
      LessonSection(
        heading: 'The Three Port Ranges',
        bullets: [
          'Well-known ports (0–1023) — reserved for widely used, standardized services like HTTP (80) and SSH (22); require elevated privileges to bind to on most operating systems',
          'Registered ports (1024–49151) — assigned to specific applications by IANA on request, but not requiring the same strict standardization as well-known ports',
          'Dynamic/private ports (49152–65535) — used temporarily by client applications for outbound connections, and by systems like NAT to track individual sessions; never permanently assigned to a specific service',
        ],
      ),
      LessonSection(
        heading: 'Key Ports Worth Memorizing',
        bullets: [
          'HTTP — port 80, unencrypted web traffic',
          'HTTPS — port 443, encrypted web traffic protected by TLS',
          'SSH — port 22, encrypted remote administration',
          'DNS — port 53, domain name resolution (both UDP and TCP)',
          'SMTP — port 25 (server-to-server) and 587 (client submission), outgoing email',
          'SQL (Microsoft SQL Server) — port 1433; other databases use their own defaults (MySQL 3306, PostgreSQL 5432)',
          'RDP — port 3389, Windows Remote Desktop Protocol — one of the most heavily targeted ports when directly exposed to the internet',
        ],
      ),
      LessonSection(
        heading: 'Applying This to Firewall Rule Design',
        body:
            'Effective firewall rules are written with specific ports, '
            'directions, and source/destination ranges in mind, not '
            'broad blanket allowances. A rule permitting inbound TCP on '
            'port 443 from anywhere, to a specific web server, is far '
            'more defensible and auditable than a rule permitting all '
            'inbound traffic to that same server — the same deny-by-'
            'default, explicitly-allow-what\'s-needed principle from the '
            'Networking module, applied with the specific port knowledge '
            'from this lesson.',
      ),
    ],
  ),

  // 9d -----------------------------------------------------------------
  Lesson(
    title: 'Firewalls',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'The Full Firewall Family',
        bullets: [
          'Packet-filtering firewall — inspects individual packets against simple rules (source, destination, port); no awareness of connection state',
          'Stateful firewall — tracks the state of active connections, correctly allowing return traffic for legitimately established sessions',
          'Proxy firewall — intercepts and fully terminates connections on behalf of internal clients, inspecting content before forwarding a brand-new connection to the actual destination',
          'Kernel proxy firewall — operates at the OS kernel level for maximum performance while retaining proxy-level inspection depth',
          'Next-Generation Firewall (NGFW) — combines stateful filtering with application-layer inspection, intrusion prevention, and threat intelligence',
          'Unified Threat Management (UTM) — bundles firewall, antivirus, IPS, and content filtering into one consolidated appliance, typically aimed at smaller organizations wanting one device rather than several',
          'Web Application Firewall (WAF) — purpose-built to protect HTTP/S traffic specifically from application-layer attacks like SQL injection and XSS',
        ],
      ),
      LessonSection(
        heading: 'Screened Subnets and Dual-Homed Hosts',
        body:
            'A screened subnet (the modern term for what was once called '
            'a DMZ) places public-facing servers in an isolated network '
            'segment protected by firewalls on both sides — one facing '
            'the internet, one facing the internal network. A dual-'
            'homed host is a single system with two separate network '
            'interfaces, each connected to a different network segment, '
            'historically used as a simple gateway between trusted and '
            'untrusted networks before more sophisticated firewall '
            'appliances became standard.',
      ),
      LessonSection(
        heading: 'Cloud-Based Firewalls',
        body:
            'Rather than a physical appliance, a cloud-based firewall '
            '(sometimes called Firewall-as-a-Service) runs as a managed '
            'cloud service, filtering traffic before it ever reaches an '
            'organization\'s actual cloud workloads or on-premises '
            'network. This model scales elastically with demand without '
            'needing to provision physical hardware, and fits naturally '
            'into cloud-native and hybrid architectures where traffic no '
            'longer flows through one predictable physical location.',
      ),
      LessonSection(
        heading: 'Which Firewall Type Is Actually Recommended?',
        body:
            'For most modern enterprise environments, an NGFW is the '
            'generally recommended baseline — it provides application-'
            'layer awareness and integrated threat intelligence that '
            'basic stateful filtering alone cannot. A WAF should '
            'specifically supplement an NGFW wherever web applications '
            'are exposed, since NGFWs are not purpose-built for deep '
            'HTTP content inspection the way a WAF is. Smaller '
            'organizations with limited IT staff often find a UTM\'s '
            'consolidated management genuinely valuable despite its '
            'trade-offs, since it dramatically reduces the number of '
            'separate systems that need configuring and maintaining.',
      ),
      LessonSection(
        heading: 'A Real-World Example',
        body:
            'An e-commerce company deploys an NGFW at its network '
            'perimeter to inspect and filter general traffic, adds a WAF '
            'specifically in front of its public checkout application to '
            'catch SQL injection attempts targeting its payment form, '
            'and additionally uses a cloud-based firewall to protect its '
            'workloads running in a public cloud environment that '
            'traditional on-premises hardware could never see. Each '
            'firewall type addresses a distinct part of the '
            'organization\'s actual attack surface rather than any one '
            'device trying to cover everything.',
      ),
    ],
  ),

  // 9e -----------------------------------------------------------------
  Lesson(
    title: 'IDS and IPS',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'The Core Difference, in Table Form',
        body:
            'IDS (Intrusion Detection System) and IPS (Intrusion '
            'Prevention System) are often confused, but the distinction '
            'is straightforward once laid out directly.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.idsIpsTable),
      ),
      LessonSection(
        heading: 'Network-Based (NIDS/NIPS)',
        body:
            'Monitors traffic across an entire network segment, '
            'typically deployed at a strategic chokepoint like a network '
            'tap or a switch\'s mirrored port, giving visibility across '
            'many devices simultaneously from a single deployment point.',
      ),
      LessonSection(
        heading: 'Host-Based (HIDS/HIPS)',
        body:
            'Runs directly on an individual endpoint, monitoring that '
            'specific system\'s activity — file changes, process '
            'execution, system calls — with visibility into behavior a '
            'network-based system positioned outside that host could '
            'never see, such as what\'s actually happening inside an '
            'encrypted connection once it\'s been decrypted on the '
            'endpoint itself.',
      ),
      LessonSection(
        heading: 'Wireless (WIDS/WIPS)',
        body:
            'Specifically monitors wireless traffic and the RF spectrum '
            'for threats unique to Wi-Fi — rogue access points, Evil '
            'Twin attacks (covered in the Networking module), and '
            'unauthorized wireless devices attempting to join a network.',
      ),
      LessonSection(
        heading: 'A Real-World Example',
        body:
            'A NIPS deployed at the network perimeter detects and '
            'automatically blocks a known SQL injection pattern targeting '
            'a public web application before it ever reaches the '
            'application server. Simultaneously, a HIDS running on that '
            'same application server notices an unexpected new process '
            'spawned by the web server software — a pattern consistent '
            'with successful exploitation — and generates an alert for a '
            'SOC analyst to investigate immediately, even though the '
            'NIPS had already blocked the network-level attack pattern '
            'it recognized. The two systems provide complementary '
            'visibility: one blocking what it recognizes at the network '
            'level, the other watching for the consequences on the '
            'endpoint itself in case something gets through.',
      ),
    ],
  ),

  // 9f -----------------------------------------------------------------
  Lesson(
    title: 'Network Appliances',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Beyond Firewalls and IDS/IPS',
        body:
            'A modern network relies on several other specialized '
            'appliances, each solving a specific problem — distributing '
            'load, monitoring traffic, or providing controlled '
            'administrative access — available as dedicated hardware, '
            'installable software, or fully managed cloud services.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.networkAppliancesTable),
      ),
      LessonSection(
        heading: 'Load Balancers',
        body:
            'Distribute incoming traffic across multiple backend '
            'servers, improving both performance and availability since '
            'traffic automatically shifts away from any server that '
            'becomes unavailable. Real-world use: an e-commerce site '
            'runs ten identical web servers behind a load balancer, '
            'so a sudden traffic spike during a sale, or the failure of '
            'any single server, doesn\'t take the site down entirely.',
      ),
      LessonSection(
        heading: 'Proxy Servers',
        body:
            'As covered in the Networking module, forward proxies sit '
            'between internal clients and the internet (content '
            'filtering, caching), while reverse proxies sit in front of '
            'internal servers (load balancing, hiding internal server '
            'details from the outside world). Real-world use: a company '
            'uses a forward proxy to enforce content filtering policy '
            'and cache frequently accessed external resources, reducing '
            'both risk and bandwidth costs.',
      ),
      LessonSection(
        heading: 'Sensors',
        body:
            'Dedicated devices or software agents specifically deployed '
            'to passively monitor traffic and feed data to a SIEM or '
            'IDS/IPS platform, without themselves making active blocking '
            'decisions. Real-world use: network sensors placed at every '
            'major network segment boundary feed traffic metadata '
            'continuously into a central SIEM, providing the visibility '
            'the SOC actually depends on for correlation and detection.',
      ),
      LessonSection(
        heading: 'Jump Servers',
        body:
            'A jump server (or bastion host) is a hardened, tightly '
            'monitored intermediary system that administrators must '
            'connect through before reaching more sensitive internal '
            'systems — rather than connecting directly from their own '
            'workstation to a production database server, for example, '
            'they connect first to the jump server, which then connects '
            'onward. Real-world use: all administrative access to '
            'production database servers is required to route through a '
            'jump server, which logs every session in full for later '
            'audit and centralizes exactly where sensitive administrative '
            'credentials are ever actually used.',
      ),
      LessonSection(
        heading: 'The Shared Advantage: Centralized Control Points',
        body:
            'Every appliance in this lesson shares a common strategic '
            'value beyond its specific function: each one creates a '
            'centralized point where traffic, access, or monitoring can '
            'be controlled and audited, rather than that responsibility '
            'being scattered unpredictably across every individual '
            'server or client throughout the network.',
      ),
    ],
  ),

  // 9g -----------------------------------------------------------------
  Lesson(
    title: 'Port Security',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Why Physical and Logical Ports Need Their Own Security',
        body:
            'Every switch port and network jack is a potential entry '
            'point — plugging an unauthorized device into an open port '
            'in an empty conference room could grant network access as '
            'easily as any remote attack. Port security specifically '
            'addresses this physical and logical access layer.',
      ),
      LessonSection(
        heading: 'Advantages of Port Security',
        bullets: [
          'Prevents unauthorized devices from simply plugging in and gaining network access',
          'Limits MAC flooding attacks, where an attacker overwhelms a switch\'s MAC address table to force it into broadcasting all traffic to every port, defeating normal switch traffic isolation',
          'Provides an audit trail of exactly which device, identified by MAC address, connected to which physical port and when',
        ],
      ),
      LessonSection(
        heading: 'Disadvantages and Trade-offs',
        bullets: [
          'Adds real administrative overhead — legitimate new devices need to be explicitly authorized rather than simply plugging in and working immediately',
          'Can disrupt legitimate business operations if misconfigured, such as blocking a legitimate replacement device with a new MAC address',
          'MAC addresses can be spoofed by a sufficiently determined attacker, so port security alone is not a complete access control solution',
        ],
      ),
      LessonSection(
        heading: 'Sticky MAC Learning',
        body:
            'Rather than manually configuring every permitted MAC '
            'address on every port individually, sticky MAC learning '
            'lets a switch port automatically learn and lock onto the '
            'first MAC address it sees, then refuse any other device '
            'attempting to connect through that same port afterward — '
            'combining ease of initial setup with genuine ongoing '
            'restriction.',
      ),
      LessonSection(
        heading: '802.1X: Authentication at the Network Edge',
        body:
            'Port security based purely on MAC addresses is limited '
            'since MAC addresses can be spoofed. 802.1X goes further, '
            'requiring genuine authentication before a device is granted '
            'any network access at all, using the Extensible '
            'Authentication Protocol (EAP) to carry the actual '
            'credential exchange between the connecting device (the '
            'supplicant) and a switch or access point (the authenticator).',
      ),
      LessonSection(
        heading: 'RADIUS and TACACS+',
        body:
            'The switch or access point doesn\'t verify credentials '
            'itself — it forwards the authentication request to a '
            'centralized server. RADIUS is the most widely used protocol '
            'for this, both for network access (802.1X) and VPN '
            'authentication. TACACS+ is a similar but more granular '
            'alternative, more commonly used specifically for '
            'authenticating administrative access to network devices '
            'themselves (like router and switch command-line access), '
            'since it separates authentication, authorization, and '
            'accounting more distinctly than RADIUS does.',
      ),
      LessonSection(
        heading: 'How This Helps in Practice',
        body:
            'Combining sticky MAC learning with 802.1X authentication '
            'means a device must both connect to a port already learned '
            'or explicitly authorized, and successfully authenticate a '
            'real user or device credential through a centralized RADIUS '
            'server, before any meaningful network access is granted at '
            'all — directly applying the least-privilege and Zero Trust '
            'principles from earlier in this course to the physical '
            'network edge itself.',
      ),
    ],
  ),

  // 9h -----------------------------------------------------------------
  Lesson(
    title: 'Securing Network Communications',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Protecting Data as It Crosses Untrusted Networks',
        body:
            'Once data leaves a trusted, controlled network, it '
            'needs protection independent of whatever network it '
            'happens to be crossing. VPNs, TLS, and IPsec are the three '
            'primary tools for this, each solving overlapping but '
            'distinct parts of the problem.',
      ),
      LessonSection(
        heading: 'Site-to-Site, Client-to-Site, and Clientless VPNs',
        bullets: [
          'Site-to-site VPN — connects two entire networks together permanently, such as a company\'s headquarters and a branch office, so devices on both sides communicate as if on one shared network',
          'Client-to-site VPN — connects an individual remote device to a corporate network, requiring VPN client software installed on that device; the most common model for remote employees',
          'Clientless VPN — provides secure access to specific web-based applications through an ordinary browser, without requiring any dedicated VPN client software to be installed at all, at the cost of typically supporting only browser-accessible resources rather than full network access',
        ],
      ),
      LessonSection(
        heading: 'TLS and DTLS',
        body:
            'TLS, covered in depth in the Networking module, secures '
            'connection-oriented (TCP-based) traffic. DTLS (Datagram '
            'TLS) provides the equivalent protection for connectionless '
            'UDP-based traffic — used by some VPN implementations and '
            'real-time applications like voice and video where TCP\'s '
            'overhead would be counterproductive.',
      ),
      LessonSection(
        heading: 'IPsec Modes: Transport and Tunnel',
        bullets: [
          'Transport mode — encrypts only the payload of each IP packet, leaving the original header intact; typically used for direct end-to-end communication between two specific hosts',
          'Tunnel mode — encrypts the entire original IP packet, including its header, then wraps it in a completely new packet; the standard mode for site-to-site VPNs, since it fully protects the original routing information as well as the payload',
        ],
      ),
      LessonSection(
        heading: 'AH and ESP',
        bullets: [
          'AH (Authentication Header) — provides authentication and integrity for a packet, but no confidentiality (no actual encryption of the payload)',
          'ESP (Encapsulating Security Payload) — provides confidentiality (encryption) along with authentication and integrity; the far more commonly used option in practice, since most real deployments need actual encryption, not just authentication',
        ],
      ),
      LessonSection(
        heading: 'A Real-World Example',
        body:
            'A company connects its headquarters to a branch office '
            'using a site-to-site IPsec VPN in tunnel mode with ESP, '
            'fully encrypting all traffic between locations across the '
            'public internet. Remote employees working from home '
            'connect individually using client-to-site VPN software '
            'that establishes a TLS-based tunnel to the same corporate '
            'network. A contractor who only needs access to one specific '
            'internal web application, and shouldn\'t have broader '
            'network access at all, is instead given a clientless VPN '
            'link that provides exactly that one application through '
            'their browser and nothing more — three different '
            'connectivity needs, each matched to the VPN model that '
            'actually fits it.',
      ),
    ],
  ),

  // 9i -----------------------------------------------------------------
  Lesson(
    title: 'SD-WAN and SASE',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'SD-WAN: Software-Defined Wide Area Networking',
        body:
            'Traditional WAN connections between office locations relied '
            'on dedicated, expensive private circuits configured largely '
            'by hand. SD-WAN instead uses software-defined, centrally '
            'managed control over multiple types of network transport '
            'simultaneously — broadband internet, LTE/5G, and traditional '
            'private circuits — intelligently routing traffic across '
            'whichever available path best fits each application\'s '
            'actual needs in real time.',
      ),
      LessonSection(
        heading: 'SASE: Secure Access Service Edge',
        body:
            'SASE combines SD-WAN\'s networking capabilities with a full '
            'suite of integrated security services — including a cloud-'
            'delivered firewall, secure web gateway, CASB, and Zero '
            'Trust network access — all delivered as one unified, '
            'cloud-native platform rather than a collection of separate '
            'point products each requiring their own management.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Distributed Users', 'SASE Cloud Edge', 'Policy Enforcement', 'Secure App Access'],
          caption:
              'Rather than routing all traffic back through a central '
              'data center, SASE enforces consistent policy at cloud '
              'points of presence close to wherever users actually are.',
        ),
      ),
      LessonSection(
        heading: 'Why This Model Emerged',
        body:
            'As covered in the Zero Trust lesson earlier in this module, '
            'the traditional model of routing all traffic back through '
            'a central corporate data center for inspection made '
            'increasingly little sense once users, applications, and '
            'data all became distributed across the cloud and remote '
            'locations. SASE brings security enforcement to wherever '
            'users and applications actually are, rather than forcing '
            'traffic to make an inefficient, latency-adding detour '
            'through a legacy central location purely for a security '
            'check.',
      ),
      LessonSection(
        heading: 'A Real-World Use Case',
        body:
            'A company with offices across a dozen countries, a fully '
            'remote workforce, and applications split between two '
            'different cloud providers replaces its aging system of '
            'individual site-to-site VPNs and a single central firewall '
            'with a SASE platform. Every user, whether in an office or '
            'working remotely, connects to the nearest SASE cloud edge '
            'location, which enforces identical Zero Trust security '
            'policy regardless of location before granting access to '
            'any application — with dramatically simplified management '
            'compared to maintaining dozens of separate VPN tunnels and '
            'firewall configurations across every location individually.',
      ),
    ],
  ),

  // 9j -----------------------------------------------------------------
  Lesson(
    title: 'Selecting Infrastructure Controls',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'A Risk-Based Methodology, Not a Shopping List',
        body:
            'With so many infrastructure technologies covered across '
            'this set of lessons, the practical challenge shifts from '
            '"what exists" to "what should we actually deploy, and in '
            'what order?" The right approach starts from the risk '
            'management process covered in the Fundamentals module: '
            'identify actual vulnerabilities and realistic threats '
            'specific to your environment, then select controls that '
            'directly address the highest-priority gaps, rather than '
            'deploying every available technology regardless of actual '
            'need.',
      ),
      LessonSection(
        heading: 'Guiding Principles Revisited',
        bullets: [
          'Least privilege — every control should grant the minimum access genuinely required, whether that\'s a firewall rule, a jump server policy, or 802.1X network access',
          'Defense in depth — no single infrastructure control should be treated as sufficient alone; layer complementary controls (firewall + IDS/IPS + segmentation) so any one failure is caught by another',
          'Lifecycle management — every control needs ongoing patching, configuration review, and eventual replacement as it ages or as better options emerge, not a one-time deployment treated as permanently finished',
          'Open design — security should not depend on attackers remaining unaware of how a system works (security through obscurity); a well-designed control remains effective even if its general design is publicly known, relying instead on properly protected keys, credentials, and configuration',
        ],
      ),
      LessonSection(
        heading: 'Leaning on Established Frameworks',
        body:
            'Rather than developing a control selection methodology '
            'entirely from scratch, mature organizations lean on '
            'established, vendor-neutral frameworks already introduced '
            'in the GRC lesson earlier in this module — the NIST '
            'Cybersecurity Framework and ISO/IEC 27001 both provide '
            'structured guidance for exactly this kind of risk-based '
            'control selection, helping ensure a control decision made '
            'in one part of the organization stays consistent with the '
            'broader security program rather than being made in '
            'isolation.',
      ),
      LessonSection(
        heading: 'Putting It All Together',
        body:
            'A practical infrastructure control selection process asks, '
            'for every candidate control: what specific risk does this '
            'address, does it follow least privilege and fit into the '
            'existing defense-in-depth architecture, who will own its '
            'ongoing lifecycle, and does it rely on any hidden or '
            'obscure implementation detail that would make it fragile '
            'once understood by an attacker? Answering these '
            'consistently, across every infrastructure decision, is what '
            'turns the individual technologies covered in this set of '
            'lessons — firewalls, IDS/IPS, VPNs, SASE — into an '
            'actual coherent architecture rather than an unconnected '
            'collection of point products.',
      ),
    ],
  ),

  // 9k --------------------------------------------------------- Quiz
  Lesson(
    title: 'Security Infrastructure Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'Which port range includes HTTP (80) and SSH (22)?',
        options: ['Well-known ports (0-1023)', 'Registered ports (1024-49151)', 'Dynamic ports (49152-65535)', 'None of these'],
        correctIndex: 0,
        explanation: 'Well-known ports (0-1023) are reserved for widely standardized services like HTTP and SSH.',
      ),
      QuizQuestion(
        question: 'Dynamic/private ports are primarily used for:',
        options: [
          'Permanently assigned enterprise services',
          'Temporary client-side connections and NAT session tracking',
          'DNS resolution only',
          'Root-level system services',
        ],
        correctIndex: 1,
        explanation: 'Dynamic ports are used temporarily by client applications and NAT, never permanently assigned to a specific service.',
      ),
      QuizQuestion(
        question: 'A stateful firewall differs from a basic packet-filtering firewall because it:',
        options: [
          'Cannot inspect any traffic',
          'Tracks the state of active connections, correctly allowing return traffic for established sessions',
          'Only works with UDP traffic',
          'Requires no configuration at all',
        ],
        correctIndex: 1,
        explanation: 'Stateful firewalls track connection state; packet filters only look at individual packets in isolation.',
      ),
      QuizQuestion(
        question: 'Which firewall type is purpose-built to protect HTTP/S traffic from SQL injection and XSS?',
        options: ['UTM', 'WAF', 'Proxy firewall', 'Kernel proxy firewall'],
        correctIndex: 1,
        explanation: 'A Web Application Firewall (WAF) is specifically designed to inspect and protect HTTP/S application-layer traffic.',
      ),
      QuizQuestion(
        question: 'What is a key advantage of a cloud-based firewall over a traditional physical appliance?',
        options: [
          'It requires no configuration',
          'It scales elastically with demand and fits cloud-native architectures without provisioning hardware',
          'It cannot be bypassed under any circumstances',
          'It is always free to use',
        ],
        correctIndex: 1,
        explanation: 'Cloud-based firewalls scale on demand and fit naturally into cloud and hybrid environments.',
      ),
      QuizQuestion(
        question: 'The key difference between IDS and IPS is that IPS:',
        options: [
          'Only works on wireless networks',
          'Sits inline with traffic and actively blocks threats, while IDS only monitors and alerts',
          'Cannot generate any alerts',
          'Is always more accurate than IDS',
        ],
        correctIndex: 1,
        explanation: 'IPS is inline and can actively block traffic; IDS is out-of-band and only alerts.',
      ),
      QuizQuestion(
        question: 'A HIDS has visibility that a NIDS positioned outside a host typically lacks because:',
        options: [
          'HIDS is always faster',
          'HIDS runs directly on the endpoint and can see file changes, process execution, and decrypted activity on that specific host',
          'NIDS cannot process any traffic at all',
          'HIDS does not require any configuration',
        ],
        correctIndex: 1,
        explanation: 'Host-based systems see endpoint-level activity, including content after decryption, that network-based systems positioned outside cannot observe.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of a jump server?',
        options: [
          'To provide public internet access to employees',
          'To act as a hardened, monitored intermediary that administrators must connect through before reaching sensitive internal systems',
          'To replace the need for a firewall',
          'To distribute load across web servers',
        ],
        correctIndex: 1,
        explanation: 'Jump servers centralize and log administrative access to sensitive systems rather than allowing direct connections.',
      ),
      QuizQuestion(
        question: 'Sticky MAC learning on a switch port:',
        options: [
          'Requires no configuration and blocks all devices permanently',
          'Automatically learns and locks onto the first MAC address seen, refusing other devices afterward',
          'Encrypts all traffic through that port',
          'Only applies to wireless access points',
        ],
        correctIndex: 1,
        explanation: 'Sticky MAC learning combines easy setup with genuine restriction by locking a port to the first learned MAC address.',
      ),
      QuizQuestion(
        question: 'In 802.1X authentication, what role does RADIUS typically play?',
        options: [
          'It physically connects the network cable',
          'It is the centralized server that verifies credentials on behalf of the switch or access point (the authenticator)',
          'It replaces the need for EAP entirely',
          'It only works with wireless networks',
        ],
        correctIndex: 1,
        explanation: 'RADIUS centrally verifies credentials so the switch/AP itself does not need to store or check them directly.',
      ),
      QuizQuestion(
        question: 'Which VPN model is best suited for a contractor who only needs access to one specific internal web application?',
        options: ['Site-to-site VPN', 'Client-to-site VPN', 'Clientless VPN', 'IPsec transport mode'],
        correctIndex: 2,
        explanation: 'Clientless VPN provides browser-based access to specific applications without granting broader network access.',
      ),
      QuizQuestion(
        question: 'IPsec tunnel mode differs from transport mode because tunnel mode:',
        options: [
          'Provides no encryption at all',
          'Encrypts the entire original IP packet including its header, wrapping it in a new packet',
          'Only works with TCP traffic',
          'Cannot be used for site-to-site VPNs',
        ],
        correctIndex: 1,
        explanation: 'Tunnel mode protects the entire original packet including header information, making it standard for site-to-site VPNs.',
      ),
      QuizQuestion(
        question: 'What is the key difference between AH and ESP in IPsec?',
        options: [
          'AH provides encryption; ESP does not',
          'ESP provides confidentiality (encryption) plus authentication and integrity; AH provides authentication and integrity only, no encryption',
          'They are functionally identical',
          'AH only works with IPv6',
        ],
        correctIndex: 1,
        explanation: 'ESP is far more commonly used since most deployments need actual encryption, which AH alone does not provide.',
      ),
      QuizQuestion(
        question: 'SASE combines SD-WAN networking capabilities with:',
        options: [
          'Nothing additional — SASE and SD-WAN are identical',
          'A full suite of integrated cloud-delivered security services like firewall, secure web gateway, and Zero Trust network access',
          'Only physical hardware appliances',
          'A single antivirus product',
        ],
        correctIndex: 1,
        explanation: 'SASE unifies SD-WAN networking with integrated security services delivered from the cloud.',
      ),
      QuizQuestion(
        question: 'Why did the SASE model emerge as an alternative to routing all traffic through a central data center?',
        options: [
          'Central data centers are always more secure',
          'Users, applications, and data became distributed across cloud and remote locations, making central routing inefficient and latency-adding',
          'SASE is required by law in most countries',
          'Central data centers cannot run firewalls',
        ],
        correctIndex: 1,
        explanation: 'SASE brings security enforcement close to distributed users and applications rather than forcing an inefficient detour.',
      ),
      QuizQuestion(
        question: 'The "open design" principle in infrastructure control selection means:',
        options: [
          'Security should depend on attackers never learning how a system works',
          'A well-designed control remains effective even if its general design is publicly known, relying on protected keys and credentials rather than secrecy of design',
          'All source code must be open source',
          'Firewalls should never have any configuration',
        ],
        correctIndex: 1,
        explanation: 'Open design rejects security through obscurity — genuine security should not depend on attackers staying unaware of how something works.',
      ),
    ],
  ),
  // 10 -------------------------------------------------------- Assessment
  Lesson(
    title: 'Capstone Assessment',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'A web server is compromised, but the attacker cannot read /etc/passwd or connect to internal databases, even though the server runs as root. Which control is most likely responsible?',
        options: [
          'BitLocker',
          'Mandatory Access Control (SELinux/AppArmor)',
          'A host firewall rule',
          'NTFS permissions',
        ],
        correctIndex: 1,
        explanation: 'MAC policies restrict what even root processes can do — a compromised web server confined by SELinux/AppArmor can\'t access resources outside its policy.',
      ),
      QuizQuestion(
        question: 'In the STRIDE model, "Tampering" maps to which CIA Triad property?',
        options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
        correctIndex: 1,
        explanation: 'Tampering = unauthorized modification = an Integrity violation.',
      ),
      QuizQuestion(
        question: 'An organization\'s cloud storage buckets are set to public read access. Which type of tool would most reliably catch this misconfiguration continuously?',
        options: ['WAF', 'CASB', 'CSPM', 'SOAR'],
        correctIndex: 2,
        explanation: 'CSPM (Cloud Security Posture Management) continuously audits cloud configuration for misconfigurations like public buckets.',
      ),
      QuizQuestion(
        question: 'A penetration tester discovers credentials for the cloud console in a public GitHub repository. Which Kill Chain stage would they use these credentials in?',
        options: ['Reconnaissance', 'Weaponization', 'Initial Access', 'Lateral Movement'],
        correctIndex: 2,
        explanation: 'Using stolen credentials to log in to a system is Initial Access — the first foothold in the target environment.',
      ),
      QuizQuestion(
        question: 'Zero Trust\'s "Assume Breach" principle means:',
        options: [
          'Do not deploy any security controls since breaches are inevitable',
          'Design systems expecting a component will be compromised, and minimize blast radius and lateral movement',
          'Alert leadership immediately that a breach has occurred',
          'Assume all external traffic is malicious',
        ],
        correctIndex: 1,
        explanation: 'Assume Breach is a design principle: engineer for the scenario where something is already compromised, to limit damage.',
      ),
      QuizQuestion(
        question: 'Why should forensic analysis always be performed on a copy rather than the original evidence?',
        options: [
          'Copies are faster to analyze',
          'To preserve the original\'s integrity — any analysis could inadvertently modify it, invalidating the chain of custody',
          'Legal requirements prohibit touching the original',
          'Analysis tools only work on copies',
        ],
        correctIndex: 1,
        explanation: 'Analysis can modify timestamps, cache files, and other artefacts. Working from a verified copy preserves the original\'s integrity.',
      ),
      QuizQuestion(
        question: 'An organization passes its annual SOC 2 audit but is breached two weeks later via a vulnerability that wasn\'t in the audit scope. This illustrates:',
        options: [
          'That audits are useless',
          'That compliance confirms a baseline was met at audit time, not that the organization is fully secure',
          'That the auditor was negligent',
          'That SOC 2 should be replaced with ISO 27001',
        ],
        correctIndex: 1,
        explanation: 'Compliance is a point-in-time snapshot of a defined scope — not a guarantee of comprehensive security.',
      ),
      QuizQuestion(
        question: 'Which security maturity level involves implementing centralized logging, SIEM, and EDR across the environment?',
        options: [
          'Basic Hygiene',
          'Visibility',
          'Proactive Defense',
          'Adaptive',
        ],
        correctIndex: 1,
        explanation: 'Centralized logging, SIEM, and EDR are core Visibility-stage capabilities that enable detection before Proactive Defense work begins.',
      ),
      QuizQuestion(
        question: 'What is the Rules of Engagement (RoE) document used for in ethical hacking?',
        options: [
          'Marketing the penetration testing firm\'s services',
          'Defining scope, permitted techniques, and emergency contacts before testing begins',
          'Recording the final invoice for a testing engagement',
          'Listing every employee at the target organization',
        ],
        correctIndex: 1,
        explanation: 'The RoE is what makes penetration testing legal — it defines exactly what is authorized before any testing starts.',
      ),
      QuizQuestion(
        question: 'What does "purple teaming" specifically add beyond running red team and blue team exercises separately?',
        options: [
          'A third independent team that scores the other two',
          'Direct, deliberate collaboration between red and blue during the exercise to improve detection coverage in real time',
          'A requirement that all findings remain confidential forever',
          'Replacing the SOC with the red team permanently',
        ],
        correctIndex: 1,
        explanation: 'Purple teaming is defined by active collaboration between the offensive and defensive teams, not just sequential separate exercises.',
      ),
      QuizQuestion(
        question: 'In the shared responsibility model, who is primarily responsible for data and access control in a SaaS application?',
        options: [
          'The cloud provider entirely',
          'The customer',
          'Neither party — SaaS has no shared responsibility model',
          'A third-party auditor',
        ],
        correctIndex: 1,
        explanation: 'In SaaS, the provider owns infrastructure and the application; the customer remains responsible for their own data and access.',
      ),
      QuizQuestion(
        question: 'Which of the following is a core Zero Trust pillar covering device health verification?',
        options: ['Identity', 'Devices', 'Network', 'Data'],
        correctIndex: 1,
        explanation: 'The Devices pillar specifically covers verifying device health and compliance before granting access.',
      ),
      QuizQuestion(
        question: 'PASTA differs from STRIDE primarily by:',
        options: [
          'Being simpler and faster to apply',
          'Being a more comprehensive, risk-centric methodology tying business objectives to technical threat analysis',
          'Only applying to cloud systems',
          'Replacing the need for a Rules of Engagement document',
        ],
        correctIndex: 1,
        explanation: 'PASTA is a seven-stage methodology explicitly connecting business risk context to technical attack simulation, more comprehensive than STRIDE alone.',
      ),
      QuizQuestion(
        question: 'Why is order of volatility important when collecting digital evidence?',
        options: [
          'It determines which evidence is legally admissible',
          'More volatile evidence like RAM contents disappears first and must be captured before less volatile evidence like disk images',
          'It only matters for cloud-based systems',
          'It determines who is allowed to collect evidence',
        ],
        correctIndex: 1,
        explanation: 'Volatile evidence such as memory and running processes is lost quickly, so it must be prioritized for collection first.',
      ),
      QuizQuestion(
        question: 'A company\'s IAM roles grant far more cloud permissions than any role actually needs. This is a direct violation of:',
        options: ['Defense in depth', 'The principle of least privilege', 'Chain of custody', 'The Cyber Kill Chain'],
        correctIndex: 1,
        explanation: 'Overly permissive IAM roles violate least privilege — a foundational principle carried from the very first module into cloud architecture.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of the "Lessons Learned" style review at the end of a threat modeling or security program cycle?',
        options: [
          'To assign blame for past incidents',
          'To feed findings back into improved controls, policy, and training for the next cycle',
          'To close out the project permanently with no further review',
          'To satisfy a one-time compliance requirement only',
        ],
        correctIndex: 1,
        explanation: 'Continuous improvement — feeding findings back into the next cycle — is what keeps a security program (and a threat model) from going stale.',
      ),
      QuizQuestion(
        question: 'NIST CSF\'s five core functions are:',
        options: [
          'Plan, Do, Check, Act, Improve',
          'Identify, Protect, Detect, Respond, Recover',
          'Prevent, Detect, Respond, Recover, Review',
          'Assess, Plan, Implement, Monitor, Audit',
        ],
        correctIndex: 1,
        explanation: 'The NIST Cybersecurity Framework organizes its guidance around these five functions covering the full security lifecycle.',
      ),
      QuizQuestion(
        question: 'A CWPP (Cloud Workload Protection Platform) is specifically used to:',
        options: [
          'Manage cloud billing and cost optimization',
          'Secure individual cloud workloads such as VMs, containers, and serverless functions',
          'Manage DNS records for cloud-hosted domains',
          'Handle identity federation between cloud providers',
        ],
        correctIndex: 1,
        explanation: 'CWPP focuses specifically on protecting the workloads running inside a cloud environment.',
      ),
      QuizQuestion(
        question: 'Why does effective security leadership require translating technical risk into business terms?',
        options: [
          'Technical terms are always classified information',
          'Leadership makes budget decisions based on business outcomes, not raw technical severity scores',
          'Business terms are legally required in all security reports',
          'Technical risk and business risk are always identical',
        ],
        correctIndex: 1,
        explanation: 'Leaders who control security budgets need risk framed in terms they can act on — financial, regulatory, and reputational impact.',
      ),
      QuizQuestion(
        question: 'Which of the following best explains why Zero Trust is described as a synthesis rather than an entirely new invention?',
        options: [
          'It was invented before the CIA Triad',
          'It combines least privilege, strong authentication, segmentation, and continuous monitoring into one architecture applied everywhere continuously',
          'It only applies to government networks',
          'It replaces the need for any authentication',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust\'s real contribution is insisting existing principles apply everywhere and continuously, not creating fundamentally new concepts.',
      ),
      QuizQuestion(
        question: 'A security program skips straight to threat hunting without first ensuring patching, MFA, and backups are reliably in place. This illustrates:',
        options: [
          'Correct prioritization since threat hunting is more advanced',
          'A common, costly mistake of skipping basic hygiene before building advanced capability',
          'A requirement of the NIST CSF',
          'An example of defense in depth done correctly',
        ],
        correctIndex: 1,
        explanation: 'Advanced capabilities like threat hunting are far less effective without the basic hygiene foundation already in place.',
      ),
      QuizQuestion(
        question: 'What does "Repudiation" in STRIDE specifically address?',
        options: [
          'Data being read by unauthorized users',
          'A user denying they performed an action, addressed through logging and digital signatures',
          'A system becoming unavailable',
          'An attacker impersonating another user',
        ],
        correctIndex: 1,
        explanation: 'Repudiation threats are mitigated with strong audit logging and non-repudiation controls like digital signatures.',
      ),
      QuizQuestion(
        question: 'ISO/IEC 27001 differs from the NIST CSF primarily in that:',
        options: [
          'ISO 27001 only applies to US organizations',
          'ISO 27001 defines requirements for a certifiable Information Security Management System, while NIST CSF is a voluntary, non-certifiable framework',
          'NIST CSF is a legal requirement everywhere',
          'They are functionally identical with no differences',
        ],
        correctIndex: 1,
        explanation: 'ISO 27001 allows for formal third-party certification of an ISMS; NIST CSF is a guidance framework without a certification process.',
      ),
      QuizQuestion(
        question: 'A vendor-neutral security education, focused on concepts like least privilege and Zero Trust rather than specific products, remains valuable over time primarily because:',
        options: [
          'Vendor products never change',
          'Underlying principles remain relevant even as specific tools and platforms evolve',
          'Vendor-specific training is always more expensive',
          'Concepts are easier to test on certification exams',
        ],
        correctIndex: 1,
        explanation: 'Tools and vendor products change constantly; the underlying principles endure and remain applicable across whatever comes next.',
      ),
      QuizQuestion(
        question: 'Digital forensics and incident response overlap because:',
        options: [
          'They are performed by entirely unrelated teams with no shared skills',
          'A SOC investigating an active breach is effectively performing lightweight forensics in real time',
          'Forensics only applies after an organization has closed permanently',
          'Incident response never requires preserving evidence',
        ],
        correctIndex: 1,
        explanation: 'Containment decisions like avoiding immediate reimaging exist specifically to preserve evidence for forensic analysis.',
      ),
    ],
  ),
];
