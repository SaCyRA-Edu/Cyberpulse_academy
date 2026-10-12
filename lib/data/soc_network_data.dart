// Network & Traffic Analysis: a theory module of "The Pulse (SOC Blue Team)". Same
// Lesson/LessonSection/QuizQuestion model as every other module.

import 'lesson_model.dart';

final List<Lesson> socNetworkLessons = [
  Lesson(
    title: "Network Fundamentals for Analysts",
    estimatedMinutes: 17,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Why Network Evidence Matters",
        body:
            "Endpoints can be wiped, logs can be cleared, and malware can "
            "hide from the operating system. Network traffic is harder to "
            "hide, because to do anything useful an attacker has to "
            "communicate: to receive commands, download tools, move between"
            " hosts and send data out. Every one of those actions crosses a"
            " wire or a wireless link, and somewhere along the way a device"
            " is likely to have written it down.\n"
            "\n"
            "As a SOC analyst you rarely read raw packets all day. More "
            "often you read summaries of network activity: firewall "
            "entries, proxy records, DNS queries and flow records. This "
            "lesson gives you the vocabulary and mental model to read those"
            " summaries correctly, so that a line such as "
            "\"198.51.100.20:443 allowed, 48 MB out\" turns into a question "
            "you can answer instead of a number you scroll past.",
      ),
      LessonSection(
        heading: "IP Addresses, Ports and Protocols",
        body:
            "Every connection can be described by five things, often called"
            " the five-tuple: source IP, source port, destination IP, "
            "destination port and protocol. If you can write down those "
            "five values, you can find the same connection in nearly every "
            "log source you have.\n"
            "\n"
            "A few rules of thumb help you read them quickly.",
        bullets: [
          "Private ranges (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) are"
          " internal. Traffic to or from them is internal unless NAT "
          "hides something. This course uses documentation ranges such as"
          " 192.0.2.0/24, 198.51.100.0/24 and 203.0.113.0/24 for "
          "examples.",
          "The destination port usually tells you the service (443 for "
          "HTTPS, 53 for DNS, 22 for SSH, 3389 for RDP, 445 for SMB). The"
          " source port is normally a random high number chosen by the "
          "client and is rarely interesting by itself.",
          "TCP is connection oriented: it starts with a handshake (SYN, "
          "SYN-ACK, ACK), carries data, and ends with FIN or RST. UDP has"
          " no handshake, which is why DNS and many tunnels use it.",
          "ICMP carries control messages such as ping. It has no ports, "
          "so unusual volumes or payload sizes in ICMP deserve a closer "
          "look.",
          "A port is only a convention. Malware can run command and "
          "control on port 443 or 53 precisely because those ports are "
          "almost always allowed. Never treat the port number as proof of"
          " the protocol.",
        ],
      ),
      LessonSection(
        heading: "Direction, NAT and Whose Address Is It?",
        body:
            "Before judging any entry, decide the direction. Inbound means "
            "an outside host started the connection to your network. "
            "Outbound means an internal host started it. Most serious "
            "post-compromise activity, such as beaconing and exfiltration, "
            "is outbound, because firewalls are strict about inbound and "
            "relaxed about outbound.\n"
            "\n"
            "Network address translation (NAT) adds a trap. Many internal "
            "hosts share one public address, so an external log or a "
            "partner's report may name only your gateway. To find the real "
            "host you need the NAT or firewall translation logs, or the "
            "proxy log that records the internal client address. Time "
            "matters here too: DHCP leases change, so \"who had 192.0.2.57 "
            "at 14:03?\" must be answered from DHCP or VPN logs for that "
            "exact time, not from today's assignment.",
      ),
      LessonSection(
        heading: "DNS: The Phone Book Everything Uses",
        body:
            "The Domain Name System turns names such as portal.example into"
            " IP addresses. Almost every connection begins with a DNS "
            "query, which makes DNS logs one of the most valuable records "
            "you have. Even when the traffic that follows is encrypted, the"
            " name that was looked up is usually visible.",
        bullets: [
          "A / AAAA records map a name to an IPv4 / IPv6 address.",
          "CNAME maps one name to another (common with CDNs, which is a "
          "reason one site resolves to many addresses).",
          "MX names mail servers; TXT holds free text such as SPF "
          "policies, and is also a favorite for tunneling because it can "
          "carry arbitrary strings.",
          "NXDOMAIN means the name does not exist. A burst of NXDOMAIN "
          "answers from one host can indicate generated domain names or "
          "misconfiguration.",
          "TTL says how long an answer may be cached. Very low TTLs on a "
          "new domain can mean the operator moves infrastructure often.",
          "Internal hosts should use your resolvers. A host talking DNS "
          "directly to an outside server on port 53, or using DNS over "
          "HTTPS to a public resolver, bypasses your logging and is worth"
          " a question.",
        ],
      ),
      LessonSection(
        heading: "HTTP and TLS: What You Can and Cannot See",
        body:
            "HTTP is the language of the web. In plain HTTP you can read "
            "the method (GET, POST), the host, the URL path, the user agent"
            " and the response code. A response code starting with 2 means "
            "success, 3 a redirect, 4 a client error and 5 a server error. "
            "Large POST requests going out, or repeated 404 responses "
            "coming back, tell different stories.\n"
            "\n"
            "Most web traffic is now HTTPS, which wraps HTTP in TLS. "
            "Encryption hides the path, headers and content, but a "
            "surprising amount remains visible without decrypting anything:"
            " the destination IP and port, the volume and timing, the "
            "server name the client asks for (the SNI field, in most "
            "connections), the certificate the server presents, and the TLS"
            " version and cipher choices. Network tools can also "
            "fingerprint the client's handshake; names such as JA3 and JA4 "
            "refer to these fingerprints. Treat a fingerprint as a clue "
            "that the same software made two connections, never as proof of"
            " what the software is.\n"
            "\n"
            "Some organizations decrypt traffic at a proxy or firewall. "
            "Know whether yours does. If it does not, your investigation "
            "will lean on metadata, and that is normal rather than a "
            "failure.",
      ),
      LessonSection(
        heading: "Flows: Conversations Without Content",
        body:
            "A flow record summarizes one conversation between two "
            "endpoints: the five-tuple, start and end time, bytes and "
            "packets in each direction, and often TCP flags. NetFlow, IPFIX"
            " and similar formats produce these records from routers, "
            "switches and sensors. Flows do not contain payloads, so they "
            "are small enough to keep for months, which makes them ideal "
            "for answering questions like \"did anything else talk to this "
            "address in the last 90 days?\"\n"
            "\n"
            "The two numbers analysts use most are bytes out versus bytes "
            "in, and duration. A client normally sends a small request and "
            "receives a larger response. A flow that sends far more than it"
            " receives is an upload, and a long-lived flow with small, "
            "regular packets can be a remote session or a command channel.",
      ),
      LessonSection(
        heading: "Time, Clocks and Evidence Quality",
        body:
            "Network evidence is only as good as its timestamps. Devices "
            "keep their own clocks, and a sensor that drifts by two minutes"
            " can make a reply appear before its request. Make sure your "
            "sources synchronize time with NTP, and when you write notes, "
            "always state the time zone, ideally UTC. When a case depends "
            "on ordering, such as whether the DNS lookup came before the "
            "connection, confirm the clock accuracy of both sources before "
            "you build a story on it.\n"
            "\n"
            "Also weigh how each record was produced. A packet capture is "
            "direct observation. A flow record is a summary computed by a "
            "device. A reputation score is someone else's opinion. Rank "
            "your evidence accordingly, and say which kind each claim rests"
            " on.",
      ),
      LessonSection(
        heading: "Annotated Example: Reading a Flow Record",
        isTemplate: true,
        body:
            "The fictional flow below shows how to turn one line into "
            "questions. Fields are simplified.",
        bullets: [
          "START 2026-10-06 02:14:09  DUR 5412s",
          "SRC 192.0.2.57:51844 (HR-LAPTOP-07)   DST 203.0.113.80:443",
          "PROTO TCP   BYTES_OUT 612 MB   BYTES_IN 3 MB   PKTS_OUT 440212",
          "",
          "READING IT",
          "Direction: outbound, internal laptop to an external server.",
          "Time: 02:14 local, outside this user's normal hours.",
          "Duration: 90 minutes, one long session rather than many page "
          "loads.",
          "Ratio: 612 MB out against 3 MB in. Browsing does not look like"
          " this.",
          "Port: 443, so likely encrypted web traffic, but not proven.",
          "",
          "QUESTIONS TO ASK NEXT",
          "1. What is 203.0.113.80? Check DNS history, certificate and "
          "reputation.",
          "2. Is this a known backup or sync service for HR? Ask the "
          "owner.",
          "3. What process on the laptop made it? Check EDR for that "
          "time.",
          "4. Did this host ever talk to the address before today?",
          "5. Is there a ticket or change that explains a large upload at"
          " night?",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: A DNS Query Log Line",
        isTemplate: true,
        body:
            "Here is a fictional resolver log entry and how to read it.",
        bullets: [
          "2026-10-06T02:13:58Z client=192.0.2.57 "
          "qname=update-check.cdn-assets.example",
          "qtype=A rcode=NOERROR answer=203.0.113.80 ttl=60",
          "",
          "READING IT",
          "Client: the same laptop as the flow above, 11 seconds before "
          "the upload began.",
          "Name: looks like a software update host, but the domain is "
          "unfamiliar.",
          "TTL of 60 seconds: short; the operator may rotate addresses "
          "quickly.",
          "Answer: the same address the flow connected to. This links DNS"
          " to flow.",
          "",
          "WHAT THIS TELLS YOU",
          "The laptop looked up a name, got 203.0.113.80, and connected. "
          "The name is",
          "the best handle you have for pivoting: search all DNS logs for"
          " other hosts",
          "that resolved cdn-assets.example, and check when the domain "
          "was registered.",
        ],
      ),
      LessonSection(
        heading: "What to Check First and Common Mistakes",
        body:
            "When an alert mentions an IP address or domain, work through a"
            " short checklist before drawing conclusions.",
        bullets: [
          "Confirm direction and which host is internal, using NAT or "
          "proxy logs if needed.",
          "Check the time against the user's normal pattern and against "
          "known maintenance windows.",
          "Resolve the indicator: what name, owner and country does it "
          "map to, and for how long?",
          "Compare volume to the baseline for that host or role, not to "
          "an abstract number.",
          "Look for the same destination in DNS, proxy and flow logs; "
          "agreement across sources gives confidence.",
          "Mistake: trusting the port number as proof of the protocol.",
          "Mistake: blocking an address without checking whether it is "
          "shared by a CDN or cloud service that many legitimate sites "
          "use.",
          "Mistake: forgetting that logs use different time zones. "
          "Normalize everything to UTC before you compare.",
        ],
      ),
      LessonSection(
        heading: "ATT&CK Connections and Data Sources",
        body:
            "Network fundamentals underpin several ATT&CK techniques you "
            "will meet in this chapter. T1071 Application Layer Protocol "
            "(Command and Control) covers command traffic that blends in "
            "with HTTP, HTTPS or DNS. T1573 Encrypted Channel (Command and "
            "Control) covers encrypting that traffic. T1046 Network Service"
            " Discovery (Discovery) covers scanning for open ports and "
            "services. T1040 Network Sniffing (Credential Access and "
            "Discovery) covers capturing traffic on the network.\n"
            "\n"
            "The data sources you will use most are DNS resolver logs, "
            "firewall connection logs, proxy logs, flow records, and packet"
            " captures. The next lesson explains what each one records and "
            "where each one is blind.",
      ),
    ],
  ),
  Lesson(
    title: "Network Log Sources: Firewall, Proxy, DNS, NetFlow and IDS",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "One Network, Many Witnesses",
        body:
            "No single log tells the whole story. Each device sees the "
            "network from a different angle, and each is blind in a "
            "different way. A good analyst knows what every source can and "
            "cannot say, and chooses the one that answers the question at "
            "hand. When two sources agree, your confidence rises. When they"
            " disagree, the disagreement is itself a lead: perhaps traffic "
            "was blocked at one point but allowed at another, or an address"
            " was translated between them.\n"
            "\n"
            "This lesson walks through the five sources you will use most, "
            "then shows how to line them up into a single timeline.",
      ),
      LessonSection(
        heading: "Firewall Logs",
        body:
            "A firewall decides which connections are allowed between "
            "network zones, and it logs those decisions. Entries normally "
            "include time, source and destination address and port, "
            "protocol, the action (allow, deny, drop), the rule that "
            "matched, and sometimes bytes and session duration. "
            "Next-generation firewalls may add an application label and "
            "user identity.",
        bullets: [
          "Best for: who talked to whom, whether it was allowed, and how "
          "much data moved.",
          "Strong signal: many denied connections from one source to many"
          " destinations or ports (scanning), or an allowed connection "
          "from a server that never normally initiates outbound traffic.",
          "Blind spots: it usually cannot see inside encrypted payloads, "
          "and an \"allow\" tells you only that policy permitted the "
          "connection, not that it was safe.",
          "Watch the rule name. Traffic matching a very broad \"allow any\""
          " rule is more interesting than traffic matching a narrow, "
          "purposeful rule.",
          "Application labels are guesses made by the device. Treat them "
          "as hints, especially for encrypted traffic.",
        ],
      ),
      LessonSection(
        heading: "Proxy and Web Gateway Logs",
        body:
            "A web proxy sits between users and the internet. Because it "
            "terminates the web request for the client, its records are "
            "richer than a firewall's: the internal client address or "
            "username, the full URL (when the traffic is inspected, or the "
            "host name when it is not), the method, response code, bytes "
            "sent and received, the user agent, the category assigned to "
            "the site, and any block reason.",
        bullets: [
          "Best for: attributing web activity to a person or device, "
          "spotting unusual user agents, and seeing downloads and "
          "uploads.",
          "Strong signal: a workstation requesting the same path at fixed"
          " intervals, a command-line style user agent from a user "
          "workstation, or a first-seen site in a category such as newly "
          "registered domains.",
          "Blind spots: traffic that does not use the proxy (direct "
          "connections, non-web protocols), and the content of HTTPS when"
          " it is not decrypted.",
          "Compare the Host header or SNI to the destination address. A "
          "mismatch can point to domain fronting or a misconfigured "
          "service.",
        ],
      ),
      LessonSection(
        heading: "DNS Logs",
        body:
            "Resolver logs record which client asked for which name, what "
            "type of record, and what answer came back. They are cheap to "
            "store and extremely useful, because nearly everything begins "
            "with a lookup. DNS logs also let you find infected hosts that "
            "talk to a malicious domain even when the later connection is "
            "blocked or encrypted.",
        bullets: [
          "Best for: finding every host that touched a suspicious domain,"
          " spotting generated names, and detecting tunneling through "
          "long or high-volume queries.",
          "Strong signal: one host making thousands of queries to "
          "subdomains of a single unusual domain; many NXDOMAIN answers; "
          "queries for TXT or NULL records that normal software rarely "
          "uses.",
          "Blind spots: hosts that use a resolver you do not log, DNS "
          "over HTTPS inside a browser, and clients that connect straight"
          " to an IP address without any lookup.",
          "Cache effects: if the resolver cached the answer, later "
          "clients may not generate an upstream query. Log at the "
          "client-facing side of the resolver.",
        ],
      ),
      LessonSection(
        heading: "NetFlow, IPFIX and Similar Flow Data",
        body:
            "As the previous lesson showed, flow records summarize "
            "conversations without content. They are collected from "
            "routers, switches, cloud virtual networks and dedicated "
            "sensors. Cloud providers offer their own flow logs for virtual"
            " networks; check current documentation for field names, "
            "because they differ.",
        bullets: [
          "Best for: long-term history, spotting volume and timing "
          "patterns, and checking whether a host ever contacted an "
          "address in the past months.",
          "Strong signal: very regular connection intervals, a server "
          "uploading far more than it downloads, or one internal host "
          "contacting many internal hosts on one port.",
          "Blind spots: no names, no URLs, no content. Sampled flow data "
          "may miss small conversations entirely, so absence of a flow is"
          " weak evidence if sampling is on.",
          "Flow timestamps usually mark when the record was exported, "
          "which can lag the real start. Allow a margin when correlating.",
        ],
      ),
      LessonSection(
        heading: "IDS and IPS Alerts",
        body:
            "An intrusion detection system (IDS) inspects traffic and "
            "raises an alert when it matches a signature or rule or an "
            "anomaly model; an intrusion prevention system (IPS) can also "
            "block. Suricata and Snort are well-known open-source engines; "
            "check current availability and rule sets before relying on "
            "them. An alert carries the rule identifier and message, the "
            "addresses and ports, and sometimes a packet excerpt.",
        bullets: [
          "Best for: a fast pointer to known-bad patterns, with a rule "
          "you can read to learn exactly what triggered it.",
          "Strong signal: an alert on a host that also shows odd DNS or "
          "proxy behavior. Independent sources agreeing is far stronger "
          "than one alert alone.",
          "Blind spots: encrypted payloads, traffic the sensor never saw,"
          " and new techniques without a rule. No alert does not mean no "
          "attack.",
          "Always read the rule. A rule that fires on a user agent "
          "string, for example, may be matching a perfectly legitimate "
          "update tool.",
        ],
      ),
      LessonSection(
        heading: "Retention, Sampling and Coverage",
        body:
            "Before you promise an answer, check what history you actually "
            "have. DNS and proxy logs might be kept for 30 to 90 days, "
            "flows for longer, full packets for hours or days, and every "
            "organization differs. Ask early: how long is each source "
            "retained, is it sampled, and which network segments does it "
            "cover? Cloud networks, remote workers on VPN and guest "
            "wireless often have different or weaker coverage than the "
            "office core.\n"
            "\n"
            "When a log you need has already rolled off, say so in the case"
            " notes and look for a second-best source rather than guessing."
            " If an investigation is likely to need older data, ask the "
            "owner of the platform to preserve it before the retention "
            "window closes.",
      ),
      LessonSection(
        heading: "Annotated Example: Lining Up Four Sources",
        isTemplate: true,
        body:
            "The fictional timeline below combines four sources for the "
            "same laptop. Times are UTC.",
        bullets: [
          "02:13:58  DNS     192.0.2.57 asks for "
          "update-check.cdn-assets.example",
          "                   answer 203.0.113.80, ttl 60",
          "02:14:09  FLOW    192.0.2.57 -> 203.0.113.80:443  start of "
          "long session",
          "02:14:10  PROXY   (none)  -- no proxy record for this host and"
          " destination",
          "02:14:11  FW      ALLOW rule 'outbound-any-443'  from HR zone "
          "to internet",
          "02:15:30  IDS     ET-style rule 'TLS cert self-signed to rare "
          "host'",
          "                   src 192.0.2.57 dst 203.0.113.80",
          "",
          "WHAT THE ALIGNMENT SHOWS",
          "The connection did not go through the proxy, so the usual web "
          "controls and",
          "user attribution are missing. The firewall allowed it under a "
          "broad rule.",
          "The IDS saw an unusual certificate. Four sources agree on one "
          "host and one",
          "destination, so this is worth escalation even though no single"
          " entry is",
          "conclusive. The next step is to ask the endpoint which process"
          " opened it.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: Reading a Proxy Log Line",
        isTemplate: true,
        body:
            "A fictional proxy entry with notes on what each field "
            "contributes.",
        bullets: [
          "2026-10-06T09:41:12Z user=asmith src=192.0.2.88 method=POST",
          "url=https://files-share.example/upload/a91f?id=7 status=200",
          "bytes_out=48211904 bytes_in=312 ua=\"curl/8.5.0\" category=File "
          "Sharing",
          "",
          "READING IT",
          "user and src: attribution to a named person and device. Verify"
          " the pairing.",
          "POST with 48 MB out and 312 bytes back: an upload, not a page "
          "view.",
          "User agent curl: a command-line tool, unusual for an HR "
          "employee.",
          "Category File Sharing: policy may allow it, but the tool "
          "choice is odd.",
          "",
          "CAUTION",
          "This is not proof of theft. A developer, an IT admin or a "
          "script may use",
          "curl legitimately. The next question is whether the pattern "
          "fits the",
          "person's role, and whether the file contents were sensitive.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes and What to Check First",
        body:
            "Most errors in network analysis come from trusting one source "
            "or mishandling time and identity.",
        bullets: [
          "Check time zones and clock drift first. A one-hour offset can "
          "make unrelated events look linked, or related events look "
          "separate.",
          "Resolve addresses to hosts at the time of the event, using "
          "DHCP, VPN and NAT logs.",
          "Do not read a firewall allow as proof of compromise or a deny "
          "as proof of safety. Denies show an attempt; allows show an "
          "opportunity.",
          "Do not rely on IDS silence. Check whether the sensor covers "
          "the segment and whether rules are current.",
          "Record which sources you checked and which you could not. An "
          "honest note of blind spots saves the next analyst hours.",
          "Technique references: T1071.001 Web Protocols and T1071.004 "
          "DNS (Command and Control) are the most common mappings for "
          "what these logs reveal, and T1041 Exfiltration Over C2 Channel"
          " (Exfiltration) describes data leaving through the same "
          "channel.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Spotting Beaconing, Scanning and Tunneling",
    estimatedMinutes: 19,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Patterns, Not Single Events",
        body:
            "Most of what makes network traffic suspicious cannot be seen "
            "in one log line. It shows up in the shape of activity over "
            "time: how regular it is, how much there is, how many places it"
            " goes and how it differs from the host's normal behavior. "
            "Learning these shapes lets you find threats that carry no "
            "known signature.\n"
            "\n"
            "This lesson covers four patterns: scanning, beaconing, "
            "tunneling and unusual data volume. For each you will see what "
            "it looks like, the legitimate things that look the same, and "
            "the evidence that separates them.",
      ),
      LessonSection(
        heading: "Scanning and Reconnaissance",
        body:
            "Scanning is probing to learn what exists and what is open. "
            "Attackers scan from outside (ATT&CK T1595 Active Scanning, "
            "Reconnaissance) and, once inside, scan internally (T1046 "
            "Network Service Discovery and T1018 Remote System Discovery, "
            "Discovery). Scans come in a few shapes.",
        bullets: [
          "Horizontal scan: one source touches the same port on many "
          "addresses, such as port 445 across a whole subnet. Typical of "
          "worm-like spread or a hunt for a specific vulnerable service.",
          "Vertical scan: one source touches many ports on one address. "
          "Typical of mapping a single interesting server.",
          "Slow scan: probes spread over hours or days to stay under "
          "thresholds. Look at counts per source over a long window, not "
          "per minute.",
          "On the wire, expect many short flows with few packets, many "
          "TCP resets or ICMP unreachable responses, and a large count of"
          " distinct destinations per source.",
          "Inbound internet scanning is constant background noise. "
          "Prioritize scans that came from inside your network, and scans"
          " followed by a successful connection to a probed service.",
        ],
      ),
      LessonSection(
        heading: "Beaconing and Command and Control",
        body:
            "After an implant is running, it must ask its operator for "
            "instructions. Many implants do this by calling out at "
            "intervals, a behavior called beaconing. The calls are usually "
            "small, and the operator's reply is usually small until a task "
            "is issued. This falls under ATT&CK T1071 Application Layer "
            "Protocol and, when the channel is encrypted, T1573 Encrypted "
            "Channel (both Command and Control).\n"
            "\n"
            "What gives beaconing away is regularity. A person browsing "
            "produces bursts and gaps. An implant that sleeps for 60 "
            "seconds produces connections close to every 60 seconds. "
            "Operators add jitter, a random variation such as plus or minus"
            " 20 percent, to hide this, so look for intervals that cluster "
            "around a value rather than matching it exactly.",
        bullets: [
          "Intervals: compute the time between successive connections "
          "from one host to one destination. Low variation in those gaps "
          "is the signal.",
          "Size: request and response sizes that are almost the same each"
          " time, with occasional larger transfers when a task is issued.",
          "Persistence: the pattern runs around the clock, including "
          "nights, weekends and when the user is away.",
          "Destination: a rarely seen or newly registered domain, a "
          "direct IP address, or a low-reputation hosting range.",
          "Client: an unusual user agent, a missing or odd Host header, "
          "or a TLS fingerprint unlike the browsers on that machine.",
          "Related techniques: T1568 Dynamic Resolution, including "
          "generated domain names (T1568.002), when infected hosts query "
          "many random-looking names, and T1090 Proxy when traffic is "
          "relayed through intermediate hosts.",
        ],
      ),
      LessonSection(
        heading: "Legitimate Things That Look Like Beacons",
        body:
            "Regular timing is not unique to malware. Plenty of ordinary "
            "software phones home on a schedule. Before escalating, rule "
            "out the common benign sources.",
        bullets: [
          "Operating system and application update checks, antivirus and "
          "EDR agent heartbeats, and time synchronization (NTP).",
          "Monitoring and management tools, mail clients polling for new "
          "messages, chat and collaboration apps keeping a connection "
          "alive.",
          "Cloud sync clients, license checks, and browser extensions "
          "that refresh feeds.",
          "Web pages left open that refresh themselves, and dashboards on"
          " a wall screen.",
          "How to tell them apart: the destination belongs to a known "
          "vendor and has a long history in your DNS logs; many hosts do "
          "the same thing; the certificate and name match the product; "
          "and the process on the endpoint is signed software you can "
          "identify.",
        ],
      ),
      LessonSection(
        heading: "Tunneling and Covert Channels",
        body:
            "Tunneling wraps one protocol inside another to slip past "
            "controls (ATT&CK T1572 Protocol Tunneling, Command and "
            "Control). DNS tunneling is the classic example for analysts. "
            "The client encodes data into the labels of a query, such as a "
            "long string in front of a domain the attacker controls, and "
            "the attacker's name server reads the queries and replies with "
            "encoded answers. Because DNS is nearly always permitted, the "
            "channel gets through (T1071.004 DNS).",
        bullets: [
          "Very long query names, often 50 characters or more in the "
          "leftmost labels, with random-looking strings of letters and "
          "digits.",
          "A very large number of unique subdomains under one parent "
          "domain from a single client, far above what any application "
          "needs.",
          "Heavy use of TXT, NULL or CNAME queries, which normal browsing"
          " seldom generates in volume.",
          "Steady query rate over a long period, and large response sizes"
          " compared with normal lookups.",
          "Other forms: HTTP or HTTPS tunnels, SSH tunnels on unusual "
          "ports, and ICMP with oversized payloads (T1095 Non-Application"
          " Layer Protocol covers some of these).",
          "Legitimate lookalikes: some security products, content filters"
          " and email reputation services encode data in DNS names by "
          "design. Identify the owning domain before escalating.",
        ],
      ),
      LessonSection(
        heading: "Unusual Volume and Exfiltration",
        body:
            "Data theft over the network appears under ATT&CK's "
            "Exfiltration tactic: T1041 Exfiltration Over C2 Channel, T1048"
            " Exfiltration Over Alternative Protocol, T1567 Exfiltration "
            "Over Web Service, and T1030 Data Transfer Size Limits, where "
            "the attacker sends data in capped chunks to avoid alarms. "
            "Attackers often stage data on one internal host first, so look"
            " for large internal transfers to that host before the large "
            "outbound one.",
        bullets: [
          "Compare bytes out to a baseline for that host or role. A file "
          "server sending gigabytes to the internet at night is very "
          "different from a design workstation doing the same during a "
          "project.",
          "Look at the ratio of upload to download and the destination: "
          "personal cloud storage, file-sharing sites, paste sites and "
          "unfamiliar hosting.",
          "Watch for archive file types in proxy URLs and for many "
          "uploads of near-identical size.",
          "Consider insider cases: the same patterns apply, but the actor"
          " is an authorized user and the destination may be a consumer "
          "service.",
          "Legitimate lookalikes: backups, software releases, video "
          "calls, large downloads that include some upload, and cloud "
          "migrations.",
        ],
      ),
      LessonSection(
        heading: "Measuring Regularity Without Fancy Tools",
        body:
            "You do not need a data science team to test for beaconing. "
            "Export the timestamps for one source and one destination, sort"
            " them, and compute the gap between each pair. Then look at the"
            " spread of those gaps. If most gaps fall within a narrow band "
            "around a single value, the connection is machine-timed. "
            "Compare the number of connections per hour across a full day: "
            "a human has peaks and valleys, a beacon is flat.\n"
            "\n"
            "Spreadsheets, a short script or your SIEM's statistics "
            "commands all work. Many products offer a built-in beacon "
            "score, but treat the score as a pointer that you verify with "
            "the raw gaps, because jitter, long sleep times and proxy "
            "retries all distort automatic scoring.",
      ),
      LessonSection(
        heading: "Annotated Example: A Beacon in Proxy Data",
        isTemplate: true,
        body:
            "These fictional proxy rows are for one host and one "
            "destination. Look at the gaps.",
        bullets: [
          "TIME(UTC)   SRC          URL                              OUT"
          "  IN    UA",
          "03:00:02    192.0.2.61   https://sync-node.example/c      212"
          "  180   Mozilla/4.0",
          "03:01:04    192.0.2.61   https://sync-node.example/c      212"
          "  180   Mozilla/4.0",
          "03:02:01    192.0.2.61   https://sync-node.example/c      212"
          "  181   Mozilla/4.0",
          "03:03:05    192.0.2.61   https://sync-node.example/c      213"
          "  180   Mozilla/4.0",
          "03:04:02    192.0.2.61   https://sync-node.example/c      212"
          "  4096  Mozilla/4.0",
          "",
          "GAPS: 62s, 57s, 64s, 57s -- centered near 60 seconds with "
          "small jitter.",
          "SIZES: out and in almost identical; one larger response at "
          "03:04:02.",
          "UA: an old browser string no current browser sends.",
          "",
          "ASSESSMENT",
          "Strong beacon shape. The larger response may be a task being "
          "delivered.",
          "Next: find the process on 192.0.2.61, check domain age and who"
          " else",
          "resolved sync-node.example, and review what happened after "
          "03:04:02.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: A DNS Tunneling Sample",
        isTemplate: true,
        body:
            "A fictional excerpt from resolver logs. The parent domain "
            "belongs to the attacker.",
        bullets: [
          "03:20:01 192.0.2.61 TXT  a8f3k2m9q1x7z4b6.t1.dns-lab.example",
          "03:20:01 192.0.2.61 TXT  p0w9e8r7t6y5u4i3.t2.dns-lab.example",
          "03:20:02 192.0.2.61 TXT  l5k4j3h2g1f0d9s8.t3.dns-lab.example",
          "... 4,100 more queries to *.dns-lab.example in 12 minutes ...",
          "",
          "SIGNS",
          "Random-looking leftmost labels, every one unique.",
          "Record type TXT, rarely used by normal software in this "
          "volume.",
          "Single client, single parent domain, steady and high rate.",
          "",
          "NEXT STEPS",
          "1. Count unique subdomains and total bytes of query names per "
          "client.",
          "2. Check the registration date and name servers of "
          "dns-lab.example.",
          "3. Block the parent domain at the resolver, then isolate "
          "192.0.2.61 for",
          "   endpoint investigation. Search other clients for the same "
          "domain.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes and What to Check First",
        body:
            "Pattern hunting invites two opposite errors: ignoring slow, "
            "quiet activity, and chasing every regular timer.",
        bullets: [
          "Start with the destination: how old, how common in your "
          "environment, who owns it.",
          "Check how many hosts show the same behavior. One host with a "
          "rare destination is more suspicious than 400 hosts with the "
          "same vendor.",
          "Use long windows. Slow scans, low-and-slow exfiltration and "
          "beacons with long sleep times hide in short windows.",
          "Do not call a connection a beacon from three events. You need "
          "enough samples to see the spread.",
          "Do not declare exfiltration from byte counts alone; confirm "
          "what data and who initiated it.",
          "Pair the network finding with an endpoint check: process, "
          "parent process, user and file activity at the same time.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Reading Packet Captures: Wireshark, Zeek and Suricata",
    estimatedMinutes: 20,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "When to Go to the Packets",
        body:
            "Logs summarize. Packet captures (PCAPs) are the full record: "
            "every packet, in order, with its content if it was not "
            "encrypted. That makes them the ground truth when logs disagree"
            " or when you need to prove exactly what happened. It also "
            "makes them large and sensitive, so most organizations capture "
            "selectively, for example only on key segments, only for a "
            "short rolling window, or only after an alert.\n"
            "\n"
            "As an L1 or L2 analyst you will usually be handed a capture or"
            " asked to pull one, then asked a narrow question: what was "
            "this host talking to, what was downloaded, did the credentials"
            " cross the wire in clear text? Work to the question. Scrolling"
            " through a million packets without one is how hours disappear.",
      ),
      LessonSection(
        heading: "Handle Captures Safely",
        body:
            "A PCAP can contain real malware, real credentials and real "
            "customer data. Treat it as evidence and as a hazard.",
        bullets: [
          "Work on a copy and record the file hash of the original so you"
          " can show it was not altered.",
          "Open it in an analysis environment that is isolated from "
          "production, not on your everyday workstation.",
          "Never click through or execute anything extracted from a "
          "capture outside a sandbox.",
          "Restrict who can access it and delete working copies when the "
          "case closes, following your retention policy.",
          "Note where and when it was captured, the capture point, and "
          "any filter used, because a capture only shows what that point "
          "could see.",
        ],
      ),
      LessonSection(
        heading: "Wireshark: The Interactive Microscope",
        body:
            "Wireshark is a free, widely used packet analyzer. It shows "
            "three panes: the packet list, the protocol details for the "
            "selected packet, and the raw bytes. Its power lies in display "
            "filters, which hide everything except what you ask for. "
            "Filters below use Wireshark display syntax; verify them "
            "against your installed version.",
        bullets: [
          "ip.addr == 192.0.2.57 shows all packets to or from a host.",
          "tcp.port == 443 or udp.port == 53 narrows by port.",
          "dns shows DNS only; dns.qry.name contains \"example\" matches "
          "names.",
          "http.request shows web requests; http.request.method == \"POST\""
          " shows uploads.",
          "tls.handshake.type == 1 shows TLS Client Hello packets, where "
          "the server name appears.",
          "tcp.flags.syn == 1 and tcp.flags.ack == 0 shows connection "
          "attempts, the starting point for scan analysis.",
          "Statistics menu: Conversations ranks pairs of hosts by bytes "
          "and packets; Protocol Hierarchy shows what the capture "
          "contains; Endpoints lists every address.",
          "Follow TCP Stream reassembles one conversation into readable "
          "text, which is how you read an HTTP exchange or spot "
          "clear-text credentials.",
          "File, Export Objects lets you carry out files seen in "
          "unencrypted protocols such as HTTP, for sandbox analysis only.",
        ],
      ),
      LessonSection(
        heading: "A Sensible Order of Work in a Capture",
        body:
            "To keep from drowning, use the same sequence each time.",
        bullets: [
          "1. Protocol Hierarchy: what protocols are present? Anything "
          "unexpected, such as a lot of ICMP or DNS?",
          "2. Conversations: sort by bytes. Which pairs dominate? Is the "
          "top talker explained?",
          "3. DNS: what names did the host look up, and what addresses "
          "came back?",
          "4. TLS and HTTP: for the suspicious conversation, what server "
          "name, certificate and requests appear?",
          "5. Follow the stream if it is clear text; look at timing and "
          "sizes if it is not.",
          "6. Build a short timeline with packet numbers and timestamps "
          "so a colleague can verify your claims.",
        ],
      ),
      LessonSection(
        heading: "Zeek: Turning Traffic Into Structured Logs",
        body:
            "Zeek (formerly Bro) is a free, open-source network analysis "
            "framework. Instead of showing you packets, it watches traffic "
            "and writes structured logs about what it sees. The logs are "
            "text files with one connection or event per line, which makes "
            "them easy to search and to load into a SIEM. Zeek can run on "
            "live traffic or on a PCAP file, which turns a capture into the"
            " same set of logs you would see in production.",
        bullets: [
          "conn.log: one line per connection with the five-tuple, "
          "duration, bytes in each direction, and connection state. The "
          "best starting point.",
          "dns.log: queries, answers, record types and response codes.",
          "http.log: method, host, URI, user agent, status code and "
          "sizes.",
          "ssl.log: TLS version, server name and certificate validation "
          "status. In newer releases the file is named ssl.log; check "
          "your version.",
          "x509.log: details of certificates, such as subject and "
          "validity dates.",
          "files.log: files seen on the wire with hashes, useful for "
          "matching known-bad files.",
          "notice.log: events that Zeek's scripts decided were worth "
          "flagging, such as a scan or an invalid certificate.",
          "uid: a unique ID that appears in every log line for the same "
          "connection, letting you pivot from conn.log to dns.log or "
          "http.log for that conversation.",
        ],
      ),
      LessonSection(
        heading: "Suricata: Signatures and Metadata in One Engine",
        body:
            "Suricata is a free, open-source engine that can act as an IDS "
            "or IPS, monitor network security and also write rich metadata."
            " It reads rules, each describing a pattern in traffic, and "
            "writes events to a JSON file called eve.json. Each event has a"
            " type: alert, dns, http, tls, flow and others. Because "
            "eve.json is structured, you can filter by rule ID, host or "
            "time with ordinary tools.\n"
            "\n"
            "The skill is to read the rule, not just the message. A rule "
            "has an action, a protocol, the addresses and ports it applies "
            "to, and a set of match options. Reading those shows you "
            "exactly what the engine saw. Rules are managed in rule sets; "
            "check current availability and update practices for the sets "
            "your organization uses.",
      ),
      LessonSection(
        heading: "Annotated Example: A Zeek conn.log Entry",
        isTemplate: true,
        body:
            "Fields are shortened and the data is fictional.",
        bullets: [
          "ts=2026-10-06T02:14:09Z uid=CxY1a9 id.orig_h=192.0.2.57 "
          "id.orig_p=51844",
          "id.resp_h=203.0.113.80 id.resp_p=443 proto=tcp service=ssl",
          "duration=5412.3 orig_bytes=641234112 resp_bytes=3112004 "
          "conn_state=SF",
          "",
          "READING IT",
          "uid CxY1a9: use this to find the matching ssl.log and x509.log"
          " lines.",
          "service=ssl: Zeek identified TLS by content, not just by port.",
          "orig_bytes far larger than resp_bytes: client uploaded about "
          "641 MB.",
          "conn_state SF: the connection was established and closed "
          "normally.",
          "",
          "PIVOT",
          "Search ssl.log for uid CxY1a9 to see the server name and "
          "certificate.",
          "If the certificate is self-signed or newly issued, raise the "
          "priority.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: Reading a Suricata Alert",
        isTemplate: true,
        body:
            "A fictional alert record in simplified form, with notes.",
        bullets: [
          "{ \"timestamp\":\"2026-10-06T02:15:30Z\", \"event_type\":\"alert\",",
          "  \"src_ip\":\"192.0.2.57\", \"dest_ip\":\"203.0.113.80\", "
          "\"dest_port\":443,",
          "  \"alert\":{ \"signature_id\":9000123, \"signature\":\"LAB "
          "Self-signed TLS",
          "  certificate to rare host\", \"severity\":2 },",
          "  \"tls\":{ \"sni\":\"update-check.cdn-assets.example\", "
          "\"issuerdn\":\"CN=localhost\" } }",
          "",
          "READING IT",
          "The signature fires on an unusual certificate, not on known "
          "malware.",
          "SNI matches the DNS name seen earlier, linking the alert to "
          "the lookup.",
          "Issuer CN=localhost is typical of a quickly built server, not "
          "a vendor.",
          "",
          "WHAT TO DO",
          "Read rule 9000123 to see exactly what it checks. Then search "
          "for other",
          "hosts that match the same signature or resolve the same name, "
          "and decide",
          "whether this looks like a true positive or a poorly maintained"
          " internal tool.",
        ],
      ),
      LessonSection(
        heading: "Working With Encrypted Traffic",
        body:
            "Most captures you meet will be mostly encrypted, and that is "
            "fine. You can still learn a great deal from handshake data, "
            "certificates, sizes and timing. In a TLS Client Hello you can "
            "read the server name and the offered ciphers; in the server's "
            "reply you can read the certificate chain on older protocol "
            "versions, and in newer versions less of it is visible. "
            "Short-lived certificates, self-signed certificates, names that"
            " do not match the one requested and unusual validity periods "
            "are all clues, though none is proof on its own.\n"
            "\n"
            "If your organization decrypts traffic at a gateway, the "
            "decrypted view lives in proxy or gateway logs rather than in a"
            " plain capture. Another route is an endpoint log or key log "
            "supplied for the investigation. Do not try to decrypt other "
            "people's traffic without authorization, and follow your "
            "privacy policy and legal guidance about what you may inspect.",
      ),
      LessonSection(
        heading: "Checklist: Questions a Capture Can Answer",
        body:
            "Keep this list in mind when you open a PCAP.",
        bullets: [
          "Who are the top talkers, and is each one explained?",
          "What names were looked up before the connection began?",
          "Is the traffic really the protocol its port suggests?",
          "What does the TLS handshake reveal: server name, certificate, "
          "version?",
          "Are credentials or data visible in clear text? If so, treat "
          "them as compromised and report it.",
          "Do timing and sizes look machine-regular?",
          "What files crossed the wire, and do their hashes match "
          "known-bad lists?",
          "Mistake to avoid: concluding that encrypted traffic is safe, "
          "or that it is malicious, from the encryption alone. Most "
          "traffic is encrypted and most of it is legitimate.",
          "Technique references: T1040 Network Sniffing (Credential "
          "Access, Discovery) is what an attacker does; T1105 Ingress "
          "Tool Transfer (Command and Control) is what you often see in "
          "captures when a tool is downloaded.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Network Investigation Workflow and False Positives",
    estimatedMinutes: 20,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "From Alert to Answer",
        body:
            "Good network investigations follow a repeatable path. The goal"
            " is not to inspect every packet but to decide, with evidence, "
            "whether the activity is malicious, benign or unknown, and what"
            " to do about it. A repeatable path keeps you fast, keeps your "
            "notes consistent, and makes it easy for a colleague to pick up"
            " the case.\n"
            "\n"
            "The workflow below suits an alert such as \"host contacted a "
            "suspicious domain\", \"possible beaconing detected\" or \"large "
            "outbound transfer\".",
      ),
      LessonSection(
        heading: "The Workflow, Step by Step",
        body:
            "Work through the steps in order, and write down what you find "
            "at each one.",
        bullets: [
          "1. Understand the alert. What rule or model fired, on what "
          "data, and what exactly did it claim? Many false alarms die "
          "here because the rule is looser than the title suggests.",
          "2. Identify the assets. Which internal host, user and role? "
          "Use DHCP, VPN and NAT logs to be sure you have the right "
          "machine at the right time.",
          "3. Identify the indicator. What is the external IP or domain? "
          "Check reputation, age, owner, hosting and whether it is shared"
          " with a CDN or cloud service.",
          "4. Build the timeline. Gather DNS, proxy, firewall, flow and "
          "IDS records around the event, normalized to UTC.",
          "5. Check the pattern. Is it regular, rare, large, spread over "
          "many hosts? Compare against the baseline for this host and "
          "role.",
          "6. Pivot. Which other hosts contacted the same indicator? What"
          " did this host do just before and after?",
          "7. Go to the endpoint. Which process made the connection, what"
          " started it, and what files or persistence appeared? Network "
          "data tells you what happened; the endpoint tells you why.",
          "8. Decide and document: true positive, false positive or "
          "benign true positive, with the evidence for the verdict.",
          "9. Act: contain, block, escalate or tune, following your "
          "runbook and approval rules.",
        ],
      ),
      LessonSection(
        heading: "False Positives: Why They Happen",
        body:
            "A false positive is an alert on activity that is not a threat."
            " They are unavoidable, and handling them well is a core part "
            "of the job. Network false positives come from a few repeating "
            "causes.",
        bullets: [
          "Vulnerability scanners and asset discovery tools. Your own "
          "security team and IT run scanners that deliberately probe "
          "everything. Their traffic looks exactly like an attacker's "
          "scan because it is one.",
          "Content delivery networks and cloud services. One IP address "
          "can serve thousands of unrelated sites, and one site can "
          "answer from thousands of addresses. Reputation for the address"
          " may reflect another tenant's behavior.",
          "Shared and recycled infrastructure. An address flagged last "
          "month may now belong to a harmless customer, and the reverse "
          "is also true.",
          "Software that polls on a schedule: update checks, agents, mail"
          " and chat clients, monitoring probes.",
          "Backup, replication and sync jobs that move large volumes at "
          "night.",
          "Search engine crawlers, uptime monitors and research scanners "
          "that probe public servers from known ranges.",
          "Misconfigured systems: a server pointed at a decommissioned "
          "DNS name creates endless NXDOMAIN answers without any attacker"
          " involved.",
        ],
      ),
      LessonSection(
        heading: "Telling a Scanner From an Attacker",
        body:
            "Because your own scanners are noisy, know them. Ask the "
            "vulnerability management team for the scanner addresses, "
            "schedules and scan windows, and keep an allowlist that is "
            "reviewed regularly. Then use the questions below.",
        bullets: [
          "Does the source address belong to a documented scanner, and "
          "does the activity fall in an approved window?",
          "Is the pattern systematic, covering every host and port "
          "evenly, as a tool does, or targeted at a few services, as a "
          "human exploring might?",
          "Did anything follow the scan, such as a login attempt, an "
          "exploit alert or a new outbound connection? A scan alone is "
          "reconnaissance; a scan then a success is an incident.",
          "For external scanners, do the address and reverse DNS identify"
          " a known research or search service? Check current published "
          "ranges rather than guessing.",
          "Never allowlist an address permanently because of one benign "
          "finding. Allowlist for a specific purpose, owner and review "
          "date.",
        ],
      ),
      LessonSection(
        heading: "Telling a CDN From a Command Server",
        body:
            "Attackers deliberately hide behind popular cloud and CDN "
            "providers, and legitimate sites live there too, so the address"
            " alone proves little in either direction. Shift to evidence "
            "that does not depend on the address.",
        bullets: [
          "The domain name: age, registration, similarity to a brand, "
          "history in your own DNS logs.",
          "The certificate: issuer, validity period, and whether the name"
          " matches the one the client asked for.",
          "The behavior: regular small requests to a rarely seen name is "
          "different from a one-time page load to a popular site.",
          "The spread: if hundreds of hosts use it, it is probably a "
          "business service. If one host does, it is probably worth "
          "looking at.",
          "The client: browsers and system services behave one way; a "
          "script, an unsigned binary or a rare user agent behaves "
          "another.",
          "Blocking a CDN address can break many legitimate services. "
          "Prefer blocking the specific domain, URL or fingerprint at the"
          " proxy or resolver, with approval.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: An Investigation Note",
        isTemplate: true,
        body:
            "A concise note like this lets a colleague pick up the case "
            "without redoing your work. The data is fictional.",
        bullets: [
          "CASE: Possible beaconing from 192.0.2.61 (FIN-WS-22, user "
          "bjones)",
          "ALERT: Beaconing model, 60 second interval to "
          "sync-node.example",
          "",
          "EVIDENCE",
          "- Proxy: 1,440 requests in 24 hours, gaps 57-64s, "
          "near-identical sizes.",
          "- DNS: sync-node.example first seen in our environment 5 days "
          "ago; only",
          "  this host has resolved it. Domain registered 9 days ago "
          "(whois).",
          "- Flow: no other host contacted 203.0.113.99 in 90 days.",
          "- UA: 'Mozilla/4.0', not used by any browser on the asset "
          "list.",
          "- EDR: process svc_helper.exe, unsigned, started from the "
          "user's Temp folder.",
          "",
          "ASSESSMENT: True positive, high confidence. Likely T1071.001 "
          "Web Protocols",
          "(Command and Control). Not a vendor service: no other host, "
          "unsigned file.",
          "",
          "ACTIONS: Isolated host via EDR (approved by lead); blocked "
          "sync-node.example",
          "at proxy and resolver; escalated to Incident Response; "
          "preserved proxy",
          "logs and a memory image. OPEN: determine how the file arrived.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: A False Positive Closed Properly",
        isTemplate: true,
        body:
            "Not every investigation ends in escalation. A good closure "
            "note is as valuable as a good escalation. Fictional data "
            "again.",
        bullets: [
          "CASE: Port scan alert, source 192.0.2.200, destination: whole "
          "192.0.2.0/24",
          "ALERT: Horizontal scan, 4,800 connection attempts in 11 "
          "minutes",
          "",
          "CHECKS",
          "- Source belongs to vuln-scan-01, listed in the scanner "
          "inventory.",
          "- Time matches the monthly authorized scan window (calendar "
          "entry).",
          "- Pattern even across all hosts; no successful logins or "
          "exploit alerts",
          "  from this source afterward.",
          "",
          "VERDICT: Benign true positive. Real scan, authorized.",
          "ACTION: Closed. Suggested a tuning request so the scanner's "
          "approved window",
          "is suppressed with an owner and review date, instead of a "
          "permanent",
          "allowlist. Noted that the scanner should be excluded from "
          "beacon models.",
        ],
      ),
      LessonSection(
        heading: "Handling Uncertainty and Escalating Well",
        body:
            "Many network cases end in a middle state: the evidence is "
            "suspicious but not conclusive. That is a normal result, not a "
            "failure. In that case state what is known, what is unknown and"
            " what single check would settle it, then hand the case on or "
            "keep it open with a date to revisit. Escalate when the "
            "combination of rare destination, endpoint evidence and "
            "unexplained behavior crosses your runbook threshold, and "
            "escalate early when sensitive data may be involved.\n"
            "\n"
            "When you hand off, give the next person the indicators, the "
            "timeline, the sources checked, the sources not available, your"
            " confidence level and the actions already taken. A clear "
            "handoff turns hours of rework into minutes and builds trust in"
            " your judgment.",
      ),
      LessonSection(
        heading: "Habits of a Good Analyst",
        body:
            "Tools change, and so do attackers. These habits last.",
        bullets: [
          "Ask what the data can and cannot see before you trust a "
          "conclusion.",
          "Use at least two independent sources before escalating on a "
          "network finding.",
          "Normalize time to UTC and resolve identities at the time of "
          "the event.",
          "Compare to a baseline: is this unusual for this host, this "
          "role, this hour?",
          "Pivot outward: other hosts, other days, other indicators.",
          "Pair network evidence with endpoint evidence to explain why, "
          "not only what.",
          "State your confidence honestly, with the evidence behind it, "
          "and label what you could not check.",
          "Contain proportionally. Isolate a host only with authority, "
          "and avoid blocking shared infrastructure blindly.",
          "Write notes a stranger could follow, with indicators, "
          "timestamps and sources.",
          "Feed back what you learn: tune noisy rules, update allowlists "
          "with owners, and share new indicators.",
          "Keep learning from the ATT&CK site at https://attack.mitre.org"
          " and from public packet capture exercises, using only data you"
          " are permitted to use.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Practice Test: Network & Traffic Analysis",
    estimatedMinutes: 10,
    difficulty: LessonDifficulty.intermediate,
    quiz: [
      QuizQuestion(
        question: "An alert shows a workstation sending 600 MB to an external "
                  "server over port 443 at 02:00, receiving only 3 MB back. What "
                  "is the best first reading of this?",
        options: [
          "A failed connection, because the response was far smaller than"
          " the request",
          "Normal web browsing, since port 443 is only used for ordinary "
          "websites",
          "An inbound attack, because large transfers always indicate an "
          "outside source",
          "An outbound upload worth questioning against the host's "
          "baseline",
        ],
        correctIndex: 3,
        explanation:
            "Heavy upload with a tiny response means data left the host, "
            "and port 443 does not prove ordinary browsing. Calling it "
            "normal skips the baseline check.",
      ),
      QuizQuestion(
        question: "A colleague says the traffic must be DNS because it uses port "
                  "53. Which statement is the most accurate?",
        options: [
          "Incorrect, because port 53 traffic can never carry anything "
          "except DNS",
          "Not proven, since other protocols can use any port, so check "
          "content",
          "Correct, since the port number guarantees the protocol used on"
          " the connection",
          "Correct, but only when the traffic uses UDP instead of the TCP"
          " transport",
        ],
        correctIndex: 1,
        explanation:
            "Ports are conventions, and attackers deliberately use allowed "
            "ports. Content, volume and tools such as Zeek service "
            "detection show what the traffic really is.",
      ),
      QuizQuestion(
        question: "You need to find which internal host owned 192.0.2.57 at 14:03"
                  " last Tuesday. Which source is best?",
        options: [
          "DHCP, VPN or NAT logs for that exact time, as assignments "
          "change",
          "The external threat intelligence entry for the address in "
          "question",
          "The firewall rule list, which names the host for every address",
          "Today's DHCP lease table, since addresses rarely change "
          "between days",
        ],
        correctIndex: 0,
        explanation:
            "Addresses are reassigned, so you must use records for the "
            "event time. A current lease table can point to the wrong "
            "machine.",
      ),
      QuizQuestion(
        question: "One internal host makes thousands of TXT queries to "
                  "random-looking subdomains of a single unfamiliar domain over "
                  "twelve minutes. Which technique is most likely?",
        options: [
          "A password spraying attempt against the corporate mail server",
          "Port scanning of the local subnet to discover open services "
          "nearby",
          "DNS tunneling, with data encoded in query names for a domain",
          "Ordinary software update checks that poll once an hour on "
          "schedule",
        ],
        correctIndex: 2,
        explanation:
            "Unique long labels, TXT records and a single parent domain "
            "match tunneling (T1572, T1071.004). Update checks are "
            "infrequent and use known names.",
      ),
      QuizQuestion(
        question: "A host connects to the same external URL every 58 to 64 "
                  "seconds, day and night, with nearly identical request sizes. "
                  "What should you do first?",
        options: [
          "Wait several weeks to see whether the pattern eventually "
          "changes shape",
          "Check the destination's age, other hosts using it and the "
          "process",
          "Block the entire hosting provider range before gathering any "
          "context",
          "Dismiss it, because malware always connects at exactly the "
          "same second",
        ],
        correctIndex: 1,
        explanation:
            "Jittered regular timing is a beacon shape, but vendor agents "
            "also poll, so context decides. Exact-second timing is not "
            "required because operators add jitter.",
      ),
      QuizQuestion(
        question: "Which source is best for finding every host that looked up a "
                  "malicious domain, even when the later connection was "
                  "encrypted?",
        options: [
          "Firewall rule change history showing who edited policy "
          "recently",
          "Antivirus quarantine logs from endpoints that blocked a file",
          "Vulnerability scanner reports from the last monthly scan "
          "window",
          "Resolver DNS logs recorded on the client-facing side of it",
        ],
        correctIndex: 3,
        explanation:
            "Nearly every connection begins with a lookup, and the name "
            "stays visible even when the traffic is encrypted. The other "
            "sources do not record who asked for what name.",
      ),
      QuizQuestion(
        question: "Your IDS is silent about a host that you suspect is "
                  "communicating with a command server. What is the right "
                  "conclusion?",
        options: [
          "The host is irrelevant, because only alerting hosts matter in "
          "an investigation",
          "The host is infected, because silence means the attacker "
          "evaded detection",
          "Nothing yet, since the sensor may not see that segment or have"
          " a rule for it",
          "The host is clean, because the sensor would have raised an "
          "alert",
        ],
        correctIndex: 2,
        explanation:
            "Absence of an alert is weak evidence because of coverage gaps,"
            " encryption and missing rules. Silence does not prove "
            "infection either.",
      ),
      QuizQuestion(
        question: "Many TCP resets follow one internal host that touched port 445"
                  " on every address of a subnet within minutes. What is this "
                  "most likely?",
        options: [
          "A horizontal scan, possibly early lateral movement",
          "A DNS tunnel moving stolen data to an outside name server",
          "A vertical scan against one server to map its open services",
          "A backup job copying data to each file server in sequence",
        ],
        correctIndex: 0,
        explanation:
            "One source hitting one port across many addresses is a "
            "horizontal scan (T1046). A vertical scan would hit many ports "
            "on one address.",
      ),
      QuizQuestion(
        question: "A vulnerability scanner owned by your IT team triggers a scan "
                  "alert during its approved window, with no logins or exploits "
                  "afterward. How should you close it?",
        options: [
          "As a false positive, then add the scanner to a permanent "
          "allowlist",
          "As a true positive, then isolate the scanner and open an "
          "incident",
          "As unresolved, then wait for the next scheduled scan to "
          "compare",
          "As a benign true positive, with a note suggesting scoped "
          "tuning",
        ],
        correctIndex: 3,
        explanation:
            "The scan is real but authorized, and scoped suppression with "
            "an owner and review date is safer than a permanent allowlist, "
            "which could hide a real attacker later.",
      ),
      QuizQuestion(
        question: "An address with a bad reputation score is part of a large CDN."
                  " What is the best way to decide if a host is talking to a "
                  "command server?",
        options: [
          "Treat all traffic to any CDN as malicious until proven "
          "otherwise",
          "Judge the domain, certificate, process and number of hosts",
          "Block the address immediately, because reputation scores are "
          "conclusive",
          "Ignore the alert, because CDN addresses are always legitimate",
        ],
        correctIndex: 1,
        explanation:
            "A shared address reflects many tenants, so evidence must come "
            "from the name, certificate and behavior. Blocking the address "
            "can break many legitimate services.",
      ),
      QuizQuestion(
        question: "In Zeek, you spot a suspicious line in conn.log and want the "
                  "matching TLS details. What do you use to pivot?",
        options: [
          "The uid value, shared by every log line of that connection",
          "The source address, since a host makes only one connection",
          "The timestamp alone, since each second holds only one "
          "connection",
          "The destination port, because it is unique to each connection",
        ],
        correctIndex: 0,
        explanation:
            "The uid ties conn.log to ssl.log, dns.log and others for the "
            "same connection. Timestamps, ports and addresses repeat across"
            " many connections.",
      ),
      QuizQuestion(
        question: "In Wireshark you want to see only DNS queries from one host. "
                  "Which approach fits best?",
        options: [
          "Use Follow TCP Stream on a DNS packet to reassemble the "
          "lookups",
          "Export all objects from the capture and search the files for "
          "names",
          "Apply a display filter combining the host address and dns",
          "Open Protocol Hierarchy and delete every non-DNS packet by "
          "hand",
        ],
        correctIndex: 2,
        explanation:
            "Display filters hide everything except what you ask for, such "
            "as ip.addr and dns together. Follow TCP Stream suits TCP "
            "conversations, and DNS here is mostly UDP.",
      ),
      QuizQuestion(
        question: "Which action should an analyst take when a PCAP is provided as"
                  " evidence?",
        options: [
          "Open the original on a daily workstation and export every file"
          " found",
          "Hash the original, analyze a copy in isolation, restrict "
          "access",
          "Share the original capture widely so more colleagues can "
          "review it",
          "Delete the capture after viewing it to protect any private "
          "data",
        ],
        correctIndex: 1,
        explanation:
            "A PCAP can hold malware, credentials and customer data, and "
            "hashing shows integrity. Opening files on a daily workstation "
            "risks infection.",
      ),
      QuizQuestion(
        question: "Which pair of findings gives the strongest basis to escalate a"
                  " possible beacon?",
        options: [
          "Regular timing to a destination used by hundreds of hosts and "
          "signed software",
          "A single connection to a new domain with a normal browser user"
          " agent",
          "Regular timing to a rare, young domain from one unsigned "
          "process",
          "A scheduled backup upload at night from a server with a known "
          "job",
        ],
        correctIndex: 2,
        explanation:
            "Several independent signals together (rarity, age, single "
            "host, unsigned process) outweigh timing alone. Widely shared, "
            "signed, scheduled activity is typically benign.",
      ),
    ],
  ),
];
