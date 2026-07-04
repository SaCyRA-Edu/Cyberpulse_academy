import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> fundamentalsLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'Why Cybersecurity Matters Today',
    difficulty: LessonDifficulty.beginner,
    isAudio: true,
    estimatedMinutes: 6,
    sections: [
      LessonSection(
        heading: 'Welcome to Learning Cybersecurity',
        body:
            'Welcome. This is an audio lesson — sit back and listen as we '
            'walk through why cybersecurity has become one of the most '
            'important topics of our time. A transcript is shown below if '
            'you\'d like to follow along.',
      ),
      LessonSection(
        heading: 'The World Has Changed',
        body:
            'Think about how much of your life exists online. Your bank '
            'account. Your medical records. Your messages with family. '
            'Your work documents. In the space of a generation, virtually '
            'every meaningful thing we do — communicate, shop, work, '
            'access healthcare, run businesses — happens through connected '
            'systems. And that means every one of those things can '
            'potentially be reached, disrupted, or stolen.',
      ),
      LessonSection(
        heading: 'The Numbers Are Staggering',
        body:
            'Cybercrime costs the global economy trillions of dollars '
            'every year. The average time it takes an organization to '
            'detect a breach is measured in months — not hours. And the '
            'fastest-growing category of attack isn\'t some exotic piece '
            'of technology: it\'s a convincing email, sent to one person, '
            'who clicks a link. The most expensive breaches often start '
            'with the simplest tricks.',
      ),
      LessonSection(
        heading: 'It\'s Not Just a Technical Problem',
        body:
            'Here\'s something that surprises a lot of people: most '
            'security failures aren\'t caused by a failure of technology. '
            'They\'re caused by a failure of process, or a failure of '
            'awareness. An unpatched server. A password reused across '
            'accounts. An employee who didn\'t know what a phishing email '
            'looked like. This is actually good news — it means that '
            'knowledge is one of the most powerful defensive tools we '
            'have. Which is why you\'re here.',
      ),
      LessonSection(
        heading: 'What You\'ll Build in This Course',
        body:
            'Over the lessons ahead, you\'re going to build a real '
            'understanding of how attacks work, why defenses are designed '
            'the way they are, and how to think about security the way a '
            'professional does. Not memorizing vendor products. Not '
            'chasing certifications. Genuine understanding, applicable '
            'anywhere. Let\'s get started.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'What is Cybersecurity?',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'A Working Definition',
        body:
            'Cybersecurity is the practice of protecting computers, '
            'networks, applications, and data from unauthorized access, '
            'attacks, and damage. That single sentence hides a lot of '
            'complexity, so let\'s unpack it piece by piece. "Protecting" '
            'implies an ongoing, active effort — not a one-time setup. '
            '"Unauthorized access" covers everyone from a curious '
            'ex-employee to a nation-state intelligence agency. And '
            '"damage" isn\'t limited to stolen data — it includes downtime, '
            'reputational harm, legal liability, and in some cases, '
            'physical safety when the systems in question control '
            'machinery, vehicles, or medical devices.',
      ),
      LessonSection(
        heading: 'Three Pillars: Technology, Process, People',
        body:
            'A common mistake — especially among people new to the field '
            '— is to think of cybersecurity as purely a technology '
            'problem: buy the right firewall, install the right antivirus, '
            'and you\'re covered. In reality, effective security rests on '
            'three equally important pillars working together.',
        bullets: [
          'Technology — the tools: firewalls, encryption, endpoint protection, monitoring systems',
          'Process — the documented, repeatable steps people follow: how to onboard a new employee securely, how to respond to an incident, how to review access permissions',
          'People — awareness, training, and judgment: recognizing a phishing email, following the process even when it\'s inconvenient, reporting something that looks wrong',
        ],
      ),
      LessonSection(
        heading: 'Why All Three Must Work Together',
        body:
            'Consider what happens when just one pillar is weak. An '
            'organization can have world-class technology — the latest '
            'firewalls, cutting-edge threat detection — and still be '
            'breached because an employee was tricked into handing over '
            'their password. Conversely, a well-trained, security-conscious '
            'workforce can still be compromised if the underlying '
            'technology has an unpatched, well-known vulnerability that '
            'nobody bothered to fix. Security is only as strong as its '
            'weakest pillar, which is why mature security programs invest '
            'in all three simultaneously rather than over-indexing on '
            'whichever one is easiest to buy or measure.',
      ),
      LessonSection(
        heading: 'The Core Security Domains',
        body:
            'Cybersecurity isn\'t one discipline — it\'s a collection of '
            'specialized areas that overlap and depend on each other. As '
            'you progress through this course, you\'ll notice that every '
            'module maps to one or more of these domains:',
        bullets: [
          'Network Security — protecting the pathways data travels through, from your home Wi-Fi to a company\'s global backbone',
          'Application Security — building and testing software so it resists abuse, from web apps to mobile apps to APIs',
          'Endpoint Security — securing the actual devices people use: laptops, phones, servers, and increasingly, IoT devices',
          'Identity & Access Management — controlling who can do what, and proving people are who they claim to be',
          'Cloud Security — protecting data and services hosted on infrastructure you don\'t physically control',
          'Security Operations — the ongoing work of detecting, investigating, and responding to threats in real time',
          'Governance, Risk & Compliance — aligning security decisions with business priorities, legal obligations, and acceptable risk levels',
        ],
      ),
      LessonSection(
        heading: 'A Field That Never Stands Still',
        body:
            'One of the defining characteristics of cybersecurity as a '
            'profession is that it never reaches a finished state. New '
            'technologies create new attack surfaces — cloud computing, '
            'mobile devices, AI systems, and IoT have each introduced '
            'entirely new categories of risk that didn\'t exist a decade '
            'earlier. At the same time, attackers continuously adapt their '
            'techniques in response to new defenses. This dynamic is often '
            'described as an arms race, and it\'s precisely why the '
            'foundational concepts you\'ll learn in this course — the CIA '
            'Triad, risk management, defense in depth — matter more than '
            'memorizing today\'s specific tools. Concepts endure. Products '
            'change constantly.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'The CIA Triad: Confidentiality, Integrity & Availability',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'The Foundation of Every Security Decision',
        body:
            'If you remember only one framework from this entire course, '
            'make it this one. Almost every security control ever '
            'designed — every firewall rule, every encryption scheme, '
            'every backup policy — exists to protect one or more of three '
            'properties. Together they form the CIA Triad, and it\'s the '
            'lens through which security professionals analyze virtually '
            'every situation they encounter.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.ciaTriad,
          caption:
              'The CIA Triad: every security control maps to protecting '
              'one or more of these three properties.',
        ),
      ),
      LessonSection(
        heading: 'Confidentiality: Keeping Secrets Secret',
        body:
            'Confidentiality means that only authorized people or systems '
            'can access specific information. Think about a hospital\'s '
            'patient records — a nurse treating that patient needs access, '
            'but a hospital employee in an unrelated department should '
            'not. When confidentiality fails, sensitive information ends '
            'up in the hands of someone who was never meant to see it — '
            'whether that\'s a curious insider, a hacker who breached a '
            'database, or simply a misconfigured cloud storage bucket left '
            'open to the public internet.',
        bullets: [
          'Typical controls: encryption (both at rest and in transit), access control lists, need-to-know policies, data classification',
          'Real-world failure example: a cloud storage bucket accidentally left with public read access, exposing millions of customer records to anyone who finds the link',
        ],
      ),
      LessonSection(
        heading: 'Integrity: Trusting That Data Hasn\'t Changed',
        body:
            'Integrity means that data is accurate and has not been '
            'altered without authorization — whether by a malicious '
            'attacker, a software bug, or simple human error. Integrity is '
            'what lets you trust that the balance shown in your bank '
            'account actually reflects your transactions, or that the '
            'software you downloaded is the exact same file the vendor '
            'published, not a tampered copy carrying malware.',
        bullets: [
          'Typical controls: cryptographic hashing, digital signatures, version control systems, detailed audit logs',
          'Real-world failure example: an attacker gains access to a company\'s payment system and quietly modifies the destination account number on outgoing wire transfers',
        ],
      ),
      LessonSection(
        heading: 'Availability: Being There When Needed',
        body:
            'Availability means that systems and data are accessible to '
            'authorized users whenever they are needed. This is often the '
            'least glamorous of the three properties, but it can also be '
            'the most immediately damaging when it fails — imagine an '
            'e-commerce site that goes down during its biggest sales event '
            'of the year, or a hospital\'s electronic health record system '
            'becoming unreachable in the middle of a medical emergency.',
        bullets: [
          'Typical controls: redundant infrastructure, load balancing, regular backups, DDoS mitigation services',
          'Real-world failure example: a ransomware attack encrypts every file on a hospital\'s network, forcing staff back onto pen and paper for patient records',
        ],
      ),
      LessonSection(
        heading: 'The Triad Involves Constant Trade-offs',
        body:
            'In an ideal world you\'d maximize all three properties '
            'simultaneously, but in practice, security design is full of '
            'trade-offs between them. Locking data down with extremely '
            'strict access controls can protect confidentiality but hurt '
            'availability if legitimate users are constantly blocked or '
            'slowed down. Making a system highly redundant and always-on '
            'to maximize availability can create more potential entry '
            'points for an attacker, increasing confidentiality risk. '
            'There is no universal "correct" balance — the right trade-off '
            'depends entirely on what the specific system and data '
            'actually need. A public marketing website prioritizes '
            'availability above all else. A database of unreleased '
            'financial results prioritizes confidentiality far more '
            'heavily. Learning to recognize which property matters most '
            'in a given context is a skill that separates junior '
            'practitioners from experienced ones.',
      ),
      LessonSection(
        heading: 'Using the Triad to Analyze Any Security Story',
        body:
            'A useful habit to build starting today: whenever you read '
            'about a security incident in the news, ask yourself which '
            'part (or parts) of the CIA Triad actually failed. Was data '
            'stolen (confidentiality)? Was it altered (integrity)? Was a '
            'service knocked offline (availability)? Sometimes an '
            'incident involves more than one — a ransomware attack, for '
            'example, typically threatens both availability (files are '
            'encrypted and inaccessible) and confidentiality (many '
            'ransomware groups also steal data before encrypting it, '
            'threatening to publish it for extra leverage). Practicing '
            'this kind of analysis will sharpen your instincts far faster '
            'than memorizing definitions alone.',
      ),
      LessonSection(
        heading: 'Protecting Confidentiality: Practical Controls',
        bullets: [
          'Encryption at rest and in transit — the single highest-leverage confidentiality control; even a full data theft yields nothing readable without the key',
          'Access control lists and role-based permissions — ensuring only people with a genuine need can reach sensitive data in the first place',
          'Data classification and labeling — so people and systems can consistently recognize what actually needs protecting',
          'Data masking and tokenization — substituting sensitive values (like credit card numbers) with non-sensitive placeholders in systems that don\'t genuinely need the real data',
        ],
      ),
      LessonSection(
        heading: 'Protecting Integrity: Practical Controls',
        bullets: [
          'Cryptographic hashing — detecting whether a file or message has been altered since it was created',
          'Digital signatures — proving both who created something and that it hasn\'t changed since',
          'Version control and change management — tracking exactly what changed, when, and by whom',
          'Input validation — preventing malformed or malicious data from corrupting a system in the first place',
        ],
      ),
      LessonSection(
        heading: 'Protecting Availability: What "Good" Actually Looks Like',
        body:
            'Unlike confidentiality and integrity, availability is '
            'usually expressed as a target percentage rather than a '
            'binary pass/fail — and the honest answer to "should '
            'availability be 100%?" is no. No system, however well '
            'engineered, achieves 100% uptime forever; the real '
            'question is how much downtime is acceptable, and industry '
            'practice expresses this using "the nines":',
        bullets: [
          '99% ("two nines") — about 3.65 days of downtime per year; acceptable for low-criticality internal tools',
          '99.9% ("three nines") — about 8.76 hours of downtime per year; a common baseline SLA for many business applications',
          '99.99% ("four nines") — about 52.6 minutes of downtime per year; typical target for critical business systems and major cloud provider SLAs',
          '99.999% ("five nines") — about 5.26 minutes of downtime per year; reserved for systems where outages carry severe consequences, such as telecom infrastructure or certain financial trading systems',
        ],
      ),
      LessonSection(
        heading: 'Why Chasing 100% Is the Wrong Goal',
        body:
            'Beyond a certain point, each additional "nine" of '
            'availability costs disproportionately more to achieve — '
            'going from 99.9% to 99.99% might require geographic '
            'redundancy, automatic failover, and extensive testing, for '
            'a difference of only about 8 hours of downtime per year. '
            'Mature organizations choose an availability target '
            'deliberately based on actual business impact and cost, '
            'documented in a Service Level Agreement (SLA), rather than '
            'reflexively demanding the highest number possible '
            'regardless of what it would cost to achieve.',
      ),
      LessonSection(
        heading: 'Non-Repudiation: The Property the Triad Doesn\'t Name',
        body:
            'Beyond confidentiality, integrity, and availability, '
            'security professionals rely on a fourth, closely related '
            'concept: non-repudiation. Non-repudiation means a party '
            'cannot credibly deny having performed a specific action — '
            'sent a message, approved a transaction, accessed a system '
            '— because there\'s verifiable proof tying that action '
            'specifically to them. Without non-repudiation, "I never '
            'sent that email" or "I never approved that transfer" would '
            'be impossible to disprove, which is a serious problem for '
            'both security and legal accountability.',
      ),
      LessonSection(
        heading: 'How Non-Repudiation Is Actually Achieved',
        body:
            'Non-repudiation is built from the same cryptographic tools '
            'you\'ll study in depth shortly, applied specifically to '
            'proving authorship. A sender uses their private key to '
            'create a digital signature over a hash digest of the '
            'message — the hash ensures even a tiny change to the '
            'message would produce a completely different signature, '
            'and the private key ensures only the genuine sender could '
            'have created that exact signature, since a private key is '
            'never shared. Anyone can then verify the signature using '
            'the sender\'s public key, confirming both that the message '
            'came from that specific sender (authenticity) and that it '
            'hasn\'t been altered since signing (integrity) — together '
            'producing accountability that holds up even if the sender '
            'later tries to deny it.',
      ),
      LessonSection(
        heading: 'Where Non-Repudiation Matters in Practice',
        bullets: [
          'Digitally signed contracts and legal documents, where a signature must hold up to later dispute',
          'Financial transactions, where a bank needs proof a specific customer authorized a specific transfer',
          'Code signing, where software publishers prove a specific update genuinely came from them and wasn\'t tampered with',
          'Audit logs tied to authenticated user sessions, supporting accountability for actions taken within a system',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Threats, Vulnerabilities & Risk',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Three Distinct Concepts People Often Confuse',
        body:
            'These three words get used loosely in everyday conversation, '
            'but in security they have precise, distinct meanings that '
            'matter enormously for how you think about defense.',
        bullets: [
          'Threat — anything that could cause harm: an attacker, a natural disaster, a disgruntled employee, even an accidental misconfiguration',
          'Vulnerability — a weakness that a threat could exploit: unpatched software, a weak password, an open port that shouldn\'t be exposed',
          'Risk — the combination of likelihood and impact: how probable is it that a specific threat will exploit a specific vulnerability, and how bad would the consequences be if it did?',
        ],
      ),
      LessonSection(
        heading: 'Why the Distinction Matters',
        body:
            'Here\'s a concrete way to see why separating these concepts '
            'is useful. Imagine a server running outdated software with a '
            'known, publicly documented vulnerability (the vulnerability). '
            'If that server sits on an isolated internal network with no '
            'internet access and no valuable data, the risk might be '
            'fairly low even though the vulnerability is severe — there\'s '
            'no realistic threat actor who can reach it. Now imagine the '
            'exact same vulnerability on a server directly exposed to the '
            'internet, processing customer payment data. Same '
            'vulnerability, dramatically higher risk, because the threat '
            'landscape and potential impact are completely different. '
            'Security teams that understand this distinction can '
            'prioritize their limited time and budget far more '
            'effectively than teams that just chase every vulnerability '
            'with equal urgency.',
      ),
      LessonSection(
        heading: 'The Attack Surface',
        body:
            'A closely related concept is the attack surface — the '
            'complete set of points where an unauthorized user could '
            'potentially try to enter a system or extract data. This '
            'includes obvious things like open network ports and '
            'public-facing web applications, but also less obvious things '
            'like employee email addresses (a target for phishing), '
            'physical entry points to a building, and even the metadata '
            'exposed in job postings that reveal what software a company '
            'uses internally. Reducing the attack surface — removing '
            'anything exposed that doesn\'t strictly need to be — is one '
            'of the most cost-effective defensive strategies available, '
            'because it eliminates entire categories of risk rather than '
            'trying to defend every possible entry point equally.',
      ),
      LessonSection(
        heading: 'Common Threat Categories to Recognize',
        bullets: [
          'Malware — a broad category including ransomware (encrypts data for extortion), spyware (covertly monitors activity), trojans (disguised as legitimate software), and worms (self-replicating across networks)',
          'Social engineering — manipulating people rather than exploiting technical flaws: phishing (email), vishing (voice calls), pretexting (fabricated scenarios to extract information)',
          'Insider threats — harm caused by employees or contractors, whether malicious (a departing employee stealing data) or negligent (an employee accidentally emailing sensitive files to the wrong recipient)',
          'Supply chain attacks — compromising a trusted vendor or software provider as an indirect path to reach that vendor\'s customers',
          'Zero-day exploits — attacks that target a vulnerability unknown to the software vendor, meaning no patch exists yet at the time of the attack',
          'Denial of Service — deliberately overwhelming a system with traffic or requests to make it unavailable to legitimate users',
        ],
      ),
      LessonSection(
        heading: 'Common Vulnerability Categories',
        bullets: [
          'Unpatched or outdated software running known, publicly documented flaws',
          'Weak, default, or reused passwords across multiple accounts',
          'Misconfigured systems — an open port that should be closed, a cloud storage setting left at its permissive default',
          'Lack of security awareness among employees, making social engineering far more effective',
          'Missing encryption on sensitive data, whether stored or transmitted',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Who Are the Attackers?',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Understanding Threat Actors',
        body:
            'Not all attackers are alike, and understanding who is likely '
            'to target a particular organization — and why — helps '
            'security teams prioritize where to focus their limited '
            'defensive resources. A small local bakery and a national '
            'power grid operator face very different realistic threats, '
            'even though both technically "could" be targeted by anyone.',
      ),
      LessonSection(
        heading: 'Script Kiddies',
        body:
            'This somewhat dismissive term describes low-skill attackers '
            'who use pre-built tools and scripts created by others, '
            'without a deep technical understanding of how those tools '
            'actually work. They\'re largely opportunistic, scanning the '
            'internet broadly for any system with an obvious, easily '
            'exploitable weakness rather than targeting anyone '
            'specifically. Don\'t underestimate them, though — even '
            'unsophisticated automated scanning can find and exploit real '
            'vulnerabilities if basic hygiene like patching is neglected.',
      ),
      LessonSection(
        heading: 'Hacktivists',
        body:
            'Hacktivists are motivated by political or social causes '
            'rather than financial gain. They typically target '
            'organizations they view as opposed to their cause — '
            'governments, corporations involved in controversial '
            'industries, or institutions accused of unethical practices. '
            'Their goal is often disruption and public embarrassment '
            'rather than financial theft: defacing a website, leaking '
            'internal communications, or knocking a service offline to '
            'make a statement.',
      ),
      LessonSection(
        heading: 'Organized Crime',
        body:
            'Financially motivated and often surprisingly well-resourced, '
            'organized cybercrime groups run operations that mirror '
            'legitimate businesses — complete with specialized roles, '
            'customer support for ransomware victims, and even '
            '"ransomware-as-a-service" offerings that let less technical '
            'criminals rent access to sophisticated tools in exchange for '
            'a cut of the proceeds. These groups are responsible for the '
            'majority of ransomware attacks, business email compromise '
            'scams, and large-scale data theft for resale on underground '
            'markets.',
      ),
      LessonSection(
        heading: 'Nation-State Actors',
        body:
            'Generally the most highly skilled and best-resourced threat '
            'actors, nation-state groups pursue long-term strategic '
            'objectives on behalf of a government — espionage, '
            'intellectual property theft, disruption of critical '
            'infrastructure, or positioning for potential future conflict. '
            'They\'re often willing to spend months or years patiently '
            'working toward a single objective, and they have access to '
            'zero-day vulnerabilities and custom tools that most other '
            'threat actors simply cannot obtain.',
      ),
      LessonSection(
        heading: 'Insiders',
        body:
            'Employees, contractors, or business partners who misuse '
            'legitimate access they were already granted. Insider threats '
            'can be malicious (a departing employee deliberately stealing '
            'customer data before resigning) or entirely unintentional (an '
            'employee falling for a phishing email, or accidentally '
            'misconfiguring a system). Because insiders already have '
            'authorized access, their activity often blends in with normal '
            'usage patterns, making insider threats notoriously difficult '
            'to detect compared to external attacks.',
      ),
      LessonSection(
        heading: 'Why This Taxonomy Matters in Practice',
        body:
            'When you understand the realistic threat actors relevant to '
            'a specific organization, you can make smarter, more targeted '
            'defensive investments rather than treating every possible '
            'threat with equal urgency. A hospital should think hard about '
            'ransomware groups (organized crime) and insider risks around '
            'patient data. A defense contractor needs to seriously '
            'consider nation-state espionage. A controversial company in '
            'the public eye should factor in hacktivism. This kind of '
            'threat-informed thinking is a core part of the risk '
            'management process you\'ll explore later in this module.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Authentication',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'What Authentication Actually Is',
        body:
            'Authentication is the process of proving that you are '
            'genuinely who you claim to be, before a system grants you '
            'any access at all. It\'s the very first checkpoint in '
            'almost every secure interaction — before a bank lets you '
            'view your balance, before a company lets an employee open '
            'a file, before a website lets you post as yourself rather '
            'than someone else. Without reliable authentication, every '
            'other security control built on top of it — permissions, '
            'audit logs, encryption tied to a specific identity — '
            'becomes meaningless, because there\'s no trustworthy way to '
            'know who is actually on the other end of the connection.',
      ),
      LessonSection(
        heading: 'Why Authentication Is Required Everywhere You Look',
        body:
            'Authentication exists to solve one specific problem: '
            'systems and people need a reliable way to distinguish a '
            'legitimate user from an impostor, an authorized process '
            'from a malicious one. Without it, there would be no way '
            'to enforce who can read sensitive data, who can approve a '
            'transaction, or even whose actions show up in a log. This '
            'is why authentication shows up at every layer imaginable — '
            'logging into a laptop, connecting to a corporate VPN, '
            'accessing a cloud application, calling an API '
            'programmatically, or even one microservice talking to '
            'another inside a data center. Anywhere something needs to '
            'know "who is this, really?" authentication has to happen '
            'first.',
      ),
      LessonSection(
        heading: 'A Generic Authentication Flow',
        body:
            'Regardless of the specific method used, almost every '
            'authentication exchange follows the same basic shape.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Claim Identity', 'Present Credential', 'Verify', 'Grant or Deny'],
          caption:
              'This same basic flow underlies a password login, a '
              'fingerprint scan, and a hardware security key tap — only '
              'the credential and verification method change.',
        ),
      ),
      LessonSection(
        heading: 'The Three Authentication Factors',
        body:
            'Every authentication method in existence falls into one of '
            'three categories, often called "factors." Strong '
            'authentication combines more than one.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.authFactors,
          caption:
              'The three authentication factors — combining two or more '
              'of these is what makes Multi-Factor Authentication (MFA) '
              'so effective.',
        ),
      ),
      LessonSection(
        heading: 'Strengthening Authentication: MFA in Practice',
        body:
            'Multi-Factor Authentication combines two or more of the '
            'factors above, so a compromised password alone is no '
            'longer sufficient to access an account. In practice, MFA '
            'shows up through several concrete implementations, each '
            'with different security and convenience trade-offs.',
        bullets: [
          'Software tokens (authenticator apps) — apps like Google Authenticator or Microsoft Authenticator generate a new time-based one-time code every 30 seconds, using a shared secret established when the app was set up; convenient and free, but vulnerable if the phone itself is compromised',
          'Hardware security keys — small physical devices like a YubiKey or a Titan Security Key that a user physically taps or inserts to approve a login; these use public-key cryptography and are considered the strongest widely available MFA method precisely because the private key never leaves the device and can\'t be phished the way a code can',
          'SMS-based one-time codes — a numeric code sent by text message; convenient and better than no MFA at all, but the weakest common option, since SIM-swapping attacks can redirect a victim\'s phone number to an attacker\'s device',
          'Push notifications — a prompt sent to a registered app asking the user to approve or deny a login attempt; convenient, though vulnerable to "MFA fatigue" attacks where an attacker spams approval requests hoping the user eventually taps approve out of frustration',
          'Biometrics — fingerprint or facial recognition, typically used to unlock a device or a password manager locally rather than being sent anywhere; convenient, but a compromised biometric (unlike a password) can\'t simply be changed afterward',
        ],
      ),
      LessonSection(
        heading: 'One-Time Passwords (OTPs) in Detail',
        body:
            'An OTP is a code valid for only a single use or a short '
            'time window, which is precisely what makes it resistant to '
            'reuse even if intercepted. TOTP (Time-based One-Time '
            'Password) generates a new code every 30 seconds using the '
            'current time and a shared secret — this is what '
            'authenticator apps use. HOTP (HMAC-based One-Time Password) '
            'instead advances based on a counter each time it\'s used, '
            'rather than the clock, which is common in some hardware '
            'tokens. Either way, the underlying principle is the same: '
            'even if an attacker somehow captures one OTP, it becomes '
            'useless within seconds or after a single use, dramatically '
            'limiting the damage compared to a static, reusable '
            'password.',
      ),
      LessonSection(
        heading: 'How These Methods Actually Protect Data',
        body:
            'Every strengthening method above works by making it '
            'progressively harder for an attacker to satisfy the '
            'authentication check using only stolen information. A '
            'stolen password alone becomes useless against MFA. A '
            'phished OTP becomes useless within seconds. A cloned '
            'fingerprint database becomes useless against a hardware '
            'key that never transmits anything to clone. The strategic '
            'goal across all of them is the same: raise the cost and '
            'complexity of impersonating someone until it becomes '
            'impractical for the vast majority of real-world attackers, '
            'even if a single piece of the puzzle — like a password — '
            'does eventually leak.',
      ),
      LessonSection(
        heading: 'Single Sign-On (SSO)',
        body:
            'SSO allows a user to authenticate once and then access '
            'multiple connected applications without needing to log in '
            'separately to each one. Beyond the obvious convenience '
            'benefit, SSO also improves security by centralizing '
            'authentication — instead of managing dozens of separate '
            'passwords across different systems (many of which end up '
            'weak or reused), an organization can enforce strong '
            'authentication policies, including MFA, at a single central '
            'point that governs access everywhere.',
      ),
    ],
  ),

  // 6b -----------------------------------------------------------------
  Lesson(
    title: 'Authorization: RBAC, Rule-Based & Attribute-Based Access',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'What Authorization Actually Is',
        body:
            'Once authentication confirms who someone is, authorization '
            'answers the next question: what is this specific, verified '
            'identity actually allowed to do? Authorization is the '
            'decision layer that determines access to specific '
            'resources, actions, and data — and getting it wrong in '
            'either direction causes real problems: too permissive, and '
            'a compromised or malicious account can cause far more '
            'damage than it should; too restrictive, and legitimate '
            'work grinds to a halt as people constantly hit walls trying '
            'to do their actual jobs.',
      ),
      LessonSection(
        heading: 'Role-Based Access Control (RBAC)',
        body:
            'RBAC grants permissions based on a user\'s role within an '
            'organization, rather than assigning permissions to '
            'individuals one at a time. A "Finance Analyst" role might '
            'include access to accounting software and financial '
            'reports; an "IT Support" role might include the ability to '
            'reset passwords and access helpdesk tools. When someone '
            'joins, changes roles, or leaves, an administrator changes '
            'their role assignment once, and every associated permission '
            'updates automatically — dramatically simpler to manage and '
            'audit than tracking individual permission grants across '
            'potentially thousands of employees.',
      ),
      LessonSection(
        heading: 'Rule-Based Access Control',
        body:
            'Rule-based access control makes access decisions using '
            'predefined, often conditional rules that apply system-wide, '
            'regardless of who a specific user is. A firewall rule '
            'blocking all traffic outside business hours, or a policy '
            'denying login attempts from countries where an organization '
            'has no offices, are both rule-based controls — the rule '
            'itself, not any individual\'s role or attributes, drives the '
            'decision. Rule-based control is often layered on top of '
            'RBAC rather than replacing it, adding conditional logic '
            'that applies universally.',
      ),
      LessonSection(
        heading: 'Attribute-Based Access Control (ABAC)',
        body:
            'ABAC goes further than RBAC by making access decisions '
            'based on a combination of attributes — characteristics of '
            'the user, the resource being accessed, and the current '
            'context — rather than a single fixed role. An ABAC policy '
            'might grant access only if the user\'s department attribute '
            'is "Finance," the document\'s classification attribute is '
            '"Internal" (not "Confidential"), the request originates '
            'from a company-managed device, and the time is within '
            'business hours — all evaluated together as a single '
            'decision. This gives far more precise, context-aware '
            'control than RBAC alone can provide, at the cost of being '
            'more complex to design, implement, and audit.',
      ),
      LessonSection(
        heading: 'Comparing the Three Models',
        bullets: [
          'RBAC — simplest to manage at scale; best when access genuinely maps cleanly onto organizational roles',
          'Rule-based — best for applying universal conditions (time, location, network) that should apply regardless of who\'s asking',
          'ABAC — most precise and context-aware, but the most complex to design and maintain; best suited to environments with highly variable, context-dependent access needs',
        ],
      ),
      LessonSection(
        heading: 'How Authorization Protects Data and Simplifies Access',
        body:
            'Well-designed authorization does two things simultaneously '
            'that might initially seem to pull in opposite directions: '
            'it protects sensitive data and maintains integrity by '
            'ensuring only appropriate identities can reach or modify '
            'it, while also simplifying legitimate access by grouping '
            'permissions logically (through roles or attributes) instead '
            'of requiring constant manual, one-off permission grants. '
            'The best authorization models make the secure path and the '
            'convenient path the same path — a properly assigned role or '
            'attribute set gets people exactly what they need without '
            'friction, while anyone outside that role or attribute set '
            'is cleanly and automatically excluded.',
      ),
    ],
  ),

  // 6c -----------------------------------------------------------------
  Lesson(
    title: 'Accounting: Audit Trails & User Accountability',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Completing the AAA Model',
        body:
            'Authentication and authorization are two-thirds of a '
            'classic security framework called AAA: Authentication, '
            'Authorization, and Accounting. Accounting is the '
            'often-overlooked third pillar — it\'s the ongoing process of '
            'monitoring and logging what an authenticated, authorized '
            'identity actually does once access has been granted. '
            'Without accounting, an organization might correctly verify '
            'identity and correctly restrict permissions, and still have '
            'no way to answer "what actually happened here?" after the '
            'fact.',
      ),
      LessonSection(
        heading: 'What Accounting Actually Captures',
        bullets: [
          'Who — the authenticated identity that performed an action',
          'What — the specific action taken: a file opened, a record modified, a command executed',
          'When — a precise timestamp, which is exactly why accurate time synchronization across systems matters so much for later analysis',
          'Where — the originating device, IP address, or system location',
          'Outcome — whether the action succeeded, failed, or was denied',
        ],
      ),
      LessonSection(
        heading: 'Why Accounting Matters in Practice',
        bullets: [
          'Regulatory compliance — many regulations (HIPAA, PCI-DSS, SOX) explicitly require detailed audit logs proving who accessed what and when',
          'Forensic analysis — when an incident occurs, accounting logs are frequently the primary evidence used to reconstruct exactly what an attacker (or a well-meaning but mistaken employee) actually did',
          'Resource optimization — usage logs reveal which systems and features are actually being used, informing decisions about where to invest or cut back',
          'User accountability — knowing that actions are logged and attributable is itself a deterrent against misuse, and provides a clear record if misuse does occur',
        ],
      ),
      LessonSection(
        heading: 'Accounting and Non-Repudiation Work Together',
        body:
            'Recall non-repudiation from the CIA Triad lesson — the '
            'property that prevents someone from credibly denying an '
            'action they actually took. Accounting is what makes '
            'non-repudiation practically enforceable: a digital '
            'signature proves a specific person authorized a specific '
            'transaction, and the accompanying audit log proves exactly '
            'when and from where that authorization happened, together '
            'building a record that\'s very difficult to credibly dispute '
            'after the fact.',
      ),
      LessonSection(
        heading: 'A Practical Reality: Logs Only Help If They\'re Protected',
        body:
            'Accounting logs are only as trustworthy as their own '
            'protection — an attacker with sufficient access can often '
            'edit or delete the very logs that would reveal their '
            'activity, which is exactly why centralized, tamper-resistant '
            'log storage (forwarding logs to a separate system, as '
            'you\'ll see repeatedly in later modules) is considered a '
            'core part of accounting done properly, not an optional '
            'extra.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Cryptography in Plain English',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'What Cryptography Actually Does',
        body:
            'Cryptography transforms readable data, called plaintext, '
            'into an unreadable form, called ciphertext, so that only '
            'someone possessing the correct key can convert it back. '
            'Beyond simple secrecy, modern cryptography also provides '
            'tools for verifying that data hasn\'t been tampered with '
            'and for confirming that a message genuinely came from the '
            'party it claims to be from. It\'s difficult to overstate how '
            'foundational cryptography is to the modern internet — '
            'without it, online banking, e-commerce, and private '
            'messaging as we know them simply wouldn\'t be possible.',
      ),
      LessonSection(
        heading: 'Symmetric Encryption: One Shared Key',
        body:
            'In symmetric encryption, the exact same key is used to both '
            'encrypt and decrypt the data. It\'s fast and computationally '
            'efficient, which is why it\'s used for encrypting large '
            'volumes of data. The catch is the key exchange problem: both '
            'parties need to somehow obtain the same secret key before '
            'they can communicate securely, and if that key is '
            'intercepted during the exchange, the entire scheme is '
            'compromised. This is a bit like sharing a single physical '
            'key to a locked box — great once both people have a copy, '
            'but risky to hand off in the first place.',
      ),
      LessonSection(
        heading: 'Asymmetric Encryption: Solving the Key Exchange Problem',
        body:
            'Asymmetric encryption uses two mathematically linked keys: '
            'a public key, which can be shared openly with anyone, and a '
            'private key, which must never be shared and stays with its '
            'owner. Data encrypted with someone\'s public key can only be '
            'decrypted with the matching private key. This elegantly '
            'solves the key exchange problem — you can publish your '
            'public key anywhere, and anyone can use it to send you '
            'something only you can read, without ever needing a secure '
            'channel to exchange a shared secret first. The trade-off is '
            'that asymmetric encryption is significantly slower than '
            'symmetric encryption, which is why real systems like HTTPS '
            'actually use both together: asymmetric encryption to '
            'securely exchange a temporary symmetric key, then symmetric '
            'encryption for the speed needed to handle the actual session '
            'data.',
      ),
      LessonSection(
        heading: 'Hashing: One-Way Fingerprints',
        body:
            'Hashing is fundamentally different from encryption because '
            'it\'s one-way — there\'s no key that reverses a hash back '
            'into the original data. A hashing algorithm takes an input '
            'of any size and produces a fixed-length output, called a '
            'hash or digest, that acts like a unique fingerprint for that '
            'exact input. Change even a single character of the input and '
            'the resulting hash changes completely and unpredictably. '
            'This property makes hashing perfect for two very different '
            'use cases: verifying that a file hasn\'t been altered '
            '(compare hashes before and after) and storing passwords '
            'securely (the system stores only the hash, never the actual '
            'password, so even if the database leaks, attackers don\'t '
            'get the plaintext passwords directly).',
      ),
      LessonSection(
        heading: 'Digital Signatures and Certificates',
        body:
            'A digital signature uses asymmetric cryptography to prove '
            'that a specific message genuinely came from a specific '
            'sender and wasn\'t altered in transit — the sender signs the '
            'message with their private key, and anyone can verify that '
            'signature using the sender\'s public key. A digital '
            'certificate takes this a step further by binding a public '
            'key to a verified identity, typically issued by a trusted '
            'third party called a Certificate Authority. This is exactly '
            'what happens when your browser shows a padlock icon next to '
            'a website address — it has verified a certificate proving '
            'that the public key being used really does belong to the '
            'website you think you\'re visiting, not an impostor.',
      ),
      LessonSection(
        heading: 'Where This Shows Up in Everyday Life',
        bullets: [
          'HTTPS — combines asymmetric and symmetric encryption to protect virtually all modern web traffic',
          'Password storage — responsible systems store hashes of passwords, never the plaintext',
          'Software updates — publishers digitally sign updates so your device can verify they haven\'t been tampered with before installing',
          'End-to-end encrypted messaging — apps like Signal use asymmetric encryption so that only the intended recipient\'s device holds the private key needed to read a message',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Network Security Overview',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Why Networks Are Such a High-Value Target',
        body:
            'Networks are the connective tissue carrying almost '
            'everything of value in an organization — credentials, '
            'financial transactions, private communications, and '
            'intellectual property all travel across network links at '
            'some point. Compromising a network doesn\'t just expose one '
            'system; it can give an attacker visibility into, and the '
            'ability to move between, every device connected to that '
            'network. This is exactly why network security sits at the '
            'core of almost every defense-in-depth strategy.',
      ),
      LessonSection(
        heading: 'Segmentation: Not Everything Belongs on One Network',
        body:
            'Segmentation means dividing a network into smaller, isolated '
            'zones rather than treating everything as one flat, '
            'interconnected space. If every device on a network can '
            'freely reach every other device, a single compromised '
            'laptop can potentially become a stepping stone to reach the '
            'company\'s most sensitive database. Segmentation limits this '
            '"lateral movement" by putting sensitive systems — finance '
            'servers, customer databases, industrial control systems — on '
            'separate segments with tightly controlled traffic rules '
            'between them, so a breach in one area doesn\'t automatically '
            'cascade into a breach of everything.',
      ),
      LessonSection(
        heading: 'Firewalls: Enforcing the Rules',
        body:
            'A firewall inspects network traffic and makes allow-or-deny '
            'decisions based on a defined set of rules — for example, '
            '"allow inbound traffic on port 443 (HTTPS) but block '
            'everything else." Firewalls exist at multiple levels: '
            'network firewalls protect entire segments, while host-based '
            'firewalls protect individual devices even from other devices '
            'on the same trusted network, adding a valuable layer of '
            'protection against lateral movement from an already-'
            'compromised machine nearby.',
      ),
      LessonSection(
        heading: 'Intrusion Detection & Prevention',
        body:
            'Beyond simple allow/deny rules, more advanced systems '
            'actively analyze traffic patterns for signs of malicious '
            'activity. An Intrusion Detection System (IDS) monitors '
            'traffic and generates alerts when it spots something '
            'suspicious, but takes no direct action — a human or '
            'automated system must respond. An Intrusion Prevention '
            'System (IPS) goes further, sitting inline with the traffic '
            'flow and automatically blocking anything it identifies as '
            'malicious in real time, before it reaches its destination.',
      ),
      LessonSection(
        heading: 'Encryption in Transit',
        body:
            'Even with strong perimeter defenses, data traveling across '
            'a network can still be intercepted by anyone positioned '
            'along its path — a compromised router, a malicious actor on '
            'the same Wi-Fi network, or an internet service provider '
            'itself. Encrypting data in transit (via HTTPS, VPNs, or '
            'encrypted internal protocols) ensures that even if traffic '
            'is captured, it appears as meaningless ciphertext to anyone '
            'without the decryption key.',
      ),
      LessonSection(
        heading: 'Common Network Attacks to Recognize',
        bullets: [
          'Man-in-the-middle — an attacker secretly intercepts and potentially alters communication between two parties who believe they\'re talking directly to each other',
          'Packet sniffing — capturing traffic as it crosses a network; devastating on unencrypted connections, largely harmless against properly encrypted ones',
          'DNS spoofing — feeding a device a false IP address to silently redirect it toward a malicious destination',
          'Distributed Denial of Service (DDoS) — flooding a target with overwhelming traffic from many sources simultaneously to knock it offline',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Risk Management',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'The Core Formula',
        body:
            'At its heart, risk in a security context is generally '
            'understood as a function of two variables: how likely a '
            'given threat is to actually exploit a given vulnerability, '
            'and how severe the consequences would be if it did. Security '
            'professionals often express this conceptually as Likelihood '
            '× Impact = Risk. This isn\'t a precise mathematical formula '
            'you plug numbers into — it\'s a mental model for comparing '
            'and prioritizing many different risks against each other, '
            'since no organization has unlimited resources to address '
            'everything with equal urgency.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.riskFormula,
          caption:
              'Risk is a function of how likely a threat is to occur and '
              'how severe the impact would be if it did.',
        ),
      ),
      LessonSection(
        heading: 'The Risk Management Process',
        body:
            'Rather than reacting to threats one at a time as they '
            'appear, mature organizations follow a structured, repeating '
            'process for managing risk systematically.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Identify', 'Assess', 'Treat', 'Monitor'],
          caption: 'The risk management process repeats continuously — '
              'risks change as the business and technology environment '
              'evolves.',
        ),
      ),
      LessonSection(
        heading: 'Identify',
        body:
            'The process begins with a thorough inventory: what assets '
            'does the organization actually have (data, systems, '
            'infrastructure, intellectual property), and what could '
            'realistically threaten each of them? You cannot protect what '
            'you don\'t know exists, which is why asset inventory is '
            'consistently ranked as one of the most foundational — and '
            'most frequently neglected — security practices.',
      ),
      LessonSection(
        heading: 'Assess',
        body:
            'Once risks are identified, each one is evaluated for both '
            'likelihood and potential impact. This is often done using a '
            'simple qualitative scale (low, medium, high) for '
            'organizations just getting started, or more sophisticated '
            'quantitative models that attempt to estimate risk in actual '
            'financial terms for mature programs with the data to support '
            'that level of precision.',
      ),
      LessonSection(
        heading: 'Treat',
        body:
            'For each identified and assessed risk, the organization '
            'chooses how to respond. There are exactly four possible '
            'strategies, and understanding all four (not just "fix it") '
            'is a hallmark of mature risk thinking.',
        bullets: [
          'Avoid — eliminate the activity or system that creates the risk entirely',
          'Mitigate — implement controls that reduce the likelihood or impact, without eliminating the underlying activity',
          'Transfer — shift the financial consequence of the risk to a third party, most commonly through cyber insurance',
          'Accept — make a conscious, documented decision to take on the risk as-is, typically because the cost of addressing it exceeds the potential loss, or the risk is already low enough to tolerate',
        ],
      ),
      LessonSection(
        heading: 'Monitor',
        body:
            'Risk is never a one-time assessment. New vulnerabilities '
            'emerge, business priorities shift, new technologies get '
            'adopted, and the threat landscape evolves constantly. The '
            'monitoring step ensures the entire process repeats on a '
            'regular cadence rather than becoming a stale document that '
            'no longer reflects reality.',
      ),
      LessonSection(
        heading: 'Why Organizations Formalize This Process',
        body:
            'No organization, regardless of size or budget, can '
            'eliminate all risk or defend against every conceivable '
            'threat with equal intensity. A formal risk management '
            'process gives security teams and leadership a shared, '
            'defensible framework for prioritizing limited time, budget, '
            'and attention toward the risks that genuinely matter most to '
            'that specific organization — rather than chasing whichever '
            'threat happened to make headlines most recently.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Security Policies & Governance',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Why Written Policies Matter',
        body:
            'Technology controls without corresponding policy are '
            'incomplete. A firewall doesn\'t tell an employee whether '
            'they\'re allowed to install personal software on a company '
            'laptop. Encryption doesn\'t establish who is accountable when '
            'a data breach occurs. Written security policies exist '
            'precisely to fill this gap — they translate an '
            'organization\'s security intentions into clear, enforceable, '
            'and auditable rules that everyone is expected to follow, and '
            'they create the accountability structure needed when '
            'something eventually does go wrong.',
      ),
      LessonSection(
        heading: 'Essential Policy Types',
        bullets: [
          'Acceptable Use Policy (AUP) — defines what employees may and may not do with company systems, networks, and devices',
          'Password Policy — sets minimum requirements for creating, storing, and rotating passwords',
          'Incident Response Policy — establishes the steps to follow the moment a security event is suspected or confirmed',
          'Data Classification Policy — defines how to label and handle data based on its sensitivity (public, internal, confidential, restricted)',
          'Change Management Policy — ensures system and infrastructure changes go through review and authorization before deployment',
          'Bring Your Own Device (BYOD) Policy — sets rules for personal devices that access company resources',
        ],
      ),
      LessonSection(
        heading: 'The Policy Lifecycle',
        body:
            'Policies aren\'t documents you write once and file away. '
            'Healthy security governance treats policy as a living '
            'process that repeats over time as the organization, its '
            'technology, and the threat landscape all evolve.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Develop', 'Communicate', 'Enforce', 'Review'],
          caption: 'A healthy policy lifecycle repeats continuously — a '
              'policy that\'s never reviewed quickly becomes outdated and '
              'ignored.',
        ),
      ),
      LessonSection(
        heading: 'Develop and Communicate',
        body:
            'A policy is only effective if the people expected to follow '
            'it actually know it exists and understand what it requires '
            'of them. Simply publishing a document to an internal wiki '
            'that nobody reads accomplishes very little — effective '
            'organizations actively communicate policy changes through '
            'training, onboarding, and regular reminders, and use clear, '
            'accessible language rather than dense legal jargon.',
      ),
      LessonSection(
        heading: 'Enforce Consistently',
        body:
            'A policy that\'s enforced inconsistently — strictly applied '
            'to some employees but quietly overlooked for others, '
            'especially senior staff — undermines the entire governance '
            'structure and signals to everyone that the rules are '
            'optional. Consistent enforcement, paired with clear '
            'consequences for violations, is what gives a policy real '
            'weight rather than existing as words on paper.',
      ),
      LessonSection(
        heading: 'Review and Adapt',
        body:
            'Technology changes, regulations change, and the '
            'organization\'s own risk profile changes as it grows or '
            'shifts its business model. A policy written five years ago '
            'may no longer reflect current best practice, current tools, '
            'or current legal requirements. Periodic review — typically '
            'annually, or immediately following a significant incident '
            'or major change — keeps policy relevant rather than becoming '
            'an outdated relic that everyone quietly ignores.',
      ),
      LessonSection(
        heading: 'Governance Frameworks: Standing on the Shoulders of Others',
        body:
            'Rather than building an entire security program and policy '
            'set completely from scratch, most organizations adopt an '
            'established governance framework as a starting point — '
            'widely used examples include the NIST Cybersecurity '
            'Framework, ISO/IEC 27001, and the CIS Controls. These '
            'frameworks are deliberately vendor-neutral and platform-'
            'agnostic, describing what a mature security program should '
            'cover conceptually without dictating specific products. '
            'This is precisely why this course is structured around '
            'durable concepts rather than any single vendor\'s tools — '
            'the frameworks that guide real security programs are built '
            'the same way.',
      ),
    ],
  ),

  // 10b -------------------------------------------------------------------
  Lesson(
    title: 'Security Control Categories & Types',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Two Different Ways to Classify Every Control You\'ll Ever Study',
        body:
            'Every specific security control you\'ll encounter across '
            'this entire course — a firewall, a background check, a '
            'locked server room door, a written policy — can be '
            'classified two independent ways: by category (broadly, '
            'what kind of control is it?) and by type (functionally, '
            'what does it actually do?). Learning both classification '
            'systems gives you a genuinely useful mental framework for '
            'analyzing any control you encounter, including ones this '
            'course hasn\'t specifically covered yet.',
      ),
      LessonSection(
        heading: 'The Four Security Control Categories',
        bullets: [
          'Technical — controls implemented through technology itself: firewalls, encryption, antivirus, access control systems',
          'Managerial — controls implemented through policy, planning, and risk management decisions made by leadership: risk assessments, security policies, security awareness programs',
          'Operational — controls carried out by people, day to day, following defined procedures: security guards, incident response procedures, user access reviews',
          'Physical — controls that restrict actual physical access: locked doors, fences, security cameras, badge readers',
        ],
      ),
      LessonSection(
        heading: 'Why Categories Matter: One Risk, Multiple Layers',
        body:
            'A single risk is rarely addressed by only one category of '
            'control. Protecting a data center against unauthorized '
            'entry might combine a physical control (a locked door and '
            'badge reader), a technical control (a camera system logging '
            'every entry), a managerial control (a policy defining who '
            'is authorized to enter and why), and an operational control '
            '(a guard who checks badges and challenges unfamiliar '
            'faces). This layering across categories is itself a form of '
            'defense in depth — a concept you\'ll see formalized further '
            'later in this course.',
      ),
      LessonSection(
        heading: 'The Six Security Control Types',
        bullets: [
          'Preventative — stops an incident before it happens: a firewall blocking unauthorized traffic, an Acceptable Use Policy (AUP) setting expectations that discourage risky behavior in the first place',
          'Deterrent — discourages an attacker from even attempting an action, without necessarily stopping them technically: a visible warning sign, a login banner stating monitoring is in effect',
          'Detective — identifies that something has already happened: an IDS alerting on suspicious traffic, a security camera recording footage after the fact',
          'Corrective — reduces the impact and restores normal operation after an incident: restoring a system from backup, applying a patch after a vulnerability is discovered',
          'Compensating — an alternative control used when the ideal control isn\'t feasible: using additional monitoring on a legacy system that can\'t support modern encryption',
          'Directive — a control that mandates or directs a specific behavior through policy or instruction, relying on people to comply: a policy requiring all laptops to be encrypted, a mandatory security training requirement',
        ],
      ),
      LessonSection(
        heading: 'Mapping Real Examples to Type',
        bullets: [
          'A firewall blocking inbound traffic on an unused port — Preventative, Technical',
          'An IDS generating an alert on a suspicious login pattern — Detective, Technical',
          'A VPN encrypting traffic on an untrusted network — Preventative, Technical',
          'Antivirus removing a detected piece of malware — Corrective, Technical',
          'An Acceptable Use Policy (AUP) — Directive, Managerial',
          'A security guard checking ID badges at the entrance — Preventative, Physical (also Operational, since a person is actively carrying out the check)',
        ],
      ),
      LessonSection(
        heading: 'Why This Framework Is Genuinely Useful, Not Just Academic',
        body:
            'When you\'re asked to improve an organization\'s security '
            'posture, thinking in terms of category and type helps '
            'reveal actual gaps rather than just adding more of what\'s '
            'already there. An organization with plenty of preventative '
            'technical controls (firewalls, antivirus) but no detective '
            'controls at all has a serious blind spot — an attacker who '
            'gets past prevention will operate completely undetected. '
            'Deliberately mapping existing controls against both the '
            'four categories and six types quickly surfaces exactly '
            'these kinds of imbalances.',
      ),
    ],
  ),

  // 10c -------------------------------------------------------------------
  Lesson(
    title: 'Zero Trust Fundamentals',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Retiring the Idea of a Trusted Perimeter',
        body:
            'Traditional network security assumed a clear boundary: '
            'defend the perimeter tightly, and reasonably trust '
            'everything already inside it. Zero Trust rejects that '
            'assumption entirely. It starts from the premise that no '
            'user, device, or network location — inside or outside a '
            'traditional perimeter — should be trusted by default. Every '
            'single request for access must be explicitly verified, '
            'every time, regardless of where it originates.',
      ),
      LessonSection(
        heading: 'Why the Perimeter Model Stopped Making Sense',
        body:
            'Cloud services, remote work, and personal devices accessing '
            'company resources have made "inside the network" an '
            'increasingly meaningless boundary. An employee working from '
            'home, accessing a cloud application from a personal laptop, '
            'was never genuinely "inside" anything a traditional '
            'perimeter firewall could actually protect — the entire '
            'concept of a defensible network edge has quietly '
            'dissolved for most modern organizations, which is exactly '
            'the deperimeterized environment Zero Trust was designed to '
            'secure.',
      ),
      LessonSection(
        heading: 'Adaptive Identity',
        body:
            'Rather than granting access based on a static, one-time '
            'login, Zero Trust systems continuously reassess trust based '
            'on real-time signal — is this the device the user normally '
            'uses? Is this the location they normally connect from? Is '
            'this the time of day they normally work? A login that looks '
            'perfectly normal at 9 AM from a known device might trigger '
            'additional verification, or be blocked outright, if it '
            'suddenly appears at 3 AM from an unrecognized device in a '
            'different country — the identity itself is treated as '
            'something whose trustworthiness adapts continuously, not a '
            'fixed fact established once at login.',
      ),
      LessonSection(
        heading: 'Policy-Driven Access',
        body:
            'Instead of broad, static rules like "employees can access '
            'the internal network," Zero Trust enforces granular, '
            'explicit policies evaluated for every single request: this '
            'specific user, on this specific device, in this specific '
            'context, requesting this specific resource — approved or '
            'denied based on policy, not on which network segment they '
            'happen to be connected to.',
      ),
      LessonSection(
        heading: 'The Control Plane and the Data Plane',
        body:
            'Zero Trust architecture separates two distinct '
            'responsibilities. The control plane makes the actual access '
            'decision — evaluating identity, device health, and policy '
            'to decide whether a request should be approved. The data '
            'plane is where the approved traffic actually flows once '
            'access has been granted. Separating these means every '
            'access decision passes through consistent, centralized '
            'policy evaluation before any data plane traffic is ever '
            'permitted to move, rather than relying on network location '
            'alone to implicitly grant access.',
      ),
      LessonSection(
        heading: 'How This Connects to What You\'ve Already Learned',
        body:
            'Zero Trust isn\'t a completely separate concept — it\'s a '
            'formal architecture built from principles you\'ve already '
            'studied in this very module: least privilege (from the '
            'Authentication and Authorization lessons), strong MFA-based '
            'authentication, and continuous accounting and monitoring, '
            'all applied everywhere continuously rather than being '
            'relaxed once someone is "inside." You\'ll revisit Zero '
            'Trust in far greater technical depth in the Capstone module, '
            'once you\'ve built up the networking, identity, and '
            'operations knowledge that a full Zero Trust implementation '
            'actually depends on.',
      ),
    ],
  ),

  // 11 ----------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    quiz: [
      QuizQuestion(
        question: 'Which part of the CIA Triad ensures systems remain '
            'accessible to authorized users when needed?',
        options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
        correctIndex: 2,
        explanation: 'Availability means authorized users can access systems and data when they need them.',
      ),
      QuizQuestion(
        question: 'What is the difference between a threat and a vulnerability?',
        options: [
          'They mean the same thing',
          'A threat is a weakness; a vulnerability is a source of harm',
          'A threat is a potential source of harm; a vulnerability is a weakness that could be exploited',
          'Vulnerabilities only apply to hardware',
        ],
        correctIndex: 2,
        explanation: 'Threat = potential danger. Vulnerability = the gap that threat could exploit.',
      ),
      QuizQuestion(
        question: 'Which authentication factor is a hardware token?',
        options: ['Something you know', 'Something you have', 'Something you are', 'Something you feel'],
        correctIndex: 1,
        explanation: 'A hardware token is a physical device — something you have.',
      ),
      QuizQuestion(
        question: 'Why is hashing used for storing passwords instead of encryption?',
        options: [
          'Hashing is faster than encryption',
          'Hashing is reversible, so passwords can be recovered',
          'Hashing is one-way, so even if the stored hash leaks, the original password isn\'t directly recoverable',
          'Encryption doesn\'t work on passwords',
        ],
        correctIndex: 2,
        explanation: 'One-way hashing means a leaked database doesn\'t hand attackers plaintext passwords directly.',
      ),
      QuizQuestion(
        question: 'A company buys cyber insurance instead of building '
            'extra controls for a low-probability risk. Which strategy is this?',
        options: ['Avoid', 'Mitigate', 'Transfer', 'Accept'],
        correctIndex: 2,
        explanation: 'Shifting financial exposure to an insurer is risk transfer.',
      ),
      QuizQuestion(
        question: 'Which threat actor type is typically the most well-funded '
            'and strategically motivated?',
        options: ['Script kiddies', 'Hacktivists', 'Nation-state actors', 'Insiders'],
        correctIndex: 2,
        explanation: 'Nation-state actors have the greatest resources and long-term strategic goals.',
      ),
      QuizQuestion(
        question: 'What does the Principle of Least Privilege mean?',
        options: [
          'All users should have administrator rights for efficiency',
          'Users and processes should have only the minimum access required to do their job',
          'Privileged accounts should never be used',
          'Passwords should be at least 8 characters long',
        ],
        correctIndex: 1,
        explanation: 'Least privilege limits access to minimize the impact of a compromised account.',
      ),
      QuizQuestion(
        question: 'Which of the following is a governance framework used to '
            'structure an organization\'s security program?',
        options: ['BitLocker', 'NIST Cybersecurity Framework', 'WPA3', 'SMTP'],
        correctIndex: 1,
        explanation: 'The NIST CSF is a widely used, vendor-neutral framework for organizing a security program.',
      ),
      QuizQuestion(
        question: 'An attacker modifies a bank transfer amount without either '
            'party knowing. Which CIA property failed?',
        options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
        correctIndex: 1,
        explanation: 'Unauthorized modification of data is an Integrity failure.',
      ),
      QuizQuestion(
        question: 'What is the attack surface?',
        options: [
          'The number of employees in a company',
          'Everything exposed to potential attackers including ports, applications, and entry points',
          'The area inside a building accessible to visitors',
          'The total number of security controls in place',
        ],
        correctIndex: 1,
        explanation: 'The attack surface is everything that could be reached or exploited by an attacker.',
      ),
      QuizQuestion(
        question: 'MFA requires at least how many authentication factors?',
        options: ['One', 'Two', 'Three', 'Four'],
        correctIndex: 1,
        explanation: 'MFA combines two or more factors for stronger authentication.',
      ),
      QuizQuestion(
        question: 'Which is an example of a social engineering attack?',
        options: [
          'SQL injection',
          'A phishing email tricking someone into revealing credentials',
          'A DDoS attack',
          'A buffer overflow exploit',
        ],
        correctIndex: 1,
        explanation: 'Social engineering manipulates people rather than exploiting technical vulnerabilities.',
      ),
      QuizQuestion(
        question: 'Asymmetric encryption uses which type of key pair?',
        options: [
          'Two identical shared keys',
          'A public key and a private key',
          'A master key and a session key',
          'A certificate and a password',
        ],
        correctIndex: 1,
        explanation: 'Asymmetric encryption uses a public key to encrypt and a private key to decrypt.',
      ),
      QuizQuestion(
        question: 'What type of policy defines what employees may and may not do '
            'with company systems?',
        options: [
          'Incident Response Policy',
          'Data Classification Policy',
          'Acceptable Use Policy',
          'BYOD Policy',
        ],
        correctIndex: 2,
        explanation: 'The Acceptable Use Policy governs how employees may use company systems.',
      ),
      QuizQuestion(
        question: 'Ransomware is best described as:',
        options: [
          'A type of network scanner',
          'Malware that encrypts data and demands payment',
          'A social engineering technique',
          'A firewall rule',
        ],
        correctIndex: 1,
        explanation: 'Ransomware encrypts victim data and extorts payment for the decryption key.',
      ),
      QuizQuestion(
        question: 'Which risk treatment strategy eliminates the activity that '
            'creates the risk?',
        options: ['Accept', 'Mitigate', 'Transfer', 'Avoid'],
        correctIndex: 3,
        explanation: 'Risk avoidance eliminates the risky activity entirely.',
      ),
      QuizQuestion(
        question: 'A zero-day vulnerability is one that:',
        options: [
          'Has existed for zero days',
          'Is unknown to the vendor and has no available patch',
          'Only affects zero users',
          'Has been patched but not applied',
        ],
        correctIndex: 1,
        explanation: 'A zero-day is a vulnerability unknown to the vendor, leaving zero days of prior defense.',
      ),
      QuizQuestion(
        question: 'What does HTTPS provide that HTTP does not?',
        options: [
          'Faster page loading',
          'Encryption of traffic between browser and server',
          'Larger file transfer limits',
          'Automatic password storage',
        ],
        correctIndex: 1,
        explanation: 'HTTPS uses TLS to encrypt data in transit, protecting it from interception.',
      ),
      QuizQuestion(
        question: 'Which of these is a preventive control against account takeover?',
        options: [
          'Security audit logs',
          'Intrusion detection system',
          'Multi-factor authentication',
          'Incident response plan',
        ],
        correctIndex: 2,
        explanation: 'MFA prevents account takeover even when a password is compromised.',
      ),
      QuizQuestion(
        question: 'Data classification policies exist to:',
        options: [
          'Speed up data processing',
          'Define how data is labeled and handled based on sensitivity',
          'Automatically encrypt all files',
          'Replace the need for access controls',
        ],
        correctIndex: 1,
        explanation: 'Data classification ensures sensitive data is identified and handled appropriately.',
      ),
      QuizQuestion(
        question: 'A supply chain attack targets:',
        options: [
          'Physical warehouses',
          'A trusted vendor or software provider to reach their customers',
          'The company cafeteria supply',
          'Shipping logistics systems',
        ],
        correctIndex: 1,
        explanation: 'Supply chain attacks compromise a trusted third party to indirectly reach the target.',
      ),
      QuizQuestion(
        question: 'What is a digital certificate used for?',
        options: [
          'Storing passwords securely',
          'Binding a public key to a verified identity',
          'Compressing data',
          'Speeding up encryption',
        ],
        correctIndex: 1,
        explanation: 'A digital certificate ties a public key to an identity so others can verify they are communicating with the real entity.',
      ),
      QuizQuestion(
        question: 'The Security Reference Monitor in Windows enforces:',
        options: [
          'Network firewall rules',
          'Access control decisions for all system resources',
          'Antivirus scanning',
          'Windows Update policies',
        ],
        correctIndex: 1,
        explanation: 'The SRM is the kernel component that enforces every access control decision.',
      ),
      QuizQuestion(
        question: 'Hacktivists are primarily motivated by:',
        options: [
          'Financial gain',
          'Ideological or political causes',
          'Technical curiosity',
          'Nation-state intelligence objectives',
        ],
        correctIndex: 1,
        explanation: 'Hacktivists target organizations they oppose for ideological or political reasons.',
      ),
      QuizQuestion(
        question: 'Which action best demonstrates the Principle of Least Privilege?',
        options: [
          'Giving every employee admin rights',
          'Creating a dedicated service account with only the permissions that service needs',
          'Disabling all user accounts',
          'Sharing one admin account across the team',
        ],
        correctIndex: 1,
        explanation: 'A purpose-specific service account with minimal permissions is least privilege in practice.',
      ),
      QuizQuestion(
        question: 'What are the four steps of the risk management process, in order?',
        options: [
          'Assess, Identify, Monitor, Treat',
          'Identify, Assess, Treat, Monitor',
          'Treat, Identify, Monitor, Assess',
          'Monitor, Treat, Identify, Assess',
        ],
        correctIndex: 1,
        explanation: 'The risk management cycle is Identify, Assess, Treat, Monitor — and it repeats continuously.',
      ),
      QuizQuestion(
        question: 'What does non-repudiation prevent?',
        options: [
          'Unauthorized data access',
          'A party credibly denying they performed a specific action, such as sending a message or approving a transaction',
          'Systems becoming unavailable',
          'Passwords from being guessed',
        ],
        correctIndex: 1,
        explanation: 'Non-repudiation provides verifiable proof tying an action to a specific party, so it cannot be credibly denied.',
      ),
      QuizQuestion(
        question: 'A digital signature achieves non-repudiation by combining which two elements?',
        options: [
          'A firewall rule and a VPN',
          'A hash digest of the message and a signature created with the sender\'s private key',
          'A username and a password',
          'An IP address and a MAC address',
        ],
        correctIndex: 1,
        explanation: 'The hash detects tampering; signing with the private key proves only the genuine sender could have produced that signature.',
      ),
      QuizQuestion(
        question: 'What does a 99.99% availability SLA ("four nines") roughly translate to per year?',
        options: [
          'About 3.65 days of downtime',
          'About 8.76 hours of downtime',
          'About 52.6 minutes of downtime',
          'Zero downtime',
        ],
        correctIndex: 2,
        explanation: '99.99% availability allows roughly 52.6 minutes of downtime per year — a common target for critical business systems.',
      ),
      QuizQuestion(
        question: 'Why is 100% availability generally not a realistic or sensible target?',
        options: [
          'It is technically impossible to measure',
          'Beyond a certain point, each additional "nine" of availability costs disproportionately more relative to the benefit gained',
          'Availability does not matter for security',
          'Most systems already achieve 100% by default',
        ],
        correctIndex: 1,
        explanation: 'Organizations choose a deliberate availability target based on cost and business impact rather than chasing an unrealistic 100%.',
      ),
      QuizQuestion(
        question: 'RBAC (Role-Based Access Control) grants permissions based on:',
        options: [
          'A user\'s individual, one-off assigned permissions',
          'A user\'s role within the organization',
          'The current time of day only',
          'The network location of the request only',
        ],
        correctIndex: 1,
        explanation: 'RBAC assigns permissions to roles, and users inherit permissions through their role membership.',
      ),
      QuizQuestion(
        question: 'ABAC (Attribute-Based Access Control) differs from RBAC because it:',
        options: [
          'Only considers a user\'s job title',
          'Evaluates a combination of attributes about the user, resource, and context together, not just a fixed role',
          'Removes the need for authentication entirely',
          'Only applies to physical access control',
        ],
        correctIndex: 1,
        explanation: 'ABAC combines multiple attributes (user, resource, context) for more precise, context-aware access decisions than RBAC alone.',
      ),
      QuizQuestion(
        question: 'In the AAA model, what does the "Accounting" component specifically provide?',
        options: [
          'Verification of identity',
          'Determination of permissions',
          'Monitoring and logging of what an authenticated, authorized identity actually does',
          'Encryption of stored data',
        ],
        correctIndex: 2,
        explanation: 'Accounting is the ongoing logging of user actions, supporting compliance, forensics, and accountability.',
      ),
      QuizQuestion(
        question: 'A visible warning sign stating that a facility is monitored by security cameras is an example of which control type?',
        options: ['Preventative', 'Deterrent', 'Corrective', 'Compensating'],
        correctIndex: 1,
        explanation: 'A deterrent control discourages an attempt without necessarily stopping it technically.',
      ),
      QuizQuestion(
        question: 'Restoring a system from backup after an incident is an example of which control type?',
        options: ['Preventative', 'Detective', 'Corrective', 'Directive'],
        correctIndex: 2,
        explanation: 'Corrective controls reduce impact and restore normal operation after an incident has occurred.',
      ),
      QuizQuestion(
        question: 'Which of the following best describes the Zero Trust principle of "adaptive identity"?',
        options: [
          'Granting access once at login and never re-checking it',
          'Continuously reassessing trust using real-time signals like device, location, and behavior rather than a single static login check',
          'Removing the need for authentication after the first login',
          'Trusting all requests from inside the corporate network by default',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust continuously reevaluates trust based on real-time context rather than treating a single login as permanently sufficient.',
      ),
    ],
  ),
];
