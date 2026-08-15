import 'lesson_model.dart';

// 100 questions curated from across every module's quiz bank,
// covering every difficulty level. Used by the Final Certification Exam.

const List<QuizQuestion> finalExamQuestions = [
  // From: Cybersecurity Fundamentals
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
  // From: Alerts and Monitoring
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
  // From: Linux Security
  QuizQuestion(
        question: 'Running "find / -perm -4000" on a Linux system reveals:',
        options: [
          'All world-writable files',
          'All SUID binaries on the system',
          'All running processes',
          'All open network ports',
        ],
        correctIndex: 1,
        explanation: 'This command finds all SUID binaries — a key step in security auditing.',
      ),
  // From: Social Engineering
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
  // From: Vulnerabilities and Threats
  QuizQuestion(
        question: 'Which MDM capability directly addresses a lost or stolen device?',
        options: ['App management', 'Remote wipe', 'Compliance reporting', 'VPN enforcement'],
        correctIndex: 1,
        explanation: 'Remote wipe lets an organization erase corporate data immediately on a lost or stolen device.',
      ),
  // From: Networking
  QuizQuestion(
        question: 'What does a stateful firewall track that a basic packet filter does not?',
        options: [
          'Application names',
          'Connection state allowing return traffic from established sessions',
          'User identities',
          'File types',
        ],
        correctIndex: 1,
        explanation: 'Stateful firewalls track connection state enabling smarter allow/deny decisions.',
      ),
  // From: Cybersecurity Fundamentals
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
  // From: Capstone
  QuizQuestion(
        question: 'A stateful firewall differs from a basic packet-filtering firewall because it:',
        options: [
          'Cannot inspect any traffic',
          'Tracks the state of active connections, correctly allowing return traffic for established sessions',
          'Only works with UDP traffic',
          'Requires no configuration at all',
        ],
        correctIndex: 1,
        explanation: 'Stateful firewalls track connection state; packet filters only look at individual packets in isolation.',
      ),
  // From: Networking
  QuizQuestion(
        question: 'Which DNS record type maps a domain name directly to an IPv4 address?',
        options: ['CNAME', 'MX', 'A', 'TXT'],
        correctIndex: 2,
        explanation: 'The A record is the fundamental record type mapping a domain name to an IPv4 address.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'In a digital signature, what is actually encrypted with the sender\'s private key?',
        options: ['The entire original message', 'A hash digest of the message', 'The recipient\'s public key', 'The CA\'s root certificate'],
        correctIndex: 1,
        explanation: 'The message is hashed first, and that fixed-length digest is what gets signed with the private key.',
      ),
  // From: Threat Actors
  QuizQuestion(
        question: 'An insider threat is generally harder to detect through perimeter defenses because:',
        options: [
          'Insiders are always more skilled than external attackers',
          'Insiders already possess legitimate access and system knowledge',
          'Insiders never leave any evidence',
          'Perimeter defenses do not apply to any internal traffic',
        ],
        correctIndex: 1,
        explanation: 'Existing legitimate access lets insider activity blend in more easily than an external attacker forcing their way in.',
      ),
  // From: Capstone
  QuizQuestion(
        question: 'Why does effective security leadership require translating technical risk into business terms?',
        options: [
          'Technical terms are always classified information',
          'Leadership makes budget decisions based on business outcomes, not raw technical severity scores',
          'Business terms are legally required in all security reports',
          'Technical risk and business risk are always identical',
        ],
        correctIndex: 1,
        explanation: 'Leaders who control security budgets need risk framed in terms they can act on — financial, regulatory, and reputational impact.',
      ),
  // From: Networking
  QuizQuestion(
        question: 'DNS tunneling is dangerous because:',
        options: [
          'It breaks DNS resolution permanently',
          'It can exfiltrate data or establish C2 channels through firewalls that permit DNS traffic',
          'It requires physical access',
          'It only works on Linux',
        ],
        correctIndex: 1,
        explanation: 'DNS tunneling encodes data inside DNS queries which most firewalls allow by default.',
      ),
  // From: SOC Operations
  QuizQuestion(
        question: 'The Cyber Kill Chain was developed by:',
        options: ['MITRE', 'Lockheed Martin to model the stages of a targeted intrusion', 'NIST', 'The NSA'],
        correctIndex: 1,
        explanation: 'Lockheed Martin developed the Kill Chain model to describe adversary intrusion stages.',
      ),
  // From: Alerts and Monitoring
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
  // From: Windows Security
  QuizQuestion(
        question: 'VLANs on a managed switch allow:',
        options: [
          'Faster internet speeds',
          'Multiple isolated logical networks on a single physical switch',
          'Automatic IP assignment',
          'Wireless access point configuration',
        ],
        correctIndex: 1,
        explanation: 'VLANs logically separate traffic on the same physical hardware for security and performance.',
      ),
  // From: Cybersecurity Fundamentals
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
  // From: Capstone
  QuizQuestion(
        question: 'SASE combines SD-WAN networking capabilities with:',
        options: [
          'Nothing additional — SASE and SD-WAN are identical',
          'A full suite of integrated cloud-delivered security services like firewall, secure web gateway, and Zero Trust network access',
          'Only physical hardware appliances',
          'A single antivirus product',
        ],
        correctIndex: 1,
        explanation: 'SASE unifies SD-WAN networking with integrated security services delivered from the cloud.',
      ),
  // From: Networking
  QuizQuestion(
        question: 'WEP should never be used for Wi-Fi because:',
        options: [
          'It is too slow',
          'Its encryption is cryptographically broken and easily cracked',
          'It requires special hardware',
          'It does not support passwords',
        ],
        correctIndex: 1,
        explanation: 'WEP has known cryptographic weaknesses and can be broken in minutes.',
      ),
  // From: Email Security
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
  // From: Windows Security
  QuizQuestion(
        question: 'Event ID 4625 repeated hundreds of times from one source most likely indicates:',
        options: [
          'A user changing their password',
          'A Group Policy update',
          'A brute-force attack against an account',
          'Antivirus updating signatures',
        ],
        correctIndex: 2,
        explanation: 'Many rapid failed logon events (4625) from one source is a brute-force signature.',
      ),
  // From: Alerts and Monitoring
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
  // From: Cybersecurity Fundamentals
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
  // From: Networking
  QuizQuestion(
        question: 'Which network device makes forwarding decisions based on MAC addresses within the same LAN?',
        options: ['Router', 'Switch', 'Firewall', 'IPS'],
        correctIndex: 1,
        explanation: 'Switches forward traffic within a LAN segment based on MAC addresses.',
      ),
  // From: Cybersecurity Fundamentals
  QuizQuestion(
        question: 'An attacker modifies a bank transfer amount without either '
            'party knowing. Which CIA property failed?',
        options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
        correctIndex: 1,
        explanation: 'Unauthorized modification of data is an Integrity failure.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'OCSP stapling improves on standard OCSP by:',
        options: [
          'Eliminating the need for a CA entirely',
          'Having the web server itself attach a recent signed status response to its own certificate during the TLS handshake, avoiding a separate client query to the CA',
          'Making certificates last forever',
          'Removing the need for a root of trust',
        ],
        correctIndex: 1,
        explanation: 'OCSP stapling avoids the client needing to separately contact the CA, improving speed and reducing CA load.',
      ),
  // From: Social Engineering
  QuizQuestion(
        question: 'Which of the following is NOT one of the six motivational triggers covered in this module?',
        options: ['Authority', 'Urgency', 'Complexity', 'Scarcity'],
        correctIndex: 2,
        explanation: 'The six triggers are Authority, Urgency, Social Proof, Scarcity, Likability, and Fear — Complexity is not one of them.',
      ),
  // From: Linux Security
  QuizQuestion(
        question: 'SSH key-based authentication is more secure than passwords primarily because:',
        options: [
          'Keys are shorter to type',
          'The private key never travels over the network and cannot be brute-forced like a password',
          'Keys never expire',
          'Keys are stored in plaintext',
        ],
        correctIndex: 1,
        explanation: 'The private key stays on the client and its cryptographic strength resists brute force.',
      ),
  // From: Networking
  QuizQuestion(
        question: 'BGP hijacking occurs when:',
        options: [
          'A router runs out of memory',
          'An organization announces routes for IP address space it does not actually own, redirecting traffic',
          'A firewall blocks legitimate traffic',
          'DNS servers return incorrect IP addresses',
        ],
        correctIndex: 1,
        explanation: 'BGP has no built-in ownership verification, allowing route announcements for address space the announcer does not own.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'Key stretching (using bcrypt, scrypt, or Argon2) primarily defends against:',
        options: [
          'Man-in-the-middle attacks',
          'Brute-force password guessing, by making each individual guess computationally expensive to test',
          'DNS spoofing',
          'Phishing emails',
        ],
        correctIndex: 1,
        explanation: 'Deliberately slow hashing makes brute-forcing large numbers of password guesses impractically expensive.',
      ),
  // From: Email Security
  QuizQuestion(
        question: 'An attacker researches a target on LinkedIn before sending a targeted email. This reconnaissance is called:',
        options: ['Phishing', 'OSINT — Open Source Intelligence gathering', 'Wardriving', 'DNS tunneling'],
        correctIndex: 1,
        explanation: 'Mining publicly available information for targeting is OSINT.',
      ),
  // From: Linux Security
  QuizQuestion(
        question: 'What is the key difference between DAC and MAC?',
        options: [
          'DAC is faster; MAC is slower',
          'DAC lets owners set permissions on their own files while MAC enforces a system-wide policy regardless of owner wishes',
          'MAC is only available on Windows',
          'DAC and MAC are the same thing',
        ],
        correctIndex: 1,
        explanation: 'MAC enforces a kernel-level policy that overrides what individual users/owners can configure.',
      ),
  // From: Security Incident Response
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
  // From: Threat Actors
  QuizQuestion(
        question: 'Why does Shadow IT usually happen, even in well-run organizations?',
        options: [
          'Employees are deliberately trying to cause a breach',
          'A gap exists between what employees need to be productive and what officially sanctioned tools currently provide',
          'IT departments encourage it',
          'It is required by most compliance regulations',
        ],
        correctIndex: 1,
        explanation: 'Shadow IT typically fills a genuine productivity gap rather than reflecting malicious intent.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'Why should RC4 never be used in new systems?',
        options: [
          'It is too slow',
          'It is a cryptographically broken stream cipher with known weaknesses',
          'It requires too much bandwidth',
          'It only works with IPv6',
        ],
        correctIndex: 1,
        explanation: 'RC4 has known cryptographic weaknesses and is considered broken for security purposes.',
      ),
  // From: SOC Operations
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
  // From: Security Incident Response
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
  // From: SOC Operations
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
  // From: Alerts and Monitoring
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
  // From: Windows Security
  QuizQuestion(
        question: 'Which event ID indicates the Security audit log was cleared?',
        options: ['4624', '4688', '1102', '4720'],
        correctIndex: 2,
        explanation: 'Event 1102 (Security log cleared) is a major red flag that an attacker may be covering tracks.',
      ),
  // From: Security Incident Response
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
  // From: SOC Operations
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
  // From: Threat Actors
  QuizQuestion(
        question: 'A honeyfile is best described as:',
        options: [
          'A real, sensitive file with extra encryption applied',
          'A decoy file placed where an unauthorized user is likely to look, triggering an alert when accessed',
          'A compressed archive of security logs',
          'A file used only for regulatory compliance reporting',
        ],
        correctIndex: 1,
        explanation: 'Honeyfiles contain no genuinely sensitive data — their only purpose is to trigger an alert if accessed.',
      ),
  // From: Windows Security
  QuizQuestion(
        question: 'Why should Group Policy be used for Windows hardening rather than manually configuring each machine?',
        options: [
          'GPO is faster to type',
          'GPO applies settings centrally and consistently to all machines automatically',
          'Manual config is more secure',
          'GPO only works on servers',
        ],
        correctIndex: 1,
        explanation: 'Group Policy scales hardening across thousands of machines from a single configuration point.',
      ),
  // From: Alerts and Monitoring
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
  // From: Capstone
  QuizQuestion(
        question: 'What does "Repudiation" in STRIDE specifically address?',
        options: [
          'Data being read by unauthorized users',
          'A user denying they performed an action, addressed through logging and digital signatures',
          'A system becoming unavailable',
          'An attacker impersonating another user',
        ],
        correctIndex: 1,
        explanation: 'Repudiation threats are mitigated with strong audit logging and non-repudiation controls like digital signatures.',
      ),
  // From: Social Engineering
  QuizQuestion(
        question: 'An email claiming "the rest of your team has already updated their password through this link" is using which trigger?',
        options: ['Fear', 'Social Proof', 'Scarcity', 'Authority'],
        correctIndex: 1,
        explanation: 'Suggesting others have already complied is Social Proof, increasing the target\'s own willingness to comply.',
      ),
  // From: Email Security
  QuizQuestion(
        question: 'Which email authentication standard adds a digital signature to verify a message wasn\'t altered in transit?',
        options: ['SPF', 'DKIM', 'DMARC', 'VPN'],
        correctIndex: 1,
        explanation: 'DKIM signs outgoing messages so receivers can verify authenticity and integrity.',
      ),
  // From: Security Incident Response
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
  // From: Email Security
  QuizQuestion(
        question: 'An email impersonates a company executive and asks an employee to urgently wire funds. This is an example of:',
        options: ['DKIM failure', 'Business Email Compromise (BEC)', 'DNS spoofing', 'A firewall misconfiguration'],
        correctIndex: 1,
        explanation: 'BEC involves impersonating a trusted figure, often an executive, to request money or sensitive data.',
      ),
  // From: Email Security
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
  // From: Social Engineering
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
  // From: Cryptography
  QuizQuestion(
        question: 'What is the fundamental limitation of symmetric encryption?',
        options: [
          'It is too slow for practical use',
          'Key distribution — securely sharing the one secret key between parties who have never communicated before',
          'It cannot encrypt large files',
          'It requires a Certificate Authority',
        ],
        correctIndex: 1,
        explanation: 'Securely agreeing on a shared secret key without an eavesdropper intercepting it is symmetric encryption\'s core challenge.',
      ),
  // From: Networking
  QuizQuestion(
        question: 'A /26 subnet has how many usable host addresses?',
        options: ['30', '62', '126', '254'],
        correctIndex: 1,
        explanation: 'A /26 leaves 6 host bits: 2^6 - 2 = 62 usable addresses.',
      ),
  // From: Malware
  QuizQuestion(
        question: 'A Trojan differs from a virus because a Trojan:',
        options: [
          'Requires no user interaction at all',
          'Disguises itself as something legitimate to trick the user into installing it, rather than attaching to a host file',
          'Only affects mobile devices',
          'Cannot steal any data',
        ],
        correctIndex: 1,
        explanation: 'A Trojan presents a false identity to gain trust; it does not attach itself to another file the way a virus does.',
      ),
  // From: Windows Security
  QuizQuestion(
        question: 'Pass-the-hash attacks use:',
        options: [
          'The plaintext password',
          'The NTLM hash of a password to authenticate without knowing the password itself',
          'A phishing email',
          'A keylogger',
        ],
        correctIndex: 1,
        explanation: 'Pass-the-hash replays a captured hash to authenticate — Credential Guard mitigates this.',
      ),
  // From: Linux Security
  QuizQuestion(
        question: 'Which SSH configuration option should be set to "no" to significantly reduce brute-force attack risk?',
        options: ['Protocol', 'X11Forwarding', 'PasswordAuthentication', 'TCPKeepAlive'],
        correctIndex: 2,
        explanation: 'Disabling password authentication forces key-based login, which cannot be brute-forced in the traditional sense.',
      ),
  // From: Vulnerabilities and Threats
  QuizQuestion(
        question: 'Why does signature-based antivirus struggle against zero-day malware?',
        options: [
          'Signature-based antivirus is always disabled by default',
          'A zero-day exploit has never been seen before, so no signature exists yet to match against',
          'Zero-days only target antivirus software directly',
          'Signatures work better against zero-days than any other malware type',
        ],
        correctIndex: 1,
        explanation: 'Signature detection relies on previously cataloged patterns, which a genuinely new zero-day will not match.',
      ),
  // From: Malware
  QuizQuestion(
        question: 'A botnet\'s Command and Control (C2) infrastructure is used to:',
        options: [
          'Physically repair infected devices',
          'Issue instructions simultaneously to every zombie device in the botnet',
          'Encrypt the attacker\'s own communications only',
          'Provide customer support to victims',
        ],
        correctIndex: 1,
        explanation: 'C2 infrastructure lets an attacker coordinate action across an entire botnet simultaneously.',
      ),
  // From: Cybersecurity Fundamentals
  QuizQuestion(
        question: 'Which threat actor type is typically the most well-funded '
            'and strategically motivated?',
        options: ['Script kiddies', 'Hacktivists', 'Nation-state actors', 'Insiders'],
        correctIndex: 2,
        explanation: 'Nation-state actors have the greatest resources and long-term strategic goals.',
      ),
  // From: Linux Security
  QuizQuestion(
        question: 'Fail2Ban is used to:',
        options: [
          'Encrypt disk partitions',
          'Automatically ban IPs that exceed failed login thresholds reducing brute-force noise',
          'Configure firewall zones',
          'Monitor DNS queries',
        ],
        correctIndex: 1,
        explanation: 'Fail2Ban watches logs and blocks repeat offenders automatically.',
      ),
  // From: Vulnerabilities and Threats
  QuizQuestion(
        question: 'What did the Equifax, WannaCry, and Mirai incidents all have in common?',
        options: [
          'They all used entirely novel, never-before-seen techniques',
          'They all exploited vulnerabilities that were already known, often with a patch already available but not yet applied',
          'They all targeted only government agencies',
          'None of them involved any vulnerability at all',
        ],
        correctIndex: 1,
        explanation: 'Most major historical breaches exploited already-known vulnerabilities that simply had not been patched yet.',
      ),
  // From: Social Engineering
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
  // From: Capstone
  QuizQuestion(
        question: 'Which firewall type is purpose-built to protect HTTP/S traffic from SQL injection and XSS?',
        options: ['UTM', 'WAF', 'Proxy firewall', 'Kernel proxy firewall'],
        correctIndex: 1,
        explanation: 'A Web Application Firewall (WAF) is specifically designed to inspect and protect HTTP/S application-layer traffic.',
      ),
  // From: Social Engineering
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
  // From: SOC Operations
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
  // From: Linux Security
  QuizQuestion(
        question: 'What does a File Integrity Monitor (FIM) tool do?',
        options: [
          'Encrypts important system files',
          'Compares live system files against a cryptographic baseline to detect unexpected changes',
          'Blocks unauthorized file downloads',
          'Compresses log files automatically',
        ],
        correctIndex: 1,
        explanation: 'FIM tools detect when important files (binaries, configs) are modified, which can indicate a compromise.',
      ),
  // From: Cybersecurity Fundamentals
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
  // From: Cryptography
  QuizQuestion(
        question: 'A collision attack against a hash function:',
        options: [
          'Finds two different inputs that produce the identical hash output',
          'Decrypts encrypted data without a key',
          'Forces a downgrade to a weaker TLS version',
          'Steals a private key directly',
        ],
        correctIndex: 0,
        explanation: 'Collision attacks undermine the integrity guarantee of hashing by finding two inputs with the same hash.',
      ),
  // From: Threat Actors
  QuizQuestion(
        question: 'Which of the following is one of the six common threat vectors covered in this lesson?',
        options: ['Weather patterns', 'Removable devices', 'Stock market fluctuations', 'Office furniture'],
        correctIndex: 1,
        explanation: 'Removable devices (like USB drives) are one of the six common vectors, alongside messages, images, files, voice calls, and unsecured networks.',
      ),
  // From: Email Security
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
  // From: Vulnerabilities and Threats
  QuizQuestion(
        question: 'A malicious update supply chain attack works by:',
        options: [
          'Directly attacking end-user devices with no vendor involvement',
          'Compromising a vendor\'s update infrastructure so malware is disguised as a legitimate trusted update',
          'Only affecting hardware, never software',
          'Requiring physical access to every target device',
        ],
        correctIndex: 1,
        explanation: 'Compromising the update mechanism itself lets malware be voluntarily installed by systems trusting that vendor.',
      ),
  // From: Networking
  QuizQuestion(
        question: 'A device has an IP address starting with 172. Which class does this address belong to?',
        options: ['Class A', 'Class B', 'Class C', 'Class D'],
        correctIndex: 1,
        explanation: 'Class B covers first octets 128-191, so an address starting with 172 is Class B.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'Which symmetric algorithm is the current global standard and default choice?',
        options: ['DES', '3DES', 'AES', 'RC4'],
        correctIndex: 2,
        explanation: 'AES has withstood over two decades of scrutiny with no practical full break and is the recommended default.',
      ),
  // From: Email Security
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
  // From: Security Incident Response
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
  // From: Malware
  QuizQuestion(
        question: 'Why are DDoS attacks launched from a botnet especially difficult to block?',
        options: [
          'They only use one source IP address',
          'Traffic arrives from potentially hundreds of thousands of distinct, legitimate-looking IP addresses simultaneously',
          'They never generate enough traffic to matter',
          'They are always encrypted',
        ],
        correctIndex: 1,
        explanation: 'Distributed traffic from many real IP addresses is much harder to filter than an attack from a single identifiable source.',
      ),
  // From: Alerts and Monitoring
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
  // From: Security Incident Response
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
  // From: Linux Security
  QuizQuestion(
        question: 'AppArmor profiles are:',
        options: [
          'Based on SELinux contexts',
          'Per-application, path-based rules defining what files and capabilities each program can access',
          'Network firewall rules',
          'Cron job definitions',
        ],
        correctIndex: 1,
        explanation: 'AppArmor confines individual applications using path-based profiles.',
      ),
  // From: Malware
  QuizQuestion(
        question: 'Which of the four ransomware best practices most directly limits how far a single compromised password can spread an attack?',
        options: ['Regular backups', 'Software updates', 'Security awareness training', 'Multi-factor authentication'],
        correctIndex: 3,
        explanation: 'MFA limits how much lateral access a single compromised credential provides an attacker.',
      ),
  // From: SOC Operations
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
  // From: Threat Actors
  QuizQuestion(
        question: 'What primarily motivates hacktivists?',
        options: ['Financial gain', 'Political or social causes', 'Personal curiosity only', 'Government contracts'],
        correctIndex: 1,
        explanation: 'Hacktivists target organizations they view as opposed to their political or social cause.',
      ),
  // From: Vulnerabilities and Threats
  QuizQuestion(
        question: 'In the DVWA demonstration, entering "1\' OR \'1\'=\'1" into a vulnerable field caused:',
        options: [
          'The application to crash entirely',
          'Every user record to be returned instead of just the one legitimately requested',
          'The database to be encrypted',
          'No effect at all',
        ],
        correctIndex: 1,
        explanation: 'The injected condition is always true, causing the query to match and return every record rather than one.',
      ),
  // From: Capstone
  QuizQuestion(
        question: 'A HIDS has visibility that a NIDS positioned outside a host typically lacks because:',
        options: [
          'HIDS is always faster',
          'HIDS runs directly on the endpoint and can see file changes, process execution, and decrypted activity on that specific host',
          'NIDS cannot process any traffic at all',
          'HIDS does not require any configuration',
        ],
        correctIndex: 1,
        explanation: 'Host-based systems see endpoint-level activity, including content after decryption, that network-based systems positioned outside cannot observe.',
      ),
  // From: Windows Security
  QuizQuestion(
        question: 'The principle of least privilege on Windows most directly applies to:',
        options: [
          'File compression settings',
          'Every user process and service having only the access they genuinely need',
          'Display resolution',
          'Power management',
        ],
        correctIndex: 1,
        explanation: 'Least privilege on Windows means standard accounts for daily work, not administrator accounts.',
      ),
  // From: Threat Actors
  QuizQuestion(
        question: 'What is the most effective general strategy for managing Shadow IT?',
        options: [
          'A total ban on any unapproved tool with no exceptions',
          'Fast, clear approval processes combined with visibility tools like a CASB, rather than blanket prohibition',
          'Ignoring it entirely since it cannot be controlled',
          'Firing any employee found using an unapproved tool',
        ],
        correctIndex: 1,
        explanation: 'Blanket bans tend to push Shadow IT further underground; visibility and reasonable approval processes work better.',
      ),
  // From: Vulnerabilities and Threats
  QuizQuestion(
        question: 'A buffer overflow attack that overwrites the stack return address aims to:',
        options: [
          'Simply crash the program with no further effect',
          'Redirect program execution to attacker-controlled code once the current function returns',
          'Encrypt the program\'s memory',
          'Disable the network interface',
        ],
        correctIndex: 1,
        explanation: 'Overwriting the return address redirects execution to code of the attacker\'s choosing.',
      ),
  // From: Malware
  QuizQuestion(
        question: 'Missing logs during an investigation most strongly suggest:',
        options: [
          'A normal, routine log rotation',
          'An attacker may have deliberately cleared logs to cover their tracks',
          'The system has never been used',
          'A hardware failure with no security implications',
        ],
        correctIndex: 1,
        explanation: 'Gaps or absence of expected log entries are a common sign an attacker has tampered with logging to hide their activity.',
      ),
  // From: Cybersecurity Fundamentals
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
  // From: Capstone
  QuizQuestion(
        question: 'NIST CSF\'s five core functions are:',
        options: [
          'Plan, Do, Check, Act, Improve',
          'Identify, Protect, Detect, Respond, Recover',
          'Prevent, Detect, Respond, Recover, Review',
          'Assess, Plan, Implement, Monitor, Audit',
        ],
        correctIndex: 1,
        explanation: 'The NIST Cybersecurity Framework organizes its guidance around these five functions covering the full security lifecycle.',
      ),
  // From: Capstone
  QuizQuestion(
        question: 'Which security maturity level involves implementing centralized logging, SIEM, and EDR across the environment?',
        options: [
          'Basic Hygiene',
          'Visibility',
          'Proactive Defense',
          'Adaptive',
        ],
        correctIndex: 1,
        explanation: 'Centralized logging, SIEM, and EDR are core Visibility-stage capabilities that enable detection before Proactive Defense work begins.',
      ),
  // From: Malware
  QuizQuestion(
        question: 'A login from one country followed, impossibly soon after, by a login from a distant location is known as:',
        options: ['Concurrent session utilization', 'Impossible travel', 'Out-of-cycle logging', 'Resource consumption'],
        correctIndex: 1,
        explanation: 'Impossible travel flags logins that could not both be legitimate given the physical distance and time between them.',
      ),
  // From: SOC Operations
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
  // From: Endpoint Security
  QuizQuestion(
        question: 'What is the key difference between an EPP and an EDR solution?',
        options: [
          'They are identical technologies marketed differently',
          'EPP focuses on preventing threats before compromise, while EDR focuses on detecting and responding to threats that bypass prevention',
          'EDR only works on mobile devices',
          'EPP requires no installation on the endpoint',
        ],
        correctIndex: 1,
        explanation: 'EPP is prevention-focused; EDR is detection-and-response-focused for threats that get past EPP.',
      ),
  // From: Endpoint Security
  QuizQuestion(
        question: 'Why is fileless malware particularly difficult for traditional antivirus to detect?',
        options: [
          'It always requires a USB device to spread',
          'It executes directly in system memory using legitimate OS tools rather than installing files on disk',
          'It only affects mobile devices',
          'It cannot cause any actual damage',
        ],
        correctIndex: 1,
        explanation: 'Fileless malware avoids leaving file-based signatures behind, which is exactly what signature-based antivirus relies on.',
      ),
  // From: Endpoint Security
  QuizQuestion(
        question: 'What is the core principle behind endpoint hardening?',
        options: [
          'Installing as many security tools as possible',
          'Reducing the attack surface by removing unnecessary software, disabling unused services, and enforcing secure configurations',
          'Replacing the need for antivirus entirely',
          'Only applying to mobile devices',
        ],
        correctIndex: 1,
        explanation: 'Hardening prevents attacks by eliminating unnecessary weaknesses, rather than only reacting once an attack starts.',
      ),
  // From: Endpoint Security
  QuizQuestion(
        question: 'What does the Zero Trust principle "Never Trust, Always Verify" mean in practice?',
        options: [
          'Users inside the corporate network are automatically trusted',
          'Every access request is evaluated using multiple factors, regardless of the user\'s network location',
          'Verification only happens once at initial login',
          'Only external users need to be verified',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust rejects the old assumption that internal network location implies trustworthiness.',
      ),
  // From: Endpoint Security
  QuizQuestion(
        question: 'Why do most organizations prohibit rooted or jailbroken mobile devices from accessing enterprise resources?',
        options: [
          'Rooted and jailbroken devices are actually more secure',
          'These modifications bypass built-in security controls, can install unverified software, and often fail compliance checks',
          'Rooting and jailbreaking are illegal everywhere',
          'These devices cannot connect to Wi-Fi at all',
        ],
        correctIndex: 1,
        explanation: 'Removing manufacturer security restrictions significantly weakens a device\'s security posture.',
      ),
  // From: Endpoint Security
  QuizQuestion(
        question: 'What is the primary purpose of Just-in-Time patch and vulnerability management on endpoints?',
        options: [
          'To eliminate the need for backups',
          'To continuously scan, prioritize, and remediate vulnerabilities based on actual business risk rather than patching everything with equal urgency',
          'To replace antivirus entirely',
          'To only apply to virtual machines',
        ],
        correctIndex: 1,
        explanation: 'Risk-based patching focuses remediation effort where it matters most, rather than treating every vulnerability identically.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'What is the key difference between encryption and hashing?',
        options: [
          'They are identical processes',
          'Encryption is reversible with the correct key (providing confidentiality); hashing is a one-way process used to verify integrity',
          'Hashing is reversible but encryption is not',
          'Both require the exact same key management practices',
        ],
        correctIndex: 1,
        explanation: 'Encryption protects confidentiality and can be decrypted; hashing verifies integrity and cannot be reversed.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'Why is AES-GCM widely deployed in modern enterprise systems?',
        options: [
          'It only provides confidentiality with no other benefits',
          'It combines the performance of Counter Mode with built-in integrity verification, providing authenticated encryption',
          'It is the slowest available cipher mode',
          'It eliminates the need for any encryption key',
        ],
        correctIndex: 1,
        explanation: 'GCM adds authentication on top of CTR mode\'s speed, letting systems both encrypt and detect tampering in one pass.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'What is the main advantage of hybrid encryption, as used in protocols like TLS?',
        options: [
          'It avoids using any asymmetric cryptography',
          'It combines asymmetric encryption for secure key exchange with fast symmetric encryption for the actual data',
          'It only works for email communications',
          'It requires no cryptographic keys whatsoever',
        ],
        correctIndex: 1,
        explanation: 'Hybrid encryption uses asymmetric crypto\'s secure key exchange plus symmetric crypto\'s speed for bulk data.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'Why does the compromise of a Root Certificate Authority represent such a severe risk?',
        options: [
          'It only affects a single website',
          'Because the Root CA is the foundation of trust for the entire PKI hierarchy — compromising it could invalidate every certificate issued beneath it',
          'Root CAs have no actual security role',
          'It only impacts internal test environments',
        ],
        correctIndex: 1,
        explanation: 'Every certificate in the chain traces its trust back to the Root CA, so its compromise cascades through the entire hierarchy.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'What distinguishes a downgrade attack from other cryptographic attacks?',
        options: [
          'It attempts to physically damage cryptographic hardware',
          'It forces communicating systems to negotiate older, weaker protocols or cipher suites that are easier to exploit',
          'It only targets hashing algorithms',
          'It requires no network access at all',
        ],
        correctIndex: 1,
        explanation: 'Downgrade attacks manipulate protocol negotiation to force weaker, more exploitable encryption.',
      ),
  // From: Cryptography
  QuizQuestion(
        question: 'Why are organizations beginning to prepare for Post-Quantum Cryptography (PQC)?',
        options: [
          'Quantum computing already routinely breaks all encryption today',
          'Quantum algorithms like Shor\'s Algorithm could theoretically weaken RSA, Diffie-Hellman, and ECC in the future, so agility now reduces future migration risk',
          'PQC is required for all symmetric encryption immediately',
          'Quantum computing has no relevance to cryptography',
        ],
        correctIndex: 1,
        explanation: 'While large-scale practical quantum attacks aren\'t here yet, organizations build cryptographic agility now to migrate smoothly when needed.',
      ),
  // From: Network Security
  QuizQuestion(
        question: 'Which OSI layer is responsible for routing and logical addressing?',
        options: ['Data Link (Layer 2)', 'Network (Layer 3)', 'Session (Layer 5)', 'Presentation (Layer 6)'],
        correctIndex: 1,
        explanation: 'The Network layer (Layer 3) handles routing and logical addressing using protocols like IP and ICMP.',
      ),
  // From: Network Security
  QuizQuestion(
        question: 'Why does the TCP/IP model have only four layers compared to the OSI model\'s seven?',
        options: [
          'TCP/IP is a purely theoretical model with no real-world use',
          'TCP/IP is the practical implementation actually used by the Internet, consolidating some OSI functions into fewer, more implementation-focused layers',
          'The OSI model was developed after TCP/IP and added unnecessary layers',
          'TCP/IP cannot support routing',
        ],
        correctIndex: 1,
        explanation: 'TCP/IP is the practical, real-world protocol suite; OSI is a more granular conceptual reference model used mainly for teaching and troubleshooting.',
      ),
  // From: Network Security
  QuizQuestion(
        question: 'Between IPsec, SSL/TLS VPN, and WireGuard, which is specifically noted for excellent firewall traversal because it runs over the same port as ordinary HTTPS traffic?',
        options: ['IPsec', 'SSL/TLS VPN', 'WireGuard', 'None of these traverse firewalls well'],
        correctIndex: 1,
        explanation: 'SSL/TLS VPN uses TCP port 443, the same port as HTTPS, letting it blend in with normal web traffic through most firewalls.',
      ),
  // From: Network Security
  QuizQuestion(
        question: 'What is the primary purpose of Port Address Translation (PAT)?',
        options: [
          'To map one private IP address to one public IP address exclusively',
          'To allow many internal devices to share a single public IP address by using different source port numbers',
          'To encrypt all outbound network traffic',
          'To replace the need for a firewall entirely',
        ],
        correctIndex: 1,
        explanation: 'PAT\'s many-to-one mapping via port numbers is what conserves public IPv4 addresses so efficiently.',
      ),
  // From: Network Security
  QuizQuestion(
        question: 'In the real-world DNS misconfiguration scenario, what was the actual root cause of the customer-facing outage?',
        options: [
          'The web servers had crashed',
          'An incorrect DNS record prevented name resolution from directing customers to the correct server, even though the servers themselves were fully operational',
          'A DDoS attack overwhelmed the network',
          'The load balancer was physically unplugged',
        ],
        correctIndex: 1,
        explanation: 'This scenario illustrates that DNS failures can cause outages entirely independent of actual server or application health.',
      ),
  // From: Network Security
  QuizQuestion(
        question: 'What does data encapsulation accomplish as information moves down the protocol stack for transmission?',
        options: [
          'It permanently deletes unnecessary data',
          'Each layer adds its own header, enabling reliable communication, routing, error detection, and interoperability between different network technologies',
          'It only applies to wireless transmissions',
          'It removes all security protections from the data',
        ],
        correctIndex: 1,
        explanation: 'Encapsulation progressively wraps data with protocol headers at each layer, supporting reliable delivery and cross-technology interoperability.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'What does Perfect Forward Secrecy (PFS) specifically protect against?',
        options: [
          'It prevents any encryption from ever being used',
          'It ensures that even if a server\'s long-term private key is later compromised, previously captured encrypted sessions remain protected because they used unique, discarded session keys',
          'It only protects data at rest, never data in transit',
          'It eliminates the need for any certificate validation',
        ],
        correctIndex: 1,
        explanation: 'PFS\'s core benefit is that a future key compromise can\'t retroactively expose past communications, since each session had its own unique, since-discarded key.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'Why does SSH public key authentication provide stronger security than password authentication?',
        options: [
          'Because the private key is transmitted to the server during every login',
          'Because the private key never leaves the client device — the server verifies ownership without the key ever being transmitted',
          'Because public key authentication requires no verification at all',
          'Because passwords are actually more secure than key pairs',
        ],
        correctIndex: 1,
        explanation: 'The administrator proves possession of the private key without ever transmitting it, unlike passwords which must be sent during authentication.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'How does DKIM differ from SPF in what it actually verifies?',
        options: [
          'They verify exactly the same thing',
          'SPF verifies the sending server is authorized; DKIM verifies the message itself hasn\'t been altered using a digital signature',
          'DKIM only works with POP3, not SMTP',
          'SPF verifies message content while DKIM verifies the server',
        ],
        correctIndex: 1,
        explanation: 'SPF is about server authorization; DKIM is about message integrity via a cryptographic signature — genuinely different checks that complement each other.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'What is the key difference between SFTP and FTPS?',
        options: [
          'They are identical protocols with different names',
          'SFTP uses the SSH protocol for encryption, while FTPS adds TLS encryption on top of the traditional FTP protocol',
          'FTPS uses SSH, while SFTP uses TLS',
          'Neither protocol provides any encryption',
        ],
        correctIndex: 1,
        explanation: 'SFTP is SSH-based file transfer; FTPS is traditional FTP with TLS added — different underlying mechanisms achieving similar security goals.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'Why is accurate time synchronization (NTP) critical for security operations?',
        options: [
          'It has no real impact on security investigations',
          'Without synchronized timestamps, investigators and SIEM platforms may struggle to correctly reconstruct or correlate the sequence of events during a security incident',
          'NTP is only used for scheduling meetings',
          'Time synchronization only matters for billing purposes',
        ],
        correctIndex: 1,
        explanation: 'Consistent timestamps across devices are essential for accurately reconstructing attack timelines and correlating related events.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'What does Mutual TLS (mTLS) require that standard TLS does not?',
        options: [
          'Only the server needs to present a certificate, exactly like standard TLS',
          'Both the client AND the server must authenticate each other using digital certificates',
          'Neither party needs any certificate at all',
          'mTLS eliminates the need for encryption entirely',
        ],
        correctIndex: 1,
        explanation: 'Standard TLS authenticates only the server; mTLS adds client-side certificate authentication, reducing impersonation risk for sensitive integrations.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'What is SSL stripping specifically designed to do?',
        options: [
          'Strengthen an HTTPS connection with additional encryption',
          'Attempt to downgrade or replace an HTTPS connection with an unencrypted HTTP connection, exposing data that would otherwise be protected',
          'Automatically renew expired certificates',
          'Permanently disable a user\'s Internet connection',
        ],
        correctIndex: 1,
        explanation: 'SSL stripping specifically targets the HTTPS-to-HTTP downgrade path, which HSTS is specifically designed to prevent.',
      ),
  // From: Secure Protocols
  QuizQuestion(
        question: 'What is the primary security benefit of SNMPv3 over SNMPv1 and SNMPv2c?',
        options: [
          'SNMPv3 removes all security features for faster performance',
          'SNMPv3 introduces user authentication, message integrity, and encryption of management traffic',
          'SNMPv3 only works with community strings, just like v1 and v2c',
          'SNMPv3 is identical in security to SNMPv1',
        ],
        correctIndex: 1,
        explanation: 'SNMPv3 is specifically recommended because it addresses the security weaknesses present in earlier, less secure versions.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'What is the fundamental principle of the Shared Responsibility Model?',
        options: [
          'The cloud provider is responsible for absolutely everything, including customer data',
          'The provider secures the cloud infrastructure, while the customer secures what they deploy and manage within the cloud',
          'The customer is solely responsible for physical data center security',
          'Security responsibility disappears once data moves to the cloud',
        ],
        correctIndex: 1,
        explanation: 'This is one of the most commonly misunderstood concepts in cloud security — the provider and customer each own distinct parts of the security responsibility.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'As organizations move from IaaS to PaaS to SaaS, what happens to the division of responsibility?',
        options: [
          'The customer takes on more and more responsibility',
          'The cloud provider assumes greater responsibility for managing the environment',
          'Responsibility remains exactly the same across all three models',
          'The customer becomes responsible for the physical infrastructure',
        ],
        correctIndex: 1,
        explanation: 'IaaS gives customers the most control (and responsibility); SaaS shifts nearly all infrastructure and platform responsibility to the provider.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'What is the key difference between RBAC and ABAC?',
        options: [
          'They are identical access control models',
          'RBAC grants permissions based on predefined roles; ABAC makes access decisions using multiple attributes like department, device compliance, location, and time of day',
          'ABAC is simpler to administer than RBAC',
          'RBAC is commonly used in Zero Trust architectures, not ABAC',
        ],
        correctIndex: 1,
        explanation: 'ABAC provides more dynamic, context-aware access decisions using multiple attributes, while RBAC relies on simpler, predefined role assignments.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'How does Tokenization differ from encryption in protecting sensitive data like credit card numbers?',
        options: [
          'They are functionally identical',
          'Tokenization replaces sensitive data with a non-reversible token mapped in a secure database, rather than relying on a mathematically reversible decryption key',
          'Tokenization requires a decryption key just like encryption',
          'Tokenization is only used for encrypting entire databases',
        ],
        correctIndex: 1,
        explanation: 'Tokenized data has no mathematical relationship to the original value — an attacker who steals it has nothing to decrypt, unlike stolen ciphertext.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'What is the key difference between CSPM and CWPP?',
        options: [
          'They are identical tools with different names',
          'CSPM focuses on cloud configuration security (misconfigurations), while CWPP focuses on protecting the workloads themselves during runtime',
          'CWPP only evaluates compliance, never actual workload threats',
          'CSPM protects containers while CWPP protects storage accounts',
        ],
        correctIndex: 1,
        explanation: 'CSPM is about getting the configuration right; CWPP is about protecting the running workload itself — complementary, not overlapping, functions.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'What does a Cloud Access Security Broker (CASB) provide?',
        options: [
          'Nothing related to SaaS application security',
          'A policy enforcement point between users and cloud applications, providing visibility, access control, DLP, and consistent security across multiple SaaS services',
          'CASB only works for a single cloud application',
          'CASB replaces the need for any encryption',
        ],
        correctIndex: 1,
        explanation: 'CASB gives organizations centralized visibility and control across the many different SaaS applications employees actually use.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'What is the key difference between Rehosting ("Lift and Shift") and Refactoring during cloud migration?',
        options: [
          'They are identical migration strategies',
          'Rehosting moves applications with minimal changes (fast but may carry over existing weaknesses); Refactoring redesigns applications to use cloud-native services (more effort, better long-term scalability)',
          'Refactoring is always faster than Rehosting',
          'Rehosting always produces better long-term results than Refactoring',
        ],
        correctIndex: 1,
        explanation: 'Rehosting prioritizes migration speed; Refactoring prioritizes long-term cloud-native benefits at the cost of greater upfront effort.',
      ),
  // From: Cloud Security
  QuizQuestion(
        question: 'What security risks does Infrastructure as Code (IaC) specifically introduce if not properly managed?',
        options: [
          'IaC introduces no security risks whatsoever',
          'Insecure default configurations, hardcoded credentials, excessive permissions, and unreviewed configuration changes — all of which get replicated at scale through automation',
          'IaC only affects a single server at a time, limiting any risk',
          'IaC eliminates the possibility of misconfiguration entirely',
        ],
        correctIndex: 1,
        explanation: 'Because IaC templates are reused repeatedly, a single flawed template can replicate a security weakness across many deployments.',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'What are the four pillars of IAM, commonly abbreviated as IAAA?',
        options: [
          'Installation, Access, Audit, Authorization',
          'Identification, Authentication, Authorization, Accounting',
          'Identity, Authorization, Access, Alerting',
          'Inspection, Authentication, Approval, Archiving',
        ],
        correctIndex: 1,
        explanation: 'IAM is built on four fundamental concepts: Identification, Authentication, Authorization, and Accounting (Auditing).',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'What happens during the "Move" stage of the Joiner-Mover-Leaver (JML) identity lifecycle?',
        options: [
          'A new user account is created for the first time',
          'Old permissions are removed and new permissions are assigned based on the employee\'s new role',
          'The account is permanently deleted',
          'Devices are recovered and email is archived',
        ],
        correctIndex: 1,
        explanation: 'During the Move stage, an employee changes departments — old permissions are removed and new permissions are assigned based on the new role.',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'A hardware security key (such as a FIDO2 key) is an example of which authentication factor?',
        options: [
          'Something you know',
          'Something you have',
          'Something you are',
          'Something you do',
        ],
        correctIndex: 1,
        explanation: 'A hardware security key requires the user to physically possess a device, making it a "something you have" (possession) factor.',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'Between "P@ssw0rd!" and "BlueTiger!RunsAcross7Mountains," which is the passphrase, and why is it generally preferred?',
        options: [
          'P@ssw0rd! is the passphrase because it is shorter',
          'BlueTiger!RunsAcross7Mountains is the passphrase — it is longer, easier to remember, and more resistant to brute-force attacks',
          'Both are equally secure passwords',
          'Neither example is a valid passphrase',
        ],
        correctIndex: 1,
        explanation: 'A passphrase is a longer sequence of words that is easier to remember and generally more resistant to brute-force attacks than a short, complex password.',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'Which of the following is listed as a benefit of passwordless authentication?',
        options: [
          'It eliminates the need for any device compliance checks',
          'Reduced phishing risk and fewer password reset requests',
          'It requires no hardware of any kind',
          'It is only compatible with legacy on-premises systems',
        ],
        correctIndex: 1,
        explanation: 'Passwordless authentication reduces phishing risk, improves user experience, reduces password reset requests, and strengthens overall security.',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'Why does Multi-Factor Authentication (MFA) make it significantly harder for an attacker to gain unauthorized access after stealing a password?',
        options: [
          'MFA automatically resets the stolen password',
          'The attacker is unlikely to also possess the required second, independent authentication factor',
          'MFA blocks all network traffic from unknown IP addresses',
          'MFA disables the user account permanently after any login attempt',
        ],
        correctIndex: 1,
        explanation: 'Even with a stolen password, an attacker is unlikely to have access to the required second independent authentication factor, which is what makes MFA effective.',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'Why are SMS-based One-Time Passwords (OTPs) considered a weaker MFA method compared to authenticator apps or hardware security keys?',
        options: [
          'SMS OTPs never actually get delivered to the user',
          'SMS-based OTPs can be vulnerable to SIM-swapping attacks',
          'SMS OTPs require expensive hardware to use',
          'SMS OTPs are not compatible with mobile phones',
        ],
        correctIndex: 1,
        explanation: 'SMS-based OTPs can be vulnerable to SIM-swapping attacks, which is why best practice favors authenticator apps or hardware security keys instead.',
      ),
  // From: Identity Access Management
  QuizQuestion(
        question: 'In the IAAA model, which pillar is responsible for recording login times, files accessed, and failed login attempts?',
        options: [
          'Identification',
          'Authentication',
          'Authorization',
          'Accounting',
        ],
        correctIndex: 3,
        explanation: 'Accounting (Auditing) records user activities such as login/logout time, files accessed, administrative actions, and failed login attempts for security and compliance purposes.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'What is the fundamental relationship between Single Sign-On (SSO) and Identity Federation?',
        options: [
          'They are unrelated technologies with no connection',
          'Federation establishes trust between security domains, while SSO provides the seamless single-login experience built on top of that trust',
          'SSO always requires passwords to be shared between every application',
          'Federation only works within a single organization',
        ],
        correctIndex: 1,
        explanation: 'Identity federation establishes trust between different organizations or security domains, while SSO provides a seamless authentication experience once that trust exists.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'In a SAML authentication flow, what does the Service Provider verify when it receives a returned assertion?',
        options: [
          'Nothing — assertions are trusted automatically',
          'Digital signature, certificate validity, assertion expiration, trusted Identity Provider, and audience restrictions',
          'Only the user\'s IP address',
          'The physical location of the Identity Provider\'s servers',
        ],
        correctIndex: 1,
        explanation: 'Before granting access, the Service Provider validates the digital signature, certificate validity, assertion expiration, trusted IdP, and audience restrictions.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'Which protocol would be most appropriate for a mobile app that needs delegated access to a user\'s cloud storage without ever seeing their password?',
        options: [
          'Kerberos',
          'OAuth 2.0',
          'LDAP',
          'Group Policy',
        ],
        correctIndex: 1,
        explanation: 'OAuth 2.0 is designed exactly for this scenario — an application gains limited, delegated access to a resource via an access token, without ever handling the user\'s password.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'What is a "password spray attack" specifically designed to evade?',
        options: [
          'Encryption at rest',
          'Account lockout policies tuned to detect many failed attempts against a single account',
          'Firewall rules',
          'DNS filtering',
        ],
        correctIndex: 1,
        explanation: 'By trying only a few common passwords against many different accounts, password spraying stays under lockout thresholds designed to catch repeated attempts against one account.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'What does UEBA (User and Entity Behavior Analytics) use to detect a potentially compromised account?',
        options: [
          'A static list of banned passwords only',
          'Behavioral baselines built from historical activity, flagging significant deviations as anomalous',
          'Manual review of every login attempt by IT staff',
          'The user\'s job title alone',
        ],
        correctIndex: 1,
        explanation: 'UEBA builds a behavioral baseline for each user and flags significant deviations — such as a login from an unusual location at an unusual time — as anomalous.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'What does Continuous Access Evaluation (CAE) allow that traditional token-based access does not?',
        options: [
          'Tokens that never expire under any circumstances',
          'Near real-time reassessment of an active session when a significant security event occurs, rather than waiting for the token to expire',
          'Elimination of the need for any authentication token',
          'Automatic approval of all access requests',
        ],
        correctIndex: 1,
        explanation: 'CAE lets applications and identity providers reassess access immediately when events like account disablement or high risk are detected, instead of waiting for the token\'s natural expiration.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'What is the primary difference between Active Directory Domain Services (AD DS) and Microsoft Entra ID?',
        options: [
          'They are the same product marketed under two names',
          'AD DS is an on-premises directory using Kerberos/NTLM, while Microsoft Entra ID is cloud-based and supports modern protocols like OAuth 2.0 and SAML',
          'Entra ID only works for printer management',
          'AD DS cannot issue Kerberos tickets',
        ],
        correctIndex: 1,
        explanation: 'AD DS is Microsoft\'s on-premises directory service using Kerberos/NTLM authentication, while Microsoft Entra ID is a cloud-native identity platform supporting modern authentication protocols.',
      ),
  // From: Identity Federation and SSO
  QuizQuestion(
        question: 'Why is the Identity Provider (IdP) considered a particularly high-value target for attackers in an SSO architecture?',
        options: [
          'The IdP has no special importance compared to other systems',
          'Because it is the central trust authority — compromising it could grant access to every connected application',
          'The IdP only stores cosmetic user preferences',
          'Attackers cannot target identity infrastructure',
        ],
        correctIndex: 1,
        explanation: 'Since every Service Provider trusts the IdP\'s authentication decisions, compromising the IdP could give an attacker access to every application connected through it.',
      ),
];
