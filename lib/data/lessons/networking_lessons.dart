import '../lesson_model.dart';

const List<Lesson> networkingLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'How the Internet Actually Works',
    isAudio: true,
    sections: [
      LessonSection(
        heading: 'Welcome to Networking',
        body:
            'This is an audio lesson. Sit back and listen. A full '
            'transcript is below if you\'d like to follow along.',
      ),
      LessonSection(
        heading: 'You\'re Doing It Right Now',
        body:
            'Right now, as you read or listen to this, data is moving '
            'between your device and a server somewhere in the world. '
            'It might be crossing undersea cables, bouncing through a '
            'dozen routers, passing through corporate firewalls — and it '
            'all happened in the time it took you to load this screen. '
            'Most people use the internet every day without knowing any '
            'of this. But if you want to defend networks, you need to '
            'understand what\'s actually happening.',
      ),
      LessonSection(
        heading: 'The Journey of a Single Request',
        body:
            'Let\'s trace what happens when you type a web address and '
            'hit enter. Your device first needs to find the IP address '
            'behind that name — it asks a DNS server, which is like '
            'calling directory enquiries for the internet. Once it has '
            'the IP address, your device sends a connection request '
            'across the network. That request doesn\'t travel as one '
            'piece — it\'s broken into small packets, each one finding '
            'its own path through the network, potentially through '
            'different countries, before being reassembled at the '
            'destination. The whole thing takes milliseconds.',
      ),
      LessonSection(
        heading: 'Why This Matters for Security',
        body:
            'Every step in that journey is an opportunity for something '
            'to go wrong. The DNS lookup can be poisoned. The packets '
            'can be intercepted. The routers can be compromised. The '
            'connection itself can be spoofed. Understanding the '
            'journey is what lets you understand the attacks — and '
            'more importantly, where to place your defenses.',
      ),
      LessonSection(
        heading: 'What\'s Ahead',
        body:
            'In the lessons that follow you\'ll learn how IP addresses '
            'work, what ports and protocols are, how firewalls make '
            'decisions, how DNS can be abused, and what the most common '
            'network attacks look like and how to defend against them. '
            'By the end, the network won\'t be a black box — it\'ll be '
            'something you can reason about, configure, and protect.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'TCP/IP & the OSI Model',
    sections: [
      LessonSection(
        heading: 'Two Frameworks, One Reality',
        body:
            'The OSI model (7 layers) is a conceptual framework for '
            'understanding networking. TCP/IP (4 layers) is what actually '
            'runs the internet. Learning both helps you understand where '
            'attacks and defenses operate.',
      ),
      LessonSection(
        heading: 'OSI Layers That Matter Most for Security',
        bullets: [
          'Layer 2 (Data Link) — MAC addressing, switches, ARP spoofing happens here',
          'Layer 3 (Network) — IP addressing, routing, IP spoofing happens here',
          'Layer 4 (Transport) — TCP/UDP ports, connection tracking, SYN floods happen here',
          'Layer 7 (Application) — HTTP, DNS, SMTP — most application-layer attacks happen here',
        ],
      ),
      LessonSection(
        heading: 'TCP: Reliable, Connection-Oriented',
        body:
            'TCP establishes a connection via a three-way handshake '
            '(SYN → SYN-ACK → ACK), confirms delivery of every packet, '
            'and retransmits on failure. Used for HTTP, HTTPS, SSH, email.',
      ),
      LessonSection(
        heading: 'UDP: Fast, Connectionless',
        body:
            'UDP sends packets without establishing a connection or '
            'confirming delivery. Lower overhead, higher speed. Used for '
            'DNS, VoIP, video streaming, gaming.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'IPv4 & IPv6 Addressing',
    sections: [
      LessonSection(
        heading: 'IPv4 Addressing',
        body:
            'IPv4 uses 32-bit addresses written as four numbers separated '
            'by dots (e.g. 192.168.1.10). With roughly 4 billion total '
            'addresses, IPv4 exhausted its public address space years ago.',
      ),
      LessonSection(
        heading: 'Public vs. Private Addresses',
        bullets: [
          'Private ranges (not routable on the public internet): 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16',
          'Public IPs are globally unique and internet-reachable',
          'NAT (Network Address Translation) allows many private devices to share one public IP',
        ],
      ),
      LessonSection(
        heading: 'IPv6',
        body:
            'IPv6 uses 128-bit addresses (e.g. 2001:0db8::1), providing '
            'a virtually unlimited number of addresses. Also built-in '
            'support for IPsec. Security teams must monitor both — '
            'networks with dual-stack configurations can be exploited '
            'through whichever protocol has weaker controls.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Subnetting & Network Segmentation',
    sections: [
      LessonSection(
        heading: 'What Subnetting Is',
        body:
            'Subnetting divides an IP network into smaller, isolated '
            'segments. A subnet mask or CIDR notation (e.g. /24) defines '
            'how many bits identify the network vs. the individual host.',
      ),
      LessonSection(
        heading: 'Why Segmentation Is a Security Control',
        body:
            'An attacker who compromises one machine in a flat, unsegmented '
            'network can reach every other machine. Segmentation limits '
            'lateral movement — putting finance servers, HR systems, '
            'IoT devices, and workstations on separate segments means a '
            'breach in one area doesn\'t automatically expose the rest.',
      ),
      LessonSection(
        heading: 'DMZ: A Classic Segmentation Pattern',
        body:
            'A DMZ (Demilitarized Zone) places public-facing servers '
            '(web, email, DNS) in a segment isolated from both the internet '
            'and the internal network. Traffic rules ensure the internet '
            'can reach the DMZ, but the DMZ cannot freely reach internal '
            'systems — so a compromised web server can\'t directly pivot '
            'to internal databases.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Ports, Protocols & Services',
    sections: [
      LessonSection(
        heading: 'Why Ports Matter for Security',
        body:
            'Every open port on a system is a potential entry point. '
            'Hardening means closing every port that isn\'t actively needed '
            'and understanding exactly what\'s listening on the ones that are.',
      ),
      LessonSection(
        heading: 'Essential Ports to Know',
        bullets: [
          '21 — FTP (unencrypted file transfer; avoid)',
          '22 — SSH (encrypted remote administration)',
          '25 — SMTP (email relay; should be restricted externally)',
          '53 — DNS (both UDP and TCP; frequently targeted for tunneling/poisoning)',
          '80 — HTTP (unencrypted web; should redirect to HTTPS)',
          '443 — HTTPS (encrypted web; TLS required)',
          '445 — SMB (Windows file sharing; frequent ransomware propagation vector)',
          '3389 — RDP (Windows Remote Desktop; very frequently brute-forced when exposed)',
        ],
      ),
      LessonSection(
        heading: 'Port Scanning',
        body:
            'Attackers use tools like nmap to discover which ports are '
            'open on a target. Security teams run the same scans to audit '
            'their own exposure. A port scan result showing 3389 or 445 '
            'directly exposed to the internet is an immediate finding.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Firewalls, Routers & Network Devices',
    sections: [
      LessonSection(
        heading: 'Routers',
        body:
            'Routers forward traffic between networks based on destination '
            'IP address. They are the gateway between your internal network '
            'and the internet. Most also include basic packet-filtering '
            'capability.',
      ),
      LessonSection(
        heading: 'Firewalls',
        bullets: [
          'Packet filter (stateless) — inspects individual packets against simple rules',
          'Stateful firewall — tracks connection state; allows return traffic from established sessions',
          'Next-Generation Firewall (NGFW) — adds application-layer inspection, IPS, and threat intelligence',
          'Web Application Firewall (WAF) — specifically protects HTTP/S traffic from application-layer attacks like SQLi and XSS',
        ],
      ),
      LessonSection(
        heading: 'IDS vs. IPS',
        bullets: [
          'IDS (Intrusion Detection System) — monitors and alerts on suspicious activity; passive',
          'IPS (Intrusion Prevention System) — monitors and actively blocks suspicious traffic; inline',
        ],
      ),
      LessonSection(
        heading: 'Switches',
        body:
            'Switches connect devices within the same local network, '
            'forwarding traffic only to the intended recipient\'s port — '
            'more efficient and more private than a hub. VLANs (Virtual '
            'LANs) allow a single physical switch to carry multiple '
            'isolated logical networks.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'DNS Architecture & Security',
    sections: [
      LessonSection(
        heading: 'How DNS Resolution Works',
        body:
            'When you type a domain name, your device queries a resolver '
            '(usually your ISP\'s or a public one like 8.8.8.8), which '
            'recursively queries authoritative servers until it gets the '
            'IP address. This hierarchy is what attackers target.',
      ),
      LessonSection(
        heading: 'DNS-Based Attacks',
        bullets: [
          'DNS Cache Poisoning — injecting false records into a resolver\'s cache, redirecting users to attacker-controlled IPs',
          'DNS Tunneling — encoding data in DNS queries to exfiltrate data or establish C2 channels through firewalls that allow DNS',
          'Typosquatting — registering near-identical domains to catch mistyped URLs',
          'DNS Amplification — using open DNS resolvers in DDoS attacks',
        ],
      ),
      LessonSection(
        heading: 'Defensive Measures',
        bullets: [
          'DNSSEC — cryptographically signs DNS records to verify they haven\'t been tampered with',
          'DNS over HTTPS (DoH) / DNS over TLS (DoT) — encrypts DNS queries to prevent interception',
          'DNS filtering/RPZ — blocking lookups to known-malicious domains before a connection is made',
          'Monitoring unusual DNS query volumes — a signal of tunneling or beaconing',
        ],
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'VPNs, TLS & Encryption in Transit',
    sections: [
      LessonSection(
        heading: 'TLS: The Encryption Behind HTTPS',
        body:
            'Transport Layer Security (TLS) is the protocol that encrypts '
            'traffic between a client and a server — what makes the '
            '"S" in HTTPS. It uses asymmetric encryption to exchange '
            'keys, then symmetric encryption for the session itself. '
            'TLS 1.3 (current) is significantly faster and more secure '
            'than older versions.',
      ),
      LessonSection(
        heading: 'VPNs',
        body:
            'A VPN creates an encrypted tunnel between a client and a '
            'VPN server, protecting traffic from eavesdropping on '
            'untrusted networks. Used for remote access and site-to-site '
            'connectivity between offices.',
      ),
      LessonSection(
        heading: 'VPN Protocols',
        bullets: [
          'OpenVPN — mature, open-source, highly configurable',
          'WireGuard — modern, fast, minimal codebase; increasingly preferred',
          'IPsec — widely used for site-to-site VPNs',
          'PPTP/L2TP — older protocols; L2TP with IPsec is acceptable; PPTP is broken and should not be used',
        ],
      ),
      LessonSection(
        heading: 'What VPNs Don\'t Protect Against',
        body:
            'A VPN protects data in transit but does nothing against '
            'a compromised endpoint, phished credentials, or malware '
            'already on the device. It\'s one layer — not a complete '
            'solution on its own.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Wireless Network Security',
    sections: [
      LessonSection(
        heading: 'Wi-Fi Security Standards',
        bullets: [
          'WEP — broken; never use',
          'WPA/WPA2-TKIP — deprecated; avoid',
          'WPA2-AES (CCMP) — acceptable; widely deployed',
          'WPA3 — current standard; required for new devices; forward secrecy prevents past traffic decryption if key is later compromised',
        ],
      ),
      LessonSection(
        heading: 'Common Wireless Attacks',
        bullets: [
          'Evil Twin / Rogue AP — attacker sets up a Wi-Fi hotspot with the same name as a legitimate one, intercepts traffic',
          'WPA2 PMKID/KRACK attacks — vulnerabilities in WPA2 allowing key recovery',
          'Deauthentication attacks — forcing devices off a network to capture the reconnection handshake',
          'Wardriving — scanning for open or weakly secured networks from a moving vehicle',
        ],
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use WPA3 or WPA2-AES; disable WEP/WPA-TKIP',
          'Separate guest Wi-Fi from corporate networks',
          'Use 802.1X with a RADIUS server for enterprise authentication instead of pre-shared keys',
          'Avoid sensitive activity on public/untrusted Wi-Fi without a VPN',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Network Attacks & Defenses',
    sections: [
      LessonSection(
        heading: 'Man-in-the-Middle (MITM)',
        body:
            'An attacker positions themselves between two communicating '
            'parties, reading or modifying traffic without either side '
            'knowing. Defense: encrypt all traffic so interception yields '
            'only ciphertext; verify certificate authenticity.',
      ),
      LessonSection(
        heading: 'ARP Spoofing',
        body:
            'ARP maps IP addresses to MAC addresses on a local network. '
            'An attacker sends fake ARP replies to associate their MAC '
            'with a legitimate IP, redirecting traffic through their '
            'machine. Defense: dynamic ARP inspection on managed switches.',
      ),
      LessonSection(
        heading: 'DDoS Attacks',
        body:
            'Distributed Denial of Service overwhelms a target with '
            'traffic from many sources simultaneously. Types include '
            'volumetric (bandwidth exhaustion), protocol (SYN floods), '
            'and application-layer (HTTP request floods). Defense: '
            'scrubbing centers, rate limiting, CDN absorption, anycast.',
      ),
      LessonSection(
        heading: 'Network-Layer Defense Principles',
        bullets: [
          'Deny by default — block everything not explicitly permitted',
          'Encrypt in transit — assume networks are untrusted',
          'Segment — limit blast radius of any single compromise',
          'Monitor — detect anomalies before they become incidents',
          'Patch — network device firmware is software; it has vulnerabilities too',
        ],
      ),
    ],
  ),

  // 10 ----------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    quiz: [
      QuizQuestion(
        question: 'What is the purpose of network segmentation?',
        options: [
          'To make DNS queries faster',
          'To limit lateral movement if one part of the network is compromised',
          'To increase available bandwidth',
          'To replace firewalls',
        ],
        correctIndex: 1,
        explanation: 'Segmentation contains breaches by isolating different parts of the network from each other.',
      ),
      QuizQuestion(
        question: 'Which port is most commonly associated with unencrypted '
            'remote desktop access on Windows?',
        options: ['22', '443', '3389', '25'],
        correctIndex: 2,
        explanation: 'Port 3389 is RDP — Windows Remote Desktop Protocol — a very common brute-force target when exposed.',
      ),
      QuizQuestion(
        question: 'An attacker injects false DNS records into a resolver\'s '
            'cache, redirecting users to a malicious site. This is:',
        options: ['ARP spoofing', 'DNS cache poisoning', 'DNS tunneling', 'IP spoofing'],
        correctIndex: 1,
        explanation: 'DNS cache poisoning corrupts the resolver\'s cached records to redirect lookups.',
      ),
      QuizQuestion(
        question: 'WPA3 offers an important improvement over WPA2. What is it?',
        options: [
          'It removes the need for a password',
          'It provides forward secrecy, so past traffic can\'t be decrypted if the key is later compromised',
          'It uses TKIP instead of AES',
          'It disables guest network access',
        ],
        correctIndex: 1,
        explanation: 'WPA3\'s Simultaneous Authentication of Equals (SAE) provides forward secrecy.',
      ),
      QuizQuestion(
        question: 'An attacker sets up a rogue Wi-Fi hotspot with the same '
            'name as a coffee shop\'s real network. This is called:',
        options: ['DNS tunneling', 'SYN flooding', 'An Evil Twin attack', 'ARP poisoning'],
        correctIndex: 2,
        explanation: 'An Evil Twin or Rogue AP mimics a legitimate network to intercept traffic.',
      ),
      QuizQuestion(
        question: 'What does a WAF (Web Application Firewall) specifically protect?',
        options: [
          'Physical network cables',
          'HTTP/HTTPS traffic from application-layer attacks like SQL injection',
          'Wi-Fi authentication',
          'DNS query resolution',
        ],
        correctIndex: 1,
        explanation: 'A WAF inspects HTTP/S traffic specifically to block application-layer attacks.',
      ),
      QuizQuestion(
        question: 'Which is NOT a valid reason to use TCP over UDP?',
        options: [
          'You need guaranteed delivery of every packet',
          'You need connection state to be established',
          'You need the lowest possible latency for real-time streaming',
          'You need retransmission of lost packets',
        ],
        correctIndex: 2,
        explanation: 'Low latency real-time streaming (VoIP, video) benefits from UDP\'s lack of overhead, not TCP.',
      ),
      QuizQuestion(
        question: 'DNS tunneling is dangerous because:',
        options: [
          'It breaks DNS resolution permanently',
          'It can be used to exfiltrate data or establish command-and-control through firewalls that permit DNS',
          'It requires root access to execute',
          'It only works on Linux systems',
        ],
        correctIndex: 1,
        explanation: 'DNS tunneling encodes data inside DNS queries, which many firewalls allow by default.',
      ),
    ],
  ),
];
