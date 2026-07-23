import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> threatsAttacksLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Understanding Cyber Threats',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Every Connected Organization Is a Target',
        body:
            'Every organization connected to the internet is exposed to '
            'cyber threats — a multinational corporation, a government '
            'agency, a hospital, a university, or a small business. '
            'Attackers continuously search for opportunities to '
            'compromise systems, steal information, disrupt services, '
            'or generate financial gain. The methods used have evolved '
            'significantly over the past two decades: modern attacks '
            'are carefully planned, often automated, and increasingly '
            'supported by sophisticated tools, artificial intelligence, '
            'and organized criminal groups.',
      ),
      LessonSection(
        heading: 'Why This Chapter Matters',
        body:
            'Understanding cyber threats is the first step toward '
            'building effective defenses. Security professionals cannot '
            'protect systems unless they understand who the attackers '
            'are, what motivates them, how attacks are conducted, and '
            'which assets are most likely to be targeted. This chapter '
            'explores the threat landscape from a defender\'s '
            'perspective — rather than focusing only on individual '
            'attack techniques, it explains how threats emerge, how '
            'attackers think, and how organizations assess and '
            'prioritize cyber risks.',
      ),
      LessonSection(
        heading: 'What "Cyber Threat" Actually Means',
        body:
            'A cyber threat is any event, action, or circumstance that '
            'has the potential to compromise the confidentiality, '
            'integrity, or availability of information systems. A '
            'threat does not necessarily result in a successful attack '
            '— it represents the possibility that an attacker, '
            'malicious software, or even accidental human action could '
            'cause harm.',
      ),
      LessonSection(
        heading: 'Cyber Threats Originate From Many Different Sources',
        body:
            'Some are deliberate and highly organized, while others '
            'result from accidental mistakes, system failures, or '
            'natural disasters. Modern organizations must therefore '
            'consider both malicious and non-malicious threats when '
            'designing their security programs.',
      ),
      LessonSection(
        heading: 'Why Cyber Threats Behave Differently From Physical Ones',
        body:
            'Unlike traditional physical threats, cyber threats aren\'t '
            'constrained by geographical boundaries. An attacker '
            'located on another continent can compromise systems within '
            'minutes if adequate security controls aren\'t in place — '
            'this global reach makes cybersecurity fundamentally '
            'different from many other risk disciplines. Cyber threats '
            'are also dynamic by nature: new vulnerabilities are '
            'discovered daily, attack techniques evolve rapidly, and '
            'threat actors continuously adapt to defensive measures. As '
            'organizations deploy new technologies such as cloud '
            'computing, artificial intelligence, Internet of Things '
            '(IoT) devices, and remote access platforms, attackers '
            'develop new methods to exploit these environments. Cyber '
            'threats should therefore be viewed as an ongoing business '
            'risk rather than isolated technical events.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/threats/fig_2_1_threat_landscape.jpg',
          caption:
              'Modern enterprises face threats from multiple external '
              'and internal sources simultaneously — attackers target '
              'people, data, applications, identities, cloud services, '
              'and the underlying network all at once.',
        ),
      ),
      LessonSection(
        heading: 'Malicious Threats',
        body:
            'Malicious threats are intentional actions designed to '
            'compromise systems, steal information, or disrupt '
            'business operations. These threats are carried out by '
            'individuals or groups seeking financial gain, political '
            'influence, espionage opportunities, or personal '
            'recognition.',
        bullets: [
          'Ransomware attacks',
          'Credential theft',
          'Phishing campaigns',
          'Data exfiltration',
          'Distributed Denial-of-Service (DDoS) attacks',
          'Insider sabotage',
        ],
      ),
      LessonSection(
        heading: 'Accidental Threats',
        body:
            'Not all cyber incidents are the result of malicious '
            'intent. Human error remains one of the leading causes of '
            'security incidents.',
        bullets: [
          'Sending confidential information to the wrong recipient',
          'Misconfigured cloud storage',
          'Weak passwords',
          'Accidental deletion of data',
          'Incorrect firewall configurations',
          'Unpatched systems',
        ],
      ),
      LessonSection(
        heading: 'Environmental and Operational Threats',
        body:
            'Organizations must also consider threats that originate '
            'from environmental or operational events.',
        bullets: [
          'Power outages',
          'Hardware failures',
          'Floods and earthquakes',
          'Fire',
          'Network outages',
          'Cooling system failures',
        ],
      ),
      LessonSection(
        heading: 'Why These "Non-Attack" Threats Still Matter',
        body:
            'Although these events are not cyberattacks, they can '
            'affect the availability of critical information systems '
            'and are therefore included in enterprise risk assessments '
            '— an organization\'s security program has to plan for '
            'availability risks that have nothing to do with an '
            'attacker at all.',
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'One of the biggest misconceptions in cybersecurity is that '
            'every incident is caused by hackers. In reality, a '
            'significant proportion of security incidents arise from '
            'configuration errors, software defects, accidental user '
            'actions, or operational failures. Effective cybersecurity '
            'programs therefore address both malicious and '
            'non-malicious risks.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat, Vulnerability, Exploit & Risk',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Four Terms, Frequently Confused',
        body:
            'These four terms are among the most frequently '
            'misunderstood concepts in cybersecurity. Although they are '
            'closely related, they describe genuinely different '
            'elements of the security landscape — and mixing them up '
            'makes it much harder to communicate precisely about risk, '
            'both within a security team and when explaining decisions '
            'to leadership.',
      ),
      LessonSection(
        heading: 'Threat',
        body:
            'A threat is anything capable of causing harm to an '
            'organization\'s assets. A threat may be a person, a piece '
            'of malware, a natural disaster, or even an internal '
            'process failure. For example, a ransomware group is a '
            'threat because it has the capability and intent to '
            'encrypt organizational data.',
      ),
      LessonSection(
        heading: 'Vulnerability',
        body:
            'A vulnerability is a weakness that can be exploited by a '
            'threat. Vulnerabilities may exist in software, hardware, '
            'network configurations, business processes, or human '
            'behavior.',
        bullets: [
          'Unpatched operating systems',
          'Weak authentication mechanisms',
          'Misconfigured cloud storage',
          'Default administrator credentials',
          'Poor security awareness among employees',
        ],
      ),
      LessonSection(
        heading: 'Exploit',
        body:
            'An exploit is the mechanism or technique used to take '
            'advantage of a vulnerability. Exploits may involve '
            'specially crafted code, malicious scripts, or carefully '
            'designed attack sequences. For example, a SQL injection '
            'payload is an exploit that targets a vulnerable web '
            'application.',
      ),
      LessonSection(
        heading: 'Risk',
        body:
            'Risk represents the probability that a threat will '
            'successfully exploit a vulnerability, and the impact that '
            'such an event would have on the organization. '
            'Organizations cannot eliminate every vulnerability or '
            'prevent every threat — instead, they identify and '
            'prioritize risks so that resources can be focused on the '
            'areas with the greatest potential business impact.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Threat', 'Finds a Vulnerability', 'Uses an Exploit', 'Security Incident', 'Business Risk'],
          caption:
              'Cyber risk materializes when a threat successfully '
              'exploits a vulnerability, resulting in a security '
              'incident that impacts the organization.',
        ),
      ),
      LessonSection(
        heading: 'Real-World Example: The Equifax Data Breach',
        body:
            'In 2017, attackers exploited a known vulnerability in the '
            'Apache Struts web application framework used by Equifax. '
            'A security patch had been released months earlier, but '
            'the affected systems were not updated in time. The '
            'incident resulted in the exposure of sensitive information '
            'belonging to approximately 147 million individuals, '
            'including names, Social Security numbers, birth dates, '
            'and addresses.',
      ),
      LessonSection(
        heading: 'Mapping Equifax to the Four Concepts',
        body:
            'From a cybersecurity perspective, the incident illustrates '
            'the relationship between the key concepts introduced in '
            'this lesson:',
        bullets: [
          'Threat — external attackers seeking valuable personal information',
          'Vulnerability — an unpatched Apache Struts vulnerability',
          'Exploit — malicious requests targeting the vulnerable web application',
          'Risk — unauthorized access to sensitive customer data, leading to financial losses, legal consequences, and reputational damage',
        ],
      ),
      LessonSection(
        heading: 'Why Equifax Remains a Classic Case Study',
        body:
            'The Equifax breach remains a classic example of why '
            'vulnerability management, asset inventory, and timely '
            'patch management are essential components of an '
            'enterprise security program — the underlying vulnerability '
            'wasn\'t exotic or novel, it was simply left unpatched for '
            'months after a fix already existed.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Actors: Cybercriminals & Nation-States',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Behind Every Attack Is Someone With a Goal',
        body:
            'Cyberattacks do not occur randomly. Behind every cyber '
            'incident is an individual, a group, or an organization '
            'with specific objectives, capabilities, and motivations. '
            'Understanding who these adversaries are, why they attack, '
            'and how they operate is fundamental to designing effective '
            'cybersecurity strategies.',
      ),
      LessonSection(
        heading: 'Not All Attackers Are Equally Skilled',
        body:
            'Not all attackers possess the same level of technical '
            'expertise. Some rely on publicly available hacking tools, '
            'while others invest millions of dollars developing '
            'sophisticated attack capabilities. Some seek financial '
            'gain through ransomware, while others conduct espionage, '
            'disrupt critical infrastructure, or promote political '
            'causes. Security professionals must therefore understand '
            'both the technical methods used by attackers and the '
            'human motivations that drive cybercrime.',
      ),
      LessonSection(
        heading: 'What Is a Threat Actor?',
        body:
            'A threat actor is any individual, organization, or group '
            'capable of intentionally or unintentionally causing harm '
            'to an organization\'s information systems, networks, or '
            'data. Threat actors differ significantly in terms of '
            'technical capability, available resources, persistence, '
            'and objectives. Modern enterprises rarely face a single '
            'type of attacker — instead, they must defend against a '
            'diverse ecosystem of adversaries, ranging from '
            'opportunistic cybercriminals to highly sophisticated '
            'nation-state groups.',
      ),
      LessonSection(
        heading: 'Cybercriminals',
        body:
            'Cybercriminals are the most common threat actors '
            'encountered by organizations. Their primary objective is '
            'financial gain — they exploit security weaknesses to steal '
            'money, valuable information, or digital assets that can be '
            'sold on underground markets.',
        bullets: [
          'Ransomware campaigns',
          'Banking malware',
          'Credential theft',
          'Payment card fraud',
          'Cryptocurrency theft',
          'Business Email Compromise (BEC)',
        ],
      ),
      LessonSection(
        heading: 'Modern Cybercriminal Organizations Operate Like Businesses',
        body:
            'Modern cybercriminal organizations operate similarly to '
            'legitimate businesses. Many have dedicated development '
            'teams, customer support channels for ransomware victims, '
            'affiliate programs, and profit-sharing models — this '
            'professionalization is a major reason ransomware has scaled '
            'so dramatically over the past several years.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A manufacturing company receives a phishing email '
            'containing a malicious attachment. Once opened, '
            'ransomware encrypts hundreds of servers, halting '
            'production for several days and demanding payment for '
            'data recovery.',
      ),
      LessonSection(
        heading: 'Nation-State Actors',
        body:
            'Nation-state actors are government-sponsored groups that '
            'conduct cyber operations to achieve political, military, '
            'economic, or intelligence objectives. These groups '
            'typically possess significant funding, advanced technical '
            'capabilities, and long-term strategic goals. Unlike '
            'financially motivated attackers, nation-state actors often '
            'remain undetected for extended periods while collecting '
            'sensitive information.',
        bullets: [
          'Government agencies',
          'Defense organizations',
          'Research institutions',
          'Energy providers',
          'Telecommunications',
          'Financial institutions',
          'Critical infrastructure',
        ],
      ),
      LessonSection(
        heading: 'How Nation-State Campaigns Actually Operate',
        body:
            'Nation-state campaigns often leverage advanced persistent '
            'threats (APTs), custom malware, zero-day vulnerabilities, '
            'and social engineering to gain long-term access — the goal '
            'is rarely a quick smash-and-grab, but rather sustained, '
            'quiet access that can be maintained for months or years.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'An aerospace manufacturer developing next-generation '
            'aircraft may be targeted by state-sponsored groups seeking '
            'intellectual property related to propulsion systems, '
            'avionics, or manufacturing processes.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Actors: Insiders, Hacktivists & Organized Crime',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Not Every Threat Comes From Outside',
        body:
            'Not every threat originates from outside the '
            'organization. Employees, contractors, consultants, and '
            'business partners may intentionally or unintentionally '
            'compromise organizational security. Organizations often '
            'focus heavily on external attackers while underestimating '
            'insider risks — strong identity management, monitoring, '
            'and user awareness programs help reduce insider-related '
            'incidents.',
      ),
      LessonSection(
        heading: 'Insider Threats Fall Into Three Categories',
        bullets: [
          'Malicious insiders — individuals who deliberately misuse their authorized access to steal data, sabotage systems, or benefit competitors',
          'Negligent insiders — users who unintentionally expose sensitive information through poor security practices, such as using weak passwords or mishandling confidential data',
          'Compromised insiders — legitimate users whose credentials have been stolen or whose devices have been infected with malware',
        ],
      ),
      LessonSection(
        heading: 'Hacktivists',
        body:
            'Hacktivists use cyberattacks to promote political, social, '
            'or ideological causes. Rather than seeking financial gain, '
            'they attempt to influence public opinion or disrupt '
            'organizations they oppose.',
        bullets: [
          'Website defacement',
          'Data leaks',
          'Distributed Denial-of-Service (DDoS)',
          'Public disclosure of confidential information',
        ],
      ),
      LessonSection(
        heading: 'Script Kiddies',
        body:
            'Script kiddies possess limited technical knowledge and '
            'typically rely on publicly available tools developed by '
            'others. Although individually less sophisticated, they '
            'often target poorly secured systems and small '
            'organizations that lack adequate defenses — their low '
            'skill doesn\'t mean low risk, since so much of the '
            'internet remains genuinely poorly defended.',
      ),
      LessonSection(
        heading: 'Organized Crime Groups',
        body:
            'Cybercrime has evolved into a global business. Organized '
            'crime groups operate across multiple countries and '
            'specialize in different aspects of cybercrime — one group '
            'may develop ransomware, another may distribute phishing '
            'emails, while another launders cryptocurrency obtained '
            'through attacks.',
      ),
      LessonSection(
        heading: 'Ransomware-as-a-Service (RaaS)',
        body:
            'The availability of Ransomware-as-a-Service (RaaS) has '
            'significantly lowered the barrier to entry, allowing '
            'less-skilled criminals to launch sophisticated attacks — '
            'renting professionally built ransomware and infrastructure '
            'rather than needing to develop it themselves.',
      ),
      LessonSection(
        heading: 'Threat Actor Comparison',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Threat Actor', 'Primary Motivation', 'Skill Level', 'Typical Targets', 'Common Methods'],
          tableRows: [
            ['Cybercriminal', 'Financial gain', 'Medium–High', 'Businesses, banks', 'Ransomware, phishing'],
            ['Nation-State', 'Espionage', 'Very High', 'Governments, infrastructure', 'APTs, zero-days'],
            ['Insider', 'Personal gain, negligence', 'Varies', 'Employer', 'Data theft, sabotage'],
            ['Hacktivist', 'Political causes', 'Medium', 'Public organizations', 'DDoS, defacement'],
            ['Script Kiddie', 'Curiosity', 'Low', 'Poorly secured systems', 'Public hacking tools'],
            ['Organized Crime', 'Financial gain', 'High', 'Enterprises', 'Ransomware, fraud'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Threat Motivations',
        body:
            'Understanding why attackers conduct cyberattacks helps '
            'organizations prioritize defenses. Attack motivations '
            'often influence the sophistication of an attack — a '
            'financially motivated attacker may seek rapid payment '
            'through ransomware, while a nation-state actor may remain '
            'undetected for months to gather intelligence.',
        bullets: [
          'Financial profit',
          'Cyber espionage',
          'Political influence',
          'Revenge',
          'Competitive advantage',
          'Ideological beliefs',
          'Sabotage',
          'Disruption of critical infrastructure',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Defensive strategies should be tailored to the '
            'organization\'s threat profile. A hospital, for example, '
            'may prioritize ransomware resilience, while a defense '
            'contractor focuses on protecting intellectual property '
            'from nation-state actors — the same generic set of '
            'defenses doesn\'t serve every organization equally well, '
            'which is exactly why understanding your own realistic '
            'threat profile matters as much as understanding threat '
            'actors in the abstract.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'The Cyber Attack Lifecycle',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Attacks Follow a Logical Sequence',
        body:
            'Most cyberattacks follow a logical sequence of activities. '
            'Attackers first gather information about a target, '
            'identify weaknesses, gain initial access, expand their '
            'control, and ultimately achieve their objectives. '
            'Understanding this progression helps defenders identify '
            'suspicious activity before significant damage occurs.',
      ),
      LessonSection(
        heading: 'Learn the Pattern, Not Just the Techniques',
        body:
            'Rather than memorizing individual attack techniques, '
            'cybersecurity professionals should learn how attackers '
            'think and how attack chains develop — the specific tools '
            'and exploits change constantly, but the underlying logic '
            'of how an attack actually progresses stays remarkably '
            'consistent.',
      ),
      LessonSection(
        heading: 'The Seven Stages',
        body:
            'Although every attack differs in its specifics, most '
            'follow similar stages. Recognizing these stages allows '
            'defenders to interrupt an attack before it reaches its '
            'objective.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Reconnaissance', 'Initial Access', 'Privilege Escalation', 'Lateral Movement', 'Data Collection', 'Exfiltration', 'Impact'],
          caption: 'The typical progression of a cyberattack — each stage represents an opportunity for defenders to detect and interrupt it.',
        ),
      ),
      LessonSection(
        heading: 'Reconnaissance',
        body:
            'Attackers gather information about a target — employee '
            'names and email addresses, technology stack, exposed '
            'services, and any other intelligence that helps plan the '
            'actual attack.',
      ),
      LessonSection(
        heading: 'Initial Access',
        body:
            'The attacker gains a first foothold inside the target '
            'environment — through phishing, an exposed vulnerability, '
            'stolen credentials, or any of the attack vectors covered '
            'later in this chapter.',
      ),
      LessonSection(
        heading: 'Privilege Escalation',
        body:
            'Once inside, the attacker works to gain higher-level '
            'permissions than their initial foothold provided — moving '
            'from a standard user account toward administrative access.',
      ),
      LessonSection(
        heading: 'Lateral Movement',
        body:
            'The attacker expands their reach across the network, '
            'moving from the initially compromised system toward other '
            'systems that hold more valuable data or provide broader '
            'access.',
      ),
      LessonSection(
        heading: 'Data Collection and Exfiltration',
        body:
            'The attacker identifies and gathers the data they\'re '
            'actually after, then moves it out of the organization\'s '
            'network — often disguising this traffic to blend in with '
            'normal network activity.',
      ),
      LessonSection(
        heading: 'Impact',
        body:
            'The attacker achieves their final objective — whether '
            'that\'s selling stolen data, deploying ransomware, '
            'disrupting operations, or simply maintaining long-term '
            'quiet access for future use.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'The MITRE ATT&CK Framework',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'A Knowledge Base Built From Real Incidents',
        body:
            'The MITRE ATT&CK framework is a globally recognized '
            'knowledge base of real-world adversary tactics and '
            'techniques. Rather than describing how attacks should '
            'occur, it documents how attackers actually behave based on '
            'observed incidents — making it a genuinely evidence-based '
            'reference rather than a theoretical model.',
      ),
      LessonSection(
        heading: 'How Security Teams Actually Use ATT&CK',
        bullets: [
          'Map attacker behavior',
          'Identify detection gaps',
          'Improve threat hunting',
          'Enhance incident response',
          'Validate security controls',
        ],
      ),
      LessonSection(
        heading: 'Tactics vs. Techniques',
        body:
            'ATT&CK organizes attacker behavior into tactics (the '
            '"why" — the attacker\'s tactical goal at a given moment, '
            'like gaining persistence or escalating privileges) and '
            'techniques (the "how" — the specific method used to '
            'achieve that goal). This lesson focuses on the tactics '
            'themselves, since understanding the full technique matrix '
            'is a career-long pursuit, not something to memorize in one '
            'sitting.',
      ),
      LessonSection(
        heading: 'Key ATT&CK Tactics',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Tactic', 'What It Represents'],
          tableRows: [
            ['Reconnaissance', 'Gathering information about the target'],
            ['Resource Development', 'Establishing resources to support operations'],
            ['Initial Access', 'Gaining an initial foothold into the network'],
            ['Execution', 'Running malicious code on a target system'],
            ['Persistence', 'Maintaining access across restarts and credential changes'],
            ['Privilege Escalation', 'Gaining higher-level permissions'],
            ['Defense Evasion', 'Avoiding detection'],
            ['Credential Access', 'Stealing account names and passwords'],
            ['Discovery', 'Learning about the environment'],
            ['Lateral Movement', 'Moving through the environment'],
            ['Collection', 'Gathering data of interest'],
            ['Command and Control', 'Communicating with compromised systems'],
            ['Exfiltration', 'Stealing data out of the network'],
            ['Impact', 'Manipulating, interrupting, or destroying systems and data'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Why This Matters for Defenders, Specifically',
        body:
            'Notice how closely these tactics mirror the seven-stage '
            'attack lifecycle from the previous lesson — ATT&CK is '
            'essentially a much more granular, continuously updated, '
            'community-validated version of that same underlying '
            'progression. A SOC team that maps its detection coverage '
            'against ATT&CK tactics can identify exactly which stages '
            'of a real attack they\'d actually catch, and which ones '
            'would currently go unnoticed.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'The Cyber Kill Chain',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'A Structured View of a Targeted Attack',
        body:
            'Developed by Lockheed Martin, the Cyber Kill Chain '
            'describes the stages of a targeted cyberattack from the '
            'attacker\'s own perspective. It provides a structured way '
            'to understand how attacks progress and, critically, '
            'exactly where defenders can interrupt them.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Reconnaissance', 'Weaponization', 'Delivery', 'Exploitation', 'Installation', 'Command & Control', 'Actions on Objectives'],
          caption: 'Understanding the Kill Chain helps organizations deploy layered security controls at each individual stage.',
        ),
      ),
      LessonSection(
        heading: 'Reconnaissance and Weaponization',
        body:
            'Reconnaissance is identical in spirit to the attack '
            'lifecycle\'s first stage — gathering intelligence on the '
            'target. Weaponization is where the attacker couples an '
            'exploit with a deliverable payload, such as a malicious '
            'document or a crafted exploit for a specific '
            'vulnerability.',
      ),
      LessonSection(
        heading: 'Delivery and Exploitation',
        body:
            'Delivery is the actual transmission of the weaponized '
            'payload to the target — via email, a compromised website, '
            'or a USB device, for example. Exploitation is the moment '
            'the payload actually triggers, taking advantage of a '
            'vulnerability to execute the attacker\'s code.',
      ),
      LessonSection(
        heading: 'Installation and Command & Control',
        body:
            'Installation establishes persistence — a backdoor or '
            'remote access trojan that survives a reboot, giving the '
            'attacker durable access. Command and Control (C2) is the '
            'channel the attacker uses to communicate with and direct '
            'that compromised system remotely.',
      ),
      LessonSection(
        heading: 'Actions on Objectives',
        body:
            'The final stage — the attacker actually achieves whatever '
            'their goal was: exfiltrating data, encrypting files for '
            'ransom, destroying systems, or maintaining long-term '
            'access for future use.',
      ),
      LessonSection(
        heading: 'Why Layered Defense Maps Directly to the Kill Chain',
        body:
            'Each individual stage represents a distinct opportunity to '
            'stop an attack before it succeeds — email filtering '
            'disrupts Delivery, patching disrupts Exploitation, '
            'endpoint detection disrupts Installation, and network '
            'monitoring can catch Command and Control traffic even if '
            'every earlier stage was missed. A defender doesn\'t need '
            'to catch every attack at the earliest possible stage; they '
            'just need enough layered controls that at least one stage '
            'catches it.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Attack Vectors',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'The Paths Attackers Actually Use',
        body:
            'Attack vectors are the paths attackers use to gain '
            'unauthorized access to systems. Attack vectors evolve '
            'continuously as organizations adopt new technologies — '
            'regular security assessments, secure configuration '
            'practices, and user awareness training are essential to '
            'reducing exposure across all of them.',
      ),
      LessonSection(
        heading: 'The Full List of Common Vectors',
        bullets: [
          'Phishing emails',
          'Public-facing web applications',
          'Remote Desktop Protocol (RDP)',
          'Virtual Private Networks (VPNs)',
          'Misconfigured cloud storage',
          'Weak passwords',
          'Third-party vendors',
          'USB devices',
          'Wireless networks',
          'Mobile applications',
          'APIs',
        ],
      ),
      LessonSection(
        heading: 'Why Third-Party Vendors Deserve Special Attention',
        body:
            'Third-party vendors are worth calling out specifically — '
            'an organization can have genuinely strong internal '
            'security and still be compromised through a vendor with '
            'weaker defenses but legitimate, trusted access into the '
            'target\'s environment. This exact pattern shows up '
            'repeatedly in major breaches, and is a recurring theme '
            'throughout this chapter.',
      ),
      LessonSection(
        heading: 'Password-Based Attacks',
        body:
            'Despite advances in authentication technologies, passwords '
            'remain one of the most frequently targeted security '
            'controls.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Attack', 'Description', 'Typical Target', 'Mitigation'],
          tableRows: [
            ['Brute Force', 'Tries many passwords against one account', 'Individual accounts', 'MFA, lockout'],
            ['Dictionary', 'Uses common password lists', 'Weak passwords', 'Strong password policy'],
            ['Credential Stuffing', 'Uses leaked credentials', 'Consumer services', 'MFA, credential monitoring'],
            ['Password Spraying', 'One common password across many users', 'Enterprise accounts', 'Smart lockout, MFA'],
            ['Rainbow Table', 'Cracks hashed passwords', 'Stolen password databases', 'Salted password hashing'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Also Worth Recognizing',
        bullets: [
          'Keylogging — capturing keystrokes directly, bypassing the need to guess or crack a password at all',
        ],
      ),
      LessonSection(
        heading: 'Defenses Against Password-Based Attacks',
        bullets: [
          'Multi-factor authentication (MFA)',
          'Strong password policies',
          'Password managers',
          'Account lockout policies',
          'Risk-based authentication',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Real-World Case Study: The SolarWinds Supply Chain Attack',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'What Happened',
        body:
            'Attackers compromised SolarWinds\' Orion software build '
            'process and inserted malicious code into a legitimate, '
            'digitally signed software update. When customers installed '
            'the routine update, they unknowingly installed a backdoor '
            'as well — giving the attackers a foothold inside thousands '
            'of organizations, including U.S. government agencies and '
            'major corporations, entirely through a trusted software '
            'supply chain rather than a direct attack on each victim.',
      ),
      LessonSection(
        heading: 'Why This Attack Was So Effective',
        body:
            'The genius of the SolarWinds attack, from the attacker\'s '
            'perspective, was that it completely sidestepped the need '
            'to individually breach thousands of separate '
            'organizations. Instead, the attackers found the single '
            'highest-leverage point in the entire ecosystem — a widely '
            'trusted software vendor whose updates were, by design, '
            'automatically deployed with elevated privileges across a '
            'huge number of customer environments.',
      ),
      LessonSection(
        heading: 'Connecting SolarWinds to the Attack Lifecycle',
        body:
            'The campaign illustrates nearly every stage covered '
            'earlier in this chapter at once: reconnaissance of a '
            'high-value, widely deployed software vendor; initial '
            'access through the compromised build pipeline rather than '
            'any individual victim\'s own defenses; persistence via a '
            'legitimate, trusted update mechanism; and, once inside '
            'select high-value targets, lateral movement and long-term '
            'espionage that went undetected for months.',
      ),
      LessonSection(
        heading: 'Connecting SolarWinds to the Kill Chain',
        body:
            'Mapped onto the Kill Chain, the "weaponization" and '
            '"delivery" stages are where this attack was most '
            'distinctive — the weaponized payload was delivered through '
            'an entirely legitimate distribution channel that victims '
            'had every reason to trust, rather than through a phishing '
            'email or an exposed vulnerability an alert defender might '
            'have caught.',
      ),
      LessonSection(
        heading: 'The Lasting Lesson',
        body:
            'SolarWinds remains one of the clearest illustrations of '
            'why supply chain risk and vendor trust deserve the same '
            'scrutiny organizations apply to their own systems. Trusting '
            'a vendor\'s update mechanism implicitly, without '
            'independent verification, is exactly the kind of '
            'assumption an attacker can turn into their single most '
            'effective attack vector.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Understanding Vulnerabilities',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'No System Is Completely Secure',
        body:
            'No information system is completely secure. Every '
            'operating system, application, network device, cloud '
            'platform, and business process contains weaknesses that '
            'may be exploited by attackers. These weaknesses, known as '
            'vulnerabilities, exist because software is developed by '
            'humans, systems evolve continuously, configurations '
            'change, and new technologies are introduced faster than '
            'they can be thoroughly tested.',
      ),
      LessonSection(
        heading: 'A Continuous Process, Not a One-Time Fix',
        body:
            'Cybersecurity professionals cannot eliminate every '
            'vulnerability. Instead, they must identify weaknesses, '
            'understand the associated risks, prioritize remediation '
            'efforts, and continuously monitor their environments for '
            'emerging threats. Modern vulnerability management is '
            'therefore not simply about applying software patches — it '
            'is a continuous risk management process that combines '
            'asset visibility, vulnerability assessment, threat '
            'intelligence, business context, and remediation planning.',
      ),
      LessonSection(
        heading: 'A Vulnerability Isn\'t the Same as a Breach',
        body:
            'It\'s important to recognize that the presence of a '
            'vulnerability does not necessarily mean that an '
            'organization has already been compromised. A vulnerability '
            'represents the potential for compromise. An actual '
            'security incident occurs only when a threat actor '
            'successfully exploits that weakness.',
      ),
      LessonSection(
        heading: 'Common Vulnerability Examples',
        bullets: [
          'Missing security patches',
          'Unsupported operating systems',
          'Default usernames and passwords',
          'Weak encryption algorithms',
          'Misconfigured cloud storage',
          'Open network ports',
          'Insecure application programming interfaces (APIs)',
          'Improper access controls',
          'Software coding defects',
          'Unnecessary services running on servers',
        ],
      ),
      LessonSection(
        heading: 'The Real Challenge Isn\'t Finding Vulnerabilities',
        body:
            'Modern enterprises often manage tens of thousands of '
            'vulnerabilities across endpoints, servers, cloud '
            'workloads, network devices, and applications. The '
            'challenge isn\'t merely identifying vulnerabilities but '
            'determining which ones pose the greatest business risk — '
            'a theme this chapter returns to repeatedly.',
      ),
      LessonSection(
        heading: 'Software Vulnerabilities',
        body:
            'Software vulnerabilities occur due to coding errors, '
            'insecure programming practices, or design flaws. These '
            'are frequently discovered through penetration testing, '
            'code reviews, security research, and bug bounty programs.',
        bullets: [
          'Buffer overflows',
          'SQL Injection',
          'Cross-Site Scripting (XSS)',
          'Remote Code Execution (RCE)',
          'Directory Traversal',
        ],
      ),
      LessonSection(
        heading: 'Configuration Vulnerabilities',
        body:
            'Systems may become vulnerable even when the software '
            'itself is secure. Misconfigurations remain one of the '
            'leading causes of cloud security incidents specifically.',
        bullets: [
          'Public cloud storage buckets',
          'Default administrator accounts',
          'Weak password policies',
          'Unrestricted firewall rules',
          'Open Remote Desktop Protocol (RDP) services',
          'Disabled security logging',
        ],
      ),
      LessonSection(
        heading: 'Human Vulnerabilities',
        body:
            'Employees also represent potential vulnerabilities. '
            'Organizations therefore invest heavily in security '
            'awareness training alongside technical controls.',
        bullets: [
          'Weak passwords',
          'Password reuse',
          'Poor security awareness',
          'Falling victim to phishing attacks',
          'Mishandling sensitive information',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Many high-profile breaches occur because organizations '
            'fail to remediate known vulnerabilities rather than '
            'because attackers discover entirely new weaknesses. '
            'Effective asset inventory, patch management, and '
            'configuration management often reduce risk more '
            'effectively than deploying additional security products.',
      ),
      LessonSection(
        heading: 'Common Vulnerabilities and Exposures (CVE)',
        body:
            'The Common Vulnerabilities and Exposures (CVE) program '
            'provides a standardized naming system for publicly '
            'disclosed cybersecurity vulnerabilities. Each vulnerability '
            'receives a unique identifier, allowing security '
            'professionals, software vendors, and researchers to '
            'reference the same issue consistently.',
        bullets: [
          'CVE-2021-44228 (Log4Shell)',
          'CVE-2017-5638 (Apache Struts)',
          'CVE-2020-1472 (Zerologon)',
        ],
      ),
      LessonSection(
        heading: 'What a CVE Entry Typically Includes',
        bullets: [
          'Unique identifier',
          'Vulnerability description',
          'Affected products',
          'References to vendor advisories',
          'Severity information',
        ],
      ),
      LessonSection(
        heading: 'A Common Misunderstanding About CVE',
        body:
            'It is important to understand that a CVE does not '
            'indicate how severe a vulnerability is. It simply '
            'provides a common reference. Severity is determined '
            'separately using scoring systems such as CVSS, covered in '
            'the next lesson.',
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'CVSS & Zero-Day Vulnerabilities',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Why Organizations Need a Standardized Severity Score',
        body:
            'Organizations often discover thousands of vulnerabilities '
            'during routine assessments. Since resources are limited, '
            'they need a consistent method to determine which issues '
            'should be addressed first. The Common Vulnerability '
            'Scoring System (CVSS) provides a standardized approach for '
            'measuring the severity of vulnerabilities.',
      ),
      LessonSection(
        heading: 'What CVSS Actually Evaluates',
        bullets: [
          'Ease of exploitation',
          'Required privileges',
          'User interaction',
          'Scope of impact',
          'Effect on confidentiality',
          'Effect on integrity',
          'Effect on availability',
        ],
      ),
      LessonSection(
        heading: 'CVSS Severity Ratings',
        body: 'The result is a numerical score ranging from 0.0 to 10.0.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Score', 'Severity', 'Typical Response'],
          tableRows: [
            ['0.0', 'None', 'No action required'],
            ['0.1–3.9', 'Low', 'Address during normal maintenance'],
            ['4.0–6.9', 'Medium', 'Schedule remediation'],
            ['7.0–8.9', 'High', 'Prioritize remediation'],
            ['9.0–10.0', 'Critical', 'Immediate response'],
          ],
        ),
      ),
      LessonSection(
        heading: 'CVSS Score Isn\'t the Whole Story',
        body:
            'While CVSS provides valuable technical context, '
            'organizations should also consider business impact. A '
            'medium-severity vulnerability affecting a critical payment '
            'system may require more urgent attention than a '
            'high-severity vulnerability on an isolated test server.',
      ),
      LessonSection(
        heading: 'What Makes a Vulnerability a "Zero-Day"',
        body:
            'A zero-day vulnerability is a software flaw that becomes '
            'known to attackers before the software vendor has released '
            'a security patch. Because defenders have "zero days" to '
            'prepare, these vulnerabilities present significant risk.',
      ),
      LessonSection(
        heading: 'Why Zero-Day Exploits Are Particularly Dangerous',
        bullets: [
          'Traditional antivirus signatures may not detect them',
          'Patches are unavailable',
          'Attack techniques are often unknown',
          'High-value targets are frequently attacked first',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Unknown Vulnerability', 'Attacker Discovers Flaw', 'Exploit Developed', 'Active Attacks', 'Vendor Releases Patch', 'Organizations Apply Updates'],
          caption: 'A zero-day vulnerability exists before a vendor releases a security update, creating a window during which attackers may exploit affected systems.',
        ),
      ),
      LessonSection(
        heading: 'Reducing Zero-Day Impact',
        body:
            'Organizations reduce the impact of zero-day attacks '
            'through layered security controls such as endpoint '
            'detection and response (EDR), application allowlisting, '
            'behavior-based detection, network segmentation, and threat '
            'intelligence — since no single control alone can reliably '
            'catch an attack nobody has seen before.',
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Vulnerability Management Lifecycle & Log4Shell',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'A Continuous Operational Process',
        body:
            'Managing vulnerabilities is a continuous operational '
            'process rather than a one-time activity. Mature '
            'organizations follow a structured lifecycle to identify, '
            'assess, prioritize, remediate, verify, and monitor '
            'vulnerabilities across their environments.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Asset Discovery', 'Vulnerability Scan', 'Risk Assessment', 'Prioritization', 'Remediation', 'Validation', 'Continuous Monitoring'],
          caption: 'Vulnerability management is a continuous process that combines technical assessments with genuine business risk evaluation.',
        ),
      ),
      LessonSection(
        heading: 'Step 1 — Asset Discovery',
        body:
            'An organization cannot protect assets it does not know '
            'exist. Asset discovery identifies endpoints, servers, '
            'applications, cloud resources, databases, network devices, '
            'and IoT systems that require monitoring.',
      ),
      LessonSection(
        heading: 'Step 2 — Vulnerability Assessment',
        body:
            'Automated scanners examine assets for known '
            'vulnerabilities, missing patches, insecure configurations, '
            'and outdated software versions.',
      ),
      LessonSection(
        heading: 'Step 3 — Risk Prioritization',
        body:
            'Not every vulnerability requires immediate remediation. '
            'Security teams prioritize findings based on:',
        bullets: [
          'CVSS score',
          'Business criticality',
          'Internet exposure',
          'Availability of exploits',
          'Threat intelligence',
          'Regulatory requirements',
        ],
      ),
      LessonSection(
        heading: 'Step 4 — Remediation',
        bullets: [
          'Applying security patches',
          'Updating configurations',
          'Disabling vulnerable services',
          'Implementing compensating controls',
          'Upgrading unsupported software',
        ],
      ),
      LessonSection(
        heading: 'Step 5 — Verification',
        body:
            'After remediation, security teams rescan affected systems '
            'to confirm that vulnerabilities have been successfully '
            'addressed — assuming a fix worked without checking is a '
            'common, avoidable mistake.',
      ),
      LessonSection(
        heading: 'Step 6 — Continuous Monitoring',
        body:
            'New vulnerabilities emerge daily. Continuous monitoring '
            'ensures that newly discovered weaknesses are identified '
            'and managed promptly, rather than waiting for the next '
            'scheduled scan cycle.',
      ),
      LessonSection(
        heading: 'Risk-Based Vulnerability Management',
        body:
            'Traditional vulnerability management focused primarily on '
            'the number of vulnerabilities discovered. Modern '
            'organizations increasingly adopt a risk-based approach, '
            'recognizing that not all vulnerabilities carry the same '
            'level of business impact.',
        bullets: [
          'Asset criticality',
          'Business function',
          'Data sensitivity',
          'Internet exposure',
          'Availability of exploits',
          'Active threat intelligence',
          'Regulatory obligations',
        ],
      ),
      LessonSection(
        heading: 'Why This Approach Actually Works Better',
        body:
            'This approach helps security teams focus limited resources '
            'on vulnerabilities that present the greatest risk to the '
            'organization, rather than attempting to remediate every '
            'issue immediately regardless of actual business context.',
      ),
      LessonSection(
        heading: 'Real-World Case Study: Log4Shell (CVE-2021-44228)',
        body:
            'In late 2021, security researchers disclosed a critical '
            'vulnerability in the Apache Log4j logging library, widely '
            'used across enterprise applications. The flaw allowed '
            'attackers to execute arbitrary code remotely, affecting '
            'millions of systems worldwide.',
      ),
      LessonSection(
        heading: 'Key Lessons From Log4Shell',
        bullets: [
          'Organizations often lack complete visibility into software dependencies',
          'Asset inventories are essential for identifying affected systems',
          'Rapid vulnerability assessment and prioritization reduce exposure',
          'Layered security controls help mitigate risk while patches are being applied',
          'Threat intelligence enables organizations to respond quickly to emerging threats',
        ],
      ),
      LessonSection(
        heading: 'Why Log4Shell Was So Significant',
        body:
            'Log4Shell demonstrated how a single software component '
            'embedded within thousands of applications could create a '
            'global cybersecurity challenge — a vulnerability in one '
            'small, widely-reused logging library rippled out into an '
            'enormous, simultaneous remediation effort across the '
            'entire industry, in many ways mirroring the supply-chain '
            'dynamics of the SolarWinds case study earlier in this '
            'chapter.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain an accurate inventory of all assets',
          'Conduct regular authenticated vulnerability scans',
          'Prioritize remediation using both technical severity and business impact',
          'Implement secure configuration baselines',
          'Remove unsupported software and operating systems',
          'Integrate threat intelligence into vulnerability management processes',
          'Validate remediation through follow-up assessments',
          'Monitor continuously for newly disclosed vulnerabilities',
        ],
      ),
      LessonSection(
        heading: 'Bringing This Chapter Together',
        body:
            'Vulnerabilities are an inevitable aspect of modern '
            'information systems, but effective cybersecurity programs '
            'focus on managing them systematically rather than '
            'attempting to eliminate them entirely. By combining asset '
            'visibility, vulnerability assessments, risk prioritization, '
            'threat intelligence, and continuous monitoring, '
            'organizations can significantly reduce their exposure to '
            'cyber threats — exactly the same theme that ran through '
            'the Equifax, SolarWinds, and Log4Shell case studies '
            'covered throughout this chapter.',
      ),
    ],
  ),

  // 13 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 18,
    quiz: [
      QuizQuestion(
        question: 'What is a common misconception about the cause of cybersecurity incidents?',
        options: [
          'That all incidents can be prevented',
          'That every incident is caused by hackers, when many actually stem from configuration errors, software defects, or accidental user actions',
          'That environmental threats never affect availability',
          'That patches are always applied on time',
        ],
        correctIndex: 1,
        explanation: 'A significant share of incidents arise from non-malicious causes like misconfigurations and human error, not just deliberate attacks.',
      ),
      QuizQuestion(
        question: 'Which category of threat includes power outages, floods, and hardware failures?',
        options: ['Malicious threats', 'Accidental threats', 'Environmental and operational threats', 'Nation-state threats'],
        correctIndex: 2,
        explanation: 'Environmental and operational threats aren\'t cyberattacks, but they affect availability and belong in enterprise risk assessments.',
      ),
      QuizQuestion(
        question: 'In the Threat -> Vulnerability -> Exploit -> Risk relationship, what does an "exploit" specifically refer to?',
        options: [
          'A weakness in software or hardware',
          'The mechanism or technique used to actually take advantage of a vulnerability',
          'The probability and impact of a successful attack',
          'Any circumstance capable of causing harm',
        ],
        correctIndex: 1,
        explanation: 'An exploit is the actual code, script, or technique that takes advantage of a vulnerability — distinct from the vulnerability itself.',
      ),
      QuizQuestion(
        question: 'In the Equifax breach, what was the actual vulnerability that attackers exploited?',
        options: [
          'A zero-day in Equifax\'s own custom software',
          'A known, unpatched vulnerability in the Apache Struts framework, despite a patch having been available for months',
          'A phishing email sent to Equifax employees',
          'A weak default administrator password',
        ],
        correctIndex: 1,
        explanation: 'The Apache Struts vulnerability had a patch available months before the breach — the systems simply weren\'t updated in time.',
      ),
      QuizQuestion(
        question: 'Which threat actor category is primarily motivated by espionage and typically has very high skill levels and significant funding?',
        options: ['Script kiddies', 'Hacktivists', 'Nation-state actors', 'Insider threats'],
        correctIndex: 2,
        explanation: 'Nation-state actors are government-sponsored, well-funded, and typically pursue long-term intelligence objectives.',
      ),
      QuizQuestion(
        question: 'What distinguishes a "negligent insider" from a "malicious insider"?',
        options: [
          'Negligent insiders never cause any real harm',
          'Negligent insiders unintentionally expose sensitive information through poor practices, while malicious insiders deliberately misuse access',
          'They are the same category with different names',
          'Malicious insiders always have their credentials stolen',
        ],
        correctIndex: 1,
        explanation: 'Negligent insiders cause harm unintentionally; malicious insiders deliberately misuse their authorized access.',
      ),
      QuizQuestion(
        question: 'A "compromised insider" refers to which situation?',
        options: [
          'An employee who deliberately sabotages a system',
          'A legitimate user whose credentials have been stolen or whose device has been infected with malware',
          'A contractor with no system access at all',
          'A nation-state actor posing as an employee',
        ],
        correctIndex: 1,
        explanation: 'Compromised insiders are legitimate users whose access has been taken over by an outside attacker, without the user necessarily doing anything malicious themselves.',
      ),
      QuizQuestion(
        question: 'What has Ransomware-as-a-Service (RaaS) done to the cybercrime landscape?',
        options: [
          'Made ransomware attacks significantly rarer',
          'Significantly lowered the barrier to entry, letting less-skilled criminals launch sophisticated ransomware attacks',
          'Eliminated the need for organized crime groups entirely',
          'Made ransomware exclusively a nation-state tool',
        ],
        correctIndex: 1,
        explanation: 'RaaS lets less technically skilled attackers rent sophisticated ransomware capability, expanding who can carry out these attacks.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of the MITRE ATT&CK framework?',
        options: [
          'To predict future zero-day vulnerabilities',
          'To document real-world adversary tactics and techniques based on actually observed incidents',
          'To replace the need for a SIEM entirely',
          'To generate CVE identifiers',
        ],
        correctIndex: 1,
        explanation: 'ATT&CK is an evidence-based knowledge base of real observed attacker behavior, not a theoretical model.',
      ),
      QuizQuestion(
        question: 'What is the correct order of the Cyber Kill Chain\'s first three stages?',
        options: [
          'Delivery, Reconnaissance, Weaponization',
          'Reconnaissance, Weaponization, Delivery',
          'Weaponization, Delivery, Reconnaissance',
          'Installation, Reconnaissance, Delivery',
        ],
        correctIndex: 1,
        explanation: 'The Kill Chain begins with Reconnaissance, followed by Weaponization, then Delivery.',
      ),
      QuizQuestion(
        question: 'In the Cyber Kill Chain, what happens during the "Installation" stage?',
        options: [
          'The attacker gathers intelligence on the target',
          'The attacker establishes persistence — a backdoor or remote access trojan that survives a reboot',
          'The attacker achieves their final objective',
          'The payload is first delivered to the victim',
        ],
        correctIndex: 1,
        explanation: 'Installation is specifically about establishing durable, persistent access after successful exploitation.',
      ),
      QuizQuestion(
        question: 'Which password attack specifically tries one commonly used password against many different user accounts, rather than many passwords against one account?',
        options: ['Brute force', 'Dictionary attack', 'Password spraying', 'Rainbow table attack'],
        correctIndex: 2,
        explanation: 'Password spraying spreads attempts across many accounts specifically to avoid triggering per-account lockout thresholds.',
      ),
      QuizQuestion(
        question: 'What made the SolarWinds attack particularly effective at reaching so many organizations at once?',
        options: [
          'A phishing campaign sent to every victim individually',
          'Attackers compromised the software build process itself, distributing malicious code through a trusted, legitimately signed software update',
          'A brute-force attack against every victim\'s VPN',
          'A publicly known, unpatched vulnerability',
        ],
        correctIndex: 1,
        explanation: 'SolarWinds was a supply chain attack — the malicious code rode in through a trusted update mechanism rather than attacking each victim directly.',
      ),
      QuizQuestion(
        question: 'What does a CVE identifier actually tell you about a vulnerability?',
        options: [
          'Exactly how severe the vulnerability is',
          'A standardized, unique reference so the same vulnerability can be consistently identified — severity is determined separately',
          'The exact patch release date',
          'Which threat actor discovered it',
        ],
        correctIndex: 1,
        explanation: 'CVE provides a common naming/reference system; it does not by itself indicate severity, which CVSS handles separately.',
      ),
      QuizQuestion(
        question: 'A vulnerability with a CVSS score of 9.5 falls into which severity category?',
        options: ['Low', 'Medium', 'High', 'Critical'],
        correctIndex: 3,
        explanation: 'Scores from 9.0-10.0 are rated Critical, warranting immediate response.',
      ),
      QuizQuestion(
        question: 'Why are zero-day vulnerabilities particularly dangerous?',
        options: [
          'They are always less severe than known vulnerabilities',
          'Traditional antivirus signatures may not detect them and no patch exists yet, since the vendor doesn\'t know about the flaw',
          'They only affect operating systems, never applications',
          'They are exclusively used by script kiddies',
        ],
        correctIndex: 1,
        explanation: 'Zero-days are unknown to the vendor, meaning no patch or signature exists yet to catch them.',
      ),
      QuizQuestion(
        question: 'In the Vulnerability Management Lifecycle, what happens during the "Verification" step?',
        options: [
          'Assets are discovered for the first time',
          'Systems are rescanned after remediation to confirm the vulnerability was actually fixed',
          'Vulnerabilities are prioritized by CVSS score',
          'Threat intelligence is gathered',
        ],
        correctIndex: 1,
        explanation: 'Verification confirms remediation genuinely worked, rather than assuming a fix was successful without checking.',
      ),
      QuizQuestion(
        question: 'What made the Log4Shell vulnerability so widely impactful?',
        options: [
          'It only affected one specific vendor\'s product',
          'It existed in a small, widely-reused logging library embedded within thousands of different applications across the industry',
          'It required physical access to exploit',
          'It was immediately patched before any exploitation occurred',
        ],
        correctIndex: 1,
        explanation: 'Log4j\'s use as a common dependency across countless applications meant one flaw created a massive, simultaneous industry-wide remediation challenge.',
      ),
      QuizQuestion(
        question: 'What does "risk-based vulnerability management" prioritize that traditional approaches often miss?',
        options: [
          'The total count of vulnerabilities found, regardless of context',
          'Business criticality, data sensitivity, internet exposure, and active exploit availability — not just raw vulnerability counts',
          'Only vulnerabilities discovered in the last 24 hours',
          'Exclusively vulnerabilities rated Critical by CVSS',
        ],
        correctIndex: 1,
        explanation: 'Risk-based approaches weigh actual business context and exploitability, not simply how many vulnerabilities exist.',
      ),
      QuizQuestion(
        question: 'Why should defensive strategies be tailored to an organization\'s specific threat profile, rather than applying generic defenses everywhere?',
        options: [
          'Generic defenses are always sufficient regardless of organization type',
          'Different organizations face different realistic threats — a hospital may prioritize ransomware resilience while a defense contractor focuses on nation-state IP theft',
          'Tailored defenses are always more expensive with no added benefit',
          'Threat profiles never actually differ between organizations',
        ],
        correctIndex: 1,
        explanation: 'Effective security accounts for an organization\'s realistic, specific threat landscape rather than assuming one-size-fits-all defenses.',
      ),
    ],
  ),
];
