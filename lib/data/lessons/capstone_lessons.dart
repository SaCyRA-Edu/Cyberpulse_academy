import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> capstoneLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'From Beginner to Security Professional: Your Roadmap',
    isAudio: true,
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
    sections: [
      LessonSection(
        heading: 'The Core Principle',
        body:
            'Defense in depth layers multiple, independent controls so '
            'that if any one fails, others remain. No single control is '
            'treated as sufficient — each layer assumes the previous one '
            'may eventually fail.',
      ),
      LessonSection(
        heading: 'The Layers in Practice',
        bullets: [
          'Perimeter — firewalls, DDoS mitigation, network monitoring',
          'Network — segmentation, IDS/IPS, encrypted transit',
          'Identity — MFA, least privilege, privileged access workstations',
          'Endpoint — EDR, FIM, patch management, application control',
          'Application — input validation, WAF, dependency scanning, secure SDLC',
          'Data — encryption at rest, DLP, data classification',
          'Detection — SIEM, SOC, threat hunting, incident response',
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
        heading: 'Why Mature Organizations Think This Way',
        body:
            'Junior practitioners look for "the" fix. Experienced '
            'architects design for failure — they assume every control '
            'will eventually fail and ask: "what catches it when it does?" '
            'This mindset shift is one of the most significant transitions '
            'in moving from practitioner to architect.',
      ),
    ],
  ),

  Lesson(
    title: 'Threat Modeling with STRIDE & PASTA',
    sections: [
      LessonSection(
        heading: 'Why Threat Model?',
        body:
            'Finding vulnerabilities before they\'re deployed is orders '
            'of magnitude cheaper than finding them after an incident. '
            'Threat modeling is the structured process for doing that — '
            'applied during design, not as an afterthought.',
      ),
      LessonSection(
        heading: 'STRIDE',
        bullets: [
          'Spoofing — pretending to be something or someone else',
          'Tampering — unauthorized modification of data or code',
          'Repudiation — denying having performed an action',
          'Information Disclosure — exposing data to unauthorized parties',
          'Denial of Service — degrading or denying availability',
          'Elevation of Privilege — gaining capabilities beyond what was authorized',
        ],
      ),
      LessonSection(
        heading: 'PASTA (Process for Attack Simulation & Threat Analysis)',
        body:
            'A seven-stage risk-centric methodology that moves from '
            'business objectives through technical decomposition to '
            'attack simulation and risk mitigation. More comprehensive '
            'than STRIDE alone — better suited to complex systems where '
            'business risk context matters as much as technical detail.',
      ),
      LessonSection(
        heading: 'How to Run a Threat Model',
        bullets: [
          '1. Diagram the system — identify components, data flows, and trust boundaries',
          '2. Identify threats — apply STRIDE to each trust boundary crossing',
          '3. Assess — how likely and how severe is each threat?',
          '4. Mitigate — what controls address each threat?',
          '5. Validate — are existing controls actually effective?',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'Ethical Hacking Methodology',
    sections: [
      LessonSection(
        heading: 'What Makes Testing "Ethical"',
        body:
            'The only thing separating a penetration tester from an '
            'attacker is written, explicit authorization. The Rules of '
            'Engagement (RoE) document defines scope, permitted techniques, '
            'emergency contacts, and handling of found data. Testing '
            'without an RoE — no matter the intent — is illegal in most '
            'jurisdictions.',
      ),
      LessonSection(
        heading: 'The Standard Phases',
        bullets: [
          'Scoping & RoE — agree what\'s in scope, what techniques are permitted',
          'Reconnaissance — passive (OSINT, DNS, Shodan) and active (scanning, enumeration)',
          'Vulnerability Analysis — identifying potential weaknesses',
          'Exploitation — attempting to validate and exploit findings',
          'Post-Exploitation — demonstrating impact (privilege escalation, lateral movement, data access)',
          'Reporting — full documentation of findings, evidence, and remediation guidance',
          'Remediation Verification — confirming fixes actually worked',
        ],
      ),
      LessonSection(
        heading: 'Red Team vs. Penetration Test',
        bullets: [
          'Penetration test — time-boxed, comprehensive coverage of a defined scope; finds technical vulnerabilities',
          'Red team — objective-based, long-horizon simulation of a real adversary; tests detection and response capability',
          'Purple team — red and blue working collaboratively to improve detection coverage',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'Digital Forensics & Chain of Custody',
    sections: [
      LessonSection(
        heading: 'What Digital Forensics Is',
        body:
            'Digital forensics is the collection, preservation, and '
            'analysis of digital evidence in a manner that is reliable, '
            'repeatable, and where necessary legally defensible. Every '
            'action on evidence must be justified and documented.',
      ),
      LessonSection(
        heading: 'Chain of Custody',
        body:
            'Every step — who collected it, how, when, where it was '
            'stored, and who accessed it — must be documented. A broken '
            'chain of custody can make evidence inadmissible and '
            'undermine an entire investigation.',
      ),
      LessonSection(
        heading: 'Core Principles',
        bullets: [
          'Work from copies — never analyze the original; create a forensic image (dd, FTK Imager) and verify with hash',
          'Order of volatility — collect most volatile first: memory (RAM), running processes, network state, then disk',
          'Document everything — timestamps, commands run, tools used, findings',
          'Integrity verification — hash evidence at acquisition and verify before and after analysis',
        ],
      ),
      LessonSection(
        heading: 'Memory Forensics',
        body:
            'RAM contains running processes, network connections, '
            'encryption keys, and credentials that don\'t exist anywhere '
            'on disk. Tools like Volatility analyze memory dumps to find '
            'injected malware, command history, and attacker infrastructure '
            'that would otherwise be invisible.',
      ),
    ],
  ),

  Lesson(
    title: 'Zero Trust Architecture',
    sections: [
      LessonSection(
        heading: 'Why the Perimeter Model Failed',
        body:
            'The castle-and-moat model assumed everything inside the '
            'network was trusted. Cloud services, remote work, personal '
            'devices, and sophisticated phishing have made "inside the '
            'network" meaningless as a security boundary. Zero Trust '
            'replaces the boundary with continuous verification.',
      ),
      LessonSection(
        heading: 'The Three Zero Trust Principles',
        bullets: [
          'Verify explicitly — authenticate and authorize every request based on all available data: identity, device health, location, behavior',
          'Use least privilege access — grant minimum required access; use just-in-time (JIT) and just-enough-access (JEA)',
          'Assume breach — design systems expecting that some component will be compromised; minimize blast radius and lateral movement',
        ],
      ),
      LessonSection(
        heading: 'Zero Trust Pillars',
        bullets: [
          'Identity — strong authentication, MFA, identity risk scoring',
          'Devices — device health attestation before granting access',
          'Network — microsegmentation, encrypted east-west traffic',
          'Applications — application-level access control, CASB',
          'Data — classification, DLP, encryption, rights management',
          'Visibility — comprehensive logging and analytics across all pillars',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'Cloud Security Architecture',
    sections: [
      LessonSection(
        heading: 'The Shared Responsibility Model',
        body:
            'Cloud security responsibilities are split between the '
            'provider and the customer. The exact split depends on the '
            'service model: in IaaS (like EC2), the customer owns the OS '
            'upward; in PaaS, the provider owns more; in SaaS, the '
            'customer is primarily responsible for data and access.',
      ),
      LessonSection(
        heading: 'Common Cloud Security Misconfigurations',
        bullets: [
          'Publicly accessible storage buckets (S3, Azure Blob) — a consistently common source of large data breaches',
          'Overly permissive IAM roles — violating least privilege in the cloud',
          'No MFA on cloud console access',
          'Security groups/NSGs with 0.0.0.0/0 inbound rules on sensitive ports',
          'Logging disabled — CloudTrail, Azure Monitor, GCP Audit Logs must be active',
        ],
      ),
      LessonSection(
        heading: 'Cloud Security Tooling',
        bullets: [
          'CSPM (Cloud Security Posture Management) — continuously audits cloud config for misconfigurations',
          'CWPP (Cloud Workload Protection Platform) — secures workloads (VMs, containers, functions)',
          'CASB (Cloud Access Security Broker) — controls and monitors cloud service usage',
          'Native tools: AWS Security Hub, Azure Defender for Cloud, GCP Security Command Center',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'Governance, Risk & Compliance (GRC)',
    sections: [
      LessonSection(
        heading: 'What GRC Covers',
        bullets: [
          'Governance — the decision-making structures, policies, and accountability frameworks that direct a security program',
          'Risk — identifying, assessing, treating, and monitoring risk across the organization',
          'Compliance — meeting legal, regulatory, and contractual obligations (GDPR, HIPAA, PCI-DSS, ISO 27001)',
        ],
      ),
      LessonSection(
        heading: 'Key Frameworks',
        bullets: [
          'NIST Cybersecurity Framework (CSF) — vendor-neutral; five functions: Identify, Protect, Detect, Respond, Recover',
          'ISO/IEC 27001 — international standard for an Information Security Management System (ISMS); auditable and certifiable',
          'NIST SP 800-53 — detailed control catalog used by US federal agencies',
          'CIS Controls — pragmatic 18-control prioritized list; good starting point for many organizations',
        ],
      ),
      LessonSection(
        heading: 'Compliance ≠ Security',
        body:
            'Passing an audit confirms you met a defined baseline on the '
            'audit date. It says nothing about whether you\'re secure '
            'today, tomorrow, or against threats the standard didn\'t '
            'anticipate. Mature security programs use frameworks as a '
            'floor, not a ceiling.',
      ),
    ],
  ),

  Lesson(
    title: 'Building a Security Program from Scratch',
    sections: [
      LessonSection(
        heading: 'Where to Start',
        body:
            'Most new security programs fail because they try to do '
            'everything at once. The right starting point is always '
            'the same: understand what assets you have, what the most '
            'likely threats to those assets are, and which gaps have '
            'the highest risk. Everything else flows from that.',
      ),
      LessonSection(
        heading: 'A Practical Maturity Progression',
        bullets: [
          'Level 1 (Basic hygiene) — asset inventory, patch management, MFA, backups, incident response plan',
          'Level 2 (Visibility) — centralized logging, SIEM, EDR, vulnerability management',
          'Level 3 (Proactive defense) — threat hunting, detection engineering, red team exercises, GRC program',
          'Level 4 (Adaptive) — continuous improvement, threat intelligence integration, advanced automation',
        ],
      ),
      LessonSection(
        heading: 'Selling Security to Leadership',
        body:
            'Security spending is a business decision. Leaders who '
            'control budgets need to understand risk in business terms '
            '— potential financial impact, regulatory exposure, '
            'reputational risk — not technical CVE scores. The security '
            'professional\'s job includes translating technical risk into '
            'business risk that leadership can act on.',
      ),
    ],
  ),

  Lesson(
    title: 'Capstone Assessment',
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'A web server compromised by an attacker cannot read /etc/passwd even running as root. What control is responsible?',
        options: [
          'BitLocker',
          'Mandatory Access Control such as SELinux or AppArmor',
          'A host firewall rule',
          'NTFS permissions',
        ],
        correctIndex: 1,
        explanation: 'MAC policies restrict what even root processes can do — confining the compromised web server.',
      ),
      QuizQuestion(
        question: 'In STRIDE Tampering maps to which CIA Triad property?',
        options: [
          'Confidentiality',
          'Integrity',
          'Availability',
          'Authentication',
        ],
        correctIndex: 1,
        explanation: 'Tampering = unauthorized modification = an Integrity violation.',
      ),
      QuizQuestion(
        question: 'Which tool continuously audits cloud configuration for misconfigurations like public storage buckets?',
        options: [
          'WAF',
          'CASB',
          'CSPM',
          'SOAR',
        ],
        correctIndex: 2,
        explanation: 'CSPM (Cloud Security Posture Management) continuously monitors cloud config for misconfigurations.',
      ),
      QuizQuestion(
        question: 'Zero Trust Assume Breach principle means:',
        options: [
          'Do not deploy security controls',
          'Design systems expecting compromise and minimize blast radius and lateral movement',
          'Alert leadership that a breach occurred',
          'Assume all external traffic is malicious',
        ],
        correctIndex: 1,
        explanation: 'Assume Breach is a design principle: engineer for the scenario where something is already compromised.',
      ),
      QuizQuestion(
        question: 'Why must forensic analysis be performed on a copy not the original?',
        options: [
          'Copies are faster to analyze',
          'Analysis can modify timestamps and artifacts — a copy preserves the original integrity',
          'Legal requirements prohibit touching the original',
          'Tools only work on copies',
        ],
        correctIndex: 1,
        explanation: 'Working from a verified copy preserves the originals integrity for chain of custody.',
      ),
      QuizQuestion(
        question: 'A pen tester discovers leaked credentials on GitHub then logs into the cloud console. What Kill Chain stage?',
        options: [
          'Reconnaissance',
          'Weaponization',
          'Initial Access',
          'Lateral Movement',
        ],
        correctIndex: 2,
        explanation: 'Using stolen credentials to gain the first foothold is Initial Access.',
      ),
      QuizQuestion(
        question: 'Why is compliance not the same as security?',
        options: [
          'They are identical',
          'Compliance confirms a defined baseline was met at audit time not that the org is fully secure',
          'Compliance only applies to small companies',
          'Security frameworks never include compliance requirements',
        ],
        correctIndex: 1,
        explanation: 'Compliance is a floor not a ceiling — it confirms a snapshot not ongoing security.',
      ),
      QuizQuestion(
        question: 'Security maturity Level 2 Visibility typically includes:',
        options: [
          'Asset inventory only',
          'Centralized logging SIEM and EDR across the environment',
          'Threat hunting and red team exercises',
          'GRC program and advanced automation',
        ],
        correctIndex: 1,
        explanation: 'Centralized logging SIEM and EDR are core Level 2 capabilities enabling detection.',
      ),
      QuizQuestion(
        question: 'Defense in depth means:',
        options: [
          'One extremely strong perimeter control',
          'Layering multiple independent controls so failure of any one does not mean total compromise',
          'Only securing the network boundary',
          'Avoiding firewalls',
        ],
        correctIndex: 1,
        explanation: 'Defense in depth layers controls so failures at one layer are caught by others.',
      ),
      QuizQuestion(
        question: 'Red teaming differs from penetration testing primarily because:',
        options: [
          'Red teams use different tools',
          'Red teams simulate real adversary behavior over a longer horizon testing detection and response not just finding vulnerabilities',
          'Red teams only test physical security',
          'Pen tests are illegal',
        ],
        correctIndex: 1,
        explanation: 'Red teams are objective-based adversary simulations while pen tests are time-boxed technical vulnerability assessments.',
      ),
      QuizQuestion(
        question: 'The shared responsibility model in cloud security means:',
        options: [
          'The cloud provider is responsible for everything',
          'Security duties are split between provider and customer depending on the service model',
          'The customer is responsible for nothing',
          'Shared accounts are acceptable',
        ],
        correctIndex: 1,
        explanation: 'In IaaS the customer owns the OS upward; in SaaS the customer mainly owns data and access.',
      ),
      QuizQuestion(
        question: 'PASTA threat modeling is risk-centric and considers:',
        options: [
          'Only technical vulnerabilities',
          'Business objectives through technical decomposition to attack simulation',
          'Only network-layer threats',
          'Only known CVEs',
        ],
        correctIndex: 1,
        explanation: 'PASTA is a seven-stage risk-centric methodology aligning business risk with technical threat analysis.',
      ),
      QuizQuestion(
        question: 'Memory forensics using tools like Volatility can reveal:',
        options: [
          'Files on encrypted disk',
          'Running processes network connections encryption keys and credentials not visible on disk',
          'Web browser history only',
          'Hardware serial numbers',
        ],
        correctIndex: 1,
        explanation: 'RAM contains ephemeral evidence including malware injected code and credentials that never touch disk.',
      ),
      QuizQuestion(
        question: 'The NIST Cybersecurity Framework five functions are:',
        options: [
          'Plan Do Check Act and Improve',
          'Identify Protect Detect Respond and Recover',
          'Prevent Detect Respond Recover and Review',
          'Assess Plan Implement Monitor and Audit',
        ],
        correctIndex: 1,
        explanation: 'The NIST CSF five functions cover the full security lifecycle.',
      ),
      QuizQuestion(
        question: 'Cloud misconfiguration leading to a public S3 bucket is best caught continuously by:',
        options: [
          'Annual penetration test',
          'CSPM tool that continuously monitors cloud resource configurations',
          'Antivirus scan',
          'Network IDS',
        ],
        correctIndex: 1,
        explanation: 'CSPM provides continuous automated monitoring of cloud configurations.',
      ),
      QuizQuestion(
        question: 'CWPP (Cloud Workload Protection Platform) is used for:',
        options: [
          'Managing cloud billing',
          'Securing cloud workloads including VMs containers and serverless functions',
          'DNS management',
          'Identity governance',
        ],
        correctIndex: 1,
        explanation: 'CWPP secures the workloads running in cloud environments.',
      ),
      QuizQuestion(
        question: 'Selling security to leadership is most effective when you:',
        options: [
          'Use technical CVE scores',
          'Translate technical risk into business terms like financial impact and regulatory exposure',
          'Demand budget without justification',
          'Focus only on compliance requirements',
        ],
        correctIndex: 1,
        explanation: 'Leadership makes business decisions — security must be framed in business risk language to resonate.',
      ),
      QuizQuestion(
        question: 'Which is a core Zero Trust pillar?',
        options: [
          'Implicit trust within the network perimeter',
          'Device health attestation before granting access',
          'Open network access for productivity',
          'Single-factor authentication',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust requires verifying device health explicitly before granting access regardless of network location.',
      ),
      QuizQuestion(
        question: 'ISO/IEC 27001 is:',
        options: [
          'A US government regulation',
          'An international standard for an Information Security Management System that is auditable and certifiable',
          'A list of approved security tools',
          'A cloud security framework only',
        ],
        correctIndex: 1,
        explanation: 'ISO 27001 defines requirements for an ISMS and enables formal certification.',
      ),
      QuizQuestion(
        question: 'Chain of custody in digital forensics requires:',
        options: [
          'Immediate reimaging of evidence',
          'Documenting every step of who handled evidence when and how to maintain integrity',
          'Destroying duplicate copies',
          'Working directly on original evidence',
        ],
        correctIndex: 1,
        explanation: 'Chain of custody documentation ensures evidence integrity and legal defensibility.',
      ),
      QuizQuestion(
        question: 'A CASB (Cloud Access Security Broker) is used to:',
        options: [
          'Cache web content',
          'Control and monitor cloud service usage enforcing security policies',
          'Route network traffic',
          'Manage patch deployment',
        ],
        correctIndex: 1,
        explanation: 'CASB sits between users and cloud services enforcing access data and threat policies.',
      ),
      QuizQuestion(
        question: 'STRIDE Elevation of Privilege maps to:',
        options: [
          'Confidentiality failure',
          'Integrity failure',
          'Authorization failure — gaining capabilities beyond what was granted',
          'Availability failure',
        ],
        correctIndex: 2,
        explanation: 'Elevation of Privilege is gaining more capabilities than authorized — an authorization control failure.',
      ),
      QuizQuestion(
        question: 'The Repudiation threat in STRIDE is mitigated by:',
        options: [
          'Encryption',
          'Audit logging and digital signatures that prove who performed an action',
          'Availability redundancy',
          'Firewall rules',
        ],
        correctIndex: 1,
        explanation: 'Non-repudiation controls like audit logs and digital signatures prevent denial of actions.',
      ),
      QuizQuestion(
        question: 'Security maturity Level 3 Proactive Defense typically includes:',
        options: [
          'Basic antivirus only',
          'Threat hunting detection engineering and red team exercises',
          'Asset inventory',
          'SIEM deployment',
        ],
        correctIndex: 1,
        explanation: 'Level 3 moves beyond reactive detection to proactively searching for and testing against threats.',
      ),
      QuizQuestion(
        question: 'Why are vendor-neutral security concepts more durable than vendor-specific knowledge?',
        options: [
          'Vendor products are low quality',
          'Vendor-neutral concepts apply across any platform or product while specific tools change constantly',
          'Certifications do not cover vendor products',
          'Vendor products are never secure',
        ],
        correctIndex: 1,
        explanation: 'Foundational concepts like CIA Triad and Zero Trust remain relevant regardless of which tools or vendors are in use.',
      ),

    ],
  ),
];
