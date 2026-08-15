import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> secureProtocolsLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Secure Communication',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Every Interaction Involves Transmitting Data',
        body:
            'Modern organizations exchange enormous volumes of '
            'information every second. Employees access cloud '
            'applications, customers submit financial information '
            'through websites, administrators remotely manage servers, '
            'and Internet of Things (IoT) devices continuously '
            'communicate with cloud services. Every one of these '
            'interactions involves transmitting data across one or more '
            'networks.',
      ),
      LessonSection(
        heading: 'What Happens Without Protection',
        body:
            'If this communication is not adequately protected, '
            'attackers can intercept, modify, steal, or disrupt '
            'sensitive information. Secure communication ensures that '
            'information reaches its intended destination without being '
            'exposed to unauthorized individuals or altered during '
            'transmission. Organizations rely on secure communication '
            'protocols to safeguard sensitive information, protect user '
            'identities, maintain customer trust, and comply with '
            'regulatory requirements.',
        bullets: [
          'Accessing a banking website through HTTPS',
          'Connecting to a corporate VPN while working remotely',
          'Sending encrypted emails between departments',
          'Securely copying files using SFTP',
          'Administrators managing Linux servers through SSH',
          'Mobile applications communicating securely with cloud APIs',
        ],
      ),
      LessonSection(
        heading: 'Why Secure Communication Matters',
        body:
            'Data constantly moves between users, devices, '
            'applications, and cloud services. This movement is '
            'referred to as data in transit. Unlike data stored on a '
            'hard drive or database, data in transit travels through '
            'multiple network devices, Internet Service Providers '
            '(ISPs), routers, switches, wireless access points, and '
            'cloud infrastructure before reaching its destination. '
            'Every intermediate point presents a potential opportunity '
            'for attackers.',
      ),
      LessonSection(
        heading: 'Real-World Example: Online Banking',
        body:
            'Consider a user accessing an online banking portal. '
            'Without encryption, user credentials travel in plain text, '
            'attackers monitoring the network can capture usernames and '
            'passwords, banking transactions may be modified, and '
            'sensitive customer information can be stolen. With secure '
            'communication, credentials are encrypted, transactions are '
            'digitally protected, identity is verified, data integrity '
            'is maintained, and attackers cannot easily interpret '
            'intercepted traffic.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/intro_secure_communication.jpg',
          caption: 'Secure communication protects data as it travels across networks, preventing interception, modification, and theft by unauthorized parties.',
        ),
      ),
      LessonSection(
        heading: 'Data in Transit vs. Data at Rest',
        body:
            'Information exists in different states, and each state '
            'requires different security controls.',
      ),
      LessonSection(
        heading: 'Data in Transit',
        body: 'Data in transit refers to information actively moving between devices, applications, or networks.',
        bullets: [
          'Web browsing',
          'Email communication',
          'Video conferencing',
          'Online banking',
          'Cloud storage synchronization',
          'Remote desktop sessions',
          'VPN connections',
        ],
      ),
      LessonSection(
        heading: 'Data at Rest',
        body: 'Data at rest refers to information stored on a device or system.',
        bullets: ['Files stored on a hard drive', 'Database records', 'Backup archives'],
      ),
      LessonSection(
        heading: 'Examples: BitLocker, FileVault, Encrypted Databases',
        body:
            'Data at rest is typically protected using disk and '
            'database encryption technologies such as BitLocker and '
            'FileVault. While this chapter focuses specifically on data '
            'in transit, both states require dedicated security '
            'controls as part of a complete protection strategy.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Objectives of Communication',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Several Objectives, Working Together',
        body:
            'Secure communication is designed to achieve several '
            'important security objectives simultaneously — '
            'confidentiality, integrity, authentication, non-'
            'repudiation, and availability. Each addresses a different '
            'aspect of what "secure" actually means for data moving '
            'across a network.',
      ),
      LessonSection(
        heading: 'Confidentiality',
        body:
            'Confidentiality ensures that only authorized users can '
            'view information. If attackers intercept encrypted '
            'traffic, they should be unable to understand its contents. '
            'Encryption is the primary technology used to achieve '
            'confidentiality.',
        bullets: ['HTTPS encrypts web traffic', 'VPN tunnels encrypt remote connections', 'SSH encrypts remote administration sessions'],
      ),
      LessonSection(
        heading: 'Without Confidentiality',
        bullets: [
          'Passwords can be stolen',
          'Credit card information can be exposed',
          'Personal information can be leaked',
          'Intellectual property can be compromised',
        ],
      ),
      LessonSection(
        heading: 'Integrity',
        body:
            'Integrity ensures that information remains unchanged '
            'during transmission. If a message is modified while '
            'traveling across the network, the receiving system should '
            'detect the alteration. Integrity is commonly maintained '
            'using cryptographic hash functions, Message Authentication '
            'Codes (MACs), and digital signatures. For example, if an '
            'attacker changes a bank transfer amount from ₹10,000 to '
            '₹100,000 while it is in transit, integrity checks will '
            'detect the modification and reject the tampered message.',
      ),
      LessonSection(
        heading: 'Authentication',
        body:
            'Authentication verifies that the communicating parties are '
            'who they claim to be. Before exchanging sensitive '
            'information, both systems should confirm each other\'s '
            'identities.',
        bullets: ['Username and password', 'Multi-factor authentication (MFA)', 'Digital certificates', 'Smart cards', 'Biometric authentication', 'Hardware security keys'],
      ),
      LessonSection(
        heading: 'Non-Repudiation',
        body:
            'Non-repudiation ensures that a sender cannot deny having '
            'performed a particular action or sent a specific message. '
            'Digital signatures provide this capability by proving the '
            'origin and authenticity of electronic communications.',
        bullets: ['Digitally signed contracts', 'Secure email', 'Financial transactions', 'Electronic invoices'],
      ),
      LessonSection(
        heading: 'Availability',
        body:
            'Availability ensures that communication services remain '
            'accessible whenever authorized users need them. A secure '
            'communication system must not only protect data but also '
            'remain operational during failures or attacks.',
        bullets: ['Redundant network paths', 'High-availability firewalls', 'Load balancers', 'Backup Internet connections', 'Disaster recovery planning'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/security_objectives.jpg',
          caption: 'Secure communication is designed to achieve confidentiality, integrity, authentication, non-repudiation, and availability together.',
        ),
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Threats to Network Communication',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Why Attackers Target Communication Channels',
        body:
            'Attackers target communication channels because they '
            'often carry sensitive information such as credentials, '
            'financial transactions, customer records, and confidential '
            'business data. Understanding common threats helps security '
            'professionals select appropriate protocols and controls.',
      ),
      LessonSection(
        heading: 'Eavesdropping',
        body:
            'Eavesdropping occurs when an attacker secretly listens to '
            'network communications without modifying the data. Using '
            'encrypted communication protocols such as HTTPS, SSH, and '
            'VPNs makes intercepted traffic unreadable.',
        bullets: ['Usernames', 'Passwords', 'Emails', 'Financial transactions', 'Confidential documents'],
      ),
      LessonSection(
        heading: 'Man-in-the-Middle (MitM) Attack',
        body:
            'In a Man-in-the-Middle attack, the attacker positions '
            'themselves between two communicating parties. Instead of '
            'communicating directly, both parties unknowingly '
            'communicate through the attacker, who may intercept, '
            'modify, or inject data before forwarding it.',
        bullets: ['Rogue Wi-Fi hotspots', 'ARP spoofing on local networks', 'DNS spoofing', 'SSL stripping', 'Session hijacking'],
      ),
      LessonSection(
        heading: 'Defending Against MitM',
        body:
            'Strong encryption, certificate validation, and mutual '
            'authentication help mitigate MitM attacks — themes this '
            'chapter returns to repeatedly across TLS, SSH, email, and '
            'API security.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/common_threats.jpg',
          caption: 'Attackers target communication channels using techniques such as eavesdropping and Man-in-the-Middle attacks to intercept or manipulate sensitive data.',
        ),
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'TLS Fundamentals & the Evolution from SSL',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'The Most Widely Used Security Protocol on the Internet',
        body:
            'Transport Layer Security (TLS) is the most widely used '
            'protocol for securing communication over computer '
            'networks. It provides encryption, authentication, and '
            'integrity protection, ensuring that data exchanged between '
            'two systems remains confidential and unaltered during '
            'transmission. Every day, millions of users rely on TLS '
            'without realizing it — accessing a secure website, using '
            'online banking, signing in to a cloud application, sending '
            'secure emails, or connecting to many enterprise services.',
      ),
      LessonSection(
        heading: 'TLS Is the Successor to SSL',
        body:
            'TLS is the successor to Secure Sockets Layer (SSL). '
            'Although the term "SSL" is still commonly used in products '
            'and documentation, modern systems use TLS because SSL has '
            'known security vulnerabilities and is no longer considered '
            'secure.',
      ),
      LessonSection(
        heading: 'Why TLS Is Needed',
        body:
            'When data travels across the Internet, it passes through '
            'multiple devices before reaching its destination — home or '
            'corporate routers, wireless access points, ISPs, backbone '
            'routers, cloud network infrastructure, and firewalls or '
            'proxy servers. Without encryption, anyone with access to '
            'the communication path may be able to intercept sensitive '
            'information.',
        bullets: [
          'Theft of usernames and passwords',
          'Credit card information disclosure',
          'Session hijacking',
          'Data modification',
          'Identity theft',
          'Industrial espionage',
        ],
      ),
      LessonSection(
        heading: 'Security Services Provided by TLS',
        body:
            'TLS encrypts data before transmission so unauthorized '
            'parties cannot read intercepted information; ensures data '
            'is not modified while being transmitted; and verifies the '
            'identity of the server using a digital certificate issued '
            'by a trusted Certificate Authority (CA) before secure '
            'communication begins. Some enterprise environments also '
            'use mutual TLS (mTLS), where both the client and the '
            'server authenticate each other using digital certificates.',
      ),
      LessonSection(
        heading: 'Where TLS Is Used',
        bullets: [
          'Secure websites (HTTPS)',
          'Cloud applications',
          'Online banking',
          'E-commerce platforms',
          'Secure email protocols',
          'Virtual Private Networks (SSL VPNs)',
          'Web APIs',
          'Voice over IP (VoIP)',
          'Remote management portals',
        ],
      ),
      LessonSection(
        heading: 'The Evolution From SSL to TLS',
        body:
            'Before TLS, Secure Sockets Layer (SSL) was the standard '
            'protocol for securing Internet communications. Over time, '
            'security researchers discovered several weaknesses in SSL, '
            'making it vulnerable to attacks. As a result, SSL was '
            'replaced by TLS, which introduced stronger encryption '
            'methods, improved authentication, and better protection '
            'against known vulnerabilities. Today, SSL is considered '
            'obsolete, and organizations should use only supported '
            'versions of TLS.',
      ),
      LessonSection(
        heading: 'Evolution of Secure Communication Protocols',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Protocol', 'Status', 'Recommendation'],
          tableRows: [
            ['SSL 2.0', 'Obsolete', 'Do not use'],
            ['SSL 3.0', 'Obsolete', 'Do not use'],
            ['TLS 1.0', 'Deprecated', 'Avoid'],
            ['TLS 1.1', 'Deprecated', 'Avoid'],
            ['TLS 1.2', 'Secure', 'Widely supported'],
            ['TLS 1.3', 'Recommended', 'Preferred for new deployments'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Benefits of TLS 1.3',
        bullets: [
          'Faster connection establishment with fewer message exchanges',
          'Removal of outdated and insecure cryptographic algorithms',
          'Improved protection against downgrade attacks',
          'Mandatory use of modern encryption techniques',
          'Better performance for web and cloud applications',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'How TLS Works: The Handshake, Cipher Suites & PFS',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'The TLS Handshake',
        body:
            'When a client connects to a secure server, the two '
            'systems must first establish a secure communication '
            'channel before exchanging sensitive data. This initial '
            'negotiation is known as the TLS handshake. The handshake '
            'determines the TLS version to use, selects compatible '
            'encryption algorithms, verifies the server\'s identity, '
            'establishes shared encryption keys, and begins encrypted '
            'communication. Only after these steps are completed does '
            'the client transmit sensitive information such as login '
            'credentials or payment details.',
      ),
      LessonSection(
        heading: 'Step 1: Client Initiates Connection',
        body: 'The client sends a request to establish a secure connection, including:',
        bullets: ['Supported TLS versions', 'Supported encryption algorithms (cipher suites)', 'A randomly generated value used later in key generation'],
      ),
      LessonSection(
        heading: 'Step 2: Server Responds',
        body: 'The server replies with:',
        bullets: ['Selected TLS version', 'Selected cipher suite', 'Server digital certificate', 'Another random value'],
      ),
      LessonSection(
        heading: 'Step 3: Certificate Validation',
        body: 'The client examines the server\'s certificate and performs several checks:',
        bullets: [
          'Is the certificate issued by a trusted Certificate Authority?',
          'Has the certificate expired?',
          'Does the certificate match the website\'s domain name?',
          'Has the certificate been revoked?',
        ],
      ),
      LessonSection(
        heading: 'Step 4: Key Exchange',
        body:
            'Once the certificate is validated, the client and server '
            'securely establish shared cryptographic keys. These keys '
            'are used for symmetric encryption during the remainder of '
            'the session because symmetric encryption is significantly '
            'faster than asymmetric encryption.',
      ),
      LessonSection(
        heading: 'Step 5: Secure Communication Begins',
        body:
            'After the handshake is complete, all subsequent '
            'application data is encrypted using the negotiated session '
            'keys, protecting the confidentiality and integrity of the '
            'communication.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/how_tls_works.jpg',
          caption: 'The TLS handshake establishes a secure, encrypted communication channel before any sensitive application data is exchanged.',
        ),
      ),
      LessonSection(
        heading: 'Cipher Suites',
        body:
            'A cipher suite is a predefined set of cryptographic '
            'algorithms that TLS uses to secure communication, '
            'typically specifying a key exchange algorithm, an '
            'authentication method, a symmetric encryption algorithm, '
            'and an integrity protection algorithm. During the TLS '
            'handshake, the client proposes a list of supported cipher '
            'suites, and the server selects one that both parties '
            'support. Modern systems prioritize strong algorithms such '
            'as AES-GCM and ChaCha20-Poly1305 while avoiding deprecated '
            'algorithms.',
      ),
      LessonSection(
        heading: 'Session Keys',
        body:
            'Although TLS uses asymmetric cryptography during the '
            'handshake, the actual data transfer uses symmetric session '
            'keys. This hybrid approach offers the best of both worlds '
            '— strong authentication and secure key exchange using '
            'asymmetric cryptography, combined with high-speed '
            'encryption for ongoing communication using symmetric '
            'cryptography. Each TLS session generates unique session '
            'keys, reducing the impact of key compromise and improving '
            'overall security.',
      ),
      LessonSection(
        heading: 'Perfect Forward Secrecy (PFS)',
        body:
            'Perfect Forward Secrecy is a security feature that ensures '
            'the compromise of one session\'s encryption keys does not '
            'expose data from previous or future sessions. With PFS, '
            'each connection uses a unique session key, session keys '
            'are discarded when the session ends, and long-term private '
            'keys are not directly used to encrypt application data. As '
            'a result, even if an attacker later obtains a server\'s '
            'private key, previously captured encrypted sessions remain '
            'protected. Perfect Forward Secrecy is enabled by default '
            'in most modern TLS 1.3 implementations and is considered a '
            'best practice for securing sensitive communications.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/perfect_forward_secrecy.jpg',
          caption: 'Perfect Forward Secrecy ensures that compromising one session\'s keys does not expose data exchanged during other sessions.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Deploying TLS',
        bullets: [
          'Use TLS 1.3 whenever supported',
          'Support TLS 1.2 for compatibility with modern systems',
          'Disable SSL 2.0, SSL 3.0, TLS 1.0, and TLS 1.1',
          'Use certificates issued by trusted Certificate Authorities',
          'Replace expired or weak certificates promptly',
          'Use strong cipher suites and disable deprecated algorithms',
          'Enable Perfect Forward Secrecy',
          'Regularly monitor and test TLS configurations using security assessment tools',
          'Keep web servers and applications updated to address newly discovered vulnerabilities',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'HTTPS & Digital Certificates',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'What Is HTTP?',
        body:
            'HTTP is an application-layer protocol used by web browsers '
            'and web servers to exchange information. When a user '
            'enters a website address into a browser, HTTP defines how '
            'requests are sent and how web servers respond with web '
            'pages, images, videos, and other content. Although HTTP is '
            'simple and efficient, it has one major weakness — it '
            'transmits data in plaintext. Anyone monitoring the network '
            'can potentially read or modify the transmitted '
            'information.',
      ),
      LessonSection(
        heading: 'Limitations of HTTP',
        bullets: ['Password theft', 'Session hijacking', 'Man-in-the-Middle (MitM) attacks', 'Credential interception', 'Data tampering', 'Identity impersonation'],
      ),
      LessonSection(
        heading: 'What Is HTTPS?',
        body:
            'HTTPS solves these problems by encrypting HTTP '
            'communication using TLS. Instead of transmitting '
            'information in plaintext, HTTPS encrypts every request and '
            'response exchanged between the browser and the web server '
            '— ensuring sensitive information remains confidential, the '
            'server\'s identity is verified, and data cannot be modified '
            'without detection.',
        bullets: [
          'The https:// prefix in the address bar',
          'A padlock icon displayed by most web browsers',
          'A valid digital certificate issued by a trusted Certificate Authority (CA)',
        ],
      ),
      LessonSection(
        heading: 'HTTP vs. HTTPS',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'HTTP', 'HTTPS'],
          tableRows: [
            ['Encryption', 'No', 'Yes (TLS)'],
            ['Authentication', 'No', 'Server authentication using certificates'],
            ['Data Integrity', 'No', 'Yes'],
            ['Default Port', '80', '443'],
            ['Suitable for Sensitive Data', 'No', 'Yes'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Digital Certificates',
        body:
            'Before sending sensitive information, a web browser must '
            'verify that it is communicating with the intended website '
            'rather than an attacker. This verification is performed '
            'using a digital certificate — an electronic document that '
            'binds a public key to the identity of an organization, '
            'individual, or server. Certificates are issued and '
            'digitally signed by trusted Certificate Authorities (CAs). '
            'When a browser connects to an HTTPS website, it receives '
            'the server\'s certificate and validates it before '
            'establishing an encrypted session.',
      ),
      LessonSection(
        heading: 'Information Contained in a Certificate',
        bullets: [
          'Subject (organization or domain name)',
          'Public key',
          'Issuing Certificate Authority',
          'Certificate serial number',
          'Validity period',
          'Digital signature of the issuing CA',
          'Signature algorithm',
          'Certificate version',
        ],
      ),
      LessonSection(
        heading: 'Why Certificates Are Important',
        body:
            'Without certificates, attackers could create fake '
            'websites, users would have no reliable way to verify a '
            'website\'s identity, and sensitive information could be '
            'stolen through phishing or Man-in-the-Middle attacks. '
            'Certificates establish trust between users and web '
            'servers.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/digital_certificates.jpg',
          caption: 'A digital certificate binds a public key to a verified identity, allowing browsers to trust that they are communicating with the intended server.',
        ),
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Certificate Validation, Errors & HSTS',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Browser Certificate Validation',
        body:
            'When a browser receives a server\'s certificate, it '
            'performs several validation checks before establishing a '
            'secure connection. These checks help ensure that the '
            'server is legitimate and that the communication can be '
            'trusted.',
      ),
      LessonSection(
        heading: 'Domain Name Verification',
        body:
            'The browser confirms that the domain name entered by the '
            'user matches the domain listed in the certificate. For '
            'example, if a user visits https://www.example.com, the '
            'certificate must also be issued for www.example.com — if '
            'the names do not match, the browser displays a certificate '
            'warning.',
      ),
      LessonSection(
        heading: 'Certificate Expiration',
        body:
            'Every certificate has a limited validity period. The '
            'browser checks whether the certificate has not expired and '
            'is currently valid. Expired certificates may indicate poor '
            'security management or increase the risk of misuse.',
      ),
      LessonSection(
        heading: 'Trusted Certificate Authority',
        body:
            'Browsers maintain a list of trusted Certificate '
            'Authorities. If the certificate is issued by one of these '
            'trusted CAs — or chains back to one — the browser accepts '
            'it. If the issuing CA is unknown or untrusted, the browser '
            'warns the user before continuing.',
      ),
      LessonSection(
        heading: 'Certificate Revocation',
        body:
            'Sometimes a certificate becomes untrustworthy before its '
            'expiration date, due to private key compromise, a '
            'certificate issued in error, organization ownership '
            'changes, or security incidents. Browsers may check whether '
            'the certificate has been revoked using mechanisms such as '
            'Certificate Revocation Lists (CRLs) or the Online '
            'Certificate Status Protocol (OCSP). If a certificate has '
            'been revoked, the browser should not establish a secure '
            'connection.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/hsts_1.jpg',
          caption: 'Certificates establish trust between users and web servers by binding a verified identity to a public key.',
        ),
      ),
      LessonSection(
        heading: 'Common Certificate Errors',
        body: 'Users occasionally encounter certificate warnings while browsing the Internet.',
        bullets: [
          'Expired Certificate — the website owner has not renewed the certificate',
          'Domain Mismatch — the website address does not match the domain specified in the certificate',
          'Untrusted Certificate Authority — the browser does not recognize the issuing CA (common with self-signed certificates)',
          'Revoked Certificate — should never be trusted, as it may have been compromised',
        ],
      ),
      LessonSection(
        heading: 'Common Certificate Errors, Causes & Actions',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Certificate Error', 'Possible Cause', 'Recommended Action'],
          tableRows: [
            ['Expired Certificate', 'Certificate validity period ended', 'Renew the certificate'],
            ['Domain Mismatch', 'Certificate does not match the website address', 'Verify the URL and server configuration'],
            ['Untrusted CA', 'Certificate issued by an unknown CA', 'Use a trusted Certificate Authority'],
            ['Revoked Certificate', 'Certificate compromised or withdrawn', 'Replace the certificate immediately'],
          ],
        ),
      ),
      LessonSection(
        heading: 'HTTP Strict Transport Security (HSTS)',
        body:
            'HTTP Strict Transport Security (HSTS) is a web security '
            'mechanism that instructs browsers to communicate with a '
            'website only over HTTPS. When a browser receives an HSTS '
            'policy from a website, it remembers that policy for a '
            'specified period. On future visits, the browser '
            'automatically uses HTTPS, even if the user types '
            'http://example.com — the browser internally converts the '
            'request to https://example.com. This helps protect users '
            'from downgrade attacks and accidental use of insecure HTTP '
            'connections.',
      ),
      LessonSection(
        heading: 'Benefits of HSTS',
        bullets: ['Enforce encrypted communication', 'Reduce the risk of SSL stripping attacks', 'Prevent accidental HTTP connections', 'Improve overall website security'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/hsts_2.jpg',
          caption: 'HSTS instructs browsers to communicate with a website exclusively over HTTPS, preventing downgrade to unencrypted HTTP.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Secure Web Communication',
        bullets: [
          'Use HTTPS for all public-facing websites',
          'Disable insecure protocols such as SSL, TLS 1.0, and TLS 1.1',
          'Obtain certificates from trusted Certificate Authorities',
          'Renew certificates before they expire',
          'Enable HSTS to enforce HTTPS',
          'Use strong cipher suites and modern TLS versions',
          'Monitor certificate expiration and revocation status',
          'Regularly test web servers for configuration weaknesses',
          'Educate users to verify website URLs and certificate warnings',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Secure Shell (SSH) Fundamentals',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'The Industry Standard for Remote Administration',
        body:
            'Secure Shell (SSH) is a cryptographic network protocol '
            'used to securely access and manage remote computers over a '
            'network. It provides encrypted communication between a '
            'client and a remote server, protecting sensitive '
            'information such as usernames, passwords, commands, and '
            'transferred files. SSH is the industry standard for remote '
            'administration of Linux, UNIX, network devices, cloud '
            'servers, and many enterprise systems. It replaces older '
            'protocols such as Telnet, which transmit data in plaintext.',
      ),
      LessonSection(
        heading: 'Why SSH Is Important',
        body:
            'System administrators frequently need to manage devices '
            'located in different offices, data centers, or cloud '
            'environments. Without encryption, administrative '
            'credentials and commands could be captured by attackers '
            'monitoring the network.',
        bullets: ['Encrypted communication', 'Secure user authentication', 'Data integrity verification', 'Protection against eavesdropping', 'Secure file transfer capabilities'],
      ),
      LessonSection(
        heading: 'Common Uses of SSH',
        bullets: [
          'Remote server administration',
          'Network device configuration',
          'Cloud infrastructure management',
          'Secure command execution',
          'File transfers',
          'Automation scripts',
          'Secure backups',
          'DevOps deployments',
        ],
      ),
      LessonSection(
        heading: 'How SSH Works',
        body:
            'Before exchanging data, the SSH client and server '
            'establish a secure encrypted session through a defined '
            'workflow.',
      ),
      LessonSection(
        heading: 'Step 1: Client Initiates Connection',
        body: 'The administrator launches an SSH client and connects to the remote server using its hostname or IP address, for example: ssh admin@192.168.1.20',
      ),
      LessonSection(
        heading: 'Step 2: Server Identification',
        body:
            'The server presents its public host key. The SSH client '
            'compares this key with previously stored information. If '
            'this is the first connection, the client asks the '
            'administrator whether the server should be trusted. For '
            'future connections, the client verifies that the host key '
            'has not changed — if it unexpectedly changes, this may '
            'indicate server reinstallation, administrative changes, or '
            'a possible Man-in-the-Middle attack.',
      ),
      LessonSection(
        heading: 'Step 3: User Authentication',
        body: 'After verifying the server\'s identity, the administrator authenticates using one of several methods:',
        bullets: ['Username and password', 'Public key authentication', 'Smart cards', 'Multi-factor authentication (MFA)'],
      ),
      LessonSection(
        heading: 'Step 4: Secure Session Established',
        body: 'Once authentication succeeds, commands are encrypted, responses are encrypted, files transferred through SSH are encrypted, and session integrity is continuously protected.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/how_ssh_works.jpg',
          caption: 'SSH establishes a secure, encrypted session between a client and server, protecting credentials, commands, and file transfers.',
        ),
      ),
      LessonSection(
        heading: 'Telnet vs. SSH',
        body:
            'Before SSH became widely available, administrators '
            'commonly used Telnet for remote administration. Although '
            'Telnet provides remote terminal access, it offers no '
            'encryption, making it unsuitable for modern enterprise '
            'networks. Every command, username, and password '
            'transmitted through Telnet can potentially be intercepted '
            'by attackers. SSH addresses this weakness by encrypting '
            'all communication.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Telnet', 'SSH'],
          tableRows: [
            ['Encryption', 'No', 'Yes'],
            ['Authentication', 'Basic', 'Strong authentication'],
            ['Default Port', '23', '22'],
            ['Data Protection', 'None', 'Encrypted'],
            ['Suitable for Internet Use', 'No', 'Yes'],
            ['Enterprise Recommendation', 'Avoid', 'Recommended'],
          ],
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/telnet_vs_ssh.jpg',
          caption: 'Modern organizations should disable Telnet whenever possible and replace it with SSH for all remote administration.',
        ),
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'SSH Authentication, File Transfer & Tunneling',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Password Authentication',
        body:
            'The administrator enters a username and password. This is '
            'easy to configure and familiar to users, but it is '
            'vulnerable to brute-force attacks, password reuse, '
            'credential theft, and phishing attacks. Organizations '
            'often restrict password-based SSH access on Internet-'
            'facing systems.',
      ),
      LessonSection(
        heading: 'Public Key Authentication',
        body:
            'Public key authentication is the preferred method for '
            'enterprise environments. It uses a public-private key pair '
            'instead of passwords — the administrator generates a '
            'public key stored on the remote server and a private key '
            'that remains securely stored on the administrator\'s '
            'device. During authentication, the server verifies '
            'ownership of the private key, and the administrator proves '
            'possession without transmitting the private key itself. '
            'Since the private key never leaves the client device, this '
            'method provides stronger security than passwords.',
        bullets: ['Strong security', 'Resistant to brute-force attacks', 'Supports automation', 'No password transmission', 'Ideal for cloud environments'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/ssh_authentication_methods.jpg',
          caption: 'Public key authentication provides stronger security than passwords because the private key never leaves the administrator\'s device.',
        ),
      ),
      LessonSection(
        heading: 'Secure File Transfer Using SSH',
        body: 'SSH is not limited to remote command execution. It also supports secure file transfers through additional protocols.',
      ),
      LessonSection(
        heading: 'Secure File Transfer Protocol (SFTP)',
        body:
            'SFTP uses the SSH protocol to securely transfer files, '
            'supporting file uploads, downloads, directory browsing, '
            'file permissions, and encryption during transfer. Unlike '
            'FTP, SFTP encrypts both authentication information and '
            'transferred files.',
      ),
      LessonSection(
        heading: 'Secure Copy Protocol (SCP)',
        body:
            'SCP is another protocol based on SSH, commonly used for '
            'copying files, transferring configuration files, system '
            'backups, and software deployments. Although SCP is simpler '
            'than SFTP, both provide encrypted communication.',
      ),
      LessonSection(
        heading: 'FTP vs. SFTP vs. SCP',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'FTP', 'SFTP', 'SCP'],
          tableRows: [
            ['Encryption', 'No', 'Yes', 'Yes'],
            ['Authentication', 'Username/Password', 'SSH Authentication', 'SSH Authentication'],
            ['Directory Browsing', 'Yes', 'Yes', 'Limited'],
            ['Suitable for Sensitive Data', 'No', 'Yes', 'Yes'],
          ],
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/secure_file_transfer_ssh.jpg',
          caption: 'Organizations should use SFTP or SCP instead of FTP whenever confidential information is being transferred.',
        ),
      ),
      LessonSection(
        heading: 'SSH Tunneling',
        body:
            'SSH tunneling allows encrypted communication to pass '
            'securely through an SSH connection. Instead of sending '
            'application traffic directly across the network, SSH '
            'creates an encrypted tunnel between two systems. '
            'Applications that normally do not support encryption can '
            'securely transmit data through this tunnel.',
        bullets: ['Secure database administration', 'Accessing internal web applications', 'Secure management interfaces', 'Remote development environments'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/ssh_tunneling.jpg',
          caption: 'SSH tunneling is widely used by administrators to securely access internal resources over untrusted networks.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for SSH',
        bullets: [
          'Disable Telnet and use SSH for all remote administration',
          'Prefer public key authentication over passwords',
          'Disable direct root or administrator login where possible',
          'Enforce Multi-Factor Authentication (MFA) for privileged access',
          'Use strong cryptographic algorithms and modern SSH versions',
          'Rotate SSH keys periodically',
          'Remove unused or expired public keys from servers',
          'Restrict SSH access using firewalls or network segmentation',
          'Monitor SSH logs for failed login attempts and unusual activity',
          'Disable unused SSH services and features',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/ssh_best_practices.jpg',
          caption: 'A layered set of SSH best practices reduces the risk of unauthorized remote access to enterprise systems.',
        ),
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Secure Email Protocols',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'One of the Most Common Attack Targets',
        body:
            'Email is one of the most important communication methods '
            'used by organizations. Employees exchange business '
            'documents, financial reports, customer information, '
            'contracts, invoices, and confidential data through email '
            'every day. Unfortunately, email is also one of the most '
            'common targets for cyberattacks. Attackers use phishing, '
            'malware, ransomware, Business Email Compromise (BEC), and '
            'spoofing attacks to exploit email systems.',
      ),
      LessonSection(
        heading: 'Why Secure Email Communication Is Important',
        body:
            'An email message typically travels through multiple mail '
            'servers before reaching the recipient. If the '
            'communication is not protected, attackers may intercept '
            'email messages, capture usernames and passwords, read '
            'confidential business information, modify message '
            'contents, impersonate legitimate users, or deliver '
            'malicious attachments or links.',
      ),
      LessonSection(
        heading: 'Email Communication Process',
        body:
            'Understanding how email travels helps explain why secure '
            'protocols are necessary. A typical email follows these '
            'steps: the sender composes an email using an email client; '
            'the email client sends the message to an outgoing mail '
            'server; the outgoing mail server identifies the '
            'recipient\'s mail server using DNS records; the message is '
            'delivered across the Internet; the recipient\'s mail server '
            'stores the email; and the recipient retrieves the email '
            'using an email client. Unlike instant messaging, email is '
            'a store-and-forward service — messages are temporarily '
            'stored on mail servers before being delivered to the '
            'recipient.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/email_communication_process.jpg',
          caption: 'Email is a store-and-forward service — messages pass through and are temporarily stored on mail servers before reaching the recipient.',
        ),
      ),
      LessonSection(
        heading: 'Simple Mail Transfer Protocol (SMTP)',
        body:
            'SMTP is the standard protocol used to send email messages. '
            'Whenever a user clicks Send, the email client uses SMTP to '
            'transmit the message to the outgoing mail server. SMTP is '
            'also responsible for forwarding email between mail servers '
            'until it reaches the recipient\'s mail server. SMTP is '
            'designed only for sending email — it does not retrieve '
            'messages from a mailbox.',
      ),
      LessonSection(
        heading: 'SMTP Default Ports',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Port', 'Purpose'],
          tableRows: [
            ['25', 'Mail server to mail server communication'],
            ['587', 'Secure email submission using STARTTLS'],
            ['465', 'SMTP over TLS (SMTPS)'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Post Office Protocol Version 3 (POP3)',
        body:
            'POP3 is used to retrieve email messages from a mail '
            'server. With POP3, messages are usually downloaded from '
            'the server to the user\'s device, and depending on the '
            'email client\'s configuration, the downloaded messages may '
            'be removed from the server after retrieval. POP3 is '
            'suitable for users who primarily access email from a '
            'single device. Standard POP3 uses port 110; secure POP3 '
            '(POP3S) uses port 995.',
      ),
      LessonSection(
        heading: 'Internet Message Access Protocol (IMAP)',
        body:
            'IMAP allows users to access and manage email while keeping '
            'messages stored on the mail server. Instead of downloading '
            'and removing messages, IMAP synchronizes the mailbox '
            'across multiple devices, letting users read an email on '
            'one device and continue working with the same message on '
            'another. Standard IMAP uses port 143; secure IMAP (IMAPS) '
            'uses port 993.',
      ),
      LessonSection(
        heading: 'Comparison of SMTP, POP3, and IMAP',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'SMTP', 'POP3', 'IMAP'],
          tableRows: [
            ['Primary Function', 'Send email', 'Retrieve email', 'Access and synchronize email'],
            ['Direction', 'Outgoing', 'Incoming', 'Incoming'],
            ['Stores Messages on Server', 'No', 'Usually No', 'Yes'],
            ['Supports Multiple Devices', 'No', 'Limited', 'Yes'],
            ['Typical Use', 'Sending messages', 'Single-device access', 'Multi-device access'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Secure Versions of Email Protocols',
        body:
            'The original versions of SMTP, POP3, and IMAP transmit '
            'information without encryption. This exposes email '
            'credentials and message contents to interception if used '
            'over untrusted networks. Secure versions of these '
            'protocols use TLS to encrypt communication — SMTP becomes '
            'SMTPS or SMTP with STARTTLS (port 465 or 587), POP3 becomes '
            'POP3S (port 995), and IMAP becomes IMAPS (port 993). By '
            'encrypting communication, these secure protocols help '
            'protect usernames and passwords, email message contents, '
            'attachments, and authentication information.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/secure_email_protocols.jpg',
          caption: 'Secure versions of SMTP, POP3, and IMAP use TLS to protect email credentials and message contents from interception.',
        ),
      ),
      LessonSection(
        heading: 'STARTTLS',
        body:
            'STARTTLS is a protocol extension that upgrades an existing '
            'plaintext email connection to an encrypted TLS connection. '
            'Instead of creating a separate secure connection from the '
            'beginning, the client first establishes a normal '
            'connection and then requests encryption using the '
            'STARTTLS command. If both the client and server support '
            'STARTTLS, the session switches to an encrypted TLS channel '
            'before authentication credentials or email data are '
            'transmitted. This approach allows organizations to add '
            'encryption while maintaining compatibility with existing '
            'email infrastructure.',
        bullets: [
          'Encrypts email communication without requiring separate protocols',
          'Protects usernames and passwords during authentication',
          'Supports secure communication between modern mail servers',
          'Widely supported by enterprise email systems',
          'Helps organizations meet security and compliance requirements',
        ],
      ),
      LessonSection(
        heading: 'A Note on STARTTLS Configuration',
        body:
            'Although STARTTLS improves security, it should be '
            'configured correctly to prevent downgrade attacks that '
            'attempt to force communication back to an unencrypted '
            'state.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/starttls.jpg',
          caption: 'STARTTLS upgrades an existing plaintext email connection to an encrypted TLS channel before sensitive data is transmitted.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Secure Email Protocols',
        bullets: [
          'Use SMTPS or SMTP with STARTTLS for sending email',
          'Use POP3S or IMAPS instead of unsecured POP3 or IMAP',
          'Disable unencrypted email protocols whenever possible',
          'Enforce strong authentication and Multi-Factor Authentication (MFA) for email accounts',
          'Use modern TLS versions for all email communications',
          'Monitor mail servers for unauthorized access attempts',
          'Regularly update email servers and clients to address newly discovered vulnerabilities',
        ],
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Email Encryption: S/MIME & PGP',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Why Channel Encryption Isn\'t Always Enough',
        body:
            'Secure email protocols such as SMTPS, POP3S, and IMAPS '
            'protect email communication while messages travel between '
            'email clients and mail servers. However, once an email '
            'reaches a mail server, additional protection may be '
            'required to ensure that only the intended recipient can '
            'read its contents. Email encryption provides this '
            'additional layer of security by encrypting the message '
            'itself. Even if an attacker gains unauthorized access to '
            'the email during storage or transmission, the encrypted '
            'content remains unreadable without the appropriate '
            'decryption key.',
        bullets: ['Financial information', 'Customer records', 'Legal documents', 'Medical information', 'Confidential business reports', 'Intellectual property'],
      ),
      LessonSection(
        heading: 'Why Email Encryption Is Necessary',
        body:
            'Consider this scenario: an employee sends a confidential '
            'financial report, the message travels securely using TLS, '
            'and the recipient\'s mail server stores the email. If the '
            'mail server is compromised, an attacker may be able to '
            'read unencrypted messages. Encrypting the email itself '
            'ensures that only the intended recipient can decrypt and '
            'view the contents.',
      ),
      LessonSection(
        heading: 'Secure/Multipurpose Internet Mail Extensions (S/MIME)',
        body:
            'S/MIME is a widely used standard for encrypting and '
            'digitally signing email messages. It relies on Public Key '
            'Infrastructure (PKI) and digital certificates to establish '
            'trust between email users. Each user possesses a public '
            'key, which can be shared with others, and a private key, '
            'which remains secret. When sending an encrypted email, the '
            'sender encrypts the message using the recipient\'s public '
            'key, and only the recipient\'s private key can decrypt the '
            'message. S/MIME can also digitally sign emails, allowing '
            'recipients to verify the sender\'s identity and confirm '
            'that the message has not been altered.',
        bullets: [
          'Provides strong email encryption',
          'Supports digital signatures',
          'Verifies sender identity',
          'Ensures message integrity',
          'Commonly integrated into enterprise email platforms',
        ],
      ),
      LessonSection(
        heading: 'Pretty Good Privacy (PGP)',
        body:
            'PGP is another widely used method for securing email '
            'communication. Like S/MIME, PGP uses public-key '
            'cryptography, but it follows a different trust model. '
            'Instead of relying on centralized Certificate Authorities, '
            'PGP uses a Web of Trust, where users validate and trust '
            'each other\'s public keys. PGP provides email encryption, '
            'digital signatures, authentication, and data integrity, '
            'and is commonly used by security professionals, software '
            'developers, researchers, and privacy-focused users. '
            'Although highly secure, PGP generally requires more manual '
            'key management than S/MIME.',
      ),
      LessonSection(
        heading: 'S/MIME vs. PGP',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'S/MIME', 'PGP'],
          tableRows: [
            ['Trust Model', 'Certificate Authority (CA)', 'Web of Trust'],
            ['Uses Digital Certificates', 'Yes', 'No'],
            ['Enterprise Adoption', 'High', 'Moderate'],
            ['Ease of Deployment', 'Easier in managed environments', 'Requires manual key management'],
            ['Supports Encryption', 'Yes', 'Yes'],
            ['Supports Digital Signatures', 'Yes', 'Yes'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Choosing Between Them',
        body:
            'Both technologies provide strong protection for sensitive '
            'email communication, but organizations typically choose '
            'the solution that best aligns with their infrastructure '
            'and operational requirements — S/MIME for managed '
            'enterprise environments with existing PKI, and PGP for '
            'decentralized or privacy-focused use cases.',
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Email Authentication: SPF, DKIM & DMARC',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Encryption Alone Doesn\'t Stop Impersonation',
        body:
            'While encryption protects the confidentiality of email '
            'messages, it does not prevent attackers from impersonating '
            'legitimate senders. To address this issue, organizations '
            'use email authentication technologies that verify whether '
            'an email actually originated from the claimed sender. The '
            'three primary authentication mechanisms — SPF, DKIM, and '
            'DMARC — together reduce email spoofing and phishing '
            'attacks.',
      ),
      LessonSection(
        heading: 'Sender Policy Framework (SPF)',
        body:
            'SPF helps prevent unauthorized mail servers from sending '
            'emails on behalf of a domain. The domain owner publishes '
            'an SPF record in the Domain Name System (DNS), listing the '
            'mail servers authorized to send emails for that domain. '
            'When a receiving mail server receives an email, it checks '
            'the sender\'s domain, retrieves the SPF record from DNS, '
            'and verifies whether the sending mail server is '
            'authorized. If the sending server is not listed, the '
            'message may be marked as suspicious or rejected.',
        bullets: ['Reduces domain spoofing', 'Prevents unauthorized email servers from sending messages', 'Improves email trustworthiness', 'Helps reduce phishing attacks'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/spf.jpg',
          caption: 'SPF verifies that a sending mail server is authorized to send email on behalf of a domain.',
        ),
      ),
      LessonSection(
        heading: 'DomainKeys Identified Mail (DKIM)',
        body:
            'DKIM adds a digital signature to outgoing email messages. '
            'When an organization sends an email, the mail server signs '
            'the message using a private key, and the corresponding '
            'public key is published in DNS. The receiving server '
            'retrieves the public key and verifies the digital '
            'signature — if the email has been modified during '
            'transmission, the signature verification fails. Unlike '
            'SPF, which verifies the sending server, DKIM verifies the '
            'message itself.',
        bullets: ['Verifies sender authenticity', 'Detects message tampering', 'Protects email integrity', 'Reduces spoofing attempts'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/dkim.jpg',
          caption: 'DKIM digitally signs outgoing email so receiving servers can verify the message has not been altered in transit.',
        ),
      ),
      LessonSection(
        heading: 'Domain-based Message Authentication, Reporting and Conformance (DMARC)',
        body:
            'DMARC builds upon SPF and DKIM by providing a policy that '
            'tells receiving mail servers how to handle emails that '
            'fail authentication. DMARC also allows organizations to '
            'receive reports about email authentication failures, '
            'helping administrators identify spoofing attempts and '
            'improve email security.',
      ),
      LessonSection(
        heading: 'Common DMARC Policies',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Policy', 'Description'],
          tableRows: [
            ['None', 'Monitor only; do not block messages'],
            ['Quarantine', 'Deliver suspicious emails to the spam or quarantine folder'],
            ['Reject', 'Reject emails that fail authentication'],
          ],
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/dmarc.jpg',
          caption: 'DMARC significantly improves protection against phishing and Business Email Compromise (BEC) attacks by ensuring only properly authenticated emails are accepted.',
        ),
      ),
      LessonSection(
        heading: 'How SPF, DKIM, and DMARC Work Together',
        body:
            'These three technologies complement one another rather '
            'than replacing each other. SPF verifies that the sending '
            'mail server is authorized to send email for the domain. '
            'DKIM verifies that the email content has not been altered '
            'and confirms the sender\'s identity through a digital '
            'signature. DMARC uses the results of SPF and DKIM to '
            'determine how unauthenticated emails should be handled. '
            'Implementing all three provides a stronger defense against '
            'spoofing, phishing, and fraudulent emails than relying on '
            'any single technology alone.',
      ),
      LessonSection(
        heading: 'Comparison of Email Authentication Technologies',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Technology', 'Primary Purpose', 'Uses DNS', 'Helps Prevent'],
          tableRows: [
            ['SPF', 'Verifies sending mail server', 'Yes', 'Domain spoofing'],
            ['DKIM', 'Verifies message integrity and sender authenticity', 'Yes', 'Message tampering'],
            ['DMARC', 'Enforces authentication policy', 'Yes', 'Phishing and BEC attacks'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Email Security',
        bullets: [
          'Use encrypted email protocols such as SMTPS, POP3S, and IMAPS',
          'Encrypt sensitive emails using S/MIME or PGP where appropriate',
          'Configure SPF records for all organizational domains',
          'Enable DKIM signing on outbound email',
          'Implement a DMARC policy and regularly review authentication reports',
          'Enforce Multi-Factor Authentication (MFA) for email accounts',
          'Deploy secure email gateways to filter spam, malware, and phishing attempts',
          'Educate users to identify phishing emails and suspicious attachments',
          'Regularly update email servers and clients with the latest security patches',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/email_security_best_practices.jpg',
          caption: 'A layered approach combining encryption and authentication technologies provides the strongest protection for enterprise email.',
        ),
      ),
    ],
  ),

  // 13 ---------------------------------------------------------------------
  Lesson(
    title: 'Secure File Transfer Protocols',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Why Secure File Transfer Is Important',
        body:
            'Organizations regularly transfer files containing '
            'business reports, customer information, application '
            'updates, system backups, and configuration files between '
            'users, servers, cloud platforms, and business partners. If '
            'these files are transmitted using insecure protocols, '
            'attackers may intercept, modify, or steal sensitive '
            'information.',
        bullets: [
          'Sharing financial reports',
          'Exchanging customer data',
          'Uploading website content',
          'Deploying software updates',
          'Transferring system backups',
          'Synchronizing cloud storage',
          'Sharing log files between security systems',
        ],
      ),
      LessonSection(
        heading: 'File Transfer Protocol (FTP)',
        body:
            'FTP is one of the oldest Internet protocols used for '
            'transferring files between computers. Although FTP is '
            'simple and widely supported, it has significant security '
            'limitations because it does not encrypt communication — '
            'both authentication credentials and file contents are '
            'transmitted in plaintext. FTP uses port 21 for its control '
            'connection and port 20 for data connections in active '
            'mode. Because FTP lacks encryption, attackers monitoring '
            'the network may capture usernames, passwords, file '
            'contents, and directory listings.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/sftp.jpg',
          caption: 'SFTP encrypts the entire file transfer session, including authentication, file contents, and directory information.',
        ),
      ),
      LessonSection(
        heading: 'Trivial File Transfer Protocol (TFTP)',
        body:
            'TFTP is a simplified file transfer protocol commonly used '
            'for lightweight network operations. Unlike FTP, TFTP does '
            'not support user authentication, encryption, or directory '
            'browsing — its simplicity makes it useful for specialized '
            'administrative tasks such as network device boot files, '
            'firmware upgrades, router and switch configuration files, '
            'PXE network boot, and embedded devices. TFTP uses UDP port '
            '69. Since TFTP provides neither authentication nor '
            'encryption, it should only be used on trusted internal '
            'networks and never exposed to the Internet.',
      ),
      LessonSection(
        heading: 'Secure File Transfer Protocol (SFTP)',
        body:
            'SFTP provides secure file transfer capabilities using the '
            'SSH protocol. Unlike FTP, SFTP encrypts the entire '
            'communication session, including user authentication, file '
            'contents, commands, and directory information. Because '
            'SFTP relies on SSH, it also supports strong authentication '
            'methods such as public key authentication. SFTP uses port '
            '22 and is commonly used by system administrators, cloud '
            'service providers, managed service providers, financial '
            'institutions, and healthcare organizations.',
      ),
      LessonSection(
        heading: 'File Transfer Protocol Secure (FTPS)',
        body:
            'FTPS enhances FTP by adding Transport Layer Security (TLS) '
            'encryption. Unlike SFTP, FTPS continues to use the FTP '
            'protocol while protecting communication with TLS '
            'certificates — often chosen when organizations need to '
            'integrate with existing FTP-based applications while '
            'improving security. FTPS typically uses port 21 for '
            'explicit FTPS or port 990 for implicit FTPS (less common). '
            'Although more secure than FTP, FTPS may require additional '
            'firewall configuration because it uses multiple '
            'communication channels.',
      ),
      LessonSection(
        heading: 'Secure Copy Protocol (SCP)',
        body:
            'SCP is another secure file transfer protocol built on SSH, '
            'designed primarily for securely copying files between '
            'systems. Unlike SFTP, SCP focuses on straightforward file '
            'transfers and provides fewer file management features — '
            'commonly used for copying configuration files, deploying '
            'software, system backups, script automation, and server '
            'migration. SCP uses port 22, offering encrypted '
            'communication, fast file transfers, simple operation, and '
            'SSH authentication.',
      ),
      LessonSection(
        heading: 'Comparison of File Transfer Protocols',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'FTP', 'TFTP', 'SFTP', 'FTPS', 'SCP'],
          tableRows: [
            ['Encryption', 'No', 'No', 'Yes', 'Yes', 'Yes'],
            ['Authentication', 'Username/Password', 'None', 'SSH', 'TLS', 'SSH'],
            ['Default Port', '21', '69', '22', '21 / 990', '22'],
            ['Directory Browsing', 'Yes', 'No', 'Yes', 'Yes', 'Limited'],
            ['Suitable for Internet', 'No', 'No', 'Yes', 'Yes', 'Yes'],
            ['Enterprise Recommendation', 'Avoid', 'Internal use only', 'Highly Recommended', 'Recommended', 'Recommended'],
          ],
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/file_transfer_comparison.jpg',
          caption: 'Each file transfer protocol serves different operational requirements, ranging from unencrypted legacy use to strongly authenticated, encrypted enterprise transfers.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Secure File Transfers',
        bullets: [
          'Replace FTP with SFTP, FTPS, or SCP for sensitive data',
          'Restrict TFTP to isolated internal networks',
          'Use strong authentication methods such as SSH keys or digital certificates',
          'Enforce Multi-Factor Authentication (MFA) where possible',
          'Limit file transfer permissions based on the principle of least privilege',
          'Monitor file transfer logs for unauthorized activity',
          'Disable unused file transfer services',
          'Regularly update file transfer servers and software',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/secure_file_transfer_best_practices.jpg',
          caption: 'Enforcing strong authentication, least privilege, and continuous monitoring reduces the risk of unauthorized file transfer activity.',
        ),
      ),
    ],
  ),

  // 14 ---------------------------------------------------------------------
  Lesson(
    title: 'Network Management: SNMP',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Continuous Visibility Into Network Devices',
        body:
            'Managing enterprise networks requires continuous '
            'monitoring of routers, switches, firewalls, servers, and '
            'other network devices. Network management protocols enable '
            'administrators to monitor device health, collect '
            'performance statistics, receive alerts, manage device '
            'configurations, and troubleshoot network problems. Common '
            'protocols include SNMP, Syslog, NetFlow, and IPFIX — this '
            'lesson focuses on SNMP.',
      ),
      LessonSection(
        heading: 'Simple Network Management Protocol (SNMP)',
        body:
            'SNMP is used to monitor and manage network devices. '
            'Devices that commonly support SNMP include routers, '
            'switches, firewalls, wireless access points, printers, UPS '
            'devices, and servers. SNMP allows administrators to '
            'collect information such as CPU utilization, memory usage, '
            'interface status, network bandwidth, device uptime, '
            'temperature, and hardware failures.',
      ),
      LessonSection(
        heading: 'SNMP Components',
        bullets: [
          'SNMP Manager — the central management system that collects information from network devices',
          'SNMP Agent — software running on each managed device that gathers operational information',
          'Management Information Base (MIB) — a structured database defining the information available from managed devices',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/snmp.jpg',
          caption: 'SNMP enables centralized monitoring of routers, switches, firewalls, and other network devices through managers, agents, and the MIB.',
        ),
      ),
      LessonSection(
        heading: 'SNMP Versions',
        body: 'Several versions of SNMP exist, each providing different security capabilities.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Version', 'Security', 'Recommendation'],
          tableRows: [
            ['SNMPv1', 'Minimal security', 'Avoid'],
            ['SNMPv2c', 'Community string authentication', 'Limited use'],
            ['SNMPv3', 'Authentication and encryption', 'Recommended'],
          ],
        ),
      ),
      LessonSection(
        heading: 'SNMPv3',
        body:
            'SNMPv3 introduces significant security improvements over '
            'earlier versions, providing user authentication, message '
            'integrity, encryption of management traffic, and access '
            'control. Modern enterprise environments should use SNMPv3 '
            'whenever supported.',
      ),
    ],
  ),

  // 15 ---------------------------------------------------------------------
  Lesson(
    title: 'Syslog & Centralized Logging',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Too Many Devices to Check Individually',
        body:
            'Modern enterprise networks consist of hundreds or even '
            'thousands of devices, including servers, firewalls, '
            'routers, switches, endpoints, applications, cloud '
            'services, and security appliances. Each of these devices '
            'continuously generates log messages that record '
            'operational events, security incidents, configuration '
            'changes, and user activities. Analyzing logs from '
            'individual devices is both inefficient and time-consuming. '
            'To simplify monitoring and incident response, organizations '
            'use Syslog, a standardized protocol for collecting and '
            'centralizing log messages.',
      ),
      LessonSection(
        heading: 'Why Logging Is Important',
        bullets: [
          'User logins and logouts',
          'Failed authentication attempts',
          'Firewall rule matches',
          'Network device status changes',
          'Software installation',
          'Configuration modifications',
          'Malware detections',
          'System errors',
          'VPN connections',
        ],
      ),
      LessonSection(
        heading: 'Benefits of Centralized Logging',
        bullets: [
          'Monitor multiple devices from a single console',
          'Detect suspicious activities quickly',
          'Simplify troubleshooting',
          'Support digital forensic investigations',
          'Meet regulatory compliance requirements',
          'Retain historical security records',
          'Correlate events across multiple systems',
        ],
      ),
      LessonSection(
        heading: 'How Syslog Works',
        body:
            'Syslog follows a simple client-server model: a network '
            'device generates a log event, the device formats the '
            'message according to the Syslog standard, the message is '
            'transmitted to the Syslog server, the Syslog server stores '
            'the event, and security teams review or analyze the logs '
            'manually or through a Security Information and Event '
            'Management (SIEM) platform. For example, when a firewall '
            'blocks unauthorized traffic, it immediately sends a Syslog '
            'message to the centralized logging server.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/how_syslog_works.jpg',
          caption: 'Syslog centralizes log messages from across the enterprise, enabling administrators to monitor and correlate events from a single console.',
        ),
      ),
      LessonSection(
        heading: 'Syslog Message Components',
        body: 'A Syslog message contains standardized information that helps administrators understand the event.',
        bullets: ['Timestamp', 'Device name', 'Source IP address', 'Application or process name', 'Event severity', 'Event description'],
      ),
      LessonSection(
        heading: 'Example Syslog Message',
        body: 'Jul 30 10:15:45 Firewall01 Denied inbound connection from 203.0.113.15',
      ),
      LessonSection(
        heading: 'What This Information Reveals',
        bullets: ['When the event occurred', 'Which device generated it', 'The severity of the event', 'The nature of the activity'],
      ),
      LessonSection(
        heading: 'Syslog Severity Levels',
        body: 'Syslog classifies events into severity levels to help administrators prioritize responses.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Severity Level', 'Description'],
          tableRows: [
            ['Emergency', 'System is unusable'],
            ['Alert', 'Immediate action required'],
            ['Critical', 'Critical condition'],
            ['Error', 'Operational error'],
            ['Warning', 'Potential issue'],
            ['Notice', 'Normal but significant event'],
            ['Informational', 'General operational information'],
            ['Debug', 'Diagnostic information for troubleshooting'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Secure Syslog',
        body:
            'Traditional Syslog transmits log messages without '
            'encryption. When logs travel across untrusted networks, '
            'attackers may read sensitive log information, modify log '
            'entries, or delete evidence of malicious activity. Secure '
            'Syslog addresses these risks by using TLS to encrypt log '
            'communication between devices and the logging server, '
            'providing confidentiality of log data, protection against '
            'tampering, authentication of communicating systems, and '
            'compliance with security regulations. Organizations should '
            'use Secure Syslog whenever log traffic traverses public or '
            'shared networks.',
      ),
    ],
  ),

  // 16 ---------------------------------------------------------------------
  Lesson(
    title: 'Flow Monitoring & Time Synchronization: NetFlow, IPFIX & NTP',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'NetFlow',
        body:
            'While Syslog records events, NetFlow records network '
            'traffic statistics. Developed originally by Cisco, NetFlow '
            'collects metadata about network communications rather than '
            'the contents of the packets — allowing administrators to '
            'understand how the network is being used without '
            'inspecting the actual transmitted data.',
        bullets: [
          'Source IP address',
          'Destination IP address',
          'Source port',
          'Destination port',
          'Protocol',
          'Number of packets',
          'Number of bytes',
          'Start and end time of the communication',
        ],
      ),
      LessonSection(
        heading: 'Common Uses of NetFlow',
        body:
            'Because NetFlow captures metadata instead of payload data, '
            'it provides valuable visibility with relatively low '
            'storage requirements.',
        bullets: [
          'Monitor network bandwidth usage',
          'Detect unusual traffic patterns',
          'Identify large data transfers',
          'Investigate malware communications',
          'Detect command-and-control traffic',
          'Troubleshoot network performance',
          'Support capacity planning',
        ],
      ),
      LessonSection(
        heading: 'Real-World Example',
        body:
            'If a workstation suddenly begins communicating with '
            'hundreds of external IP addresses, NetFlow records can '
            'help investigators identify the affected system.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/netflow.jpg',
          caption: 'NetFlow records metadata about network conversations, providing traffic visibility without inspecting actual packet contents.',
        ),
      ),
      LessonSection(
        heading: 'Internet Protocol Flow Information Export (IPFIX)',
        body:
            'IPFIX is an open standard developed from NetFlow. Although '
            'NetFlow was originally vendor-specific, IPFIX provides a '
            'standardized method for exporting network flow information '
            'across devices from different manufacturers. IPFIX '
            'collects information similar to NetFlow but offers greater '
            'flexibility by allowing organizations to define additional '
            'data fields.',
        bullets: ['Vendor-independent standard', 'Flexible data collection', 'Improved interoperability', 'Better integration with security monitoring tools', 'Supports modern enterprise networks'],
      ),
      LessonSection(
        heading: 'NetFlow vs. IPFIX',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'NetFlow', 'IPFIX'],
          tableRows: [
            ['Standard', 'Originally Cisco proprietary', 'Open standard'],
            ['Vendor Support', 'Broad', 'Broad'],
            ['Custom Fields', 'Limited', 'Extensive'],
            ['Enterprise Adoption', 'Very common', 'Increasingly common'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Network Time Protocol (NTP)',
        body:
            'Accurate time synchronization is essential for security '
            'monitoring, troubleshooting, auditing, and digital '
            'forensics. If different devices record events using '
            'different times, investigators may struggle to reconstruct '
            'the sequence of events during a security incident. NTP '
            'synchronizes clocks across devices on a network — firewalls, '
            'routers, servers, SIEM platforms, domain controllers, '
            'security appliances, and endpoint protection platforms all '
            'rely on accurate timestamps.',
      ),
      LessonSection(
        heading: 'How NTP Works',
        body:
            'NTP servers maintain accurate time using reliable time '
            'sources. Client devices periodically synchronize their '
            'clocks with an NTP server, ensuring that all systems '
            'maintain consistent timestamps.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/ntp.jpg',
          caption: 'NTP synchronizes clocks across enterprise devices, ensuring consistent timestamps for security monitoring and forensic investigations.',
        ),
      ),
      LessonSection(
        heading: 'Importance of Accurate Time in Security',
        bullets: [
          'Incident Response — investigators use timestamps to determine the order of events during an attack',
          'Digital Forensics — accurate timestamps help reconstruct attacker activities and identify the sequence of malicious actions',
          'SIEM Correlation — if timestamps differ significantly, related events may not be correlated correctly, delaying detection and investigation',
          'Compliance and Auditing — many regulatory frameworks require organizations to maintain accurate and synchronized system clocks to support reliable audit trails',
        ],
      ),
      LessonSection(
        heading: 'Best Practices for Logging and Network Monitoring',
        bullets: [
          'Centralize logs using Syslog or Secure Syslog',
          'Encrypt log traffic using TLS whenever possible',
          'Synchronize all devices using trusted NTP servers',
          'Use SNMPv3 instead of earlier SNMP versions',
          'Deploy NetFlow or IPFIX for network traffic visibility',
          'Forward security logs to a SIEM for correlation and analysis',
          'Retain logs according to organizational and regulatory requirements',
          'Monitor high-severity events and configure automated alerts',
          'Regularly review logs for signs of unauthorized access or abnormal activity',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/logging_monitoring_best_practices.jpg',
          caption: 'Combining centralized logging, flow monitoring, and accurate time synchronization gives security teams reliable visibility across the enterprise.',
        ),
      ),
    ],
  ),

  // 17 ---------------------------------------------------------------------
  Lesson(
    title: 'Secure API Communication, Common Attacks & Best Practices',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Systems Constantly Exchanging Information',
        body:
            'Modern applications rarely operate in isolation. Web '
            'applications, cloud platforms, mobile apps, Software as a '
            'Service (SaaS) solutions, and Internet of Things (IoT) '
            'devices constantly exchange information through '
            'Application Programming Interfaces (APIs) — a set of rules '
            'and protocols that allows one application to communicate '
            'with another. Since APIs often transmit sensitive '
            'information, securing API communication is a critical part '
            'of enterprise cybersecurity.',
        bullets: [
          'A mobile banking app retrieving account information',
          'An e-commerce website processing online payments',
          'A cloud application synchronizing user data',
          'A security platform collecting alerts from firewalls and endpoint protection systems',
          'A SIEM platform receiving security events from multiple security tools',
        ],
      ),
      LessonSection(
        heading: 'Why API Security Is Important',
        body:
            'If APIs are not properly secured, attackers may steal '
            'sensitive information, impersonate legitimate users, '
            'modify transmitted data, exploit weak authentication, or '
            'launch automated attacks against applications.',
        bullets: ['User credentials', 'Personal information', 'Financial transactions', 'Healthcare records', 'Configuration data', 'Security alerts', 'Authentication tokens'],
      ),
      LessonSection(
        heading: 'REST APIs',
        body:
            'One of the most widely used API architectures is the '
            'Representational State Transfer (REST) architecture. REST '
            'APIs use standard HTTP methods to exchange information '
            'between clients and servers.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Method', 'Purpose'],
          tableRows: [
            ['GET', 'Retrieve information'],
            ['POST', 'Create new information'],
            ['PUT', 'Update existing information'],
            ['DELETE', 'Remove information'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Securing APIs with HTTPS',
        body:
            'API requests should always be transmitted using HTTPS '
            'instead of HTTP. HTTPS uses TLS to provide encryption, '
            'authentication, and data integrity. Without HTTPS, login '
            'credentials may be intercepted, API requests can be '
            'modified, and sensitive responses may be exposed. Most '
            'modern web services require HTTPS for all API '
            'communication.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/securing_apis_https.jpg',
          caption: 'API requests should always use HTTPS to protect credentials, requests, and responses from interception or modification.',
        ),
      ),
      LessonSection(
        heading: 'API Keys',
        body:
            'An API key is a unique identifier assigned to an '
            'application. Each request includes the key, allowing the '
            'server to identify the requesting application — easy to '
            'implement and suitable for trusted integrations, though '
            'API keys do not identify individual users, may be stolen '
            'if not protected, and should always be transmitted over '
            'HTTPS.',
      ),
      LessonSection(
        heading: 'OAuth 2.0',
        body:
            'OAuth 2.0 is a widely used authorization framework that '
            'allows users to grant applications limited access to their '
            'resources without sharing passwords. For example, a user '
            'signs in using an identity provider and grants a '
            'third-party application permission to access specific '
            'information — the application receives an access token '
            'instead of the user\'s password, meaning passwords remain '
            'protected, limited permissions can be granted, tokens can '
            'expire automatically, and integration with cloud services '
            'becomes easier.',
      ),
      LessonSection(
        heading: 'JSON Web Token (JWT)',
        body:
            'A JWT is a digitally signed token that securely carries '
            'information between two systems, potentially containing '
            'user identity, roles, permissions, and expiration time. '
            'Because the token is digitally signed, the receiving '
            'system can verify that it has not been modified. JWTs are '
            'commonly used in web applications, cloud services, mobile '
            'applications, and Single Sign-On (SSO) environments.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/api_authentication_methods.jpg',
          caption: 'API keys, OAuth 2.0, and JWT each provide different authentication mechanisms suited to different integration scenarios.',
        ),
      ),
      LessonSection(
        heading: 'Mutual TLS (mTLS)',
        body:
            'In standard TLS communication, the client verifies the '
            'server\'s identity using a digital certificate. Mutual TLS '
            'extends this process by requiring both the client and the '
            'server to authenticate each other. This provides stronger '
            'identity verification and is commonly used in enterprise '
            'environments where systems exchange sensitive information.',
        bullets: ['Strong mutual authentication', 'Reduced risk of impersonation', 'Secure communication between internal services', 'Protection against unauthorized devices', 'Suitable for Zero Trust architectures'],
      ),
      LessonSection(
        heading: 'Common Enterprise Use Cases for mTLS',
        bullets: ['Communication between microservices', 'Cloud-to-cloud communication', 'Financial applications', 'Healthcare systems', 'Business-to-business (B2B) integrations'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/mutual_tls.jpg',
          caption: 'Mutual TLS requires both the client and server to authenticate each other, providing stronger identity verification for sensitive API communication.',
        ),
      ),
      LessonSection(
        heading: 'Common Communication Attacks',
        body: 'Even when secure protocols are used, attackers may attempt to exploit weaknesses in communication channels.',
      ),
      LessonSection(
        heading: 'Man-in-the-Middle (MitM), Replay & Downgrade Attacks',
        bullets: [
          'Man-in-the-Middle (MitM) — an attacker secretly intercepts communication between two parties, potentially reading, modifying, or injecting content; mitigated using TLS, certificate validation, VPNs, and Mutual TLS',
          'Replay Attack — an attacker captures valid network traffic and retransmits it later to gain unauthorized access; reduced using session identifiers, sequence numbers, nonces, and timestamps',
          'Downgrade Attack — attempts to force two systems to use an older, less secure protocol or encryption algorithm; prevented by disabling deprecated protocols, using current TLS versions, and enforcing strong cipher suites',
        ],
      ),
      LessonSection(
        heading: 'SSL Stripping & Session Hijacking',
        bullets: [
          'SSL Stripping — an attacker attempts to replace an HTTPS connection with an unencrypted HTTP connection; reduced by using HTTPS exclusively, enabling HSTS, and redirecting all HTTP requests to HTTPS',
          'Session Hijacking — if an attacker steals a session identifier after a user authenticates, they may impersonate the legitimate user; reduced by using HTTPS for all sessions, regenerating session identifiers after login, setting session expiration times, using secure and HttpOnly cookies, and implementing MFA',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/common_communication_attacks.jpg',
          caption: 'Even with secure protocols in place, attackers continue to target communication channels through MitM, replay, downgrade, SSL stripping, and session hijacking techniques.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Secure Communication',
        bullets: [
          'Use HTTPS for all web and API communication',
          'Deploy TLS 1.2 or TLS 1.3 and disable deprecated protocol versions',
          'Use strong encryption algorithms and modern cipher suites',
          'Implement Multi-Factor Authentication (MFA) for remote access and administrative accounts',
          'Protect APIs using OAuth 2.0, JWT, or Mutual TLS where appropriate',
          'Validate digital certificates before establishing secure connections',
          'Regularly rotate encryption keys and certificates',
          'Monitor network traffic for abnormal communication patterns',
          'Keep communication software and cryptographic libraries updated',
          'Follow the principle of least privilege when granting API permissions',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/secproto/secure_communication_best_practices.jpg',
          caption: 'A layered set of best practices — spanning encryption, authentication, monitoring, and key management — provides comprehensive protection for enterprise communication.',
        ),
      ),
      LessonSection(
        heading: 'Chapter Summary',
        body:
            'In this chapter, you learned how secure communication '
            'protocols protect data exchanged across networks. You '
            'explored technologies such as TLS, HTTPS, SSH, secure '
            'email protocols, secure file transfer protocols, Syslog, '
            'SNMP, NetFlow, IPFIX, and secure API communication. You '
            'also examined common communication attacks — including '
            'Man-in-the-Middle, replay, downgrade, SSL stripping, and '
            'session hijacking — and the security controls used to '
            'defend against them. A strong understanding of these '
            'protocols and best practices enables cybersecurity '
            'professionals to design, implement, and maintain secure '
            'communication infrastructures that protect confidentiality, '
            'integrity, and availability in enterprise environments.',
      ),
    ],
  ),

  // 18 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 24,
    quiz: [
      QuizQuestion(
        question: 'What does "data in transit" specifically refer to?',
        options: [
          'Information stored on a hard drive',
          'Information actively moving between devices, applications, or networks',
          'Information that has been permanently deleted',
          'Information stored only in cloud backups',
        ],
        correctIndex: 1,
        explanation: 'Data in transit is information on the move — as opposed to data at rest, which is stored on a device or system.',
      ),
      QuizQuestion(
        question: 'Which security objective specifically prevents a sender from later denying they sent a particular message?',
        options: ['Confidentiality', 'Availability', 'Non-Repudiation', 'Integrity'],
        correctIndex: 2,
        explanation: 'Non-repudiation, typically provided by digital signatures, proves the origin and authenticity of a communication.',
      ),
      QuizQuestion(
        question: 'In a Man-in-the-Middle (MitM) attack, what actually happens to the communication between two parties?',
        options: [
          'The communication is simply blocked entirely',
          'The attacker positions themselves between the two parties, who unknowingly communicate through the attacker instead of directly with each other',
          'The communication is automatically encrypted by the attacker',
          'Nothing changes — MitM only affects storage, not communication',
        ],
        correctIndex: 1,
        explanation: 'MitM attacks work by secretly inserting the attacker into the communication path, allowing interception, modification, or injection.',
      ),
      QuizQuestion(
        question: 'Why is SSL now considered obsolete compared to TLS?',
        options: [
          'SSL is actually faster but was retired for no security reason',
          'Security researchers discovered several weaknesses in SSL, leading to TLS with stronger encryption and better protection against known vulnerabilities',
          'SSL was never actually used in production systems',
          'TLS and SSL are functionally identical, just renamed',
        ],
        correctIndex: 1,
        explanation: 'TLS was developed specifically to replace SSL after significant vulnerabilities were found in the older protocol.',
      ),
      QuizQuestion(
        question: 'According to the protocol evolution table, which TLS/SSL versions should organizations disable?',
        options: [
          'Only SSL versions, keeping all TLS versions active',
          'SSL 2.0, SSL 3.0, TLS 1.0, and TLS 1.1 — all deprecated or obsolete',
          'TLS 1.2 and TLS 1.3, since only SSL is considered secure',
          'None — all versions remain equally secure',
        ],
        correctIndex: 1,
        explanation: 'SSL 2.0/3.0 are obsolete and TLS 1.0/1.1 are deprecated; only TLS 1.2 (secure) and TLS 1.3 (recommended) should remain enabled.',
      ),
      QuizQuestion(
        question: 'During the TLS handshake, what happens in Step 3 (Certificate Validation)?',
        options: [
          'The server immediately begins sending encrypted application data',
          'The client examines the server\'s certificate, checking whether it\'s trusted, unexpired, matches the domain, and hasn\'t been revoked',
          'The client generates a new certificate for the server',
          'Both parties skip authentication entirely',
        ],
        correctIndex: 1,
        explanation: 'Certificate validation is a critical checkpoint before any key exchange or sensitive data transmission occurs.',
      ),
      QuizQuestion(
        question: 'Why does TLS use symmetric session keys for the actual data transfer instead of continuing to use asymmetric cryptography?',
        options: [
          'Asymmetric cryptography cannot encrypt any data at all',
          'Symmetric encryption is significantly faster, so it\'s used for the high-speed encryption after asymmetric cryptography handles the initial authentication and key exchange',
          'Symmetric keys never need to be exchanged securely',
          'TLS never actually uses asymmetric cryptography',
        ],
        correctIndex: 1,
        explanation: 'This hybrid approach combines asymmetric crypto\'s secure key exchange with symmetric crypto\'s superior speed for ongoing data transfer.',
      ),
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
      QuizQuestion(
        question: 'What is the fundamental security weakness of standard HTTP?',
        options: [
          'HTTP is too slow to be practical',
          'HTTP transmits data in plaintext, meaning anyone monitoring the network can potentially read or modify the transmitted information',
          'HTTP cannot be used with web browsers',
          'HTTP requires expensive hardware to operate',
        ],
        correctIndex: 1,
        explanation: 'The lack of encryption in plain HTTP is exactly what HTTPS (HTTP + TLS) was created to solve.',
      ),
      QuizQuestion(
        question: 'What happens when a browser detects that a certificate\'s domain name does not match the website being visited?',
        options: [
          'Nothing — the browser proceeds silently',
          'The browser displays a certificate warning, since this domain mismatch could indicate misconfiguration, a typo, or a phishing website',
          'The website is automatically deleted',
          'The connection is automatically upgraded to a higher TLS version',
        ],
        correctIndex: 1,
        explanation: 'Domain mismatch is one of several validation checks browsers perform, and failing it triggers a visible warning to the user.',
      ),
      QuizQuestion(
        question: 'What does HTTP Strict Transport Security (HSTS) specifically instruct browsers to do?',
        options: [
          'Always use HTTP instead of HTTPS for faster loading',
          'Communicate with a website only over HTTPS, even automatically converting a typed http:// request to https://',
          'Disable all encryption for that specific website',
          'Delete all cookies after every visit',
        ],
        correctIndex: 1,
        explanation: 'HSTS enforces HTTPS-only communication once a browser has received the policy, protecting against downgrade and SSL stripping attacks.',
      ),
      QuizQuestion(
        question: 'Why is Telnet considered unsuitable for modern enterprise networks?',
        options: [
          'Telnet is too fast and overwhelms network equipment',
          'Telnet offers no encryption, meaning every command, username, and password transmitted can potentially be intercepted by attackers',
          'Telnet requires expensive licensing fees',
          'Telnet only works with wireless networks',
        ],
        correctIndex: 1,
        explanation: 'Telnet\'s complete lack of encryption is precisely the gap that SSH was designed to close.',
      ),
      QuizQuestion(
        question: 'Why does SSH public key authentication provide stronger security than password authentication?',
        options: [
          'Because the private key is transmitted to the server during every login',
          'Because the private key never leaves the client device — the server verifies ownership without the key ever being transmitted',
          'Because public key authentication requires no verification at all',
          'Because passwords are actually more secure than key pairs',
        ],
        correctIndex: 1,
        explanation: 'The administrator proves possession of the private key without ever transmitting it, unlike passwords which must be sent (even if encrypted) during authentication.',
      ),
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
      QuizQuestion(
        question: 'What is SSH tunneling used for?',
        options: [
          'Permanently disabling SSH access',
          'Allowing encrypted communication to pass securely through an SSH connection, letting applications that don\'t normally support encryption transmit data securely',
          'Deleting SSH keys automatically',
          'Blocking all remote access to a server',
        ],
        correctIndex: 1,
        explanation: 'SSH tunneling wraps otherwise-unencrypted application traffic inside an encrypted SSH connection.',
      ),
      QuizQuestion(
        question: 'Why is email described as a "store-and-forward" service?',
        options: [
          'Because emails are deleted immediately after sending',
          'Because messages are temporarily stored on mail servers before being delivered to the recipient, unlike real-time instant messaging',
          'Because email never actually reaches its destination',
          'Because emails are only stored on the sender\'s device',
        ],
        correctIndex: 1,
        explanation: 'Unlike instant messaging, email messages pass through and rest on intermediate mail servers before final delivery.',
      ),
      QuizQuestion(
        question: 'What is the key difference between POP3 and IMAP?',
        options: [
          'They are functionally identical protocols',
          'POP3 typically downloads and may remove messages from the server (limited multi-device support); IMAP keeps messages on the server and synchronizes across multiple devices',
          'IMAP is used only for sending email, never receiving',
          'POP3 supports better multi-device synchronization than IMAP',
        ],
        correctIndex: 1,
        explanation: 'IMAP\'s server-side synchronization is what makes it well suited for users who check email from multiple devices, unlike POP3\'s single-device download model.',
      ),
      QuizQuestion(
        question: 'How does STARTTLS work?',
        options: [
          'It creates an entirely separate encrypted protocol from scratch',
          'It upgrades an existing plaintext connection to an encrypted TLS connection using a specific command, before credentials or data are transmitted',
          'It permanently disables encryption on the mail server',
          'It only works with SFTP, not email',
        ],
        correctIndex: 1,
        explanation: 'STARTTLS allows compatibility with existing infrastructure by upgrading a plaintext connection in place, rather than requiring a completely separate secure protocol.',
      ),
      QuizQuestion(
        question: 'Why might email encryption (like S/MIME) still be necessary even when SMTPS/TLS already protects the connection?',
        options: [
          'Channel encryption and message encryption are the same thing',
          'If the mail server itself is compromised, TLS-protected-in-transit messages could still be read in storage unless the message content itself is encrypted',
          'S/MIME replaces the need for any connection-level encryption',
          'Email encryption is purely cosmetic and provides no real benefit',
        ],
        correctIndex: 1,
        explanation: 'TLS protects the transmission path, but a compromised mail server could still expose stored plaintext messages — message-level encryption closes that gap.',
      ),
      QuizQuestion(
        question: 'What is the fundamental difference between S/MIME\'s and PGP\'s trust models?',
        options: [
          'They use the exact same trust model',
          'S/MIME relies on centralized Certificate Authorities, while PGP uses a decentralized "Web of Trust" where users validate each other\'s keys',
          'PGP requires digital certificates while S/MIME does not',
          'Neither protocol actually establishes any trust',
        ],
        correctIndex: 1,
        explanation: 'S/MIME\'s CA-based model suits managed enterprise environments; PGP\'s Web of Trust is more decentralized and manual.',
      ),
      QuizQuestion(
        question: 'What specifically does SPF verify?',
        options: [
          'That the email content has not been modified',
          'Whether the sending mail server is authorized to send email on behalf of a specific domain, based on DNS records',
          'The recipient\'s identity',
          'The physical location of the email server',
        ],
        correctIndex: 1,
        explanation: 'SPF checks the sending server against a domain\'s published list of authorized mail servers.',
      ),
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
      QuizQuestion(
        question: 'What does a DMARC policy of "Reject" instruct a receiving mail server to do?',
        options: [
          'Deliver the email normally regardless of authentication results',
          'Reject emails that fail SPF/DKIM authentication entirely',
          'Only monitor the email without taking any action',
          'Automatically forward the email to a spam folder for manual review only',
        ],
        correctIndex: 1,
        explanation: 'The "Reject" policy is the strictest DMARC setting, refusing delivery of emails that fail authentication checks.',
      ),
      QuizQuestion(
        question: 'Why should TFTP never be exposed to the Internet?',
        options: [
          'TFTP is actually more secure than SFTP',
          'TFTP provides neither authentication nor encryption, making it suitable only for trusted internal networks',
          'TFTP requires expensive licensing for Internet use',
          'TFTP automatically encrypts all traffic by default',
        ],
        correctIndex: 1,
        explanation: 'TFTP\'s complete lack of authentication and encryption makes Internet exposure a significant security risk.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of SNMPv3 compared to SNMPv1 and SNMPv2c?',
        options: [
          'SNMPv3 removes all security features for faster performance',
          'SNMPv3 introduces user authentication, message integrity, and encryption of management traffic — significant improvements over earlier, less secure versions',
          'SNMPv3 only works with community strings, just like v1 and v2c',
          'SNMPv3 is identical in security to SNMPv1',
        ],
        correctIndex: 1,
        explanation: 'SNMPv3 is specifically recommended because it addresses the security weaknesses present in SNMPv1 and SNMPv2c.',
      ),
      QuizQuestion(
        question: 'Why is centralized logging (Syslog) valuable for security teams managing large enterprise networks?',
        options: [
          'It eliminates the need for any network devices',
          'It allows administrators and analysts to monitor multiple devices from a single console, correlate events, and support forensic investigations, rather than manually checking each device individually',
          'It automatically fixes security vulnerabilities',
          'It only works for a single device at a time',
        ],
        correctIndex: 1,
        explanation: 'Centralization is what makes monitoring hundreds or thousands of devices practical, rather than manually reviewing logs device by device.',
      ),
      QuizQuestion(
        question: 'What is the key difference between NetFlow/IPFIX and full packet capture?',
        options: [
          'They are exactly the same technique',
          'NetFlow/IPFIX collect metadata about network conversations (like IPs, ports, byte counts) rather than the actual packet contents, requiring far less storage',
          'NetFlow captures full packet payloads by default',
          'IPFIX cannot be used by any enterprise organization',
        ],
        correctIndex: 1,
        explanation: 'Flow-based monitoring trades full payload visibility for dramatically reduced storage requirements, while still providing valuable traffic pattern visibility.',
      ),
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
      QuizQuestion(
        question: 'What is the key difference between an API key and OAuth 2.0 for API authentication?',
        options: [
          'They are functionally identical',
          'An API key is a simple identifier for an application, while OAuth 2.0 is a full authorization framework letting users grant limited access without sharing passwords',
          'OAuth 2.0 never uses tokens of any kind',
          'API keys always identify individual users, while OAuth never does',
        ],
        correctIndex: 1,
        explanation: 'API keys are simple application identifiers; OAuth 2.0 is a more sophisticated framework for delegated, limited-scope authorization.',
      ),
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
    ],
  ),
];
