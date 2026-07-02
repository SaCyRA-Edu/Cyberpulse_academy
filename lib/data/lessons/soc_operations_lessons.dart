import '../lesson_model.dart';

const List<Lesson> socOperationsLessons = [
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
          'MDR is cheaper than MSSP',
          'MDR provides active investigation and containment, not just monitoring and alerting',
          'MDR only works for cloud environments',
          'MSSP uses more advanced tools',
        ],
        correctIndex: 1,
        explanation: 'MDR goes beyond monitoring to actively investigate and contain threats on behalf of the customer.',
      ),
      QuizQuestion(
        question: 'What is the role of a Detection Engineer in a SOC?',
        options: [
          'Physical security of the SOC facility',
          'Writing and maintaining the SIEM rules and logic that generate alerts',
          'Patching endpoint systems',
          'Managing the SOC\'s budget',
        ],
        correctIndex: 1,
        explanation: 'Detection Engineers build and tune the rules that determine what the SIEM surfaces as alerts.',
      ),
      QuizQuestion(
        question: 'In the ATT&CK framework, what does a "Technique" represent?',
        options: [
          'The overall goal the attacker is trying to achieve',
          'A specific method used to accomplish a tactic',
          'A type of malware family',
          'A vulnerability in a specific product',
        ],
        correctIndex: 1,
        explanation: 'In ATT&CK, Tactics are goals (e.g. Persistence) and Techniques are the specific methods used to achieve them.',
      ),
      QuizQuestion(
        question: 'Which Kill Chain stage does a spear-phishing email delivering '
            'a malware attachment represent?',
        options: ['Reconnaissance', 'Weaponization', 'Delivery', 'Exploitation'],
        correctIndex: 2,
        explanation: 'Sending the payload to the victim (via email, USB, web) is the Delivery stage.',
      ),
      QuizQuestion(
        question: 'What does MTTD measure in SOC metrics?',
        options: [
          'How long it takes to resolve an alert completely',
          'How long from initial compromise to detection',
          'How many alerts were resolved in a shift',
          'The time to patch a vulnerability',
        ],
        correctIndex: 1,
        explanation: 'MTTD (Mean Time to Detect) measures the gap between compromise and the moment it was discovered.',
      ),
      QuizQuestion(
        question: 'During the Containment phase of incident response, why '
            'should you NOT immediately reimage the affected machine?',
        options: [
          'Reimaging is too slow',
          'You need to preserve forensic evidence (memory and disk) before cleaning up',
          'Reimaging requires vendor approval',
          'Containment and eradication are the same phase',
        ],
        correctIndex: 1,
        explanation: 'Forensic evidence in memory and on disk is destroyed by reimaging — investigate first, then eradicate.',
      ),
      QuizQuestion(
        question: 'What is a SOAR playbook?',
        options: [
          'A training manual for new SOC analysts',
          'A structured automated workflow defining response steps for a specific alert type',
          'A threat intelligence database',
          'A compliance reporting template',
        ],
        correctIndex: 1,
        explanation: 'A SOAR playbook automates and standardizes the response to a specific alert type.',
      ),
    ],
  ),
];
