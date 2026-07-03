import '../lesson_model.dart';

const List<Lesson> socOperationsLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'A Day in the Life of a Security Analyst',
    isAudio: true,
    sections: [
      LessonSection(
        heading: 'SOC Operations — Audio Introduction',
        body:
            'This is an audio lesson. Sit back and listen. A transcript '
            'is shown below.',
      ),
      LessonSection(
        heading: '6:58 AM',
        body:
            'Maya arrives two minutes before her shift starts. The '
            'overnight analyst is already at the door. "Quiet night," '
            'he says — but then mentions one thing: an unusual outbound '
            'connection from a server in the finance segment, around '
            '3 AM. It was flagged low-priority, auto-resolved, and '
            'nothing followed. Maya nods and writes it down. In her '
            'experience, "quiet night" with one exception is worth '
            'a second look.',
      ),
      LessonSection(
        heading: '8:15 AM',
        body:
            'The alert queue has 47 items. She triages from the top. '
            'Most are familiar noise — failed logins from a known '
            'scanner, a cloud API threshold that fires every Tuesday '
            'morning. She clears 40 in the first hour. Seven need '
            'investigation. Two of those she escalates. One she\'s '
            'not sure about: an endpoint that ran a PowerShell command '
            'at 2:47 AM while no one was logged in. She opens the '
            'timeline.',
      ),
      LessonSection(
        heading: '10:30 AM',
        body:
            'The PowerShell command downloaded a small file from an '
            'external IP. The IP doesn\'t appear in any threat feed. '
            'The file hash isn\'t known malicious. But it executed '
            '11 minutes after the unusual finance server connection '
            'from last night. Two anomalies at 3 AM, 11 minutes apart, '
            'on different systems. She escalates to Tier 2 and adds a '
            'note: possible lateral movement, investigate together.',
      ),
      LessonSection(
        heading: 'What This Illustrates',
        body:
            'SOC work isn\'t about dramatic, obvious attacks. It\'s about '
            'pattern recognition — connecting signals that individually '
            'look like noise but together look like something real. It '
            'requires technical knowledge, methodical process, clear '
            'documentation, and the judgment to know when two "low '
            'priority" events are actually one serious incident. '
            'That\'s what this module builds.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'SOC Models: In-House, MSSP & MDR',
    sections: [
      LessonSection(
        heading: 'The Three Main SOC Delivery Models',
        bullets: [
          'In-house SOC — the organization builds, staffs, and runs its own team; full control, highest cost',
          'MSSP (Managed Security Service Provider) — outsource monitoring to a third-party provider; cost-effective but less organizational context',
          'MDR (Managed Detection and Response) — goes further than MSSP by also providing active investigation and containment; the fastest-growing model',
        ],
      ),
      LessonSection(
        heading: 'Hybrid SOC',
        body:
            'Many organizations blend models — for example, an in-house '
            'team handles Tier 2+ investigations while an MDR provider '
            'handles 24/7 Tier 1 alert triage. The right model depends '
            'on budget, risk appetite, and the availability of security '
            'talent in the local market.',
      ),
      LessonSection(
        heading: 'Virtual SOC',
        body:
            'A Virtual SOC (vSOC) operates with no dedicated physical '
            'space — analysts work remotely, tool access is cloud-based. '
            'Accelerated significantly by remote work normalization and '
            'cloud-native SIEM adoption.',
      ),
    ],
  ),

  Lesson(
    title: 'SOC Roles, Tiers & Career Paths',
    sections: [
      LessonSection(
        heading: 'Tier Structure',
        bullets: [
          'Tier 1 (Triage Analyst) — first to see alerts; determines whether to close, monitor, or escalate',
          'Tier 2 (Incident Responder) — investigates escalated alerts, determines scope and impact, leads containment',
          'Tier 3 (Threat Hunter / Senior Analyst) — proactively searches for undetected threats, handles advanced cases, tunes detection rules',
        ],
      ),
      LessonSection(
        heading: 'Supporting Roles',
        bullets: [
          'SOC Manager — staffing, SLAs, reporting to leadership, tool procurement',
          'Detection Engineer — writes and maintains the SIEM rules and logic that generate alerts',
          'Threat Intelligence Analyst — tracks adversary groups, TTPs, and intelligence relevant to the organization',
          'Forensics Analyst — supports deep-dive investigations requiring evidence preservation',
        ],
      ),
      LessonSection(
        heading: 'Career Progression',
        body:
            'The typical path is T1 → T2 → T3 or into a specialism '
            '(detection engineering, threat hunting, forensics, IR lead). '
            'Technical skills (SIEM query languages, scripting, log '
            'analysis) combine with soft skills (communication, '
            'documentation, calm decision-making) at every tier.',
      ),
    ],
  ),

  Lesson(
    title: 'SIEM Platforms & Log Correlation',
    sections: [
      LessonSection(
        heading: 'What a SIEM Does',
        body:
            'A SIEM (Security Information and Event Management) platform '
            'collects, normalizes, and correlates log data from across '
            'the environment — firewalls, endpoints, cloud services, '
            'servers, identity providers — then applies detection rules '
            'and ML to surface potential security events.',
      ),
      LessonSection(
        heading: 'Leading SIEM Platforms',
        bullets: [
          'Microsoft Sentinel — cloud-native; tight Azure/M365 integration; KQL query language',
          'Splunk — widely deployed; powerful SPL query language; extensive ecosystem',
          'IBM QRadar — enterprise; strong compliance reporting',
          'Elastic SIEM (OpenSearch) — open-source option; increasingly mature',
          'Chronicle (Google) — cloud-scale; petabyte retention',
        ],
      ),
      LessonSection(
        heading: 'The Power of Correlation',
        body:
            'One failed login is noise. 500 failed logins from one IP '
            'followed by a successful login and a lateral movement event '
            'is a detection. Correlation rules link events across time, '
            'source, and type to surface patterns that no individual '
            'alert would reveal.',
      ),
    ],
  ),

  Lesson(
    title: 'Threat Intelligence & IOC Analysis',
    sections: [
      LessonSection(
        heading: 'What Threat Intelligence Is',
        body:
            'Threat intelligence is analyzed information about adversaries '
            '— their tools, techniques, infrastructure, and objectives — '
            'that helps defenders prioritize and contextualize alerts.',
      ),
      LessonSection(
        heading: 'Types of Indicators',
        bullets: [
          'IOC (Indicator of Compromise) — observable evidence of a breach: malicious IP, file hash, domain, registry key',
          'TTP (Tactic, Technique, Procedure) — how the attacker operates, mapped to frameworks like MITRE ATT&CK',
          'Strategic intelligence — broader picture of adversary groups, their targets, and motivations',
        ],
      ),
      LessonSection(
        heading: 'Intelligence Sources',
        bullets: [
          'Open-source (OSINT) — VirusTotal, Shodan, MISP, AlienVault OTX, government CERT feeds',
          'Commercial feeds — CrowdStrike Intel, Recorded Future, Mandiant Advantage',
          'ISACs — sector-specific sharing communities (FS-ISAC for financial, H-ISAC for healthcare)',
          'Internal — your own historical incidents are among the most valuable and context-relevant sources',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'Alert Triage & False Positive Management',
    sections: [
      LessonSection(
        heading: 'The Alert Fatigue Problem',
        body:
            'A busy SOC may process thousands of alerts per day, the '
            'vast majority of which are false positives. Analysts who '
            'become numb to high volumes of low-quality alerts start '
            'missing real events. Alert quality matters as much as '
            'alert quantity.',
      ),
      LessonSection(
        heading: 'A Practical Triage Process',
        bullets: [
          '1. Contextualize — what triggered this, from where, on which asset, at what time?',
          '2. Enrich — pull in threat intel, asset info, and recent activity for the involved entities',
          '3. Assess — what\'s the worst-case if this is real? What\'s the likelihood?',
          '4. Decide — close (false positive), monitor (watch for more signals), or escalate (open incident)',
          '5. Document — record the reasoning for every decision',
        ],
      ),
      LessonSection(
        heading: 'Reducing False Positives',
        bullets: [
          'Tune detection rules after each wave of false positives',
          'Build allowlists for known-good behaviour (specific admin accounts, maintenance windows)',
          'Use risk scoring to surface only high-confidence, high-severity alerts for immediate attention',
          'Track false positive rates per rule — rules above a threshold need to be rewritten or retired',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'The Incident Response Lifecycle',
    sections: [
      LessonSection(
        heading: 'Six Phases',
        bullets: [
          'Preparation — playbooks, tools, team training, communication plans; before anything happens',
          'Identification — detecting and confirming that an incident is actually occurring',
          'Containment — stopping the spread without yet removing the threat (preserve forensic evidence)',
          'Eradication — removing the threat (malware, backdoor accounts, compromised credentials)',
          'Recovery — restoring systems to known-good state; validating before returning to production',
          'Lessons Learned — post-incident review to improve detection, process, and controls',
        ],
      ),
      LessonSection(
        heading: 'Containment Strategies',
        bullets: [
          'Short-term: isolate the affected host from the network (network quarantine)',
          'Long-term: identify and contain all affected systems before eradication begins',
          'Don\'t reimage immediately — preserve evidence (memory, disk image) for forensic analysis',
        ],
      ),
      LessonSection(
        heading: 'Communication During an Incident',
        body:
            'Who to notify and when is a critical planning decision. '
            'Leadership, legal, PR, customers, and regulators may all '
            'have notification requirements on different timelines. '
            'Having a communication plan prepared in advance prevents '
            'chaotic, inconsistent messaging during a high-stress event.',
      ),
    ],
  ),

  Lesson(
    title: 'MITRE ATT&CK Framework',
    sections: [
      LessonSection(
        heading: 'What ATT&CK Is',
        body:
            'MITRE ATT&CK (Adversarial Tactics, Techniques, and Common '
            'Knowledge) is a publicly maintained knowledge base of '
            'attacker behavior organized by tactic (the goal) and '
            'technique (how it\'s achieved), built from real-world '
            'observation of threat actors.',
      ),
      LessonSection(
        heading: 'The Tactics (Enterprise Matrix)',
        bullets: [
          'Reconnaissance, Resource Development, Initial Access',
          'Execution, Persistence, Privilege Escalation',
          'Defense Evasion, Credential Access, Discovery',
          'Lateral Movement, Collection, Command and Control',
          'Exfiltration, Impact',
        ],
      ),
      LessonSection(
        heading: 'Practical Uses in a SOC',
        bullets: [
          'Alert mapping — tag every detection rule with its ATT&CK technique(s)',
          'Coverage gap analysis — identify which techniques have no detection coverage',
          'Investigation pivot — use ATT&CK to anticipate what an attacker will try next',
          'Reporting — communicate findings to leadership in a consistent, recognized language',
        ],
      ),
    ],
  ),

  Lesson(
    title: 'The Cyber Kill Chain',
    sections: [
      LessonSection(
        heading: 'The Model',
        body:
            'Developed by Lockheed Martin, the Cyber Kill Chain describes '
            'seven stages of a targeted intrusion. The insight: an '
            'attacker must complete every stage to achieve their objective, '
            'so defenders who disrupt any stage can stop the attack.',
      ),
      LessonSection(
        heading: 'The Seven Stages',
        bullets: [
          'Reconnaissance — gathering information about the target',
          'Weaponization — creating the exploit/payload',
          'Delivery — sending the payload (phishing, USB, web exploit)',
          'Exploitation — triggering the exploit on the victim',
          'Installation — establishing persistence (malware, backdoor)',
          'Command & Control (C2) — establishing a remote communication channel',
          'Actions on Objectives — achieving the goal (data theft, destruction, lateral movement)',
        ],
      ),
      LessonSection(
        heading: 'Limitations',
        body:
            'The Kill Chain was designed around external network-based '
            'intrusions and doesn\'t model insider threats or some cloud '
            'attack patterns well. ATT&CK provides more granular and '
            'updated technique coverage. In practice, both are used '
            'together.',
      ),
    ],
  ),

  Lesson(
    title: 'SOAR: Security Orchestration, Automation & Response',
    sections: [
      LessonSection(
        heading: 'What SOAR Does',
        body:
            'SOAR platforms automate repetitive, well-defined response '
            'actions that analysts would otherwise do manually for every '
            'alert: querying threat intel databases, disabling accounts, '
            'isolating hosts, sending notifications, opening tickets. '
            'This compresses mean time to respond (MTTR) significantly.',
      ),
      LessonSection(
        heading: 'Playbooks',
        body:
            'A SOAR playbook is a structured workflow that defines exactly '
            'what steps to take when a specific type of alert fires — '
            'automated steps, human decision gates, and escalation '
            'conditions. Well-written playbooks make T1 triage faster '
            'and more consistent.',
      ),
      LessonSection(
        heading: 'SOAR vs. SIEM',
        body:
            'SIEM detects and generates alerts. SOAR responds to those '
            'alerts. They\'re complementary — most modern deployments '
            'have both, often integrated so a SIEM alert directly '
            'triggers a SOAR playbook. Some platforms (like Microsoft '
            'Sentinel) combine both.',
      ),
    ],
  ),

  Lesson(
    title: 'SOC Metrics, Documentation & Shift Handoffs',
    sections: [
      LessonSection(
        heading: 'Key SOC Metrics',
        bullets: [
          'MTTD (Mean Time to Detect) — how long from initial compromise to detection',
          'MTTR (Mean Time to Respond) — how long from detection to containment',
          'MTTC (Mean Time to Contain) — how long from detection to isolation complete',
          'False positive rate per rule — signal quality indicator',
          'Dwell time — how long an attacker was present before detection',
        ],
      ),
      LessonSection(
        heading: 'Shift Handoffs',
        body:
            'Because SOCs run 24/7, shift handoffs are high-risk moments '
            'where context can be lost. A good handoff includes: open '
            'incidents with current status, decisions made and reasoning, '
            'actions pending, and anything unusual observed during the '
            'shift — written, not just verbal.',
      ),
      LessonSection(
        heading: 'Documentation Standards',
        body:
            'Every alert disposition should be documented: what it was, '
            'what evidence was reviewed, what was decided, and why. '
            'This creates an institutional memory, supports compliance '
            'audits, and ensures the next analyst can pick up exactly '
            'where the last one left off.',
      ),
    ],
  ),

  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'What distinguishes MDR from a traditional MSSP?',
        options: [
          'MDR is cheaper',
          'MDR provides active investigation and containment not just monitoring and alerting',
          'MDR is cloud-only',
          'MSSP uses more advanced tools',
        ],
        correctIndex: 1,
        explanation: 'MDR goes beyond monitoring to actively investigate and contain threats on behalf of the customer.',
      ),
      QuizQuestion(
        question: 'What is the role of a Detection Engineer in a SOC?',
        options: [
          'Physical security',
          'Writing and maintaining SIEM rules and logic that generate alerts',
          'Patching endpoint systems',
          'Managing the SOC budget',
        ],
        correctIndex: 1,
        explanation: 'Detection Engineers build and tune the rules that determine what the SIEM surfaces as alerts.',
      ),
      QuizQuestion(
        question: 'In ATT&CK a Technique represents:',
        options: [
          'The overall goal the attacker is achieving',
          'A specific method used to accomplish a tactic',
          'A type of malware family',
          'A vulnerability in a product',
        ],
        correctIndex: 1,
        explanation: 'Tactics are goals (e.g. Persistence) and Techniques are the specific methods used to achieve them.',
      ),
      QuizQuestion(
        question: 'Which Kill Chain stage does a spear-phishing email delivering malware represent?',
        options: [
          'Reconnaissance',
          'Weaponization',
          'Delivery',
          'Exploitation',
        ],
        correctIndex: 2,
        explanation: 'Sending the payload to the victim via email is the Delivery stage.',
      ),
      QuizQuestion(
        question: 'MTTD measures:',
        options: [
          'How long to resolve an alert',
          'How long from initial compromise to detection',
          'How many alerts were resolved per shift',
          'Time to patch a vulnerability',
        ],
        correctIndex: 1,
        explanation: 'MTTD (Mean Time to Detect) measures the gap between compromise and discovery.',
      ),
      QuizQuestion(
        question: 'During Containment you should NOT immediately reimage the machine because:',
        options: [
          'Reimaging is too slow',
          'Forensic evidence in memory and on disk is destroyed by reimaging — investigate first',
          'Reimaging requires vendor approval',
          'Containment and eradication are the same phase',
        ],
        correctIndex: 1,
        explanation: 'Preserving forensic evidence before cleanup is essential for understanding the full incident.',
      ),
      QuizQuestion(
        question: 'What is a SOAR playbook?',
        options: [
          'A training manual for new analysts',
          'A structured automated workflow defining response steps for a specific alert type',
          'A threat intelligence database',
          'A compliance reporting template',
        ],
        correctIndex: 1,
        explanation: 'A SOAR playbook automates and standardizes the response to a specific alert type.',
      ),
      QuizQuestion(
        question: 'Alert fatigue occurs when:',
        options: [
          'Too many critical incidents happen simultaneously',
          'High volumes of low-quality alerts cause analysts to become desensitized and miss real events',
          'The SIEM goes offline',
          'Too few analysts are on shift',
        ],
        correctIndex: 1,
        explanation: 'Alert fatigue from excessive false positives causes analysts to underreact to real threats.',
      ),
      QuizQuestion(
        question: 'Threat intelligence IOCs (Indicators of Compromise) include:',
        options: [
          'Business process documentation',
          'Known-malicious IPs file hashes domains and registry keys',
          'Employee performance metrics',
          'Network bandwidth statistics',
        ],
        correctIndex: 1,
        explanation: 'IOCs are observable artifacts suggesting a system may be compromised.',
      ),
      QuizQuestion(
        question: 'The Lessons Learned phase of incident response exists to:',
        options: [
          'Assign legal blame',
          'Feed improvements back into detection policy and training to prevent recurrence',
          'Create incident reports only',
          'Archive old logs',
        ],
        correctIndex: 1,
        explanation: 'Reviewing incidents afterward closes the gaps that were exploited.',
      ),
      QuizQuestion(
        question: 'Dwell time in SOC metrics refers to:',
        options: [
          'How long analysts work before a break',
          'How long an attacker was present before being detected',
          'Time to onboard a new tool',
          'Average alert queue length',
        ],
        correctIndex: 1,
        explanation: 'Dwell time measures how long an adversary operated undetected — shorter is better.',
      ),
      QuizQuestion(
        question: 'MITRE ATT&CK is best described as:',
        options: [
          'An antivirus product',
          'A knowledge base of attacker tactics and techniques mapped from real-world observations',
          'A type of firewall',
          'A password policy standard',
        ],
        correctIndex: 1,
        explanation: 'ATT&CK provides a common language for describing and detecting attacker behavior.',
      ),
      QuizQuestion(
        question: 'What is a virtual SOC?',
        options: [
          'A SOC inside a video game',
          'A SOC where analysts work remotely with cloud-based tool access',
          'A SOC with no tools',
          'A SOC running on a single server',
        ],
        correctIndex: 1,
        explanation: 'A virtual SOC has no dedicated physical space — analysts work remotely using cloud platforms.',
      ),
      QuizQuestion(
        question: 'SIEM correlation rules help by:',
        options: [
          'Automatically patching vulnerabilities',
          'Connecting weak individual signals across time and source into stronger patterns indicating attacks',
          'Replacing the need for analysts',
          'Encrypting log data',
        ],
        correctIndex: 1,
        explanation: 'Correlation surfaces attack patterns that individual low-fidelity alerts would never reveal.',
      ),
      QuizQuestion(
        question: 'Tier 1 SOC analysts primarily:',
        options: [
          'Hunt for advanced threats',
          'Perform initial triage on incoming alerts and escalate or close them',
          'Write detection rules',
          'Manage the SIEM platform',
        ],
        correctIndex: 1,
        explanation: 'Tier 1 is the first line — triaging the alert queue and making initial disposition decisions.',
      ),
      QuizQuestion(
        question: 'ISACs provide:',
        options: [
          'Incident response outsourcing',
          'Sector-specific threat intelligence sharing communities',
          'Penetration testing services',
          'Government auditing',
        ],
        correctIndex: 1,
        explanation: 'Information Sharing and Analysis Centers share threat intel within specific industry sectors.',
      ),
      QuizQuestion(
        question: 'The Cyber Kill Chain was developed by:',
        options: [
          'MITRE',
          'Lockheed Martin to model the stages of a targeted intrusion',
          'NIST',
          'The NSA',
        ],
        correctIndex: 1,
        explanation: 'Lockheed Martin developed the Kill Chain model to describe adversary intrusion stages.',
      ),
      QuizQuestion(
        question: 'Short-term containment typically involves:',
        options: [
          'Reimaging the affected system',
          'Network-isolating the affected host while preserving forensic evidence',
          'Notifying the press',
          'Resetting all passwords company-wide',
        ],
        correctIndex: 1,
        explanation: 'Network isolation stops spread while preserving evidence needed for investigation.',
      ),
      QuizQuestion(
        question: 'A SOC shift handoff should include:',
        options: [
          'Only verbal summary',
          'Written status of open incidents pending actions and anything unusual from the shift',
          'A list of all employees',
          'Only automated reports',
        ],
        correctIndex: 1,
        explanation: 'Written handoffs ensure no context is lost between analyst shifts.',
      ),
      QuizQuestion(
        question: 'Which SIEM platform uses KQL as its query language?',
        options: [
          'Splunk',
          'QRadar',
          'Microsoft Sentinel',
          'Elastic SIEM',
        ],
        correctIndex: 2,
        explanation: 'Microsoft Sentinel uses Kusto Query Language (KQL) for log analysis.',
      ),
      QuizQuestion(
        question: 'Purple teaming combines:',
        options: [
          'Two red teams competing',
          'Red team offensive and blue team defensive work collaboratively to improve detection',
          'SOC and helpdesk',
          'Compliance and IT teams',
        ],
        correctIndex: 1,
        explanation: 'Purple teaming blends attack and defense for faster improvement of detection coverage.',
      ),
      QuizQuestion(
        question: 'VirusTotal is an example of:',
        options: [
          'A firewall product',
          'An open-source threat intelligence platform for checking files and URLs against many scanners',
          'A SIEM platform',
          'A network monitoring tool',
        ],
        correctIndex: 1,
        explanation: 'VirusTotal is a widely used OSINT platform for checking hashes URLs and domains against security vendor engines.',
      ),
      QuizQuestion(
        question: 'SOAR reduces MTTR by:',
        options: [
          'Hiring more analysts',
          'Automating repetitive response steps like querying threat intel disabling accounts and creating tickets',
          'Blocking all alerts automatically',
          'Replacing the SIEM',
        ],
        correctIndex: 1,
        explanation: 'SOAR automation compresses manual response time significantly.',
      ),
      QuizQuestion(
        question: 'False positive rate per rule is a SOC metric used to measure:',
        options: [
          'How often real attacks are detected',
          'Signal quality — how often a rule fires on benign activity',
          'Analyst productivity',
          'Network throughput',
        ],
        correctIndex: 1,
        explanation: 'High false positive rates indicate rules need tuning to reduce noise.',
      ),
      QuizQuestion(
        question: 'Command and Control (C2) in the Kill Chain refers to:',
        options: [
          'The SOC chain of command',
          'The attacker establishing a remote communication channel with the compromised system',
          'Firewall rule management',
          'Backup and recovery processes',
        ],
        correctIndex: 1,
        explanation: 'C2 is the stage where an attacker maintains remote access and issues commands to the compromised host.',
      ),

    ],
  ),
];
