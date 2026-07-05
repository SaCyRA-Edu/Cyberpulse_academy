import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> incidentResponseLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Incident Response',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'The Objective of Incident Response',
        body:
            'Incident response is the structured, disciplined process an '
            'organization follows once a security incident is confirmed '
            'or strongly suspected. Its objective isn\'t simply "make the '
            'problem go away" — it\'s to contain damage quickly, '
            'eradicate the actual root cause rather than just the '
            'visible symptom, restore normal operations safely, and '
            'improve the organization\'s defenses so the same gap '
            'doesn\'t allow a repeat incident later.',
      ),
      LessonSection(
        heading: 'The Process, at a Glance',
        body:
            'You were introduced to a six-stage version of this process '
            'in the SOC Operations module: preparation, identification, '
            'containment, eradication, recovery, and lessons learned. '
            'This module goes considerably deeper, examining a more '
            'detailed seven-phase model, building an actual incident '
            'response team, applying formal root cause analysis, '
            'training and testing the process itself, and proactive '
            'threat hunting — all covered across the lessons ahead.',
      ),
      LessonSection(
        heading: 'Threat Hunting and Digital Forensics, Briefly',
        body:
            'Two closely related disciplines support incident response '
            'directly. Threat hunting, covered in full depth in the '
            'final lesson of this module, proactively searches for signs '
            'of compromise that automated detection may have missed '
            'entirely, often surfacing incidents before they\'d otherwise '
            'be detected reactively. Digital forensics, covered in depth '
            'in the Capstone module, provides the rigorous evidence '
            'collection and analysis methodology an investigation '
            'depends on, particularly for incidents with legal or '
            'regulatory consequences.',
      ),
      LessonSection(
        heading: 'A Specific Incident, Walked Through',
        body:
            'Consider a mid-sized company that discovers, on a Monday '
            'morning, that several finance department file shares are '
            'suddenly encrypted with a ransomware note demanding '
            'payment.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Detected Friday Night', 'Contained by Isolating VLAN', 'Eradicated Malware & Backdoor', 'Recovered From Clean Backup', 'Lessons Learned Review'],
          caption:
              'The actual encryption was noticed Monday morning, but the '
              'initial compromise — discovered during investigation — '
              'had occurred the previous Friday night, when far fewer '
              'staff were monitoring systems.',
        ),
      ),
      LessonSection(
        heading: 'What This Example Illustrates',
        body:
            'Notice that containment happened before eradication was '
            'complete — the affected network segment was isolated '
            'immediately to stop the ransomware from spreading further, '
            'even before the team fully understood how the attacker '
            'originally got in. Only after containment bought time did '
            'the team investigate thoroughly enough to find and remove '
            'the actual backdoor the attacker had planted, restore from '
            'a backup confirmed to predate the compromise, and finally '
            'hold a lessons-learned review that led to enabling MFA on '
            'the remote access service the attacker had actually used to '
            'get in initially.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Incident Response Process',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'The Seven-Phase Model',
        body:
            'While the SOC Operations module covered a six-stage '
            'version of incident response, many formal frameworks '
            '(including NIST\'s guidance) separate detection and '
            'analysis into two distinct phases, producing a more '
            'detailed seven-phase model.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Preparation', 'Detection', 'Analysis', 'Containment', 'Eradication', 'Recovery', 'Post-Incident Activity'],
          caption:
              'Separating Detection from Analysis emphasizes that '
              'noticing something unusual and actually understanding '
              'what it means are genuinely distinct steps, each '
              'requiring different skills and time.',
        ),
      ),
      LessonSection(
        heading: 'Preparation',
        body:
            'Everything done before an incident occurs: building '
            'playbooks for likely scenarios, ensuring logging and '
            'monitoring tools are actually in place and working, '
            'establishing communication plans, and training the team. '
            'An organization that only begins thinking about incident '
            'response once an incident is already underway starts from '
            'a severe, entirely avoidable disadvantage.',
      ),
      LessonSection(
        heading: 'Detection',
        body:
            'The moment an anomaly or potential indicator of compromise '
            'is actually noticed — through a SIEM alert, a user report, '
            'or an external notification. Detection alone doesn\'t yet '
            'confirm whether something is a genuine incident; it simply '
            'flags something worth examining further.',
      ),
      LessonSection(
        heading: 'Analysis',
        body:
            'Determining whether a detected anomaly is genuinely a '
            'security incident, and if so, understanding its scope, '
            'severity, and likely root cause well enough to make an '
            'informed containment decision. Rushing past analysis '
            'straight to containment risks either overreacting to a '
            'false alarm or under-responding to something more serious '
            'than it first appeared.',
      ),
      LessonSection(
        heading: 'Containment, Eradication, and Recovery',
        body:
            'These three phases work the same way covered in the SOC '
            'Operations module: containment stops the spread without '
            'yet fully removing the threat, eradication removes the '
            'actual root cause, and recovery restores normal operations '
            'only after eradication is genuinely confirmed complete.',
      ),
      LessonSection(
        heading: 'Post-Incident Activity',
        body:
            'This phase encompasses more than the "lessons learned" '
            'label from the simpler six-stage model suggests — it '
            'includes formal root cause analysis (covered in full depth '
            'in the next lesson), updating playbooks and detection rules '
            'based on what was actually learned, any required regulatory '
            'or legal reporting, and communicating outcomes to affected '
            'stakeholders and leadership.',
      ),
      LessonSection(
        heading: 'Building an Effective Incident Response Team',
        bullets: [
          'Incident Commander — owns the overall response, makes final decisions, and coordinates across every other role',
          'Technical leads — hands-on analysts and engineers actually investigating, containing, and eradicating the threat',
          'Communications lead — manages internal updates to leadership and, where necessary, external communication to customers, regulators, or the public',
          'Legal counsel — advises on regulatory reporting obligations, evidence handling, and liability considerations',
          'Executive sponsor — ensures the team has the authority and resources needed to act decisively without unnecessary delay',
        ],
      ),
      LessonSection(
        heading: 'Why Clear Roles Matter So Much Under Pressure',
        body:
            'During an actual, high-pressure incident, ambiguity about '
            'who\'s actually in charge of a given decision wastes '
            'precious time and can lead to conflicting, uncoordinated '
            'actions. Defining these roles clearly during the '
            'Preparation phase — well before any real incident occurs — '
            'is exactly what lets a team move quickly and cohesively '
            'once one actually happens, restoring normal operations far '
            'faster than an ad-hoc response ever could.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Root Cause Analysis',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Why Root Cause Analysis Matters',
        body:
            'Fixing the immediate symptom of an incident — restoring '
            'encrypted files from backup, resetting a compromised '
            'password — doesn\'t actually prevent the same type of '
            'incident from happening again if the underlying root cause '
            'that allowed it in the first place is never identified and '
            'addressed. Root cause analysis is the structured process of '
            'digging past the visible symptom to find and fix that '
            'actual underlying cause.',
      ),
      LessonSection(
        heading: 'A Four-Step, No-Blame Process',
        body:
            'Effective root cause analysis deliberately avoids assigning '
            'individual blame, since a blame-focused process makes '
            'people defensive and less forthcoming with the honest '
            'details an accurate analysis actually depends on.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Define Scope', 'Identify Causes', 'Implement Solutions', 'Track Results'],
          caption:
              'A no-blame approach focuses on the process and the system '
              'that allowed the incident, not on individual fault — '
              'this is what makes the analysis genuinely honest and '
              'useful.',
        ),
      ),
      LessonSection(
        heading: 'Define Scope',
        body:
            'Clearly establish exactly what happened, when, and which '
            'systems and data were actually affected — a precise, '
            'factual scope prevents the analysis from either missing '
            'genuinely relevant details or wasting time on unrelated '
            'tangents.',
      ),
      LessonSection(
        heading: 'Identify Causes',
        body:
            'Work backward from the visible symptom through each '
            'contributing factor, repeatedly asking "why did this '
            'happen?" until reaching the genuine underlying cause rather '
            'than stopping at the first, most obvious explanation. A '
            'technique called the "Five Whys" — literally asking "why" '
            'five times in sequence, each answer prompting the next '
            'question — is a simple, effective way to consistently push '
            'past a superficial explanation.',
      ),
      LessonSection(
        heading: 'Implement Solutions',
        body:
            'Address the actual root cause identified, not merely the '
            'symptom that first drew attention to the incident. A '
            'genuine fix targets the underlying gap in process, '
            'technology, or training that allowed the incident to '
            'happen in the first place.',
      ),
      LessonSection(
        heading: 'Track Results',
        body:
            'Confirm, over time, that the implemented solution actually '
            'prevents recurrence — root cause analysis isn\'t complete '
            'the moment a fix is deployed; it requires following up to '
            'verify the fix genuinely worked in practice, echoing the '
            'validation principle from the Alerts and Monitoring module.',
      ),
      LessonSection(
        heading: 'Applied Example: Malware From a USB Device',
        body:
            'The symptom: an employee\'s laptop was infected with '
            'malware after they plugged in a USB drive found in a '
            'parking lot. A surface-level fix might simply reimage that '
            'one laptop. Root cause analysis digs further: why was '
            'autorun still enabled on company laptops? Why did endpoint '
            'protection fail to catch the malware once it executed? Why '
            'hadn\'t staff been trained on the USB drop attack technique '
            'covered in the Threat Actors module? The actual '
            'implemented solutions address all three — disabling '
            'autorun company-wide, tuning endpoint detection rules, and '
            'adding this specific scenario to security awareness '
            'training — rather than just reimaging one laptop and moving '
            'on.',
      ),
      LessonSection(
        heading: 'Applied Example: A Successful Phishing Attack',
        body:
            'The symptom: an employee clicked a phishing link and '
            'entered their credentials on a fake login page. Root cause '
            'analysis asks: why did the phishing email reach the '
            'employee\'s inbox at all — was email authentication '
            'properly configured? Why did the employee not recognize the '
            'red flags — when was their last phishing awareness training '
            'actually completed? Why did the stolen credentials alone '
            'grant meaningful access — was MFA actually enforced on that '
            'account? Each answer points to a genuinely different '
            'solution, and addressing only one of them, without the '
            'others, would leave the organization exposed to the exact '
            'same type of incident recurring through one of the '
            'remaining gaps.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Incident Response Training and Testing',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Why Being Ready Matters More Than Having a Plan on Paper',
        body:
            'A written incident response plan that has never actually '
            'been practiced is a false sense of security — the first '
            'time a plan gets genuinely tested shouldn\'t be during a '
            'real, high-pressure incident, when gaps in the plan or the '
            'team\'s familiarity with it become expensive discoveries '
            'rather than useful learning.',
      ),
      LessonSection(
        heading: 'Tabletop Exercises',
        body:
            'A tabletop exercise walks the incident response team '
            'through a realistic, simulated scenario purely through '
            'discussion — no actual systems are touched or affected. '
            'Facilitators present an evolving situation ("your SIEM just '
            'flagged unusual outbound traffic from your finance server '
            'at 2 AM — what do you do first?") and the team talks '
            'through their actual response step by step, revealing gaps '
            'in the plan, unclear roles, or missing capabilities without '
            'any real operational risk.',
      ),
      LessonSection(
        heading: 'Red/Blue Team Simulations',
        body:
            'As covered in the Capstone module, a red team simulates a '
            'real adversary attacking live systems, while the blue team '
            '(the actual defenders) must detect and respond in real '
            'time, without knowing in advance exactly what\'s coming or '
            'when. This tests not just the plan itself, but the team\'s '
            'actual detection tooling and real-world response speed '
            'under genuine, unscripted pressure.',
      ),
      LessonSection(
        heading: 'Penetration Tests',
        body:
            'Also covered in the Capstone module, a penetration test '
            'provides comprehensive technical coverage of a defined '
            'scope, primarily focused on finding exploitable '
            'vulnerabilities. In the context of incident response '
            'readiness specifically, a penetration test can validate '
            'whether the vulnerabilities it discovers would actually '
            'trigger detection and an appropriate response if a real '
            'attacker had found and exploited them first.',
      ),
      LessonSection(
        heading: 'Aligning Testing With Threat Landscape and Risk Profile',
        body:
            'Not every organization needs to test against every '
            'possible scenario with equal intensity. A hospital should '
            'specifically rehearse ransomware scenarios given the '
            'sector\'s well-documented exposure; a company handling '
            'large volumes of payment card data should specifically '
            'test scenarios involving payment system compromise. '
            'Testing scenarios should be chosen deliberately based on '
            'the realistic threat actors and motivations most relevant '
            'to that specific organization, exactly as covered in the '
            'Threat Actors module — not selected arbitrarily or copied '
            'unchanged from a generic industry template.',
      ),
      LessonSection(
        heading: 'Capturing Lessons Learned to Actually Train Staff',
        body:
            'Every tabletop exercise, simulation, and penetration test '
            'should produce concrete lessons that genuinely feed back '
            'into staff training and playbook updates — a gap revealed '
            'during a tabletop exercise (say, nobody on the team knew '
            'how to actually isolate a specific cloud resource) is '
            'exactly the kind of finding that should drive very '
            'specific, targeted follow-up training, rather than a '
            'generic note filed away and forgotten.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Threat Hunting',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Proactive Detection, Not Reactive Waiting',
        body:
            'As introduced briefly in the SOC Operations module, threat '
            'hunting flips the usual detection model on its head — '
            'rather than waiting for an automated alert to fire, threat '
            'hunters actively and deliberately search for signs of '
            'compromise that existing detection may have already missed '
            'entirely.',
      ),
      LessonSection(
        heading: 'Forming a Hypothesis',
        body:
            'Effective threat hunting starts with a specific, testable '
            'hypothesis rather than an unfocused, open-ended search '
            'through everything at once. A hypothesis might be built '
            'from threat modeling (covered in the Capstone module — '
            '"if an attacker wanted to exfiltrate our customer database, '
            'what would that activity actually look like in our '
            'logs?") or from current threat intelligence (covered in the '
            'SOC Operations module — "a new TTP was just publicly '
            'reported affecting our specific software stack; does '
            'evidence of it exist anywhere in our environment already?").',
      ),
      LessonSection(
        heading: 'Testing the Hypothesis',
        body:
            'Once a specific hypothesis is formed, the hunter '
            'systematically analyzes logs, running processes, and '
            'network activity — typically through the same SIEM '
            'platform covered in the Alerts and Monitoring module — '
            'specifically looking for evidence that would either '
            'confirm or rule out that hypothesis.',
      ),
      LessonSection(
        heading: 'What a Successful Hunt Actually Uncovers',
        body:
            'A successful hunt doesn\'t necessarily end with "found an '
            'active attacker" every time — just as valuably, it might '
            'uncover a previously unknown TTP being used against the '
            'organization, or a new Indicator of Compromise (IoC) that '
            'existing detection rules didn\'t yet cover. Either outcome '
            'directly feeds back into strengthening automated detection '
            'going forward, exactly the same detection-engineering '
            'feedback loop covered in the SOC Operations module\'s Tier 3 '
            'analyst discussion.',
      ),
      LessonSection(
        heading: 'Why Threat Hunting Requires Genuine Expertise',
        body:
            'Unlike Tier 1 alert triage, which follows relatively '
            'structured, repeatable steps, threat hunting demands deep '
            'familiarity with what normal activity actually looks like '
            'across an environment, strong technical skill in log and '
            'process analysis, and genuine creativity in forming '
            'hypotheses worth actually investigating — which is exactly '
            'why it\'s typically a Tier 3 or dedicated specialist '
            'function rather than something every analyst is expected to '
            'do as part of routine daily work.',
      ),
      LessonSection(
        heading: 'How Threat Hunting Connects Back to This Entire Module',
        body:
            'Threat hunting is, in many ways, the most proactive possible '
            'expression of incident response readiness — rather than '
            'waiting for the Detection phase of the seven-phase model to '
            'trigger reactively, a successful hunt can surface an '
            'incident\'s existence well before any automated alert ever '
            'would have, giving the response team a genuine head start '
            'on containment before the compromise has had time to '
            'spread further or cause additional damage.',
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
        question: 'What is the primary objective of incident response?',
        options: [
          'To assign blame for the incident',
          'To contain damage, eradicate the root cause, restore operations safely, and improve defenses against recurrence',
          'To immediately notify the media',
          'To disable all systems permanently',
        ],
        correctIndex: 1,
        explanation: 'Incident response aims to contain, eradicate, recover, and improve — not simply make symptoms disappear.',
      ),
      QuizQuestion(
        question: 'In the seven-phase incident response model, what is the key distinction between Detection and Analysis?',
        options: [
          'They are the same phase with two names',
          'Detection is noticing something unusual; Analysis is determining whether it is genuinely an incident and understanding its scope',
          'Analysis always comes before Detection',
          'Detection only applies to network traffic',
        ],
        correctIndex: 1,
        explanation: 'Detection flags something worth examining; Analysis determines what it actually means and how severe it is.',
      ),
      QuizQuestion(
        question: 'In the ransomware example, why was the affected network segment isolated before the team fully understood how the attacker got in?',
        options: [
          'Isolation is never appropriate before full understanding',
          'Containment can and should happen before eradication is complete, to stop the spread while investigation continues',
          'The team had already completed eradication',
          'Isolating a segment always destroys forensic evidence',
        ],
        correctIndex: 1,
        explanation: 'Containment stops the spread immediately; deeper investigation and eradication can continue afterward.',
      ),
      QuizQuestion(
        question: 'What role does the Incident Commander play on an incident response team?',
        options: [
          'Only handles media communication',
          'Owns the overall response, makes final decisions, and coordinates across every other role',
          'Provides legal advice exclusively',
          'Only performs technical malware analysis',
        ],
        correctIndex: 1,
        explanation: 'The Incident Commander coordinates the entire response and has final decision-making authority.',
      ),
      QuizQuestion(
        question: 'Why does root cause analysis deliberately avoid assigning individual blame?',
        options: [
          'Blame is legally required to be avoided',
          'A blame-focused process makes people defensive and less forthcoming with the honest details the analysis depends on',
          'Blame makes the analysis faster',
          'No incident ever has an individual cause',
        ],
        correctIndex: 1,
        explanation: 'A no-blame approach encourages honesty, which is essential for accurately identifying the true root cause.',
      ),
      QuizQuestion(
        question: 'What are the four steps of root cause analysis, in order?',
        options: [
          'Identify Causes, Define Scope, Track Results, Implement Solutions',
          'Define Scope, Identify Causes, Implement Solutions, Track Results',
          'Implement Solutions, Define Scope, Track Results, Identify Causes',
          'Track Results, Implement Solutions, Identify Causes, Define Scope',
        ],
        correctIndex: 1,
        explanation: 'The correct order is Define Scope, Identify Causes, Implement Solutions, Track Results.',
      ),
      QuizQuestion(
        question: 'The "Five Whys" technique is used during root cause analysis to:',
        options: [
          'Assign blame to five different people',
          'Repeatedly ask why until reaching the genuine underlying cause rather than stopping at the first explanation',
          'Determine the five most affected systems',
          'Calculate the financial cost of an incident',
        ],
        correctIndex: 1,
        explanation: 'The Five Whys technique pushes past superficial explanations to find the true root cause.',
      ),
      QuizQuestion(
        question: 'In the USB malware root cause example, why was simply reimaging the affected laptop insufficient?',
        options: [
          'Reimaging is never an appropriate remediation step',
          'It addressed only the symptom, not the underlying gaps (autorun enabled, detection tuning, missing training) that allowed the incident',
          'Reimaging always makes systems less secure',
          'The laptop could not technically be reimaged',
        ],
        correctIndex: 1,
        explanation: 'A surface-level fix leaves the underlying causes unaddressed, risking recurrence through the same gaps.',
      ),
      QuizQuestion(
        question: 'What is a tabletop exercise?',
        options: [
          'A live attack simulation against production systems',
          'A discussion-based walkthrough of a simulated incident scenario, with no actual systems touched',
          'A type of penetration test',
          'A physical security audit',
        ],
        correctIndex: 1,
        explanation: 'Tabletop exercises test the plan and team readiness purely through discussion, without operational risk.',
      ),
      QuizQuestion(
        question: 'How does a red/blue team simulation differ from a tabletop exercise?',
        options: [
          'They are identical in every way',
          'A red/blue simulation involves a real simulated adversary attacking live systems while the blue team must detect and respond in real time',
          'Red/blue simulations never involve any technical systems',
          'Tabletop exercises always involve more risk',
        ],
        correctIndex: 1,
        explanation: 'Red/blue simulations test real detection tooling and response speed under genuine, unscripted pressure.',
      ),
      QuizQuestion(
        question: 'Why should incident response testing scenarios be chosen based on an organization\'s specific threat landscape and risk profile?',
        options: [
          'All organizations face identical realistic threats',
          'Testing scenarios should reflect the threat actors and motivations most realistic for that specific organization, not a generic template',
          'Testing scenarios have no relationship to actual risk',
          'Generic templates are always more effective',
        ],
        correctIndex: 1,
        explanation: 'Testing should be informed by the organization\'s actual, realistic risk profile rather than arbitrary selection.',
      ),
      QuizQuestion(
        question: 'What does threat hunting fundamentally change about the usual detection model?',
        options: [
          'Nothing — it is identical to waiting for automated alerts',
          'It proactively searches for signs of compromise that existing detection may have already missed, rather than waiting for an alert',
          'It only works after an incident has already been confirmed',
          'It replaces the need for a SIEM entirely',
        ],
        correctIndex: 1,
        explanation: 'Threat hunting is proactive, searching for compromise before automated detection would necessarily catch it.',
      ),
      QuizQuestion(
        question: 'What does an effective threat hunt typically start with?',
        options: [
          'A completely unfocused, open-ended search through all available data',
          'A specific, testable hypothesis built from threat modeling or threat intelligence',
          'A random selection of log files',
          'A formal legal request',
        ],
        correctIndex: 1,
        explanation: 'Effective hunts are hypothesis-driven, targeting a specific, testable idea rather than searching everything at once.',
      ),
      QuizQuestion(
        question: 'Why is threat hunting typically a Tier 3 or specialist function rather than routine Tier 1 work?',
        options: [
          'It requires no technical skill at all',
          'It demands deep familiarity with normal activity, strong analysis skill, and creativity in forming hypotheses worth investigating',
          'It is always fully automated',
          'Tier 1 analysts are prohibited from viewing logs',
        ],
        correctIndex: 1,
        explanation: 'Threat hunting requires deeper expertise and judgment than the more structured, repeatable Tier 1 triage process.',
      ),
      QuizQuestion(
        question: 'What is one valuable outcome of a threat hunt, even if no active attacker is found?',
        options: [
          'No value exists unless an active attacker is found',
          'Uncovering a previously unknown TTP or a new IoC that existing detection rules did not yet cover, improving future detection',
          'It always confirms the SIEM is misconfigured',
          'It automatically triggers a red team exercise',
        ],
        correctIndex: 1,
        explanation: 'New TTPs or IoCs discovered during a hunt feed back into strengthening automated detection going forward.',
      ),
    ],
  ),
];
