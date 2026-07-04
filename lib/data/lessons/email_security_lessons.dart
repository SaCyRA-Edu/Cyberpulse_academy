import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> emailSecurityLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'The Anatomy of a Real Phishing Attack',
    isAudio: true,
    estimatedMinutes: 6,
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
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Journey of an Email, Step by Step',
        body:
            'When you hit send, your email client hands the message off '
            'to your outgoing mail server, which uses SMTP (Simple Mail '
            'Transfer Protocol) to relay it onward. That message often '
            'doesn\'t travel directly to its destination in one hop — it '
            'can pass through several intermediate relay servers, each '
            'one adding its own entry to the message\'s header trail, '
            'before finally arriving at the recipient\'s mail server '
            'seconds later.',
      ),
      LessonSection(
        heading: 'The Three Core Protocols',
        bullets: [
          'SMTP (port 25 for server-to-server relay, port 587 for client submission) — sends outgoing mail between servers and from clients to their outgoing server',
          'IMAP (port 143, or 993 encrypted) — retrieves mail from a server while keeping it synchronized across every device you check email on',
          'POP3 (port 110, or 995 encrypted) — downloads mail to a single device, historically removing it from the server afterward; largely superseded by IMAP for anyone using multiple devices',
        ],
      ),
      LessonSection(
        heading: 'Why SMTP Is the Root of So Many Email Security Problems',
        body:
            'SMTP was designed decades ago, in an era when the internet '
            'was a small, largely trusted research network, and it has no '
            'built-in mechanism whatsoever to verify that a sender is '
            'actually who their message claims to be. Anyone can put any '
            'return address on an outgoing email — functionally identical '
            'to writing any name and address you like on a paper envelope '
            'and dropping it in a mailbox. This single fundamental design '
            'gap, present since SMTP\'s earliest days, is what makes email '
            'spoofing, large-scale phishing, and executive impersonation '
            'possible at the massive scale we see today.',
      ),
      LessonSection(
        heading: 'How the Industry Has Patched This Gap',
        body:
            'Because rewriting SMTP itself from scratch was never '
            'realistic given how deeply embedded it is across the entire '
            'internet, the industry instead layered additional '
            'authentication standards on top — SPF, DKIM, and DMARC — '
            'which you\'ll examine in detail a little further into this '
            'module. These retrofitted protections have significantly '
            'reduced (though certainly not eliminated) the ease of '
            'convincing email spoofing, and understanding how they work '
            'is essential to understanding modern email defense.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Phishing, Spear Phishing & Whaling',
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'A Spectrum, Not a Single Category',
        bullets: [
          'Phishing — bulk, largely generic deception blasted out to as many recipients as possible, relying on sheer volume since even a tiny success rate can be profitable',
          'Spear phishing — a highly targeted, individually researched attack aimed at one specific person, using details gathered specifically about them',
          'Whaling — spear phishing specifically aimed at executives or other especially high-value targets, where a single success can be extraordinarily lucrative',
          'Smishing — the same underlying deceptive tactics, delivered over SMS text messages instead of email',
          'Vishing — the same tactics again, conducted over live phone calls, often now enhanced with AI voice cloning of a real, trusted person',
        ],
      ),
      LessonSection(
        heading: 'The Attacker\'s Actual Toolkit',
        bullets: [
          'OSINT (Open Source Intelligence) — systematically mining LinkedIn profiles, company websites, and social media for names, roles, and organizational relationships worth exploiting',
          'Lookalike domains — registering domains visually near-identical to a legitimate one, swapping a single character or adding an extra word',
          'Display name spoofing — showing a trusted, familiar name in the "From" field while the actual underlying email address is something entirely different and unrelated',
          'Urgency and authority — deliberately using time pressure combined with an apparent position of seniority to short-circuit a recipient\'s normal critical thinking',
        ],
      ),
      LessonSection(
        heading: 'Red Flags That Appear in Most Phishing Emails',
        bullets: [
          'Pressure to act urgently, before there\'s time to properly think it through',
          'A request that deliberately bypasses normal process ("don\'t tell anyone, just handle this quietly and quickly")',
          'A sender domain that\'s mismatched or subtly altered from the genuine one',
          'A generic, impersonal greeting on a message that claims to be personal or urgent',
          'An unexpected link or attachment, especially arriving from an unfamiliar sender',
        ],
      ),
      LessonSection(
        heading: 'Why Even Trained People Still Fall For It',
        body:
            'It\'s tempting to assume that phishing only succeeds against '
            'careless or untrained people. In reality, the most '
            'sophisticated spear phishing and whaling attacks are '
            'deliberately crafted to bypass exactly the awareness that '
            'general security training builds — a message referencing a '
            'genuinely real, currently ongoing deal, arriving at the '
            'precise moment someone is already stressed and moving '
            'quickly, from what looks like a completely legitimate '
            'source, doesn\'t trigger the same instinctive suspicion as an '
            'obviously badly-written mass spam message would. This is '
            'exactly why technical controls and organizational process — '
            'not awareness training alone — remain essential.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Business Email Compromise (BEC)',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Most Financially Costly Category of Email Attack',
        body:
            'Business Email Compromise consistently ranks among the '
            'highest-dollar categories of cybercrime tracked globally, '
            'year after year — frequently exceeding the total financial '
            'losses attributed to ransomware. Unlike ransomware, BEC '
            'requires no malware whatsoever. It needs only a convincing '
            'message, a well-chosen target, and a single moment where '
            'trust overrides verification.',
      ),
      LessonSection(
        heading: 'Common BEC Scenarios',
        bullets: [
          'CEO fraud — impersonating a senior executive to request an urgent wire transfer, gift cards, or sensitive employee data',
          'Invoice fraud — impersonating an established, trusted vendor and quietly redirecting a legitimate, already-expected payment to an attacker-controlled account instead',
          'Payroll diversion — impersonating an actual employee to redirect their own salary payment to a new, attacker-controlled bank account',
          'Attorney or legal impersonation — fabricating an urgent legal matter that supposedly demands immediate, confidential payment before proper verification can occur',
        ],
      ),
      LessonSection(
        heading: 'Why BEC Works So Reliably',
        body:
            'BEC exploits organizational hierarchy, established trust '
            'relationships, and process gaps rather than any technical '
            'vulnerability at all. A relatively junior employee receiving '
            'an urgent, seemingly legitimate request from "the CEO" or '
            '"legal" is understandably reluctant to question or delay it '
            '— challenging apparent authority doesn\'t come naturally in '
            'most workplace cultures. The genuinely effective defense '
            'isn\'t simply more awareness training, though that helps — '
            'it\'s hard process controls: dual approval required for any '
            'wire transfer above a defined threshold, and mandatory '
            'verbal confirmation through a previously known phone number '
            '(never a number provided in the suspicious email itself) '
            'for any change to existing payment details.',
      ),
      LessonSection(
        heading: 'Why BEC Slips Past Technical Filters',
        body:
            'Spam filters and malware scanners are built to catch '
            'malicious links, attachments, and known-bad sending '
            'infrastructure. A well-executed BEC email typically contains '
            'none of these things — it\'s simply well-written, plausible '
            'text, sent from a domain that may pass authentication checks '
            'if the attacker registered a genuinely valid lookalike '
            'domain. This is precisely why BEC remains so effective even '
            'against organizations with mature technical email security '
            'already in place.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Reading Email Headers',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'What Headers Reveal That the Visible Email Doesn\'t',
        body:
            'The "From:" line displayed in any email client is just a '
            'label, and as you\'ve already learned, it can say absolutely '
            'anything the sender wants it to say. The full email headers '
            '— hidden metadata carried with every single message — '
            'contain the actual routing path, the originating mail '
            'server, and the results of any authentication checks that '
            'were performed, which together reveal whether a message '
            'genuinely is what it claims to be.',
      ),
      LessonSection(
        heading: 'The Header Fields Worth Learning',
        bullets: [
          'Received: — the full chain of mail servers the message passed through on its way to you; read from bottom to top to trace it from origin to your inbox',
          'Return-Path: — the address any bounce notifications would go to; frequently different from the displayed "From:" address on spoofed mail',
          'X-Originating-IP: — the IP address that originally submitted the message into the mail system',
          'Authentication-Results: — the receiving server\'s own report on whether the message passed its SPF, DKIM, and DMARC checks',
        ],
      ),
      LessonSection(
        heading: 'How to Actually View Them',
        body:
            'In Gmail: open the message, click the three-dot menu, and '
            'select "Show original." In Outlook: open the message, go to '
            'File, then Properties, and look for "Internet headers." Once '
            'you\'re looking at the raw headers, Authentication-Results is '
            'usually the fastest, single most useful signal to check — a '
            'DMARC result of "fail" or a DKIM result of "none" on a '
            'message claiming to be from a well-known, established '
            'domain is an immediate, strong red flag worth investigating '
            'before taking the message at face value.',
      ),
      LessonSection(
        heading: 'A Habit Worth Building',
        body:
            'You don\'t need to inspect headers on every single email you '
            'receive — that would be impractical for normal daily use. '
            'But building the habit of checking headers specifically on '
            'anything unexpected, financially sensitive, or oddly urgent '
            'is a genuinely powerful, largely free defense that most '
            'people never think to use, precisely because it requires no '
            'special tools beyond what\'s already built into every '
            'mainstream email client.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Email Authentication: SPF, DKIM & DMARC',
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Three Standards Solving One Shared Problem',
        body:
            'Because plain SMTP can\'t verify a sender\'s identity on its '
            'own, these three DNS-based standards were developed and '
            'layered on top of it to let a receiving mail server '
            'independently check whether a message claiming to come from '
            'a particular domain was actually authorized to do so by that '
            'domain\'s legitimate owner.',
      ),
      LessonSection(
        heading: 'SPF — Sender Policy Framework',
        body:
            'A domain owner publishes a specific DNS record listing '
            'exactly which mail servers are authorized to send email on '
            'that domain\'s behalf. If a message arrives claiming to be '
            'from that domain but originating from a server not on the '
            'authorized list, the receiving server has immediate, '
            'concrete grounds for suspicion.',
      ),
      LessonSection(
        heading: 'DKIM — DomainKeys Identified Mail',
        body:
            'The sending mail server attaches a cryptographic signature '
            'to each outgoing message. The receiving server then '
            'verifies that signature against a public key the domain '
            'owner has published in DNS, confirming both that the '
            'message genuinely originated from an authorized sender and '
            'that its content wasn\'t altered anywhere along the way '
            'during transit.',
      ),
      LessonSection(
        heading: 'DMARC — Domain-based Message Authentication, Reporting & Conformance',
        body:
            'DMARC ties SPF and DKIM together into one coherent policy, '
            'explicitly telling receiving mail servers exactly what to do '
            'with a message that fails both checks — reject it outright, '
            'quarantine it into the recipient\'s spam folder, or simply '
            'monitor and report on it without taking direct action yet. '
            'DMARC also gives the domain owner visibility they wouldn\'t '
            'otherwise have — regular reports showing exactly who is '
            'sending email using their domain, including any '
            'unauthorized senders attempting to spoof it.',
      ),
      LessonSection(
        heading: 'How the Three Work Together in Practice',
        body:
            'A properly configured domain publishes all three records, '
            'and every incoming message gets checked against each of '
            'them in sequence.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['SPF Check', 'DKIM Check', 'DMARC Policy', 'Deliver / Quarantine / Reject'],
          caption:
              'A receiving mail server runs this sequence on every '
              'inbound message from a domain with SPF, DKIM, and DMARC '
              'all configured.',
        ),
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Safe Link & Attachment Practices',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'How Malicious Links Actually Work',
        bullets: [
          'Credential harvesting — a convincingly designed fake login page captures whatever username and password you type into it',
          'Drive-by downloads — malware installs automatically the moment you simply visit a compromised or malicious page, with no additional click required',
          'Redirect chains — a link that appears entirely safe at first glance bounces through several intermediate URLs before finally landing on its true, malicious destination, deliberately hiding it from casual inspection',
          'URL shorteners — used specifically to mask the real destination from a quick visual check, since the shortened link gives no visible clue about where it actually leads',
        ],
      ),
      LessonSection(
        heading: 'Before Clicking Any Link',
        bullets: [
          'Hover over it first — most email clients display the actual destination URL in a status bar or tooltip before you commit to clicking',
          'Check the domain carefully, specifically watching for subtle typos and unexpected extra subdomains',
          'When genuinely in doubt, navigate to the site directly by typing the known address yourself, rather than clicking the link at all',
          'If a link asks you to enter credentials, pause and question why that\'s being requested in this specific context',
        ],
      ),
      LessonSection(
        heading: 'Attachment Red Flags Worth Internalizing',
        bullets: [
          'Executable files disguised as ordinary documents (.exe, .scr, .bat, or double extensions like ".pdf.exe" designed to look like a harmless PDF at a glance)',
          'Office documents that prompt you to "Enable Macros" or "Enable Editing" before displaying their actual content',
          'Unexpected ZIP or other archive files, even ones apparently sent by a known, trusted contact whose account may itself be compromised',
          'Any attachment you genuinely weren\'t expecting — the safest response is verifying with the sender through a completely separate communication channel before opening it',
        ],
      ),
      LessonSection(
        heading: 'Why "It\'s From Someone I Know" Isn\'t Enough',
        body:
            'One of the most common and dangerous assumptions is trusting '
            'an attachment or link simply because it came from a familiar '
            'contact\'s email address. Compromised email accounts are '
            'frequently used to send malicious content to everyone in '
            'that person\'s existing contact list, precisely because '
            'recipients naturally trust messages that appear to come from '
            'someone they already know — the familiar sender is exactly '
            'what makes this particular tactic so effective.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Reporting & Responding to Suspicious Email',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Why Your Report Protects More Than Just You',
        body:
            'When you report a phishing email, you\'re not only '
            'protecting yourself — you\'re actively alerting the security '
            'team to a campaign that may simultaneously be targeting '
            'dozens of your colleagues at the exact same time. A single '
            'timely report can stop an attack that would otherwise '
            'succeed against someone else in the organization who hasn\'t '
            'yet received or noticed the same message.',
      ),
      LessonSection(
        heading: 'What to Do the Moment You Spot Something Suspicious',
        bullets: [
          'Don\'t click any links or open any attachments in the message',
          'Use your organization\'s dedicated "Report Phishing" button if one is available in your email client',
          'If you\'re unsure whether a request is genuinely legitimate, verify it directly through a known, separate channel — a phone call or an in-person conversation, never by replying to the suspicious email itself',
          'Forward the message to your security team along with a short note explaining specifically why it seemed suspicious to you',
        ],
      ),
      LessonSection(
        heading: 'If You Already Clicked Something',
        body:
            'Report it immediately regardless. Disconnect the affected '
            'device from the network if you have reason to believe '
            'malware may have already installed. Change any credentials '
            'you may have entered into a suspicious page. Acting within '
            'minutes rather than hours makes a genuinely significant '
            'difference in containing whatever damage might follow. '
            'Nobody at a well-run organization will judge you for '
            'reporting a mistake — staying quiet out of embarrassment is '
            'consistently far more damaging than the original mistake '
            'itself.',
      ),
      LessonSection(
        heading: 'The Organizational Response Behind the Scenes',
        body:
            'When a phishing report comes in, security teams typically '
            'move quickly through several steps: confirming the message '
            'is genuinely malicious, checking whether the same campaign '
            'reached other employees, blocking the sending domain and any '
            'malicious links at the email gateway, and, if any '
            'credentials were potentially exposed, resetting them '
            'immediately. Understanding this response process helps '
            'explain why prompt reporting genuinely matters — every '
            'minute a phishing campaign remains active is another minute '
            'someone else in the organization might fall for it.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Building an Email-Secure Culture',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Technology Alone Was Never Going to Be Enough',
        body:
            'Spam filters, link-scanning gateways, and attachment '
            'sandboxing catch a genuinely large share of malicious email '
            '— but not all of it, and never will. The most sophisticated '
            'phishing emails are specifically designed and tested to pass '
            'right through standard technical filters. A genuinely '
            'security-aware workforce is the layer that catches exactly '
            'what the automated tools inevitably miss.',
      ),
      LessonSection(
        heading: 'Organizational Habits That Genuinely Help',
        bullets: [
          'Phishing simulation exercises — controlled, realistic fake phishing campaigns run internally to measure and deliberately build awareness over time, in a safe environment where mistakes have no real consequence',
          'Clear escalation paths — every employee knows exactly who to contact and precisely how, without having to guess or search for the right process',
          'A genuine no-blame reporting culture — people report mistakes and suspicious activity far faster when they know they won\'t be punished or ridiculed for it',
          'Hard process controls — dual approval requirements for sensitive actions like wire transfers or credential changes, ensuring no single email alone can trigger them regardless of how convincing it is',
        ],
      ),
      LessonSection(
        heading: 'Your Own Personal Email Hygiene',
        bullets: [
          'Enable MFA on your email account specifically — it frequently functions as the master key that can reset passwords on many of your other accounts',
          'Use a genuinely unique password for your email account, and never reuse it anywhere else',
          'Keep personal and work email accounts entirely separate from one another',
          'Cultivate a healthy default skepticism toward urgency — deliberately slow down whenever a message seems to demand immediate action',
        ],
      ),
      LessonSection(
        heading: 'Bringing the Whole Module Together',
        body:
            'Across this module you\'ve learned why SMTP\'s original '
            'design makes spoofing possible, how SPF, DKIM, and DMARC '
            'were retrofitted to close that gap, how to read the headers '
            'that reveal a message\'s true origin, and the specific '
            'social engineering patterns that make phishing and BEC so '
            'consistently effective even against alert, well-trained '
            'people. None of these defenses works perfectly in isolation '
            '— it\'s the combination of technical controls, '
            'organizational process, and individual awareness working '
            'together that genuinely closes the gap SMTP left open '
            'decades ago.',
      ),
    ],
  ),

  // 10 ----------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'Why is SMTP considered the root cause of email spoofing?',
        options: [
          'SMTP transmits email too slowly',
          'SMTP doesn\'t inherently verify who actually sent a message',
          'All emails are sent unencrypted',
          'Spoofing is only possible on mobile devices',
        ],
        correctIndex: 1,
        explanation: 'SMTP was not originally designed to verify sender identity, which is what enables spoofing.',
      ),
      QuizQuestion(
        question: 'An email impersonates a company executive and asks an employee to urgently wire funds. This is an example of:',
        options: ['DKIM failure', 'Business Email Compromise (BEC)', 'DNS spoofing', 'A firewall misconfiguration'],
        correctIndex: 1,
        explanation: 'BEC involves impersonating a trusted figure, often an executive, to request money or sensitive data.',
      ),
      QuizQuestion(
        question: 'What should you check before trusting a sender, beyond the display name?',
        options: [
          'The email\'s font',
          'The actual email address/domain behind the display name',
          'The time the email was sent',
          'The email\'s subject line length',
        ],
        correctIndex: 1,
        explanation: 'Display names can be faked freely; the actual address and domain reveal more about legitimacy.',
      ),
      QuizQuestion(
        question: 'Which email authentication standard adds a digital signature to verify a message wasn\'t altered in transit?',
        options: ['SPF', 'DKIM', 'DMARC', 'VPN'],
        correctIndex: 1,
        explanation: 'DKIM signs outgoing messages so receivers can verify authenticity and integrity.',
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
        explanation: 'DMARC tells receiving servers what to do — quarantine, reject, or just report — when SPF/DKIM checks fail.',
      ),
      QuizQuestion(
        question: 'What is "credential harvesting" in the context of malicious links?',
        options: [
          'Automatically generating strong passwords',
          'A fake login page designed to capture whatever you type in',
          'A tool that stores passwords securely',
          'A method for resetting forgotten passwords',
        ],
        correctIndex: 1,
        explanation: 'Credential harvesting uses a convincing fake login page to steal usernames and passwords.',
      ),
      QuizQuestion(
        question: 'If you accidentally click a suspicious link, what should you do?',
        options: [
          'Say nothing and hope it was harmless',
          'Wait a few days to see if anything happens',
          'Report it immediately, even though it\'s uncomfortable',
          'Only mention it if asked directly',
        ],
        correctIndex: 2,
        explanation: 'Reporting immediately allows the security team to respond quickly and limit any damage.',
      ),
      QuizQuestion(
        question: 'Why is enabling MFA specifically important for your primary email account?',
        options: [
          'It makes emails load faster',
          'Email is often used to reset passwords on other accounts, making it a high-value target',
          'It removes the need for spam filters',
          'It automatically blocks all phishing emails',
        ],
        correctIndex: 1,
        explanation: 'Because email often controls password resets elsewhere, compromising it can cascade into other accounts.',
      ),
      QuizQuestion(
        question: 'A highly targeted phishing email crafted using personal information about a specific victim is called:',
        options: ['Whaling', 'Spear phishing', 'Smishing', 'Vishing'],
        correctIndex: 1,
        explanation: 'Spear phishing is targeted at a specific individual using researched personal details.',
      ),
      QuizQuestion(
        question: 'Which protocol is used to send email between mail servers?',
        options: ['IMAP', 'POP3', 'SMTP', 'DNS'],
        correctIndex: 2,
        explanation: 'SMTP (Simple Mail Transfer Protocol) relays outgoing email between servers.',
      ),
      QuizQuestion(
        question: 'What protocol is used to retrieve mail while keeping it synced across multiple devices?',
        options: ['SMTP', 'POP3', 'IMAP', 'DNS'],
        correctIndex: 2,
        explanation: 'IMAP syncs mail across devices; POP3 downloads to one device; SMTP sends.',
      ),
      QuizQuestion(
        question: 'In email headers, which field shows the chain of servers the message passed through?',
        options: ['From:', 'Received:', 'Subject:', 'DKIM-Signature:'],
        correctIndex: 1,
        explanation: 'The Received: headers form the routing chain — read from bottom (origin) to top (destination).',
      ),
      QuizQuestion(
        question: 'What does SPF publish in DNS?',
        options: [
          'A list of authorized mail servers for a domain',
          'A cryptographic signature for each message',
          'The enforcement policy for failed checks',
          'The recipient server IP address',
        ],
        correctIndex: 0,
        explanation: 'SPF lists the IP addresses authorized to send mail on behalf of a domain.',
      ),
      QuizQuestion(
        question: 'Which is NOT a red flag in a phishing email?',
        options: [
          'Urgent pressure to act immediately',
          'A generic greeting on a supposedly personal message',
          'A link whose hover URL matches the displayed text',
          'Unexpected attachment from unknown sender',
        ],
        correctIndex: 2,
        explanation: 'A matching URL is actually a sign of legitimacy — the other options are classic red flags.',
      ),
      QuizQuestion(
        question: 'Why should you verify urgent financial requests through a separate channel?',
        options: [
          'To slow down legitimate transactions',
          'Because an attacker who controls the email thread can respond to verification requests in the same channel',
          'Because phone calls are faster',
          'Because email is always monitored',
        ],
        correctIndex: 1,
        explanation: 'Verifying through the same email channel does not help if the attacker controls that thread.',
      ),
      QuizQuestion(
        question: 'No-blame reporting culture in security means:',
        options: [
          'No one is held accountable for breaches',
          'People report mistakes faster without fear of punishment, enabling quicker response',
          'Security teams cannot discipline employees',
          'Phishing simulations are never run',
        ],
        correctIndex: 1,
        explanation: 'Fear of blame causes delayed reporting, which makes incidents much worse.',
      ),
      QuizQuestion(
        question: 'A phishing simulation exercise helps organizations by:',
        options: [
          'Punishing employees who click',
          'Measuring and building real awareness before real attackers do it',
          'Replacing the need for spam filters',
          'Training IT staff only',
        ],
        correctIndex: 1,
        explanation: 'Simulations reveal gaps in awareness in a controlled, safe environment.',
      ),
      QuizQuestion(
        question: 'An attacker registers "examp1e.com" (with a "1" instead of an "l") and sends invoices impersonating a real vendor. This combines which two concepts?',
        options: [
          'Typosquatting and phishing',
          'Hashing and encryption',
          'Risk transfer and risk avoidance',
          'NTFS permissions and MFA',
        ],
        correctIndex: 0,
        explanation: 'A near-identical domain is typosquatting; using it to deceive a recipient is phishing.',
      ),
      QuizQuestion(
        question: 'An attacker researches a target on LinkedIn before sending a targeted email. This reconnaissance is called:',
        options: ['Phishing', 'OSINT — Open Source Intelligence gathering', 'Wardriving', 'DNS tunneling'],
        correctIndex: 1,
        explanation: 'Mining publicly available information for targeting is OSINT.',
      ),
      QuizQuestion(
        question: 'Drive-by download attacks work by:',
        options: [
          'Downloading files manually',
          'Installing malware automatically when a malicious page is visited',
          'Sending files via email',
          'Exploiting printer vulnerabilities',
        ],
        correctIndex: 1,
        explanation: 'Drive-by downloads exploit browser or plugin vulnerabilities to install malware on page load.',
      ),
      QuizQuestion(
        question: 'What is the purpose of DNS filtering for email security?',
        options: [
          'Blocking large attachments',
          'Blocking connections to known-malicious domains before they are made',
          'Encrypting DNS queries',
          'Verifying SPF records',
        ],
        correctIndex: 1,
        explanation: 'DNS filtering prevents connections to known-bad domains entirely.',
      ),
      QuizQuestion(
        question: 'Which of the following best describes a whaling attack?',
        options: [
          'Phishing targeting many random recipients',
          'Spear phishing targeting a senior executive or high-value individual',
          'A volumetric DDoS attack',
          'An attack on maritime shipping systems',
        ],
        correctIndex: 1,
        explanation: 'Whaling is spear phishing aimed specifically at executives or other high-value targets.',
      ),
      QuizQuestion(
        question: 'An Office document asks you to "Enable Macros" to view its content. What should you do?',
        options: [
          'Enable macros — it\'s just a display setting',
          'Be suspicious; this is a common malware delivery mechanism — verify with the sender first',
          'Save the file and resend it',
          'Enable macros only if the document looks professional',
        ],
        correctIndex: 1,
        explanation: 'Macro-enabled documents are one of the most common malware delivery methods via email.',
      ),
      QuizQuestion(
        question: 'Why does BEC frequently succeed even against organizations with mature technical email security?',
        options: [
          'BEC always uses malware that bypasses filters',
          'BEC emails are often plain, well-written text with no malicious link or attachment for filters to catch',
          'BEC only targets small companies',
          'BEC requires physical access to the mail server',
        ],
        correctIndex: 1,
        explanation: 'Because BEC relies on social engineering rather than technical exploits, it often has nothing for a scanner to flag.',
      ),
      QuizQuestion(
        question: 'A DMARC policy configured to "reject" means:',
        options: [
          'The domain accepts all mail regardless of authentication results',
          'Messages failing SPF and DKIM checks are refused outright rather than delivered or quarantined',
          'All outgoing mail from the domain is blocked',
          'DMARC reports are disabled',
        ],
        correctIndex: 1,
        explanation: 'A "reject" DMARC policy is the strictest enforcement option, refusing messages that fail authentication.',
      ),
    ],
  ),
];
