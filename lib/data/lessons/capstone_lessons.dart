import '../lesson_model.dart';

const List<Lesson> capstoneLessons = [
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
    quiz: [
      QuizQuestion(
        question: 'A web server is compromised, but the attacker cannot '
            'read /etc/passwd or connect to internal databases, even '
            'though the server runs as root. Which control is most likely '
            'responsible?',
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
        question: 'In the STRIDE model, "Tampering" maps to which CIA '
            'Triad property?',
        options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
        correctIndex: 1,
        explanation: 'Tampering = unauthorized modification = an Integrity violation.',
      ),
      QuizQuestion(
        question: 'An organization\'s cloud storage buckets are set to public '
            'read access. Which type of tool would most reliably catch '
            'this misconfiguration continuously?',
        options: ['WAF', 'CASB', 'CSPM', 'SOAR'],
        correctIndex: 2,
        explanation: 'CSPM (Cloud Security Posture Management) continuously audits cloud configuration for misconfigurations like public buckets.',
      ),
      QuizQuestion(
        question: 'A penetration tester discovers credentials for the '
            'cloud console in a public GitHub repository. Which Kill Chain '
            'stage would they use these credentials in?',
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
        question: 'Why should forensic analysis always be performed on a '
            'copy rather than the original evidence?',
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
        question: 'An organization passes its annual SOC 2 audit but is '
            'breached two weeks later via a vulnerability that wasn\'t '
            'in the audit scope. This illustrates:',
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
        question: 'Which security maturity level involves implementing '
            'centralized logging, SIEM, and EDR across the environment?',
        options: [
          'Level 1 — Basic hygiene',
          'Level 2 — Visibility',
          'Level 3 — Proactive defense',
          'Level 4 — Adaptive',
        ],
        correctIndex: 1,
        explanation: 'Centralized logging, SIEM, and EDR are core Level 2 (Visibility) capabilities that enable detection before Level 3 proactive work begins.',
      ),
    ],
  ),
];
