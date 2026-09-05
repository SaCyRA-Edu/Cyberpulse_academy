import 'lesson_model.dart';

// Scenario-based questions in the style of CISSP/CISM: each presents a
// short situation and asks what the BEST or NEXT action is, with four
// similarly-detailed options. This structure is intentionally resistant
// to "pick the longest option" or "pick option B" test-taking shortcuts,
// since every option is a comparably substantive, plausible course of
// action rather than one detailed correct explanation next to three
// short dismissals.
const List<QuizQuestion> finalExamQuestions = [
  // From: Cybersecurity Fundamentals
  QuizQuestion(
    question:
        'A mid-sized retailer\'s security team has a limited budget and must decide where to focus first. Which approach BEST reflects a risk-based security strategy?',
    options: [
      'Purchase the newest security tools on the market regardless of what threats the organization actually faces',
      'Prioritize controls that protect the most critical assets against the most likely threats',
      'Apply identical security controls uniformly to every system, regardless of its sensitivity or exposure',
      'Wait until a breach occurs, then allocate the entire security budget to whatever caused it',
    ], correctIndex: 1,
    explanation:
        'Risk-based security prioritizes protecting the most critical assets against the most likely and impactful threats, rather than spreading resources evenly or reactively.',
  ),
  QuizQuestion(
    question:
        'During a tabletop exercise, a CISO asks the team to explain why the organization maintains offsite backups in addition to encryption and access controls. Which CIA Triad objective do the backups primarily support?',
    options: [
      'Availability, since backups restore access after a disruptive event',
      'Confidentiality, by preventing unauthorized users from reading the data',
      'Integrity, by ensuring the data cannot be altered without detection',
      'Non-repudiation, by proving which user last modified the data',
    ], correctIndex: 0,
    explanation:
        'Backups and disaster recovery capabilities primarily support Availability — ensuring the organization can restore access to data and systems after an outage or attack.',
  ),
  QuizQuestion(
    question:
        'An employee receives an email claiming to be from the CFO, urgently requesting a wire transfer before end of day, with unusual phrasing and no phone call to confirm. What should the employee do FIRST?',
    options: [
      'Forward the email to colleagues to see if anyone else received a similar request',
      'Reply to the email asking the CFO to confirm the request in writing',
      'Process the transfer immediately, since the CFO\'s name appears in the sender field',
      'Verify the request through a separate, known-good channel like a phone call',
    ], correctIndex: 3,
    explanation:
        'Out-of-band verification through a trusted, independently-confirmed channel is the standard defense against BEC and similar impersonation attempts, since the email itself cannot be trusted.',
  ),
  QuizQuestion(
    question:
        'A company\'s risk register lists a vulnerability with high likelihood and high potential impact, but the cost of the recommended control exceeds the asset\'s value. Which risk treatment is MOST appropriate?',
    options: [
      'Implement the expensive control anyway regardless of cost-benefit analysis',
      'Accept the risk formally and document the decision',
      'Ignore the risk entirely and remove it from the register without further review',
      'Transfer the entire risk to a cyber insurance policy without evaluating coverage limits',
    ], correctIndex: 1,
    explanation:
        'When treatment costs exceed the risk\'s potential impact, formal risk acceptance — documented and approved by someone with the authority to do so — is the appropriate response.',
  ),
  QuizQuestion(
    question:
        'A new employee is unsure whether a specific action is covered by company policy. They check the relevant document and find it explains step-by-step how to configure VPN access. What type of document are they most likely reading?',
    options: [
      'A standard, since it defines a mandatory technical requirement without steps',
      'A procedure, since it gives step-by-step instructions',
      'A guideline, since it offers non-mandatory recommendations',
      'A policy, since it defines high-level management expectations',
    ], correctIndex: 1,
    explanation:
        'Step-by-step instructions for performing a specific task are the defining characteristic of a procedure, distinct from the higher-level policy or standard that it supports.',
  ),
  QuizQuestion(
    question:
        'Security awareness metrics show phishing simulation click rates have dropped from 22% to 9% after a redesigned training program. How should this trend BEST be interpreted?',
    options: [
      'As irrelevant, since click rates have no connection to actual security outcomes',
      'As proof that phishing is no longer a risk to the organization and training can be discontinued',
      'A leading indicator that training is improving behavior',
      'As evidence that the organization should immediately cancel its email security tools',
    ], correctIndex: 2,
    explanation:
        'A declining phishing click rate is a leading indicator of improving security awareness — useful for justifying continued investment, not a signal to stop monitoring or training.',
  ),
  QuizQuestion(
    question:
        'An organization discovers that a critical vulnerability affecting its Internet-facing servers is being actively exploited in the wild, and a vendor patch was just released. What is the MOST appropriate next step?',
    options: [
      'Apply the patch through an expedited emergency change process',
      'Take no action, since the vulnerability has not yet affected this specific organization',
      'Wait for the next scheduled monthly patch cycle to apply the fix along with everything else',
      'Delay patching until a full regression test suite can be completed over several weeks',
    ], correctIndex: 0,
    explanation:
        'Active exploitation of a critical vulnerability warrants emergency, expedited patching with only essential validation — waiting for a routine cycle leaves the organization exposed.',
  ),

  // From: Threats, Attacks & Vulnerabilities
  QuizQuestion(
    question:
        'A security analyst notices that a former employee\'s account was used to log in three days after their termination date, using credentials that were never disabled. Which control failure MOST directly enabled this?',
    options: [
      'Insufficient antivirus signature updates on the employee\'s former workstation',
      'A missing or delayed offboarding process',
      'Weak password complexity requirements enforced during account creation',
      'A lack of encryption on the organization\'s primary database',
    ], correctIndex: 1,
    explanation:
        'Active credentials belonging to a terminated employee point directly to a gap in the offboarding process, which should disable access immediately upon termination.',
  ),
  QuizQuestion(
    question:
        'An organization discovers that a widely used open-source library embedded in its product has a newly disclosed critical vulnerability. What is the MOST appropriate immediate action?',
    options: [
      'Immediately shut down all products using any open-source components as a precaution',
      'Ignore the disclosure since the organization did not write the vulnerable code itself',
      'Assess actual exposure, then prioritize patching by exploitability',
      'Wait for a customer to report an incident before taking any investigative action',
    ], correctIndex: 2,
    explanation:
        'Third-party and supply chain vulnerabilities still require the same risk-based assessment and prioritized remediation as internally discovered ones, starting with confirming actual exposure.',
  ),
  QuizQuestion(
    question:
        'During an audit, a reviewer finds that a legacy application still uses a hardcoded administrative password that has never been changed since deployment. Which type of vulnerability does this represent?',
    options: [
      'A physical security vulnerability related to the server\'s location',
      'A misconfiguration rooted in poor credential management',
      'A zero-day vulnerability, since it was only recently discovered by the auditor',
      'A social engineering vulnerability targeting the end users of the application',
    ], correctIndex: 1,
    explanation:
        'Hardcoded, unchanging credentials are a classic configuration and secure-design failure, not a zero-day (which refers to a newly discovered flaw with no patch yet available).',
  ),
  QuizQuestion(
    question:
        'A financial services firm learns that attackers are impersonating its brand in phishing emails sent to customers, using a domain that closely resembles the real one. What is the MOST direct defensive step the firm can take?',
    options: [
      'Publish a public statement blaming customers for falling for the scam',
      'Disable the firm\'s own legitimate website until the campaign stops',
      'Register similar domains and pursue takedowns of lookalikes',
      'Change the firm\'s brand name entirely to avoid future impersonation',
    ], correctIndex: 2,
    explanation:
        'Proactively registering similar domains and pursuing takedowns of malicious lookalikes directly reduces the attack surface available for brand impersonation and typosquatting.',
  ),
  QuizQuestion(
    question:
        'An incident responder finds that a compromised workstation has an unusually large number of outbound connections to a single external IP address, occurring at regular five-minute intervals. What does this pattern MOST likely indicate?',
    options: [
      'Routine software update checks performed by the operating system vendor',
      'Normal business use of a cloud storage synchronization application',
      'Beaconing behavior consistent with malware contacting a C2 server',
      'A benign misconfiguration in the organization\'s DNS resolver settings',
    ], correctIndex: 2,
    explanation:
        'Regular, periodic outbound connections to a single external address are a classic sign of malware beaconing to a C2 server for instructions.',
  ),
  QuizQuestion(
    question:
        'A penetration tester successfully exploits a web application by submitting a manipulated input field that causes the backend database to return records the tester was never authorized to see. Which vulnerability class does this MOST likely represent?',
    options: [
      'A Denial-of-Service condition caused by resource exhaustion',
      'Cross-Site Scripting (XSS), which targets other users\' browsers rather than the database',
      'A misconfigured DNS record pointing to the wrong server',
      'SQL Injection, where unsanitized input alters the query logic',
    ], correctIndex: 3,
    explanation:
        'Manipulated input that alters what data a backend query returns is the hallmark of SQL Injection, distinct from XSS (which targets browsers) or DoS (which targets availability).',
  ),

  // From: Network Security
  QuizQuestion(
    question:
        'A network engineer needs to allow specific return traffic for outbound connections initiated by internal users, while blocking unsolicited inbound traffic. Which firewall capability BEST accomplishes this?',
    options: [
      'A switch configured with VLANs to separate departments from one another',
      'A simple packet filter that evaluates each packet independently with no memory of prior traffic',
      'A proxy that requires every internal user to manually approve each connection',
      'A stateful firewall that tracks connections and allows return traffic',
    ], correctIndex: 3,
    explanation:
        'Stateful firewalls track the state of active connections, automatically allowing return traffic for sessions the internal network legitimately initiated — something basic packet filters cannot do.',
  ),
  QuizQuestion(
    question:
        'An administrator investigating a customer-reported outage confirms that all backend servers are healthy and reachable directly by IP address, but the public domain name fails to resolve to the correct server. What is the MOST likely root cause?',
    options: [
      'An incorrect or outdated DNS record',
      'A firewall rule blocking all inbound traffic to the network',
      'An expired TLS certificate on the load balancer',
      'A hardware failure on the backend application servers themselves',
    ], correctIndex: 0,
    explanation:
        'Servers being healthy when reached directly by IP, combined with failed domain resolution, points squarely at a DNS misconfiguration rather than a server, firewall, or certificate issue.',
  ),
  QuizQuestion(
    question:
        'A company wants remote employees to securely reach internal file shares without exposing those shares directly to the Internet. Which solution BEST satisfies this requirement?',
    options: [
      'Emailing files individually to remote employees upon request',
      'Publishing the file share\'s IP address directly on the public Internet with a strong password',
      'Disabling remote access entirely and requiring all employees to work on-site',
      'Requiring a VPN connection before accessing internal resources',
    ], correctIndex: 3,
    explanation:
        'A VPN creates an encrypted tunnel into the internal network, letting remote employees reach internal resources securely without ever exposing those resources directly to the Internet.',
  ),
  QuizQuestion(
    question:
        'Security monitoring detects an internal router suddenly announcing routes for a large block of public IP address space that belongs to another organization, causing traffic destined for that organization to arrive at the wrong network. What is this scenario describing?',
    options: [
      'BGP hijacking, redirecting traffic via unauthorized route announcements',
      'A standard, expected behavior of Border Gateway Protocol (BGP) route advertisement',
      'Normal load-balancing behavior between two data centers',
      'A routine DNS cache refresh occurring across the Internet',
    ], correctIndex: 0,
    explanation:
        'Announcing routes for IP space an organization does not own, redirecting traffic away from its rightful destination, is the definition of BGP hijacking.',
  ),
  QuizQuestion(
    question:
        'A security team wants to detect a compromised host attempting to exfiltrate data by hiding it inside seemingly normal DNS queries. Which control BEST addresses this specific technique?',
    options: [
      'A physical access control system restricting entry to the server room',
      'DNS traffic monitoring tuned to flag unusual query patterns',
      'A password complexity policy applied to all user accounts',
      'Standard antivirus signature scanning on individual endpoint files',
    ], correctIndex: 1,
    explanation:
        'DNS tunneling hides data inside DNS queries and responses, so detecting it requires monitoring DNS traffic patterns specifically, rather than file-based or physical controls.',
  ),
  QuizQuestion(
    question:
        'An organization\'s wireless network still uses WEP encryption because it was configured over a decade ago and never revisited. What is the MOST appropriate next step?',
    options: [
      'Leave WEP in place, since it has worked without incident so far',
      'Increase the WEP key length while keeping the same underlying protocol',
      'Migrate to WPA2 or WPA3',
      'Disable wireless networking entirely rather than address the encryption weakness',
    ], correctIndex: 2,
    explanation:
        'WEP\'s encryption is cryptographically broken and easily cracked regardless of key length, so the only sound remediation is migrating to WPA2 or WPA3.',
  ),

  // From: Identity Access Management
  QuizQuestion(
    question:
        'A help desk technician receives a call from someone claiming to be a traveling executive who has lost access to their account and urgently needs a password reset over the phone. What should the technician do FIRST?',
    options: [
      'Transfer the call to voicemail and take no further action',
      'Verify the caller\'s identity through an established process first',
      'Ask the caller to email their password so it can be confirmed against records',
      'Reset the password immediately, since the caller sounds urgent and mentions the executive\'s name',
    ], correctIndex: 1,
    explanation:
        'Help desk identity verification procedures exist specifically to prevent social engineering attacks like this one — urgency and a plausible story are not substitutes for verified identity.',
  ),
  QuizQuestion(
    question:
        'An organization wants to reduce the risk of a compromised password leading to full account takeover, without significantly disrupting the daily login experience for most users. Which control BEST balances these goals?',
    options: [
      'Requiring users to change their password every seven days regardless of any indication of compromise',
      'Sharing a single administrative account among all users to simplify management',
      'Removing password requirements entirely and relying only on usernames',
      'Enforcing MFA so a stolen password alone is not enough',
    ], correctIndex: 3,
    explanation:
        'MFA directly addresses the risk of password compromise by requiring a second independent factor, without the disruption and diminishing security value of excessively frequent password changes.',
  ),
  QuizQuestion(
    question:
        'An employee moves from the Finance department to Human Resources. Their old Finance system access remains active for months afterward, alongside their new HR permissions. What process failure does this represent?',
    options: [
      'A failure in the organization\'s password complexity policy',
      'A failure in the "Joiner" stage of the identity lifecycle, since the employee was never properly onboarded',
      'A failure in the \'Mover\' stage — old access was never removed',
      'A failure in Multi-Factor Authentication enrollment',
    ], correctIndex: 2,
    explanation:
        'The Mover stage of the Joiner-Mover-Leaver lifecycle should both grant new role-based access AND remove access tied to the employee\'s previous role — this scenario shows that removal step failing.',
  ),
  QuizQuestion(
    question:
        'A security team notices that dozens of user accounts each received exactly one or two failed login attempts using the same common password, spread across a short time window from a single external IP address. What does this pattern MOST likely indicate?',
    options: [
      'A brute-force attack focused intensely on a single high-value account',
      'A routine, automated password expiration reminder from the identity system',
      'Normal user error from employees forgetting their own passwords',
      'A password spray attack staying under lockout thresholds',
    ], correctIndex: 3,
    explanation:
        'Spreading a small number of attempts across many accounts, rather than concentrating many attempts on one account, is the defining pattern of a password spray attack evading lockout policies.',
  ),
  QuizQuestion(
    question:
        'A company wants employees to authenticate once each morning and then move seamlessly between Microsoft 365, Salesforce, and an internal HR portal without logging in again. Which capability BEST satisfies this requirement?',
    options: [
      'Single Sign-On integrated with a centralized Identity Provider',
      'Disabling authentication entirely for internal network users',
      'Requiring a separate, unique password for each individual application',
      'Emailing a shared password to all employees each Monday morning',
    ], correctIndex: 0,
    explanation:
        'SSO backed by a centralized Identity Provider is precisely the capability that lets a user authenticate once and move between multiple trusted applications without repeated logins.',
  ),
  QuizQuestion(
    question:
        'An auditor reviewing access logs finds that a service account with database administrator privileges has not had its password rotated in over three years and is used interactively by several human employees. What is the GREATEST concern this raises?',
    options: [
      'Shared, long-lived privileged credentials with no individual attribution',
      'The account uses a database engine that is no longer the organization\'s preferred vendor',
      'The account naming convention does not follow the organization\'s style guide',
      'The account\'s icon in the admin console has not been updated recently',
    ], correctIndex: 0,
    explanation:
        'Shared privileged credentials that never rotate create serious accountability and compromise risks — no individual attribution is possible, and a single leak compromises access indefinitely.',
  ),

  // From: Cryptography
  QuizQuestion(
    question:
        'A developer is choosing how to store user passwords in a new application\'s database. Which approach provides the STRONGEST protection if the database is later stolen?',
    options: [
      'Encrypt passwords using a symmetric key stored in the same database',
      'Store only the first four characters of each password to save space',
      'Store passwords in plaintext for simplicity, since the database itself is access-controlled',
      'Store passwords with a salted, slow hash like bcrypt or Argon2',
    ], correctIndex: 3,
    explanation:
        'Salted, deliberately slow hashing algorithms like bcrypt or Argon2 make offline cracking of stolen password data computationally expensive, unlike plaintext, reversible encryption, or truncation.',
  ),
  QuizQuestion(
    question:
        'A security architect is evaluating whether to keep using RSA-2048 for a new system expected to protect data for the next twenty years. What is the PRIMARY reason they should also plan for cryptographic agility?',
    options: [
      'Cryptographic agility is a concept that only applies to symmetric algorithms, never to asymmetric ones like RSA',
      'RSA-2048 is considered a purely theoretical algorithm that cannot actually be implemented in practice',
      'RSA-2048 already fails to meet every current industry security recommendation in active use today',
      'Future quantum computing could weaken RSA, so agility reduces migration risk',
    ], correctIndex: 3,
    explanation:
        'Cryptographic agility ensures systems can adopt stronger algorithms as needed — increasingly important given the theoretical future risk quantum computing poses to algorithms like RSA.',
  ),
  QuizQuestion(
    question:
        'A company\'s TLS configuration still allows very old, weak cipher suites for compatibility with a handful of legacy clients. A security assessment flags this as a downgrade attack risk. What is the MOST appropriate remediation?',
    options: [
      'Disable weak legacy ciphers and enforce a minimum modern TLS version',
      'Increase the weak cipher\'s key length while keeping the same underlying broken algorithm',
      'Leave the configuration unchanged, since removing old ciphers might inconvenience a small number of users',
      'Disable TLS entirely and revert to unencrypted HTTP for all connections',
    ], correctIndex: 0,
    explanation:
        'Removing weak, legacy cipher suites and enforcing modern TLS closes the downgrade-attack window; legacy client compatibility should be solved separately, not by weakening the whole system.',
  ),
  QuizQuestion(
    question:
        'A financial institution needs to protect stored credit card numbers while still allowing customer service representatives to see the last four digits for verification purposes. Which technique is BEST suited to this specific requirement?',
    options: [
      'Full-disk encryption of the database server\'s underlying storage volume',
      'Tokenization, replacing the number with a non-reversible masked token',
      'Deleting the credit card numbers entirely after each transaction',
      'Storing the numbers in plaintext but restricting network access to the database server',
    ], correctIndex: 1,
    explanation:
        'Tokenization is specifically designed for this use case — protecting the sensitive value while preserving a masked or partial representation usable for routine verification.',
  ),
  QuizQuestion(
    question:
        'An organization discovers that its internal Certificate Authority\'s private key may have been exposed during a server compromise. What is the SEVERITY and MOST appropriate response?',
    options: [
      'Severe — the CA is the trust foundation for every certificate beneath it',
      'Low severity — this only requires rebuilding the single compromised server and rotating its local credentials',
      'No action needed, since Certificate Authorities are inherently immune to any form of meaningful compromise',
      'Moderate severity — only certificates issued within the most recent 24-hour window require review',
    ], correctIndex: 0,
    explanation:
        'Because a CA is the root of trust for everything it has signed, a compromised CA private key potentially invalidates every certificate in that hierarchy, requiring organization-wide revocation and reissuance.',
  ),
  QuizQuestion(
    question:
        'A web application team wants to ensure that even if a server\'s long-term private key is compromised in the future, previously captured encrypted sessions cannot be retroactively decrypted. Which property should their TLS configuration provide?',
    options: [
      'A longer-lived, static session key reused across all connections for efficiency',
      'Perfect Forward Secrecy, using unique session keys per connection',
      'Storing session keys in a shared file accessible to all application servers',
      'Disabling encryption for static content to improve page load speed',
    ], correctIndex: 1,
    explanation:
        'Perfect Forward Secrecy specifically protects past sessions from future key compromise by using unique, discarded session keys rather than a long-term key for every connection.',
  ),

  // From: Secure Protocols
  QuizQuestion(
    question:
        'A systems administrator is deciding between password-based and public-key SSH authentication for a fleet of production Linux servers. Which factor makes public-key authentication the stronger choice?',
    options: [
      'Public keys are easier for administrators to memorize than passwords',
      'Public-key authentication removes the need for any access logging',
      'Public-key authentication is faster to configure than setting a password',
      'The private key never leaves the client and resists brute-force',
    ], correctIndex: 3,
    explanation:
        'Because the private key never traverses the network and resists brute-force in a way passwords do not, public-key SSH authentication provides materially stronger security.',
  ),
  QuizQuestion(
    question:
        'An organization\'s SIEM is producing inconsistent timelines when correlating events from multiple servers during an incident investigation. Investigators later discover the servers\' clocks were never synchronized. What should have prevented this?',
    options: [
      'Disabling logging on lower-priority systems to reduce data volume',
      'Increasing the storage capacity allocated to the SIEM platform',
      'Enforcing consistent time synchronization across systems using NTP',
      'Requiring stronger password policies on the affected servers',
    ], correctIndex: 2,
    explanation:
        'Without synchronized clocks via NTP, timestamps across systems cannot be reliably correlated, making incident timelines difficult or impossible to reconstruct accurately.',
  ),
  QuizQuestion(
    question:
        'Two internal microservices need to mutually verify each other\'s identity before exchanging sensitive data, since either service could potentially be spoofed on the internal network. Which configuration BEST addresses this requirement?',
    options: [
      'Relying solely on network segmentation with no certificate-based authentication at all',
      'Disabling encryption between the two services since they are both internal',
      'Mutual TLS, requiring both services to authenticate each other',
      'Standard one-way TLS, where only one service presents a certificate to the other',
    ], correctIndex: 2,
    explanation:
        'Mutual TLS specifically requires both parties to present and validate certificates, addressing the risk that either service — not just an external client — could be spoofed.',
  ),
  QuizQuestion(
    question:
        'A security engineer is designing email authentication for a company domain and wants to specifically detect if a message\'s content was altered in transit, not just confirm the sending server was authorized. Which mechanism addresses THIS specific requirement?',
    options: [
      'A firewall rule blocking inbound SMTP traffic from unknown sources',
      'SPF, which authorizes which mail servers may send on behalf of the domain',
      'DKIM, verifying the message content has not been altered',
      'A VPN tunnel between the sending and receiving mail servers',
    ], correctIndex: 2,
    explanation:
        'DKIM specifically adds a digital signature to detect message tampering, distinct from SPF, which only verifies the sending server\'s authorization, not content integrity.',
  ),
  QuizQuestion(
    question:
        'An organization needs to transfer sensitive files to a partner over an encrypted channel, and wants the solution to build directly on their existing SSH infrastructure rather than requiring a separate TLS certificate deployment. Which protocol BEST fits this requirement?',
    options: [
      'Plain FTP, since encryption can be added at a later stage if needed',
      'FTPS, which layers TLS encryption on top of the traditional FTP protocol',
      'SFTP, using existing SSH infrastructure for encrypted transfer',
      'HTTP, relying on the receiving server to encrypt the file after upload',
    ], correctIndex: 2,
    explanation:
        'SFTP builds on SSH, so an organization already using SSH infrastructure can adopt it without deploying separate TLS certificates the way FTPS would require.',
  ),
  QuizQuestion(
    question:
        'A network team is upgrading their monitoring infrastructure and discovers that several devices still use SNMPv1 with community strings transmitted across the network. What is the PRIMARY security concern this raises?',
    options: [
      'Community strings act as passwords but travel in plaintext',
      'SNMPv1 cannot technically communicate with routers or switches',
      'SNMPv1 is too slow to support modern network monitoring requirements',
      'SNMPv1 requires specialized hardware unavailable to most organizations',
    ], correctIndex: 0,
    explanation:
        'SNMPv1\'s community strings act as passwords but travel in plaintext, meaning anyone able to observe network traffic can capture and reuse them — the core reason to migrate to SNMPv3.',
  ),

  // From: Endpoint Security
  QuizQuestion(
    question:
        'A user reports their laptop is running slowly, but antivirus scans return no detections. Deeper analysis reveals PowerShell repeatedly executing encoded commands directly in memory, with nothing written to disk. Why did traditional antivirus MISS this activity?',
    options: [
      'The malware is fileless, running in memory using OS tools',
      'The laptop\'s hardware is too old and underpowered to run modern antivirus software correctly',
      'Fileless malware is a category of threat that only ever affects mobile operating systems, not laptops',
      'Antivirus software was outdated and simply required a routine signature database update to catch it',
    ], correctIndex: 0,
    explanation:
        'Fileless malware evades traditional signature-based detection precisely because it runs in memory using legitimate tools, never dropping a file for antivirus to scan.',
  ),
  QuizQuestion(
    question:
        'An organization wants to reduce its endpoint attack surface before deploying new laptops to employees. Which action BEST supports this goal?',
    options: [
      'Remove unnecessary software and apply secure baseline configurations',
      'Install as many additional third-party security tools as possible on every device',
      'Grant every user local administrator rights so they can self-manage their own security',
      'Leave default vendor configurations unchanged to avoid compatibility issues',
    ], correctIndex: 0,
    explanation:
        'Endpoint hardening is about removing what is unnecessary and applying secure baselines — not stacking on more tools or leaving risky defaults and broad privileges in place.',
  ),
  QuizQuestion(
    question:
        'A mobile device management (MDM) policy blocks enrollment for any device found to be rooted or jailbroken. An employee argues their rooted phone is actually MORE secure since they customized its security settings themselves. Why does the organization\'s policy remain justified?',
    options: [
      'MDM software is only compatible with devices running factory default settings',
      'Rooting or jailbreaking a personal device is universally illegal',
      'Rooted and jailbroken devices are always physically incapable of connecting to corporate Wi-Fi',
      'These bypass manufacturer security controls and allow unverified software',
    ], correctIndex: 3,
    explanation:
        'Rooting or jailbreaking removes manufacturer security protections and can allow unverified software, regardless of how the user has otherwise configured the device — the underlying control layer is compromised.',
  ),
  QuizQuestion(
    question:
        'A company\'s vulnerability management team is deciding between patching every identified vulnerability on a fixed monthly schedule versus prioritizing remediation based on exploitability and business impact. Which approach BEST reflects mature vulnerability management?',
    options: [
      'Apply patches in a random order to spread testing effort evenly across the entire environment',
      'Patch strictly in order of discovery date, addressing the oldest vulnerabilities first regardless of severity',
      'Prioritize by actual business risk, not a fixed schedule',
      'Only patch vulnerabilities that have already resulted in a confirmed, documented breach at the organization',
    ], correctIndex: 2,
    explanation:
        'Risk-based, Just-in-Time patch and vulnerability management focuses remediation on what actually matters most to the business, rather than a rigid, severity-blind schedule.',
  ),
  QuizQuestion(
    question:
        'A remote employee\'s laptop begins accepting network connections from an unfamiliar internal IP address while they are working from a coffee shop, despite the organization enforcing Zero Trust principles. What should happen NEXT under a properly implemented Zero Trust model?',
    options: [
      'The laptop is granted full internal network trust once, and never re-evaluated for the remainder of the session',
      'The connection is automatically trusted since the laptop is a corporate-managed device',
      'Zero Trust does not apply to remote or off-network devices',
      'The request is evaluated on real-time signals, regardless of network origin',
    ], correctIndex: 3,
    explanation:
        'Zero Trust continuously evaluates every access request using multiple signals rather than assuming trust based on prior verification or the device\'s ownership status alone.',
  ),

  // From: Identity Federation & SSO
  QuizQuestion(
    question:
        'A company integrates Salesforce with its internal Identity Provider so employees no longer need separate Salesforce credentials. During login, Salesforce redirects the user to the IdP, then receives a signed response confirming their identity. What must Salesforce verify before granting access?',
    options: [
      'Nothing further — the fact that a redirect occurred is treated as sufficient proof of authentication',
      'Only the requesting user\'s IP address, checked once at the moment the request is made',
      'Only the physical geographic location where the Identity Provider\'s servers happen to be hosted',
      'The digital signature, certificate validity, expiration, and trusted IdP',
    ], correctIndex: 3,
    explanation:
        'Before trusting a SAML assertion, the Service Provider must validate its signature, certificate, expiration, and issuing IdP — skipping this would let a forged assertion grant unauthorized access.',
  ),
  QuizQuestion(
    question:
        'A mobile app needs to access a user\'s cloud photo storage to enable a printing feature, without ever seeing or storing the user\'s actual cloud account password. Which approach BEST satisfies this requirement?',
    options: [
      'Store the user\'s password in the app\'s local database for convenience',
      'Use OAuth 2.0 for a scoped token, without exposing the password',
      'Require the user to manually download and re-upload each photo instead of connecting the accounts',
      'Ask the user to type their cloud storage password directly into the printing app',
    ], correctIndex: 1,
    explanation:
        'OAuth 2.0 exists exactly for this scenario — granting a third-party app limited, revocable access without ever exposing the user\'s actual credentials to that app.',
  ),
  QuizQuestion(
    question:
        'A security team notices a user account authenticate successfully from Bengaluru at 9:00 AM, then authenticate again from a different country just 35 minutes later. What should this trigger under a properly configured identity protection system?',
    options: [
      'A high-risk \'impossible travel\' flag, prompting extra verification',
      'A permanent block on all future logins from any location',
      'Automatic account deletion without any further investigation',
      'No action, since successful authentication always indicates legitimate access',
    ], correctIndex: 0,
    explanation:
        'Two geographically distant successful logins within a timeframe that rules out legitimate travel is a textbook impossible-travel signal, warranting risk-based additional verification.',
  ),
  QuizQuestion(
    question:
        'An organization is migrating from an on-premises Active Directory environment to a hybrid model that also supports modern cloud applications using OAuth 2.0 and SAML. Which component is BEST suited to handle the new cloud-facing authentication requirements?',
    options: [
      'Disabling cloud application access entirely until a future, unscheduled major infrastructure overhaul occurs',
      'Active Directory Domain Services alone, since it already fully handles every modern authentication requirement',
      'A cloud identity platform like Microsoft Entra ID, supporting modern protocols',
      'A shared spreadsheet listing every employee\'s current password for quick reference during migration',
    ], correctIndex: 2,
    explanation:
        'Cloud identity platforms like Microsoft Entra ID are purpose-built to support modern protocols such as OAuth 2.0 and SAML, complementing on-premises AD DS in a hybrid identity model.',
  ),
  QuizQuestion(
    question:
        'After a security review, an organization decides to invest significant additional protection specifically around its Identity Provider infrastructure, even though it already has strong protections on individual applications. What justifies this extra investment?',
    options: [
      'Extra protection on the IdP is purely a cosmetic, low-priority improvement',
      'The IdP is the central trust authority for every connected app',
      'The Identity Provider has no more significance than any single connected application',
      'Identity Providers are inherently immune to compromise and require no special protection',
    ], correctIndex: 1,
    explanation:
        'Because every Service Provider trusts the IdP\'s authentication decisions, a compromised IdP could grant an attacker access to every connected application — justifying its outsized protection priority.',
  ),

  // From: Application Security
  QuizQuestion(
    question:
        'A developer is reviewing code that builds SQL queries by directly concatenating user-submitted form input into the query string. A security reviewer flags this immediately. What is the BEST remediation?',
    options: [
      'Rename the input field to make its purpose less obvious to potential attackers',
      'Use parameterized queries so input is always treated as data',
      'Add a client-side JavaScript validation check and consider the issue resolved',
      'Increase the database server\'s memory allocation to handle malformed queries more gracefully',
    ], correctIndex: 1,
    explanation:
        'Parameterized queries fundamentally separate user input from query logic, closing off SQL Injection at the root — client-side validation alone can always be bypassed.',
  ),
  QuizQuestion(
    question:
        'A web application displays user-submitted comments on a public page without any output encoding. A tester submits a comment containing a script tag, and it executes in other visitors\' browsers when the page loads. Which vulnerability does this demonstrate, and what is the core fix?',
    options: [
      'A misconfigured firewall rule; the fix is to update network access control lists',
      'SQL Injection; the fix is to use parameterized database queries',
      'Stored XSS; fix with proper output encoding before rendering',
      'A Denial-of-Service vulnerability; the fix is to add rate limiting',
    ], correctIndex: 2,
    explanation:
        'Untrusted content that executes as script in other users\' browsers when rendered is stored XSS, and the correct fix is context-appropriate output encoding, not a firewall or SQL-layer change.',
  ),
  QuizQuestion(
    question:
        'A financial application currently authenticates users only when they first log in, keeping the session valid for eight hours regardless of what happens afterward. A security assessment recommends re-evaluating sessions if the user\'s device becomes non-compliant partway through the day. Which capability addresses this recommendation?',
    options: [
      'Continuous Access Evaluation, reassessing sessions in near real time',
      'Requiring the same password to be re-entered every ten minutes with no other changes',
      'Removing session expiration entirely so users never need to re-authenticate',
      'Increasing the session timeout to twelve hours for user convenience',
    ], correctIndex: 0,
    explanation:
        'Continuous Access Evaluation is designed exactly for this scenario — reassessing an active session in near real time when device compliance or risk changes, rather than trusting a session blindly until it naturally expires.',
  ),
  QuizQuestion(
    question:
        'An organization\'s public API currently has no limit on how many requests a single client can make per minute. During a security review, this is flagged as a risk. Which control BEST addresses the concern?',
    options: [
      'Removing authentication requirements to simplify the API for legitimate users',
      'Publishing the API\'s internal source code publicly for transparency',
      'Implementing rate limiting on requests per client',
      'Disabling the API entirely rather than adding any additional controls',
    ], correctIndex: 2,
    explanation:
        'Rate limiting directly addresses the risk of abuse, automated attacks, and resource exhaustion by capping how many requests a single client can make in a given window.',
  ),
  QuizQuestion(
    question:
        'A code review finds that an application logs the exact database error message, including table names and a partial SQL query, directly back to the end user whenever a request fails. What is the PRIMARY security concern, and what should replace this behavior?',
    options: [
      'The underlying database engine itself should simply be replaced with a different vendor to resolve this problem',
      'The application should stop logging errors altogether, removing all logging to sidestep the issue completely',
      'No real concern exists here; detailed error messages simply help end users troubleshoot their own failed requests independently',
      'Errors leak internal detail; show generic messages, log full detail server-side',
    ], correctIndex: 3,
    explanation:
        'Detailed error messages exposed to end users hand attackers a roadmap of internal structure; the fix is generic user-facing messages paired with full detail captured only in secure server-side logs.',
  ),

  // From: Cloud Security
  QuizQuestion(
    question:
        'A company migrates its database to a major cloud provider\'s Infrastructure-as-a-Service (IaaS) offering. A month later, a misconfigured storage bucket exposes customer data publicly. The provider states the underlying infrastructure was never breached. Under the Shared Responsibility Model, who is MOST accountable for this specific incident?',
    options: [
      'Neither party bears responsibility, since configuration mistakes are considered an unavoidable cost of cloud adoption',
      'The cloud provider, since responsibility for all cloud security rests entirely with them regardless of service model',
      'The customer, since securing their own deployed configuration is their responsibility',
      'A third-party auditor, even though none was ever formally engaged to review this specific deployment',
    ], correctIndex: 2,
    explanation:
        'Under IaaS, the provider secures the underlying infrastructure, but the customer remains responsible for securely configuring what they deploy — including storage bucket permissions.',
  ),
  QuizQuestion(
    question:
        'A DevOps team uses Infrastructure as Code (IaC) templates to provision hundreds of virtual machines automatically. One template contains a hardcoded default password. What is the MOST significant risk this specific practice introduces?',
    options: [
      'Reduced compatibility between the template and the cloud provider\'s billing dashboard interface',
      'The flawed template replicates the same vulnerability at scale',
      'Modestly increased cloud storage costs attributable to the larger size of the IaC template file itself',
      'Slightly slower deployment times compared to provisioning each virtual machine manually one at a time',
    ], correctIndex: 1,
    explanation:
        'Because IaC templates are reused repeatedly, a single flawed template — like one containing hardcoded credentials — replicates that same security weakness across every deployment made from it.',
  ),
  QuizQuestion(
    question:
        'A security team wants centralized visibility and consistent policy enforcement across dozens of unsanctioned SaaS applications employees have started using without formal approval. Which tool category is BEST suited to this specific need?',
    options: [
      'A traditional network firewall focused on perimeter traffic filtering',
      'An antivirus solution installed on individual endpoint devices',
      'A CASB, providing visibility and access control across SaaS apps',
      'A physical access control system for the corporate office building',
    ], correctIndex: 2,
    explanation:
        'A CASB is specifically designed to give organizations visibility and consistent policy enforcement across the many SaaS applications employees use, including unsanctioned "Shadow IT" tools.',
  ),
  QuizQuestion(
    question:
        'A company needs to migrate a legacy application to the cloud quickly, with minimal code changes, accepting that some existing technical debt will carry over for now. Which cloud migration strategy BEST matches this priority?',
    options: [
      'Rehosting (\'Lift and Shift\'), moving the app with minimal changes',
      'Retiring the application entirely rather than migrating it',
      'Rebuilding the application from scratch using an entirely new technology stack',
      'Refactoring, which redesigns the application to use cloud-native services from the start',
    ], correctIndex: 0,
    explanation:
        'Rehosting prioritizes migration speed by moving an application largely as-is, which matches this scenario\'s priorities better than Refactoring\'s slower, more thorough redesign approach.',
  ),
  QuizQuestion(
    question:
        'A security architect wants to distinguish between checking whether a cloud environment\'s configuration follows best practices versus actively protecting the workloads running within it from runtime threats. Which two tool categories map to these respective goals?',
    options: [
      'IAM for configuration security; DLP for protecting workloads during runtime',
      'CASB for configuration security; SIEM for protecting workloads during runtime',
      'WAF for configuration security; VPN for protecting workloads during runtime',
      'CSPM for configuration; CWPP for runtime workload protection',
    ], correctIndex: 3,
    explanation:
        'CSPM (Cloud Security Posture Management) focuses on configuration correctness, while CWPP (Cloud Workload Protection Platform) focuses on protecting the running workload itself — complementary, distinct functions.',
  ),

  // From: Security Operations
  QuizQuestion(
    question:
        'A SOC analyst is reviewing a high volume of low-severity alerts and begins routinely dismissing them without careful review, given the sheer daily volume. One dismissed alert later turns out to have been an early indicator of a real breach. What underlying problem does this scenario illustrate?',
    options: [
      'Alert fatigue, where high alert volume causes analysts to miss real threats',
      'The SIEM platform experienced a hardware failure that day',
      'An intentional decision by leadership to ignore all low-severity alerts',
      'A firewall misconfiguration unrelated to alert handling',
    ], correctIndex: 0,
    explanation:
        'This is a textbook case of alert fatigue — excessive low-quality alerts desensitize analysts over time, increasing the risk that a genuine early warning gets missed.',
  ),
  QuizQuestion(
    question:
        'A SOC is evaluating tools to reduce the average time it takes to respond to common, repetitive alert types, such as disabling a compromised account or blocking a known-malicious IP. Which capability is BEST suited to this goal?',
    options: [
      'Replacing the SIEM platform entirely with a different vendor',
      'Disabling alerting for the affected alert categories to reduce analyst workload',
      'Hiring additional analysts without changing any existing tooling or process',
      'A SOAR platform automating repetitive response steps',
    ], correctIndex: 3,
    explanation:
        'SOAR platforms specifically reduce Mean Time to Respond by automating well-understood, repetitive response actions — exactly the kind of task described here.',
  ),
  QuizQuestion(
    question:
        'During threat hunting, an analyst notices Microsoft Word spawning PowerShell, which then makes an outbound network connection to an unfamiliar IP address. Individually, each event might be explainable, but together they form a concerning pattern. What SOC capability makes this kind of pattern visible?',
    options: [
      'Manually reviewing each individual log source in isolation, without correlating it against any other source',
      'Disabling logging on lower-priority systems to reduce the overall volume of data analysts must review',
      'Relying solely on traditional antivirus signature matches, with no behavioral analysis applied at all',
      'Alert correlation, linking events across sources into a pattern',
    ], correctIndex: 3,
    explanation:
        'Correlating events across sources — a suspicious process spawning another, followed by an unusual network connection — is what reveals a coherent attack chain that no single event would show alone.',
  ),
  QuizQuestion(
    question:
        'A newly hired SOC analyst asks why the team proactively searches for indicators of compromise instead of waiting for the SIEM to generate alerts. What is the BEST explanation?',
    options: [
      'It proactively searches for techniques an automated alert hasn\'t caught yet',
      'Threat hunting is performed exclusively by external auditors, never internal staff',
      'Threat hunting exists only to satisfy a compliance checkbox with no genuine security value',
      'Proactive searching is unnecessary since automated detection catches every possible threat',
    ], correctIndex: 0,
    explanation:
        'Threat hunting exists precisely because automated detection has gaps — proactively searching can surface sophisticated techniques that haven\'t yet generated a signature-based or rule-based alert.',
  ),
  QuizQuestion(
    question:
        'A SOC manager notices detection rules have not been updated in over a year, despite the threat landscape evolving significantly during that time. What discipline is MOST directly responsible for keeping detection logic current?',
    options: [
      'Detection engineering, which maintains rules against current threats',
      'Facilities management, which is responsible for maintaining the office\'s climate control systems',
      'Payroll administration, which is responsible for processing the SOC analysts\' regular compensation',
      'Physical security, which is responsible for managing employee badge access to the building',
    ], correctIndex: 0,
    explanation:
        'Detection engineering is specifically responsible for building and continuously updating detection rules to reflect current attack techniques, threat intelligence, and organizational risk.',
  ),

  // From: Incident Response
  QuizQuestion(
    question:
        'During a ransomware incident, the response team isolates the affected network segment before fully understanding how the attacker initially gained access. A junior analyst questions why they didn\'t wait for complete understanding first. What is the BEST justification for isolating early?',
    options: [
      'Isolation is never appropriate until the investigation is fully complete',
      'The team had already finished eradicating the threat by that point',
      'Containment can happen before eradication finishes, to stop the spread',
      'Isolating a network segment always destroys any forensic evidence that could otherwise be recovered',
    ], correctIndex: 2,
    explanation:
        'Containment is designed to limit damage while investigation continues — waiting for full understanding before containing an active incident would allow unnecessary additional spread.',
  ),
  QuizQuestion(
    question:
        'After containing a security incident, the response team wants to reimage the affected server immediately to restore service. The lead investigator objects and insists on capturing a memory and disk image first. Why is this objection justified?',
    options: [
      'Reimaging requires vendor approval that has not yet been obtained',
      'Reimaging always takes significantly longer than capturing forensic evidence first',
      'Forensic evidence must be preserved before reimaging destroys it',
      'Containment and Eradication are actually considered the same phase, so no order matters',
    ], correctIndex: 2,
    explanation:
        'Reimaging a system destroys the very evidence — memory contents, disk state — needed to fully understand the incident, which is why forensic preservation must happen before cleanup.',
  ),
  QuizQuestion(
    question:
        'After resolving a significant incident, leadership asks why the team is spending time on a formal "Lessons Learned" review instead of moving directly to the next priority. What is the BEST justification for this step?',
    options: [
      'The step is treated as a purely ceremonial, box-checking requirement with no genuine practical value',
      'Lessons Learned exists primarily as a formal mechanism to assign blame to specific responsible individuals',
      'It feeds improvements back into detection, policy, and training',
      'Lessons Learned is only considered relevant for incidents that resulted in measurable financial loss',
    ], correctIndex: 2,
    explanation:
        'Lessons Learned exists to translate what was discovered during response into concrete improvements — closing gaps in detection, policy, and training that contributed to the incident in the first place.',
  ),
  QuizQuestion(
    question:
        'A CISO is designing tabletop exercise scenarios for the upcoming year and must choose between generic industry templates versus scenarios built around the organization\'s specific threat landscape. Which choice BEST prepares the response team?',
    options: [
      'Scenarios focused exclusively on natural disasters regardless of the organization\'s actual threat landscape',
      'No scenario planning at all, relying entirely on improvisation during a real incident',
      'Generic, off-the-shelf templates, since all organizations face identical realistic threats',
      'Scenarios tailored to the organization\'s own specific threat profile',
    ], correctIndex: 3,
    explanation:
        'Testing scenarios should reflect the threat actors and motivations most realistic for that specific organization — a generic template may prepare the team for the wrong kind of incident entirely.',
  ),
  QuizQuestion(
    question:
        'A root cause analysis following an incident deliberately avoids singling out any one employee for blame, even though a specific misconfiguration by one team member contributed to the breach. Why does this approach typically produce a MORE useful investigation?',
    options: [
      'Skipping the search for fault simply allows the investigation to finish faster with no other benefit',
      'Blame makes people defensive and less forthcoming with honest detail',
      'Every incident, without exception, lacks any single identifiable contributing cause',
      'Avoiding blame is a strict legal requirement in every jurisdiction without exception',
    ], correctIndex: 1,
    explanation:
        'A blame-focused process discourages honesty, since people become defensive and withhold details — a blameless approach surfaces the full, accurate picture needed to prevent recurrence.',
  ),

  // From: Governance, Risk & Compliance
  QuizQuestion(
    question:
        'A risk committee identifies a vulnerability with high likelihood and high potential impact, but the cost of the recommended control significantly exceeds the value of the asset it protects. What is the MOST appropriate, defensible course of action?',
    options: [
      'Transfer the entire risk to an insurance policy without first reviewing its actual coverage terms',
      'Formally accept the risk, with documented, authorized approval',
      'Silently ignore the risk and remove it from the register without any formal decision',
      'Implement the expensive control regardless of cost, since any risk reduction is automatically worthwhile',
    ], correctIndex: 1,
    explanation:
        'When mitigation costs exceed the risk\'s value, formal risk acceptance — documented and properly authorized — is the defensible response, unlike silently ignoring it or spending disproportionately.',
  ),
  QuizQuestion(
    question:
        'An auditor reviewing a security control that "works well in practice" cannot find any supporting documentation showing it was ever formally tested or reviewed. How will this likely be treated in a formal audit?',
    options: [
      'A finding, since auditors can only certify verifiable evidence',
      'As a passing control, since real-world effectiveness is all that matters',
      'As irrelevant, since documentation has no bearing on audit outcomes',
      'As an automatic pass, since undocumented controls are assumed to be effective by default',
    ], correctIndex: 0,
    explanation:
        'Auditors certify based on verifiable evidence — a control that genuinely works but lacks supporting documentation is typically treated the same as one that cannot be confirmed at all.',
  ),
  QuizQuestion(
    question:
        'A company\'s compliance team wants to reduce the burden of preparing separate audit evidence for ISO/IEC 27001, SOC 2, and an internal security framework each year. Which approach BEST addresses this efficiently?',
    options: [
      'Ignore two of the three frameworks and focus exclusively on the one leadership considers most important',
      'Map overlapping controls so one piece of evidence satisfies all three',
      'Postpone all audits indefinitely until a simpler regulatory environment emerges',
      'Hire three completely separate compliance teams, one dedicated to each individual framework',
    ], correctIndex: 1,
    explanation:
        'Controls mapping (harmonization) lets a single piece of evidence satisfy multiple overlapping framework requirements at once, significantly reducing duplicated audit preparation effort.',
  ),
  QuizQuestion(
    question:
        'A vendor was thoroughly vetted and approved two years ago, but has not been reassessed since. A new security incident at that vendor raises concerns. What does this scenario BEST illustrate about Third-Party Risk Management?',
    options: [
      'Vendor reassessment is purely optional busywork with no real security value',
      'Vendor risk is static once the initial contract is signed and never needs revisiting',
      'Third-party risk only matters during the initial procurement decision, not afterward',
      'A vendor\'s posture can change, so periodic reassessment is essential',
    ], correctIndex: 3,
    explanation:
        'This scenario illustrates exactly why ongoing reassessment matters — a vendor\'s security posture is not fixed at onboarding, and can meaningfully change over the life of the relationship.',
  ),
  QuizQuestion(
    question:
        'A CISO must present quarterly cybersecurity metrics to the board, most of whom have limited technical background. Which approach to reporting will be MOST effective?',
    options: [
      'Presenting raw technical statistics, such as firewall log counts, without translating them into business context',
      'Skipping formal board reporting entirely, treating cybersecurity as a purely operational, non-strategic matter',
      'Translating technical risk into business terms and needed decisions',
      'Presenting the identical, unmodified technical report originally prepared for the engineering team',
    ], correctIndex: 2,
    explanation:
        'Effective board reporting translates technical risk into business language and clear decisions needed, since board members are typically not equipped to act on raw technical statistics alone.',
  ),
  QuizQuestion(
    question:
        'An organization is deciding how to classify a newly created spreadsheet containing unreleased financial projections and executive compensation details. Which classification level is MOST appropriate, and why?',
    options: [
      'No classification is needed, since the document is only a spreadsheet rather than a formal report',
      'Internal, treating it the same as routine meeting notes with no special handling',
      'Confidential or Restricted, given the harm from unauthorized disclosure',
      'Public, since financial information is generally not considered sensitive',
    ], correctIndex: 2,
    explanation:
        'Unreleased financial and compensation data represents exactly the kind of sensitive information that warrants Confidential or Restricted classification, given the potential harm from unauthorized disclosure.',
  ),

  // From: Social Engineering
  QuizQuestion(
    question:
        'An employee receives a call from someone claiming to be from IT support, stating that "the rest of the department has already completed" a supposed security update and pressuring the employee to do the same immediately. Which social engineering trigger is being used?',
    options: [
      'Social Proof, implying others have already complied',
      'Fear, threatening a negative consequence for non-compliance',
      'Scarcity, implying the offer is limited or about to run out',
      'Authority, invoking a position of power or expertise',
    ], correctIndex: 0,
    explanation:
        'Claiming "everyone else has already done this" leverages Social Proof — the tendency to comply because others reportedly already have, rather than authority, scarcity, or fear specifically.',
  ),
  QuizQuestion(
    question:
        'A receptionist allows an unfamiliar person carrying a large box labeled "IT Equipment Delivery" to walk directly into a secured server room without checking credentials, assuming the person is a legitimate vendor. What social engineering technique does this MOST likely represent?',
    options: [
      'Vishing, which specifically relies on a phone call',
      'Phishing, which specifically relies on deceptive electronic messages',
      'DNS spoofing, which specifically manipulates domain name resolution',
      'Pretexting combined with tailgating to bypass access controls',
    ], correctIndex: 3,
    explanation:
        'A fabricated, plausible scenario ("I\'m delivering IT equipment") combined with physically following someone into a secured area describes pretexting and tailgating working together.',
  ),

  // From: Malware
  QuizQuestion(
    question:
        'An investigator discovers that a compromised server\'s security logs from the past week are completely missing, despite logging having been enabled and functioning normally before that. What does this MOST strongly suggest?',
    options: [
      'Clear evidence that the server has never actually been used by anyone',
      'A hardware failure entirely unrelated to any security concern',
      'An attacker may have deliberately cleared logs to cover their tracks',
      'A normal, routine, scheduled log rotation that happened to occur during this exact window',
    ], correctIndex: 2,
    explanation:
        'Logs that were functioning normally and then suddenly vanish, especially during a period under investigation, strongly suggest deliberate tampering to cover an attacker\'s tracks.',
  ),
  QuizQuestion(
    question:
        'A DDoS attack against a company\'s website generates traffic from what appears to be hundreds of thousands of distinct, legitimate-looking residential IP addresses simultaneously. Why does this make the attack especially difficult to block using simple IP-based filtering?',
    options: [
      'Because the traffic generated in this specific type of attack is always fully encrypted end-to-end, rendering its volume irrelevant',
      'Because all of the attack traffic in this scenario actually originates from one single, easily identifiable source IP address',
      'The huge number of legitimate-looking source IPs defeats simple filtering',
      'Because botnet-driven attacks of this particular type never generate sufficient traffic volume to cause any real, lasting disruption',
    ], correctIndex: 2,
    explanation:
        'A botnet-driven DDoS spreads traffic across enormous numbers of distinct, legitimate-looking source addresses, making naive IP-based blocking ineffective at distinguishing attackers from real users.',
  ),

// Additional scenario-based questions, batch 2 — written with short,
// single-clause options from the start (all four options roughly
// comparable length, no embedded justification clauses) to avoid the
// length-bias pattern found in earlier batches.

  // From: Cybersecurity Fundamentals
  QuizQuestion(
    question:
        'A startup with no dedicated security staff asks which single control would most improve their security posture right now. What should you recommend FIRST?',
    options: [
      'Hire a full-time penetration testing team',
      'Purchase a next-generation firewall appliance',
      'Migrate all systems to a new cloud provider',
      'Enable Multi-Factor Authentication on all accounts',
    ], correctIndex: 3,
    explanation:
        'MFA is the highest-impact, lowest-cost control most organizations can deploy quickly, directly blocking the majority of account-takeover attempts.',
  ),
  QuizQuestion(
    question:
        'An executive asks why the company needs both preventive and detective controls instead of just very strong preventive controls. What is the BEST answer?',
    options: [
      'Preventive controls are only required by regulation',
      'No preventive control is guaranteed to stop every attack',
      'Detective controls replace the need for prevention entirely',
      'Detective controls are always cheaper to implement',
    ], correctIndex: 1,
    explanation:
        'Because no preventive control is perfect, detective controls exist to catch what prevention misses — the two work together, not as substitutes.',
  ),
  QuizQuestion(
    question:
        'A manager asks why the security team insists on a formal change management process for a "simple" configuration change. What is the BEST justification?',
    options: [
      'Change management is only a legal requirement',
      'Even simple changes can have unintended consequences',
      'It slows down attackers during an active breach',
      'It replaces the need for testing entirely',
    ], correctIndex: 1,
    explanation:
        'Change management exists because even small changes can have unforeseen side effects; a documented review process catches these before they cause outages.',
  ),

  // From: Threats, Attacks & Vulnerabilities
  QuizQuestion(
    question:
        'A vulnerability scan flags a critical finding on a server that is not exposed to the Internet and has no known active exploit. How should this be prioritized relative to a medium-severity finding on an Internet-facing server?',
    options: [
      'Based on actual exposure and exploitability, not severity alone',
      'The critical finding always takes priority regardless of context',
      'The medium finding can be ignored since it is lower severity',
      'Neither finding needs remediation until a breach occurs',
    ], correctIndex: 0,
    explanation:
        'Prioritization should weigh real-world exposure and exploitability alongside raw severity — an exposed medium finding can pose more actual risk than an isolated critical one.',
  ),
  QuizQuestion(
    question:
        'An organization\'s threat model assumes attackers are mostly opportunistic. A new project handles data of interest to a specific nation-state. What should change?',
    options: [
      'Nothing changes, since all attackers are treated the same',
      'Only physical security controls need to be reviewed',
      'The project should ignore nation-state threats entirely',
      'The threat model should be updated to reflect this new risk',
    ], correctIndex: 3,
    explanation:
        'Threat modeling should reflect the actual adversaries relevant to specific data or systems — a nation-state-level target needs a correspondingly updated threat model.',
  ),
  QuizQuestion(
    question:
        'A company\'s attack surface grows significantly after acquiring a smaller company with unknown security practices. What should happen FIRST?',
    options: [
      'Immediately merge both networks with no review',
      'Conduct a security assessment of the acquired environment',
      'Assume the acquired company\'s security is adequate',
      'Wait one year before evaluating any security risk',
    ], correctIndex: 1,
    explanation:
        'Mergers and acquisitions should trigger a security assessment of the acquired environment before integration, since its actual security posture is unknown.',
  ),
  QuizQuestion(
    question:
        'A vulnerability management report shows the same critical finding recurring every month despite being marked "resolved." What does this MOST likely indicate?',
    options: [
      'The finding is a false positive that can be ignored',
      'The vulnerability scanner itself must be broken',
      'The remediation is not actually being verified after closure',
      'Recurring findings always indicate active exploitation',
    ], correctIndex: 2,
    explanation:
        'A finding that keeps recurring after being marked resolved usually points to a verification gap — remediation was claimed but never actually confirmed.',
  ),

  // From: Network Security
  QuizQuestion(
    question:
        'A network segmentation project aims to limit how far an attacker can move if one workstation is compromised. Which architecture change BEST supports this goal?',
    options: [
      'Allowing unrestricted communication between all departments',
      'Placing every device on a single flat network for simplicity',
      'Dividing the network into isolated zones with restricted access between them',
      'Disabling all internal firewalls to improve performance',
    ], correctIndex: 2,
    explanation:
        'Network segmentation limits lateral movement by isolating zones and restricting traffic between them, containing a compromise to a smaller blast radius.',
  ),
  QuizQuestion(
    question:
        'An organization wants to inspect encrypted web traffic for malware without breaking end-user certificate trust warnings. Which approach is MOST appropriate?',
    options: [
      'Ignore encrypted traffic since it cannot be inspected',
      'Deploy a TLS inspection proxy with a trusted internal certificate',
      'Disable HTTPS entirely across the corporate network',
      'Require users to manually approve every certificate warning',
    ], correctIndex: 1,
    explanation:
        'A properly deployed TLS inspection proxy, using a certificate trusted by managed devices, allows visibility into encrypted traffic without triggering warnings.',
  ),
  QuizQuestion(
    question:
        'A remote office reports intermittent connectivity, and logs show the site-to-site VPN tunnel repeatedly dropping and re-establishing. What should be investigated FIRST?',
    options: [
      'Whether the office needs a new physical security guard',
      'Whether antivirus software needs a signature update',
      'Whether the VPN\'s underlying Internet connection is unstable',
      'Whether the office\'s users have weak passwords',
    ], correctIndex: 2,
    explanation:
        'Intermittent VPN tunnel drops are most commonly caused by an unstable underlying Internet connection, which should be investigated before assuming a security compromise.',
  ),
  QuizQuestion(
    question:
        'A company wants to prevent internal users from bypassing the corporate proxy and connecting directly to the Internet. Which control BEST supports this goal?',
    options: [
      'Removing the proxy entirely to simplify the network',
      'Trusting all outbound traffic from internal IP ranges by default',
      'Relying solely on user honesty to follow policy',
      'Firewall rules that block direct outbound traffic except through the proxy',
    ], correctIndex: 3,
    explanation:
        'Enforcing outbound traffic through firewall rules that require proxy use closes the technical path for bypassing monitoring, rather than relying on policy alone.',
  ),

  // From: Malware
  QuizQuestion(
    question:
        'A file downloaded from an email attachment triggers an antivirus alert, but the user has already opened it before the alert appeared. What should happen NEXT?',
    options: [
      'Isolate the device from the network and investigate further',
      'Forward the file to other employees for a second opinion',
      'Restart the computer and assume the issue is resolved',
      'Delete the antivirus alert and continue working normally',
    ], correctIndex: 0,
    explanation:
        'Once a file has already executed, isolating the device prevents further spread while the incident is properly investigated, rather than assuming the alert alone resolved anything.',
  ),
  QuizQuestion(
    question:
        'A security team notices a spike in outbound traffic to multiple unfamiliar domains from several machines simultaneously, all within the same subnet. What does this MOST likely suggest?',
    options: [
      'A routine software licensing check from a single vendor',
      'Normal browsing behavior from several unrelated employees',
      'A worm or self-propagating malware spreading across the subnet',
      'A scheduled backup job running slightly behind normal hours',
    ], correctIndex: 2,
    explanation:
        'Simultaneous unusual outbound activity from multiple machines in the same subnet is a strong indicator of self-propagating malware moving laterally.',
  ),
  QuizQuestion(
    question:
        'Ransomware encrypts a subset of files on a shared drive before being detected and contained. Backups exist but were last taken two weeks ago. What is the MOST appropriate recovery approach?',
    options: [
      'Pay the ransom immediately as the fastest path to recovery',
      'Discard the backups since they are not perfectly current',
      'Wait indefinitely for a free decryption tool to appear',
      'Restore from backup, then assess and recreate any lost recent data',
    ], correctIndex: 3,
    explanation:
        'Restoring from the most recent clean backup, then addressing the gap for data created since, is the standard recovery approach — paying ransom is discouraged and not guaranteed to work.',
  ),

  // From: Social Engineering
  QuizQuestion(
    question:
        'An employee posts a detailed description of their job responsibilities and current project on a public social media profile. How could this MOST directly aid an attacker?',
    options: [
      'It automatically grants the attacker system access',
      'It provides material for a convincing, targeted pretext',
      'It only matters if the employee is in IT specifically',
      'It has no security relevance whatsoever',
    ], correctIndex: 1,
    explanation:
        'Publicly available details about a role and current projects give attackers exactly the material needed to craft a convincing, targeted pretexting or spear-phishing attempt.',
  ),
  QuizQuestion(
    question:
        'A caller claims to be from the bank\'s fraud department and asks a customer to read back a one-time code just sent to their phone. What is actually happening?',
    options: [
      'The bank is confirming the customer\'s phone number works',
      'The call cannot possibly be related to any fraud attempt',
      'The caller is trying to steal the code to complete their own login',
      'This is a standard, legitimate identity verification step',
    ], correctIndex: 2,
    explanation:
        'Legitimate institutions never ask customers to read back one-time codes; this is a real-time phishing technique to steal the code and complete the attacker\'s own login.',
  ),

  // From: Identity Access Management
  QuizQuestion(
    question:
        'A new hire is granted access to every application used by their entire department on their first day, "just in case" they need it later. What principle does this violate?',
    options: [
      'Non-repudiation, since actions cannot be traced to a user',
      'Least privilege, since access should match actual job needs',
      'Defense in depth, since only one control layer exists',
      'Separation of duties, since one person holds too many roles',
    ], correctIndex: 1,
    explanation:
        'Granting broad access "just in case" rather than based on actual job requirements is a direct violation of least privilege.',
  ),
  QuizQuestion(
    question:
        'An organization discovers dozens of unused accounts still active for contractors whose engagements ended months ago. What process gap does this MOST likely reflect?',
    options: [
      'Missing automated deprovisioning tied to contract end dates',
      'Insufficient antivirus coverage on contractor devices',
      'A misconfigured firewall rule affecting contractor access',
      'Weak password complexity enforced on contractor accounts',
    ], correctIndex: 0,
    explanation:
        'Active accounts long after a contract ends point to a missing automated deprovisioning trigger tied to contract or engagement end dates.',
  ),
  QuizQuestion(
    question:
        'A privileged account is used for both routine daily tasks and emergency administrative actions. What risk does this combination create?',
    options: [
      'The account automatically loses its administrative rights',
      'No meaningful risk exists from combining these uses',
      'Routine use increases the account\'s exposure to compromise',
      'Emergency actions become technically impossible to perform',
    ], correctIndex: 2,
    explanation:
        'Using a privileged account for routine tasks increases how often it is exposed to phishing, malware, and other compromise vectors, elevating overall risk.',
  ),
  QuizQuestion(
    question:
        'An organization wants to grant temporary elevated access for a specific maintenance task, automatically expiring afterward. Which capability BEST supports this?',
    options: [
      'Just-in-Time (JIT) privileged access with automatic expiration',
      'Permanently elevating the user\'s standing access level',
      'Sharing the administrator password for the task\'s duration',
      'Disabling logging during the maintenance window',
    ], correctIndex: 0,
    explanation:
        'Just-in-Time privileged access grants elevated rights only for the needed window and automatically expires them, avoiding standing privileged access.',
  ),

  // From: Cryptography
  QuizQuestion(
    question:
        'A developer wants to verify a downloaded software package has not been tampered with in transit. Which technique BEST accomplishes this?',
    options: [
      'Opening the file to see if it appears to run correctly',
      'Comparing the file\'s cryptographic hash against the vendor\'s published value',
      'Trusting the download since it came from a search engine result',
      'Checking only that the file size looks approximately correct',
    ], correctIndex: 1,
    explanation:
        'Comparing a cryptographic hash against the vendor\'s published value reliably detects tampering, unlike file size or simply running the file.',
  ),
  QuizQuestion(
    question:
        'An application team wants to ensure that even if their database is stolen, encrypted personal data remains unreadable without a separately managed key. Which practice supports this?',
    options: [
      'Using no encryption and relying solely on access controls',
      'Encrypting the data with a key hardcoded into the application',
      'Storing the encryption key inside the same database table',
      'Storing encryption keys separately from the encrypted data',
    ], correctIndex: 3,
    explanation:
        'Keeping encryption keys separate from the data they protect ensures that stealing the database alone does not expose the underlying plaintext.',
  ),
  QuizQuestion(
    question:
        'A team debates whether to use a well-known standard algorithm or a custom-designed encryption scheme created in-house. Which choice is generally recommended, and why?',
    options: [
      'The custom scheme, since attackers won\'t know how it works',
      'Either choice is equally safe regardless of public review',
      'Neither choice matters if the key is kept secret',
      'The standard algorithm, since it has withstood public scrutiny',
    ], correctIndex: 3,
    explanation:
        'Well-known, publicly vetted algorithms have survived extensive cryptanalysis; custom "security through obscurity" schemes frequently contain undiscovered weaknesses.',
  ),
  QuizQuestion(
    question:
        'A certificate used by a customer-facing website is set to expire in three days, and no renewal has been scheduled. What is the MOST urgent risk?',
    options: [
      'All employee accounts will be automatically locked out',
      'Browsers will show trust warnings once the certificate expires',
      'The company\'s domain name registration will be canceled',
      'The website\'s database will become permanently corrupted',
    ], correctIndex: 1,
    explanation:
        'An expired TLS certificate causes browsers to display trust warnings to visitors, damaging user trust and potentially blocking access entirely.',
  ),

  // From: Secure Protocols
  QuizQuestion(
    question:
        'A company wants employees connecting from public Wi-Fi to have their traffic protected from local network eavesdropping. Which solution BEST addresses this?',
    options: [
      'Relying solely on antivirus software on the laptop',
      'Trusting that public Wi-Fi networks are inherently safe',
      'Disabling all wireless connectivity company-wide',
      'Requiring a VPN connection before accessing company resources',
    ], correctIndex: 3,
    explanation:
        'A VPN encrypts traffic end-to-end, protecting it from eavesdropping on untrusted networks like public Wi-Fi, which antivirus alone cannot address.',
  ),
  QuizQuestion(
    question:
        'An internal API endpoint currently accepts both HTTP and HTTPS connections. A security review flags this as a risk. What is the MOST appropriate fix?',
    options: [
      'Disable HTTPS since HTTP is simpler to troubleshoot',
      'Add a warning banner instead of changing the configuration',
      'Leave both enabled since internal traffic is always safe',
      'Disable plain HTTP and require HTTPS for all connections',
    ], correctIndex: 3,
    explanation:
        'Allowing plain HTTP alongside HTTPS leaves an unencrypted path available; disabling HTTP and requiring HTTPS closes that gap.',
  ),
  QuizQuestion(
    question:
        'A company wants to verify that email claiming to come from its domain was actually authorized to be sent, reducing spoofed messages reaching recipients. Which record should be configured?',
    options: [
      'An MX record with no authentication information',
      'A TXT record containing the company\'s street address',
      'An SPF record listing authorized sending mail servers',
      'A CNAME record pointing to the company website',
    ], correctIndex: 2,
    explanation:
        'SPF records explicitly list which mail servers are authorized to send on a domain\'s behalf, helping receiving servers reject spoofed messages.',
  ),

  // From: Endpoint Security
  QuizQuestion(
    question:
        'An organization\'s laptops are frequently lost or stolen while traveling. Which control BEST protects data on the device even if it falls into the wrong hands?',
    options: [
      'Requiring a longer laptop warranty period',
      'A sticker on the laptop reminding users to be careful',
      'Disabling the laptop\'s built-in webcam',
      'Full-disk encryption enabled on every laptop',
    ], correctIndex: 3,
    explanation:
        'Full-disk encryption ensures that data remains unreadable without the correct credentials, protecting it even if the physical device is lost or stolen.',
  ),
  QuizQuestion(
    question:
        'A security team wants visibility into what processes are running on endpoints and the ability to isolate a compromised machine remotely. Which tool category BEST fits this need?',
    options: [
      'A physical door lock on the server room',
      'A basic signature-based antivirus with no telemetry',
      'A password manager deployed to end users',
      'Endpoint Detection and Response (EDR)',
    ], correctIndex: 3,
    explanation:
        'EDR platforms specifically provide endpoint visibility, behavioral detection, and remote response capabilities like isolating a compromised machine.',
  ),
  QuizQuestion(
    question:
        'An organization\'s endpoints are missing critical patches for months at a time due to inconsistent manual patching. What is the MOST effective long-term fix?',
    options: [
      'Asking users to remember to patch their own devices',
      'Deploying automated patch management across all endpoints',
      'Disabling patch notifications to reduce user annoyance',
      'Reducing the frequency of vulnerability scanning',
    ], correctIndex: 1,
    explanation:
        'Automated patch management removes reliance on manual, inconsistent processes, ensuring patches are applied reliably and on schedule.',
  ),

  // From: Identity Federation & SSO
  QuizQuestion(
    question:
        'A company\'s Single Sign-On portal experiences an outage. What is the LARGEST operational impact of this specific type of failure?',
    options: [
      'Users lose access to every connected application simultaneously',
      'The outage has no impact on any connected application',
      'Only one specific application becomes briefly unavailable',
      'Users can still access everything using cached credentials',
    ], correctIndex: 0,
    explanation:
        'Because SSO centralizes authentication for many applications, its outage can simultaneously block access to everything connected to it — a key reason IdP resilience matters.',
  ),
  QuizQuestion(
    question:
        'A third-party contractor needs temporary access to one internal application without receiving a full corporate identity. Which approach BEST fits this need?',
    options: [
      'Federated guest access scoped to just that one application',
      'Granting the contractor unrestricted network access',
      'Sharing an existing employee\'s login credentials',
      'Issuing the contractor a permanent full employee account',
    ], correctIndex: 0,
    explanation:
        'Federated guest access scoped narrowly to the needed application provides exactly the access required without creating unnecessary standing accounts.',
  ),
  QuizQuestion(
    question:
        'An application accepts an OAuth access token and uses it to call an API on the user\'s behalf. What should the API do before honoring any request using that token?',
    options: [
      'Ignore the token and rely only on the caller\'s IP address',
      'Validate the token\'s signature, expiration, and granted scope',
      'Accept any token regardless of its original intended scope',
      'Trust the token automatically since it was already issued once',
    ], correctIndex: 1,
    explanation:
        'APIs must independently validate a token\'s signature, expiration, and scope before honoring a request — never assume a previously issued token remains automatically trustworthy.',
  ),

  // From: Application Security
  QuizQuestion(
    question:
        'A mobile app stores a user\'s authentication token in plaintext within local device storage. A security review flags this. What is the BEST remediation?',
    options: [
      'Remove authentication from the app entirely to avoid the issue',
      'Continue storing it in plaintext since the device is password-locked',
      'Store the token using the platform\'s secure credential storage',
      'Store the token inside a publicly readable log file instead',
    ], correctIndex: 2,
    explanation:
        'Platform-provided secure credential storage (like a keychain or keystore) protects sensitive tokens far better than plaintext local storage, which any malicious app could potentially read.',
  ),
  QuizQuestion(
    question:
        'A code review finds that a web application accepts file uploads with no restriction on file type or size. What is the GREATEST risk this creates?',
    options: [
      'The application\'s font rendering could become inconsistent',
      'An attacker could upload and execute a malicious script file',
      'Users might upload files with unusual color palettes',
      'Uploaded files might display in the wrong browser tab',
    ], correctIndex: 1,
    explanation:
        'Unrestricted file uploads allow attackers to upload malicious executable or script files that, if later executed by the server, can lead to full compromise.',
  ),
  QuizQuestion(
    question:
        'An application\'s login page provides different error messages for "invalid username" versus "invalid password." Why is this considered a security weakness?',
    options: [
      'It has no meaningful effect on account security',
      'It lets an attacker confirm which usernames are valid accounts',
      'It only affects users with unusually long usernames',
      'It makes the login page load noticeably slower',
    ], correctIndex: 1,
    explanation:
        'Distinct error messages let an attacker enumerate valid usernames one at a time, which is why login pages should return a generic, identical error for both cases.',
  ),
  QuizQuestion(
    question:
        'A development team wants to catch security vulnerabilities in code before it reaches production. Which practice BEST supports this goal?',
    options: [
      'Integrating automated security scanning into the CI/CD pipeline',
      'Skipping code review entirely to speed up releases',
      'Relying entirely on end users to report any issues found',
      'Reviewing code for security only once a year',
    ], correctIndex: 0,
    explanation:
        'Integrating automated security scanning directly into CI/CD catches vulnerabilities early and consistently, before code ever reaches production.',
  ),

  // From: Cloud Security
  QuizQuestion(
    question:
        'A cloud storage bucket was accidentally configured for public read access, exposing internal documents for several hours before discovery. What should happen FIRST once discovered?',
    options: [
      'Wait for a customer complaint before taking any action',
      'Leave the configuration unchanged pending a scheduled review',
      'Delete the bucket entirely without investigating first',
      'Immediately restrict access, then assess what was exposed',
    ], correctIndex: 3,
    explanation:
        'The immediate priority is stopping ongoing exposure by restricting access, followed by assessing what data was exposed and to whom.',
  ),
  QuizQuestion(
    question:
        'An organization uses multiple cloud providers and struggles to maintain consistent security policies across all of them. Which approach BEST addresses this challenge?',
    options: [
      'Standardizing on whichever provider is currently cheapest',
      'A centralized cloud security posture management tool spanning providers',
      'Ignoring the inconsistency since each provider is separate',
      'Manually checking each provider\'s console once a year',
    ], correctIndex: 1,
    explanation:
        'A centralized CSPM tool that spans multiple providers gives consistent policy visibility and enforcement across an otherwise fragmented multi-cloud environment.',
  ),
  QuizQuestion(
    question:
        'A development team provisions cloud resources directly through the console instead of using the organization\'s approved Infrastructure as Code templates. What risk does this MOST directly introduce?',
    options: [
      'Automatic encryption of all newly created resources',
      'Faster deployment with no meaningful security trade-off',
      'Configuration drift and inconsistency from the approved baseline',
      'Elimination of the need for any future security review',
    ], correctIndex: 2,
    explanation:
        'Manual provisioning outside approved IaC templates introduces configuration drift, since resources no longer consistently match the organization\'s vetted baseline.',
  ),

  // From: Security Operations
  QuizQuestion(
    question:
        'A SOC dashboard shows dozens of alerts triggered by the same underlying event across multiple security tools. What capability would MOST reduce this redundant noise?',
    options: [
      'Manually closing duplicate alerts one at a time forever',
      'Alert deduplication and correlation within the SIEM',
      'Disabling alerting from all but one security tool',
      'Increasing the number of analysts without changing tooling',
    ], correctIndex: 1,
    explanation:
        'Alert deduplication and correlation logic within the SIEM groups related alerts from the same underlying event, reducing redundant noise analysts must review.',
  ),
  QuizQuestion(
    question:
        'A SOC wants to measure whether its detection capability is actually improving over time, not just whether alerts are being closed quickly. Which metric BEST supports this goal?',
    options: [
      'The number of analysts currently on staff',
      'The length of the SOC\'s shift handoff documentation',
      'True positive rate compared against known red team activity',
      'The total number of tickets closed each week',
    ], correctIndex: 2,
    explanation:
        'Comparing detection results against known red team or simulated activity directly measures whether real threats are actually being caught, not just alert volume.',
  ),
  QuizQuestion(
    question:
        'An analyst wants to understand whether a suspicious IP address has been associated with malicious activity elsewhere before deciding how urgently to respond. Which resource BEST supports this?',
    options: [
      'A threat intelligence feed with reputation data',
      'A general Internet search with no verification',
      'The organization\'s employee directory',
      'The building\'s physical visitor log',
    ], correctIndex: 0,
    explanation:
        'Threat intelligence feeds provide vetted reputation data on indicators like IP addresses, helping analysts quickly assess known-malicious activity.',
  ),

  // From: Incident Response
  QuizQuestion(
    question:
        'During an active incident, the response team disagrees about who has authority to decide whether to take a production system offline. What does this reveal about the organization\'s preparedness?',
    options: [
      'The incident response plan lacks clear decision-making authority',
      'This disagreement is normal and requires no follow-up',
      'The incident itself must not be serious enough to matter',
      'The team is simply too large to respond effectively',
    ], correctIndex: 0,
    explanation:
        'Confusion over decision-making authority during an incident points to a gap in the IR plan, which should clearly define roles and escalation authority in advance.',
  ),
  QuizQuestion(
    question:
        'An organization\'s incident response plan has not been updated since it was first written five years ago, despite significant infrastructure changes since then. What is the MOST appropriate next step?',
    options: [
      'Wait for the next major incident before considering updates',
      'Continue using the plan unchanged since it worked previously',
      'Discard incident response planning entirely as unnecessary',
      'Review and update the plan to reflect the current environment',
    ], correctIndex: 3,
    explanation:
        'Incident response plans should be reviewed and updated regularly to reflect infrastructure and organizational changes, not left static indefinitely.',
  ),
  QuizQuestion(
    question:
        'A responder wants to preserve the original state of a compromised system for potential legal proceedings while still restoring business operations quickly. What approach BEST satisfies both goals?',
    options: [
      'Delete the compromised system immediately to prevent further harm',
      'Preserve the system indefinitely and never restore service',
      'Restore operations first and skip forensic imaging entirely',
      'Capture a forensic image, then restore operations from clean backups',
    ], correctIndex: 3,
    explanation:
        'Capturing a forensic image preserves evidence for later analysis or legal proceedings, while restoring from clean backups lets operations resume quickly in parallel.',
  ),

  // From: Governance, Risk & Compliance
  QuizQuestion(
    question:
        'A new regulation requires organizations to report certain data breaches within 72 hours of discovery. An incident is discovered on a Friday evening. What does this deadline require?',
    options: [
      'The clock only starts on the next business day',
      'The reporting clock starts at discovery, regardless of the day',
      'Weekend discoveries are automatically exempt from reporting',
      'The deadline applies only to breaches discovered on weekdays',
    ], correctIndex: 1,
    explanation:
        'Regulatory reporting deadlines typically start from the moment of discovery, not the next business day, making incident response readiness on weekends essential.',
  ),
  QuizQuestion(
    question:
        'A department wants to bypass the standard security review process for a new vendor because "it\'s just a small tool." What risk does this create?',
    options: [
      'Unvetted vendors may introduce unmanaged security or compliance risk',
      'Skipping review always speeds up procurement with no downside',
      'Small tools are inherently immune to any security risk',
      'Vendor review is only required for tools costing over a set amount',
    ], correctIndex: 0,
    explanation:
        'Vendor size has no bearing on the risk it may introduce — skipping review for "small" tools still leaves unmanaged data handling and security risk unassessed.',
  ),
  QuizQuestion(
    question:
        'An internal audit finds that a critical security policy exists on paper but is not actually followed by most employees in practice. What does this indicate?',
    options: [
      'The audit itself must be fundamentally flawed',
      'The policy should be deleted since nobody follows it',
      'No further action is needed since a policy document exists',
      'A gap between documented policy and actual operational practice',
    ], correctIndex: 3,
    explanation:
        'A policy that exists on paper but isn\'t followed in practice reveals a real gap between documentation and operations — one of the most common audit findings organizations face.',
  ),
  QuizQuestion(
    question:
        'A company wants to demonstrate to enterprise customers that its security controls are independently verified, without publishing sensitive internal details. Which document BEST serves this purpose?',
    options: [
      'A list of every employee\'s individual login credentials',
      'The company\'s complete internal network diagram',
      'The full source code of every internal application',
      'A SOC 2 report shared under a non-disclosure agreement',
    ], correctIndex: 3,
    explanation:
        'A SOC 2 report, shared under NDA with prospective customers, provides independently verified assurance of controls without exposing sensitive internal implementation details.',
  ),

  // From: Windows Security
  QuizQuestion(
    question:
        'A Windows administrator wants to enforce consistent security settings across hundreds of domain-joined workstations without configuring each one individually. Which tool BEST fits this need?',
    options: [
      'Manually editing the registry on each machine one at a time',
      'Asking each user to configure their own security settings',
      'Group Policy applied at the domain or organizational unit level',
      'A shared spreadsheet listing each machine\'s current settings',
    ], correctIndex: 2,
    explanation:
        'Group Policy applied at the domain or OU level lets administrators centrally enforce consistent settings across many machines, avoiding manual per-device configuration.',
  ),
  QuizQuestion(
    question:
        'A Windows event log shows repeated successful logons for an administrative account at 3 AM, a time the account owner says they were not working. What should be investigated FIRST?',
    options: [
      'Whether the antivirus license needs renewal',
      'Whether the account owner\'s job title needs updating',
      'Whether the account\'s credentials may have been compromised',
      'Whether the workstation needs a hardware upgrade',
    ], correctIndex: 2,
    explanation:
        'Unexplained administrative logons at unusual hours are a strong indicator of potential credential compromise and warrant immediate investigation.',
  ),

  // From: Linux Security
  QuizQuestion(
    question:
        'A Linux server allows root login directly over SSH with a password. A security review flags this immediately. What is the BEST remediation?',
    options: [
      'Only allow root login from a single specific IP address',
      'Disable root SSH login and require key-based sudo access instead',
      'Increase the root password length by a few characters',
      'Leave the configuration unchanged since root needs full access',
    ], correctIndex: 1,
    explanation:
        'Disabling direct root SSH login and requiring individual accounts with sudo access via SSH keys removes a high-value, easily-targeted attack surface.',
  ),
  QuizQuestion(
    question:
        'A Linux administrator wants to detect unauthorized changes to critical system binaries as early as possible. Which tool category BEST supports this?',
    options: [
      'A file integrity monitoring tool comparing files against a baseline',
      'A disk defragmentation utility',
      'A tool that only monitors network bandwidth usage',
      'A basic text editor with no monitoring capability',
    ], correctIndex: 0,
    explanation:
        'File integrity monitoring tools compare system files against a known-good cryptographic baseline, flagging unauthorized changes to critical binaries quickly.',
  ),

  // From: Email Security
  QuizQuestion(
    question:
        'An employee receives an email with a link to "verify your account" that, when hovered over, shows a URL completely unrelated to the company\'s actual domain. What should the employee do?',
    options: [
      'Forward the email to a personal account for later review',
      'Reply asking the sender to confirm the link is safe',
      'Click the link since the email subject looked official',
      'Avoid clicking the link and report the email as suspicious',
    ], correctIndex: 3,
    explanation:
        'A hover-revealed URL that does not match the claimed sender\'s domain is a classic phishing indicator; the safest action is to avoid clicking and report it.',
  ),
  QuizQuestion(
    question:
        'A company\'s email gateway blocks an increasing number of phishing attempts each month, yet successful compromises still occasionally occur. What does this MOST likely indicate?',
    options: [
      'Phishing is no longer a meaningful threat to the organization',
      'Technical filters alone cannot catch every attack; awareness still matters',
      'Employees should stop using email entirely to avoid all risk',
      'The email gateway must be completely non-functional',
    ], correctIndex: 1,
    explanation:
        'Even effective technical filtering cannot catch every attack, especially well-crafted BEC-style messages with no malicious payload — ongoing user awareness remains essential.',
  ),

  // From: Vulnerabilities and Threats
  QuizQuestion(
    question:
        'A vendor discloses a vulnerability in software your organization uses, along with a patch. Exploit code is not yet public. What is the MOST appropriate response timeline?',
    options: [
      'Wait until public exploit code appears before taking any action',
      'Delay patching indefinitely until the next major release',
      'Patch promptly using the organization\'s standard expedited process',
      'Ignore the disclosure since no exploit currently exists',
    ], correctIndex: 2,
    explanation:
        'Patching promptly, even before public exploit code appears, closes the window of opportunity — attackers often reverse-engineer patches to build exploits quickly.',
  ),
  QuizQuestion(
    question:
        'A vulnerability scan identifies an outdated software component embedded deep within a legacy application that cannot easily be updated. What is the MOST practical interim approach?',
    options: [
      'Ignore the finding since the application cannot be easily updated',
      'Disable all logging related to the vulnerable component',
      'Apply compensating controls like network isolation while planning remediation',
      'Immediately decommission the application with no transition plan',
    ], correctIndex: 2,
    explanation:
        'When immediate remediation isn\'t feasible, compensating controls like network isolation reduce risk while a longer-term remediation or replacement plan is developed.',
  ),

  // From: Alerts and Monitoring
  QuizQuestion(
    question:
        'A monitoring dashboard shows a metric spiking well beyond its established baseline, but no alert fired because the threshold was set too high. What does this reveal?',
    options: [
      'Spikes above baseline are never actually meaningful',
      'Thresholds should always be set as high as technically possible',
      'The monitoring system itself must be completely broken',
      'Alert thresholds need periodic review against actual baselines',
    ], correctIndex: 3,
    explanation:
        'A missed alert due to an overly high threshold shows that thresholds need periodic review and tuning against actual observed baselines, not a one-time setup.',
  ),
  QuizQuestion(
    question:
        'A company wants to detect insider threats by identifying unusual data access patterns, such as an employee suddenly downloading far more files than their normal behavior. Which capability BEST supports this?',
    options: [
      'A physical badge access log with no analysis',
      'A basic antivirus signature scanner',
      'User and Entity Behavior Analytics (UEBA)',
      'A firewall rule blocking all outbound traffic',
    ], correctIndex: 2,
    explanation:
        'UEBA is specifically designed to detect deviations from an individual\'s normal behavioral baseline, such as sudden unusual data access patterns.',
  ),

  // From: Cybersecurity Fundamentals
  QuizQuestion(
    question:
        'A company\'s security budget request is denied because leadership sees no immediate threat. What is the MOST effective way for the security team to make its case?',
    options: [
      'Threaten to resign if the budget is not approved',
      'Quantify potential financial impact using risk assessment data',
      'Repeat the same request without any new supporting evidence',
      'Wait silently for a breach to justify the request retroactively',
    ], correctIndex: 1,
    explanation:
        'Quantifying potential financial impact through risk assessment data speaks leadership\'s language and makes a far more persuasive case than repeating an unsupported request.',
  ),
  QuizQuestion(
    question:
        'An organization treats security as solely the IT department\'s responsibility, with no involvement from other business units. What risk does this create?',
    options: [
      'IT will always make perfectly optimal security decisions alone',
      'This approach guarantees faster incident response overall',
      'Other departments become completely immune to security risk',
      'Security decisions may not reflect actual business priorities',
    ], correctIndex: 3,
    explanation:
        'Security decisions made in isolation from the business risk being misaligned with actual organizational priorities and risk tolerance.',
  ),
  QuizQuestion(
    question:
        'A security awareness program measures success purely by the number of training modules completed, regardless of behavior change. What is the LIMITATION of this metric?',
    options: [
      'This metric is the single best measure available',
      'Completion rates have no relationship to training at all',
      'Behavior change is impossible to measure in any way',
      'Completion alone doesn\'t confirm behavior actually improved',
    ], correctIndex: 3,
    explanation:
        'Completion tracks participation, not outcomes — pairing it with behavioral metrics like phishing simulation results gives a truer picture of program effectiveness.',
  ),
  QuizQuestion(
    question:
        'A CISO wants to align the security program\'s priorities directly with the organization\'s top business objectives for the year. What should happen FIRST?',
    options: [
      'Set security priorities entirely independent of business objectives',
      'Copy another company\'s security roadmap without modification',
      'Wait for an incident to reveal what priorities should be',
      'Understand those business objectives before setting security priorities',
    ], correctIndex: 3,
    explanation:
        'Security priorities should be derived from understanding actual business objectives first, ensuring the program supports rather than works against the organization\'s goals.',
  ),

  // From: Threats, Attacks & Vulnerabilities
  QuizQuestion(
    question:
        'An organization\'s threat intelligence indicates a specific ransomware group has recently begun targeting its industry sector. What is the MOST appropriate response?',
    options: [
      'Review defenses against that group\'s known tactics and techniques',
      'Ignore the intelligence since no attack has happened yet',
      'Wait for a public breach report before taking any action',
      'Assume existing defenses are already sufficient with no review',
    ], correctIndex: 0,
    explanation:
        'Proactively reviewing defenses against a specific threat actor\'s known tactics, based on relevant threat intelligence, is far more effective than waiting for an actual attack.',
  ),
  QuizQuestion(
    question:
        'A penetration test report lists several findings, but the organization only has resources to fix a handful before the next test cycle. How should remediation be prioritized?',
    options: [
      'By actual exploitability and business impact, not just severity labels',
      'By whichever finding is easiest to fix regardless of risk',
      'By ignoring the report entirely until resources increase',
      'By the alphabetical order in which findings appear in the report',
    ], correctIndex: 0,
    explanation:
        'Prioritizing by real-world exploitability and business impact ensures limited remediation resources address the findings that matter most.',
  ),
  QuizQuestion(
    question:
        'A phishing simulation shows a 40% click rate among finance department employees, far higher than other departments. What should happen NEXT?',
    options: [
      'Provide targeted additional training for the finance department',
      'Ignore the discrepancy since department averages don\'t matter',
      'Punish every employee in finance regardless of individual results',
      'Conclude the finance department is simply less intelligent',
    ], correctIndex: 0,
    explanation:
        'A notably higher click rate in one department calls for targeted follow-up training addressing that group\'s specific gaps, not blanket punishment or dismissal.',
  ),

  // From: Network Security
  QuizQuestion(
    question:
        'A company wants guest Wi-Fi visitors to have Internet access without any ability to reach internal corporate systems. Which design BEST achieves this?',
    options: [
      'Giving guests the same credentials used by employees',
      'Disabling guest Wi-Fi\'s Internet access entirely',
      'Placing guest devices on the same network as internal servers',
      'A separate guest VLAN with no routing to the internal network',
    ], correctIndex: 3,
    explanation:
        'A separate guest VLAN with no routing path to internal systems provides Internet access to visitors while fully isolating them from corporate resources.',
  ),
  QuizQuestion(
    question:
        'Network logs show a large volume of traffic on port 4444, a port not associated with any approved application. What should be investigated FIRST?',
    options: [
      'Whether the port number is simply a typo in the logs',
      'Whether the traffic is likely just routine printer communication',
      'Whether this port is reserved for the company\'s email system',
      'Whether this traffic indicates a reverse shell or malware activity',
    ], correctIndex: 3,
    explanation:
        'Port 4444 is commonly associated with reverse shells and post-exploitation tools, making unexplained traffic on it worth immediate investigation.',
  ),
  QuizQuestion(
    question:
        'A company\'s network diagram has not been updated in three years, despite numerous changes since then. Why does this matter during incident response?',
    options: [
      'Outdated diagrams are always more accurate than current ones',
      'Network diagrams have no relevance to incident response at all',
      'An outdated diagram slows down understanding the actual attack path',
      'This only matters for regulatory paperwork, not real response',
    ], correctIndex: 2,
    explanation:
        'An accurate, current network diagram helps responders quickly understand how systems connect and where an attacker might move — an outdated one slows this down significantly.',
  ),

  // From: Identity Access Management
  QuizQuestion(
    question:
        'An organization wants to reduce the number of standing privileged accounts that exist at all times. Which approach BEST supports this goal?',
    options: [
      'Removing all logging on privileged account activity',
      'Creating additional permanent administrator accounts',
      'Sharing one privileged account among the entire team',
      'Just-in-Time access granted only when actually needed',
    ], correctIndex: 3,
    explanation:
        'Just-in-Time access grants elevated privileges only for the specific window needed, directly reducing the number of standing privileged accounts that exist continuously.',
  ),
  QuizQuestion(
    question:
        'A company wants to ensure no single employee can both approve and process a financial transaction alone. Which principle does this reflect?',
    options: [
      'Separation of duties',
      'Least privilege',
      'Non-repudiation',
      'Defense in depth',
    ], correctIndex: 0,
    explanation:
        'Requiring two different people to complete different steps of a sensitive process is the definition of separation of duties, reducing fraud and error risk.',
  ),
  QuizQuestion(
    question:
        'An employee\'s account shows successful logins from two different countries within minutes of each other. What is the MOST appropriate automated response?',
    options: [
      'Take no action since both logins technically succeeded',
      'Flag the session as high-risk and prompt for additional verification',
      'Permanently delete the account without any investigation',
      'Automatically grant the account additional privileges',
    ], correctIndex: 1,
    explanation:
        'Impossible-travel patterns should trigger a risk-based response like additional verification, rather than being ignored or resulting in an overly drastic action like deletion.',
  ),

  // From: Cryptography
  QuizQuestion(
    question:
        'A company wants to ensure that if one encryption key is ever compromised, it does not expose data encrypted under other, different keys. Which practice supports this?',
    options: [
      'Storing all encryption keys in one shared plaintext file',
      'Using unique encryption keys scoped to specific data sets',
      'Disabling encryption for data considered low-risk',
      'Reusing a single encryption key across every system',
    ], correctIndex: 1,
    explanation:
        'Using unique, scoped encryption keys limits the blast radius of any single key compromise, unlike reusing one key across every system.',
  ),
  QuizQuestion(
    question:
        'A legacy system still uses MD5 for verifying file integrity. A security review flags this as a weakness. What is the core concern?',
    options: [
      'MD5 is vulnerable to collision attacks, undermining integrity checks',
      'MD5 requires specialized hardware unavailable to most organizations',
      'MD5 only works with files smaller than one megabyte',
      'MD5 runs too slowly to be practical for modern systems',
    ], correctIndex: 0,
    explanation:
        'MD5\'s known vulnerability to collision attacks means two different files can produce the same hash, undermining its reliability for integrity verification.',
  ),
  QuizQuestion(
    question:
        'An organization\'s key management process has no defined process for rotating encryption keys periodically. What risk does this create over time?',
    options: [
      'Encrypted data automatically becomes unreadable after a year',
      'No meaningful risk exists as long as encryption is used at all',
      'Key rotation is only relevant for symmetric algorithms',
      'Extended exposure if a key is ever silently compromised',
    ], correctIndex: 3,
    explanation:
        'Without periodic rotation, a silently compromised key remains valid indefinitely, extending the window during which an attacker could exploit it undetected.',
  ),

  // From: Secure Protocols
  QuizQuestion(
    question:
        'A company\'s internal file transfer process still relies on unencrypted FTP between two servers on the same network segment. Why is this still considered a risk?',
    options: [
      'Unencrypted protocols only matter for Internet-facing traffic',
      'FTP is technically incapable of transferring files correctly',
      'Internal network segments are always completely immune to risk',
      'Internal traffic can still be intercepted by a compromised host',
    ], correctIndex: 3,
    explanation:
        'A compromised internal host can intercept unencrypted traffic just as easily as external traffic, which is why internal-only communication still deserves encryption.',
  ),
  QuizQuestion(
    question:
        'A network administrator wants remote administrative access to network devices to be encrypted rather than sent in plaintext. Which protocol should replace Telnet for this purpose?',
    options: [
      'HTTP',
      'FTP',
      'SSH',
      'SNMP version 1',
    ], correctIndex: 2,
    explanation:
        'SSH encrypts administrative sessions end-to-end, directly replacing Telnet\'s plaintext transmission of commands and credentials.',
  ),
  QuizQuestion(
    question:
        'A company wants to confirm a certificate presented during a TLS handshake has not been revoked before it expired. Which mechanism supports this check?',
    options: [
      'The domain\'s registration date',
      'The certificate\'s file size',
      'The color of the padlock icon alone',
      'Online Certificate Status Protocol (OCSP)',
    ], correctIndex: 3,
    explanation:
        'OCSP allows real-time verification of whether a certificate has been revoked before its natural expiration, closing a gap that expiration checks alone cannot cover.',
  ),

  // From: Endpoint Security
  QuizQuestion(
    question:
        'A company\'s endpoints have local administrator rights granted to every standard user account by default. What risk does this create?',
    options: [
      'Users become unable to run any approved application at all',
      'Malware executed by the user inherits elevated local privileges',
      'This setting has no meaningful impact on endpoint security',
      'Endpoints automatically become immune to malware infection',
    ], correctIndex: 1,
    explanation:
        'When standard users have local administrator rights, malware they inadvertently run also inherits those elevated privileges, increasing potential impact.',
  ),
  QuizQuestion(
    question:
        'A company wants to prevent unauthorized USB storage devices from being used to exfiltrate data from corporate laptops. Which control BEST addresses this?',
    options: [
      'Physically epoxying every USB port shut on all devices',
      'A sticker on the laptop warning against USB device use',
      'Device control policies restricting or blocking removable media',
      'Relying solely on antivirus software with no device policy',
    ], correctIndex: 2,
    explanation:
        'Device control policies enforced through endpoint management software can restrict or block removable media programmatically, without resorting to physically disabling ports.',
  ),

  // From: Cloud Security
  QuizQuestion(
    question:
        'A company migrating to the cloud wants to ensure its incident response plan still applies effectively in the new environment. What should happen BEFORE migration completes?',
    options: [
      'Wait until after a cloud incident occurs to update the plan',
      'Discard incident response planning since the cloud provider handles it',
      'Update the incident response plan to reflect cloud-specific considerations',
      'Assume the existing on-premises plan requires no changes at all',
    ], correctIndex: 2,
    explanation:
        'Cloud environments introduce different considerations (shared responsibility, provider APIs, ephemeral resources) requiring the incident response plan to be updated before migration completes.',
  ),
  QuizQuestion(
    question:
        'An organization\'s cloud environment has no automated alerting for newly created resources with overly permissive access. What is the MOST likely consequence over time?',
    options: [
      'No consequence exists as long as spending stays within budget',
      'The cloud provider will automatically detect and fix every issue',
      'Misconfigurations can persist undetected for extended periods',
      'This gap only matters for organizations using a single cloud region',
    ], correctIndex: 2,
    explanation:
        'Without automated alerting on risky new configurations, overly permissive resources can persist undetected for months, quietly expanding the attack surface.',
  ),

  // From: Governance, Risk & Compliance
  QuizQuestion(
    question:
        'A risk assessment identifies a risk that has already materialized once before and caused measurable financial loss. How should this influence the current risk rating?',
    options: [
      'Historical occurrence should inform a higher likelihood rating',
      'Historical data should be excluded from all future assessments',
      'Past incidents have no bearing on the current risk assessment',
      'The risk should automatically be rated as the lowest possible',
    ], correctIndex: 0,
    explanation:
        'A risk that has already materialized provides direct evidence supporting a higher likelihood rating going forward, rather than being treated as irrelevant history.',
  ),
  QuizQuestion(
    question:
        'A compliance team discovers that a required annual access review was never actually performed, despite being marked complete in tracking records. What does this represent?',
    options: [
      'Evidence that annual access reviews are unnecessary overall',
      'A finding that only affects the compliance team\'s workload',
      'A control failure combined with inaccurate compliance reporting',
      'A minor clerical issue with no real security implication',
    ], correctIndex: 2,
    explanation:
        'A review marked complete but never performed represents both a genuine control failure and inaccurate reporting — a combination that seriously undermines audit trust.',
  ),
  QuizQuestion(
    question:
        'An organization\'s data retention policy has no defined deletion timeline, resulting in years of accumulated, unused customer data. What risk does this create?',
    options: [
      'Full compliance with every applicable privacy regulation',
      'A larger pool of sensitive data exposed if a breach occurs',
      'No meaningful risk as long as the data is technically encrypted',
      'Improved system performance from having more historical data',
    ], correctIndex: 1,
    explanation:
        'Retaining data indefinitely with no deletion timeline expands the pool of sensitive information exposed in the event of a breach, beyond what business need actually requires.',
  ),

  // From: Cybersecurity Fundamentals
  QuizQuestion(
    question:
        'An organization experiences a near-miss where an attack was detected and stopped just before causing damage. How should this event BEST be treated?',
    options: [
      'As something to hide from leadership entirely',
      'As proof that no further security investment is needed',
      'As irrelevant, since no actual damage occurred',
      'As a valuable learning opportunity, reviewed like a real incident',
    ], correctIndex: 3,
    explanation:
        'Near-misses reveal real gaps that nearly caused harm and should be reviewed with the same rigor as an actual incident to prevent a future, less fortunate outcome.',
  ),
  QuizQuestion(
    question:
        'A company\'s security policy exists only as a printed document in a binder that no employee has read in years. What is the MOST direct problem this creates?',
    options: [
      'The binder itself poses a physical security risk',
      'This has no practical effect since policies are rarely enforced anyway',
      'Printed documents are inherently more secure than digital ones',
      'Policies employees don\'t know about can\'t shape their behavior',
    ], correctIndex: 3,
    explanation:
        'A policy nobody has read or internalized cannot meaningfully influence behavior — accessibility and active communication are as important as the policy\'s content itself.',
  ),

  // From: Threats, Attacks & Vulnerabilities
  QuizQuestion(
    question:
        'An organization notices a sharp increase in failed login attempts against a specific application immediately after that application was mentioned in a public conference talk. What is the MOST likely connection?',
    options: [
      'This pattern indicates the application needs a UI redesign',
      'The login failures must be caused by a software bug instead',
      'Increased public attention may have drawn opportunistic attackers',
      'Conference talks have no realistic connection to attack activity',
    ], correctIndex: 2,
    explanation:
        'Public attention, including conference mentions, can draw opportunistic attackers who investigate newly-publicized targets shortly afterward.',
  ),
  QuizQuestion(
    question:
        'A company\'s attack surface includes several forgotten subdomains still pointing to decommissioned services. What risk do these specifically create?',
    options: [
      'Automatic renewal of the company\'s domain registration',
      'No risk, since decommissioned services cannot be exploited',
      'Improved website loading speed for legitimate visitors',
      'Subdomain takeover by an attacker claiming the abandoned resource',
    ], correctIndex: 3,
    explanation:
        'Forgotten subdomains pointing to decommissioned cloud resources are a common vector for subdomain takeover, where an attacker claims the abandoned resource and serves malicious content.',
  ),

  // From: Network Security
  QuizQuestion(
    question:
        'A company\'s firewall rule set has grown to hundreds of rules over many years, with no regular review process. What risk does this create?',
    options: [
      'Firewall performance is entirely unaffected by rule set size',
      'Overly permissive or forgotten rules may create unintended exposure',
      'This has no bearing on the organization\'s actual attack surface',
      'More rules always guarantee stronger network security overall',
    ], correctIndex: 1,
    explanation:
        'Firewall rule sets that grow unreviewed over years tend to accumulate overly permissive or forgotten rules, creating unintended exposure that periodic review would catch.',
  ),
  QuizQuestion(
    question:
        'An organization wants to detect when an internal device begins scanning other internal systems, a behavior consistent with lateral movement. Which capability BEST supports this?',
    options: [
      'A physical security camera in the server room',
      'A firewall rule that only inspects inbound Internet traffic',
      'Internal network traffic monitoring with anomaly detection',
      'A password policy requiring quarterly password changes',
    ], correctIndex: 2,
    explanation:
        'Internal network monitoring tuned for anomalous behavior, like a device scanning others, can catch lateral movement that perimeter-only controls would miss entirely.',
  ),

  // From: Identity Access Management
  QuizQuestion(
    question:
        'A company grants every new employee identical access regardless of their specific role, then relies on the employee to request removal of anything unneeded. What is the core problem with this approach?',
    options: [
      'It ensures every employee is maximally productive from day one',
      'It inverts least privilege by defaulting to excessive access',
      'It is the industry-standard best practice for provisioning',
      'It has no meaningful downside since access can be requested later',
    ], correctIndex: 1,
    explanation:
        'Defaulting to broad access and relying on employees to request removal inverts least privilege — access should default to the minimum needed, then expand as justified.',
  ),
  QuizQuestion(
    question:
        'An organization\'s access review process asks managers to simply confirm a list of names without reviewing what specific access each person actually has. What limitation does this create?',
    options: [
      'This approach guarantees perfectly accurate access at all times',
      'This process fully satisfies any meaningful audit requirement',
      'Managers are always fully aware of every system permission',
      'The review may rubber-stamp excessive access without real scrutiny',
    ], correctIndex: 3,
    explanation:
        'A review that only confirms names, not actual granted permissions, risks becoming a rubber-stamp exercise that fails to catch genuinely excessive access.',
  ),

  // From: Cryptography
  QuizQuestion(
    question:
        'A company encrypts data at rest but transmits it between internal services without encryption, reasoning that the internal network is "trusted." What risk does this overlook?',
    options: [
      'An attacker who breaches the perimeter can then read traffic freely',
      'Encryption in transit only matters for Internet-facing traffic',
      'Internal networks are mathematically incapable of being compromised',
      'This approach fully satisfies the intent of defense in depth',
    ], correctIndex: 0,
    explanation:
        'Trusting the internal network alone assumes the perimeter will never be breached; once an attacker gets inside, unencrypted internal traffic becomes freely readable.',
  ),
  QuizQuestion(
    question:
        'A company wants new employees to understand why they should never paste production encryption keys into a chat application for convenience. What is the core risk being addressed?',
    options: [
      'This concern only applies to keys longer than 256 bits',
      'Chat platforms and their logs may not be adequately secured',
      'Pasting keys into chat has no bearing on their confidentiality',
      'Chat applications are technically unable to transmit text data',
    ], correctIndex: 1,
    explanation:
        'Chat platforms often retain message history and may not be designed to protect highly sensitive secrets, creating unnecessary exposure for production encryption keys.',
  ),

  // From: Secure Protocols
  QuizQuestion(
    question:
        'A company\'s internal DNS server accepts recursive queries from any device on the Internet, not just internal clients. What risk does this create?',
    options: [
      'This setting only affects the server\'s own internal performance',
      'This configuration improves DNS resolution speed for everyone',
      'Open recursive DNS servers pose no meaningful security risk',
      'The server could be abused in a DNS amplification attack',
    ], correctIndex: 3,
    explanation:
        'Open recursive DNS resolvers are commonly abused by attackers to amplify traffic in DDoS attacks against third parties, making restricting recursion to internal clients important.',
  ),
  QuizQuestion(
    question:
        'A remote access solution allows connections using outdated, deprecated VPN protocols alongside modern ones for backward compatibility. What is the associated risk?',
    options: [
      'This configuration has no bearing on the connection\'s actual security',
      'Attackers may deliberately force a downgrade to the weaker protocol',
      'Backward compatibility eliminates any need for protocol review',
      'Deprecated protocols always perform faster than modern alternatives',
    ], correctIndex: 1,
    explanation:
        'Allowing deprecated protocols alongside modern ones creates a downgrade risk, where an attacker forces the weaker, exploitable protocol to be used instead.',
  ),

  // From: Endpoint Security
  QuizQuestion(
    question:
        'A security team wants to know not just whether an endpoint is currently infected, but what happened in the minutes leading up to an alert. Which capability BEST supports this?',
    options: [
      'A spreadsheet manually updated by the help desk team',
      'A firewall log showing only blocked network connections',
      'EDR with detailed process and behavioral timeline recording',
      'A basic antivirus product with signature scanning only',
    ], correctIndex: 2,
    explanation:
        'EDR platforms record detailed process and behavioral timelines, letting analysts reconstruct exactly what happened leading up to an alert, not just the alert itself.',
  ),
  QuizQuestion(
    question:
        'A company\'s endpoint policy allows employees to disable antivirus temporarily "for troubleshooting" with no approval or logging. What risk does this create?',
    options: [
      'No risk exists as long as the employee re-enables it later',
      'Faster application performance with no meaningful downside',
      'This capability is required for all modern operating systems',
      'A window where malware could run completely undetected',
    ], correctIndex: 3,
    explanation:
        'Allowing antivirus to be disabled without approval or logging creates an unmonitored window where malware could execute and persist completely undetected.',
  ),

  // From: Identity Federation & SSO
  QuizQuestion(
    question:
        'A company federates with a partner organization\'s Identity Provider to allow cross-organization collaboration. What must the company continuously verify about this trust relationship?',
    options: [
      'That the partnership agreement includes a marketing clause',
      'Only that the partner\'s logo displays correctly on the login page',
      'Nothing further, since federation is a one-time setup',
      'That the partner\'s security posture remains acceptable over time',
    ], correctIndex: 3,
    explanation:
        'Federated trust extends an organization\'s security perimeter to include the partner\'s IdP, making it necessary to continuously verify the partner\'s security posture remains acceptable.',
  ),
  QuizQuestion(
    question:
        'An application accepts a long-lived API token with no expiration, used by an automated integration. What risk does the lack of expiration introduce?',
    options: [
      'Long-lived tokens are always more secure than short-lived ones',
      'Automated integrations are inherently immune to token leakage',
      'This setup has no meaningful security implication at all',
      'A leaked token remains valid indefinitely until manually revoked',
    ], correctIndex: 3,
    explanation:
        'A token with no expiration remains usable indefinitely if leaked, unlike a short-lived token that naturally limits the exposure window even after compromise.',
  ),

  // From: Application Security
  QuizQuestion(
    question:
        'A web application allows users to directly reference internal file paths through a URL parameter with no validation. What vulnerability class does this MOST likely enable?',
    options: [
      'Path traversal, allowing access to unauthorized files',
      'A Denial-of-Service condition from resource exhaustion',
      'DNS cache poisoning affecting the application\'s domain',
      'Cross-Site Scripting, targeting other users\' browsers',
    ], correctIndex: 0,
    explanation:
        'Unvalidated file path parameters are the classic setup for path traversal attacks, where an attacker manipulates the path to access files outside the intended directory.',
  ),
  QuizQuestion(
    question:
        'A development team hardcodes a database password directly into application source code, which is later pushed to a public repository. What is the MOST urgent remediation?',
    options: [
      'Make the repository private without changing the credential',
      'Wait to see if anyone actually uses the exposed credential',
      'Simply delete the latest commit and consider the issue resolved',
      'Rotate the exposed credential immediately and remove it from history',
    ], correctIndex: 3,
    explanation:
        'Once a credential is exposed publicly, it must be treated as compromised — rotating it immediately (and scrubbing it from history) is the only reliable remediation.',
  ),

  // From: Cloud Security
  QuizQuestion(
    question:
        'A company\'s cloud spending has grown significantly, and the security team suspects unused, forgotten resources may be part of the cause. What additional risk do these unused resources typically carry?',
    options: [
      'Automatic cost savings with no associated security trade-off',
      'No meaningful risk beyond the extra billing cost',
      'Guaranteed compliance with all applicable regulations',
      'Unpatched, unmonitored systems that expand the attack surface',
    ], correctIndex: 3,
    explanation:
        'Forgotten cloud resources are often unpatched and unmonitored, quietly expanding the attack surface well beyond just representing wasted spend.',
  ),
  QuizQuestion(
    question:
        'An organization\'s cloud identity roles grant broad "administrator" access to dozens of automated service accounts, none of which need most of those permissions. What should be done?',
    options: [
      'Remove all permissions entirely, breaking every automated process',
      'Scope each service account\'s permissions to only what it needs',
      'Leave the broad access in place since automation is trusted by default',
      'Grant even broader access to simplify future troubleshooting',
    ], correctIndex: 1,
    explanation:
        'Service accounts should follow least privilege just like human accounts — scoping permissions to only what automation genuinely needs reduces the impact of any single compromised credential.',
  ),

  // From: Security Operations
  QuizQuestion(
    question:
        'A SOC wants new analysts to ramp up quickly on how to investigate common alert types. Which resource BEST supports this goal?',
    options: [
      'Relying entirely on informal, undocumented tribal knowledge',
      'No documentation at all, learning purely through trial and error',
      'Documented playbooks for common alert and incident types',
      'A single company-wide meeting held once per year',
    ], correctIndex: 2,
    explanation:
        'Documented playbooks give new analysts a consistent, repeatable reference for investigating common alert types, dramatically shortening ramp-up time versus relying on tribal knowledge.',
  ),
  QuizQuestion(
    question:
        'A SOC manager notices that analysts consistently take much longer to triage alerts during night shifts compared to day shifts. What should be investigated FIRST?',
    options: [
      'Whether night shift staffing or tooling access differs meaningfully',
      'Whether the SIEM platform only functions during daytime hours',
      'Whether alerts generated at night are inherently less important',
      'Whether night shift analysts are simply less capable overall',
    ], correctIndex: 0,
    explanation:
        'Consistent performance gaps between shifts usually point to structural differences — staffing levels, tooling access, or escalation paths — rather than individual analyst capability.',
  ),

  // From: Incident Response
  QuizQuestion(
    question:
        'A company\'s incident response plan lists external contacts, but the phone numbers and emails have not been verified in over a year. Why does this matter during an actual incident?',
    options: [
      'This detail has no real bearing on incident response speed',
      'Outdated contact information could delay critical communications',
      'Contact information never actually changes once documented',
      'External contacts are never actually needed during a real incident',
    ], correctIndex: 1,
    explanation:
        'Outdated contact information for external partners like legal counsel, forensics firms, or regulators can cause critical delays exactly when speed matters most.',
  ),
  QuizQuestion(
    question:
        'During incident response, the team discovers evidence suggesting the attacker may still have active access to a different, currently unaffected system. What should happen NEXT?',
    options: [
      'Investigate and contain that system before considering the incident closed',
      'Close the incident since only the originally affected system matters',
      'Ignore the new evidence since it wasn\'t part of the initial scope',
      'Wait for a scheduled review meeting before taking any action',
    ], correctIndex: 0,
    explanation:
        'Evidence of potential ongoing access elsewhere must be investigated and contained before considering an incident resolved — closing prematurely risks leaving the attacker active.',
  ),

  // From: Governance, Risk & Compliance
  QuizQuestion(
    question:
        'A company operates in multiple countries with different data protection laws. How should its privacy program approach this complexity?',
    options: [
      'Apply only the laws of the country where headquarters is located',
      'Wait for a regulator to specify requirements after an investigation',
      'Ignore jurisdictional differences since privacy laws are all identical',
      'Map applicable requirements per jurisdiction and design accordingly',
    ], correctIndex: 3,
    explanation:
        'Operating across jurisdictions with different privacy laws requires mapping applicable requirements per region and designing the program to meet the most relevant, or most stringent, obligations.',
  ),
  QuizQuestion(
    question:
        'A company\'s board asks whether the organization is "secure enough." What is the MOST accurate and useful way to frame an answer?',
    options: [
      'With a simple yes or no answer and no further context',
      'By deferring the question entirely to the IT help desk',
      'By stating that no organization can ever be considered secure',
      'In terms of current risk levels relative to defined risk appetite',
    ], correctIndex: 3,
    explanation:
        'Framing security posture relative to a defined risk appetite gives the board a genuinely useful, actionable answer rather than an oversimplified yes or no.',
  ),

  // From: Malware
  QuizQuestion(
    question:
        'An organization\'s antivirus quarantines a file, but the same malware family reappears on the same machine days later. What does this MOST likely indicate?',
    options: [
      'A persistence mechanism the initial cleanup did not remove',
      'Malware reinfection is always random and unrelated to persistence',
      'The antivirus software must be completely non-functional',
      'The user simply reinstalled the same file voluntarily',
    ], correctIndex: 0,
    explanation:
        'Recurring infections of the same malware family after cleanup often point to an undiscovered persistence mechanism, such as a scheduled task or registry entry, that reinstalls it.',
  ),
  QuizQuestion(
    question:
        'A company\'s backup strategy stores backups on a network drive that is always connected and accessible from production systems. What risk does ransomware pose to this setup?',
    options: [
      'This configuration guarantees the fastest possible recovery',
      'Network-based backups cannot technically be reached by ransomware',
      'Ransomware could encrypt the backups along with production data',
      'Always-connected backups are immune to any form of malware',
    ], correctIndex: 2,
    explanation:
        'Backups that remain constantly connected and accessible are just as vulnerable to ransomware encryption as production data — offline or immutable backups avoid this risk.',
  ),

  // From: Social Engineering
  QuizQuestion(
    question:
        'An attacker calls an employee pretending to be a survey researcher, asking seemingly harmless questions about internal tools and processes. What is this technique called?',
    options: [
      'DNS spoofing, redirecting network traffic',
      'SQL Injection, manipulating a database query',
      'Ransomware, encrypting data until payment is made',
      'Pretexting, using a fabricated scenario to extract information',
    ], correctIndex: 3,
    explanation:
        'Using a fabricated, plausible cover story — like posing as a researcher — to extract seemingly harmless information is a classic pretexting technique.',
  ),

  // From: Vulnerabilities and Threats
  QuizQuestion(
    question:
        'A vulnerability scanner reports a finding that turns out, after investigation, to not actually exist on the target system. What is this type of result called?',
    options: [
      'A false negative',
      'A compensating control',
      'A zero-day vulnerability',
      'A false positive',
    ], correctIndex: 3,
    explanation:
        'A finding reported by a scanner that does not actually exist on investigation is a false positive, distinct from a false negative (a real issue the scanner misses entirely).',
  ),
  QuizQuestion(
    question:
        'A legacy system can no longer receive security patches because the vendor discontinued support years ago. What is the MOST appropriate interim strategy while planning replacement?',
    options: [
      'Isolate the system and closely monitor it for suspicious activity',
      'Ignore the risk since replacement is planned eventually',
      'Connect the system directly to the Internet for convenience',
      'Disable all logging on the unsupported system',
    ], correctIndex: 0,
    explanation:
        'Isolating an unsupported, unpatchable system and closely monitoring it reduces risk while a proper replacement is planned, rather than leaving it exposed or unmonitored.',
  ),

  // From: Alerts and Monitoring
  QuizQuestion(
    question:
        'A company\'s log retention policy keeps only seven days of logs due to storage cost concerns. Why might this be insufficient during a real investigation?',
    options: [
      'Some attacks go undetected for weeks before discovery',
      'Log retention length has no bearing on investigation quality',
      'Seven days is always more than enough for any investigation',
      'Attackers are only ever active during the most recent week',
    ], correctIndex: 0,
    explanation:
        'Many real-world breaches go undetected for weeks or months, meaning short retention windows can destroy the very logs needed to reconstruct what actually happened.',
  ),
  QuizQuestion(
    question:
        'A monitoring platform generates the same alert every day for a known, accepted risk that the business has formally chosen not to remediate. What should be done with this alert?',
    options: [
      'Leave it firing daily indefinitely with no change at all',
      'Disable the entire monitoring platform to stop the noise',
      'Delete all historical records of the alert ever existing',
      'Tune or suppress it with documentation of the accepted risk',
    ], correctIndex: 3,
    explanation:
        'A documented, formally accepted risk should have its alert tuned or suppressed with clear documentation, rather than left to generate daily noise that contributes to alert fatigue.',
  ),

  // From: Windows Security
  QuizQuestion(
    question:
        'A Windows domain has not enforced a minimum password length in years, and many accounts still use short, weak passwords. What is the MOST effective immediate improvement?',
    options: [
      'Only address the issue for accounts with administrator privileges',
      'Wait for users to voluntarily choose stronger passwords on their own',
      'Update the domain password policy and require MFA where possible',
      'Remove password requirements entirely to simplify support tickets',
    ], correctIndex: 2,
    explanation:
        'Updating the domain-wide password policy combined with MFA addresses the weakness systematically, rather than hoping users voluntarily improve their own password choices.',
  ),

  // From: Linux Security
  QuizQuestion(
    question:
        'A Linux server has several services running under the root account that don\'t actually require root privileges to function. What risk does this create?',
    options: [
      'Root-owned services are inherently immune to compromise',
      'This configuration has no bearing on the system\'s security',
      'Running services as root always improves system performance',
      'A compromise of any one service could grant full root access',
    ], correctIndex: 3,
    explanation:
        'Services running as root inherit full system privileges — compromising any one of them could give an attacker complete control, which dedicated service accounts would prevent.',
  ),

  // From: Email Security
  QuizQuestion(
    question:
        'A company\'s email system allows external senders to spoof internal domain addresses with no rejection. What DNS-based control would MOST directly help stop this?',
    options: [
      'Removing the domain\'s MX record from DNS',
      'Increasing the mailbox storage quota for all users',
      'Disabling the company\'s spam filter entirely',
      'A DMARC policy instructing receivers to reject failing messages',
    ], correctIndex: 3,
    explanation:
        'A properly configured DMARC policy tells receiving mail servers what to do with messages that fail SPF or DKIM checks, directly helping reject spoofed messages claiming the domain.',
  ),

  // From: Cloud Security
  QuizQuestion(
    question:
        'A company\'s cloud environment has multi-factor authentication enabled for the console, but API keys with equivalent access require no additional verification. What gap does this represent?',
    options: [
      'A configuration that only matters for very small organizations',
      'A bypass path around MFA through less-protected API credentials',
      'A fully closed security model with no meaningful gaps',
      'An improvement, since API keys are inherently more secure than MFA',
    ], correctIndex: 1,
    explanation:
        'If API keys grant equivalent access without the same verification as console logins, they become an unprotected bypass path around the MFA protecting the primary login method.',
  ),
];
