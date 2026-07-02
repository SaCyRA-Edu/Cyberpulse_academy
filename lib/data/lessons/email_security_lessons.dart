import '../lesson_model.dart';

const List<Lesson> emailSecurityLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'The Anatomy of a Real Phishing Attack',
    isAudio: true,
    sections: [
      LessonSection(
        heading: 'A True Story',
        body:
            'This is an audio lesson. Sit back and listen. A transcript '
            'is shown below.',
      ),
      LessonSection(
        heading: 'It Started With One Email',
        body:
            'In early 2016, an accountant at a mid-sized company received '
            'an email from what appeared to be her CEO. The message was '
            'short, direct, and carried the kind of casual authority that '
            'made her not want to question it. It asked her to wire '
            '47,000 dollars to a vendor account for an urgent acquisition '
            'that had to close before end of day. She did it. The money '
            'was gone within hours, routed through multiple accounts '
            'across three countries. The CEO had never sent the email.',
      ),
      LessonSection(
        heading: 'How It Was Built',
        body:
            'The attacker had spent several days on reconnaissance before '
            'sending a single message. They found the CEO\'s name and email '
            'format from the company website. They found the accountant\'s '
            'name and role from LinkedIn. They looked at the company\'s '
            'press releases to understand its acquisition history. The '
            'email they crafted referenced a real upcoming deal — using '
            'information that was already public — and was sent from a '
            'domain that looked almost identical to the real one, with one '
            'letter transposed.',
      ),
      LessonSection(
        heading: 'What Made It Work',
        body:
            'Three things made this attack succeed. First, urgency — the '
            'end-of-day deadline left no time to verify. Second, '
            'authority — the email came from the CEO, or appeared to. '
            'Third, process failure — there was no policy requiring a '
            'second confirmation channel for wire transfers above a '
            'certain amount. Any one of those three things being different '
            'would likely have stopped it.',
      ),
      LessonSection(
        heading: 'The Lesson',
        body:
            'Phishing attacks aren\'t crude. The best ones are tailored, '
            'researched, and timed. The defense isn\'t just a spam filter '
            '— it\'s knowing the patterns, slowing down when something '
            'feels urgent, and having processes that make it hard to act '
            'on a single email alone. That\'s what this module is about.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'How Email Works: SMTP, IMAP & POP3',
    sections: [
      LessonSection(
        heading: 'The Journey of an Email',
        body:
            'When you hit send, your email client hands the message to '
            'your outgoing mail server using SMTP (Simple Mail Transfer '
            'Protocol). That server looks up the recipient\'s mail server '
            'via DNS and forwards the message — often through several '
            'relay servers — until it arrives at the destination.',
      ),
      LessonSection(
        heading: 'The Protocols',
        bullets: [
          'SMTP (port 25/587) — sends outgoing mail between servers',
          'IMAP (port 143/993) — retrieves mail from a server, keeping it synced across devices',
          'POP3 (port 110/995) — downloads mail from a server to a single device (older approach)',
        ],
      ),
      LessonSection(
        heading: 'Why SMTP Is the Security Problem',
        body:
            'SMTP was designed decades ago with no built-in way to verify '
            'who actually sent a message. Anyone can write any return '
            'address on an email — just like on a paper envelope. This '
            'fundamental design gap is what makes email spoofing, '
            'phishing, and impersonation possible at scale.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Phishing, Spear Phishing & Whaling',
    sections: [
      LessonSection(
        heading: 'The Spectrum of Deceptive Email',
        bullets: [
          'Phishing — bulk, generic deception aimed at many recipients simultaneously',
          'Spear phishing — highly targeted, personalized attack on a specific individual',
          'Whaling — spear phishing aimed specifically at executives or high-value targets',
          'Smishing — same tactics over SMS text messages',
          'Vishing — voice phishing, conducted over phone calls',
        ],
      ),
      LessonSection(
        heading: 'The Attacker\'s Toolkit',
        bullets: [
          'OSINT (Open Source Intelligence) — mining LinkedIn, company websites, social media for targeting info',
          'Lookalike domains — registering domains visually similar to the real one',
          'Display name spoofing — showing a trusted name while hiding a malicious address',
          'Urgency and authority — using time pressure and impersonation to bypass critical thinking',
        ],
      ),
      LessonSection(
        heading: 'Red Flags That Appear in Most Phishing Emails',
        bullets: [
          'Pressure to act urgently before thinking it through',
          'Requests that bypass normal process ("don\'t tell anyone, just do this now")',
          'Mismatched or slightly altered sender domains',
          'Generic greetings on messages claiming to be personal',
          'Unexpected links or attachments',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Business Email Compromise (BEC)',
    sections: [
      LessonSection(
        heading: 'The Most Costly Email Attack',
        body:
            'Business Email Compromise consistently ranks as the highest-'
            'dollar category of cybercrime globally. Unlike ransomware, '
            'it doesn\'t need malware. It just needs a convincing email, '
            'the right target, and a moment of trust.',
      ),
      LessonSection(
        heading: 'Common BEC Scenarios',
        bullets: [
          'CEO fraud — impersonating an executive to request wire transfers or gift cards',
          'Invoice fraud — impersonating a vendor and redirecting legitimate payment to an attacker-controlled account',
          'Payroll diversion — impersonating an employee to redirect their salary to a new account',
          'Attorney/legal impersonation — claiming urgent legal matters require immediate payment',
        ],
      ),
      LessonSection(
        heading: 'Why It Works So Well',
        body:
            'BEC exploits hierarchy, trust, and process gaps. A junior '
            'employee receiving an urgent request from "the CEO" or "legal" '
            'is often reluctant to question or delay. The solution isn\'t '
            'just awareness — it\'s process: dual approval for wire '
            'transfers, verbal confirmation via a known number for any '
            'change to payment details.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Reading Email Headers',
    sections: [
      LessonSection(
        heading: 'What Email Headers Reveal',
        body:
            'The visible "From:" line in any email is just a label — '
            'it can say anything. The email headers (hidden metadata '
            'in every message) contain the actual routing path, '
            'originating server, and authentication results that reveal '
            'whether a message is really what it claims to be.',
      ),
      LessonSection(
        heading: 'Key Header Fields',
        bullets: [
          'Received: — the chain of servers the email passed through; read bottom-up',
          'Return-Path: — where bounces go; often different from the "From:" address in spoofed mail',
          'X-Originating-IP: — the IP address that originally submitted the message',
          'Authentication-Results: — the server\'s report on SPF, DKIM, and DMARC checks',
        ],
      ),
      LessonSection(
        heading: 'How to View Headers',
        body:
            'In Gmail: open the email → three-dot menu → "Show original." '
            'In Outlook: open the email → File → Properties → "Internet '
            'headers." The Authentication-Results field is the quickest '
            'signal: a DMARC "fail" or DKIM "none" on a message claiming '
            'to be from a trusted domain is a strong red flag.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Email Authentication: SPF, DKIM & DMARC',
    sections: [
      LessonSection(
        heading: 'Why These Three Exist',
        body:
            'Because SMTP can\'t verify senders, these three DNS-based '
            'standards were layered on top to let receiving mail servers '
            'check whether a message claiming to be from a domain was '
            'actually authorized by that domain.',
      ),
      LessonSection(
        heading: 'SPF — Sender Policy Framework',
        body:
            'The domain owner publishes a list of IP addresses authorized '
            'to send email on its behalf. If a message arrives from a '
            'server not on that list, the receiving server knows something '
            'is off.',
      ),
      LessonSection(
        heading: 'DKIM — DomainKeys Identified Mail',
        body:
            'The sending server adds a cryptographic signature to outgoing '
            'mail. The receiving server verifies that signature against '
            'a public key published in DNS, confirming the message '
            'wasn\'t altered in transit.',
      ),
      LessonSection(
        heading: 'DMARC — Domain-based Message Authentication',
        body:
            'DMARC ties SPF and DKIM together. It tells receiving servers '
            'what to do when a message fails both checks — reject it, '
            'quarantine it, or just report it — and gives domain owners '
            'visibility into who is sending mail using their domain.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Safe Link & Attachment Practices',
    sections: [
      LessonSection(
        heading: 'How Malicious Links Work',
        bullets: [
          'Credential harvesting — a fake login page captures your username and password',
          'Drive-by download — simply visiting a page installs malware',
          'Redirect chains — a seemingly safe link bounces through multiple URLs to hide its true destination',
          'URL shorteners — used to mask the real destination from a quick visual check',
        ],
      ),
      LessonSection(
        heading: 'Before Clicking Any Link',
        bullets: [
          'Hover over it first — most email clients show the real destination in a status bar',
          'Check the domain carefully — look for typos and extra subdomains',
          'When in doubt, navigate directly to the site rather than clicking',
          'If it\'s asking for credentials, question why',
        ],
      ),
      LessonSection(
        heading: 'Attachment Red Flags',
        bullets: [
          'Executables disguised as documents (.exe, .scr, .bat, or double extensions like ".pdf.exe")',
          'Office documents asking you to "Enable Macros" or "Enable Editing"',
          'Unexpected ZIP or archive files, even from known contacts',
          'Any attachment you weren\'t expecting — verify with the sender through a separate channel first',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Reporting & Responding to Suspicious Email',
    sections: [
      LessonSection(
        heading: 'Why Reporting Matters Beyond Self-Protection',
        body:
            'When you report a phishing email, you don\'t just protect '
            'yourself — you alert the security team to a campaign that '
            'may be targeting dozens of colleagues simultaneously. One '
            'report can stop an attack that would otherwise succeed '
            'against someone else.',
      ),
      LessonSection(
        heading: 'What to Do With a Suspicious Email',
        bullets: [
          'Don\'t click any links or open any attachments',
          'Use your organization\'s "Report Phishing" button if available',
          'If unsure whether a request is legitimate, verify directly through a known phone number or in person — not by replying to the email',
          'Forward it to your security team with a note on why it seemed suspicious',
        ],
      ),
      LessonSection(
        heading: 'If You Already Clicked',
        body:
            'Report it immediately. Disconnect from the network if you '
            'believe malware may have installed. Change any credentials '
            'you may have entered. Acting within minutes vs. hours makes '
            'a significant difference in containing the damage. No one '
            'will judge you for reporting — staying quiet is far more '
            'harmful.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Building an Email-Secure Culture',
    sections: [
      LessonSection(
        heading: 'Technology Alone Isn\'t Enough',
        body:
            'Spam filters, link-scanning, and sandboxing catch a lot — '
            'but not everything. The most sophisticated phishing emails '
            'are specifically designed to pass technical filters. A '
            'security-aware team is the layer that catches what the tools '
            'miss.',
      ),
      LessonSection(
        heading: 'Organizational Habits That Help',
        bullets: [
          'Phishing simulation exercises — controlled fake phishing campaigns to measure and build awareness',
          'Clear escalation paths — employees know exactly who to contact and how',
          'No-blame reporting culture — people report mistakes faster if they won\'t be punished',
          'Process controls — dual approval for sensitive actions (wire transfers, credential changes) so no single email can trigger them alone',
        ],
      ),
      LessonSection(
        heading: 'Your Personal Email Hygiene',
        bullets: [
          'Enable MFA on your email account — it\'s the password reset key to everything else',
          'Use a unique password for your email account; don\'t reuse it anywhere',
          'Keep personal and work email separate',
          'Be skeptical of urgency — slow down when something demands immediate action',
        ],
      ),
    ],
  ),

  // 10 ----------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'Why is SMTP considered the root cause of email spoofing?',
        options: [
          'SMTP transmits email too slowly',
          'SMTP has no built-in mechanism to verify who actually sent a message',
          'SMTP encrypts all email content',
          'SMTP requires a password for every message',
        ],
        correctIndex: 1,
        explanation: 'SMTP was designed without sender verification, allowing anyone to write any return address.',
      ),
      QuizQuestion(
        question: 'A highly targeted phishing email crafted using personal '
            'information about a specific victim is called:',
        options: ['Whaling', 'Spear phishing', 'Smishing', 'Vishing'],
        correctIndex: 1,
        explanation: 'Spear phishing is targeted at a specific individual using researched personal details.',
      ),
      QuizQuestion(
        question: 'An attacker impersonates a supplier and asks your accounts '
            'team to update payment bank details. This is:',
        options: [
          'DNS poisoning',
          'Business Email Compromise (BEC)',
          'A DDoS attack',
          'SQL injection',
        ],
        correctIndex: 1,
        explanation: 'Invoice/payment fraud is one of the most common BEC scenarios.',
      ),
      QuizQuestion(
        question: 'Which email authentication standard specifies what action '
            'to take when a message fails SPF and DKIM checks?',
        options: ['SPF', 'DKIM', 'DMARC', 'TLS'],
        correctIndex: 2,
        explanation: 'DMARC defines the enforcement policy (reject, quarantine, or report) for failed checks.',
      ),
      QuizQuestion(
        question: 'You receive an unexpected email from your CEO asking for '
            'an urgent wire transfer before end of day. What should you do first?',
        options: [
          'Process the transfer immediately to avoid delays',
          'Reply to the email to confirm',
          'Verify by calling the CEO on a known number before taking any action',
          'Forward it to the CFO and let them decide',
        ],
        correctIndex: 2,
        explanation: 'Verify urgent financial requests through a separate, verified channel — never by replying to the same email.',
      ),
      QuizQuestion(
        question: 'In email headers, which field shows the chain of servers '
            'the message passed through?',
        options: ['From:', 'Received:', 'Subject:', 'DKIM-Signature:'],
        correctIndex: 1,
        explanation: 'The Received: headers form the routing chain — read from bottom (origin) to top (destination).',
      ),
      QuizQuestion(
        question: 'Why is enabling MFA specifically important for your '
            'primary email account?',
        options: [
          'It makes email load faster',
          'Email is used to reset passwords on most other accounts, making it the master key',
          'It stops all spam automatically',
          'It is required by most email providers',
        ],
        correctIndex: 1,
        explanation: 'Compromising your email often means compromising everything else that uses it for password resets.',
      ),
      QuizQuestion(
        question: 'An Office document asks you to "Enable Macros" to view '
            'its content. What should you do?',
        options: [
          'Enable macros — it\'s just a display setting',
          'Be suspicious; this is a common malware delivery mechanism — verify with the sender first',
          'Save the file and resend it',
          'Enable macros only if the document looks professional',
        ],
        correctIndex: 1,
        explanation: 'Macro-enabled documents are one of the most common malware delivery methods via email.',
      ),
    ],
  ),
];
