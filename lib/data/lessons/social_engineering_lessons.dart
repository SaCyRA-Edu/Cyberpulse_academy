import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> socialEngineeringLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Social Engineering',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Attacking the Human, Not the Machine',
        body:
            'Every technical control covered elsewhere in this course — '
            'firewalls, encryption, MFA — exists to stop an attacker who '
            'is trying to break through technology. Social engineering '
            'takes a completely different approach: rather than '
            'attacking a system, it attacks the person operating it, '
            'using psychological manipulation to convince someone to '
            'voluntarily hand over access, information, or trust that '
            'no technical exploit could obtain on its own.',
      ),
      LessonSection(
        heading: 'The Human-Based Attack Vectors in This Module',
        bullets: [
          'Phishing — deceptive messages designed to harvest credentials or deliver malware',
          'Impersonation — posing as a trusted person, brand, or website to manipulate a target',
          'Pretexting — fabricating a plausible scenario to extract information or access',
          'Typosquatting — registering near-identical domains to catch mistyped URLs or deceive at a glance',
          'Brand impersonation — mimicking a trusted company\'s look and communication style',
        ],
      ),
      LessonSection(
        heading: 'Why These Attacks Work So Consistently',
        body:
            'Social engineering succeeds because it exploits normal, '
            'healthy human tendencies — trusting apparent authority, '
            'wanting to help a colleague, responding to urgency — rather '
            'than a flaw that can simply be patched. No firewall update '
            'makes a person less likely to want to be helpful when '
            'someone claiming to be from IT asks for a quick favor. This '
            'is exactly why social engineering remains effective even '
            'against organizations with mature technical security, and '
            'why defending against it requires a fundamentally different '
            'kind of control.',
      ),
      LessonSection(
        heading: 'Security Awareness Training',
        body:
            'Structured, ongoing training that teaches employees to '
            'recognize the patterns behind social engineering — urgency, '
            'unusual requests, subtle inconsistencies — rather than '
            'memorizing a fixed list of known scams. Effective training '
            'is continuous and practical rather than a single annual '
            'slideshow, since attacker techniques and pretexts evolve '
            'constantly.',
      ),
      LessonSection(
        heading: 'Anti-Phishing Campaigns',
        body:
            'Controlled, internally run simulated phishing exercises '
            'that send realistic but harmless fake phishing emails to '
            'employees, measuring who clicks, who reports it, and using '
            'the results to target further training where it\'s '
            'actually needed rather than applying the same generic '
            'training to everyone regardless of demonstrated risk.',
      ),
      LessonSection(
        heading: 'The Broader Goal: Preventing Fraud, Scams & Misinformation',
        body:
            'Social engineering defenses ultimately protect against '
            'three overlapping harms: direct fraud and financial scams, '
            'unauthorized access obtained through deception, and the '
            'spread of misinformation when an attacker successfully '
            'impersonates a trusted source. The lessons ahead in this '
            'module examine each specific technique in depth — how it '
            'works, real examples of it succeeding, and concretely how '
            'to defend against it.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Impersonation',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Impersonation as the Engine Behind Social Engineering',
        body:
            'Nearly every social engineering technique relies on '
            'impersonation in some form — pretending to be someone or '
            'something the target already trusts, then leveraging that '
            'borrowed trust to extract information, access, or money. '
            'Understanding its four common forms makes it much easier to '
            'recognize an attack in progress, even when the specific '
            'pretext is one you\'ve never seen before.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.impersonationForms),
      ),
      LessonSection(
        heading: 'Impersonation (Posing as a Person)',
        body:
            'An attacker directly pretends to be a specific individual '
            '— a new employee, a vendor representative, an executive, '
            'or an IT support technician — typically over phone, email, '
            'or in person. A real-world example: an attacker calls a '
            'company\'s help desk claiming to be a traveling executive '
            'who has been locked out of their account, applying time '
            'pressure and a plausible cover story to convince a support '
            'agent to reset the password without following standard '
            'identity verification steps.',
      ),
      LessonSection(
        heading: 'Brand Impersonation',
        body:
            'Rather than impersonating a person, the attacker mimics a '
            'trusted company\'s branding, tone, and communication style '
            '— a fake email that looks exactly like it came from a '
            'well-known bank, complete with matching logos and color '
            'scheme, asking the recipient to "verify their account." '
            'Because the visual trust cues match a brand the victim '
            'already trusts, brand impersonation frequently bypasses '
            'the skepticism a less polished, generic scam would '
            'trigger.',
      ),
      LessonSection(
        heading: 'Typosquatting',
        body:
            'An attacker registers a domain visually near-identical to '
            'a legitimate one — swapping a single letter, adding an '
            'extra character, or using a different top-level domain — '
            'hoping to catch users who mistype a URL or don\'t look '
            'closely at a link in an email. "arnazon.com" instead of '
            '"amazon.com" is a classic example; at a quick glance, '
            'especially on a small mobile screen, the substitution is '
            'easy to miss entirely.',
      ),
      LessonSection(
        heading: 'Watering Hole Attacks',
        body:
            'Rather than attacking a target directly, the attacker '
            'compromises a legitimate, trusted website that the target '
            'population is already known to visit regularly — an '
            'industry forum, a vendor\'s support portal — planting '
            'malware there and waiting for the intended victims to '
            'visit on their own. This flips the usual phishing model: '
            'instead of luring the target to a fake site, the attacker '
            'poisons a real site the target already trusts and visits '
            'voluntarily.',
      ),
      LessonSection(
        heading: 'How Organizations Mitigate Impersonation',
        bullets: [
          'Security awareness training — teaching staff to independently verify identity through a separate channel rather than trusting a claimed identity at face value',
          'Secure email gateways — filtering technology that inspects sender domains, attachment content, and known-malicious indicators before a message ever reaches an inbox',
          'Threat intelligence — continuously monitoring for newly registered typosquatted domains and known brand-impersonation campaigns targeting the organization, allowing proactive takedown or blocking before an attack even launches',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Motivational Triggers',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'The Psychology Behind Every Successful Attack',
        body:
            'Social engineers don\'t rely on luck — they deliberately '
            'apply well-understood psychological triggers, the same '
            'ones studied in persuasion and marketing research, to push '
            'a target toward compliance faster than careful judgment '
            'can catch up. Recognizing these six triggers in the moment '
            'is one of the single most effective defenses available, '
            'because it works regardless of the specific pretext or '
            'channel being used.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.motivationalTriggers),
      ),
      LessonSection(
        heading: 'Authority',
        body:
            'People are conditioned to comply with requests from '
            'someone who appears to hold legitimate power or seniority '
            '— a manager, an executive, a police officer, an IT '
            'administrator. An email impersonating the CEO succeeds '
            'largely because employees are reluctant to question '
            'apparent authority, even when a request seems unusual.',
      ),
      LessonSection(
        heading: 'Urgency',
        body:
            'Framing a request as extremely time-sensitive — "this must '
            'happen in the next ten minutes" — deliberately removes the '
            'time a target would otherwise use to verify the request '
            'through a separate channel or simply think it through '
            'carefully.',
      ),
      LessonSection(
        heading: 'Social Proof',
        body:
            'Suggesting that other people have already complied '
            'increases a target\'s own willingness to comply — "the '
            'rest of your team has already updated their password '
            'through this link" makes an individual less likely to '
            'question a request that a group has apparently already '
            'accepted.',
      ),
      LessonSection(
        heading: 'Scarcity',
        body:
            'Framing something as limited or about to expire — "only '
            '3 licenses left" or "offer expires in one hour" — creates '
            'pressure to act immediately rather than pause to verify.',
      ),
      LessonSection(
        heading: 'Likability',
        body:
            'People are more easily persuaded by someone they find '
            'friendly, charming, or personally relatable. Attackers '
            'invest real effort in building rapport — a friendly, '
            'chatty tone on a phone call, referencing shared interests '
            '— before ever making the actual request.',
      ),
      LessonSection(
        heading: 'Fear',
        body:
            'Threatening a negative consequence — "your account will be '
            'suspended," "legal action will be taken" — triggers a '
            'stress response that measurably impairs careful, '
            'deliberate decision-making, pushing a target toward '
            'immediate compliance to make the threat go away.',
      ),
      LessonSection(
        heading: 'Recognizing Triggers in the Moment',
        body:
            'The most practical defense isn\'t memorizing every possible '
            'scam scenario — it\'s noticing when a message or call is '
            'deliberately applying one or more of these six triggers. '
            'Any communication combining urgency with a request for '
            'sensitive information or access is worth pausing on '
            'specifically because of that combination, regardless of '
            'how convincing the surrounding story sounds.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Pretexting',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'What Pretexting Actually Is',
        body:
            'Pretexting is the practice of fabricating a plausible, '
            'invented scenario — a "pretext" — to justify a request for '
            'information or access that would otherwise seem '
            'suspicious. A well-constructed pretext gives the target a '
            'believable reason to comply, often without ever feeling '
            'like they\'re doing anything risky.',
      ),
      LessonSection(
        heading: 'A Real-World Example, Step by Step',
        body:
            'An attacker calls a company\'s front desk, claiming to be a '
            'field technician from the copier maintenance vendor '
            'scheduled for a routine service visit. They ask the '
            'receptionist to confirm "which printer models are '
            'installed on-site and their IP addresses, so I can bring '
            'the correct replacement parts and configure them '
            'remotely before I arrive." The request sounds entirely '
            'reasonable and helpful — the receptionist has no obvious '
            'reason to refuse a routine-sounding logistics question — '
            'but the attacker has just obtained a map of internal '
            'network device names and addresses, valuable reconnaissance '
            'for a later, more serious attack.',
      ),
      LessonSection(
        heading: 'Why This Specific Example Works So Well',
        body:
            'The pretext is mundane and low-stakes on its surface — '
            'nobody feels like they\'re handing over anything sensitive '
            'when confirming printer models. It targets a role '
            '(reception) that\'s specifically trained to be helpful to '
            'callers and typically has no reason to expect this kind of '
            'social engineering. And it requests information that seems '
            'harmless in isolation but is genuinely valuable to an '
            'attacker doing network reconnaissance ahead of a more '
            'serious intrusion attempt.',
      ),
      LessonSection(
        heading: 'Other Common Pretexting Scenarios',
        bullets: [
          'A caller claiming to be from internal IT, asking an employee to "confirm" their password to fix a fabricated account issue',
          'Someone posing as a new employee\'s manager, asking a colleague to share files or access "since the new hire hasn\'t been set up in the system yet"',
          'An attacker posing as an auditor or compliance officer, requesting sensitive records under the pretext of a routine review',
        ],
      ),
      LessonSection(
        heading: 'Training Staff to Resist Pretexting',
        bullets: [
          'Verify identity independently — call back using a known, previously verified number, never one provided by the caller themselves',
          'Treat "small," seemingly harmless requests for internal details with the same scrutiny as an obviously sensitive one — reconnaissance value is often exactly why the request feels small',
          'Establish and follow a clear policy: certain categories of information (network details, account credentials, employee personal data) are never disclosed over an unverified phone call, no matter how legitimate the caller sounds',
          'Encourage a culture where politely declining or escalating a suspicious request is fully supported, not treated as unhelpful or obstructive',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Phishing Attacks',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'The Full Phishing Spectrum',
        bullets: [
          'Phishing — bulk, largely generic deception sent to many recipients, relying on volume since even a small success rate is profitable',
          'Spear phishing — a highly targeted, individually researched attack aimed at one specific person',
          'Whaling — spear phishing specifically aimed at executives or other especially high-value targets',
          'Business Email Compromise (BEC) — impersonating a trusted figure (often an executive or vendor) to request a fraudulent wire transfer or sensitive data',
          'Vishing — the same deceptive tactics conducted over live phone calls, increasingly enhanced with AI voice cloning',
          'Smishing — the same tactics delivered via SMS text messages instead of email',
        ],
      ),
      LessonSection(
        heading: 'How Fraudsters Actually Harvest Credentials',
        body:
            'The mechanics behind most phishing attacks are '
            'strikingly consistent regardless of which variant is used. '
            'A message creates urgency or curiosity, directs the '
            'recipient to click a link or open an attachment, and that '
            'link leads to a convincingly designed fake login page that '
            'captures whatever credentials are typed into it — or the '
            'attachment silently installs malware, such as a keylogger '
            'or a remote access trojan, that captures credentials '
            'directly from the compromised device going forward.',
      ),
      LessonSection(
        heading: 'A Real BEC Example',
        body:
            'An accounts payable clerk receives an email that appears '
            'to come from a long-standing vendor, referencing a real, '
            'currently outstanding invoice and requesting that future '
            'payments be sent to a "newly updated" bank account due to '
            'an internal reorganization at the vendor. Because the '
            'invoice reference is accurate and the request sounds like '
            'routine vendor administration, the payment is processed '
            'normally — and the money goes directly to the attacker\'s '
            'account instead of the real vendor\'s.',
      ),
      LessonSection(
        heading: 'Prevention: Technical Controls',
        bullets: [
          'Email authentication (SPF, DKIM, DMARC) — makes it harder for an attacker to convincingly spoof a trusted sending domain',
          'Link and attachment sandboxing — inspects and detonates suspicious content in an isolated environment before it ever reaches the recipient',
          'MFA on every account — ensures a harvested password alone isn\'t sufficient for an attacker to actually log in',
        ],
      ),
      LessonSection(
        heading: 'Prevention: Process Controls',
        bullets: [
          'Dual approval for wire transfers and any change to existing vendor payment details, above a defined threshold',
          'Mandatory verbal confirmation through a previously known phone number for any payment detail change — never a number provided in the request itself',
          'A clear, well-publicized reporting process so employees flag suspicious messages quickly, before a campaign can spread further',
        ],
      ),
      LessonSection(
        heading: 'Prevention: People',
        body:
            'Ultimately, every technical and process control above '
            'exists to buy time and reduce risk — the last line of '
            'defense remains a trained employee who notices something '
            'feels off and pauses before acting. Regular, realistic '
            'phishing simulations (introduced in this module\'s first '
            'lesson) are what keep that instinct sharp over time, rather '
            'than relying on a single training session delivered once a '
            'year.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Other Social Engineering Attacks',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Beyond Phishing and Pretexting',
        body:
            'Not every social engineering technique arrives as a message '
            'or a phone call. This lesson covers the remaining common '
            'techniques — several of which are entirely physical, '
            'exploiting proximity and everyday human courtesy rather '
            'than any digital channel at all.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.otherSocialEngineering),
      ),
      LessonSection(
        heading: 'Diversion Theft',
        body:
            'An attacker tricks a courier or delivery service into '
            'sending a legitimate shipment to the wrong destination — '
            'the attacker\'s own location — often by convincingly '
            'posing as an employee authorized to redirect the delivery. '
            'The goods themselves, or the sensitive information they '
            'might contain, end up in the wrong hands entirely.',
      ),
      LessonSection(
        heading: 'Hoaxes',
        body:
            'A fabricated threat or claim, spread to cause panic, '
            'wasted effort, or to manipulate behavior — a fake internal '
            'announcement about a security breach that pressures staff '
            'into "urgently" resetting credentials through an '
            'attacker-controlled link, exploiting the same panic a real '
            'breach notification would trigger.',
      ),
      LessonSection(
        heading: 'Shoulder Surfing',
        body:
            'Simply observing someone directly — over their shoulder in '
            'a coffee shop, on public transit, in a shared office — to '
            'capture a password being typed, a PIN being entered, or '
            'sensitive information visible on a screen. Low-tech, but '
            'still genuinely effective in public or crowded spaces.',
      ),
      LessonSection(
        heading: 'Dumpster Diving',
        body:
            'Physically searching through discarded trash for sensitive '
            'information — printed documents, old hard drives, sticky '
            'notes with passwords — that wasn\'t properly destroyed '
            'before disposal. Organizations that shred sensitive paper '
            'documents and securely wipe old storage media close off '
            'this vector entirely.',
      ),
      LessonSection(
        heading: 'Eavesdropping',
        body:
            'Listening in on a private conversation without '
            'authorization — overhearing a confidential business '
            'discussion in a public place, or intercepting a phone call '
            'or an unencrypted communication channel.',
      ),
      LessonSection(
        heading: 'Baiting',
        body:
            'Leaving an enticing physical item — most classically an '
            'infected USB drive labeled something curiosity-inducing '
            'like "Executive Salaries 2026" — somewhere a target is '
            'likely to find and plug in out of curiosity, at which point '
            'malware executes automatically.',
      ),
      LessonSection(
        heading: 'Piggybacking (and Tailgating)',
        body:
            'Following an authorized person through a secured door or '
            'checkpoint without presenting one\'s own credentials — '
            'sometimes with the authorized person\'s knowing cooperation '
            '(piggybacking) and sometimes without their awareness '
            'entirely (tailgating), simply slipping through behind them '
            'before the door closes.',
      ),
      LessonSection(
        heading: 'DNS Spoofing and Brand Impersonation, Revisited',
        body:
            'Two techniques from earlier in this module deserve a final '
            'mention here because they frequently combine with the '
            'physical and opportunistic attacks above. DNS spoofing '
            '(covered in depth in the Networking module) silently '
            'redirects a victim to a malicious destination even when '
            'they type a correct, trusted address — and brand '
            'impersonation gives that malicious destination a '
            'convincing, trusted appearance once the victim arrives. '
            'Layered together, these techniques can make an entirely '
            'fraudulent experience feel completely legitimate from start '
            'to finish.',
      ),
      LessonSection(
        heading: 'A Unifying Defense Principle',
        body:
            'Every technique in this lesson, however different on the '
            'surface, is defeated by the same basic habits: control who '
            'can physically follow you through a secured door, be aware '
            'of who might be watching or listening in shared spaces, '
            'destroy sensitive information properly before disposal, and '
            'never plug in unknown physical media. Awareness of these '
            'everyday physical risks is just as important as awareness '
            'of digital phishing — social engineers deliberately target '
            'whichever channel is least defended in a given '
            'organization.',
      ),
    ],
  ),

  // 7 --------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'Why does social engineering remain effective even against organizations with mature technical security?',
        options: [
          'It always uses advanced malware',
          'It exploits normal human tendencies like trust and helpfulness rather than a technical flaw that can be patched',
          'It only targets small organizations',
          'It requires no research or preparation',
        ],
        correctIndex: 1,
        explanation: 'Social engineering targets human psychology, not a technical vulnerability, so patching software does not fix it.',
      ),
      QuizQuestion(
        question: 'What is the purpose of an internally run anti-phishing campaign?',
        options: [
          'To punish employees who click a link',
          'To send realistic but harmless simulated phishing emails, measuring response and targeting further training where needed',
          'To block all email traffic temporarily',
          'To replace the need for a security policy',
        ],
        correctIndex: 1,
        explanation: 'Simulated phishing campaigns measure real employee response and target follow-up training based on results.',
      ),
      QuizQuestion(
        question: 'An attacker registers "arnazon.com" hoping victims mistype the real domain. This is:',
        options: ['Watering hole attack', 'Typosquatting', 'Pretexting', 'Baiting'],
        correctIndex: 1,
        explanation: 'Typosquatting registers domains visually near-identical to a legitimate one to catch mistyped URLs.',
      ),
      QuizQuestion(
        question: 'A watering hole attack works by:',
        options: [
          'Directly emailing the target with a malicious link',
          'Compromising a legitimate website the target population already visits, then waiting for victims to visit voluntarily',
          'Calling the target and impersonating IT support',
          'Leaving an infected USB drive in a parking lot',
        ],
        correctIndex: 1,
        explanation: 'Watering hole attacks poison a trusted, frequently visited site rather than luring victims to a fake one.',
      ),
      QuizQuestion(
        question: 'Which of the following is NOT one of the six motivational triggers covered in this module?',
        options: ['Authority', 'Urgency', 'Complexity', 'Scarcity'],
        correctIndex: 2,
        explanation: 'The six triggers are Authority, Urgency, Social Proof, Scarcity, Likability, and Fear — Complexity is not one of them.',
      ),
      QuizQuestion(
        question: 'An email claiming "the rest of your team has already updated their password through this link" is using which trigger?',
        options: ['Fear', 'Social Proof', 'Scarcity', 'Authority'],
        correctIndex: 1,
        explanation: 'Suggesting others have already complied is Social Proof, increasing the target\'s own willingness to comply.',
      ),
      QuizQuestion(
        question: 'What is pretexting?',
        options: [
          'Sending a phishing email with a malicious attachment',
          'Fabricating a plausible invented scenario to justify a request for information or access',
          'Physically following someone through a secured door',
          'Searching through discarded trash for sensitive documents',
        ],
        correctIndex: 1,
        explanation: 'Pretexting relies on a fabricated, believable cover story to justify an otherwise suspicious request.',
      ),
      QuizQuestion(
        question: 'In the printer pretexting example, why did the receptionist comply so readily?',
        options: [
          'The request explicitly mentioned confidential financial data',
          'The request sounded mundane and helpful, giving no obvious reason to refuse, despite its actual reconnaissance value',
          'The receptionist was an accomplice',
          'The company had no security policy at all',
        ],
        correctIndex: 1,
        explanation: 'Low-stakes-sounding requests are exactly what make pretexting effective — the reconnaissance value is hidden behind an innocuous ask.',
      ),
      QuizQuestion(
        question: 'What is the safest way to verify a caller\'s claimed identity during a suspicious request?',
        options: [
          'Ask them for their employee ID number over the phone',
          'Call back using a known, independently verified number — never one provided by the caller',
          'Trust caller ID display',
          'Ask a coworker sitting nearby',
        ],
        correctIndex: 1,
        explanation: 'A number provided by the caller could route back to the attacker; independent verification requires a separately known contact method.',
      ),
      QuizQuestion(
        question: 'Business Email Compromise (BEC) is particularly dangerous because:',
        options: [
          'It always contains detectable malware',
          'It typically involves no malicious link or attachment for technical filters to catch, relying purely on social engineering',
          'It only targets government agencies',
          'It requires physical access to a building',
        ],
        correctIndex: 1,
        explanation: 'BEC is pure social engineering with no technical payload, making it hard for automated filters to catch.',
      ),
      QuizQuestion(
        question: 'Which control most directly prevents a harvested password from being enough for an attacker to log in?',
        options: ['SPF', 'MFA', 'DNS filtering', 'A firewall rule'],
        correctIndex: 1,
        explanation: 'MFA requires a second factor beyond the password, neutralizing many credential-harvesting attacks.',
      ),
      QuizQuestion(
        question: 'What is shoulder surfing?',
        options: [
          'Searching discarded trash for documents',
          'Directly observing someone entering a password or PIN, such as over their shoulder in public',
          'Following someone through a secured door',
          'Leaving an infected USB drive for someone to find',
        ],
        correctIndex: 1,
        explanation: 'Shoulder surfing is direct visual observation of sensitive input like a password or PIN.',
      ),
      QuizQuestion(
        question: 'Piggybacking differs from tailgating in that:',
        options: [
          'They are unrelated concepts',
          'Piggybacking happens with the authorized person\'s knowing cooperation; tailgating happens without their awareness',
          'Tailgating only happens digitally',
          'Piggybacking requires no physical presence',
        ],
        correctIndex: 1,
        explanation: 'Piggybacking involves the authorized person knowingly letting someone through; tailgating slips through unnoticed.',
      ),
      QuizQuestion(
        question: 'Why is dumpster diving still a viable attack technique?',
        options: [
          'It requires advanced hacking skills',
          'Sensitive documents or storage media are sometimes discarded without being properly shredded or wiped',
          'It only works against cloud-based companies',
          'It requires breaking encryption',
        ],
        correctIndex: 1,
        explanation: 'Improperly destroyed sensitive materials in the trash remain readable to anyone willing to search through it.',
      ),
      QuizQuestion(
        question: 'What combination makes DNS spoofing and brand impersonation especially dangerous when used together?',
        options: [
          'They cancel each other out',
          'DNS spoofing redirects a victim silently, and brand impersonation makes the malicious destination appear completely legitimate',
          'They only work on mobile devices',
          'They require the victim to already be compromised',
        ],
        correctIndex: 1,
        explanation: 'Silent redirection combined with a convincing fake brand experience can make a fraudulent site feel entirely legitimate.',
      ),
    ],
  ),
];
