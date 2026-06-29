import '../lesson_model.dart';

const List<Lesson> socOperationsLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'What is a SOC?',
    sections: [
      LessonSection(
        heading: 'Security Operations Center',
        body:
            'A SOC is the team (and the physical or virtual space) '
            'responsible for continuously monitoring an organization\'s '
            'systems, detecting potential security incidents, and '
            'coordinating the response — often around the clock.',
      ),
      LessonSection(
        heading: 'Core SOC Functions',
        bullets: [
          'Continuous monitoring of networks, endpoints, and applications',
          'Detecting and triaging security alerts',
          'Investigating suspicious activity',
          'Coordinating incident response',
          'Threat hunting — proactively looking for threats that automated tools missed',
        ],
      ),
      LessonSection(
        heading: 'In-House vs. Outsourced',
        body:
            'Some organizations run their own SOC; many others use a '
            'Managed Security Service Provider (MSSP) or a Managed '
            'Detection and Response (MDR) vendor to provide this function '
            'instead, especially smaller organizations without the budget '
            'for a 24/7 in-house team.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'SOC Roles & Tiers',
    sections: [
      LessonSection(
        heading: 'Tier 1 — Triage Analyst',
        body:
            'Monitors incoming alerts, performs initial investigation, '
            'and decides whether an alert is a false positive or needs to '
            'be escalated.',
      ),
      LessonSection(
        heading: 'Tier 2 — Incident Responder',
        body:
            'Takes escalated alerts, performs deeper investigation, '
            'determines scope and impact, and leads containment and '
            'remediation efforts.',
      ),
      LessonSection(
        heading: 'Tier 3 — Threat Hunter / Senior Analyst',
        body:
            'Proactively searches for hidden threats, analyzes complex or '
            'novel attacks, and often helps tune detection rules so '
            'similar threats are caught automatically in the future.',
      ),
      LessonSection(
        heading: 'Other Common Roles',
        bullets: [
          'SOC Manager — oversees operations, staffing, and reporting',
          'Threat Intelligence Analyst — tracks emerging threats relevant to the organization',
          'Detection Engineer — builds and tunes the rules that generate alerts',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'SIEM & Monitoring Tools',
    sections: [
      LessonSection(
        heading: 'What is a SIEM?',
        body:
            'A Security Information and Event Management (SIEM) platform '
            'collects logs from across an organization — firewalls, '
            'servers, endpoints, cloud services — and correlates them to '
            'surface potential security events.',
      ),
      LessonSection(
        heading: 'Why Correlation Matters',
        body:
            'A single failed login means little on its own. But a SIEM '
            'can connect that failed login with an unusual file download '
            'and a new outbound connection minutes later — surfacing a '
            'pattern no single log entry would reveal alone.',
      ),
      LessonSection(
        heading: 'Related Tools',
        bullets: [
          'SOAR (Security Orchestration, Automation and Response) — automates routine response steps',
          'EDR/XDR — endpoint (and extended) detection and response tools feeding data into the SOC',
          'Threat intelligence feeds — external data on known malicious indicators',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Alert Triage',
    sections: [
      LessonSection(
        heading: 'The Alert Fatigue Problem',
        body:
            'A busy SOC may receive thousands of alerts a day, and most '
            'turn out to be false positives. Effective triage is what '
            'separates a functional SOC from one that\'s drowning in noise.',
      ),
      LessonSection(
        heading: 'A Typical Triage Process',
        bullets: [
          'Gather context — what triggered the alert, and what else was happening at that time?',
          'Assess severity — what\'s the potential impact if this is real?',
          'Check for known indicators — does this match known malicious activity?',
          'Decide — close as a false positive, monitor, or escalate',
        ],
      ),
      LessonSection(
        heading: 'Indicators of Compromise (IOCs)',
        body:
            'IOCs are observable signs that a system may be compromised — '
            'things like a known-malicious IP address, an unusual file '
            'hash, or a suspicious registry change. Analysts compare '
            'activity against IOC lists to speed up triage.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'The Incident Response Lifecycle',
    sections: [
      LessonSection(
        heading: 'A Common Framework',
        body:
            'Most incident response processes follow a similar lifecycle, '
            'often summarized in six phases:',
        bullets: [
          'Preparation — having tools, playbooks, and trained people ready before anything happens',
          'Identification — detecting that an incident may be occurring',
          'Containment — limiting the spread or impact',
          'Eradication — removing the threat from the environment',
          'Recovery — restoring systems to normal operation safely',
          'Lessons Learned — reviewing what happened to improve next time',
        ],
      ),
      LessonSection(
        heading: 'Why "Lessons Learned" Matters',
        body:
            'Skipping this final step is a common mistake. The whole point '
            'of reviewing an incident afterward is to feed what was '
            'learned back into detection rules, policies, and training so '
            'the same gap isn\'t exploited twice.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Frameworks: Kill Chain & MITRE ATT&CK',
    sections: [
      LessonSection(
        heading: 'The Cyber Kill Chain',
        body:
            'A model describing the typical stages of an attack, from '
            'early reconnaissance through to the attacker\'s final '
            'objective. The idea is that breaking the chain at any stage '
            'can stop the attack before it succeeds.',
        bullets: [
          'Reconnaissance', 'Weaponization', 'Delivery', 'Exploitation',
          'Installation', 'Command & Control', 'Actions on Objectives',
        ],
      ),
      LessonSection(
        heading: 'MITRE ATT&CK',
        body:
            'A widely used knowledge base that catalogs known attacker '
            'tactics and techniques, organized by the goal they achieve '
            '(like "Persistence" or "Lateral Movement"). SOC teams use it '
            'as a common language for describing and detecting attacker '
            'behavior, rather than just a list of specific tools.',
      ),
      LessonSection(
        heading: 'Why These Frameworks Are Useful',
        body:
            'They give analysts a shared vocabulary and a structured way '
            'to map what they\'re observing back to known attacker '
            'behavior — which speeds up investigation and helps identify '
            'detection gaps.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Life in the SOC',
    sections: [
      LessonSection(
        heading: 'Shift Work',
        body:
            'Because threats don\'t keep business hours, many SOCs operate '
            'in shifts to provide 24/7 coverage — a notable difference '
            'from a typical 9-to-5 IT role.',
      ),
      LessonSection(
        heading: 'Documentation Matters',
        body:
            'Clear, consistent documentation — of investigations, '
            'decisions, and handoffs between shifts — keeps the team '
            'aligned and makes sure context isn\'t lost between analysts.',
      ),
      LessonSection(
        heading: 'Soft Skills That Matter',
        bullets: [
          'Clear written communication for incident reports',
          'Calm decision-making under time pressure',
          'Curiosity — willingness to dig past the obvious explanation',
          'Collaboration across IT, legal, and leadership during real incidents',
        ],
      ),
    ],
  ),

  // 8 ------------------------------------------------------------------ Quiz
  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'What is the primary purpose of a Security Operations '
            'Center (SOC)?',
        options: [
          'Writing company marketing material',
          'Continuously monitoring systems and coordinating response to security incidents',
          'Managing employee payroll',
          'Designing new software features',
        ],
        correctIndex: 1,
        explanation:
            'A SOC\'s core role is ongoing monitoring, detection, and '
            'coordinated response to security incidents.',
      ),
      QuizQuestion(
        question: 'Which SOC tier typically performs the first review of '
            'an incoming alert?',
        options: ['Tier 1', 'Tier 2', 'Tier 3', 'SOC Manager'],
        correctIndex: 0,
        explanation:
            'Tier 1 analysts perform initial triage on incoming alerts.',
      ),
      QuizQuestion(
        question: 'What does a SIEM mainly help a SOC do?',
        options: [
          'Write security policies',
          'Collect and correlate logs from across the organization to surface potential incidents',
          'Encrypt company laptops',
          'Manage employee onboarding',
        ],
        correctIndex: 1,
        explanation:
            'A SIEM aggregates and correlates log data to help reveal '
            'patterns that single events wouldn\'t show.',
      ),
      QuizQuestion(
        question: 'What is an "Indicator of Compromise" (IOC)?',
        options: [
          'A formal security policy document',
          'An observable sign that a system may be compromised, such as a known-malicious IP',
          'A type of firewall rule',
          'A performance metric for SOC analysts',
        ],
        correctIndex: 1,
        explanation:
            'IOCs are observable artifacts — like malicious IPs or file '
            'hashes — that suggest a system may be compromised.',
      ),
      QuizQuestion(
        question: 'In the incident response lifecycle, what comes '
            'immediately after "Containment"?',
        options: ['Identification', 'Eradication', 'Preparation', 'Recovery'],
        correctIndex: 1,
        explanation:
            'After containing an incident, the next phase is eradication '
            '— removing the threat from the environment.',
      ),
      QuizQuestion(
        question: 'Why do many incident response processes include a '
            '"Lessons Learned" phase?',
        options: [
          'It is legally required everywhere',
          'To feed what was learned back into detection, policy, and training so gaps aren\'t exploited again',
          'To assign blame to specific employees',
          'It is optional and rarely useful',
        ],
        correctIndex: 1,
        explanation:
            'Reviewing incidents afterward helps improve defenses and '
            'close the gaps that were exploited.',
      ),
      QuizQuestion(
        question: 'What is MITRE ATT&CK best described as?',
        options: [
          'An antivirus product',
          'A knowledge base cataloging known attacker tactics and techniques',
          'A type of firewall',
          'A password policy standard',
        ],
        correctIndex: 1,
        explanation:
            'MITRE ATT&CK is a widely used framework cataloging attacker '
            'tactics and techniques.',
      ),
      QuizQuestion(
        question: 'Why do many SOCs operate in shifts rather than '
            'standard business hours?',
        options: [
          'It is cheaper to staff that way',
          'Threats can occur at any time, so coverage needs to be continuous',
          'It is required by most software licenses',
          'Analysts prefer working at night',
        ],
        correctIndex: 1,
        explanation:
            'Because attacks aren\'t limited to business hours, many SOCs '
            'need round-the-clock coverage.',
      ),
    ],
  ),
];
