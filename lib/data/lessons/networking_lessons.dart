import '../lesson_model.dart';

const List<Lesson> networkingLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'How Networks Work',
    sections: [
      LessonSection(
        heading: 'What is a Network?',
        body:
            'A network is simply two or more devices connected so they can '
            'share data. Understanding how data moves between devices is '
            'essential before you can understand how to secure it.',
      ),
      LessonSection(
        heading: 'The OSI Model (Simplified)',
        body:
            'The OSI model describes networking in seven layers. You don\'t '
            'need to memorize all seven to get started — focus on these '
            'three:',
        bullets: [
          'Physical/Data Link — the actual cables, Wi-Fi signals, and hardware addressing (MAC addresses)',
          'Network — how data is routed between networks (IP addresses)',
          'Transport — how data is delivered reliably between applications (TCP/UDP)',
        ],
      ),
      LessonSection(
        heading: 'TCP/IP in Practice',
        body:
            'Most real-world traffic runs on TCP/IP. TCP establishes a '
            'reliable connection and confirms delivery; UDP sends data '
            'quickly without that overhead — useful for things like video '
            'streaming where speed matters more than perfect delivery.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'IP Addressing & Subnetting',
    sections: [
      LessonSection(
        heading: 'What is an IP Address?',
        body:
            'An IP address identifies a device on a network, similar to a '
            'street address for mail. IPv4 addresses look like '
            '192.168.1.10; IPv6 addresses are longer and designed to solve '
            'IPv4\'s limited address space.',
      ),
      LessonSection(
        heading: 'Public vs. Private Addresses',
        bullets: [
          'Public IPs — reachable directly from the internet',
          'Private IPs — used inside local networks (e.g. 192.168.x.x, 10.x.x.x) and not routable on the public internet',
        ],
      ),
      LessonSection(
        heading: 'Why Subnetting Matters for Security',
        body:
            'Subnetting divides a network into smaller segments. From a '
            'security standpoint, this lets you isolate sensitive systems '
            '(like servers handling payment data) from general user '
            'traffic, limiting how far an attacker can move if they '
            'compromise one segment.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Ports & Protocols',
    sections: [
      LessonSection(
        heading: 'What is a Port?',
        body:
            'A port is a numbered "door" on a device that a specific '
            'service listens on. A single IP address can run many '
            'services at once, each on its own port.',
      ),
      LessonSection(
        heading: 'Common Ports to Recognize',
        bullets: [
          'Port 80 — HTTP (unencrypted web traffic)',
          'Port 443 — HTTPS (encrypted web traffic)',
          'Port 22 — SSH (secure remote administration)',
          'Port 53 — DNS (domain name resolution)',
          'Port 25 — SMTP (sending email)',
        ],
      ),
      LessonSection(
        heading: 'Why This Matters for Defense',
        body:
            'Every open port is a potential entry point. Part of hardening '
            'any system is closing or restricting ports that aren\'t '
            'actually needed — this is often called reducing the "attack '
            'surface."',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Network Devices',
    sections: [
      LessonSection(
        heading: 'Routers',
        body:
            'Routers move traffic between different networks, deciding the '
            'best path for data to reach its destination — for example, '
            'connecting your home network to the internet.',
      ),
      LessonSection(
        heading: 'Switches',
        body:
            'Switches connect devices within the same local network, '
            'forwarding traffic only to the device it\'s actually intended '
            'for rather than broadcasting it to everyone.',
      ),
      LessonSection(
        heading: 'Firewalls',
        body:
            'Firewalls inspect traffic and allow or block it based on '
            'rules — like "block all inbound traffic except on port 443." '
            'They\'re one of the most fundamental network security '
            'controls.',
      ),
      LessonSection(
        heading: 'Other Devices to Know',
        bullets: [
          'Access Points — provide Wi-Fi connectivity',
          'Load Balancers — distribute traffic across multiple servers',
          'IDS/IPS — Intrusion Detection/Prevention Systems that watch for and can block suspicious traffic',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'DNS Explained',
    sections: [
      LessonSection(
        heading: 'What DNS Does',
        body:
            'DNS (Domain Name System) translates human-friendly domain '
            'names like example.com into the IP addresses computers '
            'actually use to find each other. It\'s often called the '
            '"phone book of the internet."',
      ),
      LessonSection(
        heading: 'Why Attackers Target DNS',
        bullets: [
          'DNS spoofing — feeding a device a false IP address to redirect it to a malicious site',
          'DNS tunneling — hiding stolen data inside DNS traffic to sneak past defenses',
          'Typosquatting — registering misspelled domains to catch mistyped URLs',
        ],
      ),
      LessonSection(
        heading: 'Defensive Measures',
        bullets: [
          'DNSSEC — cryptographically verifies DNS responses haven\'t been tampered with',
          'DNS filtering — blocking known-malicious domains before a connection is made',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'VPNs & Encryption in Transit',
    sections: [
      LessonSection(
        heading: 'What is a VPN?',
        body:
            'A Virtual Private Network creates an encrypted tunnel between '
            'a device and a remote network, so traffic traveling across an '
            'untrusted network (like public Wi-Fi) stays private.',
      ),
      LessonSection(
        heading: 'Common Uses',
        bullets: [
          'Remote employees securely accessing company resources',
          'Protecting traffic on untrusted networks',
          'Connecting separate office locations into one private network (site-to-site VPN)',
        ],
      ),
      LessonSection(
        heading: 'VPNs Aren\'t a Silver Bullet',
        body:
            'A VPN protects data in transit, but it doesn\'t protect '
            'against a compromised endpoint, a phished credential, or a '
            'malicious website. It\'s one layer in a broader defense '
            'strategy, not a replacement for the rest.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Network Attacks',
    sections: [
      LessonSection(
        heading: 'Man-in-the-Middle (MITM)',
        body:
            'An attacker secretly positions themselves between two parties '
            'communicating, intercepting or altering traffic without '
            'either side realizing it.',
      ),
      LessonSection(
        heading: 'Packet Sniffing',
        body:
            'Capturing traffic as it travels across a network. On '
            'unencrypted connections, this can expose sensitive data — '
            'which is exactly why encrypting traffic (HTTPS, VPNs) matters.',
      ),
      LessonSection(
        heading: 'Spoofing',
        body:
            'Disguising traffic to appear as if it\'s coming from a '
            'trusted source — for example, faking a source IP or MAC '
            'address to bypass access controls.',
      ),
      LessonSection(
        heading: 'Denial-of-Service (DoS/DDoS)',
        body:
            'Flooding a network or service with traffic until it can\'t '
            'respond to legitimate requests, making it unavailable.',
      ),
      LessonSection(
        heading: 'Core Defenses',
        bullets: [
          'Encrypt traffic end-to-end wherever possible',
          'Segment networks so a breach in one area doesn\'t expose everything',
          'Monitor traffic for unusual patterns',
          'Keep network device firmware patched',
        ],
      ),
    ],
  ),

  // 8 ------------------------------------------------------------------ Quiz
  Lesson(
    title: 'Final Quiz',
    quiz: [
      QuizQuestion(
        question: 'Which OSI layer is responsible for IP addressing and '
            'routing between networks?',
        options: ['Physical', 'Network', 'Transport', 'Application'],
        correctIndex: 1,
        explanation:
            'The Network layer handles IP addressing and routing between '
            'different networks.',
      ),
      QuizQuestion(
        question: 'Which type of IP address is NOT directly reachable '
            'from the public internet?',
        options: [
          'A public IP address',
          'A private IP address',
          'Any IPv6 address',
          'A static IP address',
        ],
        correctIndex: 1,
        explanation:
            'Private IP addresses are used inside local networks and '
            'aren\'t routable on the public internet.',
      ),
      QuizQuestion(
        question: 'Which port is associated with encrypted web traffic '
            '(HTTPS)?',
        options: ['21', '80', '443', '53'],
        correctIndex: 2,
        explanation: 'Port 443 is the standard port for HTTPS traffic.',
      ),
      QuizQuestion(
        question: 'What is the primary job of a firewall?',
        options: [
          'Translate domain names into IP addresses',
          'Allow or block traffic based on defined rules',
          'Distribute traffic evenly across servers',
          'Encrypt traffic between two endpoints',
        ],
        correctIndex: 1,
        explanation:
            'Firewalls inspect traffic and permit or deny it according to '
            'configured rules.',
      ),
      QuizQuestion(
        question: 'DNS is often described as the "phone book of the '
            'internet" because it:',
        options: [
          'Stores phone numbers for IT support',
          'Translates domain names into IP addresses',
          'Encrypts domain traffic',
          'Blocks malicious websites automatically',
        ],
        correctIndex: 1,
        explanation:
            'DNS resolves human-readable domain names to the IP addresses '
            'computers use to communicate.',
      ),
      QuizQuestion(
        question: 'What does a VPN primarily protect?',
        options: [
          'Data stored on a hard drive',
          'Data while it travels across a network',
          'Passwords saved in a browser',
          'Files inside a compressed archive',
        ],
        correctIndex: 1,
        explanation:
            'A VPN creates an encrypted tunnel that protects data in '
            'transit across untrusted networks.',
      ),
      QuizQuestion(
        question: 'An attacker secretly intercepts communication between '
            'two parties without either side knowing. This is known as:',
        options: [
          'A denial-of-service attack',
          'DNS tunneling',
          'A man-in-the-middle attack',
          'Subnetting',
        ],
        correctIndex: 2,
        explanation:
            'A man-in-the-middle attack involves secretly intercepting '
            'communication between two parties.',
      ),
      QuizQuestion(
        question: 'Why might an organization segment its network into '
            'smaller subnets?',
        options: [
          'To make Wi-Fi passwords longer',
          'To limit how far an attacker can move if one segment is compromised',
          'To increase the number of public IP addresses available',
          'To remove the need for firewalls',
        ],
        correctIndex: 1,
        explanation:
            'Segmentation contains the impact of a breach by isolating '
            'parts of the network from each other.',
      ),
    ],
  ),
];
