import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> alertsMonitoringLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Alerting and Monitoring',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Why Security Monitoring Exists at All',
        body:
            'A SOC, covered in depth in the SOC Operations module, can '
            'only investigate and respond to what it actually detects. '
            'Alerting and monitoring is the foundational layer '
            'underneath every SOC function — collecting data from '
            'across an environment, analyzing it, and surfacing exactly '
            'the events that genuinely deserve human attention, out of '
            'an overwhelming volume of activity no human could review '
            'manually.',
      ),
      LessonSection(
        heading: 'Maximizing True Positives, Minimizing False Positives',
        body:
            'A true positive is an alert that correctly identifies '
            'genuine malicious or risky activity. A false positive is an '
            'alert that fires on entirely benign activity. As covered in '
            'the SOC Operations module\'s Alert Triage lesson, an '
            'overwhelming volume of false positives causes alert '
            'fatigue, where analysts become desensitized and start '
            'missing the true positives buried among the noise. The '
            'entire discipline of monitoring and alerting is, at its '
            'core, a continuous effort to tune detection so the ratio of '
            'true to false positives keeps improving over time, rather '
            'than treating detection rules as a one-time setup.',
      ),
      LessonSection(
        heading: 'The Core Technologies Involved',
        bullets: [
          'SNMP (Simple Network Management Protocol) — monitors and manages network devices; covered in full depth in the next lesson',
          'SIEM (Security Information and Event Management) — centralizes and correlates logs from across an entire environment; covered in full depth two lessons ahead',
          'SCAP (Security Content Automation Protocol) — a standardized framework for automating vulnerability management and compliance checking, letting security tools from different vendors share vulnerability and configuration data using a common format',
          'Log aggregation — collecting logs from many different, disparate sources into one centralized location for analysis',
          'Network traffic flows — metadata about network traffic patterns, covered in depth via NetFlow later in this module',
          'SPOG (Single Pane of Glass) — a unified interface bringing together logs, alerts, and reports from multiple tools into one consistent view; covered in the final lesson of this module',
        ],
      ),
      LessonSection(
        heading: 'The Alerting and Monitoring Workflow',
        body:
            'Regardless of which specific tools are involved, effective '
            'monitoring follows a consistent, repeatable sequence.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Collect', 'Aggregate', 'Correlate', 'Alert', 'Investigate', 'Remediate'],
          caption:
              'This cycle runs continuously — remediation of one issue '
              'often reveals or triggers monitoring for the next.',
        ),
      ),
      LessonSection(
        heading: 'Proactive Threat Detection vs. Reactive Response',
        body:
            'The ultimate goal of investing in strong alerting and '
            'monitoring is shifting an organization\'s posture from '
            'purely reactive — discovering a breach only after '
            'significant damage has already occurred — toward genuinely '
            'proactive detection, catching suspicious activity early '
            'enough in the attack lifecycle that containment happens '
            'before serious harm occurs. Every technology in this module '
            'exists in service of that single strategic goal.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Monitoring Resources & SNMP',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Establishing Baselines',
        body:
            'Effective monitoring depends on first understanding what '
            '"normal" actually looks like for a given system — typical '
            'CPU usage, typical network traffic volume, typical login '
            'patterns. A baseline is this documented normal state, '
            'against which future monitoring data is continuously '
            'compared to detect meaningful deviations worth '
            'investigating.',
      ),
      LessonSection(
        heading: 'What to Monitor',
        bullets: [
          'Systems — CPU, memory, disk, and overall availability',
          'Applications — response time, error rates, and transaction throughput',
          'Infrastructure — network device health, link utilization, and environmental factors like temperature in a data center',
        ],
      ),
      LessonSection(
        heading: 'Leading Monitoring Tools Today',
        bullets: [
          'Splunk — one of the most widely deployed platforms for log analysis and monitoring at enterprise scale, covered further in the SIEM context later in this module',
          'Datadog — a popular cloud-native monitoring platform combining infrastructure, application, and log monitoring in one integrated product',
          'Prometheus with Grafana — a widely used open-source combination, particularly popular for monitoring modern containerized and cloud-native environments',
          'Nagios / Zabbix — long-standing, mature open-source infrastructure monitoring platforms with strong SNMP support',
          'Microsoft Sentinel / Azure Monitor — deeply integrated monitoring for organizations heavily invested in the Microsoft ecosystem',
        ],
      ),
      LessonSection(
        heading: 'How Monitoring Improves Overall System Health',
        bullets: [
          'Log aggregation — centralizing logs so patterns invisible in any single system become visible across the whole environment',
          'Alerting — surfacing meaningful deviations from baseline immediately, rather than discovering a problem only when a user complains',
          'Scanning — proactively probing for vulnerabilities and misconfigurations before they\'re exploited',
          'Reporting — summarizing trends and incidents for both technical teams and leadership',
          'Archiving — retaining historical monitoring data for compliance, trend analysis, and later forensic investigation',
          'Remediation — actually fixing whatever the monitoring identified as a problem',
          'Validation — confirming, after remediation, that the fix genuinely resolved the issue rather than simply assuming it did',
        ],
      ),
      LessonSection(
        heading: 'Why Validation Specifically Matters',
        body:
            'It\'s tempting to consider an issue closed the moment a fix '
            'is applied, but validation — actually re-checking that the '
            'monitored metric or vulnerability is genuinely resolved — '
            'catches the surprisingly common cases where a fix was '
            'incomplete, applied to the wrong system, or introduced a '
            'new problem while solving the original one.',
      ),
      LessonSection(
        heading: 'SNMP: Manager, Agents, and MIBs',
        body:
            'SNMP is the standard protocol for monitoring and managing '
            'network devices — routers, switches, printers, and more. '
            'An SNMP manager is the central monitoring system; SNMP '
            'agents run on each individual managed device, reporting '
            'data back to the manager. Each agent maintains a MIB '
            '(Management Information Base) — a structured, '
            'standardized database describing every piece of '
            'information that specific device can report or accept, '
            'with each individual data point identified by a unique OID '
            '(Object Identifier).',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['SNMP Manager', 'GET/SET Request', 'Agent Queries MIB', 'Response or Trap'],
          caption:
              'The manager can actively poll an agent (GET) or push a '
              'configuration change (SET); the agent can also proactively '
              'notify the manager of an event (a trap) without waiting '
              'to be asked.',
        ),
      ),
      LessonSection(
        heading: 'GET, SET, and Traps',
        bullets: [
          'GET — the manager requests the current value of a specific OID from an agent',
          'SET — the manager pushes a new configuration value to an agent',
          'Trap — the agent proactively notifies the manager of a significant event (an interface going down, a threshold being exceeded) without the manager needing to ask',
          'Granular traps — detailed, specific notifications covering individual, precise events',
          'Verbose traps — broader notifications covering categories of events, trading precision for a simpler, lower-volume trap configuration',
        ],
      ),
      LessonSection(
        heading: 'SNMP Versions and Security',
        bullets: [
          'SNMPv1 — the original version; transmits everything, including the "community string" that functions as a password, in plaintext, and should never be used today',
          'SNMPv2c — added minor functional improvements over v1 but retained the same fundamentally insecure plaintext community string model',
          'SNMPv3 — added genuine security: authentication and encryption of SNMP traffic itself, closing the plaintext credential exposure that made v1 and v2c unsafe on any network that isn\'t fully isolated and trusted',
        ],
      ),
      LessonSection(
        heading: 'When to Use SNMP vs. a Dedicated Monitoring Agent',
        body:
            'SNMP is the natural fit for network infrastructure devices '
            '— routers, switches, firewalls — that support it natively '
            'and don\'t run a full general-purpose operating system '
            'capable of hosting a dedicated software agent. A dedicated '
            'monitoring agent, by contrast, is the better fit for '
            'servers, endpoints, and applications, where a fuller '
            'software agent can capture much richer, more detailed '
            'telemetry — application-level performance metrics, '
            'detailed process activity — than SNMP\'s more limited data '
            'model was ever designed to express.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Information and Event Management (SIEM)',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What a SIEM Actually Does',
        body:
            'A SIEM centralizes log data from across an entire '
            'environment, normalizes it into a consistent format despite '
            'wildly different source systems, and applies correlation '
            'rules and increasingly machine learning to detect threats '
            'in real time — surfacing genuinely actionable alerts and '
            'directly supporting incident response with the historical '
            'context an investigation needs.',
      ),
      LessonSection(
        heading: 'How Log Sources Actually Connect to a SIEM',
        body:
            'A modern SIEM ingests data from a genuinely wide mix of '
            'both on-premises infrastructure and cloud/SaaS platforms '
            'simultaneously.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.siemSources),
      ),
      LessonSection(
        heading: 'Agent-Based vs. Agentless Collection',
        bullets: [
          'Agent-based collection — a small software agent installed directly on a source system actively forwards logs to the SIEM; offers richer data and finer control, at the cost of needing to deploy and maintain the agent everywhere',
          'Agentless collection — the SIEM instead pulls data via an API, syslog forwarding, or a cloud provider\'s native export mechanism, with nothing installed directly on the source system; simpler to deploy at scale, especially across SaaS platforms where installing an agent isn\'t even an option',
        ],
      ),
      LessonSection(
        heading: 'Why Correlation Is the SIEM\'s Real Value',
        body:
            'As covered in the SOC Operations module, a single failed '
            'login means almost nothing on its own. That same failed '
            'login correlated with an unusual file download from the '
            'same host, followed by a new outbound connection to an '
            'unfamiliar destination, tells a genuinely different story. '
            'A SIEM\'s correlation engine is precisely what connects '
            'these individually weak signals — often originating from '
            'completely different source systems — into one coherent, '
            'actionable pattern no single log source could ever reveal '
            'alone.',
      ),
      LessonSection(
        heading: 'Supporting Incident Response',
        body:
            'Beyond real-time detection, a SIEM\'s retained historical '
            'log data is invaluable during an active investigation — '
            'letting a responder quickly answer "has this indicator '
            'appeared anywhere else in our environment, and when did '
            'this activity actually first begin?" without needing to '
            'manually query dozens of separate systems one at a time.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'NetFlow and Flow Analysis',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Metadata Instead of Full Packet Captures',
        body:
            'Capturing every full packet crossing a busy network link is '
            'extraordinarily expensive in both storage and processing — '
            'at real enterprise traffic volumes, full packet capture at '
            'scale quickly becomes impractical to sustain continuously. '
            'NetFlow, and similar flow-based protocols, instead capture '
            'traffic metadata — source and destination IP, ports, '
            'protocol, byte and packet counts, and timing — without '
            'storing the actual packet contents (payload) at all.',
      ),
      LessonSection(
        heading: 'What a "Flow" Actually Represents',
        body:
            'A flow is a defined sequence of packets sharing the same '
            'source and destination IP, source and destination port, '
            'and protocol — effectively representing one logical '
            'conversation between two endpoints, summarized as a single '
            'compact record rather than every individual packet within '
            'it.',
      ),
      LessonSection(
        heading: 'Flow Collectors and Sampling',
        body:
            'A flow collector is the system that receives flow records '
            'exported by routers and switches across a network, '
            'aggregating them centrally for analysis. On very high-'
            'volume links, examining every single packet even just for '
            'flow metadata generation can still be resource-intensive, '
            'so many implementations use sampling — analyzing only a '
            'statistically representative subset of packets (say, 1 in '
            'every 100) rather than every single one, extrapolating the '
            'full traffic picture from that sample while dramatically '
            'reducing processing overhead.',
      ),
      LessonSection(
        heading: 'Why Flow Data Is Still Genuinely Useful for Security',
        body:
            'Even without the actual packet contents, flow metadata '
            'reveals an enormous amount: which systems are talking to '
            'which other systems, how much data is moving, and when — '
            'directly useful for spotting a compromised host suddenly '
            'communicating with an unfamiliar external destination, '
            'detecting a large, unusual volume of outbound traffic '
            'suggestive of data exfiltration, or identifying botnet '
            'C2 communication patterns, all without needing to inspect '
            'a single byte of actual payload content.',
      ),
      LessonSection(
        heading: 'Flow Visualization Tools',
        bullets: [
          'Zeek (formerly Bro) — a powerful open-source network analysis framework that goes beyond basic flow records, generating detailed connection logs and protocol-specific analysis useful for both flow-level visibility and deeper security investigation',
          'MRTG (Multi Router Traffic Grapher) — a long-standing, simple, widely used tool for graphing bandwidth utilization trends over time, commonly paired directly with SNMP data',
          'Splunk — beyond its general log analysis and SIEM capabilities covered earlier in this module, Splunk can ingest and visualize flow data alongside other log sources, correlating network-level patterns with the same events surfaced from endpoints and applications',
        ],
      ),
      LessonSection(
        heading: 'Flow Analysis as a Complement to Full Packet Capture',
        body:
            'Flow analysis and full packet capture aren\'t competing '
            'approaches — they\'re complementary, each suited to a '
            'different purpose. Flow data provides broad, continuously '
            'affordable visibility across an entire network, well '
            'suited to spotting the kind of large-scale behavioral '
            'anomaly described above. Full packet capture, reserved '
            'selectively for specific hosts or time windows once flow '
            'analysis has already flagged something worth a much closer '
            'look, provides the deep payload-level detail flow metadata '
            'alone can never reveal.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Single Pane of Glass (SPOG)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'The Problem SPOG Solves',
        body:
            'A mature security operation typically runs many separate '
            'tools simultaneously — a SIEM, an EDR platform, a '
            'vulnerability scanner, a firewall management console, cloud '
            'security posture management, and more. Without deliberate '
            'integration, analysts waste significant time and attention '
            'simply switching between disconnected interfaces, '
            'correlating information manually that could otherwise be '
            'unified automatically.',
      ),
      LessonSection(
        heading: 'What a Single Pane of Glass Actually Provides',
        body:
            'A SPOG unifies logs, alerts, and reports from multiple '
            'underlying tools into one consistent, central interface — '
            'not necessarily replacing the specialized tools underneath, '
            'but presenting their combined output in a way that lets an '
            'analyst see the full picture without constantly context-'
            'switching between separate, disconnected systems.',
      ),
      LessonSection(
        heading: 'How SPOG Supports Each Core Function',
        bullets: [
          'Monitoring — a single consolidated dashboard reflecting the health and security status of the entire environment at a glance',
          'Incident response — investigators can pivot seamlessly across data that originated from entirely different underlying tools, without needing to separately log into and query each one',
          'Automation — a unified interface makes it dramatically easier to trigger consistent automated response actions (like the SOAR playbooks covered in the SOC Operations module) regardless of which underlying tool actually detected the issue',
          'Compliance — consolidated reporting across every security tool in one place, rather than manually assembling evidence separately from a dozen disconnected systems for every audit',
        ],
      ),
      LessonSection(
        heading: 'How This Connects to Everything Else in This Module',
        body:
            'A SPOG is, in a real sense, the practical culmination of '
            'everything covered earlier in this module — SNMP data, '
            'SIEM correlation output, and NetFlow visualizations all '
            'feeding into and appearing within one unified interface, '
            'rather than remaining scattered across separate, '
            'disconnected specialized tools that each show only their '
            'own narrow slice of the full picture.',
      ),
    ],
  ),

  // 6 --------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'What is a false positive in the context of security alerting?',
        options: [
          'An alert that correctly identifies genuine malicious activity',
          'An alert that fires on entirely benign activity',
          'A system that is completely offline',
          'A type of encryption failure',
        ],
        correctIndex: 1,
        explanation: 'A false positive incorrectly flags benign activity as malicious, contributing to alert fatigue.',
      ),
      QuizQuestion(
        question: 'SCAP (Security Content Automation Protocol) is primarily used to:',
        options: [
          'Encrypt network traffic',
          'Standardize automated vulnerability management and compliance checking across different vendor tools',
          'Replace the need for a SIEM',
          'Manage Bluetooth pairing',
        ],
        correctIndex: 1,
        explanation: 'SCAP lets security tools from different vendors share vulnerability and configuration data in a common format.',
      ),
      QuizQuestion(
        question: 'What is a baseline in the context of monitoring?',
        options: [
          'The maximum possible value a metric could ever reach',
          'A documented normal state used as a reference point to detect meaningful deviations',
          'A type of firewall rule',
          'A backup schedule',
        ],
        correctIndex: 1,
        explanation: 'Baselines define what normal looks like so monitoring can detect meaningful deviations from it.',
      ),
      QuizQuestion(
        question: 'Why does validation matter after remediation?',
        options: [
          'It is a purely optional formality',
          'It confirms the fix genuinely resolved the issue, catching incomplete fixes or newly introduced problems',
          'It replaces the need for monitoring entirely',
          'It only applies to hardware issues',
        ],
        correctIndex: 1,
        explanation: 'Validation catches cases where a fix was incomplete or introduced a new issue, rather than assuming success.',
      ),
      QuizQuestion(
        question: 'In SNMP, what does a MIB contain?',
        options: [
          'Encrypted passwords',
          'A structured database describing every piece of information a device can report or accept, identified by OIDs',
          'A list of network administrators',
          'Firewall rules',
        ],
        correctIndex: 1,
        explanation: 'The MIB structures the data points (identified by OIDs) that an SNMP agent can expose.',
      ),
      QuizQuestion(
        question: 'What is the key difference between an SNMP GET and a trap?',
        options: [
          'They are identical operations',
          'GET is the manager actively requesting a value; a trap is the agent proactively notifying the manager without being asked',
          'Traps only work with SNMPv1',
          'GET requires no network connection',
        ],
        correctIndex: 1,
        explanation: 'GET is manager-initiated polling; a trap is agent-initiated, unsolicited notification of an event.',
      ),
      QuizQuestion(
        question: 'Why should SNMPv1 and v2c be avoided today?',
        options: [
          'They are too fast for modern networks',
          'They transmit the community string (functioning as a password) in plaintext',
          'They cannot monitor routers or switches',
          'They require SNMPv3 hardware',
        ],
        correctIndex: 1,
        explanation: 'SNMPv1/v2c expose credentials in plaintext; SNMPv3 added genuine authentication and encryption.',
      ),
      QuizQuestion(
        question: 'When is SNMP the natural monitoring choice over a dedicated software agent?',
        options: [
          'For monitoring application-level performance metrics',
          'For network infrastructure devices like routers and switches that support it natively and cannot host a full software agent',
          'Only for cloud-based SaaS applications',
          'Never — dedicated agents are always superior',
        ],
        correctIndex: 1,
        explanation: 'SNMP fits devices that natively support it but cannot run a full general-purpose monitoring agent.',
      ),
      QuizQuestion(
        question: 'What does a SIEM do that a single log source alone cannot?',
        options: [
          'Nothing — a single log source provides identical value',
          'Correlate individually weak signals from different sources into one coherent, actionable pattern',
          'Automatically patch vulnerabilities',
          'Replace the need for a firewall',
        ],
        correctIndex: 1,
        explanation: 'SIEM correlation connects signals across many disparate sources that no single log alone could reveal.',
      ),
      QuizQuestion(
        question: 'What is the key trade-off between agent-based and agentless log collection?',
        options: [
          'Agentless collection is always more detailed',
          'Agent-based offers richer data and finer control but requires deployment and maintenance everywhere; agentless is simpler to deploy, especially for SaaS',
          'They are functionally identical in every case',
          'Agent-based collection cannot work with any cloud platform',
        ],
        correctIndex: 1,
        explanation: 'Agent-based collection trades deployment overhead for richer data; agentless trades some detail for simplicity at scale.',
      ),
      QuizQuestion(
        question: 'Why does NetFlow capture metadata instead of full packet contents?',
        options: [
          'Metadata is more secure by default',
          'Full packet capture at scale is extraordinarily expensive in storage and processing, while metadata reveals traffic patterns far more affordably',
          'NetFlow cannot technically access packet payloads',
          'Metadata is required by law in all countries',
        ],
        correctIndex: 1,
        explanation: 'Flow metadata provides affordable, broad visibility, reserving expensive full packet capture for targeted deeper investigation.',
      ),
      QuizQuestion(
        question: 'What does sampling in flow collection accomplish?',
        options: [
          'It encrypts a subset of traffic',
          'It analyzes only a statistically representative subset of packets, reducing processing overhead on high-volume links',
          'It blocks a percentage of all traffic',
          'It only applies to wireless networks',
        ],
        correctIndex: 1,
        explanation: 'Sampling extrapolates the full traffic picture from a smaller subset, easing load on busy links.',
      ),
      QuizQuestion(
        question: 'Which tool is described as going beyond basic flow records into detailed connection logs and protocol-specific analysis?',
        options: ['MRTG', 'Zeek', 'Nagios', 'CAPTCHA'],
        correctIndex: 1,
        explanation: 'Zeek (formerly Bro) provides deep network analysis beyond simple flow metadata.',
      ),
      QuizQuestion(
        question: 'What is the core value a Single Pane of Glass (SPOG) provides?',
        options: [
          'It replaces every underlying security tool entirely',
          'It unifies logs, alerts, and reports from multiple tools into one consistent interface, reducing context-switching',
          'It automatically resolves every security incident',
          'It only works for compliance reporting',
        ],
        correctIndex: 1,
        explanation: 'SPOG consolidates output from multiple specialized tools into one view without necessarily replacing them.',
      ),
      QuizQuestion(
        question: 'How does SPOG support automation specifically?',
        options: [
          'It has no relationship to automation',
          'A unified interface makes it easier to trigger consistent automated response actions regardless of which tool detected the issue',
          'It disables all automated tools',
          'It only automates report generation',
        ],
        correctIndex: 1,
        explanation: 'Consolidation makes consistent, cross-tool automated response (like SOAR playbooks) easier to trigger and manage.',
      ),
    ],
  ),
];
