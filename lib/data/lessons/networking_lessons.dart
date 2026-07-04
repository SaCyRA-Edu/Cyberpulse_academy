import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> networkingLessons = [
  // 1 -- AUDIO -------------------------------------------------------------
  Lesson(
    title: 'How the Internet Actually Works',
    isAudio: true,
    estimatedMinutes: 6,
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
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Two Frameworks Describing the Same Reality',
        body:
            'Every networking course starts here, and for good reason: '
            'nearly every technical conversation about networks — and '
            'every network-based attack — is described in terms of these '
            'two models. The OSI model is a seven-layer conceptual '
            'framework created to standardize how we think and talk '
            'about networking. TCP/IP is the actual four-layer protocol '
            'suite that runs the real internet. You\'ll encounter both '
            'constantly, so it\'s worth understanding each rather than '
            'just memorizing the layer names.',
      ),
      LessonSection(
        heading: 'Walking Through the OSI Layers',
        body:
            'Rather than memorizing all seven layers as an abstract '
            'list, it helps to understand what problem each one solves, '
            'starting from the physical world and working up to the '
            'applications you actually use.',
        bullets: [
          'Layer 1 (Physical) — the actual electrical signals, light pulses, or radio waves; the cables and Wi-Fi transmissions themselves',
          'Layer 2 (Data Link) — moving data between devices on the same local network using MAC addresses; this is where ARP spoofing attacks operate',
          'Layer 3 (Network) — routing data between different networks using IP addresses; this is where IP spoofing happens',
          'Layer 4 (Transport) — managing end-to-end connections and reliability using TCP or UDP; this is where SYN flood attacks target the connection process',
          'Layer 5 (Session) — establishing, maintaining, and tearing down communication sessions between applications',
          'Layer 6 (Presentation) — translating data formats, including encryption and compression',
          'Layer 7 (Application) — the protocols your actual software uses directly: HTTP, DNS, SMTP; this is where most application-layer attacks like SQL injection and phishing happen',
        ],
      ),
      LessonSection(
        heading: 'Why Security Professionals Think in Layers',
        body:
            'The value of this model for defenders is that it gives you '
            'a shared vocabulary for precisely locating a problem. '
            'Saying "there\'s an issue with the network" is vague. '
            'Saying "we\'re seeing Layer 3 IP spoofing feeding into a '
            'Layer 7 SQL injection attempt" tells a colleague exactly '
            'where to look and which tools are relevant. Every firewall '
            'rule, every intrusion detection signature, and every '
            'security control operates at one or more of these layers — '
            'learning to identify which layer you\'re dealing with speeds '
            'up almost every investigation.',
      ),
      LessonSection(
        heading: 'TCP: Reliable, Connection-Oriented Delivery',
        body:
            'TCP (Transmission Control Protocol) establishes a formal '
            'connection before sending any actual data, using a process '
            'called the three-way handshake: the client sends a SYN '
            '(synchronize) packet, the server responds with a SYN-ACK '
            '(synchronize-acknowledge), and the client confirms with an '
            'ACK (acknowledge). Once that handshake completes, TCP '
            'guarantees that every packet arrives, arrives in the '
            'correct order, and gets retransmitted automatically if '
            'anything is lost along the way. This reliability makes TCP '
            'the protocol of choice for web browsing, email, and file '
            'transfers — situations where losing even a small piece of '
            'data would corrupt the result.',
      ),
      LessonSection(
        heading: 'UDP: Fast, Connectionless Delivery',
        body:
            'UDP (User Datagram Protocol) skips the handshake entirely '
            'and simply sends packets without confirming that a '
            'connection exists or that any individual packet actually '
            'arrived. This trades reliability for speed and lower '
            'overhead, which is exactly the right trade-off for DNS '
            'lookups, video streaming, and online gaming — situations '
            'where a dropped packet here and there matters far less than '
            'raw speed and low latency. A single missing frame in a video '
            'call is barely noticeable; waiting for it to be '
            're-transmitted, TCP-style, would be far more disruptive.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'IPv4 & IPv6 Addressing',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'IPv4: The Address Space We Outgrew',
        body:
            'IPv4 addresses use 32 bits, written as four numbers '
            'separated by dots — for example, 192.168.1.10 — giving a '
            'theoretical maximum of roughly 4.3 billion unique '
            'addresses. That sounded like an enormous number when IPv4 '
            'was designed decades ago. It is nowhere near enough for a '
            'world with billions of smartphones, laptops, servers, and '
            'an ever-expanding universe of connected devices, which is '
            'exactly why the public IPv4 address space has been '
            'effectively exhausted for years.',
      ),
      LessonSection(
        heading: 'Public vs. Private Address Ranges',
        body:
            'Not every device needs a globally unique, internet-reachable '
            'address. Three specific IPv4 ranges are reserved for private, '
            'internal use only, and are not routable on the public '
            'internet: 10.0.0.0 through 10.255.255.255, 172.16.0.0 '
            'through 172.31.255.255, and 192.168.0.0 through '
            '192.168.255.255. Your home router almost certainly assigns '
            'your devices addresses from one of these ranges.',
      ),
      LessonSection(
        heading: 'NAT: Stretching a Scarce Resource',
        body:
            'Network Address Translation (NAT) is the mechanism that '
            'lets an entire household or office full of devices, each '
            'with its own private IP address, share a single public IP '
            'address to reach the internet. Your router keeps a table '
            'tracking which internal device made which outbound '
            'connection, then translates responses back to the correct '
            'internal address. NAT wasn\'t originally designed as a '
            'security feature, but it provides a useful side effect: '
            'devices behind NAT aren\'t directly reachable from the '
            'internet unless the router is specifically configured to '
            'forward traffic to them, which incidentally blocks a huge '
            'amount of unsolicited scanning and attack traffic by '
            'default.',
      ),
      LessonSection(
        heading: 'IPv6: Solving the Scarcity Problem Permanently',
        body:
            'IPv6 uses 128-bit addresses, written in hexadecimal groups '
            'like 2001:0db8:85a3::8a2e:0370:7334, providing an address '
            'space so vast — trillions of trillions of addresses — that '
            'exhaustion is effectively impossible for the foreseeable '
            'future. IPv6 also has built-in support for IPsec encryption '
            'and simplifies certain aspects of network configuration. '
            'Adoption has been gradual, and many networks today run in '
            'dual-stack mode, supporting both IPv4 and IPv6 '
            'simultaneously — which means security teams have to monitor '
            'and secure both protocols, since a network hardened only '
            'against IPv4 threats while quietly also running IPv6 has '
            'left an entire parallel attack surface unmonitored.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Subnetting & Network Segmentation',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'What Subnetting Actually Does',
        body:
            'Subnetting divides one larger IP network into multiple '
            'smaller, logically separate networks. A subnet mask, or its '
            'shorthand CIDR notation (like /24), defines exactly how '
            'many bits of an address identify the network itself versus '
            'how many bits are available to identify individual hosts '
            'within that network. A /24 network, for example, reserves '
            '24 bits for the network portion, leaving 8 bits for hosts — '
            'enough for 254 usable addresses.',
      ),
      LessonSection(
        heading: 'From Addressing Trick to Security Control',
        body:
            'Subnetting started as a purely technical solution for '
            'efficient address allocation, but it has become one of the '
            'most important security controls available to network '
            'architects. Here\'s why: in a flat, unsegmented network '
            'where every device can freely reach every other device, a '
            'single compromised laptop can become a direct stepping '
            'stone to the organization\'s most sensitive database. '
            'Segmentation breaks that assumption by placing sensitive '
            'systems — finance servers, customer databases, industrial '
            'control equipment — on separate network segments, with '
            'firewall rules tightly controlling exactly what traffic is '
            'permitted to cross between segments.',
      ),
      LessonSection(
        heading: 'The DMZ: A Classic Segmentation Pattern',
        body:
            'One of the most widely used segmentation patterns is the '
            'DMZ, short for Demilitarized Zone — a network segment that '
            'sits between the untrusted internet and the trusted '
            'internal network. Public-facing services like web servers, '
            'mail servers, and DNS servers live in the DMZ, where they\'re '
            'reachable from the internet, but firewall rules ensure the '
            'DMZ cannot freely initiate connections into the internal '
            'network. The logic is straightforward: if an attacker '
            'compromises a public-facing web server, that compromise '
            'stays contained in the DMZ rather than becoming an '
            'immediate foothold into payroll systems, HR databases, or '
            'anything else sensitive sitting deeper in the network.',
      ),
      LessonSection(
        heading: 'Microsegmentation: Taking the Idea Further',
        body:
            'Traditional segmentation divides a network into a handful '
            'of large zones. Microsegmentation, increasingly common in '
            'modern data centers and cloud environments, applies '
            'fine-grained access controls between individual workloads '
            'or even individual applications — so that even two servers '
            'sitting in the "same" logical segment still can\'t freely '
            'communicate unless a specific rule permits it. This '
            'dramatically limits how far an attacker can move laterally '
            'even after successfully compromising one system, and is a '
            'core building block of the Zero Trust architecture you\'ll '
            'encounter later in this course.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Ports, Protocols & Services',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Ports: The Doors on Every Device',
        body:
            'An IP address gets traffic to the right device, but a '
            'single device often runs many different services '
            'simultaneously — a web server, an email server, a remote '
            'administration service — all listening at the same time. '
            'Ports solve this by acting as numbered doors: each service '
            'listens on a specific port number, and incoming traffic '
            'specifies which port it wants to reach. Every open port '
            'represents a potential entry point, which is exactly why '
            'reducing the number of unnecessarily open ports is one of '
            'the most fundamental hardening practices in all of network '
            'security.',
      ),
      LessonSection(
        heading: 'Ports Every Security Professional Should Recognize',
        bullets: [
          'Port 21 — FTP, an unencrypted file transfer protocol; avoid it in favor of encrypted alternatives',
          'Port 22 — SSH, encrypted remote administration; the standard for securely managing Linux servers',
          'Port 25 — SMTP, the protocol mail servers use to relay email; should be tightly restricted when exposed externally',
          'Port 53 — DNS, used for both UDP and TCP traffic; frequently targeted for both spoofing and data exfiltration via tunneling',
          'Port 80 — HTTP, unencrypted web traffic; production sites should redirect this to HTTPS',
          'Port 443 — HTTPS, encrypted web traffic protected by TLS; the standard for virtually all modern web services',
          'Port 445 — SMB, Windows file sharing; a frequent vector for ransomware propagation, including the infamous WannaCry outbreak',
          'Port 3389 — RDP, Windows Remote Desktop Protocol; one of the most heavily targeted ports for brute-force attacks when exposed directly to the internet',
        ],
      ),
      LessonSection(
        heading: 'Port Scanning: A Tool Used by Both Sides',
        body:
            'Tools like nmap systematically probe a target system or '
            'network to discover which ports are open and what services '
            'are listening on them. Attackers use port scanning during '
            'reconnaissance to map out potential entry points before '
            'launching an attack. Defenders use the exact same technique '
            'proactively, scanning their own infrastructure regularly to '
            'catch unexpected open ports before an attacker does — '
            'finding your own port 3389 exposed to the internet during a '
            'routine internal scan is a far better outcome than an '
            'attacker finding it first.',
      ),
      LessonSection(
        heading: 'The Principle of Minimizing Exposed Services',
        body:
            'A useful mental model: every open port that doesn\'t '
            'strictly need to be open is pure risk with no corresponding '
            'benefit. A server exposing an old, unused FTP service that '
            'nobody actually uses anymore isn\'t providing any value — '
            'it\'s purely giving an attacker one more thing to try. This '
            'is the network-level expression of the broader "reduce the '
            'attack surface" principle you encountered in the '
            'fundamentals module.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Firewalls, Routers & Network Devices',
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Routers: Getting Traffic Between Networks',
        body:
            'A router\'s core job is forwarding traffic between different '
            'networks based on the destination IP address, using a '
            'routing table that essentially answers the question "which '
            'direction should this packet go to eventually reach its '
            'destination?" Your home router connects your internal '
            'network to your internet service provider; enterprise '
            'routers connect entire office networks to each other and to '
            'the wider internet.',
      ),
      LessonSection(
        heading: 'Switches: Efficient Local Delivery',
        body:
            'Within a single local network, switches connect individual '
            'devices and forward traffic intelligently — sending data '
            'only to the specific port where the intended recipient '
            'device is connected, rather than broadcasting it to every '
            'device on the network. Modern managed switches also support '
            'VLANs (Virtual LANs), letting a single piece of physical '
            'hardware carry multiple logically isolated networks '
            'simultaneously, which is a common and cost-effective way to '
            'implement segmentation without needing separate physical '
            'switches for every zone.',
      ),
      LessonSection(
        heading: 'Firewalls: From Simple Filters to Deep Inspection',
        body:
            'Firewall technology has evolved considerably. The earliest '
            'packet-filtering firewalls made simple allow/deny decisions '
            'based only on basic packet headers — source, destination, '
            'and port — with no awareness of the broader connection. '
            'Stateful firewalls improved on this by tracking the state '
            'of active connections, correctly allowing return traffic for '
            'connections that were legitimately established. Modern '
            'Next-Generation Firewalls (NGFWs) go much further, '
            'inspecting traffic at the application layer, integrating '
            'threat intelligence feeds, and incorporating intrusion '
            'prevention capability directly into the firewall itself.',
      ),
      LessonSection(
        heading: 'Web Application Firewalls: A Specialized Layer',
        body:
            'A Web Application Firewall (WAF) is purpose-built to '
            'protect HTTP and HTTPS traffic specifically, defending '
            'against application-layer attacks like SQL injection and '
            'cross-site scripting that a traditional network firewall — '
            'focused on ports and IP addresses — simply isn\'t designed '
            'to recognize. WAFs sit in front of web applications and '
            'analyze the actual content of requests, not just their '
            'network-level characteristics.',
      ),
      LessonSection(
        heading: 'IDS and IPS: Watching and Acting',
        body:
            'An Intrusion Detection System (IDS) passively monitors '
            'network traffic for patterns matching known attack '
            'signatures or unusual behavior, generating alerts for a '
            'human or automated system to review — but it takes no '
            'direct action itself. An Intrusion Prevention System (IPS) '
            'sits inline with the actual traffic flow and can '
            'automatically block malicious traffic the instant it\'s '
            'detected, before it ever reaches its target. The trade-off '
            'is that an IPS blocking traffic automatically carries more '
            'risk of disrupting legitimate traffic if its detection isn\'t '
            'perfectly tuned, which is why many organizations run new '
            'detection rules in IDS (alert-only) mode before promoting '
            'them to active IPS blocking.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'DNS Architecture & Security',
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'DNS: The Internet\'s Directory Service',
        body:
            'The Domain Name System translates human-friendly domain '
            'names into the numeric IP addresses that computers actually '
            'use to communicate. Without DNS, you\'d need to memorize '
            'strings of numbers instead of typing a memorable web '
            'address — which is exactly how the internet worked in its '
            'earliest days, and exactly why DNS was invented to solve '
            'that problem at scale.',
      ),
      LessonSection(
        heading: 'How a DNS Lookup Actually Resolves',
        body:
            'When your device needs to resolve a domain name, it '
            'typically asks a recursive resolver — often your ISP\'s '
            'server or a public one like 8.8.8.8 — which then works '
            'through a hierarchy on your behalf.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Root Server', 'TLD Server', 'Authoritative Server', 'Answer'],
          caption: 'A recursive resolver walks this hierarchy on your '
              'behalf every time a domain name needs to be resolved.',
        ),
      ),
      LessonSection(
        heading: 'DNS Cache Poisoning',
        body:
            'Because DNS responses are cached to improve performance, an '
            'attacker who successfully injects a false record into a '
            'resolver\'s cache can silently redirect every subsequent '
            'user of that resolver toward an attacker-controlled server '
            'instead of the legitimate one — potentially for hours or '
            'days before the poisoned entry expires. This is one of the '
            'most consequential DNS attacks precisely because it affects '
            'every user relying on that resolver, not just one victim.',
      ),
      LessonSection(
        heading: 'DNS Tunneling',
        body:
            'DNS traffic is so fundamental to normal internet operation '
            'that many firewalls allow it through with minimal '
            'inspection by default. Attackers exploit this trust by '
            'encoding stolen data — or command-and-control instructions '
            '— inside DNS queries and responses, effectively smuggling '
            'traffic through a channel that most security tools aren\'t '
            'watching closely. Detecting DNS tunneling typically requires '
            'looking for unusual patterns: abnormally long domain names, '
            'unusually high query volumes to a single domain, or DNS '
            'traffic to domains with no legitimate business reason to be '
            'queried.',
      ),
      LessonSection(
        heading: 'Typosquatting',
        body:
            'Attackers routinely register domains that are visually '
            'similar to popular, legitimate domains — swapping a letter, '
            'adding an extra character, or using a different top-level '
            'domain — hoping to catch users who mistype a URL or fall '
            'for a convincingly similar-looking link in a phishing email. '
            'Organizations increasingly monitor for typosquatted '
            'variants of their own domains being registered, since these '
            'are frequently used to impersonate the organization in '
            'phishing campaigns.',
      ),
      LessonSection(
        heading: 'Defensive Measures',
        bullets: [
          'DNSSEC — cryptographically signs DNS records so resolvers can verify responses haven\'t been tampered with in transit',
          'DNS over HTTPS (DoH) and DNS over TLS (DoT) — encrypt DNS queries themselves, preventing eavesdropping or on-path tampering',
          'DNS filtering — blocking lookups to known-malicious domains before a connection is ever established, often using continuously updated threat intelligence feeds',
          'Monitoring query patterns — flagging abnormal volumes or unusual domain characteristics that suggest tunneling or beaconing activity',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'VPNs, TLS & Encryption in Transit',
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'TLS: The Encryption Behind Every Padlock Icon',
        body:
            'Transport Layer Security (TLS) is the protocol responsible '
            'for encrypting the vast majority of traffic on the modern '
            'internet — it\'s the "S" in HTTPS. A TLS connection begins '
            'with a handshake that uses asymmetric encryption to '
            'securely negotiate a shared symmetric key, then switches to '
            'fast symmetric encryption for the actual data being '
            'exchanged during the session — the same combination of '
            'techniques you learned about in the cryptography lesson, '
            'applied directly to real-world network traffic. TLS 1.3, '
            'the current version, streamlined this handshake '
            'considerably and removed several older, weaker cipher '
            'options that had accumulated over the protocol\'s history.',
      ),
      LessonSection(
        heading: 'What a VPN Actually Provides',
        body:
            'A Virtual Private Network creates an encrypted tunnel '
            'between a client device and a VPN server, protecting '
            'traffic traveling across networks that can\'t be trusted — '
            'public Wi-Fi at a coffee shop, a hotel network, or simply '
            'an employee\'s home internet connection reaching back into '
            'a corporate network. Beyond individual remote access, '
            'site-to-site VPNs also connect entire office locations '
            'together over the public internet as if they shared a '
            'single private network.',
      ),
      LessonSection(
        heading: 'Modern VPN Protocols',
        bullets: [
          'OpenVPN — mature, open-source, and highly configurable; a long-standing industry standard',
          'WireGuard — a newer protocol with a dramatically smaller codebase, faster performance, and modern cryptography; increasingly the preferred choice for new deployments',
          'IPsec — widely used specifically for site-to-site VPN connections between office locations',
          'Legacy protocols — PPTP is cryptographically broken and should never be used; L2TP paired with IPsec remains acceptable',
        ],
      ),
      LessonSection(
        heading: 'What a VPN Does Not Protect Against',
        body:
            'It\'s important to understand the limits of what a VPN '
            'actually secures. A VPN protects data while it\'s in '
            'transit between your device and the VPN server — but it '
            'does absolutely nothing to protect against malware already '
            'running on your device, phished credentials being used '
            'directly against a cloud service, or a malicious website '
            'you visit through the VPN tunnel. Thinking of a VPN as a '
            'complete security solution rather than one specific layer '
            'in a broader defense strategy is one of the more common '
            'misconceptions even among relatively technical users.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Wireless Network Security',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Evolution of Wi-Fi Security Standards',
        body:
            'Wireless security has gone through several generations, '
            'each one addressing serious flaws discovered in its '
            'predecessor. WEP, the original standard, uses encryption '
            'that can be cryptographically broken in minutes with '
            'freely available tools and should never be used under any '
            'circumstances today. WPA and WPA2 with TKIP encryption '
            'improved things substantially but have since been '
            'deprecated in favor of WPA2 with AES (also called CCMP), '
            'which remains widely deployed and generally acceptable. '
            'WPA3, the current standard, is now required on newly '
            'certified devices and adds meaningful protections beyond '
            'WPA2.',
      ),
      LessonSection(
        heading: 'What Makes WPA3 a Real Improvement',
        body:
            'WPA3\'s most significant enhancement is forward secrecy, '
            'delivered through a key exchange method called Simultaneous '
            'Authentication of Equals (SAE). Forward secrecy means that '
            'even if an attacker later obtains the network password, '
            'they still cannot decrypt traffic they captured in the '
            'past — each session\'s encryption keys are derived in a way '
            'that doesn\'t depend solely on the static password. WPA2, by '
            'contrast, is vulnerable to exactly this scenario: capture '
            'encrypted traffic today, obtain the password later, decrypt '
            'everything retroactively.',
      ),
      LessonSection(
        heading: 'Evil Twin Attacks',
        body:
            'An Evil Twin attack involves an attacker setting up a '
            'rogue wireless access point broadcasting the exact same '
            'network name (SSID) as a legitimate, trusted network — a '
            'coffee shop\'s Wi-Fi, for example. Devices that '
            'automatically reconnect to previously known network names '
            'may connect to the attacker\'s access point without any '
            'obvious indication to the user, at which point all their '
            'traffic passes through the attacker\'s equipment, ready for '
            'interception.',
      ),
      LessonSection(
        heading: 'Deauthentication Attacks',
        body:
            'Because the original Wi-Fi management frame specification '
            'wasn\'t designed with strong authentication in mind, '
            'attackers can send forged deauthentication frames that '
            'forcibly disconnect a victim\'s device from a legitimate '
            'access point. This is often used as a setup step for other '
            'attacks — forcing a device to reconnect gives the attacker '
            'an opportunity to capture the handshake used to authenticate '
            'that reconnection, which can then potentially be attacked '
            'offline to recover the network password.',
      ),
      LessonSection(
        heading: 'Enterprise Wireless Best Practices',
        bullets: [
          'Use WPA3, or at minimum WPA2 with AES — never WEP or WPA-TKIP',
          'Separate guest Wi-Fi networks entirely from internal corporate networks',
          'Use 802.1X authentication with a RADIUS server for enterprise deployments, giving each user their own unique credentials rather than one shared pre-shared key everyone knows',
          'Treat public and untrusted Wi-Fi networks as inherently hostile, using a VPN for any sensitive activity conducted over them',
        ],
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Common Network Attacks & Defenses',
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'Man-in-the-Middle Attacks',
        body:
            'A man-in-the-middle attack occurs when an adversary secretly '
            'positions themselves between two communicating parties, '
            'intercepting — and potentially altering — traffic while '
            'both legitimate parties believe they\'re communicating '
            'directly with each other. This can happen through ARP '
            'spoofing on a local network, a compromised or malicious '
            'Wi-Fi access point, or a compromised router along the '
            'traffic\'s path. Properly implemented end-to-end encryption '
            'is the primary defense — even if traffic is intercepted, an '
            'attacker without the decryption key sees only meaningless '
            'ciphertext.',
      ),
      LessonSection(
        heading: 'ARP Spoofing',
        body:
            'The Address Resolution Protocol maps IP addresses to '
            'physical MAC addresses on a local network — but it wasn\'t '
            'designed with any authentication built in. An attacker can '
            'send forged ARP replies claiming that their own MAC address '
            'corresponds to a legitimate IP address, such as the '
            'network\'s default gateway. Devices that believe this forged '
            'mapping start sending their traffic through the attacker\'s '
            'machine instead of the real gateway, without any obvious '
            'sign anything is wrong. Managed switches with dynamic ARP '
            'inspection can detect and block this kind of forgery.',
      ),
      LessonSection(
        heading: 'Distributed Denial of Service (DDoS)',
        body:
            'A DDoS attack overwhelms a target with traffic from many '
            'sources simultaneously, exhausting its capacity to respond '
            'to legitimate requests. Volumetric attacks simply try to '
            'consume all available bandwidth. Protocol attacks, like SYN '
            'floods, exploit weaknesses in how connections are '
            'established — sending a flood of SYN packets and never '
            'completing the handshake, exhausting the server\'s '
            'connection table. Application-layer attacks target specific '
            'resource-intensive operations within an application itself, '
            'requiring far less raw traffic volume to cause real damage. '
            'Defenses include traffic scrubbing services, rate limiting, '
            'content delivery networks that absorb and distribute load, '
            'and anycast routing that spreads traffic across many '
            'geographically distributed servers.',
      ),
      LessonSection(
        heading: 'Packet Sniffing',
        body:
            'Capturing network traffic as it passes by is trivially easy '
            'with widely available tools, and on an unencrypted '
            'connection, a captured packet reveals its full contents — '
            'potentially including passwords, session tokens, or '
            'sensitive personal data. On a properly encrypted connection, '
            'the same capture yields only unreadable ciphertext. This is '
            'perhaps the single clearest illustration of why encrypting '
            'traffic in transit is non-negotiable for any data that '
            'matters.',
      ),
      LessonSection(
        heading: 'Bringing the Defensive Principles Together',
        bullets: [
          'Deny by default — block everything not explicitly required, rather than trying to individually block every known-bad thing',
          'Encrypt in transit — treat every network as potentially hostile, even internal ones',
          'Segment — limit how far any single compromise can spread',
          'Monitor continuously — detect anomalies before they escalate into full incidents',
          'Patch regularly — network devices run software too, and that software has vulnerabilities like anything else',
        ],
      ),
    ],
  ),

  // 11 ----------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'What is the purpose of network segmentation?',
        options: [
          'To make DNS queries faster',
          'To limit lateral movement if one part of the network is compromised',
          'To increase bandwidth',
          'To replace firewalls',
        ],
        correctIndex: 1,
        explanation: 'Segmentation contains breaches by isolating different parts of the network.',
      ),
      QuizQuestion(
        question: 'Which port is associated with RDP and frequently brute-forced when exposed to the internet?',
        options: ['22', '443', '3389', '53'],
        correctIndex: 2,
        explanation: 'Port 3389 is Windows Remote Desktop Protocol — a very common brute-force target.',
      ),
      QuizQuestion(
        question: 'An attacker injects false DNS records into a resolver cache to redirect users. This is:',
        options: ['ARP spoofing', 'DNS cache poisoning', 'DNS tunneling', 'IP spoofing'],
        correctIndex: 1,
        explanation: 'DNS cache poisoning corrupts resolver records to redirect lookups to attacker-controlled IPs.',
      ),
      QuizQuestion(
        question: 'WPA3 improves on WPA2 primarily by providing:',
        options: [
          'No password requirement',
          'Forward secrecy so past traffic cannot be decrypted if the key is later compromised',
          'Faster Wi-Fi speeds',
          'Automatic device pairing',
        ],
        correctIndex: 1,
        explanation: 'WPA3 SAE provides forward secrecy protecting past sessions even if credentials are later exposed.',
      ),
      QuizQuestion(
        question: 'An Evil Twin attack involves:',
        options: [
          'Cloning a user account',
          'A rogue Wi-Fi hotspot mimicking a legitimate network to intercept traffic',
          'IP address duplication',
          'MAC address spoofing on a switch',
        ],
        correctIndex: 1,
        explanation: 'An Evil Twin AP copies a legitimate network name to intercept connecting devices.',
      ),
      QuizQuestion(
        question: 'A WAF specifically protects against:',
        options: [
          'Physical network cable tapping',
          'HTTP/S application-layer attacks like SQL injection and XSS',
          'Wi-Fi authentication failures',
          'DNS amplification',
        ],
        correctIndex: 1,
        explanation: 'A WAF inspects HTTP/S traffic to block application-layer attacks.',
      ),
      QuizQuestion(
        question: 'TCP differs from UDP primarily because TCP:',
        options: [
          'Is faster',
          'Establishes a connection and guarantees delivery of every packet',
          'Uses smaller packet sizes',
          'Does not use IP addresses',
        ],
        correctIndex: 1,
        explanation: 'TCP is reliable and connection-oriented; UDP is fast and connectionless.',
      ),
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
      QuizQuestion(
        question: 'A DMZ in network architecture is used to:',
        options: [
          'Store encryption keys',
          'Isolate public-facing servers from both the internet and internal systems',
          'Block all inbound traffic',
          'Host employee workstations',
        ],
        correctIndex: 1,
        explanation: 'A DMZ puts public-facing services in a segment isolated from the internal network.',
      ),
      QuizQuestion(
        question: 'Which network device makes forwarding decisions based on MAC addresses within the same LAN?',
        options: ['Router', 'Switch', 'Firewall', 'IPS'],
        correctIndex: 1,
        explanation: 'Switches forward traffic within a LAN segment based on MAC addresses.',
      ),
      QuizQuestion(
        question: 'Private IP address ranges are:',
        options: [
          'Routable on the public internet',
          'Used only within local networks and not directly reachable from the internet',
          'Assigned by ISPs only',
          'Only used by servers',
        ],
        correctIndex: 1,
        explanation: 'Private IP ranges are reserved for internal use and require NAT to reach the internet.',
      ),
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
      QuizQuestion(
        question: 'Which OSI layer handles IP addressing and routing?',
        options: ['Layer 2 Data Link', 'Layer 3 Network', 'Layer 4 Transport', 'Layer 7 Application'],
        correctIndex: 1,
        explanation: 'The Network layer (L3) handles IP addressing and routing between networks.',
      ),
      QuizQuestion(
        question: 'DNSSEC provides:',
        options: [
          'Encrypted DNS queries',
          'Cryptographic verification that DNS responses have not been tampered with',
          'Faster DNS resolution',
          'Automatic domain registration',
        ],
        correctIndex: 1,
        explanation: 'DNSSEC signs DNS records so receivers can verify their authenticity.',
      ),
      QuizQuestion(
        question: 'A SYN flood attack targets which TCP mechanism?',
        options: [
          'The DNS lookup',
          'The three-way handshake by sending many SYN packets without completing connections',
          'The TLS certificate',
          'The routing table',
        ],
        correctIndex: 1,
        explanation: 'SYN floods exhaust server resources by initiating but never completing TCP handshakes.',
      ),
      QuizQuestion(
        question: 'IPv6 was introduced primarily to solve:',
        options: [
          'Lack of encryption in IPv4',
          'IPv4 address exhaustion',
          'DNS scalability issues',
          'Wi-Fi security weaknesses',
        ],
        correctIndex: 1,
        explanation: 'IPv6 provides virtually unlimited addresses to replace the exhausted IPv4 space.',
      ),
      QuizQuestion(
        question: 'What does ARP spoofing allow an attacker to do?',
        options: [
          'Redirect DNS queries',
          'Associate their MAC with a legitimate IP to intercept local network traffic',
          'Disable firewalls remotely',
          'Bypass TLS encryption',
        ],
        correctIndex: 1,
        explanation: 'ARP spoofing poisons the ARP cache to redirect LAN traffic through the attacker.',
      ),
      QuizQuestion(
        question: 'Port 443 is used for:',
        options: ['Unencrypted web traffic', 'Encrypted HTTPS web traffic', 'SSH remote access', 'DNS queries'],
        correctIndex: 1,
        explanation: 'Port 443 is the standard port for HTTPS traffic encrypted with TLS.',
      ),
      QuizQuestion(
        question: 'A VPN does NOT protect against:',
        options: [
          'Packet sniffing on public Wi-Fi',
          'Eavesdropping on untrusted networks',
          'Phished credentials used to log directly into a cloud application',
          'Traffic interception at a coffee shop',
        ],
        correctIndex: 2,
        explanation: 'A VPN protects data in transit but does nothing if an attacker has valid stolen credentials.',
      ),
      QuizQuestion(
        question: 'Subnetting a network primarily helps security by:',
        options: [
          'Increasing internet speed',
          'Reducing the number of IP addresses needed',
          'Isolating network segments to limit attack blast radius',
          'Enabling faster DNS resolution',
        ],
        correctIndex: 2,
        explanation: 'Subnetting isolates groups of devices limiting how far an attacker can move laterally.',
      ),
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
      QuizQuestion(
        question: 'Which tool do attackers and defenders both use to discover open ports on a system?',
        options: ['Wireshark', 'nmap', 'Metasploit', 'Burp Suite'],
        correctIndex: 1,
        explanation: 'nmap is the standard port scanning tool used for both offensive and defensive enumeration.',
      ),
      QuizQuestion(
        question: 'A next-generation firewall (NGFW) adds what capability over a standard stateful firewall?',
        options: [
          'Higher port numbers',
          'Application-layer inspection, threat intelligence and IPS integration',
          'Faster hardware',
          'IPv6 support',
        ],
        correctIndex: 1,
        explanation: 'NGFWs inspect application content not just ports and addresses.',
      ),
      QuizQuestion(
        question: 'The three-way TCP handshake is: SYN then SYN-ACK then:',
        options: ['FIN', 'RST', 'ACK', 'DATA'],
        correctIndex: 2,
        explanation: 'The TCP three-way handshake is SYN then SYN-ACK then ACK, establishing a reliable connection.',
      ),
      QuizQuestion(
        question: 'Network monitoring is valuable for security because:',
        options: [
          'It automatically patches systems',
          'It reveals anomalous traffic patterns that may indicate an attack',
          'It encrypts all traffic',
          'It blocks all inbound connections',
        ],
        correctIndex: 1,
        explanation: 'Monitoring detects deviations from normal behavior that can signal an active attack.',
      ),
    ],
  ),
];
