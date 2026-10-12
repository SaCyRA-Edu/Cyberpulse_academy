// Threat Intel, Hunting & SOC Operations: a theory module of "The Pulse (SOC Blue Team)". Same
// Lesson/LessonSection/QuizQuestion model as every other module.

import 'lesson_model.dart';

final List<Lesson> socOpsLessons = [
  Lesson(
    title: "Threat Intelligence for Analysts: IOCs, TTPs and Confidence",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "What Threat Intelligence Is and Is Not",
        body:
            "Threat intelligence is information about adversaries, their "
            "tools and their behavior, processed and analyzed so that "
            "someone can make a better decision. The last part matters. A "
            "list of 50,000 IP addresses is data. A note that says \"this "
            "group targets finance staff with invoice lures, so check mail "
            "logs for these attachment types this week\" is intelligence, "
            "because it points to an action.\n"
            "\n"
            "As an L1 or L2 analyst you are mostly a consumer of "
            "intelligence. You will use it to judge alerts faster, to "
            "decide how worried to be about an indicator, and to explain to"
            " a manager why something matters. Later in your career you may"
            " help produce it. Either way, the habit to build early is "
            "asking of every piece of intel: who is it for, how old is it, "
            "how was it obtained and what would I do differently because of"
            " it?",
      ),
      LessonSection(
        heading: "Strategic, Operational, Tactical and Technical",
        body:
            "Intelligence is often described at four levels. They answer "
            "different questions for different readers, and mixing them up "
            "is a common reason intel gets ignored.",
        bullets: [
          "Strategic: who attacks organizations like ours and why. "
          "Written for executives and risk owners, it informs budgets and"
          " priorities, not alert triage.",
          "Operational: what a specific campaign or actor is doing now, "
          "and how. Useful to team leads and hunters planning what to "
          "look for.",
          "Tactical: the tactics, techniques and procedures (TTPs) an "
          "adversary uses. This is the layer detection engineers and "
          "hunters care about most.",
          "Technical: machine-readable indicators such as hashes, IP "
          "addresses and domains. This is what feeds your SIEM and "
          "blocklists, and it ages fastest.",
        ],
      ),
      LessonSection(
        heading: "IOCs Versus TTPs",
        body:
            "An indicator of compromise (IOC) is a specific artifact that "
            "suggests a system was compromised or targeted: a file hash, an"
            " IP address, a domain name, a URL, a mutex name, a registry "
            "key. IOCs are concrete, easy to share and easy to match "
            "automatically. Their weakness is that the attacker can change "
            "them cheaply. A new domain costs a few dollars and a "
            "recompiled binary has a new hash.\n"
            "\n"
            "TTPs describe behavior: how the adversary gets in, how they "
            "move, what they do with access. Examples are phishing with a "
            "malicious attachment (T1566, Initial Access), launching "
            "PowerShell with encoded commands (T1059.001, Execution) or "
            "dumping credentials from LSASS memory (T1003.001, Credential "
            "Access). Behavior is expensive to change because it reflects "
            "the attacker's skills, tooling and workflow. That is why a "
            "detection built on behavior tends to outlive one built on a "
            "single IP address.",
        bullets: [
          "IOC examples: a SHA-256 hash, a C2 domain, a sender address, a"
          " mutex name, a specific file path.",
          "TTP examples: scheduled task creation for persistence "
          "(T1053.005), RDP lateral movement with stolen credentials "
          "(T1021.001, T1078), clearing event logs (T1070.001).",
          "Use IOCs for fast, precise matching, especially retroactive "
          "searches across old logs.",
          "Use TTPs for durable detections and hunting hypotheses.",
        ],
      ),
      LessonSection(
        heading: "The Pyramid of Pain",
        body:
            "David Bianco's Pyramid of Pain ranks indicator types by how "
            "much pain it causes the adversary when you detect and deny "
            "them. From least to most painful, the levels are: hash values,"
            " IP addresses, domain names, network and host artifacts, "
            "tools, and TTPs.\n"
            "\n"
            "At the bottom, blocking a hash is trivial for the attacker to "
            "evade, since changing one byte changes the hash. At the top, "
            "if you reliably detect a behavior, the attacker must change "
            "how they operate, which is slow and costly. The pyramid is not"
            " a rule that low-level indicators are useless. Hashes and "
            "domains are still the quickest way to scope an incident. It "
            "simply tells you where to invest effort when you have a "
            "choice: detections higher up last longer.",
      ),
      LessonSection(
        heading: "Reading a Sample Indicator Report",
        body:
            "Here is a fictional intelligence note. Read it the way an "
            "analyst would, noting what is actionable, what is stale and "
            "how confident the author is.\n"
            "\n"
            "The note below mixes short-lived indicators with a durable "
            "behavior. Your job is to separate the two before you act.",
      ),
      LessonSection(
        heading: "Sample Intelligence Note",
        isTemplate: true,
        body:
            "REPORT: Invoice lure campaign, finance sector\n"
            "Source: ISAC member post (TLP:AMBER)  |  Published: 12 days "
            "ago\n"
            "Confidence: MODERATE (two independent sightings, no malware "
            "analysis)\n"
            "\n"
            "Summary:\n"
            "  Phishing emails with ZIP attachments targeted accounts\n"
            "  payable staff. ZIP holds an ISO; ISO holds a shortcut that\n"
            "  launches PowerShell (T1059.001) with an encoded command.\n"
            "\n"
            "Indicators:\n"
            "  Sender domain : billing-notices.example\n"
            "  C2 domain     : cdn-assets.example   (registered 9 days ago)\n"
            "  C2 IP         : 203.0.113.45         (shared hosting)\n"
            "  Attachment    : Invoice_4471.zip\n"
            "  SHA-256       : 9f2c...e1 (truncated for this example)\n"
            "\n"
            "Behavior (more durable):\n"
            "  - ISO mounted by user, then LNK spawns powershell.exe\n"
            "  - PowerShell uses -enc and downloads a second stage\n"
            "\n"
            "ANALYST READ:\n"
            "  Hash and IP: check once, retroactively, but expect expiry.\n"
            "  Domain: block and search DNS logs back 30 days.\n"
            "  Behavior: ask detection engineering whether we alert on\n"
            "  Office/LNK/ISO chains spawning PowerShell. That is the\n"
            "  lasting value of this report.\n"
            "  Gap: no malware analysis, so treat the second stage as\n"
            "  unconfirmed.",
      ),
      LessonSection(
        heading: "Sources of Intelligence",
        body:
            "Intelligence comes from several kinds of source, and each has "
            "strengths and blind spots. Verify current availability and "
            "terms of any feed before depending on it.",
        bullets: [
          "Internal: your own alerts, incident tickets, phishing reports "
          "and past investigations. This is the most relevant intel you "
          "have because it describes attacks against you.",
          "Open source (OSINT): vendor and researcher blogs, government "
          "advisories such as those from national CERTs and CISA, malware"
          " analysis sites, public sandboxes and reputation lookups.",
          "Sharing communities: industry ISACs and ISAOs, trusted peer "
          "groups and information-sharing platforms, often governed by "
          "the Traffic Light Protocol.",
          "Commercial feeds and reports: broad coverage and enrichment, "
          "but check how indicators are sourced and how quickly they "
          "expire.",
          "Free community tools: MISP and OpenCTI platforms, "
          "abuse-tracking lists, passive DNS and certificate transparency"
          " search, YARA rule collections.",
        ],
      ),
      LessonSection(
        heading: "Confidence, Reliability and Credibility",
        body:
            "Not all intel deserves equal trust. Two simple questions help:"
            " how reliable is the source, and how credible is this specific"
            " claim? A source can be generally reliable and still be wrong "
            "about one detail. The admiralty-style approach used in many "
            "intelligence shops rates the source and the information "
            "separately.\n"
            "\n"
            "When you write or relay intelligence, state your confidence in"
            " plain words and say why. Low confidence means the claim rests"
            " on a single or weak source. Moderate means it is plausible "
            "and partly corroborated. High means multiple independent, "
            "reliable sources agree. Avoid certainty you do not have, and "
            "avoid hedging so heavily that the reader cannot act.",
        bullets: [
          "Corroboration: has a second independent source seen the same "
          "thing?",
          "Age: IP addresses and domains used by criminals often change "
          "quickly; old indicators may now belong to innocent parties.",
          "Context: a shared hosting IP or a content delivery network "
          "address can be malicious today and harmless tomorrow.",
          "Method: was the claim based on analysis, or copied from "
          "another report?",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes with Intelligence",
        body:
            "Most intel failures are failures of judgment, not of "
            "technology.",
        bullets: [
          "Blocking indicators blindly. A shared IP or a popular cloud "
          "domain can take down legitimate services. Check what else "
          "lives there first.",
          "Treating a single reputation hit as a verdict. Reputation "
          "tools disagree; a lone detection by one engine is a lead, not "
          "a conclusion.",
          "Ignoring age. An indicator from last year with no recent "
          "sightings should be demoted, not alerted on forever.",
          "Hoarding feeds. Ten overlapping feeds produce noise; fewer, "
          "well-understood sources beat many unexamined ones.",
          "Forgetting the question. Intel is only useful if tied to a "
          "decision: scope, block, hunt or report.",
        ],
      ),
      LessonSection(
        heading: "Checklist: Evaluating a New Indicator",
        isTemplate: true,
        body:
            "Use this when an indicator arrives in an alert or a report.\n"
            "\n"
            "[ ] What type is it (hash, IP, domain, URL, behavior)?\n"
            "[ ] Where did it come from and how reliable is that source?\n"
            "[ ] How old is it, and when was it last seen?\n"
            "[ ] Is the infrastructure shared (CDN, cloud, hosting)?\n"
            "[ ] Does it appear in our logs? Search 30-90 days back.\n"
            "[ ] Is there a behavior behind it we can detect?\n"
            "[ ] What is my confidence, and what would raise it?\n"
            "[ ] What action follows: block, monitor, hunt or ignore?\n"
            "[ ] Did I record the decision so the next analyst can reuse "
            "it?",
      ),
    ],
  ),
  Lesson(
    title: "Working with Intel: Enrichment, MISP, OpenCTI and TLP",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "From Raw Indicator to Useful Context",
        body:
            "Enrichment means adding context to an observable so you can "
            "judge it quickly. When an alert shows an unfamiliar IP address"
            " or domain, the observable alone tells you little. Enrichment "
            "answers: what is it, who owns it, how old is it, what has been"
            " seen from it and does it appear anywhere else in our "
            "environment?\n"
            "\n"
            "Good analysts enrich in a consistent order and stop when they "
            "have enough to decide. Over-enriching one alert while the "
            "queue grows is its own failure mode.",
      ),
      LessonSection(
        heading: "Typical Enrichment Sources",
        body:
            "Different observables call for different lookups. None is "
            "perfect, so compare more than one.",
        bullets: [
          "IP address: WHOIS or RDAP ownership, geolocation (approximate "
          "only), hosting or cloud provider, reputation lookups, passive "
          "DNS history, and whether it is a known scanner or VPN exit.",
          "Domain: registration date and registrar, DNS records, "
          "certificate transparency entries, passive DNS, similarity to a"
          " known brand, reputation.",
          "URL: redirect chain, final destination, screenshot from a safe"
          " sandbox or URL scanning service, page title and hosted files.",
          "File hash: multi-engine reputation sites such as "
          "virustotal.com, sandbox behavior reports, and your own "
          "endpoint data on prevalence (how many of our hosts have it).",
          "Email address or sender: first seen date, associated domains, "
          "prior reports.",
          "Internal context: asset owner, user role, past tickets, "
          "whether the host is a server or a laptop.",
        ],
      ),
      LessonSection(
        heading: "Safe Handling When You Look Things Up",
        body:
            "Looking up an indicator can tip off an attacker. Pasting a "
            "unique, targeted URL or an unreleased sample into a public "
            "service may make it searchable by others, including the "
            "adversary. Before uploading anything, decide whether the data "
            "is sensitive. Searching by hash is safer than uploading the "
            "file. Never browse to a suspicious site from your normal "
            "workstation; use an isolated analysis environment or a trusted"
            " URL scanning service, and follow your team's policy.",
      ),
      LessonSection(
        heading: "Annotated Enrichment Worksheet",
        body:
            "Below is a fictional worksheet for a domain found in an "
            "outbound proxy alert. Notice that the conclusion states the "
            "evidence and the next step, not just a label.",
      ),
      LessonSection(
        heading: "Worksheet: Domain From Proxy Alert",
        isTemplate: true,
        body:
            "ALERT: Proxy blocked request to update-service-check.example\n"
            "Host: WKS-0412 (user: a.rahman, Accounts Payable)\n"
            "Time: 09:14 UTC\n"
            "\n"
            "ENRICHMENT\n"
            "  Registered     : 6 days ago           -> new domain, "
            "suspicious\n"
            "  Registrar      : low-cost registrar    -> weak signal alone\n"
            "  Resolves to    : 198.51.100.77        -> shared hosting\n"
            "  Passive DNS    : 14 other domains on IP, all <30 days old\n"
            "  Cert           : issued 6 days ago, free CA -> weak signal\n"
            "  Reputation     : 2 of 70 engines flag  -> low, but domain is"
            " new\n"
            "  Our logs (30d) : 1 host, 3 requests, all today\n"
            "  Process        : outlook.exe -> winword.exe -> "
            "powershell.exe\n"
            "\n"
            "ASSESSMENT\n"
            "  Newly registered domain plus Office spawning PowerShell\n"
            "  (T1059.001) fits a phishing-delivered downloader (T1566).\n"
            "  Block was effective, but the process chain means code ran.\n"
            "  Confidence: MODERATE-HIGH (host evidence supports intel).\n"
            "\n"
            "NEXT STEPS\n"
            "  1. Escalate to L2: possible execution on WKS-0412\n"
            "  2. Isolate host per playbook pending review\n"
            "  3. Search mail logs for the lure sent to other users\n"
            "  4. Add domain and IP to blocklist; note reason and date",
      ),
      LessonSection(
        heading: "Judging Whether an Indicator Is Worth Acting On",
        body:
            "After enrichment you still have to decide. A useful rule is to"
            " weigh three things together: how likely the indicator is to "
            "be malicious, how much confidence you have in the source and "
            "how costly an action would be if you are wrong. Blocking a "
            "freshly registered domain used by one user costs almost "
            "nothing. Blocking a widely used cloud storage domain could "
            "stop the business.\n"
            "\n"
            "When the cost of a wrong block is high, prefer monitoring and "
            "targeted detection over a hard block, and escalate the "
            "decision to someone who owns the risk. When the cost is low "
            "and the evidence is moderate, act, record why and set a date "
            "to review the block. Indicators should have an expiry or a "
            "review date so your blocklists do not fill with stale entries.",
        bullets: [
          "High likelihood and low cost: block now and document.",
          "High likelihood and high cost: escalate with evidence, apply a"
          " narrow control such as blocking for one segment.",
          "Low likelihood and low cost: monitor or add to a watchlist "
          "with an expiry date.",
          "Low likelihood and high cost: do not block; note the reasoning"
          " and move on.",
        ],
      ),
      LessonSection(
        heading: "MISP and OpenCTI: Core Concepts",
        body:
            "Two open-source platforms appear often in intelligence teams. "
            "You do not need to administer them as an analyst, but you "
            "should understand the vocabulary. Check each project's "
            "documentation for current features.",
        bullets: [
          "MISP (Malware Information Sharing Platform): organizes intel "
          "into events, which contain attributes (individual indicators "
          "such as an IP or hash) and objects (grouped attributes that "
          "describe one thing, such as a file with its hashes and name). "
          "Tags and galaxies add classification, such as ATT&CK technique"
          " or actor labels.",
          "MISP sharing: events have distribution settings and can be "
          "synchronized with other organizations. Sharing groups control "
          "who sees what.",
          "OpenCTI: models intel as a knowledge graph. Entities such as "
          "threat actors, malware, campaigns, vulnerabilities and "
          "observables are linked by typed relationships, for example an "
          "intrusion set uses a technique or an indicator indicates a "
          "malware family.",
          "STIX and TAXII: STIX is a structured language for describing "
          "threat information; TAXII is a transport protocol for "
          "exchanging it. Many platforms import and export STIX so tools "
          "can talk to each other.",
          "Sightings: a record that someone saw an indicator in their "
          "environment. Sightings help show whether intel is still alive.",
        ],
      ),
      LessonSection(
        heading: "Using the Platform Day to Day",
        body:
            "Most analysts interact with a threat intelligence platform in "
            "a few simple ways: searching for an observable to see if it is"
            " already known, reading context attached to a match, adding a "
            "sighting when they find a hit and reporting new indicators "
            "from an incident. Many SIEMs and SOAR tools can query these "
            "platforms automatically so the context appears in the alert.\n"
            "\n"
            "Keep your contributions clean. Add indicators only when you "
            "are reasonably sure, label the confidence, tag the source and "
            "record why. A platform polluted with unverified indicators "
            "produces false positives for everyone who relies on it.",
      ),
      LessonSection(
        heading: "Sharing Safely: The Traffic Light Protocol",
        body:
            "The Traffic Light Protocol (TLP) is a simple marking system, "
            "maintained by FIRST, that tells recipients how far a piece of "
            "information may be shared. The label travels with the "
            "information and the recipient is expected to respect it. Check"
            " the current standard at first.org for exact wording.",
        bullets: [
          "TLP:RED: for named recipients only. Do not share beyond the "
          "people in the conversation or meeting where it was disclosed.",
          "TLP:AMBER: limited sharing within your organization and with "
          "clients or partners who need to know to act. TLP:AMBER+STRICT "
          "restricts it to your organization only.",
          "TLP:GREEN: may be shared within the wider community, but not "
          "published openly.",
          "TLP:CLEAR: no limits on disclosure, subject to normal "
          "copyright rules.",
          "If a document has no marking and the source is sensitive, ask "
          "before forwarding.",
        ],
      ),
      LessonSection(
        heading: "What to Strip Before Sharing",
        body:
            "When you share indicators with a peer group, share what helps "
            "defenders and remove what identifies your victims. Typical "
            "items to remove or generalize are internal hostnames, "
            "usernames, internal IP addresses, customer names and any data "
            "that reveals your network layout. Share the adversary's "
            "infrastructure, the behavior and the detection logic, and keep"
            " your own environment private unless your policy and the "
            "recipient's need justify more.",
      ),
      LessonSection(
        heading: "Sample Sharing Message",
        isTemplate: true,
        body:
            "TLP:AMBER\n"
            "To: Sector peer group\n"
            "Subject: Invoice lure, new C2 domain, 2 sightings\n"
            "\n"
            "What we saw:\n"
            "  Phishing email with ZIP attachment targeting AP staff.\n"
            "  Execution chain: ISO -> LNK -> PowerShell (T1059.001).\n"
            "\n"
            "Observables (adversary-controlled):\n"
            "  Domain : update-service-check.example\n"
            "  IP     : 198.51.100.77  (shared hosting, expect churn)\n"
            "  Sender : billing-notices.example\n"
            "\n"
            "Confidence: MODERATE. Two internal sightings, host\n"
            "behavior observed, no sample analysis yet.\n"
            "\n"
            "Removed: internal hostnames, usernames, recipient list.\n"
            "First seen: 6 days ago. Last seen: today.\n"
            "Suggested action: search DNS and proxy logs 30 days;\n"
            "alert on Office or LNK processes spawning PowerShell.",
      ),
      LessonSection(
        heading: "Common Mistakes When Using and Sharing Intel",
        body:
            "Avoid these frequent problems.",
        bullets: [
          "Sharing without a TLP label or ignoring the label you "
          "received.",
          "Pasting internal details such as hostnames or usernames into a"
          " public tool or a community post.",
          "Adding an indicator to a shared platform with no source, date "
          "or confidence, so no one can judge it.",
          "Enriching with only one source and reporting its verdict as "
          "fact.",
          "Never closing the loop: finding a hit and not recording a "
          "sighting or telling the team that issued the intel.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Hypothesis-Driven Threat Hunting",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "What Threat Hunting Is",
        body:
            "Threat hunting is the proactive search for adversary activity "
            "that automated detection has not flagged. Alerts answer the "
            "question \"did a rule fire?\" Hunting asks \"if an attacker were "
            "here, what would I expect to see, and can I find it?\" It "
            "assumes that some intrusions will slip past your controls and "
            "tries to shorten the time they stay hidden.\n"
            "\n"
            "Hunting is not random browsing through logs. Random browsing "
            "finds little and is hard to repeat. Good hunting is structured"
            " around a hypothesis, driven by data you can actually reach "
            "and recorded so the team learns from every hunt, whether or "
            "not it finds anything.",
      ),
      LessonSection(
        heading: "Why Hunting Matters for a SOC",
        body:
            "Detection rules can only catch what someone anticipated and "
            "encoded. Attackers use valid accounts, built-in tools and "
            "slow, quiet behavior that often looks normal to a rule. "
            "Hunting looks for that gap. Even a hunt that finds nothing is "
            "valuable: it can confirm that logs are present, reveal blind "
            "spots in data collection and produce a new detection that runs"
            " permanently.",
        bullets: [
          "Finds activity that evaded detections.",
          "Tests whether your logging is complete enough to answer real "
          "questions.",
          "Turns one-off analysis into permanent detections.",
          "Builds analyst skill in the data and in attacker behavior.",
        ],
      ),
      LessonSection(
        heading: "Hunting Versus Alert Triage",
        body:
            "The two activities use similar skills but run differently. "
            "Triage starts with an alert and asks whether it is real. "
            "Hunting starts with an idea and asks whether the evidence "
            "exists. Triage is reactive and time-boxed by the queue. "
            "Hunting is planned, scheduled and protected from queue "
            "pressure, which is why many SOCs give hunting a fixed block of"
            " time or a dedicated rotation. If hunting is only done when "
            "the queue is quiet, it never happens.",
      ),
      LessonSection(
        heading: "Where Hypotheses Come From",
        body:
            "A hypothesis is a testable statement about attacker behavior "
            "in your environment. Strong hypotheses come from a few "
            "reliable sources.",
        bullets: [
          "Threat intelligence: a report says a group uses scheduled "
          "tasks to persist after phishing, so you hunt for unusual "
          "scheduled task creation.",
          "ATT&CK gaps: a technique you have no detection for becomes a "
          "candidate.",
          "Past incidents: what did the last intrusion do that you only "
          "noticed late?",
          "Anomalies: a rare process, an odd login pattern or a spike in "
          "DNS requests that a rule did not flag.",
          "Environment knowledge: where your critical assets are and "
          "which paths lead to them.",
        ],
      ),
      LessonSection(
        heading: "Writing a Good Hypothesis",
        body:
            "A usable hypothesis has a clear structure: an actor behavior, "
            "a place to look and a way to decide. Compare a weak statement "
            "with a strong one.\n"
            "\n"
            "Weak: \"Look for bad PowerShell.\" It names no behavior, no data"
            " and no end condition.\n"
            "\n"
            "Strong: \"An attacker who gained a foothold through phishing "
            "may run PowerShell with encoded commands launched from an "
            "Office application (T1059.001, Execution). If so, process "
            "creation logs will show powershell.exe with a parent of "
            "winword.exe, excel.exe or outlook.exe in the last 30 days.\"\n"
            "\n"
            "The strong version tells you the data source (process creation"
            " events), the time window, the specific pattern and what a hit"
            " looks like. It can also be proven wrong, which is what makes "
            "it a hypothesis.",
      ),
      LessonSection(
        heading: "The Hunt Cycle",
        body:
            "Most hunting follows a loop. Different teams name the steps "
            "differently, but the shape is consistent.",
        bullets: [
          "1. Form the hypothesis and decide why it matters now.",
          "2. Confirm the data exists. Check log sources, retention and "
          "field quality before you query.",
          "3. Query and collect. Start broad enough to catch variants, "
          "then narrow.",
          "4. Analyze. Separate the normal from the unusual using "
          "baselines, rarity and context.",
          "5. Investigate leads. Pivot from a hit to hosts, users, "
          "accounts and time.",
          "6. Conclude. Either escalate as an incident or document that "
          "the hypothesis was not supported.",
          "7. Convert. Turn useful logic into a detection, a dashboard or"
          " a data-collection fix, and record the hunt.",
        ],
      ),
      LessonSection(
        heading: "Analysis Techniques That Work",
        body:
            "Hunting data sets are large and mostly benign. A few "
            "techniques help you find the interesting part quickly.",
        bullets: [
          "Stacking (frequency analysis): count how often a value appears"
          " across all hosts, then examine the rare ones. A process name "
          "seen on one machine out of 2,000 deserves a look.",
          "Baselining: learn what normal looks like for a host group, "
          "then look for deviation. Servers behave differently from "
          "laptops.",
          "Time analysis: look for beaconing, regular intervals of "
          "outbound connections, or activity at odd hours for that user.",
          "Parent-child relationships: unusual process ancestry such as a"
          " document spawning a command shell is often more telling than "
          "the process alone.",
          "Pivoting: take one confirmed artifact, such as a hash or user,"
          " and search for it everywhere else.",
        ],
      ),
      LessonSection(
        heading: "Data Sources for Common Hunts",
        body:
            "Know which logs support which hunts before you start. If the "
            "data is missing, that is itself a finding.",
        bullets: [
          "Process creation with command line and parent (Windows "
          "security event 4688 with command line auditing enabled, or "
          "Sysmon event ID 1): execution and living-off-the-land hunts.",
          "Network connection and DNS logs (Sysmon event ID 3 and 22, "
          "Zeek, firewall and proxy logs): beaconing, rare domains and "
          "T1071.004 DNS tunneling hunts.",
          "Authentication logs (4624 and 4625 and domain controller "
          "logs): valid account abuse (T1078), brute force (T1110) and "
          "remote logons (T1021.001).",
          "Persistence artifacts (scheduled tasks, services, registry Run"
          " keys): T1053.005, T1543.003 and T1547.001 hunts.",
          "Endpoint telemetry platforms and tools such as osquery or "
          "Velociraptor for live questions across many hosts. Check "
          "current availability and your organization's approval.",
        ],
      ),
      LessonSection(
        heading: "Example Hunt Plan",
        body:
            "Here is a fictional hunt plan written the way a team might "
            "file it. Notice that it records the data gap as well as the "
            "result.",
      ),
      LessonSection(
        heading: "Hunt Plan: Encoded PowerShell From Office",
        isTemplate: true,
        body:
            "HUNT ID  : H-2026-014\n"
            "Owner    : analyst.k (reviewer: L3 lead)\n"
            "Date     : 2026-10-02\n"
            "\n"
            "HYPOTHESIS\n"
            "  Phishing-delivered code may run encoded PowerShell\n"
            "  (T1059.001, Execution) from an Office parent process.\n"
            "\n"
            "DATA REQUIRED\n"
            "  Process creation with command line, 30 days, all\n"
            "  workstations. Verified: present for 94 percent of hosts.\n"
            "  GAP: 6 percent of hosts (a lab subnet) send no command line.\n"
            "\n"
            "QUERY LOGIC (plain language)\n"
            "  parent in (winword.exe, excel.exe, outlook.exe)\n"
            "  AND image = powershell.exe\n"
            "  AND command line contains -enc or -encodedcommand\n"
            "\n"
            "RESULTS\n"
            "  412 matches -> 409 from the finance macro tool\n"
            "  (known, signed, approved by IT)\n"
            "  3 matches   -> 2 on one host, 1 on another\n"
            "\n"
            "TRIAGE OF REMAINING 3\n"
            "  2 matches: user ran a vendor add-in, confirmed with user\n"
            "  1 match  : decoded command downloads from a domain with\n"
            "             no business reason -> ESCALATED as incident\n"
            "\n"
            "OUTCOME\n"
            "  1 true positive. Detection rule drafted with exclusion\n"
            "  for the finance tool. Lab subnet logging gap ticketed.",
      ),
      LessonSection(
        heading: "Hunt Documentation Checklist",
        isTemplate: true,
        body:
            "Before you close a hunt, confirm each item.\n"
            "\n"
            "[ ] Hypothesis written with behavior, data and time window\n"
            "[ ] ATT&CK tactic and technique recorded\n"
            "[ ] Data sources and any gaps listed\n"
            "[ ] Exact queries saved so someone else can rerun them\n"
            "[ ] Every unusual result explained or escalated\n"
            "[ ] Outcome stated: incident, detection, logging fix or "
            "assurance\n"
            "[ ] Follow-up tickets created with owners\n"
            "[ ] Date to repeat the hunt, if it should recur",
      ),
      LessonSection(
        heading: "Escalating a Finding",
        body:
            "When a hunt turns up something real, stop hunting and start "
            "incident response. Preserve what you found, note the exact "
            "query and time, and hand it to the incident process rather "
            "than continuing quietly on your own. Your notes become the "
            "first entry in the incident timeline. Afterwards, return to "
            "the hunt to scope: how many other hosts show the same pattern?",
      ),
      LessonSection(
        heading: "Common Mistakes in Hunting",
        body:
            "Watch for these pitfalls.",
        bullets: [
          "No hypothesis. Wandering produces unrepeatable results and "
          "false confidence.",
          "Not checking the data first. A query that returns nothing may "
          "just mean the logs are missing.",
          "Chasing every outlier. Rare is not the same as malicious; use "
          "context and move on when the explanation is benign.",
          "Not writing it down. An undocumented hunt cannot be repeated, "
          "reviewed or turned into a detection.",
          "Ending with no output. Every hunt should produce one of: an "
          "incident, a detection, a logging fix or documented assurance.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Detection Engineering and Tuning",
    estimatedMinutes: 19,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "What Detection Engineering Is",
        body:
            "Detection engineering is the discipline of designing, "
            "building, testing and maintaining the rules and analytics that"
            " turn raw logs into useful alerts. It treats detections as "
            "software: they have requirements, versions, tests and an "
            "owner, and they are retired when they stop being useful.\n"
            "\n"
            "As a SOC analyst you are the most important feedback source "
            "the detection engineers have. You see which alerts are noise, "
            "which are missing context and which catch real activity. "
            "Learning how detections are built makes your feedback specific"
            " and gets rules fixed faster.",
      ),
      LessonSection(
        heading: "Anatomy of a Good Detection",
        body:
            "Every rule should be able to answer a few basic questions. If "
            "it cannot, it will become noise.",
        bullets: [
          "Objective: what behavior or technique is this meant to catch, "
          "and which ATT&CK tactic and technique does it map to?",
          "Data source: which log must exist, with which fields, for the "
          "rule to work?",
          "Logic: the condition that triggers the alert, written as "
          "precisely as the data allows.",
          "Known false positives: what benign activity is expected to "
          "match, and how is it excluded?",
          "Severity and response: how urgent is it, and what should the "
          "analyst do first?",
          "Owner and review date: who maintains it, and when will it be "
          "re-examined?",
        ],
      ),
      LessonSection(
        heading: "Signatures, Behavior and Anomaly",
        body:
            "Detections come in three broad styles, and a mature program "
            "uses all of them. Signature detections match a known bad "
            "value, such as a hash or domain. They are precise and cheap "
            "but short-lived. Behavioral detections match a pattern of "
            "actions, such as an Office process spawning a shell. They "
            "survive tool changes but need tuning. Anomaly detections flag "
            "deviation from a baseline, such as a user logging in from a "
            "new country. They can catch the unknown but produce more "
            "questions than answers, so they work best when they add "
            "context rather than demand an immediate verdict.",
      ),
      LessonSection(
        heading: "Sigma-Style Rules",
        body:
            "Sigma is an open, vendor-neutral format for describing "
            "detection logic in a structured text file. A Sigma rule is "
            "written once and can be converted by tooling into queries for "
            "different SIEM platforms. Even if your team does not use Sigma"
            " directly, reading one teaches you how a detection is "
            "structured. Check the project's documentation for the current "
            "specification.\n"
            "\n"
            "The main parts are a title and description, a log source "
            "(category, product, service), a detection block made of named "
            "selections and a condition combining them, a list of known "
            "false positives, a severity level and tags that map the rule "
            "to ATT&CK.",
      ),
      LessonSection(
        heading: "Annotated Sigma-Style Rule",
        isTemplate: true,
        body:
            "title: Encoded PowerShell Launched by Office Application\n"
            "id: 11111111-2222-3333-4444-555555555555   (fictional)\n"
            "status: experimental\n"
            "description: Office app spawning PowerShell with an\n"
            "  encoded command, common after phishing.\n"
            "logsource:\n"
            "  category: process_creation       <- needs process logs\n"
            "  product: windows\n"
            "detection:\n"
            "  selection_parent:\n"
            "    ParentImage|endswith:\n"
            "      - '\\winword.exe'\n"
            "      - '\\excel.exe'\n"
            "      - '\\outlook.exe'\n"
            "  selection_child:\n"
            "    Image|endswith: '\\powershell.exe'\n"
            "    CommandLine|contains:\n"
            "      - ' -enc '\n"
            "      - ' -encodedcommand '\n"
            "  condition: selection_parent and selection_child\n"
            "falsepositives:\n"
            "  - Approved finance macro tool (exclude by hash/path)\n"
            "level: high\n"
            "tags:\n"
            "  - attack.execution              <- tactic\n"
            "  - attack.t1059.001              <- technique\n"
            "\n"
            "NOTE: field names depend on your log schema. Always\n"
            "validate against real events before enabling.",
      ),
      LessonSection(
        heading: "Why Rules Make Noise",
        body:
            "Almost every noisy rule has one of a few root causes, and "
            "knowing them tells you what to ask for.",
        bullets: [
          "Too broad: matches on a common tool name with no context, such"
          " as any use of powershell.exe.",
          "No allow-list: legitimate management tools, scanners and "
          "scripts trigger the rule every day.",
          "Wrong data: field values differ from what the rule expects, "
          "causing partial matches.",
          "Stale logic: the environment changed, such as a new software "
          "deployment tool, and nobody updated the rule.",
          "No context: the alert shows an event but not the user role, "
          "asset criticality or reputation that would let the analyst "
          "decide quickly.",
        ],
      ),
      LessonSection(
        heading: "A Practical Tuning Workflow",
        body:
            "Tuning means reducing false positives without losing true "
            "positives. The danger is that careless tuning silently blinds "
            "you. Follow a repeatable process, as in the walkthrough below.",
      ),
      LessonSection(
        heading: "Tuning Walkthrough",
        isTemplate: true,
        body:
            "RULE: Suspicious scheduled task creation (T1053.005)\n"
            "Problem: 140 alerts per week, 2 percent true positive.\n"
            "\n"
            "STEP 1  Sample the alerts. Review 50 recent hits and\n"
            "        label each: true, benign-expected, benign-unknown.\n"
            "STEP 2  Find the top benign pattern.\n"
            "        Result: 71 of 140 come from the patch agent\n"
            "        creating tasks under C:\\ProgramData\\PatchAgent.\n"
            "STEP 3  Narrow, do not delete. Exclude only when ALL hold:\n"
            "        creator image = patch agent (signed, known hash),\n"
            "        task path matches the agent folder, account = SYSTEM.\n"
            "        Do NOT exclude the whole folder or the whole account.\n"
            "STEP 4  Test both ways.\n"
            "        Replay 90 days of history: benign hits drop,\n"
            "        the 3 known true positives still fire.\n"
            "STEP 5  Run the new version in parallel (or in report-only\n"
            "        mode) for 1-2 weeks.\n"
            "STEP 6  Record the change: reason, date, approver, and a\n"
            "        review date. Keep the old version.\n"
            "STEP 7  Measure. Alerts per week and true-positive rate\n"
            "        before and after.\n"
            "\n"
            "RESULT: 140 -> 58 per week, all 3 true positives retained.",
      ),
      LessonSection(
        heading: "Giving Useful Feedback on a Noisy Alert",
        body:
            "Analysts often say only \"this rule is noisy.\" Detection "
            "engineers can act on much more specific input. When you close "
            "a false positive, record why it was benign and what "
            "distinguished it: the parent process, the account, the path, "
            "the signer or the destination. When you see a pattern of five "
            "or more identical closures, raise a tuning request with "
            "example alert IDs, the common field values and your proposed "
            "exclusion. That turns a complaint into a change request that "
            "can be reviewed in minutes.",
      ),
      LessonSection(
        heading: "Testing Detections",
        body:
            "A rule you have never seen fire is a rule you cannot trust. "
            "Test it from three directions.",
        bullets: [
          "Replay history: run the logic against old logs, including logs"
          " from past true incidents, to see volume and confirm it would "
          "have caught them.",
          "Simulate behavior: run a safe, approved test in a lab or with "
          "approval in production that produces the target activity. "
          "Open-source test collections such as Atomic Red Team map small"
          " tests to ATT&CK techniques; check current availability and "
          "use only in authorized environments.",
          "Test the plumbing: confirm the log arrives, the field names "
          "parse, the alert is created, routed to the right queue and "
          "shows the right context.",
          "Test evasion: ask how the attacker would trivially change the "
          "behavior, such as renaming a binary, and whether the rule "
          "would still fire.",
        ],
      ),
      LessonSection(
        heading: "ATT&CK Coverage",
        body:
            "MITRE ATT&CK, at https://attack.mitre.org, catalogs adversary "
            "tactics and techniques. Mapping your detections to techniques "
            "lets you see where you have coverage and where you do not. The"
            " ATT&CK Navigator can color a matrix to visualize this.\n"
            "\n"
            "Two cautions apply. First, a colored square does not mean you "
            "are protected. A technique may have dozens of variants, and "
            "one rule covers a few. Measure depth as well as breadth. "
            "Second, coverage should follow risk. Cover the techniques that"
            " matter for your environment and for the adversaries that "
            "target you before trying to fill every cell.",
        bullets: [
          "Map each rule to tactic and technique, and sub-technique where"
          " it applies.",
          "Rate quality: does it detect the technique reliably, partially"
          " or only a known tool?",
          "Check the data first: no logs, no detection. Many gaps are "
          "collection gaps.",
          "Prioritize by threat: use intel and past incidents to choose.",
          "Review regularly as the environment and adversaries change.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes in Detection Work",
        body:
            "Avoid these traps.",
        bullets: [
          "Excluding by user or by whole folder, which hands attackers a "
          "safe place to hide.",
          "Disabling a noisy rule instead of fixing it, leaving a silent "
          "gap.",
          "Tuning without testing against known true positives.",
          "Writing detections with no documented false positives or "
          "response steps.",
          "Treating ATT&CK coverage as a score to maximize rather than a "
          "map to guide decisions.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "SOC Metrics, Shifts, Queues and Automation",
    estimatedMinutes: 19,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "How a SOC Is Organized",
        body:
            "A security operations center is a team, a set of processes and"
            " a set of tools working together to detect, investigate and "
            "respond to threats. Most SOCs organize analysts in tiers, "
            "though the names and boundaries vary. L1 analysts triage the "
            "alert queue, L2 analysts investigate escalated cases in depth,"
            " and L3 or senior staff handle complex incidents, hunting, "
            "detection engineering and improvement work. Around them sit "
            "incident managers, threat intelligence staff, engineers who "
            "run the tools, and stakeholders in IT and the business.\n"
            "\n"
            "Understanding where your work fits helps you escalate well. An"
            " escalation is a handoff of a case with enough evidence that "
            "the next person does not start from zero.",
      ),
      LessonSection(
        heading: "Shifts and Coverage",
        body:
            "Many SOCs run around the clock, using follow-the-sun teams in "
            "several time zones or shift patterns of days, evenings and "
            "nights. Others run business hours with an on-call rota. "
            "Whatever the model, coverage only works if the handoff between"
            " shifts is reliable.",
        bullets: [
          "Shift patterns affect sleep and health. Rotations that change "
          "too often are harder on people than fixed or slowly rotating "
          "ones.",
          "Staffing should match alert volume, which usually peaks in "
          "business hours and after major disclosures.",
          "Out-of-hours escalation paths must be documented: who gets "
          "called, how and in what order.",
          "Time zones cause confusion in tickets. Record times in UTC and"
          " state the zone.",
        ],
      ),
      LessonSection(
        heading: "Handover Done Well",
        body:
            "A good shift handover keeps context alive. The incoming "
            "analyst should know what is open, what is waiting on someone "
            "else, what changed in the environment and what to watch for. "
            "Verbal briefings help, but the written record is what "
            "survives.",
      ),
      LessonSection(
        heading: "Sample Shift Handover Note",
        isTemplate: true,
        body:
            "SHIFT HANDOVER  2026-10-08  Day -> Evening   (times UTC)\n"
            "From: analyst.m    To: analyst.s\n"
            "\n"
            "OPEN INCIDENTS\n"
            "  INC-3321  WKS-0412 possible phishing execution (HIGH)\n"
            "            Status: host isolated 09:40. Waiting on L2 for\n"
            "            memory capture. Next action: confirm with L2 by "
            "15:00.\n"
            "  INC-3318  Brute force on VPN, user t.okafor (MEDIUM)\n"
            "            Status: password reset done; MFA check pending "
            "user.\n"
            "\n"
            "QUEUE STATE\n"
            "  New alerts unassigned : 11 (oldest 2h 10m - SLA 4h)\n"
            "  Pending info          : 6 (3 waiting on users)\n"
            "\n"
            "ENVIRONMENT CHANGES\n"
            "  Patch window tonight 22:00-24:00: expect scheduled task\n"
            "  and reboot alerts on servers SRV-APP-01..05.\n"
            "\n"
            "WATCH LIST\n"
            "  Domain update-service-check.example blocked. Watch for\n"
            "  other hosts querying it (DNS and proxy).\n"
            "\n"
            "KNOWN ISSUES\n"
            "  Proxy log feed delayed ~20 min since 11:00. Ticket OPS-77.",
      ),
      LessonSection(
        heading: "Managing the Queue",
        body:
            "The alert queue is the heart of daily work. A few principles "
            "keep it healthy.",
        bullets: [
          "Triage by severity and asset value, then by age. A medium "
          "alert near its SLA can outrank a new low one.",
          "Work to a time target, not perfection. If an alert needs more "
          "than the time allowed, escalate with notes rather than letting"
          " it sit.",
          "Use consistent closure reasons, such as true positive, benign "
          "positive, false positive or duplicate. The data feeds tuning.",
          "Group related alerts into one case instead of working ten "
          "tickets for one event.",
          "Never silently drop alerts. If the queue is overflowing, tell "
          "the shift lead early.",
        ],
      ),
      LessonSection(
        heading: "Core Metrics",
        body:
            "Metrics let a SOC manage itself, but they also shape behavior,"
            " so they must be chosen and read with care.",
        bullets: [
          "MTTD (mean time to detect): the average time from when "
          "malicious activity began to when it was detected. Hard to "
          "measure well because the true start is often unknown until "
          "investigation ends.",
          "MTTA (mean time to acknowledge): time from alert creation to "
          "an analyst picking it up. Shows queue health.",
          "MTTR (mean time to respond or resolve): the average time from "
          "detection to containment or closure. Define which one your SOC"
          " means, since the term is used both ways. Some teams use "
          "separate terms such as time to contain.",
          "False positive rate and true positive rate: what share of "
          "alerts, by rule, turned out benign or real.",
          "Alert volume per analyst and per rule: shows load and noisy "
          "sources.",
          "Escalation accuracy: how often escalated cases were truly "
          "worth escalating.",
          "Detection coverage: share of prioritized ATT&CK techniques "
          "with a tested detection.",
        ],
      ),
      LessonSection(
        heading: "Reading Metrics Without Being Fooled",
        body:
            "Averages hide a lot. One long investigation can drag an MTTR "
            "up, and many trivial closures can drag it down. Percentiles "
            "and medians, such as the time within which 90 percent of "
            "high-severity alerts are acknowledged, often tell the story "
            "better. Always check the definition, the time range and which "
            "alerts were included.\n"
            "\n"
            "Beware of metrics that reward the wrong behavior. If analysts "
            "are judged only on how fast they close alerts, they will close"
            " alerts quickly, including ones that deserved a closer look. "
            "If they are judged on alert counts, they may split one event "
            "into many tickets. Pair speed measures with quality measures "
            "such as reopened cases and missed detections found later.",
      ),
      LessonSection(
        heading: "Sample Weekly Metrics Review",
        isTemplate: true,
        body:
            "WEEKLY SOC METRICS  week 40  (fictional)\n"
            "\n"
            "                         This wk   Last wk   Note\n"
            "Alerts received            1,940     1,880\n"
            "Auto-closed by SOAR          610       540   enrichment + "
            "dedupe\n"
            "Worked by analysts         1,330     1,340\n"
            "Escalated to L2               64        71\n"
            "  Escalations confirmed       41        38    64% accuracy\n"
            "MTTA (high severity)        7 min     9 min  target 10\n"
            "Median time to contain      3h 20m    4h 05m\n"
            "P90 time to contain         11h       14h    two long cases\n"
            "Reopened cases                 5         3    investigate\n"
            "\n"
            "TOP NOISY RULES (by false positives)\n"
            "  1. Scheduled task creation        58   tuned last week\n"
            "  2. Impossible travel (VPN)        49   proposal: add known "
            "VPN ranges\n"
            "  3. Rare process on server         37   needs allow-list\n"
            "\n"
            "ACTIONS\n"
            "  - Detection eng. to review rules 2 and 3 by Friday\n"
            "  - Review the 5 reopened cases for closure quality\n"
            "  - Handover template updated with Known Issues field",
      ),
      LessonSection(
        heading: "Automation and SOAR",
        body:
            "SOAR stands for security orchestration, automation and "
            "response. In simple terms, it connects your tools so "
            "repetitive steps happen without a person clicking through "
            "them. Typical automations are enriching an indicator across "
            "several sources, deduplicating alerts, creating and updating "
            "tickets, notifying a user, or blocking an address after "
            "approval.\n"
            "\n"
            "Automation works best on tasks that are repetitive, well "
            "understood and low risk. A playbook that enriches a phishing "
            "report, checks the sender and links against reputation sources"
            " and attaches the result to the ticket saves minutes on every "
            "case. A playbook that deletes mail or disables accounts needs "
            "guardrails, such as an approval step, a scope limit and a log "
            "of every action.",
        bullets: [
          "Automate first: enrichment, deduplication, ticket creation, "
          "user notification and evidence gathering.",
          "Automate with approval: containment actions such as isolating "
          "a host, disabling an account or blocking a domain.",
          "Keep human: judgment on ambiguous cases, communication with "
          "executives, legal and privacy decisions.",
          "Test playbooks like detections, with sample cases and a way to"
          " turn them off quickly.",
          "Monitor the automation itself. A broken integration that "
          "silently stops enriching alerts is a hidden risk.",
        ],
      ),
      LessonSection(
        heading: "Burnout and Sustainable Operations",
        body:
            "SOC work can be stressful: constant queues, shift patterns, "
            "high stakes and a high share of false alarms. Burnout is a "
            "real risk for the team and a real operational risk for the "
            "organization, because tired analysts miss things. This is not "
            "about individual resilience alone. Much of it comes from how "
            "the SOC is run.",
        bullets: [
          "Warning signs: cynicism about alerts, rising error rates, "
          "skipped breaks, irritability, dreading shifts.",
          "Reduce the cause: tune noisy rules, automate repetitive work, "
          "keep realistic staffing and protect time for learning and "
          "hunting.",
          "Build habits: take breaks away from the screen, use handover "
          "to put work down at the end of a shift, and ask for help "
          "early.",
          "Share the load: rotate duties such as the phishing mailbox, "
          "and avoid leaving the hardest cases with the same person every"
          " time.",
          "Managers should watch workload, overtime and the mix of work, "
          "and act when the data shows strain.",
          "If stress is affecting your health, talk to someone you trust "
          "or a qualified professional, and use any support your employer"
          " offers.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes in SOC Operations",
        body:
            "Typical problems to avoid.",
        bullets: [
          "Optimizing a single metric, such as closure speed, at the "
          "expense of accuracy.",
          "Weak handovers, so the next shift rediscovers context or "
          "repeats actions.",
          "Escalating without evidence, or not escalating when the case "
          "exceeds your authority or time.",
          "Automating a bad process. If the manual steps are unclear, "
          "automation only makes errors faster.",
          "Ignoring the analyst experience until people leave.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Career Growth: From L1 to L2, L3 and Beyond",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "The Shape of a SOC Career",
        body:
            "SOC roles form a ladder, but also a branching tree. Most "
            "people start at L1, learn the fundamentals of triage and "
            "communication, and then choose a direction. Titles and "
            "boundaries differ by employer, so read job descriptions for "
            "the actual duties.",
        bullets: [
          "L1 (triage analyst): monitors alerts, follows playbooks, "
          "enriches, escalates or closes, writes clear notes.",
          "L2 (investigator or incident analyst): handles escalations, "
          "performs deeper endpoint and network analysis, leads smaller "
          "incidents, tunes detections with feedback.",
          "L3 (senior analyst, responder or hunter): leads major "
          "incidents, hunts, performs malware or forensic analysis, "
          "mentors and shapes playbooks.",
          "Specialist branches: detection engineering, threat "
          "intelligence, digital forensics and incident response, malware"
          " analysis, security engineering, vulnerability management, "
          "cloud security.",
          "Leadership branches: shift lead, SOC manager, incident "
          "manager, security program roles.",
        ],
      ),
      LessonSection(
        heading: "What Changes From L1 to L2",
        body:
            "The jump is less about knowing more tools and more about "
            "changing how you think. An L1 asks \"is this alert real, and "
            "what does the playbook say?\" An L2 asks \"what happened, how "
            "far did it go and what else is affected?\" That requires "
            "building a timeline from several sources, forming and testing "
            "theories, and communicating findings that others will act on.\n"
            "\n"
            "Signs you are ready include escalations that rarely bounce "
            "back for missing information, comfort pivoting between "
            "endpoint, network and identity data, and a habit of suggesting"
            " detection improvements. Ask your lead what they would want to"
            " see before promoting you, and then ask for stretch work that "
            "shows it.",
      ),
      LessonSection(
        heading: "Choosing a Direction",
        body:
            "After a year or two of general SOC work, ask which tasks you "
            "enjoy and lose track of time doing. If you like building logic"
            " and testing it, look toward detection engineering. If you "
            "like reading adversary reports and connecting patterns, look "
            "toward threat intelligence. If you like deep dives on a single"
            " host, look toward forensics and incident response. If you "
            "like automating the dull parts, look toward SOAR engineering. "
            "You are not locked in, and many senior analysts have worked in"
            " several of these areas. Try small projects in each before you"
            " decide.",
      ),
      LessonSection(
        heading: "Skills That Compound",
        body:
            "Some skills pay off at every level. Invest in these early.",
        bullets: [
          "Networking fundamentals: TCP/IP, DNS, HTTP, common ports and "
          "how traffic should look.",
          "Operating systems: Windows internals basics (processes, "
          "services, registry, event logs) and Linux fundamentals (logs, "
          "permissions, shell).",
          "Log analysis and querying: becoming fluent in your SIEM's "
          "query language and in command-line tools.",
          "Scripting: small automations in Python or PowerShell that "
          "remove repetitive work.",
          "Writing: clear tickets, incident summaries and detection "
          "documentation. Many careers stall on writing, not tools.",
          "Attacker thinking: ATT&CK, how intrusions unfold and which "
          "logs each step leaves behind.",
          "Communication under pressure: calm, factual updates to people "
          "who are worried.",
        ],
      ),
      LessonSection(
        heading: "Certifications as Categories",
        body:
            "Certifications can help you get interviews and structure your "
            "learning, but they are not a substitute for demonstrated "
            "skill, and requirements change. Check each provider's current "
            "syllabus, cost and renewal terms before committing. Think in "
            "categories rather than collecting names.",
        bullets: [
          "Foundation certifications: broad introductions to security "
          "concepts, terminology and basic controls. Useful for career "
          "changers and entry-level screening.",
          "Defensive and blue team certifications: focus on monitoring, "
          "detection, triage and incident handling, often with hands-on "
          "labs.",
          "Vendor and platform certifications: cover a specific SIEM, "
          "EDR, cloud platform or operating system. Valuable if your "
          "employer uses that product.",
          "Specialist certifications: digital forensics, malware "
          "analysis, threat hunting, penetration testing for context, and"
          " cloud security.",
          "Management and governance certifications: risk, audit and "
          "security management, relevant later if you move toward "
          "leadership.",
          "Rule of thumb: prefer certifications with practical exams or "
          "labs, and pick them to match the role you want in the next two"
          " years.",
        ],
      ),
      LessonSection(
        heading: "Building a Portfolio",
        body:
            "A portfolio gives employers evidence that you can do the work."
            " It matters most when you have little professional experience."
            " Aim for a small number of well-explained items rather than a "
            "long list of half-finished ones.",
        bullets: [
          "Home lab write-ups: build a small lab with a SIEM or log "
          "platform, forward logs from a few virtual machines and "
          "document what you set up and what you learned.",
          "Investigation write-ups: use public datasets, capture-the-flag"
          " exercises or training platforms to walk through an "
          "investigation with a timeline and conclusions.",
          "Detection work: publish a few rules in a Sigma style with "
          "notes on testing and false positives.",
          "Hunt plans: write a hypothesis-driven hunt like the one in "
          "this chapter, with data sources and results.",
          "Scripts and tools: a small log-parsing or enrichment script "
          "with a clear README.",
          "Writing: short blog posts or notes explaining one concept "
          "well. Good explanation shows understanding.",
        ],
      ),
      LessonSection(
        heading: "Portfolio Hygiene",
        body:
            "Only use data you are allowed to use. Never publish real "
            "employer data, real customer information or anything covered "
            "by a confidentiality agreement. Use public datasets, your own "
            "lab data and fictional examples. Remove usernames, internal "
            "addresses and anything sensitive, and do not run malicious "
            "samples outside an isolated, authorized environment. Employers"
            " notice judgment as much as skill.",
      ),
      LessonSection(
        heading: "Sample Write-Up Outline",
        isTemplate: true,
        body:
            "PORTFOLIO ITEM: Investigating suspicious PowerShell (lab)\n"
            "\n"
            "1. SCENARIO\n"
            "   Lab with 3 Windows VMs and a free log platform.\n"
            "   Simulated phishing-style activity using a safe test.\n"
            "2. DATA SOURCES\n"
            "   Sysmon process creation (event ID 1), Windows security log,\n"
            "   DNS logs.\n"
            "3. DETECTION\n"
            "   Rule maps to T1059.001 (Execution). Logic described in\n"
            "   plain language and in a Sigma-style file.\n"
            "4. TESTING\n"
            "   Triggered 4 times by the test; 2 benign hits from admin\n"
            "   script, excluded by signer and path.\n"
            "5. FINDINGS TIMELINE\n"
            "   10:02 test file opened -> 10:02 powershell.exe launched ->\n"
            "   10:03 DNS lookup of test.example -> 10:03 connection to\n"
            "   192.0.2.10 (lab server).\n"
            "6. LESSONS\n"
            "   Command line logging was off on one VM; fixed and "
            "re-tested.\n"
            "7. NEXT STEPS\n"
            "   Add parent-process context and a response checklist.",
      ),
      LessonSection(
        heading: "Growing Inside the Job",
        body:
            "You do not need permission to grow. Ask to shadow incident "
            "calls. Volunteer to write a playbook, review a noisy rule or "
            "run a small hunt. Keep a private log of cases you handled, "
            "what you learned and what you would do differently, without "
            "sensitive details. Find a mentor and teach others, since "
            "explaining a topic is one of the fastest ways to learn it. "
            "Join community groups and read the writing of practitioners, "
            "and treat what you read critically.",
      ),
      LessonSection(
        heading: "Habits of a Good Analyst",
        isTemplate: true,
        body:
            "These habits show up in every strong SOC analyst, at every "
            "level. Use this as a regular self-check.\n"
            "\n"
            "[ ] I write notes as I work, so another analyst can follow.\n"
            "[ ] I separate what I observed from what I assume.\n"
            "[ ] I check the log source and time zone before trusting a "
            "result.\n"
            "[ ] I look for a second source before calling something "
            "confirmed.\n"
            "[ ] I state my confidence and what would change it.\n"
            "[ ] I escalate early with evidence, not late with apologies.\n"
            "[ ] I document why a false positive was benign.\n"
            "[ ] I suggest a tuning or detection change when I see a "
            "pattern.\n"
            "[ ] I protect sensitive data and respect TLP markings.\n"
            "[ ] I ask when I do not know, and share what I learn.\n"
            "[ ] I take breaks, hand over cleanly and look after my health.\n"
            "[ ] I review one old case each week and ask what I would "
            "change.",
      ),
      LessonSection(
        heading: "Common Mistakes in Career Development",
        body:
            "Frequent errors to avoid.",
        bullets: [
          "Collecting certifications without building hands-on skill.",
          "Waiting to be assigned growth work instead of proposing it.",
          "Jumping to a specialty before mastering fundamentals such as "
          "networking and logs.",
          "Publishing material that includes real employer or customer "
          "data.",
          "Neglecting writing and communication, which limit progress at "
          "L2 and above.",
          "Comparing your pace to others rather than to your own "
          "progress.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Practice Test: Threat Intel, Hunting & SOC Operations",
    estimatedMinutes: 10,
    difficulty: LessonDifficulty.intermediate,
    quiz: [
      QuizQuestion(
        question: "Your SIEM receives a report listing a C2 IP address, a file "
                  "hash and a note that the actor persists using scheduled tasks "
                  "(T1053.005). Which item is likely to stay useful longest for "
                  "detection?",
        options: [
          "The file hash, because it uniquely identifies the exact "
          "malware sample used in this campaign",
          "The sender domain, because attackers tend to reuse registered "
          "domains across many campaigns",
          "The C2 IP address, because network infrastructure is rarely "
          "replaced between campaigns by actors",
          "The scheduled task persistence behavior, since changing it "
          "forces the actor to alter methods",
        ],
        correctIndex: 3,
        explanation:
            "Behavior sits near the top of the Pyramid of Pain and costs "
            "the attacker most to change. Hashes and IPs are the commonest "
            "first picks, but they are trivial to replace.",
      ),
      QuizQuestion(
        question: "An analyst finds that a feed marks 203.0.113.45 as malicious, "
                  "but passive DNS shows 300 unrelated domains on it, and the "
                  "feed entry is 8 months old. What is the best next step?",
        options: [
          "Delete the feed entry and stop using that feed for all future "
          "alerts and enrichment lookups",
          "Treat it as low confidence, search logs for contact, and skip "
          "a hard block absent local proof",
          "Ignore it completely, because any shared hosting address is "
          "automatically considered harmless",
          "Add it to the firewall blocklist immediately, since the feed "
          "has already flagged it as malicious",
        ],
        correctIndex: 1,
        explanation:
            "A stale indicator on shared hosting is a weak lead with a high"
            " chance of collateral damage. Blocking it blindly is the "
            "common error, but dismissing it entirely also loses a cheap "
            "log search.",
      ),
      QuizQuestion(
        question: "A peer group shares a report marked TLP:AMBER. A colleague at "
                  "a different company asks you to forward it, and they are not a"
                  " client or partner of yours. What should you do?",
        options: [
          "Decline to forward it, and ask the originator whether sharing "
          "with that person is permitted",
          "Post it in a public forum so that the wider community can use "
          "it to defend their networks",
          "Share it only after changing the marking to TLP:GREEN yourself"
          " to allow wider community use",
          "Forward it to them, as long as you first remove the names of "
          "the victim organizations",
        ],
        correctIndex: 0,
        explanation:
            "TLP:AMBER limits sharing to your organization and those who "
            "need it to act, and only the originator can relax it. Removing"
            " victim names does not change the marking.",
      ),
      QuizQuestion(
        question: "In MISP, which term best describes a single indicator such as "
                  "one IP address or hash inside an event?",
        options: [
          "A sighting, which records that someone has seen the indicator "
          "in their own environment",
          "A galaxy, which holds descriptions of threat actor and malware"
          " clusters used for tagging events",
          "An attribute, which is one data point such as an IP address or"
          " a hash inside an event",
          "A sharing group, which controls which partner organizations "
          "are able to receive a given event",
        ],
        correctIndex: 2,
        explanation:
            "Events contain attributes, and attributes may be grouped into "
            "objects. A sighting is separate: it records that an indicator "
            "was observed, not the indicator itself.",
      ),
      QuizQuestion(
        question: "You are writing a threat hunting hypothesis. Which of these is"
                  " the strongest?",
        options: [
          "Search the whole network for any suspicious activity that "
          "appears in the logs over the past year",
          "If an attacker persisted via scheduled tasks, logs will show "
          "new tasks from unusual parents",
          "Review the top 100 outbound destinations by volume and report "
          "any that look unusual to the team",
          "Look at all PowerShell usage across the estate and flag "
          "anything that seems odd to the analyst",
        ],
        correctIndex: 1,
        explanation:
            "A good hypothesis names a behavior, a data source and what a "
            "hit looks like, so it can be proven wrong. Broad instructions "
            "to look for odd activity cannot be tested or repeated.",
      ),
      QuizQuestion(
        question: "A hunt for DNS tunneling returns zero results. Before "
                  "reporting that the network is clean, what should you verify "
                  "first?",
        options: [
          "That the hunt was run during normal business hours rather than"
          " overnight when traffic is lower",
          "That at least one external threat feed lists the domains that "
          "were queried during the period",
          "That the analyst who ran the query holds the highest level of "
          "access to the SIEM platform",
          "That DNS query logs were collected and kept for all the "
          "relevant network segments and dates",
        ],
        correctIndex: 3,
        explanation:
            "An empty result only means something if the data exists. "
            "Missing logs are the commonest reason a hunt finds nothing, "
            "and they are a finding in their own right.",
      ),
      QuizQuestion(
        question: "During a hunt, you stack process names across 2,000 "
                  "workstations and find one executable that appears on a single "
                  "host. What is the right approach?",
        options: [
          "Add the executable name to the blocklist on all workstations "
          "before looking at the host itself",
          "Dismiss it, because a single host is too small a sample to "
          "matter in a large environment",
          "Check its path, signer, parent process and user before "
          "deciding whether it is benign",
          "Escalate immediately as a confirmed incident because a process"
          " that rare must be malicious",
        ],
        correctIndex: 2,
        explanation:
            "Rare does not equal malicious, and common does not equal safe."
            " Context decides, which is why both automatic escalation and "
            "automatic dismissal fail.",
      ),
      QuizQuestion(
        question: "A rule for scheduled task creation produces 140 alerts a week,"
                  " and half come from the patch agent. Which tuning change is "
                  "safest?",
        options: [
          "Exclude only tasks matching the signed agent, its path and "
          "account together, then retest",
          "Exclude every task created by the SYSTEM account because it is"
          " a trusted built-in identity",
          "Exclude the entire ProgramData folder from the rule so that "
          "all agent activity is ignored there",
          "Disable the rule entirely until the patching cycle has "
          "finished and alert volumes return to normal",
        ],
        correctIndex: 0,
        explanation:
            "Narrow exclusions that combine several attributes remove the "
            "known noise while keeping coverage. Folder-wide or "
            "account-wide exclusions give an attacker a place to hide.",
      ),
      QuizQuestion(
        question: "Which test gives the strongest evidence that a new detection "
                  "rule actually works?",
        options: [
          "Checking that the rule is tagged with the correct ATT&CK "
          "technique and tactic identifiers",
          "Confirming the rule has stayed enabled in the SIEM for a full "
          "week without raising any errors",
          "Reading the rule logic through with a colleague to confirm "
          "that the conditions look correct",
          "Running a safe, approved simulation and confirming an alert "
          "fires with the correct fields",
        ],
        correctIndex: 3,
        explanation:
            "Only a real trigger proves the data arrives, the logic matches"
            " and the alert routes correctly. Peer review and a week "
            "without alerts show nothing about whether the rule would fire.",
      ),
      QuizQuestion(
        question: "Your ATT&CK Navigator map shows a technique colored as covered"
                  " by one rule. What is the most accurate conclusion?",
        options: [
          "The technique is now fully protected against every known "
          "variant and sub-technique in the matrix",
          "Some coverage exists, but depth depends on the variants it "
          "catches and whether it was tested",
          "The technique no longer needs any hunting or manual review "
          "because a rule exists for it",
          "The rule is certain to detect that technique in all "
          "environments where the log source exists",
        ],
        correctIndex: 1,
        explanation:
            "A colored cell shows breadth, not quality. Treating it as full"
            " protection is the usual misreading, because one rule "
            "typically covers only some ways of performing a technique.",
      ),
      QuizQuestion(
        question: "Last week the SOC's average time to respond fell from 6 hours "
                  "to 2 hours, and reopened cases doubled. What is the most "
                  "likely concern?",
        options: [
          "Analysts may be closing cases too fast, so the speed gain may "
          "be costing case quality",
          "The SOC is now well staffed and efficient, so no further "
          "review of the results is required",
          "Alert volume dropped sharply, so analysts were able to spend "
          "far more time on each single case",
          "The metric definition was changed during the week, so old and "
          "new values cannot be compared",
        ],
        correctIndex: 0,
        explanation:
            "A speed metric improving while reopened cases rise suggests "
            "rushed closures. Pairing speed with quality measures is what "
            "exposes this, while averages alone would look like a success.",
      ),
      QuizQuestion(
        question: "In which situation is full automation without an approval step"
                  " the most appropriate?",
        options: [
          "Isolating a production server that hosts a customer-facing "
          "application during business hours",
          "Blocking a domain that was reported by a single source that "
          "has not yet been verified",
          "Enriching an IP address with ownership and reputation data and"
          " adding it to the ticket",
          "Disabling a user account that is suspected of having been "
          "compromised by a phishing message",
        ],
        correctIndex: 2,
        explanation:
            "Enrichment is repetitive, low risk and reversible. Containment"
            " actions can interrupt the business if wrong, so they usually "
            "need an approval step or tight scope limits.",
      ),
      QuizQuestion(
        question: "You are ending your shift with one open high-severity case "
                  "waiting on another team, and a proxy log feed that is delayed."
                  " What belongs in your handover note?",
        options: [
          "A request that the evening shift reopen every case that was "
          "closed earlier in the day shift",
          "Case status, next action and time, the pending dependency, and"
          " the log delay with its ticket",
          "Only the high-severity case, because the delayed log feed is "
          "an IT matter and not a SOC issue",
          "Only the actions you completed, so the next analyst does not "
          "accidentally repeat any of them",
        ],
        correctIndex: 1,
        explanation:
            "A handover keeps context alive: open work, what it waits on "
            "and known issues that affect judgment. Leaving out the log "
            "delay can make the next analyst misread a quiet queue.",
      ),
      QuizQuestion(
        question: "An aspiring analyst has three certifications but no practical "
                  "work to show. Which step would most improve their chances at "
                  "an L1 interview?",
        options: [
          "Apply only to L3 roles, since the three certifications already"
          " show broad and sufficient knowledge",
          "Remove the certifications and list personal interests instead "
          "so the resume looks more balanced",
          "Build a small lab, document an investigation with a timeline, "
          "and publish it with public data",
          "Add a fourth certification from a different category to the "
          "resume to show an even broader range",
        ],
        correctIndex: 2,
        explanation:
            "Employers want evidence of hands-on judgment, which a clear "
            "write-up demonstrates. More certificates without practice is "
            "the common trap, and publishing real employer data would be a "
            "serious mistake.",
      ),
    ],
  ),
];
