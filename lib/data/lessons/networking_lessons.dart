import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> networkingLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Enterprise Network Communication & Architecture',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Why Networking Is Inseparable From Security',
        body:
            'Enterprise networking enables users, applications, servers, '
            'cloud services, and security platforms to exchange '
            'information efficiently and securely. Every authentication '
            'request, email, database query, and cloud transaction '
            'relies on network communication underneath it. As '
            'organizations continue adopting hybrid and multi-cloud '
            'environments, networking has become genuinely inseparable '
            'from cybersecurity.',
      ),
      LessonSection(
        heading: 'How Enterprise Communication Actually Works',
        body:
            'When a user accesses a website or signs in to a cloud '
            'application, the information is divided into packets, '
            'transmitted through multiple networking devices, inspected '
            'by security controls along the way, and reassembled at its '
            'destination. Unlike small office environments, enterprise '
            'networks contain multiple security layers designed to '
            'preserve confidentiality, integrity, and availability while '
            'maintaining business continuity.',
      ),
      LessonSection(
        heading: 'The Core Components Involved',
        bullets: [
          'Endpoints — laptops, desktops, and mobile devices',
          'Switches and routers — moving traffic within and between networks',
          'Firewalls — inspecting and filtering traffic against policy',
          'Load balancers — distributing traffic across multiple servers',
          'Wireless access points — enterprise Wi-Fi connectivity',
          'VPN gateways — securing remote and site-to-site connections',
          'Cloud connectivity — links out to cloud-hosted infrastructure',
          'Servers and identity services — the actual resources and authentication backbone being protected',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_1_communication_workflow.jpg',
          caption:
              'Enterprise network communication path illustrating how '
              'traffic flows through multiple security and networking '
              'devices before reaching business resources.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight: Traffic Gets Inspected More Than Once',
        body:
            'In large organizations, traffic is inspected multiple times '
            'before ever reaching internal resources. Next-generation '
            'firewalls, intrusion prevention systems, secure web '
            'gateways, and endpoint protection platforms all work '
            'together — this is Defense in Depth applied directly to '
            'network design: if one control fails, additional layers '
            'continue protecting organizational assets.',
      ),
      LessonSection(
        heading: 'Enterprise Network Architecture: Zones, Not One Flat Network',
        body:
            'An enterprise network is designed to support business '
            'operations while protecting critical assets from '
            'unauthorized access. Rather than connecting every device to '
            'a single flat network, organizations divide infrastructure '
            'into logical security zones — improving performance, '
            'simplifying administration, and significantly reducing the '
            'impact of cyberattacks by limiting lateral movement.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_2_enterprise_architecture.jpg',
          caption:
              'Typical enterprise network architecture showing network '
              'zones, trust boundaries, and connectivity between '
              'on-premises and cloud environments.',
        ),
      ),
      LessonSection(
        heading: 'Network Zones',
        bullets: [
          'Internet — public connectivity for external users',
          'DMZ — public-facing services: web, email, DNS',
          'Internal LAN — employee devices: workstations, printers',
          'Server network — business applications: databases, file servers',
          'Management network — administrative systems: switches, routers, hypervisors',
          'Guest network — visitor access, internet-only devices',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Separating users, servers, management systems, and '
            'public-facing applications into dedicated security zones '
            'significantly reduces an attacker\'s ability to move '
            'laterally after an initial compromise.',
      ),
      LessonSection(
        heading: 'Real-World Case Study: The Target Data Breach (2013)',
        body:
            'Attackers initially compromised a third-party HVAC vendor '
            'and used stolen credentials to gain access to Target\'s '
            'corporate network. Due to inadequate network segmentation, '
            'they moved laterally into the payment card environment, '
            'ultimately stealing payment card information belonging to '
            'approximately 40 million customers.',
      ),
      LessonSection(
        heading: 'Lessons Learned',
        bullets: [
          'Segment critical systems',
          'Restrict third-party access',
          'Monitor east-west (internal, lateral) network traffic',
          'Implement least-privilege access',
          'Continuously monitor privileged accounts',
        ],
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Network Devices & the OSI Model',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Choosing and Placing Devices Correctly',
        body:
            'Enterprise networks rely on specialized devices that '
            'perform distinct communication and security functions. '
            'Selecting the appropriate device and placing it correctly '
            'within the architecture is essential for maintaining '
            'network availability, scalability, and security together.',
      ),
      LessonSection(
        heading: 'Best Practices for Enterprise Networking',
        bullets: [
          'Implement network segmentation using VLANs',
          'Apply the principle of least privilege to network access',
          'Restrict administrative access through dedicated management networks',
          'Protect remote access using multi-factor authentication (MFA)',
          'Regularly review firewall rules and remove obsolete entries',
          'Monitor network traffic continuously using centralized logging and security monitoring platforms',
        ],
      ),
      LessonSection(
        heading: 'Understanding the OSI Reference Model',
        body:
            'The Open Systems Interconnection (OSI) Reference Model is a '
            'conceptual framework that standardizes how data is '
            'transmitted between devices across a network. Although '
            'modern enterprise networks use the TCP/IP protocol suite, '
            'the OSI model remains one of the most valuable tools for '
            'understanding network communication, troubleshooting '
            'connectivity issues, and implementing security controls. '
            'Each layer performs a specific function and communicates '
            'with the corresponding layer on another device.',
      ),
      LessonSection(
        heading: 'The Seven Layers of the OSI Model',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_4_osi_model.jpg',
          caption:
              'The OSI model separates network communication into seven '
              'logical layers, enabling standardized communication, '
              'troubleshooting, and security implementation.',
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Layer', 'Name', 'Primary Function', 'Example Protocols', 'Security Controls'],
          tableRows: [
            ['7', 'Application', 'User interaction with applications', 'HTTP, HTTPS, SMTP', 'WAF, Secure Email Gateway'],
            ['6', 'Presentation', 'Data formatting and encryption', 'TLS, SSL', 'Encryption'],
            ['5', 'Session', 'Session establishment and termination', 'NetBIOS, RPC', 'Session Monitoring'],
            ['4', 'Transport', 'Reliable data delivery', 'TCP, UDP', 'Stateful Firewalls'],
            ['3', 'Network', 'Routing and logical addressing', 'IP, ICMP', 'ACLs, Routers'],
            ['2', 'Data Link', 'Physical addressing', 'Ethernet, ARP', 'VLANs, NAC'],
            ['1', 'Physical', 'Transmission of bits', 'Fiber, Copper', 'Physical Security'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Although the OSI model is conceptual, enterprise security '
            'teams frequently use it during incident response and '
            'troubleshooting. Packet loss may indicate a Layer 1 or '
            'Layer 2 issue, whereas failed web access may point to a '
            'Layer 7 problem. Security technologies such as firewalls, '
            'intrusion prevention systems, and web application firewalls '
            'are also mapped to specific OSI layers.',
      ),
      LessonSection(
        heading: 'Common Threats by OSI Layer',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Layer', 'Common Threats'],
          tableRows: [
            ['Application', 'SQL Injection, Cross-Site Scripting (XSS), Malware'],
            ['Presentation', 'Weak Encryption, Certificate Misconfiguration'],
            ['Session', 'Session Hijacking'],
            ['Transport', 'SYN Flood, TCP Session Reset'],
            ['Network', 'IP Spoofing, Route Manipulation'],
            ['Data Link', 'ARP Poisoning, MAC Flooding'],
            ['Physical', 'Cable Tampering, Device Theft'],
          ],
        ),
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'The TCP/IP Protocol Suite & Data Encapsulation',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'TCP/IP: The Practical Implementation',
        body:
            'The Transmission Control Protocol/Internet Protocol '
            '(TCP/IP) suite forms the foundation of modern networking. '
            'Unlike the OSI model, which is conceptual, TCP/IP is the '
            'practical implementation actually used by the internet and '
            'enterprise networks. The TCP/IP model consists of four '
            'layers — Application, Transport, Internet, and Network '
            'Access — each performing a defined role while interacting '
            'with the layers above and below it.',
      ),
      LessonSection(
        heading: 'The Four TCP/IP Layers',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_5_tcpip_suite.jpg',
          caption: 'The TCP/IP model provides the practical framework used for modern internet and enterprise communication.',
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['TCP/IP Layer', 'Purpose', 'Common Protocols', 'Security Technologies'],
          tableRows: [
            ['Application', 'User services', 'HTTP, HTTPS, FTP, SMTP, DNS', 'Secure Web Gateway, WAF'],
            ['Transport', 'End-to-end communication', 'TCP, UDP', 'Stateful Firewall'],
            ['Internet', 'Routing', 'IPv4, IPv6, ICMP', 'Router ACLs'],
            ['Network Access', 'Local communication', 'Ethernet, Wi-Fi', 'VLANs, NAC'],
          ],
        ),
      ),
      LessonSection(
        heading: 'OSI Model vs. TCP/IP Model',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'OSI Model', 'TCP/IP Model'],
          tableRows: [
            ['Layers', '7', '4'],
            ['Purpose', 'Reference model', 'Practical implementation'],
            ['Developed By', 'ISO', 'DARPA'],
            ['Usage', 'Learning and troubleshooting', 'Internet communication'],
            ['Adoption', 'Conceptual', 'Universal'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Data Encapsulation and Decapsulation',
        body:
            'When data is transmitted across a network, each OSI or '
            'TCP/IP layer adds its own header information before '
            'passing the data to the next layer — this process is known '
            'as encapsulation. At the receiving device, those headers '
            'are removed in reverse order through decapsulation, '
            'allowing the original data to be reconstructed.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_6_encapsulation.jpg',
          caption:
              'Data is progressively encapsulated with protocol headers '
              'before transmission and decapsulated at the receiving endpoint.',
        ),
      ),
      LessonSection(
        heading: 'Why Encapsulation Matters',
        bullets: [
          'Reliable communication',
          'Routing across multiple networks',
          'Error detection',
          'Flow control',
          'Secure transmission',
          'Interoperability between different network technologies',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Protocols, DNS & DHCP',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Standardized Protocols Keep Enterprises Running',
        body:
            'Modern enterprise environments rely on standardized '
            'protocols to deliver network services securely and '
            'efficiently — recognizing each one, its default port, and '
            'its transport layer is foundational for reading firewall '
            'rules, packet captures, and security alerts.',
      ),
      LessonSection(
        heading: 'Protocols, Ports, and Transport',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Protocol', 'Default Port', 'Transport', 'Purpose'],
          tableRows: [
            ['HTTP', '80', 'TCP', 'Web browsing'],
            ['HTTPS', '443', 'TCP', 'Secure web communication'],
            ['SSH', '22', 'TCP', 'Secure remote administration'],
            ['RDP', '3389', 'TCP', 'Remote desktop access'],
            ['DNS', '53', 'TCP/UDP', 'Name resolution'],
            ['DHCP', '67/68', 'UDP', 'Dynamic IP addressing'],
            ['SMTP', '25', 'TCP', 'Email transmission'],
            ['IMAPS', '993', 'TCP', 'Secure email retrieval'],
            ['SNMPv3', '161', 'UDP', 'Secure network management'],
            ['LDAP', '389', 'TCP', 'Directory services'],
            ['LDAPS', '636', 'TCP', 'Secure directory services'],
            ['NTP', '123', 'UDP', 'Time synchronization'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Organizations increasingly disable insecure legacy '
            'protocols such as Telnet and FTP, replacing them with '
            'encrypted alternatives such as SSH, SFTP, and HTTPS. This '
            'reduces the risk of credential interception and protects '
            'sensitive information during transmission.',
      ),
      LessonSection(
        heading: 'DNS: Turning Names Into Addresses',
        body:
            'The Domain Name System translates human-readable domain '
            'names into IP addresses, enabling users to access resources '
            'without memorizing numerical addresses.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_7_dns_resolution.jpg',
          caption: 'The DNS resolution workflow, from typing a name to actually reaching the server behind it.',
        ),
      ),
      LessonSection(
        heading: 'DHCP: Automatic Address Assignment',
        body:
            'The Dynamic Host Configuration Protocol automatically '
            'assigns IP addresses and network configuration settings to '
            'devices, simplifying network administration and reducing '
            'configuration errors.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_8_dhcp_lease.jpg',
          caption: 'The DHCP lease process — often abbreviated DORA (Discover, Offer, Request, Acknowledge).',
        ),
      ),
      LessonSection(
        heading: 'DNS and DHCP Best Practices',
        bullets: [
          'Deploy redundant DNS servers',
          'Restrict unauthorized DHCP servers',
          'Secure DNS infrastructure using DNSSEC where appropriate',
          'Monitor DNS logs for suspicious activity',
          'Regularly review DHCP scopes and lease durations',
        ],
      ),
      LessonSection(
        heading: 'Real-World Scenario: DNS Misconfiguration',
        body:
            'A global retailer experienced a major outage after an '
            'incorrect DNS record update prevented customers from '
            'reaching its e-commerce platform. Although the servers '
            'remained operational, incorrect name resolution rendered '
            'the application unavailable. Implementing change '
            'management, redundant DNS infrastructure, and automated '
            'validation could have prevented the incident.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Network Segmentation, NAT & PAT',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Why Segmentation Matters',
        body:
            'Modern enterprise networks are designed to minimize cyber '
            'risk by dividing infrastructure into logical security '
            'zones. Rather than placing every device on a single flat '
            'network, organizations create multiple isolated network '
            'segments that restrict communication between departments, '
            'business applications, and critical infrastructure — '
            'reducing the attack surface and significantly limiting an '
            'attacker\'s ability to move laterally after compromising a '
            'device.',
      ),
      LessonSection(
        heading: 'Without Segmentation vs. With It',
        body:
            'Without segmentation, malware can quickly spread throughout '
            'an organization. With properly configured VLANs, Access '
            'Control Lists, and internal firewalls, compromised systems '
            'instead remain isolated from critical business resources.',
      ),
      LessonSection(
        heading: 'Benefits of Segmentation',
        bullets: [
          'Limits lateral movement',
          'Improves performance',
          'Simplifies administration',
          'Protects sensitive systems',
          'Meets compliance requirements',
          'Improves monitoring and visibility',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_9_segmentation.jpg',
          caption: 'Logical segmentation prevents attackers from moving freely across enterprise networks.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight: Micro-Segmentation',
        body:
            'Micro-segmentation extends traditional VLAN-based '
            'segmentation by enforcing security policies at the '
            'workload or application level. Technologies such as VMware '
            'NSX, Cisco ACI, and software-defined networking (SDN) '
            'provide granular traffic control within data centers and '
            'cloud environments.',
      ),
      LessonSection(
        heading: 'Network Address Translation (NAT)',
        body:
            'NAT enables private IP addresses to communicate with '
            'external networks by translating them into public IP '
            'addresses. This conserves public IP space and hides '
            'internal addressing from external users.',
        bullets: [
          'Conserves IPv4 addresses',
          'Hides internal network structure',
          'Simplifies internet connectivity',
          'Supports basic network isolation',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/networking/fig_3_10_nat.jpg',
          caption: 'The NAT translation workflow — how a private internal address is mapped to a public address at the network edge.',
        ),
      ),
      LessonSection(
        heading: 'Port Address Translation (PAT)',
        body:
            'PAT allows multiple internal devices to share a single '
            'public IP address by using different source port numbers. '
            'PAT is commonly implemented in enterprise edge routers and '
            'firewalls.',
      ),
      LessonSection(
        heading: 'NAT vs. PAT',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'NAT', 'PAT'],
          tableRows: [
            ['Address Mapping', 'One-to-One', 'Many-to-One'],
            ['Public IP Requirement', 'Multiple', 'Single'],
            ['Enterprise Usage', 'Public Servers', 'Internet Access'],
            ['IPv4 Conservation', 'Moderate', 'Excellent'],
          ],
        ),
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'IP Subnetting',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 20,
    sections: [
      LessonSection(
        heading: 'Why Every Device Needs an Address',
        body:
            'Every computer, smartphone, printer, server, firewall, '
            'cloud instance, and IoT device connected to a network '
            'requires an address so that other devices know where to '
            'send information. This logical address is called an '
            'Internet Protocol (IP) address. Think of it as the digital '
            'equivalent of a postal address — routers and switches use '
            'destination IP addresses to deliver packets to the correct '
            'device, exactly as the postal service uses a street address '
            'to deliver a letter.',
      ),
      LessonSection(
        heading: 'Why IP Addressing Matters in Cybersecurity',
        body:
            'Cybersecurity professionals work with IP addresses every '
            'day. Firewall rules, VPN configurations, SIEM '
            'investigations, network segmentation, intrusion detection '
            'systems, and cloud security groups all depend on accurate '
            'IP addressing. A strong understanding helps security teams '
            'investigate malicious traffic, build secure firewall rules, '
            'design network segmentation, reduce attack surfaces, '
            'implement Zero Trust architectures, secure cloud networks, '
            'and analyze logs during incident response.',
      ),
      LessonSection(
        heading: 'Real-World Example',
        body:
            'A SOC analyst receives an alert indicating repeated login '
            'attempts from IP address 203.0.113.45 against an internal '
            'web server. Understanding IP addressing allows the analyst '
            'to determine whether the traffic is internal or external, '
            'identify the destination subnet, locate applicable firewall '
            'policies, detect lateral movement, and investigate the '
            'appropriate logs.',
      ),
      LessonSection(
        heading: 'What Is an IPv4 Address?',
        body:
            'IPv4 uses a 32-bit logical address represented as four '
            'decimal numbers (octets) separated by periods — for '
            'example, 192.168.10.25. Each octet ranges from 0 to 255.',
      ),
      LessonSection(
        heading: 'IPv4 in Binary',
        body:
            'Although humans prefer decimal notation, computers process '
            'IPv4 addresses as binary values. Each octet contains 8 '
            'bits, for a total of 32 bits. For example, 192.168.10.25 '
            'in binary is 11000000.10101000.00001010.00011001 — where '
            '192 breaks down as 128 + 64, using the binary place values '
            '128, 64, 32, 16, 8, 4, 2, 1.',
      ),
      LessonSection(
        heading: 'Understanding Network IDs and Host IDs',
        body:
            'An IPv4 address has two logical components: the Network ID '
            'identifies the network itself, and the Host ID identifies '
            'a specific device within that network. For example, with '
            'IP address 192.168.10.25 and subnet mask 255.255.255.0 '
            '(/24), the Network ID is 192.168.10.0 and the Host ID is '
            '25. Every device in the same subnet shares the same '
            'Network ID but must have a unique Host ID.',
      ),
      LessonSection(
        heading: 'IPv4 Address Classes',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Class', 'Address Range', 'Default Prefix', 'Typical Use'],
          tableRows: [
            ['A', '1.0.0.0 – 126.255.255.255', '/8', 'Very large organizations'],
            ['B', '128.0.0.0 – 191.255.255.255', '/16', 'Medium enterprises'],
            ['C', '192.0.0.0 – 223.255.255.255', '/24', 'Small business'],
            ['D', '224.0.0.0 – 239.255.255.255', 'Multicast', 'Streaming'],
            ['E', '240.0.0.0 – 255.255.255.255', 'Reserved', 'Research'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Public vs. Private IP Addresses',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Private Range', 'Prefix', 'Typical Use'],
          tableRows: [
            ['10.0.0.0 – 10.255.255.255', '/8', 'Large enterprise'],
            ['172.16.0.0 – 172.31.255.255', '/12', 'Medium organizations'],
            ['192.168.0.0 – 192.168.255.255', '/16', 'Home and small/medium business'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Most organizations use private IPv4 addresses internally '
            'and rely on NAT/PAT at the network perimeter to communicate '
            'with the internet — conserving public IPv4 addresses while '
            'reducing direct exposure of internal systems.',
      ),
      LessonSection(
        heading: 'The Step-by-Step Subnetting Method',
        bullets: [
          'Identify the number of required subnets or hosts',
          'Choose an appropriate CIDR prefix',
          'Determine the subnet mask',
          'Calculate the subnet increment (the "magic number")',
          'List all subnet network addresses',
          'Identify the broadcast address for each subnet',
          'Determine the usable host range',
        ],
      ),
      LessonSection(
        heading: 'The Magic Number Method',
        body:
            'The magic number is calculated by subtracting the '
            'interesting octet of the subnet mask from 256. For example, '
            'a /26 mask is 255.255.255.192, so the magic number is '
            '256 − 192 = 64. This means the subnet network addresses '
            'increase by 64 each time: 192.168.10.0, 192.168.10.64, '
            '192.168.10.128, 192.168.10.192.',
      ),
      LessonSection(
        heading: 'Worked Example 1: Divide a /24 Into Four Networks',
        body:
            'Network: 192.168.10.0/24. Requirement: four departments '
            'with approximately 50 hosts each. Solution: use /26.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Subnet', 'Usable Hosts', 'Broadcast', 'Department'],
          tableRows: [
            ['192.168.10.0/26', '1–62', '192.168.10.63', 'HR'],
            ['192.168.10.64/26', '65–126', '192.168.10.127', 'Finance'],
            ['192.168.10.128/26', '129–190', '192.168.10.191', 'IT'],
            ['192.168.10.192/26', '193–254', '192.168.10.255', 'Sales'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Worked Example 2: A 30-Host Requirement',
        body:
            'Requirement: a branch office needs 30 hosts. Choose /27 '
            '(255.255.255.224), which provides exactly 30 usable host '
            'addresses.',
      ),
      LessonSection(
        heading: 'Worked Example 3: A Point-to-Point Network',
        body:
            'Requirement: connect two routers directly. Choose /30 '
            '(255.255.255.252). Network = x.x.x.0, usable hosts = .1 and '
            '.2, broadcast = .3 — exactly enough addresses for a link '
            'between two devices with nothing wasted.',
      ),
      LessonSection(
        heading: 'Common Subnetting Mistakes',
        bullets: [
          'Assigning the network address to a host',
          'Assigning the broadcast address to a host',
          'Selecting an insufficient subnet size',
          'Using overlapping IP ranges',
          'Forgetting to update firewall rules after subnet changes',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Design Exercise',
        body:
            'Design a network for HR (50 users), Finance (40 users), IT '
            '(30 users), Servers (20 hosts), and Guest Wi-Fi (100 users). '
            'The task: select suitable subnet sizes, allocate '
            'non-overlapping address ranges, identify default gateways, '
            'and recommend firewall policies between subnets — exactly '
            'the kind of design exercise a real network engineer works '
            'through before deploying a new office.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Business Requirement', 'Select CIDR', 'Calculate Magic Number', 'Create Subnets', 'Assign VLANs', 'Configure Gateway', 'Apply ACLs/Firewall Rules'],
          caption: 'The full IPv4 subnetting workflow, from a business requirement all the way to enforced firewall policy.',
        ),
      ),
      LessonSection(
        heading: 'Variable Length Subnet Masking (VLSM)',
        body:
            'VLSM allows different subnet sizes within the same network. '
            'Instead of allocating equal-sized subnets, administrators '
            'assign address space based on actual host requirements, '
            'reducing address wastage significantly compared to fixed, '
            'equal-sized subnetting.',
      ),
      LessonSection(
        heading: 'VLSM Sizing by Requirement',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Department', 'Hosts Required', 'Recommended Prefix'],
          tableRows: [
            ['Guest Wi-Fi', '120', '/25'],
            ['HR', '50', '/26'],
            ['Finance', '30', '/27'],
            ['Servers', '14', '/28'],
            ['Router Links', '2', '/30'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Worked VLSM Example',
        body:
            'Starting network: 192.168.100.0/24. Allocate the largest '
            'subnet first: Guest Wi-Fi gets 192.168.100.0/25, HR gets '
            '192.168.100.128/26, Finance gets 192.168.100.192/27, '
            'Servers gets 192.168.100.224/28, and the WAN link gets '
            '192.168.100.240/30. This approach maximizes address '
            'utilization while leaving room for future expansion.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Business Requirements', 'Sort by Largest Network', 'Allocate Address Blocks', 'Verify Remaining Space', 'Configure VLANs & Routing'],
          caption: 'The VLSM allocation workflow — always allocate the largest subnet first to avoid fragmenting the address space.',
        ),
      ),
      LessonSection(
        heading: 'IPv6 Fundamentals',
        body:
            'IPv6 uses 128-bit hexadecimal addresses, providing an '
            'enormous address space compared to IPv4 — roughly '
            '3.4 × 10^38 addresses versus IPv4\'s approximately 4.3 '
            'billion. IPv6 eliminates the need for widespread NAT and is '
            'designed for modern cloud, mobile, and IoT environments.',
      ),
      LessonSection(
        heading: 'IPv4 vs. IPv6',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'IPv4', 'IPv6'],
          tableRows: [
            ['Address Length', '32-bit', '128-bit'],
            ['Notation', 'Decimal', 'Hexadecimal'],
            ['Broadcast', 'Supported', 'Not Used'],
            ['Configuration', 'Manual/DHCP', 'SLAAC or DHCPv6'],
            ['Address Space', '~4.3 Billion', '3.4 × 10^38'],
          ],
        ),
      ),
      LessonSection(
        heading: 'IPv6 Address Types',
        bullets: [
          'Global unicast — publicly routable addresses',
          'Link-local — communication within the local segment only',
          'Unique local — private enterprise addressing',
          'Multicast — one-to-many communication',
        ],
      ),
      LessonSection(
        heading: 'Cloud Subnetting',
        body:
            'Cloud platforms use logical virtual networks instead of '
            'traditional physical LANs, but the same core subnetting '
            'principles still apply.',
        bullets: [
          'Azure — Virtual Network (VNet), Subnets, Network Security Groups (NSGs)',
          'AWS — Virtual Private Cloud (VPC), public and private Subnets, Route Tables, Security Groups, Network ACLs',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Design Scenario',
        body:
            'An enterprise deploys a Public Web Tier, an Application '
            'Tier, a Database Tier, a Management Network, a SOC Network, '
            'and a Guest Wi-Fi network. Each tier receives a dedicated '
            'subnet with firewall rules restricting east-west traffic. '
            'Administrative access is limited to the management subnet '
            'and protected using multi-factor authentication.',
      ),
      LessonSection(
        heading: 'IP Subnetting Best Practices',
        bullets: [
          'Use private address ranges internally, reserving public IPs for internet-facing services',
          'Maintain an IP Address Management (IPAM) inventory and document all subnet allocations',
          'Allocate address space for future growth and avoid overlapping IP ranges',
          'Separate users, servers, and management networks into distinct subnets',
          'Use VLSM to minimize address wastage rather than fixed equal-sized subnetting',
          'Combine subnetting with VLANs and internal firewalls between security zones',
          'Plan for IPv6 adoption in future deployments',
          'Continuously monitor inter-subnet traffic',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'What Is Network Security?',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Networks Are the Backbone of Every Organization',
        body:
            'Networks are the backbone of every modern organization. '
            'From small businesses to multinational corporations, '
            'virtually every business process relies on the ability of '
            'devices to communicate securely and efficiently. Employees '
            'access email, collaborate through cloud applications, '
            'connect to databases, transfer files, process financial '
            'transactions, and interact with customers over enterprise '
            'networks every day.',
      ),
      LessonSection(
        heading: 'A Network Without a Fixed Perimeter',
        body:
            'The rapid growth of cloud computing, mobile devices, '
            'Internet of Things (IoT), hybrid work, and '
            'Software-as-a-Service (SaaS) platforms has transformed how '
            'organizations operate. A modern enterprise network is no '
            'longer confined to a single office building — it spans '
            'branch offices, remote users, cloud platforms, partner '
            'networks, and globally distributed data centers. '
            'Cybercriminals recognize that networks provide a gateway '
            'to valuable business assets, and increasingly target '
            'network infrastructure, authentication systems, cloud '
            'connectivity, and communication protocols to gain '
            'unauthorized access. Once inside a network, they often '
            'attempt to move laterally between systems, escalate '
            'privileges, and exfiltrate sensitive information.',
      ),
      LessonSection(
        heading: 'What Is Network Security?',
        body:
            'Network security is the discipline of protecting network '
            'infrastructure, communication channels, connected devices, '
            'and transmitted information from unauthorized access, '
            'misuse, alteration, disruption, or destruction.',
        bullets: [
          'Hardware security devices',
          'Software security solutions',
          'Security policies',
          'Operational procedures',
          'Continuous monitoring',
          'User awareness',
          'Incident response processes',
        ],
      ),
      LessonSection(
        heading: 'A Distinct Discipline From Endpoint Security',
        body:
            'Unlike endpoint security, which focuses on protecting '
            'individual devices, network security protects the '
            'communication paths that connect those devices — the two '
            'disciplines are complementary, not interchangeable.',
      ),
      LessonSection(
        heading: 'The Evolution of Network Security',
        body:
            'In the early days of corporate networking, organizations '
            'operated isolated internal networks and relied on a single '
            'perimeter firewall, assuming that systems inside the '
            'corporate network could generally be trusted. As Internet '
            'connectivity became essential, organizations began '
            'exposing web servers, email systems, and remote access '
            'services externally, significantly increasing the attack '
            'surface through website defacement, malware distribution, '
            'buffer overflow exploits, and Denial-of-Service (DoS) '
            'attacks. Organizations responded by deploying Intrusion '
            'Detection Systems (IDS), Intrusion Prevention Systems '
            '(IPS), proxy servers, and VPNs. Today, employees regularly '
            'work from home, travel internationally, and access '
            'corporate resources from multiple devices, while business '
            'applications reside in public clouds, private clouds, or '
            'SaaS platforms — the traditional network perimeter has '
            'largely disappeared.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/evolution_of_network_security.jpg',
          caption: 'Enterprise network security has evolved from perimeter-based protection to a layered, identity-centric, Zero Trust model capable of securing distributed users, devices, and cloud services.',
        ),
      ),
      LessonSection(
        heading: 'Why Network Security Matters',
        bullets: [
          'Prevent unauthorized access to critical systems',
          'Protect sensitive customer and employee information',
          'Secure online transactions and digital services',
          'Reduce the spread of malware and ransomware',
          'Maintain uninterrupted business operations',
          'Support regulatory compliance',
          'Preserve customer trust and organizational reputation',
        ],
      ),
      LessonSection(
        heading: 'Business Impact of Poor Network Security',
        body:
            'A successful network attack can have far-reaching '
            'consequences beyond the immediate technical impact — '
            'financial losses from incident response, legal fees, and '
            'regulatory fines; operational disruption to manufacturing, '
            'healthcare, retail, or banking; reputation damage that '
            'reduces customer confidence and affects stock price; and '
            'regulatory consequences under frameworks such as GDPR, '
            'HIPAA, PCI DSS, or ISO/IEC 27001.',
      ),
      LessonSection(
        heading: 'The CIA Triad in Network Security',
        body:
            'The Confidentiality, Integrity, and Availability (CIA) '
            'Triad serves as the foundation for designing secure '
            'enterprise networks. Every security control — whether a '
            'firewall, encryption solution, or intrusion prevention '
            'system — ultimately supports one or more of these '
            'principles.',
      ),
      LessonSection(
        heading: 'Confidentiality',
        body:
            'Confidentiality ensures that information is accessible '
            'only to authorized individuals, systems, or applications. '
            'For example, if an attacker intercepts unencrypted login '
            'credentials transmitted over public Wi-Fi, confidentiality '
            'has been compromised.',
        bullets: [
          'Threats — unauthorized access, password theft, packet sniffing, wireless eavesdropping, misconfigured file shares',
          'Controls — encryption (AES, TLS, IPsec), MFA, VPNs, ACLs, RBAC, network segmentation, DLP, IAM',
        ],
      ),
      LessonSection(
        heading: 'Integrity',
        body:
            'Integrity ensures that information remains accurate, '
            'complete, and trustworthy throughout its lifecycle. '
            'Integrity does not simply mean preventing modification — '
            'it means ensuring that changes occur only through '
            'authorized processes. A modified financial transaction '
            'could transfer money to an attacker; altered medical '
            'records could result in incorrect patient treatment.',
        bullets: [
          'Threats — malware, database manipulation, SQL injection, unauthorized configuration changes, Man-in-the-Middle attacks',
          'Controls — cryptographic hashing, digital signatures, checksums, File Integrity Monitoring (FIM), version control',
        ],
      ),
      LessonSection(
        heading: 'Availability',
        body:
            'Availability ensures that authorized users can access '
            'systems, applications, and information whenever required. '
            'A secure system that is unavailable to legitimate users is '
            'often just as problematic as a compromised one — '
            'especially for hospitals, financial institutions, '
            'emergency services, and e-commerce platforms.',
        bullets: [
          'Threats — DDoS attacks, hardware failures, power outages, ransomware, natural disasters, human error',
          'Controls — redundant network links, load balancers, High Availability clusters, failover systems, backups, DDoS protection services',
        ],
      ),
      LessonSection(
        heading: 'Beyond the CIA Triad: Authentication, Authorization, Accounting',
        body:
            'Modern enterprise environments require additional security '
            'principles beyond the CIA Triad to address identity, '
            'accountability, and trust. Authentication and Authorization '
            'and Accounting (AAA) is a foundational security framework '
            'used to control access to enterprise networks and '
            'resources.',
      ),
      LessonSection(
        heading: 'Authentication, Authorization & Accounting',
        bullets: [
          'Authentication — "Who are you?" Verifies identity using passwords, MFA, smart cards, biometrics, digital certificates, or hardware security keys',
          'Authorization — "What are you allowed to do?" Defines resources and actions available, typically implemented using RBAC, ABAC, and Least Privilege',
          'Accounting — Records user and system activities (logins, failed authentications, configuration changes, file access) for monitoring, compliance, and forensic investigation',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/aaa_framework.jpg',
          caption: 'The AAA framework verifies identity, determines access permissions, and records user activities to strengthen enterprise network security and accountability.',
        ),
      ),
      LessonSection(
        heading: 'Non-Repudiation',
        body:
            'Non-repudiation ensures that a user or system cannot deny '
            'performing a specific action after it has occurred — '
            'especially important where transactions, approvals, and '
            'communications have legal or regulatory significance. '
            'Because these actions are cryptographically verified and '
            'logged, the individual cannot later claim the action never '
            'took place.',
        bullets: [
          'Digital signatures',
          'Public Key Infrastructure (PKI)',
          'Digital certificates',
          'Secure audit logs',
          'Timestamping services',
          'Immutable logging platforms',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational financial institution processes millions '
            'of online banking transactions every day. All '
            'communications are encrypted using TLS, ensuring '
            'confidentiality. Digital signatures and transaction '
            'hashes verify payment instructions have not been altered, '
            'preserving integrity. Redundant data centers, load '
            'balancers, and disaster recovery sites ensure banking '
            'services remain available even during hardware failures. '
            'Every transaction is authenticated, authorized, and '
            'recorded in secure audit logs, providing accountability '
            'and non-repudiation for both customers and employees.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'The CIA Triad defines what must be protected, while AAA '
            'determines who can access resources, what they are '
            'permitted to do, and how their actions are recorded. '
            'Together, these principles form the foundation of secure '
            'enterprise networking.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Major Components of an Enterprise Network',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'A Complex, Interconnected Ecosystem',
        body:
            'Enterprise networks are complex ecosystems that connect '
            'users, devices, applications, and services across multiple '
            'physical locations and cloud environments. Modern networks '
            'support thousands — or even hundreds of thousands — of '
            'interconnected devices communicating continuously. Each '
            'component performs a specific function, and understanding '
            'these components helps security professionals identify '
            'where security controls should be implemented and how '
            'attackers might attempt to exploit weaknesses.',
      ),
      LessonSection(
        heading: 'Endpoints',
        body:
            'Endpoints are devices that connect to the network and '
            'communicate with other systems, representing the interface '
            'between users and enterprise resources. Because endpoints '
            'frequently access email, websites, cloud applications, and '
            'removable media, they are among the most common targets '
            'for cyberattacks.',
        bullets: [
          'Desktop computers, laptops, smartphones, tablets, thin clients',
          'Point-of-Sale (POS) terminals, virtual desktops, printers',
          'Internet of Things (IoT) devices, industrial control systems (ICS)',
        ],
      ),
      LessonSection(
        heading: 'Network Infrastructure: Routers',
        body:
            'Routers connect different networks and determine the '
            'optimal path for forwarding packets — connecting branch '
            'offices to headquarters, providing internet and cloud '
            'connectivity, and handling MPLS and SD-WAN routing. Modern '
            'enterprise routers often include VPN termination, routing '
            'authentication, and access control lists (ACLs).',
      ),
      LessonSection(
        heading: 'Network Infrastructure: Switches',
        body:
            'Switches connect devices within a Local Area Network '
            '(LAN). Modern managed switches support VLAN segmentation, '
            'port security, IEEE 802.1X authentication, MAC address '
            'filtering, storm control, DHCP snooping, and Dynamic ARP '
            'Inspection (DAI). Because switches control communication '
            'inside corporate networks, securing them is essential for '
            'preventing unauthorized access and lateral movement.',
      ),
      LessonSection(
        heading: 'Network Infrastructure: Wireless Access Points, Firewalls, Load Balancers, VPN Gateways',
        bullets: [
          'Wireless Access Points (WAPs) — provide Wi-Fi connectivity, commonly supporting WPA3 Enterprise, 802.1X, multiple SSIDs, guest isolation, and rogue AP detection',
          'Firewalls — inspect network traffic and enforce security policy at the Internet perimeter, data centers, internal boundaries, cloud environments, and branch offices',
          'Load Balancers — distribute network traffic across multiple servers, improving availability, performance, fault tolerance, and scalability',
          'VPN Gateways — establish encrypted communication channels between users, branch offices, and cloud environments',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/network_infrastructure.jpg',
          caption: 'Enterprise network infrastructure consists of interconnected devices that route, switch, secure, and optimize communication across corporate and cloud environments.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Network Types',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Network Type', 'Coverage', 'Typical Examples'],
          tableRows: [
            ['LAN', 'Limited geographic area', 'Office buildings, campuses, hospitals'],
            ['WAN', 'Geographically separated locations', 'Headquarters to branch offices, international sites'],
            ['MAN', 'A city or metropolitan region', 'University campuses, government departments'],
            ['WLAN', 'Wireless connectivity via radio frequency', 'Employees, guests, IoT devices'],
            ['SD-WAN', 'Software-defined WAN management', 'Dynamic path selection for cloud connectivity'],
            ['Cloud Networks', 'Virtual networks in cloud platforms', 'Azure VNets, AWS VPCs, GCP networks'],
          ],
        ),
      ),
      LessonSection(
        heading: 'SD-WAN: A Modern Approach to WAN',
        body:
            'Traditional WANs rely on dedicated circuits and static '
            'routing policies. SD-WAN introduces centralized '
            'software-based management that dynamically selects the '
            'best communication path based on application requirements '
            'and network performance, providing lower operational costs, '
            'improved cloud connectivity, and simplified branch '
            'deployment — SD-WAN has become the preferred WAN '
            'architecture for many modern enterprises.',
      ),
      LessonSection(
        heading: 'Cloud Networks',
        body:
            'Organizations increasingly operate workloads across '
            'Microsoft Azure, Amazon Web Services (AWS), and Google '
            'Cloud Platform (GCP). Cloud networking includes Virtual '
            'Networks (VNets), Virtual Private Clouds (VPCs), Security '
            'Groups, Network Security Groups (NSGs), transit gateways, '
            'and private connectivity services — cloud networks require '
            'security controls comparable to those used in traditional '
            'on-premises environments.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/network_types.jpg',
          caption: 'Modern enterprises rely on multiple network types to securely connect users, offices, cloud platforms, and business applications across diverse geographic locations.',
        ),
      ),
      LessonSection(
        heading: 'Why Understanding Network Components Matters',
        body:
            'Every device represents both a business asset and a '
            'potential attack surface. A compromised router may '
            'redirect traffic to malicious destinations; an '
            'improperly configured switch may allow unauthorized '
            'devices to connect; a vulnerable wireless access point can '
            'expose internal resources to nearby attackers; a '
            'misconfigured VPN gateway can provide unauthorized remote '
            'access; an unsecured cloud network may expose sensitive '
            'data to the Internet.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational manufacturing company operates a '
            'headquarters, six regional offices, two cloud environments, '
            'and hundreds of remote employees. Its enterprise network '
            'includes routers connecting global locations, managed '
            'switches providing VLAN segmentation within offices, '
            'wireless access points supporting employee mobility, VPN '
            'gateways securing remote access, and cloud virtual networks '
            'hosting production applications. By integrating these '
            'components with centralized monitoring, identity services, '
            'and security controls, the organization maintains secure '
            'communication regardless of location.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Every network device — whether a router, switch, wireless '
            'access point, or VPN gateway — should be treated as a '
            'critical security asset. Proper configuration, regular '
            'patching, strong authentication, and continuous monitoring '
            'are essential to maintaining a secure enterprise network.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Understanding Firewalls',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Security Checkpoints at Every Boundary',
        body:
            'As organizations expand their digital infrastructure, the '
            'volume of network traffic entering and leaving corporate '
            'environments continues to grow. While this connectivity '
            'enables productivity and business growth, it also creates '
            'opportunities for attackers to exploit exposed services, '
            'vulnerable applications, and misconfigured systems. '
            'Firewalls are among the most important security '
            'technologies used to protect enterprise networks, acting '
            'as security checkpoints that examine network traffic and '
            'decide whether communications should be allowed or blocked '
            'based on predefined security policies.',
      ),
      LessonSection(
        heading: 'What Is a Firewall?',
        body:
            'A firewall is a hardware device, software application, or '
            'cloud-based security service that monitors and controls '
            'network traffic between different security zones. A '
            'firewall compares every connection request against a '
            'defined set of security rules before determining whether '
            'the communication should be permitted. Firewalls do not '
            'eliminate every cyber threat, but they significantly '
            'reduce the number of opportunities attackers have to reach '
            'internal systems.',
        bullets: [
          'Prevent unauthorized access',
          'Allow legitimate business communication',
          'Enforce organizational security policies',
          'Reduce the organization\'s attack surface',
          'Detect and block suspicious network activity',
          'Log security events for monitoring and investigation',
        ],
      ),
      LessonSection(
        heading: 'Evolution of Firewall Technology',
        bullets: [
          'First Generation — Packet Filtering: inspected only basic header information; lacked session or application-layer awareness',
          'Second Generation — Stateful Inspection: introduced the ability to track active network sessions, improving both security and performance',
          'Third Generation — Application-Aware Firewalls: inspect traffic beyond the network layer, identifying the actual application generating traffic',
          'Modern Firewalls: combine Deep Packet Inspection, integrated IPS, application awareness, user identity, URL filtering, malware detection, SSL/TLS inspection, and threat intelligence',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/firewall_evolution.jpg',
          caption: 'Firewall technology has evolved from simple packet filtering to intelligent, application-aware platforms capable of detecting sophisticated cyber threats.',
        ),
      ),
      LessonSection(
        heading: 'How Firewalls Work',
        body:
            'Every packet entering or leaving a protected network '
            'passes through the firewall for evaluation, considering '
            'source and destination IP address, source and destination '
            'port, protocol, connection state, application type, user '
            'identity, time of day, geographic location, and threat '
            'intelligence feeds. After evaluation, the firewall allows, '
            'denies, logs, alerts, performs additional inspection, or '
            'redirects the traffic — all within milliseconds, even in '
            'large enterprise environments handling millions of '
            'connections each day.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/firewall_evaluation.jpg',
          caption: 'Enterprise firewalls evaluate every connection against organizational security policies before permitting communication with internal resources.',
        ),
      ),
      LessonSection(
        heading: 'Understanding Firewall Rules',
        body:
            'A firewall makes decisions using a rule base (or access '
            'control policy). Each rule defines source address, '
            'destination address, source/destination port, protocol, '
            'application, user or group, action (Allow or Deny), and '
            'logging option. Rules are processed sequentially — once '
            'traffic matches a rule, the corresponding action applies '
            'and no further rules are evaluated, so proper rule '
            'ordering is essential.',
      ),
      LessonSection(
        heading: 'Example Firewall Rule Base',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Source', 'Destination', 'Service', 'Action'],
          tableRows: [
            ['Internet', 'Web Server', 'HTTPS (443)', 'Allow'],
            ['Internet', 'Database Server', 'Any', 'Deny'],
            ['HR VLAN', 'Payroll Server', 'HTTPS', 'Allow'],
            ['Guest Wi-Fi', 'Internal Network', 'Any', 'Deny'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Default-Deny vs. Default-Allow',
        bullets: [
          'Default-Allow — traffic is permitted unless explicitly blocked; easier initial deployment but higher security risk and greater attack surface over time',
          'Default-Deny — all traffic is blocked unless explicitly permitted; stronger security and better Zero Trust alignment, but requires careful planning and more administrative effort',
        ],
      ),
      LessonSection(
        heading: 'Why Default-Deny Wins',
        body:
            'Most modern enterprises adopt a default-deny approach '
            'because it aligns with the principle of least privilege '
            'and minimizes unnecessary network exposure.',
      ),
      LessonSection(
        heading: 'Inbound and Outbound Traffic Filtering',
        body:
            'Inbound filtering examines traffic entering the '
            'organization\'s network — customer access to a public '
            'website, remote VPN connections, inbound email — '
            'protecting internal systems from unauthorized access. '
            'Outbound filtering monitors traffic leaving the network — '
            'employee web browsing, cloud application access, software '
            'updates, DNS queries — helping detect malware attempting to '
            'communicate with command-and-control (C2) servers or '
            'exfiltrate sensitive information.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A financial services company deploys a next-generation '
            'firewall at its Internet perimeter. The firewall permits '
            'HTTPS traffic to public-facing banking portals while '
            'blocking direct access to internal application servers and '
            'databases. Outbound policies restrict employee systems '
            'from communicating with unauthorized cloud storage '
            'platforms, and all firewall events are forwarded to the '
            'organization\'s SIEM for continuous monitoring. By '
            'combining inbound and outbound filtering with a '
            'default-deny policy, the company significantly reduces its '
            'exposure to external attacks and unauthorized data '
            'transfers.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'A firewall is only as effective as its rule set. Regularly '
            'review firewall policies, remove obsolete rules, document '
            'business justifications, and adopt a default-deny approach '
            'wherever practical.',
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Types of Firewalls',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'One Size Doesn\'t Fit All',
        body:
            'Modern enterprise networks employ different types of '
            'firewalls depending on the location, traffic patterns, and '
            'level of inspection required. While all firewalls share '
            'the common objective of controlling network traffic, they '
            'differ significantly in how they analyze packets, enforce '
            'security policies, and respond to threats.',
      ),
      LessonSection(
        heading: 'Packet Filtering Firewall',
        body:
            'The earliest and simplest type of firewall — examines '
            'individual packets and makes decisions based solely on '
            'header information (source/destination IP, ports, transport '
            'protocol). It does not examine payload or maintain '
            'information about previous packets.',
        bullets: [
          'Advantages — high processing speed, low resource consumption, simple configuration',
          'Limitations — no application-layer awareness, cannot verify session state, vulnerable to spoofing',
        ],
      ),
      LessonSection(
        heading: 'Stateful Inspection Firewall',
        body:
            'Tracks the state of every active connection passing '
            'through the firewall in a state table (source/destination '
            'IP, source/destination port, protocol, session status, '
            'timeout). Instead of examining packets in isolation, it '
            'determines whether a packet belongs to an existing, '
            'legitimate session — return traffic matching the session is '
            'automatically permitted, while unsolicited packets are '
            'discarded.',
        bullets: [
          'Advantages — better security than packet filtering, blocks unsolicited inbound traffic, reduces false positives',
          'Limitations — higher resource utilization, limited application visibility, cannot inspect encrypted content without additional features',
        ],
      ),
      LessonSection(
        heading: 'Circuit-Level Gateway',
        body:
            'Operates at the Session Layer (Layer 5), verifying that '
            'communication sessions are established correctly according '
            'to protocol standards, without deep packet inspection.',
        bullets: [
          'Advantages — fast session establishment, efficient processing, hides internal network structure',
          'Limitations — minimal payload inspection, limited malware detection',
        ],
      ),
      LessonSection(
        heading: 'Application-Level Gateway (Proxy Firewall)',
        body:
            'Operates at the Application Layer (Layer 7), acting as an '
            'intermediary rather than allowing direct client-server '
            'communication: the client sends a request to the proxy, '
            'the proxy authenticates and evaluates it against security '
            'policy, then forwards approved traffic to the destination '
            'and returns the response through the proxy. Because the '
            'proxy terminates and recreates connections, it provides '
            'excellent visibility into application-layer communications.',
        bullets: [
          'Advantages — excellent application visibility, strong content filtering, user authentication, URL filtering',
          'Limitations — higher latency, greater processing requirements, more complex deployment',
        ],
      ),
      LessonSection(
        heading: 'Comparing Traditional Firewall Technologies',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Packet Filtering', 'Stateful Inspection', 'Circuit-Level', 'Proxy Firewall'],
          tableRows: [
            ['OSI Layer', '3–4', '3–4', '5', '7'],
            ['Session Awareness', 'No', 'Yes', 'Yes', 'Yes'],
            ['Payload Inspection', 'No', 'Limited', 'No', 'Yes'],
            ['User Authentication', 'No', 'Limited', 'Limited', 'Yes'],
            ['Performance', 'Very High', 'High', 'High', 'Moderate'],
            ['Application Visibility', 'No', 'Limited', 'No', 'Excellent'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational manufacturing company uses multiple '
            'firewall technologies to secure different parts of its '
            'infrastructure. A stateful firewall protects communications '
            'between regional offices by tracking active sessions and '
            'blocking unsolicited inbound traffic. A proxy firewall '
            'secures employee web browsing by authenticating users, '
            'inspecting HTTP and HTTPS requests, and preventing '
            'downloads from malicious websites. Together, these '
            'complementary technologies provide both efficient traffic '
            'management and deep application-layer visibility.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'No single firewall technology is suitable for every '
            'scenario. Enterprise security architectures typically '
            'combine stateful inspection, proxy services, and '
            'application-aware capabilities to provide comprehensive '
            'protection while maintaining performance.',
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Next-Generation Firewalls (NGFW)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Beyond IP Addresses and Ports',
        body:
            'Modern attackers use encrypted communications, legitimate '
            'applications, fileless malware, and sophisticated attack '
            'techniques that cannot be detected by examining only IP '
            'addresses and ports. To address these challenges, '
            'organizations deploy Next-Generation Firewalls (NGFWs), '
            'which combine the capabilities of a traditional stateful '
            'firewall with advanced security technologies that inspect '
            'traffic at the application layer, identify users, detect '
            'known exploits, and integrate with global threat '
            'intelligence services.',
      ),
      LessonSection(
        heading: 'What Makes an NGFW Different',
        body:
            'Unlike earlier firewalls that primarily focused on '
            'allowing or denying network connections, an NGFW '
            'understands who is accessing the network, which '
            'application is being used, what content is being '
            'transferred, and whether the activity represents a '
            'security threat. Today, NGFWs are a core component of '
            'enterprise perimeter security, branch office security, '
            'hybrid cloud deployments, and Zero Trust architectures.',
        bullets: [
          'Stateful packet inspection',
          'Deep Packet Inspection (DPI)',
          'Application identification',
          'User identity awareness',
          'Integrated Intrusion Prevention System (IPS)',
          'Malware detection and sandbox integration',
          'URL and web content filtering',
          'SSL/TLS traffic inspection',
          'Threat intelligence integration',
        ],
      ),
      LessonSection(
        heading: 'Deep Packet Inspection (DPI)',
        body:
            'Traditional firewalls inspect only the packet header, '
            'while DPI examines both the header and the payload — '
            'network protocol headers, application-layer data, file '
            'contents, embedded scripts, commands and URLs, and '
            'indicators of compromise (IOCs). For example, if a user '
            'downloads a malicious PDF over HTTPS, a traditional '
            'firewall may simply observe traffic on port 443 and allow '
            'it, while an NGFW using DPI can inspect the decrypted '
            'content, recognize the malicious payload, and block the '
            'download before it reaches the endpoint.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Encrypted Traffic Arrives', 'Header Inspection', 'Payload Inspection', 'Threat/IOC Comparison', 'Allow or Block'],
          caption: 'Deep Packet Inspection enables an NGFW to analyze packet payloads in addition to packet headers, allowing the detection of sophisticated threats hidden within network traffic.',
        ),
      ),
      LessonSection(
        heading: 'Application Awareness',
        body:
            'Modern enterprise applications no longer use fixed ports '
            '— Microsoft Teams, Zoom, Slack, Dropbox, and Salesforce '
            'often all communicate over TCP port 443. A traditional '
            'firewall sees only encrypted HTTPS traffic and cannot '
            'distinguish between business-critical applications and '
            'unauthorized services. An NGFW uses Application Awareness '
            'to identify applications regardless of port or protocol, '
            'enabling granular rules such as "Allow Microsoft Teams," '
            '"Block BitTorrent," or "Restrict personal cloud storage" '
            'instead of blunt rules like "Allow TCP 443."',
      ),
      LessonSection(
        heading: 'User Identity Awareness',
        body:
            'Traditional firewalls make decisions primarily based on IP '
            'addresses, which frequently change due to DHCP, VPN '
            'connections, wireless roaming, and virtual machines. '
            'Modern enterprises require security policies that follow '
            'the user, not just the device. An NGFW integrates with '
            'identity providers such as Microsoft Entra ID, Active '
            'Directory, LDAP, and RADIUS, enabling policies like '
            '"Finance users may access ERP systems" or "Contractors may '
            'only access approved business applications" — simplifying '
            'management while supporting Zero Trust principles.',
      ),
      LessonSection(
        heading: 'Integrated Intrusion Prevention System (IPS)',
        body:
            'Many NGFWs include a built-in IPS that actively examines '
            'traffic for known attack patterns — buffer overflow '
            'exploits, SQL injection attempts, remote code execution, '
            'protocol violations, and C2 traffic — and blocks malicious '
            'activity in real time, comparing traffic against '
            'continuously updated signature databases and behavioral '
            'detection techniques.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/firewall_evolution.jpg',
          caption: 'A Next-Generation Firewall evaluates network traffic through multiple inspection layers — including state, application, user identity, deep packet inspection, and intrusion prevention — before enforcing a security decision.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A financial services company deploys an NGFW at its '
            'Internet gateway. The firewall identifies employees '
            'through Microsoft Entra ID integration, allows only '
            'approved business applications such as Microsoft 365 and '
            'Salesforce, performs SSL/TLS inspection on outbound web '
            'traffic, scans downloaded files for malware, and uses '
            'integrated IPS signatures to block exploitation attempts '
            'targeting public-facing services.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'An NGFW is far more than a traditional firewall with '
            'additional rules. Its value comes from combining '
            'application awareness, user identity, deep packet '
            'inspection, intrusion prevention, and threat intelligence '
            'to make context-aware security decisions.',
      ),
    ],
  ),

  // 13 ---------------------------------------------------------------------
  Lesson(
    title: 'WAF, Host-Based & Cloud Firewalls',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Web Application Firewalls (WAF)',
        body:
            'Online banking, e-commerce websites, customer portals, '
            'and SaaS platforms are all accessible through web '
            'browsers, making them frequent targets for cyber '
            'attackers. Traditional network firewalls protect traffic '
            'at the IP, port, and protocol levels but cannot fully '
            'understand web application behavior. A Web Application '
            'Firewall (WAF) is a specialized solution that monitors, '
            'filters, and blocks malicious HTTP and HTTPS traffic '
            'between users and web applications.',
        bullets: [
          'SQL Injection (SQLi)',
          'Cross-Site Scripting (XSS)',
          'Cross-Site Request Forgery (CSRF)',
          'Remote/Local File Inclusion (RFI/LFI)',
          'Directory Traversal',
          'Command Injection',
          'Session Hijacking',
          'API abuse',
        ],
      ),
      LessonSection(
        heading: 'How a WAF Works',
        body:
            'A WAF sits between users and the web server. When a user '
            'submits a request, it first reaches the WAF, which '
            'inspects HTTP/HTTPS headers, URLs, cookies, parameters, '
            'and payloads against security policies and known attack '
            'signatures. Suspicious requests are blocked; legitimate '
            'requests are forwarded. The WAF can also inspect server '
            'responses to prevent sensitive information from being '
            'unintentionally exposed.',
      ),
      LessonSection(
        heading: 'Benefits of a WAF',
        bullets: [
          'Protection against OWASP Top 10 vulnerabilities',
          'Real-time inspection of web traffic',
          'Virtual patching of application vulnerabilities',
          'Protection for APIs and microservices',
          'Compliance with standards such as PCI DSS',
        ],
      ),
      LessonSection(
        heading: 'Host-Based Firewalls',
        body:
            'While perimeter firewalls protect network boundaries, '
            'organizations also require security controls directly on '
            'individual devices. A host-based firewall is software '
            'installed on a computer, server, or virtual machine that '
            'monitors and controls network traffic entering and leaving '
            'that specific system — enforcing policies even when a '
            'device is outside the corporate network, which is '
            'especially important for remote workers.',
        bullets: [
          'Microsoft Defender Firewall',
          'Linux iptables/nftables',
          'Windows Firewall with Advanced Security',
          'macOS Application Firewall',
        ],
      ),
      LessonSection(
        heading: 'Comparing WAF and Host-Based Firewalls',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Web Application Firewall', 'Host-Based Firewall'],
          tableRows: [
            ['Protects', 'Web applications', 'Individual devices'],
            ['Traffic Inspected', 'HTTP/HTTPS', 'All network traffic to the host'],
            ['Deployment', 'In front of web servers', 'Installed on endpoints or servers'],
            ['Primary Focus', 'Application-layer attacks', 'Device-level access control'],
            ['Examples', 'Azure WAF, AWS WAF, Cloudflare WAF', 'Microsoft Defender Firewall, iptables'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Cloud Firewalls',
        body:
            'As organizations migrate applications and data to cloud '
            'environments, traditional perimeter security is no longer '
            'sufficient. A cloud firewall is a firewall service '
            'designed specifically for cloud environments, providing '
            'network security for cloud-hosted resources. Unlike '
            'traditional hardware firewalls, cloud firewalls are '
            'software-defined and scale automatically as cloud '
            'environments grow.',
        bullets: [
          'Scalability — automatically scale to accommodate changing traffic volumes',
          'Centralized management — a single policy set applied across multiple cloud regions or accounts',
          'High availability — deployed across multiple availability zones',
          'Integration — with identity management, logging, monitoring, and SIEM',
          'Reduced operational overhead — the cloud provider manages underlying infrastructure',
        ],
      ),
      LessonSection(
        heading: 'Firewall-as-a-Service (FWaaS)',
        body:
            'FWaaS delivers firewall functionality as a cloud-based '
            'subscription service instead of purchasing and maintaining '
            'physical appliances — typically including stateful and '
            'NGFW capabilities, URL filtering, IPS, malware protection, '
            'and SSL/TLS inspection. This is especially useful for '
            'organizations with remote workers, branch offices, and '
            'hybrid cloud environments.',
        bullets: [
          'Microsoft Azure Firewall',
          'AWS Network Firewall',
          'Google Cloud Firewall Rules',
          'Palo Alto Networks Cloud NGFW',
          'Fortinet FortiGate Cloud',
          'Check Point CloudGuard',
        ],
      ),
      LessonSection(
        heading: 'SSL/TLS Inspection',
        body:
            'Today, the majority of Internet traffic is encrypted. '
            'While encryption protects privacy, attackers frequently '
            'hide malware, phishing content, and command-and-control '
            'communications inside encrypted traffic — if a firewall '
            'cannot inspect encrypted traffic, malicious content may '
            'pass through undetected. Many NGFWs perform SSL/TLS '
            'Inspection: the firewall temporarily decrypts traffic using '
            'trusted certificates, inspects the contents, and re-'
            'encrypts it before forwarding — transparent to users '
            'provided the firewall\'s certificate is trusted.',
      ),
      LessonSection(
        heading: 'Considerations for SSL/TLS Inspection',
        bullets: [
          'Requires additional processing power, affecting performance',
          'Some applications use certificate pinning and may break when decrypted',
          'Privacy regulations may restrict inspection of certain categories, such as banking or healthcare traffic',
          'Organizations should clearly define which traffic should and should not be inspected',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'An online retail company hosts its e-commerce application '
            'in the cloud. A WAF protects the customer-facing website '
            'by blocking SQL injection, XSS, and API abuse before '
            'requests reach the application servers, while each web '
            'server runs a host-based firewall permitting only HTTPS '
            'from the load balancer and administrative access from '
            'authorized management networks — a layered approach '
            'protecting both the application and the underlying '
            'servers.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'A Web Application Firewall protects the application, '
            'while a host-based firewall protects the operating system. '
            'As more than 90% of enterprise web traffic is encrypted, '
            'carefully planned SSL/TLS inspection significantly '
            'strengthens enterprise defenses while balancing privacy '
            'and compliance requirements.',
      ),
    ],
  ),

  // 14 ---------------------------------------------------------------------
  Lesson(
    title: 'Network Segmentation',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Limiting the Blast Radius',
        body:
            'Modern enterprise networks consist of thousands of '
            'devices, applications, servers, cloud workloads, and users '
            'continuously communicating with one another. If every '
            'system were placed on a single, unrestricted network, an '
            'attacker who compromised one device could easily move '
            'laterally to other systems. Network segmentation is the '
            'practice of dividing a network into smaller, isolated '
            'segments, each protected by its own security policies and '
            'access controls, forcing traffic through controlled '
            'inspection points such as firewalls or ACLs.',
        bullets: [
          'Reduces the attack surface',
          'Limits lateral movement by attackers',
          'Protects critical business systems',
          'Improves network performance',
          'Simplifies regulatory compliance',
          'Supports Zero Trust architectures',
        ],
      ),
      LessonSection(
        heading: 'VLAN Segmentation',
        body:
            'A Virtual Local Area Network (VLAN) is a logical grouping '
            'of devices within a physical network. Instead of '
            'connecting every device to the same broadcast domain, '
            'VLANs separate departments or functions into independent '
            'networks — for example, VLAN 10 for Finance, VLAN 20 for '
            'HR, VLAN 30 for Engineering, VLAN 40 for Guest, VLAN 50 for '
            'VoIP. Devices communicate only within their assigned VLAN '
            'unless routing or firewall policies explicitly allow '
            'otherwise, improving both security and network efficiency.',
      ),
      LessonSection(
        heading: 'Demilitarized Zone (DMZ)',
        body:
            'Organizations host systems that must be accessible from '
            'the Internet — company websites, email gateways, VPN '
            'servers, DNS servers, customer portals. Allowing Internet '
            'users direct access to the internal corporate network '
            'would create significant risk, so these public-facing '
            'systems are placed in a Demilitarized Zone (DMZ) — a '
            'buffer segment between the Internet and the internal '
            'network. If a web server in the DMZ is compromised, the '
            'attacker must still bypass additional firewall controls '
            'before reaching internal resources.',
      ),
      LessonSection(
        heading: 'Microsegmentation',
        body:
            'As organizations adopt virtualization, containers, and '
            'cloud-native applications, traditional segmentation is '
            'often insufficient. Traffic within modern data centers '
            'frequently moves between servers and workloads (east-west '
            'traffic) rather than only between users and the Internet '
            '(north-south traffic). Microsegmentation creates security '
            'boundaries around individual workloads or applications, '
            'enforcing security policies for every workload rather than '
            'entire VLANs or subnets — application servers communicate '
            'only with database servers, development systems cannot '
            'access production, containers communicate only with '
            'approved services.',
        bullets: [
          'Fine-grained security policies',
          'Reduced lateral movement',
          'Improved workload isolation',
          'Better visibility into east-west traffic',
          'Strong alignment with Zero Trust principles',
        ],
      ),
      LessonSection(
        heading: 'Zero Trust and Network Segmentation',
        body:
            'Modern cybersecurity follows the Zero Trust principle of '
            '"Never Trust, Always Verify" — every request, whether it '
            'originates inside or outside the network, must be '
            'authenticated, authorized, and continuously validated. '
            'Network segmentation is a key component of Zero Trust '
            'because it ensures access is granted only to the specific '
            'resources required for a user\'s role: finance employees '
            'access only financial systems, developers access only '
            'development environments, IoT devices communicate only '
            'with designated management systems.',
      ),
      LessonSection(
        heading: 'Best Practices for Network Segmentation',
        bullets: [
          'Separate critical systems from user networks',
          'Use firewalls or ACLs to control communication between segments',
          'Isolate guest wireless networks from corporate resources',
          'Place Internet-facing systems in a DMZ',
          'Regularly review and update segmentation policies',
          'Monitor traffic between segments for suspicious activity',
          'Combine segmentation with identity-based access controls and endpoint security',
        ],
      ),
      LessonSection(
        heading: 'Comparison of Segmentation Techniques',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Technique', 'Primary Purpose', 'Typical Deployment'],
          tableRows: [
            ['VLAN', 'Logical separation of users and devices', 'Enterprise LANs'],
            ['DMZ', 'Isolation of public-facing systems', 'Data centers, Internet edge'],
            ['Microsegmentation', 'Workload-level isolation', 'Data centers, cloud environments'],
            ['Zero Trust Segmentation', 'Identity-based access control', 'Enterprise, hybrid cloud'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global enterprise separates its network into dedicated '
            'VLANs for Finance, HR, Engineering, and Guest users. '
            'Public-facing web servers are hosted in a DMZ protected by '
            'perimeter and internal firewalls. In its cloud environment, '
            'the organization implements microsegmentation so '
            'application servers communicate only with authorized '
            'databases. Identity-based access policies enforce Zero '
            'Trust principles, ensuring users and workloads access only '
            'the resources necessary for their roles.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Firewalls protect network boundaries, while network '
            'segmentation limits the spread of attacks within those '
            'boundaries. Together, they provide a layered defense that '
            'significantly reduces the impact of security incidents.',
      ),
    ],
  ),

  // 15 ---------------------------------------------------------------------
  Lesson(
    title: 'Network Access Control (NAC)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Trusting No Device by Default',
        body:
            'After securing the enterprise network with firewalls and '
            'segmentation, organizations must ensure that only '
            'authorized users and trusted devices are allowed to '
            'connect. Even a well-segmented network can become '
            'vulnerable if unauthorized devices are permitted to join. '
            'Network Access Control (NAC) is a security framework that '
            'authenticates users and devices, evaluates their security '
            'posture, and determines the level of network access they '
            'should receive — rather than assuming every connected '
            'device is trustworthy, NAC continuously verifies identity '
            'and compliance before granting access.',
      ),
      LessonSection(
        heading: 'Why NAC Is Important',
        body:
            'Modern enterprise networks support remote employees, '
            'Bring Your Own Device (BYOD), corporate laptops, mobile '
            'phones, IoT devices, contractors, and cloud-connected '
            'endpoints. Each connected device introduces potential '
            'security risks — without NAC, an unmanaged or infected '
            'device could connect to the corporate network and become '
            'an entry point for attackers.',
      ),
      LessonSection(
        heading: 'How NAC Works',
        body: 'A NAC solution evaluates both who is requesting access and what device is requesting access.',
        bullets: [
          'User Authentication — verifies identity using credentials, certificates, or MFA',
          'Device Authentication — determines whether the connecting device is known and trusted',
          'Posture Assessment — evaluates the device\'s security configuration',
          'Policy Evaluation — compares the device against organizational security policies',
          'Access Decision — grants full access, limited access, guest access, or blocks the connection',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/network_infrastructure.jpg',
          caption: 'Network Access Control (NAC) authenticates users, validates devices, evaluates endpoint compliance, and applies organizational security policies before determining the appropriate level of network access.',
        ),
      ),
      LessonSection(
        heading: 'Common Endpoint Compliance Checks',
        bullets: [
          'Approved operating system',
          'Current security patches installed',
          'Active antivirus or endpoint protection',
          'Active host-based firewall',
          'Full-disk encryption',
          'Joined to the organization\'s identity provider',
          'Managed through platforms such as Microsoft Intune or Jamf',
          'Not reported as compromised',
        ],
      ),
      LessonSection(
        heading: 'Types of Network Access',
        bullets: [
          'Full Access — granted to authenticated users with compliant, managed devices',
          'Limited Access — allows only essential resources while restricting sensitive systems, e.g. a laptop missing recent updates may reach update servers but not production applications',
          'Guest Access — Internet connectivity without access to internal corporate resources, typically isolated via dedicated VLANs or wireless networks',
          'Quarantine Access — an infected or non-compliant device is placed into a quarantine network with access only to remediation resources like patch servers',
        ],
      ),
      LessonSection(
        heading: '802.1X Authentication',
        body:
            'One of the most common technologies used by NAC solutions '
            'is IEEE 802.1X — a port-based network access control '
            'standard that requires devices to authenticate before '
            'being allowed to send normal network traffic, widely '
            'deployed on wired Ethernet switches, enterprise wireless '
            'access points, and campus networks. Instead of immediately '
            'enabling a switch port, the network first verifies the '
            'identity of the user or device.',
      ),
      LessonSection(
        heading: 'Components of 802.1X',
        bullets: [
          'Supplicant — the endpoint requesting network access (a laptop, computer, or phone)',
          'Authenticator — the network device controlling access (a managed switch or wireless access point)',
          'Authentication Server — usually a RADIUS server that validates credentials and returns an authorization decision',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'An employee connects a corporate laptop to the wired '
            'network. The managed switch initiates an 802.1X '
            'authentication request. The laptop authenticates using its '
            'device certificate and the employee signs in with MFA. The '
            'NAC platform confirms the laptop is managed through '
            'Microsoft Intune, has the latest updates, Microsoft '
            'Defender is active, and disk encryption is enabled — the '
            'switch places it into the corporate VLAN with full access. '
            'Later, a contractor connects an unmanaged laptop to '
            'another switch port. The NAC system identifies the device '
            'as non-corporate and automatically assigns it to a guest '
            'VLAN with Internet access but no access to internal '
            'servers or business applications.',
      ),
      LessonSection(
        heading: 'Benefits of Network Access Control',
        bullets: [
          'Ensures only authenticated users and trusted devices connect',
          'Enforces endpoint compliance before granting access',
          'Supports Zero Trust by continuously validating users and devices',
          'Automatically isolates compromised or non-compliant endpoints',
          'Improves visibility into all devices connected to the network',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Authentication alone is not enough. Modern enterprises '
            'should verify both the user\'s identity and the security '
            'posture of the device before granting network access. '
            'Combining NAC with multi-factor authentication, endpoint '
            'management, and continuous monitoring significantly '
            'reduces the risk of unauthorized access and lateral '
            'movement.',
      ),
    ],
  ),

  // 16 ---------------------------------------------------------------------
  Lesson(
    title: 'Virtual Private Networks (VPNs)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Extending the Corporate Network Securely',
        body:
            'Organizations increasingly rely on remote employees, '
            'branch offices, cloud services, and third-party vendors to '
            'conduct business. These users often access corporate '
            'resources over public networks such as the Internet, which '
            'are inherently untrusted. To securely extend the corporate '
            'network beyond the physical office, organizations use '
            'Virtual Private Networks (VPNs) — a secure communication '
            'technology that establishes an encrypted tunnel between a '
            'user or network and a remote destination over a public '
            'network.',
      ),
      LessonSection(
        heading: 'Why VPNs Are Important',
        body:
            'Public networks such as hotel Wi-Fi, airport hotspots, and '
            'home Internet connections cannot always be trusted. '
            'Attackers may capture traffic through packet sniffing, '
            'launch Man-in-the-Middle attacks, steal login credentials, '
            'or hijack sessions. A VPN protects against these threats by '
            'encrypting network traffic, making intercepted data '
            'unreadable without the appropriate cryptographic keys.',
      ),
      LessonSection(
        heading: 'How a VPN Works',
        body:
            'The user launches the VPN client, which authenticates '
            'with the VPN gateway. A secure encrypted tunnel is '
            'established, network traffic is encrypted before leaving '
            'the device, and travels across the Internet. The VPN '
            'gateway decrypts the traffic and forwards it to internal '
            'resources; responses follow the same encrypted path back. '
            'To external observers, only encrypted traffic is visible.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['User Launches VPN Client', 'Authenticate with Gateway', 'Encrypted Tunnel Established', 'Traffic Encrypted & Sent', 'Gateway Decrypts & Forwards'],
          caption: 'A VPN establishes an encrypted tunnel across the public Internet, allowing remote users to securely access corporate resources while protecting sensitive information from interception.',
        ),
      ),
      LessonSection(
        heading: 'Core Security Services Provided by VPNs',
        bullets: [
          'Confidentiality — encryption ensures intercepted traffic cannot be read by unauthorized individuals',
          'Integrity — cryptographic hashing verifies transmitted data has not been altered during transit',
          'Authentication — users and devices authenticate using passwords, certificates, or MFA before a connection is established',
          'Secure Remote Access — employees can securely access internal applications, file servers, email, and business systems from virtually any location',
        ],
      ),
      LessonSection(
        heading: 'Remote Access VPN',
        body:
            'A Remote Access VPN allows individual users — remote '
            'employees, business travelers, executives, IT '
            'administrators — to securely connect to an organization\'s '
            'internal network from remote locations. The user installs '
            'VPN client software, authenticates with the gateway, and '
            'receives secure access to authorized corporate resources.',
      ),
      LessonSection(
        heading: 'Site-to-Site VPN',
        body:
            'A Site-to-Site VPN securely connects two or more entire '
            'networks. Instead of individual users establishing VPN '
            'sessions, VPN gateways at each location create a permanent '
            'encrypted tunnel — connecting headquarters to branch '
            'offices, a corporate office to a disaster recovery site, or '
            'a corporate network to a cloud environment. Employees '
            'communicate normally without manually launching VPN '
            'software because the tunnel operates continuously.',
      ),
      LessonSection(
        heading: 'VPN Protocols',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Protocol', 'OSI Layer', 'Primary Use Case', 'Key Advantage'],
          tableRows: [
            ['IPsec', 'Layer 3 (Network)', 'Site-to-Site and Remote Access VPN', 'Mature, widely supported, enterprise standard'],
            ['SSL/TLS VPN', 'Layer 7 (Application)', 'Remote Access VPN', 'Easy deployment and firewall-friendly (HTTPS over 443)'],
            ['WireGuard', 'Layer 3 (Network)', 'Remote Access and Site-to-Site VPN', 'Lightweight, fast, simple, modern'],
          ],
        ),
      ),
      LessonSection(
        heading: 'VPN Authentication',
        body:
            'Strong authentication is critical because the VPN gateway '
            'provides direct access to corporate resources. '
            'Organizations commonly implement MFA, digital certificates, '
            'smart cards, hardware security tokens, and biometric '
            'authentication where supported — many integrate VPN '
            'authentication with identity providers such as Microsoft '
            'Entra ID, Okta, or Active Directory Federation Services '
            '(ADFS).',
      ),
      LessonSection(
        heading: 'Enterprise VPN Deployment',
        body:
            'Large organizations typically support remote access for '
            'employees using laptops, tablets, and smartphones. Rather '
            'than deploying separate VPN gateways for different device '
            'types, a centralized VPN gateway provides secure '
            'connectivity to internal enterprise resources across all '
            'device types at once.',
      ),
    ],
  ),

  // 17 ---------------------------------------------------------------------
  Lesson(
    title: 'Wireless Network Security',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Radio Waves Don\'t Stop at the Office Wall',
        body:
            'Wireless networking has become essential to modern '
            'enterprise infrastructure, but it also introduces unique '
            'security challenges because communication occurs through '
            'radio waves rather than physical cables. Unlike wired '
            'networks, where an attacker typically requires physical '
            'access to the infrastructure, wireless communications can '
            'potentially be intercepted from outside the organization\'s '
            'premises if adequate security controls are not '
            'implemented.',
        bullets: [
          'Connect to unauthorized wireless networks',
          'Capture unencrypted wireless traffic',
          'Crack weak wireless passwords',
          'Create rogue access points',
          'Perform Man-in-the-Middle (MITM) attacks',
          'Launch denial-of-service attacks against wireless infrastructure',
        ],
      ),
      LessonSection(
        heading: 'Components of an Enterprise Wireless Network',
        body:
            'Wireless clients communicate with nearby access points, '
            'which forward traffic to the wired network. In larger '
            'deployments, access points are centrally managed through '
            'Wireless LAN Controllers (WLC), enabling consistent '
            'security policies, firmware updates, and radio frequency '
            'optimization. User authentication is typically performed '
            'through a RADIUS server before access to corporate '
            'resources is granted.',
        bullets: [
          'Wireless Clients',
          'Wireless Access Points (APs)',
          'Wireless LAN Controllers (WLC)',
          'Authentication Servers',
          'Enterprise Network',
          'Network Management Platform',
        ],
      ),
      LessonSection(
        heading: 'WEP: Where Wireless Security Started',
        body:
            'WEP (Wired Equivalent Privacy) was the first security '
            'protocol developed for IEEE 802.11 wireless networks. It '
            'relied on the RC4 encryption algorithm with relatively '
            'short encryption keys, and researchers later discovered '
            'severe weaknesses allowing attackers to recover encryption '
            'keys within minutes using freely available tools. WEP is '
            'considered obsolete and should never be used in modern '
            'enterprise environments.',
      ),
      LessonSection(
        heading: 'WPA and WPA2',
        body:
            'WPA was a temporary improvement over WEP, introducing '
            'Temporal Key Integrity Protocol (TKIP), dynamic key '
            'generation, and improved integrity checking — but it still '
            'relied on the RC4 cipher and has also been deprecated for '
            'enterprise use. WPA2 became the enterprise standard for '
            'many years, introducing AES encryption, CCMP, and '
            'enterprise authentication support via IEEE 802.1X. WPA2 '
            'remains widely deployed where legacy devices must still be '
            'supported.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/wireless_security_evolution.jpg',
          caption: 'Wireless security has evolved from the vulnerable WEP protocol to WPA3, which provides stronger encryption, improved authentication, and enhanced protection against password-based attacks.',
        ),
      ),
      LessonSection(
        heading: 'WPA3: The Current Standard',
        body:
            'WPA3 is the latest Wi-Fi security standard, introducing '
            'Simultaneous Authentication of Equals (SAE), better '
            'protection against offline password guessing, forward '
            'secrecy, and improved protection for public Wi-Fi '
            'networks. SAE replaces the traditional pre-shared key '
            'authentication process used in WPA2-Personal, making '
            'brute-force attacks significantly more difficult. '
            'Organizations deploying new wireless infrastructure should '
            'adopt WPA3 whenever supported.',
      ),
      LessonSection(
        heading: 'Enterprise Authentication: WPA2 vs. WPA3 Enterprise',
        body:
            'Enterprise deployments differ from home wireless networks '
            'by integrating with centralized authentication services '
            'rather than relying solely on shared passwords — typically '
            'IEEE 802.1X, RADIUS authentication, digital certificates, '
            'Microsoft Entra ID, Active Directory, and MFA where '
            'supported.',
      ),
      LessonSection(
        heading: 'Comparison of Wireless Security Standards',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'WEP', 'WPA', 'WPA2', 'WPA3'],
          tableRows: [
            ['Encryption', 'RC4', 'RC4 (TKIP)', 'AES-CCMP', 'AES-CCMP / 192-bit Enterprise'],
            ['Authentication', 'Shared Key', 'PSK / 802.1X', 'PSK / 802.1X', 'SAE / 802.1X'],
            ['Enterprise Support', 'No', 'Limited', 'Yes', 'Yes'],
            ['Offline Attack Protection', 'No', 'No', 'Limited', 'Yes'],
            ['Current Recommendation', 'Not Supported', 'Deprecated', 'Widely Supported', 'Recommended'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational organization deploys WPA3-Enterprise '
            'across its corporate offices. Wireless users authenticate '
            'using 802.1X against a centralized RADIUS server '
            'integrated with Microsoft Entra ID. Employee, guest, and '
            'IoT devices are placed into separate VLANs based on user '
            'identity and device type. Wireless LAN Controllers '
            'continuously monitor access points, enforce security '
            'policies, and detect rogue wireless devices.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Never deploy WEP or WPA in production environments. Use '
            'WPA3-Enterprise whenever supported, or WPA2-Enterprise '
            'with AES and 802.1X authentication for legacy '
            'compatibility. Avoid shared passwords for corporate '
            'wireless networks and implement separate SSIDs for '
            'employees, guests, and IoT devices.',
      ),
    ],
  ),

  // 18 ---------------------------------------------------------------------
  Lesson(
    title: 'Network Monitoring & Traffic Analysis',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Observing, Analyzing, and Responding',
        body:
            'Modern enterprise networks generate enormous amounts of '
            'traffic every second. While most activity represents '
            'legitimate business operations, some traffic may indicate '
            'cyberattacks, policy violations, malware infections, or '
            'unauthorized access attempts. Unlike preventive controls '
            'such as firewalls, which attempt to block malicious traffic '
            'before it reaches the network, network monitoring focuses '
            'on observing, analyzing, and responding to network events '
            '— giving security teams visibility to identify potential '
            'threats before they escalate.',
      ),
      LessonSection(
        heading: 'Why Network Monitoring Is Important',
        body:
            'Attackers often spend days or even weeks inside '
            'compromised environments before being detected, using this '
            'time to move laterally, escalate privileges, and '
            'exfiltrate sensitive information. Without effective '
            'monitoring, organizations may remain unaware of security '
            'incidents until significant damage has already occurred.',
        bullets: [
          'Detect suspicious network activity in real time',
          'Identify malware communications',
          'Discover unauthorized devices',
          'Detect insider threats',
          'Investigate security incidents',
          'Verify compliance with organizational security policies',
        ],
      ),
      LessonSection(
        heading: 'Components of an Enterprise Monitoring Solution',
        bullets: [
          'Network Devices (routers, switches, firewalls)',
          'Servers',
          'Endpoints',
          'Cloud Resources',
          'Monitoring Collectors',
          'SIEM Platform',
          'Security Operations Center (SOC)',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/network_monitoring_components.jpg',
          caption: 'Enterprise network monitoring solutions collect telemetry from network devices, servers, endpoints, and cloud environments before forwarding the information to centralized monitoring platforms such as SIEM systems.',
        ),
      ),
      LessonSection(
        heading: 'Active Monitoring',
        body:
            'Active monitoring involves generating network traffic to '
            'test the availability, responsiveness, or performance of '
            'network devices and services — ICMP ping requests, '
            'traceroute, synthetic transactions, DNS queries, and '
            'service availability checks — providing immediate feedback '
            'for server health, website availability, and SLA '
            'verification.',
      ),
      LessonSection(
        heading: 'Passive Monitoring',
        body:
            'Passive monitoring observes existing network traffic '
            'without generating additional packets — packet captures '
            '(PCAP), NetFlow records, firewall logs, switch port '
            'mirroring (SPAN), IDS sensors, and network TAPs. Passive '
            'monitoring is particularly valuable for security operations '
            'because it reflects actual user and application behavior '
            'without affecting normal network operations.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/active_passive_monitoring.jpg',
          caption: 'Active monitoring generates test traffic to verify the availability and performance of network resources, whereas passive monitoring observes existing network communications to analyze operational behavior and identify potential security threats.',
        ),
      ),
      LessonSection(
        heading: 'Understanding Network Packets',
        body:
            'All communications on an IP network are transmitted as '
            'packets — the fundamental unit of data transmitted across '
            'a network. Each packet has a header (source/destination IP, '
            'ports, protocol type, sequence numbers, flags, TTL) and a '
            'payload (the actual application data). By examining headers '
            'and, where appropriate, payloads, analysts can reconstruct '
            'network sessions and identify suspicious communications.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/network_packet_structure.jpg',
          caption: 'A network packet consists of a header containing addressing and routing information and a payload containing the actual application data being transmitted across the network.',
        ),
      ),
      LessonSection(
        heading: 'Packet Capture (PCAP)',
        body:
            'Packet capture is the process of recording network '
            'packets as they traverse a network interface, letting '
            'analysts reconstruct communication sessions exactly as '
            'they occurred — used for malware investigations, incident '
            'response, protocol analysis, and digital forensics. Because '
            'captures may contain sensitive information, organizations '
            'should carefully control access and follow data retention '
            'policies.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/packet_capture_workflow.jpg',
          caption: 'Packet capture records network communications for later analysis. Analysts examine captured packets using protocol analyzers to troubleshoot problems and investigate potential security incidents.',
        ),
      ),
      LessonSection(
        heading: 'Protocol Analyzers',
        body:
            'A protocol analyzer decodes captured packets into '
            'human-readable protocol information rather than raw '
            'hexadecimal data, helping analysts examine headers, decode '
            'application protocols, reconstruct TCP sessions, and '
            'identify malformed packets or protocol violations. '
            'Wireshark is the most widely used open-source protocol '
            'analyzer, supporting hundreds of protocols with live '
            'capture, offline PCAP analysis, filtering, flow '
            'reconstruction, and TCP stream analysis.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/protocol_analyzers.jpg',
          caption: 'Protocol analyzers decode captured network packets into human-readable protocol information, enabling analysts to understand network communications and investigate security events.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A cybersecurity analyst receives an alert indicating that '
            'an internal workstation may be communicating with a '
            'malicious command-and-control server. Using a packet '
            'capture from the organization\'s monitoring infrastructure, '
            'the analyst opens the PCAP file in Wireshark and applies '
            'filters to display only DNS and HTTPS traffic from the '
            'suspected workstation. The analysis reveals repeated DNS '
            'queries for an unfamiliar domain followed by encrypted '
            'outbound sessions to an external IP not associated with '
            'any approved application. Correlating these findings with '
            'endpoint telemetry confirms malware has established '
            'persistent C2 communication, and the organization isolates '
            'the affected system before data can be exfiltrated.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Capture traffic at strategic locations within the network',
          'Protect packet capture files because they may contain sensitive information',
          'Apply filters to reduce analysis time',
          'Synchronize system clocks using NTP for accurate event correlation',
          'Combine packet analysis with endpoint and SIEM telemetry',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Packet captures provide one of the most valuable sources '
            'of forensic evidence during incident investigations. '
            'Because PCAP files may contain usernames, authentication '
            'tokens, and other sensitive information, they should be '
            'protected with the same level of security as other '
            'confidential organizational data.',
      ),
    ],
  ),

  // 19 ---------------------------------------------------------------------
  Lesson(
    title: 'Flow-Based Network Monitoring',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'A More Scalable Alternative to Full Packet Capture',
        body:
            'Capturing every packet that traverses an enterprise '
            'network provides the highest level of visibility, but it '
            'also generates enormous volumes of data. In large '
            'organizations with thousands of users and high-speed '
            'network links, storing and analyzing complete packet '
            'captures can become expensive and operationally '
            'challenging. Flow-based monitoring summarizes network '
            'communications by collecting metadata about conversations '
            'between devices, letting security teams understand who '
            'communicated, with whom, when, for how long, using which '
            'protocol, and how much data was transferred — without '
            'storing the entire packet contents.',
      ),
      LessonSection(
        heading: 'Understanding Network Flows',
        body:
            'A network flow represents a sequence of packets sharing '
            'common characteristics during a communication session — '
            'identified by source/destination IP, source/destination '
            'port, transport protocol, and duration. Instead of '
            'recording every individual packet, the monitoring device '
            'creates a summary containing total packets, total bytes '
            'transferred, start/end time, duration, interface '
            'information, protocol type, and TCP flags.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Network Devices Generate Flows', 'Flow Records Exported', 'Centralized Collector', 'Monitoring & Security Analysis'],
          caption: 'A network flow record summarizes communication between two devices by recording key metadata such as IP addresses, ports, protocol, packet count, data volume, and session duration.',
        ),
      ),
      LessonSection(
        heading: 'Benefits of Flow Monitoring',
        bullets: [
          'Reduced storage requirements — only metadata is stored, not complete packet contents',
          'High scalability — suitable for high-speed enterprise networks',
          'Long-term visibility — organizations can retain flow data for months or years',
          'Security monitoring — helps identify unusual outbound communications, C2 traffic, data exfiltration, internal reconnaissance, and lateral movement',
        ],
      ),
      LessonSection(
        heading: 'NetFlow',
        body:
            'NetFlow is one of the earliest and most widely adopted '
            'flow monitoring technologies, originally developed by '
            'Cisco Systems. NetFlow-enabled routers and switches '
            'generate flow records as traffic traverses network '
            'interfaces, exporting them to a centralized collector for '
            'analysis — including source/destination IP and port, '
            'protocol, interface, packet/byte count, duration, and TCP '
            'flags.',
      ),
      LessonSection(
        heading: 'sFlow',
        body:
            'sFlow (Sampled Flow) uses statistical sampling rather than '
            'attempting to record complete flow information — '
            'periodically sampling packets and interface counters to '
            'reduce processing overhead, making it well suited to '
            'high-speed data centers, large campus networks, and cloud '
            'service providers.',
      ),
      LessonSection(
        heading: 'IPFIX',
        body:
            'IPFIX (Internet Protocol Flow Information Export) is a '
            'vendor-neutral standard developed by the IETF, building on '
            'NetFlow concepts while providing greater flexibility '
            'through customizable templates — allowing vendors to '
            'define additional fields such as application identifiers, '
            'MPLS labels, VLAN identifiers, and QoS parameters. Because '
            'it is an open standard, IPFIX has become widely adopted '
            'across multi-vendor enterprise environments.',
      ),
      LessonSection(
        heading: 'Comparison of Flow Monitoring Technologies',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'NetFlow', 'sFlow', 'IPFIX'],
          tableRows: [
            ['Developed By', 'Cisco', 'InMon', 'IETF'],
            ['Collection Method', 'Flow records', 'Packet sampling', 'Flow records with templates'],
            ['Processing Overhead', 'Moderate', 'Low', 'Moderate'],
            ['Custom Fields', 'Limited', 'Limited', 'Extensive'],
            ['Best Suited For', 'Enterprise monitoring', 'High-speed networks', 'Multi-vendor enterprise deployments'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Selecting the Appropriate Monitoring Method',
        body:
            'Organizations often combine multiple monitoring '
            'technologies: Packet Capture (PCAP) for forensic '
            'investigations, NetFlow or IPFIX for continuous traffic '
            'visibility, sFlow for monitoring high-speed network '
            'segments, and SIEM platforms for correlating flow records '
            'with logs and security events.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational manufacturing company operates more than '
            '60 branch offices connected through SD-WAN. Capturing '
            'every packet across all locations would require excessive '
            'storage and bandwidth, so the organization enables IPFIX '
            'on routers, firewalls, and core switches instead. During '
            'routine monitoring, the SOC observes an unusual increase '
            'in outbound traffic from an engineering workstation to an '
            'unfamiliar external server over TCP port 443. Although '
            'encrypted, the IPFIX records reveal unusually large data '
            'transfers occurring outside normal business hours. '
            'Analysts correlate the flow records with endpoint '
            'telemetry and determine that proprietary design documents '
            'are being exfiltrated by malware — the workstation is '
            'isolated before additional intellectual property is lost.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Enable flow exports on core routers, firewalls, and distribution switches',
          'Synchronize network devices using NTP to ensure accurate timestamps',
          'Protect flow collectors from unauthorized access',
          'Retain historical flow data according to organizational policies',
          'Correlate flow records with SIEM, IDS, firewall, and endpoint telemetry',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Flow monitoring does not replace packet capture. Instead, '
            'it complements packet analysis by providing scalable, '
            'long-term visibility into network communications. '
            'Organizations should use flow records for continuous '
            'monitoring and reserve full packet captures for forensic '
            'investigations and incident response.',
      ),
    ],
  ),

  // 20 ---------------------------------------------------------------------
  Lesson(
    title: 'Intrusion Detection Systems (IDS)',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'An Alarm System, Not a Lock',
        body:
            'Although preventive security controls such as firewalls, '
            'ACLs, and endpoint protection help reduce the likelihood '
            'of attacks, they cannot prevent every security incident. '
            'Organizations deploy Intrusion Detection Systems (IDS) to '
            'continuously monitor network and system activities for '
            'signs of malicious behavior. Unlike firewalls, which '
            'actively allow or block traffic based on predefined rules, '
            'an IDS focuses on detecting suspicious activities and '
            'notifying security personnel — acting as an organization\'s '
            '"security alarm system."',
      ),
      LessonSection(
        heading: 'Why IDS Is Important',
        body:
            'Attackers frequently use encrypted communications, '
            'legitimate administrative tools, stolen credentials, and '
            'living-off-the-land techniques to avoid traditional '
            'security controls. Even when preventive controls are '
            'correctly configured, organizations require continuous '
            'monitoring to detect unauthorized network access, malware '
            'communications, brute-force login attempts, privilege '
            'escalation, port scanning, data exfiltration, and insider '
            'threats.',
      ),
      LessonSection(
        heading: 'How an IDS Works',
        body:
            'An IDS continuously monitors network traffic or host '
            'activities and compares observed behavior against '
            'predefined detection rules or behavioral models: collect '
            'activity, analyze it, compare against rules or baselines, '
            'identify suspicious activity, generate alerts, and forward '
            'them to the SOC or SIEM. Unlike an IPS, an IDS does not '
            'automatically block malicious traffic — it provides '
            'visibility and alerts that enable security teams to '
            'investigate and respond.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/ids_process.jpg',
          caption: 'An Intrusion Detection System continuously inspects network traffic or system activity, analyzes events using detection mechanisms, and generates alerts for investigation by the Security Operations Center.',
        ),
      ),
      LessonSection(
        heading: 'Network-Based Intrusion Detection System (NIDS)',
        body:
            'A NIDS monitors traffic flowing across a network segment. '
            'Instead of being installed on individual computers, NIDS '
            'sensors are positioned at strategic locations such as '
            'Internet gateways, core switches, data center networks, '
            'and DMZ environments — observing packets passing through '
            'the monitored segment and analyzing them for suspicious '
            'patterns or known attack signatures.',
        bullets: [
          'Network scanning and port scanning',
          'Malware communications',
          'Exploit attempts',
          'Command-and-control traffic',
          'DDoS attacks',
          'Protocol anomalies',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/nids.jpg',
          caption: 'A Network-Based Intrusion Detection System monitors traffic traversing critical network segments, enabling security teams to detect suspicious communications affecting multiple systems.',
        ),
      ),
      LessonSection(
        heading: 'Advantages of NIDS',
        bullets: [
          'Monitors multiple devices simultaneously',
          'Detects attacks before they reach endpoints',
          'Does not consume endpoint resources',
          'Provides centralized visibility',
        ],
      ),
      LessonSection(
        heading: 'Host-Based Intrusion Detection System (HIDS)',
        body:
            'A HIDS operates directly on an individual endpoint or '
            'server, observing activities occurring within the '
            'operating system — file modifications, registry changes, '
            'process execution, system calls, user authentication, and '
            'privilege changes. Because HIDS has direct access to the '
            'operating system, it can detect activities that may not '
            'be visible from network traffic alone, and is commonly '
            'installed on critical servers, domain controllers, '
            'database servers, and executive workstations.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/hids.jpg',
          caption: 'A Host-Based Intrusion Detection System monitors activities occurring within an individual endpoint or server, including processes, files, registry changes, and system events.',
        ),
      ),
      LessonSection(
        heading: 'NIDS vs. HIDS',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Network IDS (NIDS)', 'Host IDS (HIDS)'],
          tableRows: [
            ['Monitoring Location', 'Network Segment', 'Individual Host'],
            ['Visibility', 'Network Traffic', 'Operating System Activities'],
            ['Detects Network Attacks', 'Yes', 'Limited'],
            ['Detects File Changes', 'No', 'Yes'],
            ['Resource Consumption', 'Low on Endpoints', 'Uses Endpoint Resources'],
            ['Best Use Cases', 'Enterprise Network Monitoring', 'Critical Servers and Endpoints'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A healthcare organization deploys a Network IDS at its '
            'Internet gateway and a Host IDS on critical electronic '
            'medical record (EMR) servers. During routine monitoring, '
            'the Network IDS detects repeated port scanning from an '
            'external IP targeting the organization\'s DMZ. Shortly '
            'afterward, the Host IDS reports unauthorized modifications '
            'to configuration files on an application server. By '
            'correlating alerts from both systems within the SIEM, '
            'analysts determine an attacker exploited a vulnerable web '
            'application and attempted to establish persistence — the '
            'organization isolates the affected system before sensitive '
            'patient records are accessed.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Deploy NIDS sensors at critical network locations',
          'Install HIDS on high-value systems and servers',
          'Regularly update detection signatures',
          'Tune detection rules to reduce false positives',
          'Integrate IDS alerts with SIEM platforms',
          'Correlate IDS events with endpoint, firewall, and authentication logs',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Neither NIDS nor HIDS alone provides complete visibility. '
            'Enterprise organizations achieve the best detection '
            'capabilities by combining network-based monitoring with '
            'host-based monitoring and correlating alerts through a '
            'centralized SIEM platform.',
      ),
    ],
  ),

  // 21 ---------------------------------------------------------------------
  Lesson(
    title: 'IDS Detection Methodologies',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'How an IDS Actually Recognizes an Attack',
        body:
            'Deploying an IDS is only the first step in detecting '
            'cyber threats. The effectiveness of an IDS depends largely '
            'on how it identifies suspicious activity. Different '
            'detection methodologies analyze network traffic and system '
            'behavior in different ways, each with its own strengths '
            'and limitations. Modern enterprise IDS solutions typically '
            'combine multiple detection techniques to improve accuracy '
            'and reduce false positives.',
      ),
      LessonSection(
        heading: 'Signature-Based Detection',
        body:
            'Identifies attacks by comparing observed activity against '
            'a database of known attack signatures — known malware byte '
            'sequences, C2 communication patterns, exploit payloads, or '
            'known vulnerability exploits. When traffic matches a '
            'stored signature, the IDS generates an alert. Because '
            'attack characteristics are already known, this approach '
            'produces highly accurate results with relatively few false '
            'positives.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/signature_based_detection.jpg',
          caption: 'Signature-based detection compares observed network traffic or system activity with a database of known attack signatures. When a matching signature is identified, the system generates a security alert.',
        ),
      ),
      LessonSection(
        heading: 'Signature-Based Detection: Advantages and Limitations',
        bullets: [
          'Advantages — high accuracy for known attacks, low false-positive rate, fast processing, easy interpretation',
          'Limitations — cannot detect new or unknown threats such as zero-day exploits, newly developed malware, or modified ransomware variants; signature databases must be updated frequently',
        ],
      ),
      LessonSection(
        heading: 'Anomaly-Based Detection',
        body:
            'Rather than relying on known attack patterns, anomaly-'
            'based detection establishes a baseline of normal network '
            'or system behavior and continuously compares current '
            'activity against that baseline — normal login times, '
            'average bandwidth usage, common protocols, typical '
            'application usage, standard CPU utilization, and regular '
            'user behavior. If observed behavior deviates significantly, '
            'the IDS generates an alert.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/anomaly_based_detection.jpg',
          caption: 'Anomaly-based detection establishes a baseline of normal behavior and identifies activities that significantly deviate from expected patterns.',
        ),
      ),
      LessonSection(
        heading: 'Anomaly-Based Detection: Advantages and Limitations',
        bullets: [
          'Advantages — detects unknown threats and zero-day attacks, detects insider threats, continuously refines baselines for adaptive security',
          'Limitations — higher false-positive rate, since legitimate but unusual activity (end-of-month processing, software deployments, DR testing) may appear suspicious; requires a baseline training period before it can distinguish normal from suspicious activity',
        ],
      ),
      LessonSection(
        heading: 'Behavior-Based Detection',
        body:
            'Instead of asking "Does this match a known attack?", '
            'behavior-based detection asks "Does this behavior resemble '
            'how attackers typically operate?" — monitoring privilege '
            'escalation, process injection, credential dumping, '
            'PowerShell abuse, lateral movement, and suspicious process '
            'relationships. Because attackers frequently modify malware '
            'to evade signatures, behavior-based detection has become '
            'an important capability in modern EDR and XDR platforms.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/behavior_based_detection.jpg',
          caption: 'Behavior-based detection evaluates the actions performed on a system rather than searching for specific malware signatures, enabling the identification of suspicious attacker techniques.',
        ),
      ),
      LessonSection(
        heading: 'Heuristic Detection',
        body:
            'Combines predefined rules with intelligent analysis to '
            'determine whether an activity is potentially malicious. '
            'Rather than requiring an exact signature match, heuristic '
            'engines evaluate characteristics commonly associated with '
            'malware — an executable modifying system files, an Office '
            'document launching PowerShell, a script downloading '
            'executables. Each suspicious activity contributes to an '
            'overall risk score, and if the cumulative score exceeds a '
            'threshold, the IDS generates an alert. Heuristic detection '
            'is particularly effective against malware variants that '
            'differ slightly from known threats but retain similar '
            'malicious characteristics.',
      ),
      LessonSection(
        heading: 'Comparison of IDS Detection Methodologies',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Signature-Based', 'Anomaly-Based', 'Behavior-Based', 'Heuristic'],
          tableRows: [
            ['Detects Known Threats', 'Excellent', 'Good', 'Good', 'Good'],
            ['Detects Unknown Threats', 'No', 'Yes', 'Yes', 'Yes'],
            ['Zero-Day Detection', 'Poor', 'Excellent', 'Very Good', 'Good'],
            ['False Positives', 'Low', 'High', 'Moderate', 'Moderate'],
            ['Signature Updates Required', 'Yes', 'No', 'No', 'Limited'],
            ['Typical Enterprise Use', 'Traditional IDS', 'UEBA, NDR', 'EDR, XDR', 'Advanced IDS/AV'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A retail organization deploys an enterprise IDS integrated '
            'with its SIEM. During routine monitoring, the '
            'signature-based engine immediately identifies a known '
            'ransomware communication pattern and generates a '
            'high-priority alert. Simultaneously, the anomaly detection '
            'engine reports an unusually large volume of outbound '
            'encrypted traffic from a finance workstation after hours. '
            'The behavior-based engine detects PowerShell launching '
            'from Microsoft Word, while the heuristic engine assigns a '
            'high-risk score because the process attempts to disable '
            'endpoint security software. Correlating these alerts '
            'within the SIEM enables the SOC to quickly determine the '
            'workstation has been compromised and isolate it before '
            'ransomware spreads.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Regularly update signature databases',
          'Continuously refine anomaly detection baselines',
          'Tune detection thresholds to minimize false positives',
          'Correlate IDS alerts with firewall, endpoint, and authentication logs',
          'Combine multiple detection methodologies for comprehensive coverage',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'No single detection methodology can identify every cyber '
            'threat. Enterprise security solutions achieve the highest '
            'detection accuracy by combining signature-based, anomaly-'
            'based, behavior-based, and heuristic analysis within a '
            'layered defense strategy.',
      ),
    ],
  ),

  // 22 ---------------------------------------------------------------------
  Lesson(
    title: 'Intrusion Prevention Systems (IPS)',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'From Detection to Automatic Prevention',
        body:
            'While IDS technology plays an important role in '
            'identifying malicious activity, it does not actively stop '
            'attacks — it generates alerts and relies on analysts or '
            'automated response systems to investigate and act. As '
            'cyberattacks have become faster and more sophisticated, '
            'organizations increasingly require security solutions '
            'capable of responding immediately. An Intrusion Prevention '
            'System (IPS) continuously monitors network traffic, '
            'detects malicious activity, and automatically takes action '
            'to prevent attacks before they reach their intended '
            'targets. Modern IPS solutions are commonly integrated into '
            'NGFWs, Unified Threat Management (UTM) appliances, Secure '
            'Web Gateways, and cloud-based security platforms.',
      ),
      LessonSection(
        heading: 'Why Organizations Use IPS',
        bullets: [
          'Blocking known attack signatures',
          'Preventing exploit attempts',
          'Detecting malware communications',
          'Stopping command-and-control (C2) traffic',
          'Preventing buffer overflow attacks',
          'Blocking protocol violations',
          'Limiting denial-of-service (DoS) attacks',
        ],
      ),
      LessonSection(
        heading: 'How an IPS Works',
        body:
            'Unlike an IDS, which passively observes traffic, an IPS '
            'is deployed inline with network communications. Because '
            'all traffic passes through the IPS, it can inspect packets '
            'before they reach their destination and immediately apply '
            'the configured response policy — allow, drop malicious '
            'packets, reset the session, block the source IP, generate '
            'alerts, or log the event. Since every packet passes '
            'through the IPS, performance and reliability are critical '
            'considerations during deployment.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/ips_inline_deployment.jpg',
          caption: 'An Intrusion Prevention System is deployed inline with network traffic, enabling it to inspect communications and automatically block malicious activity before it reaches enterprise resources.',
        ),
      ),
      LessonSection(
        heading: 'Advantages of Inline Inspection',
        bullets: [
          'Immediate threat prevention — malicious traffic can be blocked before reaching enterprise systems',
          'Reduced response time — incidents can be prevented automatically without analyst intervention',
          'Policy enforcement — consistently enforces organizational security policies across all monitored traffic',
          'Protection against known threats — rapidly identifies and blocks attacks matching known signatures',
        ],
      ),
      LessonSection(
        heading: 'Limitations of Inline Inspection',
        bullets: [
          'Performance impact — insufficient processing capacity may introduce network latency',
          'False positives — incorrect detection rules may accidentally block legitimate business traffic',
          'Maintenance requirements — detection signatures and policies require continuous updates',
          'High availability considerations — organizations often deploy IPS in redundant configurations to avoid a single point of failure',
        ],
      ),
      LessonSection(
        heading: 'IDS vs. IPS',
        body:
            'Although IDS and IPS share many detection capabilities, '
            'they differ significantly in how they respond to security '
            'events. An IDS focuses on detection, while an IPS focuses '
            'on prevention.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'IDS', 'IPS'],
          tableRows: [
            ['Primary Purpose', 'Detect malicious activity', 'Detect and prevent malicious activity'],
            ['Deployment', 'Out-of-band monitoring', 'Inline deployment'],
            ['Blocks Attacks', 'No', 'Yes'],
            ['Network Traffic Modification', 'No', 'Yes'],
            ['Performance Impact', 'Low', 'Moderate'],
            ['Risk of Blocking Legitimate Traffic', 'None', 'Possible (false positives)'],
            ['Typical Enterprise Use', 'Monitoring and investigation', 'Real-time attack prevention'],
          ],
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/netsec/ids_vs_ips.jpg',
          caption: 'A Network IDS monitors copies of network traffic without affecting communications, whereas an IPS operates inline and can actively block malicious traffic before it reaches the enterprise network.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global financial institution deploys an NGFW with an '
            'integrated IPS at the perimeter of its data center. An '
            'attacker attempts to exploit a publicly accessible web '
            'application using a known SQL injection attack. The IPS '
            'identifies the attack signature within the incoming HTTP '
            'request and immediately drops the malicious packets before '
            'they reach the web server, while simultaneously logging '
            'the event and forwarding an alert to the organization\'s '
            'SIEM, where analysts correlate the incident with firewall '
            'logs and threat intelligence feeds. Because the attack is '
            'blocked automatically, no service disruption or data '
            'exposure occurs.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Deploy IPS devices at Internet gateways, data centers, and high-value network segments',
          'Operate IPS appliances in high-availability pairs to eliminate single points of failure',
          'Regularly update detection signatures and threat intelligence feeds',
          'Tune IPS policies to reduce false positives',
          'Monitor IPS performance to ensure sufficient processing capacity',
          'Integrate IPS alerts with SIEM and SOAR platforms',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'An IPS should complement — not replace — other security '
            'controls. Firewalls, endpoint protection, network '
            'segmentation, IDS, SIEM, and IPS work together as part of '
            'a layered defense strategy that provides comprehensive '
            'protection against modern cyber threats.',
      ),
    ],
  ),

  // 23 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 18,
    quiz: [
      QuizQuestion(
        question: 'In the Target 2013 breach, how did attackers initially gain a foothold?',
        options: [
          'A zero-day exploit in the point-of-sale software',
          'Stolen credentials from a compromised third-party HVAC vendor',
          'A phishing email sent directly to executives',
          'An unpatched web server vulnerability',
        ],
        correctIndex: 1,
        explanation: 'Attackers compromised a third-party HVAC vendor and used its stolen credentials to reach Target\'s network.',
      ),
      QuizQuestion(
        question: 'Which enterprise network zone typically hosts public-facing services like web and email servers?',
        options: ['Internal LAN', 'Management network', 'DMZ', 'Guest network'],
        correctIndex: 2,
        explanation: 'The DMZ is specifically designed to host public-facing services while isolating them from the internal network.',
      ),
      QuizQuestion(
        question: 'ARP poisoning and MAC flooding are threats primarily associated with which OSI layer?',
        options: ['Physical (1)', 'Data Link (2)', 'Network (3)', 'Transport (4)'],
        correctIndex: 1,
        explanation: 'ARP poisoning and MAC flooding both operate at Layer 2, the Data Link layer.',
      ),
      QuizQuestion(
        question: 'What is the key practical difference between the OSI model and the TCP/IP suite?',
        options: [
          'They are functionally identical',
          'OSI is a 7-layer conceptual reference model; TCP/IP is the practical 4-layer implementation actually running real networks',
          'TCP/IP has more layers than OSI',
          'OSI was developed by DARPA and TCP/IP by ISO',
        ],
        correctIndex: 1,
        explanation: 'OSI is conceptual and used for reference/troubleshooting; TCP/IP is the practical suite that actually runs the internet.',
      ),
      QuizQuestion(
        question: 'What happens during data encapsulation?',
        options: [
          'Data is deleted after transmission',
          'Each layer adds its own header before passing data to the next layer, wrapping it progressively',
          'Data is compressed only, with no headers added',
          'Encryption is applied at every layer automatically',
        ],
        correctIndex: 1,
        explanation: 'Encapsulation wraps data with a header at each layer; decapsulation reverses this at the receiving end.',
      ),
      QuizQuestion(
        question: 'Which port does HTTPS use by default?',
        options: ['80', '443', '22', '3389'],
        correctIndex: 1,
        explanation: 'HTTPS uses port 443 by default; HTTP (unencrypted) uses port 80.',
      ),
      QuizQuestion(
        question: 'In the DNS misconfiguration scenario, why did customers lose access despite the servers being fully operational?',
        options: [
          'The servers were actually down, contrary to what monitoring showed',
          'An incorrect DNS record prevented name resolution from directing customers to the correct server at all',
          'A firewall blocked all inbound traffic',
          'The load balancer failed silently',
        ],
        correctIndex: 1,
        explanation: 'DNS misconfiguration breaks name resolution independent of actual server health.',
      ),
      QuizQuestion(
        question: 'What is the primary security benefit of network segmentation?',
        options: [
          'It increases available bandwidth',
          'It limits how far an attacker can move laterally after compromising one device',
          'It eliminates the need for firewalls entirely',
          'It automatically encrypts all internal traffic',
        ],
        correctIndex: 1,
        explanation: 'Segmentation confines a compromise to one segment rather than allowing free lateral movement across the whole network.',
      ),
      QuizQuestion(
        question: 'What is the key difference between NAT and PAT?',
        options: [
          'They are the same technology with different names',
          'NAT maps addresses one-to-one; PAT allows many internal devices to share a single public IP using different ports',
          'PAT requires more public IP addresses than NAT',
          'NAT is used only for internal traffic',
        ],
        correctIndex: 1,
        explanation: 'PAT\'s many-to-one mapping via port numbers is what lets an entire office share a single public IP address.',
      ),
      QuizQuestion(
        question: 'With IP address 192.168.10.25 and subnet mask 255.255.255.0 (/24), what is the Network ID?',
        options: ['192.168.10.25', '192.168.10.0', '255.255.255.0', '192.168.0.0'],
        correctIndex: 1,
        explanation: 'With a /24 mask, the first three octets form the Network ID: 192.168.10.0.',
      ),
      QuizQuestion(
        question: 'Which private IP address range is typically used by large enterprises?',
        options: ['192.168.0.0/16', '10.0.0.0/8', '172.16.0.0/12', '127.0.0.0/8'],
        correctIndex: 1,
        explanation: '10.0.0.0/8 provides the largest private address space, commonly used by large enterprises.',
      ),
      QuizQuestion(
        question: 'For a /26 subnet mask (255.255.255.192), what is the magic number?',
        options: ['32', '64', '128', '192'],
        correctIndex: 1,
        explanation: 'The magic number is 256 minus the interesting octet value: 256 - 192 = 64.',
      ),
      QuizQuestion(
        question: 'A branch office needs exactly 30 usable host addresses. Which CIDR prefix should be chosen?',
        options: ['/24', '/26', '/27', '/30'],
        correctIndex: 2,
        explanation: 'A /27 (255.255.255.224) provides exactly 30 usable host addresses.',
      ),
      QuizQuestion(
        question: 'What is the main advantage of VLSM over fixed equal-size subnetting?',
        options: [
          'It requires no planning at all',
          'It assigns address space based on actual host requirements, reducing address wastage',
          'It eliminates the need for routing entirely',
          'It only works with IPv6',
        ],
        correctIndex: 1,
        explanation: 'VLSM allows different subnet sizes tailored to actual need, avoiding the waste of fixed equal-sized subnets.',
      ),
      QuizQuestion(
        question: 'How many bits does an IPv6 address use, and how is it typically notated?',
        options: [
          '32-bit, decimal',
          '128-bit, hexadecimal',
          '64-bit, binary',
          '256-bit, decimal',
        ],
        correctIndex: 1,
        explanation: 'IPv6 uses 128-bit addresses notated in hexadecimal, versus IPv4\'s 32-bit decimal addresses.',
      ),
      QuizQuestion(
        question: 'In AWS, which component provides the equivalent of a traditional subnet within a Virtual Private Cloud?',
        options: ['Route Table', 'Security Group', 'Public or Private Subnet', 'Network ACL'],
        correctIndex: 2,
        explanation: 'AWS VPCs are divided into public and private subnets, mirroring traditional network segmentation concepts in the cloud.',
      ),
      QuizQuestion(
        question: 'What does non-repudiation ensure in enterprise network security?',
        options: [
          'That data is always encrypted at rest',
          'That a user or system cannot deny performing a specific action after it has occurred',
          'That systems remain available during an outage',
          'That passwords are automatically rotated',
        ],
        correctIndex: 1,
        explanation: 'Non-repudiation relies on cryptographic verification and logging so an action cannot later be credibly denied.',
      ),
      QuizQuestion(
        question: 'In the AAA framework, what specifically does "Accounting" provide?',
        options: [
          'It verifies a user\'s identity',
          'It records user and system activities for monitoring, compliance, and forensic investigation',
          'It determines what resources a user can access',
          'It encrypts data in transit',
        ],
        correctIndex: 1,
        explanation: 'Accounting is the logging/auditing function, distinct from authentication (identity) and authorization (permissions).',
      ),
      QuizQuestion(
        question: 'Why has the traditional network perimeter "largely disappeared" in modern enterprises?',
        options: [
          'Because firewalls are no longer used',
          'Because employees work remotely and access cloud-hosted applications from multiple devices and locations rather than a single office network',
          'Because all data is now stored on paper',
          'Because networks no longer use IP addressing',
        ],
        correctIndex: 1,
        explanation: 'Cloud computing, remote work, and SaaS mean resources are no longer confined behind one physical perimeter.',
      ),
      QuizQuestion(
        question: 'What is the key difference between a stateful inspection firewall and a packet filtering firewall?',
        options: [
          'They are functionally identical',
          'A stateful firewall tracks the state of active connections in a state table, while packet filtering evaluates each packet in isolation',
          'Packet filtering is always more secure',
          'Stateful firewalls cannot process TCP traffic',
        ],
        correctIndex: 1,
        explanation: 'Stateful inspection understands ongoing sessions; packet filtering has no awareness of connection state.',
      ),
      QuizQuestion(
        question: 'At which OSI layer does a Proxy Firewall (Application-Level Gateway) primarily operate?',
        options: ['Layer 2', 'Layer 3', 'Layer 5', 'Layer 7'],
        correctIndex: 3,
        explanation: 'Proxy firewalls operate at the Application Layer, terminating and recreating connections for deep application visibility.',
      ),
      QuizQuestion(
        question: 'What capability specifically allows an NGFW to identify an application like Microsoft Teams even though it uses the same port as many other services?',
        options: ['Stateful inspection alone', 'Application Awareness', 'Circuit-level gating', 'Packet filtering'],
        correctIndex: 1,
        explanation: 'Application Awareness identifies the actual application generating traffic regardless of port or protocol, unlike port-based rules alone.',
      ),
      QuizQuestion(
        question: 'What does Deep Packet Inspection (DPI) examine that a traditional firewall does not?',
        options: [
          'Only the source IP address',
          'Both the packet header and the payload, including file contents and embedded scripts',
          'Only the destination port',
          'Nothing beyond basic routing information',
        ],
        correctIndex: 1,
        explanation: 'DPI goes beyond header inspection to examine payload content, enabling detection of threats hidden within otherwise-permitted traffic.',
      ),
      QuizQuestion(
        question: 'What is the primary difference between a WAF and a host-based firewall?',
        options: [
          'They are the same technology',
          'A WAF protects web applications by inspecting HTTP/HTTPS traffic, while a host-based firewall protects an individual device\'s overall network traffic',
          'Host-based firewalls only work on cloud servers',
          'A WAF cannot detect SQL injection',
        ],
        correctIndex: 1,
        explanation: 'A WAF is application-layer and web-traffic-specific; a host-based firewall is device-level and covers all traffic to that host.',
      ),
      QuizQuestion(
        question: 'What is Firewall-as-a-Service (FWaaS)?',
        options: [
          'A physical firewall appliance purchased once',
          'Firewall functionality delivered as a cloud-based subscription service rather than physical appliances',
          'A firewall that only works on wireless networks',
          'A discontinued technology no longer in use',
        ],
        correctIndex: 1,
        explanation: 'FWaaS lets organizations consume firewall capabilities from a cloud provider instead of maintaining hardware.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of microsegmentation compared to traditional VLAN segmentation?',
        options: [
          'It removes the need for any firewalls',
          'It creates security boundaries around individual workloads or applications rather than entire network segments, reducing east-west lateral movement',
          'It only applies to physical, non-virtualized servers',
          'It is identical in function to a DMZ',
        ],
        correctIndex: 1,
        explanation: 'Microsegmentation enforces policy at the individual workload level, far more granular than segmenting by VLAN or subnet alone.',
      ),
      QuizQuestion(
        question: 'What is the purpose of a Demilitarized Zone (DMZ)?',
        options: [
          'To directly expose internal servers to the Internet',
          'To host public-facing services in a buffer segment between the Internet and the internal network, limiting direct exposure of internal systems',
          'To replace the need for a firewall entirely',
          'To store encryption keys',
        ],
        correctIndex: 1,
        explanation: 'A DMZ isolates internet-facing systems so a compromise there still requires bypassing additional controls to reach internal resources.',
      ),
      QuizQuestion(
        question: 'In Network Access Control (NAC), what does "Posture Assessment" evaluate?',
        options: [
          'The physical location of the network switch',
          'The connecting device\'s security configuration, such as patch level, antivirus status, and encryption',
          'Only the user\'s typed password',
          'The color of the device\'s casing',
        ],
        correctIndex: 1,
        explanation: 'Posture assessment checks the actual security health of the device before granting access, not just who is logging in.',
      ),
      QuizQuestion(
        question: 'In an IEEE 802.1X deployment, what role does the "Authenticator" play?',
        options: [
          'It is the endpoint requesting access',
          'It is the network device (such as a managed switch or wireless access point) that controls access and forwards authentication requests',
          'It is the RADIUS server that validates credentials',
          'It is the end user typing a password',
        ],
        correctIndex: 1,
        explanation: 'The Authenticator is the network device sitting between the Supplicant (endpoint) and the Authentication Server (RADIUS).',
      ),
      QuizQuestion(
        question: 'Which VPN protocol commonly operates over TCP port 443, making it especially firewall-friendly for remote access?',
        options: ['IPsec', 'SSL/TLS VPN', 'WireGuard exclusively', 'None of these'],
        correctIndex: 1,
        explanation: 'SSL/TLS VPNs use the same port as normal HTTPS traffic, letting them traverse most firewalls without special configuration.',
      ),
      QuizQuestion(
        question: 'Why is WEP considered obsolete and unsuitable for any modern enterprise environment?',
        options: [
          'It uses encryption keys that are too long',
          'Researchers discovered severe weaknesses in its RC4-based implementation, allowing attackers to recover encryption keys within minutes',
          'It was never actually implemented in real products',
          'It requires too much processing power for modern hardware',
        ],
        correctIndex: 1,
        explanation: 'WEP\'s cryptographic weaknesses make it trivially breakable with freely available tools.',
      ),
      QuizQuestion(
        question: 'What does SAE (Simultaneous Authentication of Equals) in WPA3 specifically improve upon compared to WPA2-Personal?',
        options: [
          'It removes the need for any password at all',
          'It provides much stronger protection against offline password guessing attacks compared to WPA2\'s pre-shared key process',
          'It only works with wired connections',
          'It disables encryption for faster performance',
        ],
        correctIndex: 1,
        explanation: 'SAE replaces the traditional PSK exchange, making offline brute-force attacks against captured handshakes significantly harder.',
      ),
      QuizQuestion(
        question: 'What is the key difference between active and passive network monitoring?',
        options: [
          'They are the same technique with different names',
          'Active monitoring generates its own test traffic (like pings), while passive monitoring observes existing traffic without adding new packets',
          'Passive monitoring always requires more bandwidth than active monitoring',
          'Active monitoring cannot be used for security purposes',
        ],
        correctIndex: 1,
        explanation: 'Active monitoring probes systems directly; passive monitoring observes real traffic already occurring on the network.',
      ),
      QuizQuestion(
        question: 'What are the two primary components of a network packet?',
        options: [
          'Source and destination only',
          'A header containing addressing/routing information and a payload containing the actual application data',
          'A password and a username',
          'A timestamp and a checksum only',
        ],
        correctIndex: 1,
        explanation: 'Every packet consists of a header (routing/addressing) and a payload (the actual data being transmitted).',
      ),
      QuizQuestion(
        question: 'Why do organizations often prefer flow-based monitoring (like NetFlow or IPFIX) over full packet capture for continuous, long-term visibility?',
        options: [
          'Flow monitoring captures more data than full packet capture',
          'Flow monitoring records only metadata about conversations rather than full packet contents, dramatically reducing storage requirements while remaining scalable',
          'Full packet capture is illegal in most countries',
          'Flow monitoring cannot detect any security issues at all',
        ],
        correctIndex: 1,
        explanation: 'Flow monitoring trades full payload visibility for massive storage savings, making it practical for continuous, long-term use at scale.',
      ),
      QuizQuestion(
        question: 'What distinguishes IPFIX from proprietary flow formats like NetFlow?',
        options: [
          'IPFIX is a proprietary Cisco-only technology',
          'IPFIX is a vendor-neutral IETF standard that allows custom, extensible fields beyond traditional flow metadata',
          'IPFIX cannot be used in multi-vendor environments',
          'IPFIX only works with wireless networks',
        ],
        correctIndex: 1,
        explanation: 'IPFIX\'s open, extensible template system is what makes it well suited to diverse, multi-vendor enterprise environments.',
      ),
      QuizQuestion(
        question: 'What is the fundamental difference between a NIDS and a HIDS?',
        options: [
          'They are identical technologies with different names',
          'A NIDS monitors traffic across a network segment, while a HIDS monitors activities occurring within an individual endpoint\'s operating system',
          'A HIDS can only be used on network switches',
          'A NIDS consumes significant endpoint resources while a HIDS does not',
        ],
        correctIndex: 1,
        explanation: 'NIDS provides network-wide traffic visibility; HIDS provides deep visibility into a single host\'s internal activity like file and process changes.',
      ),
      QuizQuestion(
        question: 'Which IDS detection methodology is described as evaluating "Does this behavior resemble how attackers typically operate?" rather than matching a specific signature?',
        options: ['Signature-based detection', 'Behavior-based detection', 'Port scanning', 'Packet filtering'],
        correctIndex: 1,
        explanation: 'Behavior-based detection focuses on attacker techniques and actions (like credential dumping or PowerShell abuse) rather than fixed signatures.',
      ),
      QuizQuestion(
        question: 'What is the core distinction between an IDS and an IPS?',
        options: [
          'They are functionally identical technologies',
          'An IDS passively detects and alerts on suspicious activity, while an IPS is deployed inline and can actively block malicious traffic in real time',
          'An IPS cannot generate any alerts',
          'An IDS is always more expensive than an IPS',
        ],
        correctIndex: 1,
        explanation: 'IDS is detection-only and out-of-band; IPS sits inline in the traffic path and can actively prevent attacks.',
      ),
    ],
  ),
];
