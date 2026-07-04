import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> socOperationsLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'A Day in the Life of a Security Analyst',
    difficulty: LessonDifficulty.beginner,
    isAudio: true,
    estimatedMinutes: 6,
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
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Core Trade-off Behind Every SOC Decision',
        body:
            'Every organization eventually faces the same fundamental '
            'question: build security monitoring capability internally, '
            'or buy it from a specialized provider? The answer isn\'t '
            'universal — it depends heavily on budget, the availability '
            'of skilled security talent in the local market, the '
            'organization\'s risk tolerance, and how much institutional '
            'context matters for effective detection in that specific '
            'environment.',
      ),
      LessonSection(
        heading: 'In-House SOC',
        body:
            'An organization builds, staffs, and operates its own '
            'security operations team entirely internally. This offers '
            'maximum control and, over time, deep institutional '
            'knowledge of exactly how the organization\'s systems '
            'normally behave — which makes spotting genuine anomalies '
            'considerably easier. The trade-off is cost: staffing a '
            'security team around the clock, with the specialized '
            'skills modern threats demand, is expensive and can be '
            'genuinely difficult in markets where security talent is '
            'scarce and competitively recruited.',
      ),
      LessonSection(
        heading: 'MSSP: Managed Security Service Provider',
        body:
            'An MSSP takes over security monitoring and alerting on '
            'behalf of a client organization, typically at a '
            'significantly lower cost than building the same capability '
            'internally. The trade-off is that an external provider '
            'inherently has less deep context about a specific '
            'organization\'s unique systems and normal-vs-abnormal '
            'behavior patterns than an in-house team would develop over '
            'time, which can occasionally show up as either missed '
            'subtle anomalies or excessive false-positive alerts.',
      ),
      LessonSection(
        heading: 'MDR: Managed Detection and Response',
        body:
            'MDR extends the MSSP model considerably further — rather '
            'than simply monitoring and alerting, an MDR provider '
            'actively investigates suspicious activity and can take '
            'direct containment action, such as isolating a compromised '
            'host, on the client\'s behalf. This is currently the '
            'fastest-growing delivery model in the industry precisely '
            'because it closes the gap between "we noticed something '
            'suspicious" and "we actually stopped it" without requiring '
            'the client to staff a full internal response capability.',
      ),
      LessonSection(
        heading: 'Hybrid and Virtual SOC Models',
        body:
            'In practice, many organizations blend these models rather '
            'than choosing one exclusively — an in-house team might '
            'handle deeper Tier 2 and Tier 3 investigations while an MDR '
            'provider covers 24/7 Tier 1 triage during off-hours when '
            'staffing an internal night shift isn\'t cost-effective. A '
            'Virtual SOC (vSOC) takes this further still, operating with '
            'no dedicated physical space at all — analysts work remotely '
            'using cloud-based SIEM and collaboration tools, a model '
            'significantly accelerated by both remote work normalization '
            'and the broader shift toward cloud-native security '
            'platforms.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'SOC Roles, Tiers & Career Paths',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Classic Three-Tier Structure',
        body:
            'Most SOCs organize their analyst workforce into three '
            'tiers, each handling progressively more complex work as '
            'alerts get escalated upward.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Tier 1: Triage', 'Tier 2: Investigate', 'Tier 3: Hunt'],
          caption:
              'Alerts flow upward through the tiers as complexity '
              'increases — most are resolved at Tier 1 without ever '
              'needing escalation.',
        ),
      ),
      LessonSection(
        heading: 'Tier 1: The Triage Analyst',
        body:
            'Tier 1 analysts are the first human eyes on every incoming '
            'alert. Their core job is rapid, disciplined triage: '
            'determine quickly whether an alert is a false positive to '
            'close, something to keep monitoring, or something serious '
            'enough to escalate. Because Tier 1 handles by far the '
            'highest volume of alerts, efficient, consistent triage at '
            'this level is what determines whether the entire SOC can '
            'actually keep pace with the alert volume a modern '
            'environment generates.',
      ),
      LessonSection(
        heading: 'Tier 2: The Incident Responder',
        body:
            'Tier 2 analysts take escalated alerts and dig considerably '
            'deeper — determining the true scope and impact of a '
            'potential incident, and leading the actual containment and '
            'remediation effort once something is confirmed as genuine. '
            'This role demands more technical depth than Tier 1: the '
            'ability to read logs across multiple systems, understand '
            'attacker techniques in enough detail to recognize them, and '
            'make judgment calls under real time pressure.',
      ),
      LessonSection(
        heading: 'Tier 3: The Threat Hunter and Senior Analyst',
        body:
            'Tier 3 analysts don\'t wait for alerts to fire — they '
            'proactively search for signs of compromise that automated '
            'detection may have missed entirely, working from hypotheses '
            'about how an attacker might behave rather than from a '
            'pre-built alert. They also typically handle the most '
            'complex, novel incidents, and frequently feed what they '
            'learn back into the detection engineering process, helping '
            'ensure similar threats get caught automatically the next '
            'time.',
      ),
      LessonSection(
        heading: 'Beyond the Three Tiers',
        bullets: [
          'SOC Manager — oversees staffing, service-level agreements, tool procurement, and reporting to organizational leadership',
          'Detection Engineer — writes and continuously tunes the actual SIEM rules and correlation logic that determine what generates an alert in the first place',
          'Threat Intelligence Analyst — tracks specific adversary groups, their tactics, and intelligence directly relevant to the organization\'s risk profile',
          'Forensics Analyst — supports the deepest investigations, ones requiring rigorous, legally defensible evidence preservation',
        ],
      ),
      LessonSection(
        heading: 'A Realistic Career Path',
        body:
            'The typical progression runs Tier 1 through Tier 2 to '
            'Tier 3, or branches out sideways into a specialism like '
            'detection engineering, dedicated threat hunting, digital '
            'forensics, or incident response leadership. Every tier '
            'combines hard technical skills — SIEM query languages, '
            'scripting, log analysis — with soft skills that matter just '
            'as much: clear written communication, calm decision-making '
            'under genuine pressure, and thorough documentation.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'SIEM Platforms & Log Correlation',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'What a SIEM Actually Does',
        body:
            'A Security Information and Event Management (SIEM) '
            'platform ingests, normalizes, and correlates log data '
            'pouring in from across an entire environment — firewalls, '
            'endpoints, cloud services, servers, and identity providers '
            'all simultaneously — then applies detection rules and '
            'increasingly, machine learning, to surface events genuinely '
            'worth a human analyst\'s attention out of an ocean of raw '
            'log data no human could realistically review manually.',
      ),
      LessonSection(
        heading: 'The Major SIEM Platforms',
        bullets: [
          'Microsoft Sentinel — cloud-native, with especially tight integration into Azure and Microsoft 365 environments; uses the KQL query language',
          'Splunk — one of the most widely deployed platforms across the industry, known for its powerful SPL query language and extensive third-party ecosystem',
          'IBM QRadar — commonly favored in enterprise environments with heavy compliance and regulatory reporting requirements',
          'Elastic SIEM (built on OpenSearch) — an increasingly mature open-source option for organizations that prefer to avoid per-GB licensing costs',
          'Chronicle (Google) — built for cloud-scale ingestion with very long-term data retention',
        ],
      ),
      LessonSection(
        heading: 'Why Correlation Is the Real Value',
        body:
            'A single failed login attempt is essentially meaningless '
            'noise on its own. But that same failed login, correlated '
            'with an unusual file download from the same host, followed '
            'minutes later by a new outbound network connection to an '
            'unfamiliar destination — that combination tells a genuinely '
            'different, far more alarming story. This is precisely the '
            'value a SIEM provides that no individual log source ever '
            'could alone: connecting weak signals scattered across time, '
            'source, and system type into a single coherent, actionable '
            'pattern.',
      ),
      LessonSection(
        heading: 'The Practical Challenge of Running a SIEM Well',
        body:
            'Deploying SIEM software is the easy part. The genuinely '
            'hard, ongoing work is tuning detection rules so they '
            'reliably catch real threats without also drowning analysts '
            'in an overwhelming volume of false positives — a poorly '
            'tuned SIEM can actually make a SOC less effective than no '
            'SIEM at all, simply by burying the handful of real alerts '
            'inside thousands of low-value ones every single day.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Intelligence & IOC Analysis',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'What Threat Intelligence Actually Is',
        body:
            'Threat intelligence is analyzed, contextualized information '
            'about adversaries — the tools they use, the techniques they '
            'favor, the infrastructure they operate from, and their '
            'likely objectives — that helps defenders prioritize and '
            'make sense of what would otherwise be an undifferentiated '
            'stream of raw alerts.',
      ),
      LessonSection(
        heading: 'Three Levels of Intelligence',
        bullets: [
          'IOC (Indicator of Compromise) — a concrete, observable artifact suggesting a system may already be compromised: a known-malicious IP address, a specific file hash, a suspicious registry key',
          'TTP (Tactic, Technique, Procedure) — describes how an attacker actually operates, typically mapped to a standard framework like MITRE ATT&CK for consistent communication',
          'Strategic intelligence — the broader picture: which adversary groups exist, what they typically target, and why — informing longer-term security investment decisions rather than day-to-day triage',
        ],
      ),
      LessonSection(
        heading: 'Where Intelligence Actually Comes From',
        bullets: [
          'Open-source intelligence (OSINT) — platforms like VirusTotal, Shodan, MISP, and AlienVault OTX, along with government CERT advisories',
          'Commercial feeds — services like CrowdStrike Intel, Recorded Future, or Mandiant Advantage, offering curated, often faster or more detailed intelligence',
          'ISACs (Information Sharing and Analysis Centers) — sector-specific communities where organizations in the same industry share threat information directly with each other',
          'Internal intelligence — an organization\'s own historical incidents, often the single most valuable and immediately relevant source available, since it directly reflects what has actually targeted that specific organization before',
        ],
      ),
      LessonSection(
        heading: 'The Limits of IOCs Alone',
        body:
            'IOCs are genuinely useful but inherently short-lived — an '
            'attacker can trivially change a malicious IP address or '
            'regenerate a file with a different hash the moment their '
            'current infrastructure gets flagged and blocked. TTPs, by '
            'contrast, tend to change far more slowly, since they '
            'reflect an attacker\'s underlying tools, tradecraft, and '
            'operational habits rather than easily-swapped surface '
            'details. This is exactly why mature SOCs increasingly '
            'prioritize detecting behavior and technique over chasing an '
            'endless, constantly-shifting list of specific known-bad '
            'indicators.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Alert Triage & False Positive Management',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'The Alert Fatigue Problem Is Real and Dangerous',
        body:
            'A genuinely busy SOC can easily process thousands of alerts '
            'every single day, and the overwhelming majority of them '
            'turn out to be false positives on closer inspection. '
            'Analysts who become numb to a constant flood of low-quality '
            'alerts inevitably start missing the real ones buried among '
            'them — alert fatigue isn\'t a minor annoyance, it\'s a '
            'genuine, well-documented security risk in its own right.',
      ),
      LessonSection(
        heading: 'A Practical Triage Process',
        body:
            'Effective Tier 1 triage generally follows a consistent, '
            'repeatable sequence rather than an ad-hoc gut check on each '
            'alert.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Contextualize', 'Enrich', 'Assess', 'Decide'],
          caption:
              'Consistent triage steps, applied to every alert, are what '
              'let a SOC scale to thousands of alerts a day without '
              'losing the real ones.',
        ),
      ),
      LessonSection(
        heading: 'Contextualize and Enrich',
        body:
            'Before making any judgment, an analyst gathers the basic '
            'facts: what exactly triggered this alert, on which specific '
            'asset, from what source, and at what time? Enrichment then '
            'pulls in additional context automatically — checking the '
            'involved IP addresses and file hashes against threat '
            'intelligence feeds, reviewing what that specific asset\'s '
            'normal, baseline activity typically looks like.',
      ),
      LessonSection(
        heading: 'Assess and Decide',
        body:
            'With full context in hand, the analyst weighs both '
            'likelihood and worst-case impact: how probable is it that '
            'this alert reflects genuinely malicious activity, and how '
            'severe would the consequences realistically be if it is? '
            'That assessment leads directly to one of three dispositions '
            '— close the alert as a confirmed false positive, continue '
            'monitoring for further related signals, or escalate '
            'immediately to open a full incident.',
      ),
      LessonSection(
        heading: 'Reducing False Positives Over Time',
        bullets: [
          'Continuously tune detection rules based on patterns observed in prior false positives',
          'Build explicit allowlists for well-understood, legitimate behavior — specific admin accounts, scheduled maintenance windows',
          'Apply risk scoring so only genuinely high-confidence, high-severity alerts demand immediate analyst attention',
          'Track the false-positive rate for every individual detection rule — any rule consistently exceeding an acceptable threshold needs to be rewritten or retired entirely, not just tolerated indefinitely',
        ],
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'The Incident Response Lifecycle',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Six Phases, Repeated Every Time',
        body:
            'Nearly every formal incident response process, regardless '
            'of the specific organization or framework it follows, '
            'moves through the same six broad phases.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Prepare', 'Identify', 'Contain', 'Eradicate', 'Recover', 'Learn'],
          caption:
              'The incident response lifecycle. Skipping the final '
              '"Learn" phase is one of the most common and costly '
              'mistakes organizations make.',
        ),
      ),
      LessonSection(
        heading: 'Preparation',
        body:
            'Everything that happens before an incident is even detected '
            '— building playbooks for common scenarios, training the '
            'team, and establishing communication plans — falls under '
            'preparation. An organization that only starts thinking '
            'about incident response once an actual incident is already '
            'underway is starting from a severe, entirely avoidable '
            'disadvantage.',
      ),
      LessonSection(
        heading: 'Identification and Containment',
        body:
            'Identification is the process of confirming that what '
            'looked like an anomaly is genuinely a security incident, '
            'rather than a false alarm or an unrelated technical glitch. '
            'Once confirmed, containment focuses on stopping the spread '
            'without yet fully removing the threat — a common and '
            'important containment technique is isolating an affected '
            'host from the rest of the network while preserving its '
            'current state for forensic analysis, rather than '
            'immediately wiping or reimaging it.',
      ),
      LessonSection(
        heading: 'Eradication and Recovery',
        body:
            'Eradication removes the actual threat from the environment '
            '— malware, backdoor accounts the attacker planted, or any '
            'other persistence mechanism they established. Recovery then '
            'restores affected systems to normal operation, but only '
            'after careful validation that the underlying issue has '
            'genuinely been resolved, since bringing systems back online '
            'prematurely, before eradication is truly complete, risks '
            'simply reintroducing the same compromise all over again.',
      ),
      LessonSection(
        heading: 'Lessons Learned: The Phase Too Often Skipped',
        body:
            'Once systems are back up and running, there\'s a strong '
            'organizational temptation to consider the incident closed '
            'and move on immediately. This is precisely the mistake the '
            'final "Lessons Learned" phase exists to prevent. A '
            'structured post-incident review — what actually happened, '
            'what worked well during the response, what specific gaps '
            'allowed it to succeed in the first place — feeds directly '
            'back into improved detection rules, updated policies, and '
            'targeted training. Skipping this step means the exact same '
            'gap that enabled this incident remains wide open for the '
            'next attacker to walk straight through.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'MITRE ATT&CK Framework',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'A Knowledge Base Built From Real Observation',
        body:
            'MITRE ATT&CK (Adversarial Tactics, Techniques, and Common '
            'Knowledge) is a publicly maintained, continuously updated '
            'knowledge base cataloging attacker behavior — not '
            'theoretically, but built directly from documented '
            'real-world observations of actual threat actor campaigns. '
            'It organizes this knowledge by tactic, the goal an attacker '
            'is pursuing, and technique, the specific method used to '
            'achieve that goal.',
      ),
      LessonSection(
        heading: 'The Enterprise Matrix Tactics',
        bullets: [
          'Reconnaissance, Resource Development, and Initial Access — gathering information, preparing tools, and gaining the first foothold',
          'Execution, Persistence, and Privilege Escalation — running malicious code, maintaining access across reboots, and gaining higher-level permissions',
          'Defense Evasion, Credential Access, and Discovery — avoiding detection, stealing credentials, and mapping out the environment',
          'Lateral Movement, Collection, and Command and Control — spreading to other systems, gathering data of interest, and maintaining remote control',
          'Exfiltration and Impact — stealing data out of the environment, and achieving the attacker\'s final destructive or disruptive objective',
        ],
      ),
      LessonSection(
        heading: 'How SOCs Actually Use ATT&CK Day to Day',
        bullets: [
          'Alert mapping — tagging every detection rule with the specific ATT&CK technique it\'s designed to catch, creating a clear, shared reference point',
          'Coverage gap analysis — systematically identifying which techniques currently have no corresponding detection at all, revealing exactly where to invest next',
          'Investigation pivoting — using known technique relationships to anticipate what an attacker is likely to attempt next, rather than reacting purely one alert at a time',
          'Executive reporting — communicating findings to leadership using a consistent, industry-recognized vocabulary rather than ad-hoc, inconsistent internal terminology',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'The Cyber Kill Chain',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 7,
    sections: [
      LessonSection(
        heading: 'A Model From Outside the Security Industry',
        body:
            'Developed by Lockheed Martin and borrowing its name and '
            'core structure from military targeting doctrine, the Cyber '
            'Kill Chain describes a targeted intrusion as seven '
            'sequential stages. The central, genuinely useful insight: '
            'an attacker must successfully complete every single stage '
            'to achieve their ultimate objective — which means a '
            'defender who successfully disrupts the attack at any one '
            'stage stops the entire chain, without needing to defend '
            'perfectly against every stage simultaneously.',
      ),
      LessonSection(
        heading: 'The Seven Stages',
        bullets: [
          'Reconnaissance — gathering information about the intended target',
          'Weaponization — building or preparing the actual exploit and payload',
          'Delivery — getting that payload to the victim, commonly through phishing, a USB drive, or a web-based exploit',
          'Exploitation — successfully triggering the exploit on the victim\'s system',
          'Installation — establishing lasting persistence through malware or a planted backdoor',
          'Command & Control (C2) — establishing a remote communication channel back to the attacker',
          'Actions on Objectives — achieving the goal, whether that\'s data theft, destruction, or further lateral movement',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.killChain,
          caption:
              'The seven stages of the Cyber Kill Chain — disrupting any '
              'single stage can stop the entire attack.',
        ),
      ),
      LessonSection(
        heading: 'Limitations',
        body:
            'The Kill Chain was designed with external, network-based '
            'intrusions specifically in mind, and it doesn\'t model '
            'insider threats or several common cloud-native attack '
            'patterns particularly well. MITRE ATT&CK offers '
            'considerably more granular and continuously updated '
            'technique coverage for those scenarios. In real-world '
            'practice, most SOCs use both models side by side, drawing '
            'on whichever framework best fits the specific situation '
            'they\'re analyzing.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'SOAR: Security Orchestration, Automation & Response',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Automating the Repetitive Parts of Response',
        body:
            'SOAR platforms automate the well-defined, repetitive '
            'response actions that analysts would otherwise perform '
            'manually for essentially every single alert: querying '
            'threat intelligence databases for context, disabling a '
            'compromised user account, isolating an affected host from '
            'the network, sending notifications to relevant '
            'stakeholders, and opening a formal ticket to track the '
            'investigation. This automation compresses Mean Time to '
            'Respond (MTTR) significantly, since a machine can execute '
            'these predictable, well-defined steps in seconds rather '
            'than the minutes an analyst would need to do the same work '
            'manually.',
      ),
      LessonSection(
        heading: 'Playbooks: Codified, Consistent Response Logic',
        body:
            'A SOAR playbook is a structured, pre-built workflow '
            'defining exactly what should happen when a specific type of '
            'alert fires — combining fully automated steps, deliberate '
            'human decision points, and defined escalation conditions '
            'into a single consistent process. Well-designed playbooks '
            'make Tier 1 triage both meaningfully faster and far more '
            'consistent across different analysts and different shifts, '
            'reducing the variability that comes from each analyst '
            'handling the same alert type slightly differently based on '
            'personal habit or experience level.',
      ),
      LessonSection(
        heading: 'How SOAR and SIEM Actually Complement Each Other',
        body:
            'A SIEM\'s job is detection — collecting and correlating log '
            'data to generate alerts in the first place. A SOAR '
            'platform\'s job is response — acting on those alerts once '
            'they\'ve already been generated. The two are naturally '
            'complementary rather than competing technologies, and most '
            'modern security operations deployments run both together, '
            'frequently integrated so tightly that a single SIEM alert '
            'can directly and automatically trigger the appropriate '
            'SOAR playbook without any manual handoff step in between. '
            'Some newer platforms, like Microsoft Sentinel, combine both '
            'capabilities natively within one unified product.',
      ),
    ],
  ),

  // 11 --------------------------------------------------------------------
  Lesson(
    title: 'SOC Metrics, Documentation & Shift Handoffs',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Metrics That Actually Matter',
        bullets: [
          'MTTD (Mean Time to Detect) — how long elapses between the initial compromise and the moment it\'s actually detected',
          'MTTR (Mean Time to Respond) — how long elapses between detection and the incident being fully contained',
          'MTTC (Mean Time to Contain) — how long specifically from detection to the affected system being isolated',
          'False positive rate per detection rule — a direct, quantifiable measure of signal quality for every individual rule',
          'Dwell time — the total duration an attacker was actually present in the environment before being detected at all; consistently one of the most telling indicators of overall SOC effectiveness',
        ],
      ),
      LessonSection(
        heading: 'Why Shift Handoffs Are a High-Risk Moment',
        body:
            'Because SOCs typically operate around the clock, shift '
            'handoffs represent a genuinely high-risk point where '
            'important context can easily get lost between one analyst '
            'and the next. A thorough handoff should always include the '
            'status of every open incident, the specific decisions made '
            'during the shift and the reasoning behind them, any actions '
            'still pending, and anything unusual observed even if it '
            'wasn\'t formally escalated — communicated in writing, not '
            'purely through a brief verbal summary that\'s easy to forget '
            'or garble under time pressure.',
      ),
      LessonSection(
        heading: 'Documentation as Institutional Memory',
        body:
            'Every single alert disposition should be documented '
            'clearly: what the alert actually was, what evidence was '
            'reviewed to reach a conclusion, what was ultimately '
            'decided, and specifically why. This consistent discipline '
            'accomplishes several things simultaneously — it builds '
            'genuine institutional memory that survives staff turnover, '
            'it directly supports compliance audits when they inevitably '
            'come, and it ensures the next analyst on shift can pick up '
            'exactly where the previous one left off without having to '
            'reconstruct context from scratch.',
      ),
    ],
  ),

  // 12 --------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
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
        question: 'Which Kill Chain stage does a spear-phishing email delivering a malware attachment represent?',
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
        question: 'During the Containment phase of incident response, why should you NOT immediately reimage the affected machine?',
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
          'Known-malicious IPs, file hashes, domains, and registry keys',
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
          'Feed improvements back into detection, policy, and training to prevent recurrence',
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
        options: ['MITRE', 'Lockheed Martin to model the stages of a targeted intrusion', 'NIST', 'The NSA'],
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
          'Written status of open incidents, pending actions, and anything unusual from the shift',
          'A list of all employees',
          'Only automated reports',
        ],
        correctIndex: 1,
        explanation: 'Written handoffs ensure no context is lost between analyst shifts.',
      ),
      QuizQuestion(
        question: 'Which SIEM platform uses KQL as its query language?',
        options: ['Splunk', 'QRadar', 'Microsoft Sentinel', 'Elastic SIEM'],
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
        explanation: 'VirusTotal is a widely used OSINT platform for checking hashes, URLs, and domains against security vendor engines.',
      ),
      QuizQuestion(
        question: 'SOAR reduces MTTR by:',
        options: [
          'Hiring more analysts',
          'Automating repetitive response steps like querying threat intel, disabling accounts, and creating tickets',
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
