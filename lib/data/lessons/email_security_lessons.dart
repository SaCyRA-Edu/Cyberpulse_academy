import '../lesson_model.dart';

const List<Lesson> emailSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'How Email Works',
    sections: [
      LessonSection(
        heading: 'The Basic Flow',
        body:
            'When you send an email, your mail client hands it to a '
            'sending mail server, which uses SMTP (Simple Mail Transfer '
            'Protocol) to relay it — often through several servers — until '
            'it reaches the recipient\'s mail server.',
      ),
      LessonSection(
        heading: 'Why This Matters for Security',
        body:
            'SMTP, by design, doesn\'t verify who actually sent a message — '
            'similar to how anyone can write any return address on a '
            'paper envelope. This is the root cause behind email spoofing, '
            'which the next few lessons address.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Phishing',
    sections: [
      LessonSection(
        heading: 'What is Phishing?',
        body:
            'Phishing is a deceptive message designed to trick the '
            'recipient into revealing sensitive information, clicking a '
            'malicious link, or opening a harmful attachment.',
      ),
      LessonSection(
        heading: 'Common Variations',
        bullets: [
          'Spear phishing — highly targeted at a specific person, often using personal details',
          'Business Email Compromise (BEC) — impersonating an executive or vendor to request a wire transfer or sensitive data',
          'Whaling — phishing aimed specifically at senior executives',
          'Smishing/Vishing — the same tactic over SMS text or phone calls instead of email',
        ],
      ),
      LessonSection(
        heading: 'Common Red Flags',
        bullets: [
          'Urgency or pressure to act immediately',
          'Requests that bypass normal process (e.g. "don\'t tell anyone, just wire this now")',
          'Mismatched or slightly altered sender addresses',
          'Unexpected attachments or links, especially from unfamiliar senders',
          'Generic greetings on a message claiming to be personal or urgent',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Spotting Suspicious Emails',
    sections: [
      LessonSection(
        heading: 'Check the Sender, Not Just the Display Name',
        body:
            'Display names can say anything. Always check the actual '
            'email address behind it — attackers often use addresses that '
            'are close to a real domain but not quite right (for example, '
            'swapping a letter or adding an extra word).',
      ),
      LessonSection(
        heading: 'Before Clicking a Link',
        bullets: [
          'Hover over the link to preview the actual destination URL',
          'Look closely at the domain — is it really the company\'s site?',
          'When in doubt, navigate to the site directly rather than clicking',
        ],
      ),
      LessonSection(
        heading: 'Before Opening an Attachment',
        bullets: [
          'Were you expecting this file from this sender?',
          'Does the file type make sense for the context (an invoice as a .exe is a red flag)?',
          'If unsure, verify with the sender through a separate channel before opening',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Email Authentication: SPF, DKIM & DMARC',
    sections: [
      LessonSection(
        heading: 'The Problem They Solve',
        body:
            'Because basic email doesn\'t verify the sender, these three '
            'standards work together to let receiving mail servers check '
            'whether a message claiming to be from a domain is actually '
            'legitimate.',
      ),
      LessonSection(
        heading: 'SPF (Sender Policy Framework)',
        body:
            'Publishes a list of mail servers authorized to send email on '
            'behalf of a domain. If a message arrives from a server not on '
            'that list, it looks suspicious.',
      ),
      LessonSection(
        heading: 'DKIM (DomainKeys Identified Mail)',
        body:
            'Adds a digital signature to outgoing mail, letting the '
            'receiving server verify the message wasn\'t altered in '
            'transit and genuinely came from the claimed domain.',
      ),
      LessonSection(
        heading: 'DMARC (Domain-based Message Authentication)',
        body:
            'Tells receiving servers what to do if a message fails SPF or '
            'DKIM checks — quarantine it, reject it outright, or just '
            'report on it — and gives domain owners visibility into who '
            'is sending mail using their domain.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Malicious Attachments & Links',
    sections: [
      LessonSection(
        heading: 'How Attachments Are Weaponized',
        body:
            'Attackers often hide malicious code inside seemingly normal '
            'files — documents with malicious macros, disguised '
            'executables, or files designed to exploit a flaw in the '
            'program that opens them.',
      ),
      LessonSection(
        heading: 'How Malicious Links Work',
        bullets: [
          'Credential harvesting — a fake login page that captures whatever you type in',
          'Drive-by downloads — malware that installs automatically when a page loads',
          'Redirect chains — a "safe-looking" link that bounces through several redirects to hide its real destination',
        ],
      ),
      LessonSection(
        heading: 'Organizational Defenses',
        bullets: [
          'Email filtering/sandboxing — scanning or running attachments in an isolated environment before delivery',
          'Link rewriting — routing clicked links through a security check first',
          'Disabling risky file types or macros by default',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Reporting & Response',
    sections: [
      LessonSection(
        heading: 'Why Reporting Matters',
        body:
            'When someone reports a phishing email, it doesn\'t just '
            'protect them — it helps the security team identify and block '
            'the same campaign before it reaches others in the '
            'organization.',
      ),
      LessonSection(
        heading: 'What to Do With a Suspicious Email',
        bullets: [
          'Don\'t click links or open attachments',
          'Use the organization\'s "Report Phishing" button if available',
          'If unsure whether a request is legitimate, verify directly with the sender through a known, separate channel',
        ],
      ),
      LessonSection(
        heading: 'If You Already Clicked',
        body:
            'Report it immediately anyway. Acting fast — disconnecting '
            'from the network, changing passwords, alerting the security '
            'team — limits the damage far more than staying quiet out of '
            'embarrassment.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Building Good Email Habits',
    sections: [
      LessonSection(
        heading: 'Everyday Habits',
        bullets: [
          'Pause before acting on urgent or unusual requests, especially involving money or credentials',
          'Verify unexpected requests through a second channel (call, in person, chat)',
          'Keep personal and work email separate',
          'Use MFA on your email account — it\'s one of the most valuable accounts to protect, since it\'s often used to reset other passwords',
        ],
      ),
      LessonSection(
        heading: 'Why Email Is Such a High-Value Target',
        body:
            'Email is frequently the front door for a wider attack — '
            'compromising one inbox can expose conversations, contacts, '
            'and a path to reset passwords on other accounts. Treating it '
            'casually undermines security elsewhere, even if email itself '
            'feels low-stakes.',
      ),
    ],
  ),

  // 8 ------------------------------------------------------------------ Quiz
  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'Why is basic email vulnerable to spoofing?',
        options: [
          'Email servers run very old software',
          'SMTP doesn\'t inherently verify who actually sent a message',
          'All emails are sent unencrypted',
          'Spoofing is only possible on mobile devices',
        ],
        correctIndex: 1,
        explanation:
            'SMTP was not originally designed to verify sender identity, '
            'which is what enables spoofing.',
      ),
      QuizQuestion(
        question: 'An email impersonates a company executive and asks an '
            'employee to urgently wire funds. This is an example of:',
        options: [
          'DKIM failure',
          'Business Email Compromise (BEC)',
          'DNS spoofing',
          'A firewall misconfiguration',
        ],
        correctIndex: 1,
        explanation:
            'BEC involves impersonating a trusted figure, often an '
            'executive, to request money or sensitive data.',
      ),
      QuizQuestion(
        question: 'What should you check before trusting a sender, '
            'beyond the display name?',
        options: [
          'The email\'s font',
          'The actual email address/domain behind the display name',
          'The time the email was sent',
          'The email\'s subject line length',
        ],
        correctIndex: 1,
        explanation:
            'Display names can be faked freely; the actual address and '
            'domain reveal more about legitimacy.',
      ),
      QuizQuestion(
        question: 'Which email authentication standard adds a digital '
            'signature to verify a message wasn\'t altered in transit?',
        options: ['SPF', 'DKIM', 'DMARC', 'VPN'],
        correctIndex: 1,
        explanation:
            'DKIM signs outgoing messages so receivers can verify '
            'authenticity and integrity.',
      ),
      QuizQuestion(
        question: 'What does DMARC primarily control?',
        options: [
          'Which servers are allowed to send mail for a domain',
          'How attachments are scanned',
          'What action to take when a message fails SPF/DKIM checks',
          'The encryption strength of email traffic',
        ],
        correctIndex: 2,
        explanation:
            'DMARC tells receiving servers what to do — quarantine, '
            'reject, or just report — when SPF/DKIM checks fail.',
      ),
      QuizQuestion(
        question: 'What is "credential harvesting" in the context of '
            'malicious links?',
        options: [
          'Automatically generating strong passwords',
          'A fake login page designed to capture whatever you type in',
          'A tool that stores passwords securely',
          'A method for resetting forgotten passwords',
        ],
        correctIndex: 1,
        explanation:
            'Credential harvesting uses a convincing fake login page to '
            'steal usernames and passwords.',
      ),
      QuizQuestion(
        question: 'If you accidentally click a suspicious link, what '
            'should you do?',
        options: [
          'Say nothing and hope it was harmless',
          'Wait a few days to see if anything happens',
          'Report it immediately, even though it\'s uncomfortable',
          'Only mention it if asked directly',
        ],
        correctIndex: 2,
        explanation:
            'Reporting immediately allows the security team to respond '
            'quickly and limit any damage.',
      ),
      QuizQuestion(
        question: 'Why is enabling MFA on an email account especially '
            'valuable?',
        options: [
          'It makes emails load faster',
          'Email is often used to reset passwords on other accounts, making it a high-value target',
          'It removes the need for spam filters',
          'It automatically blocks all phishing emails',
        ],
        correctIndex: 1,
        explanation:
            'Because email often controls password resets elsewhere, '
            'compromising it can cascade into other accounts — making MFA '
            'especially important there.',
      ),
    ],
  ),
];
