// Logs, SIEM & Detection: the second theory module of "The Pulse (SOC
// Blue Team)". Uses the same Lesson/LessonSection/QuizQuestion model as
// every other module, so it renders through the existing LessonScreen.
//
// Order matters: the lessons build on each other (logs -> SIEM -> reading
// logs -> intelligence -> detections), ending with a short quiz.

import 'lesson_model.dart';

final List<Lesson> socDetectionLessons = [
  Lesson(
    title: "Where Alerts Come From: Logs and Telemetry",
    estimatedMinutes: 16,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Every Alert Starts as a Log Line",
        body:
            "Nothing in security happens by magic. Every alert you will "
            "ever triage started life as a record that some system wrote "
            "down: a user signed in, a process started, a firewall allowed "
            "a connection, a file was shared. Those records are logs, and "
            "the broader stream of data about what systems are doing is "
            "called telemetry.\n"
            "\n"
            "The SOC does not watch the attacker. It watches the evidence "
            "the attacker's actions leave behind in logs. That is why this "
            "module starts here: if you understand what a log is, what it "
            "can and cannot tell you, and where the gaps are, every later "
            "skill, from reading a SIEM alert to writing a detection, "
            "becomes easier.",
      ),
      LessonSection(
        heading: "The Main Log Sources a SOC Relies On",
        body:
            "Different sources answer different questions. A good analyst "
            "knows which source to open for which question, instead of "
            "searching everywhere at once.",
        bullets: [
          "Identity and authentication logs: who signed in, from where, "
          "on which device, whether MFA was used, and whether it "
          "succeeded. The first stop for any account-related alert.",
          "Endpoint logs (EDR and operating system): which processes ran,"
          " what launched them, which files were changed and which "
          "network connections they opened.",
          "Network logs (firewall, proxy, DNS, VPN): who talked to whom, "
          "when, how much data moved, and which domains were looked up.",
          "Email security logs: who sent what to whom, which links and "
          "attachments were in it, and what the gateway decided to do.",
          "Cloud and SaaS audit logs: configuration changes, permission "
          "grants, file sharing and API calls in services such as "
          "storage, collaboration suites and identity platforms.",
          "Application and web server logs: requests made to an "
          "application, errors produced and administrative actions taken.",
        ],
      ),
      LessonSection(
        heading: "What Is Inside a Typical Log Record",
        body:
            "Almost every useful log record answers the same handful of "
            "questions, even though the format differs from system to "
            "system: when did it happen, who or what did it, what was done,"
            " to what, from where, and with what result.\n"
            "\n"
            "The pattern to look for is time, actor, action, target, source"
            " and outcome. When an alert lands, a quick way to orient "
            "yourself is to find those six things in the underlying record."
            " If one of them is missing, you have just learned what you "
            "will need to look up elsewhere.",
      ),
      LessonSection(
        heading: "Time Is the Hardest Field",
        body:
            "Timestamps look simple and cause a surprising amount of "
            "confusion. Two systems can record the same event with "
            "different time zones, different formats, or clocks that are a "
            "few minutes apart. When you build a timeline from several "
            "sources, a one-hour shift caused by a time zone can make "
            "events appear in the wrong order and lead you to the wrong "
            "conclusion.\n"
            "\n"
            "Two habits prevent most of the pain. First, convert everything"
            " to UTC before you compare, which is why this training and "
            "most SOCs write times in UTC. Second, check whether a source's"
            " clock is trustworthy. A server whose clock drifted by several"
            " minutes will quietly corrupt any sequence you build around "
            "it.",
      ),
      LessonSection(
        heading: "Start With the Inventory: You Cannot Protect What You Do Not "
                 "Know You Have",
        body:
            "Before any log is useful, the SOC needs to know what exists. "
            "An asset inventory is the list of everything the organization "
            "owns or runs: laptops, servers, databases, network devices, "
            "cloud accounts and subscriptions, SaaS applications, user "
            "accounts, service accounts and domains. Every other question "
            "in this module depends on it. Which systems should be sending "
            "logs? Which alerts matter most? Who do we call? None of those "
            "can be answered from a blank page.\n"
            "\n"
            "The uncomfortable truth is that most organizations do not have"
            " a complete inventory. Systems get built for a project and "
            "forgotten, cloud accounts are opened with a credit card, and "
            "teams adopt software nobody told security about. Attackers "
            "love these forgotten corners, because nobody is watching them."
            " An analyst who treats the inventory as a living tool, rather "
            "than a spreadsheet someone made two years ago, is far more "
            "effective.",
      ),
      LessonSection(
        heading: "Where an Inventory Comes From, and Why You Need Several "
                 "Sources",
        body:
            "No single list is complete, so mature teams build the picture "
            "from several sources and compare them. The gaps between the "
            "lists are where the unknown assets hide.",
        bullets: [
          "The configuration management database (CMDB) or IT asset "
          "system: the official record, usually the least up to date.",
          "The identity directory: every user, group and service account,"
          " with its owner and last sign-in.",
          "The EDR or endpoint management console: every device that "
          "actually has the agent installed and reporting.",
          "Cloud provider APIs: every account, subscription, virtual "
          "machine, storage bucket and database, discoverable "
          "programmatically.",
          "Network discovery and vulnerability scanners: what answers on "
          "the network, whether or not anyone registered it.",
          "DNS, DHCP and proxy logs: devices and domains that appear in "
          "traffic but are not in any list.",
          "Procurement, finance and SaaS discovery tools: software that "
          "people are paying for or signing in to.",
        ],
      ),
      LessonSection(
        heading: "Reconcile the Lists: Finding the Unknowns",
        body:
            "The practical technique is reconciliation. Compare the lists "
            "and look at the differences. A device that appears in DHCP but"
            " not in the CMDB is an unknown device. A server in the CMDB "
            "with no EDR agent is unprotected. An account that exists in "
            "the directory but has no owner is an orphan. A cloud "
            "subscription that nobody in IT recognizes is a shadow "
            "environment.\n"
            "\n"
            "Each difference is a finding. Some will be harmless, such as a"
            " printer. Some will be serious, such as a forgotten server "
            "holding customer data. Either way, you cannot judge which is "
            "which until you have found it. Many real intrusions have been "
            "traced to a system the organization did not know it had.",
      ),
      LessonSection(
        heading: "Tag the Assets That Matter Most",
        body:
            "An inventory with ten thousand entries is only useful if you "
            "can tell which ones are critical. That is the purpose of "
            "tagging: attaching consistent labels to each asset so that the"
            " SIEM can read them and so that you can see at a glance how "
            "serious an alert is.\n"
            "\n"
            "The same alert means very different things on different "
            "systems. A malware detection on a test laptop is routine. The "
            "same detection on a domain controller or a production database"
            " is an emergency. Without tags, both arrive looking identical "
            "in the queue, and the analyst has to work out the difference "
            "by hand while the clock runs.",
      ),
      LessonSection(
        heading: "A Practical Tagging Scheme",
        body:
            "You do not need a complicated scheme. A small set of "
            "consistent tags, applied everywhere, is better than an "
            "elaborate one applied to a handful of systems.",
        bullets: [
          "Criticality tier: for example Tier 1 (business stops if it "
          "fails or is breached), Tier 2 (important), Tier 3 (routine), "
          "Tier 4 (test and low value).",
          "Owner: a named person or team responsible for the asset, with "
          "a way to reach them.",
          "Business function: finance, HR, customer-facing, engineering, "
          "and so on.",
          "Data classification: public, internal, confidential, regulated"
          " (such as payment, health or personal data).",
          "Environment: production, staging, development or test.",
          "Exposure: internet-facing, internal only, or third-party "
          "connected.",
          "Compliance scope: whether the asset falls under a regulation "
          "or audit requirement.",
        ],
      ),
      LessonSection(
        heading: "The Crown Jewels: Databases, Identity and Backups",
        body:
            "Every organization has a short list of systems whose "
            "compromise would be catastrophic, often called the crown "
            "jewels. Finding them is a joint task with the business, "
            "because only the business knows what hurts most when it stops."
            " Typical examples:",
        bullets: [
          "Databases holding customer, financial, health or "
          "intellectual-property data.",
          "Domain controllers and the identity provider, because whoever "
          "controls identity controls everything.",
          "Backup systems, because attackers target them first to make "
          "recovery impossible.",
          "Payment and billing systems, and anything that can move money.",
          "Source code repositories, build pipelines and signing keys, "
          "since compromising them compromises every customer downstream.",
          "Email and collaboration platforms, where most business secrets"
          " live.",
          "Internet-facing applications and VPN or remote-access "
          "gateways, which are the front door.",
        ],
      ),
      LessonSection(
        heading: "Critical Users: People Who Need Extra Attention",
        body:
            "Accounts matter as much as machines. Some users carry far more"
            " risk than others, either because of what they can do or "
            "because attackers specifically target them. Identify and tag "
            "them so that alerts involving them are escalated quickly.",
        bullets: [
          "Privileged and administrator accounts, including domain, cloud"
          " and database admins.",
          "Service accounts and application identities, which often have "
          "broad access and no human watching them.",
          "Executives and their assistants, who are targeted by whaling "
          "and impersonation.",
          "Finance and payments staff, who can authorize transfers.",
          "HR and payroll staff, who hold personal data on everyone.",
          "Developers and engineers with production or pipeline access.",
          "Leavers, joiners and people on notice, whose behavior changes "
          "in ways worth watching.",
          "Third-party and contractor accounts, who sit outside your "
          "normal controls.",
        ],
      ),
      LessonSection(
        heading: "Ownership: Who Do You Call at 3 a.m.?",
        body:
            "An alert about a system is far easier to handle when you know "
            "who owns it. The owner can tell you in one call whether an "
            "event is expected, whether a change was planned, what the "
            "system does and what stopping it would cost. Without an owner,"
            " you are guessing, and you may isolate something that the "
            "business cannot afford to lose, or leave something exposed "
            "because nobody could say it mattered.\n"
            "\n"
            "Ownership information should include a name, a team, a backup "
            "contact, and how to reach them outside office hours. Review it"
            " regularly, because people move and teams reorganize. An "
            "out-of-date owner field is a quiet hazard: it sends the SOC to"
            " someone who left last year. Treat an asset without an owner "
            "as an incident-in-waiting and report it.",
      ),
      LessonSection(
        heading: "Sample Asset Register Entries",
        isTemplate: true,
        body:
            "SAMPLE ASSET REGISTER (fictional)\n"
            "\n"
            "ASSET:        DB-CUST-01\n"
            "TYPE:         Production database server\n"
            "TIER:         1 (critical)\n"
            "OWNER:        Data Engineering, Priya Nair, backup: R. Salazar\n"
            "DATA:         Regulated (customer personal data, card last-4)\n"
            "EXPOSURE:     Internal only\n"
            "LOGS:         OS, database audit, EDR - all reporting\n"
            "NOTES:        Backups to BKP-02, nightly at 01:00 UTC\n"
            "\n"
            "ASSET:        WS-ACC-014\n"
            "TYPE:         Workstation\n"
            "TIER:         3\n"
            "OWNER:        Accounts Payable, line manager L. Fernandes\n"
            "DATA:         Internal\n"
            "EXPOSURE:     Internal only\n"
            "LOGS:         EDR reporting; no application logs\n"
            "NOTES:        User has payment-approval rights (critical user)\n"
            "\n"
            "ASSET:        TEST-VM-77\n"
            "TYPE:         Virtual machine\n"
            "TIER:         4\n"
            "OWNER:        NONE RECORDED  <-- finding\n"
            "LOGS:         None  <-- finding\n"
            "NOTES:        Found by network discovery, not in CMDB",
      ),
      LessonSection(
        heading: "How Tags Change an Alert in Practice",
        body:
            "Compare the same alert twice. First, with no context: "
            "\"Suspicious PowerShell execution on host SRV-114.\" An analyst "
            "has to look up what SRV-114 is before deciding how fast to "
            "move.\n"
            "\n"
            "Now the same alert after enrichment from the inventory: "
            "\"Suspicious PowerShell execution on SRV-114: Tier 1 production"
            " database, owner Data Engineering, regulated data, "
            "internet-exposed jump host nearby.\" The priority is obvious at"
            " a glance, the owner to call is named, and the likely impact "
            "is known. Good tagging turns minutes of lookup into seconds "
            "and makes severity decisions faster and more consistent.",
      ),
      LessonSection(
        heading: "Coverage: Mapping Assets to Logs",
        body:
            "Once assets are tagged, you can ask the most useful question "
            "in this lesson: for each critical asset, which log sources are"
            " reaching the SIEM? Build a simple coverage table, with the "
            "assets on one side and the data sources on the other, and look"
            " for blanks.\n"
            "\n"
            "Prioritize by tier. A missing log on a Tier 4 test machine is "
            "a note for later. A missing log on a Tier 1 database is an "
            "urgent finding. This also gives the SOC a defensible way to "
            "ask for budget and engineering time, because the request is "
            "tied to the business risk of a named system rather than a "
            "vague wish for more logging.",
      ),
      LessonSection(
        heading: "Visibility Gaps: The Logs You Do Not Have",
        body:
            "Inventory and coverage together expose the most dangerous log "
            "of all: the one that does not exist. If a system is not "
            "sending logs to the SOC, no rule can fire and no analyst can "
            "look, and the attacker gets a blind spot to work in.\n"
            "\n"
            "Common causes of gaps are legacy servers nobody onboarded, "
            "cloud accounts created outside the normal process, personal "
            "devices, agents that failed to install or were removed, and "
            "logging that was switched off to save cost or to fix a "
            "performance problem and never turned back on. Gaps also hide "
            "inside systems that are reporting: a server may send "
            "operating-system logs but not the database audit logs that "
            "would show data being copied.\n"
            "\n"
            "This is why mature SOCs treat log coverage as a metric of its "
            "own. Asking \"what can we not see?\" is as important as asking "
            "\"what did we see?\". When you find a gap during an "
            "investigation, record it as a finding even if the incident "
            "itself is closed.",
      ),
      LessonSection(
        heading: "Retention: How Far Back You Can Look",
        body:
            "Logs are not kept forever. Hot storage that is quick to search"
            " might hold only 30 to 90 days, while older data sits in "
            "cheaper archives that are slow to query, or is deleted "
            "altogether. Many intrusions are discovered weeks after they "
            "began, so retention directly decides how much of the story you"
            " can reconstruct.\n"
            "\n"
            "When an investigation starts, one of the earliest practical "
            "steps is to preserve the relevant logs, by exporting or "
            "tagging them, so that routine deletion does not remove "
            "evidence while you are still working.",
      ),
    ],
  ),
  Lesson(
    title: "How a SIEM Works",
    estimatedMinutes: 15,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "What a SIEM Does, in One Paragraph",
        body:
            "A SIEM, or Security Information and Event Management platform,"
            " is the central system that collects logs from across the "
            "organization, converts them into a common format, stores them,"
            " searches them and raises alerts when something matches a "
            "detection rule. Think of it as a very fast librarian that "
            "reads every record the company produces and taps you on the "
            "shoulder when a pattern looks wrong.\n"
            "\n"
            "It does not understand your business. It only follows the "
            "rules and queries people give it, which is why the quality of "
            "the rules matters as much as the quality of the platform.",
      ),
      LessonSection(
        heading: "The Pipeline: Collect, Parse, Enrich, Detect, Alert",
        body:
            "Every SIEM follows the same basic path, and knowing it helps "
            "you diagnose problems quickly:",
        bullets: [
          "Collect: agents, connectors or APIs pull or receive logs from "
          "each source. If collection breaks, the data silently stops "
          "arriving.",
          "Parse: raw text is split into named fields such as user, "
          "source address and action, so that records from different "
          "vendors can be searched the same way.",
          "Enrich: extra context is attached, such as the owner of an "
          "asset, the department of a user, the geolocation of an address"
          " or whether a domain appears in a threat-intelligence feed.",
          "Detect: rules and analytics compare the stream against known "
          "bad patterns, thresholds and behavior baselines.",
          "Alert: a match creates an alert or a case, with a severity, "
          "that lands in an analyst's queue.",
        ],
      ),
      LessonSection(
        heading: "Correlation: Where a SIEM Earns Its Keep",
        body:
            "A single log line is rarely alarming. A user failing to sign "
            "in once means nothing. The power of a SIEM is correlation: "
            "joining records from different sources over time so that a "
            "pattern emerges that no single source would show.\n"
            "\n"
            "For example, one failed sign-in is noise, but 40 failures from"
            " one address followed by one success, followed within minutes "
            "by a new inbox rule on that account, is a story. Each fact "
            "came from a different log. Correlation turns separate facts "
            "into a sequence, and a sequence is what an analyst can "
            "actually investigate.",
      ),
      LessonSection(
        heading: "Enrichment: Where the Inventory Pays Off",
        body:
            "A SIEM that only stores raw events leaves the analyst to do "
            "all the lookups. A SIEM that enriches events attaches the "
            "context from your inventory automatically: the asset's tier, "
            "its owner, the user's department and whether they are "
            "privileged, the geolocation of an address, and whether a "
            "domain or hash appears in an intelligence feed.\n"
            "\n"
            "This is the reason the tagging work in the previous lesson "
            "matters. Enrichment lets rules and dashboards behave "
            "differently for a Tier 1 database than for a test laptop, lets"
            " the queue sort by real business risk, and puts the owner's "
            "name in the ticket before the analyst has even opened it.",
      ),
      LessonSection(
        heading: "Watchlists and Lookup Tables",
        body:
            "Most SIEMs let you maintain lists that rules can refer to. "
            "They are among the most useful tools a SOC has, and they are "
            "simple to build.",
        bullets: [
          "A watchlist of critical users (executives, admins, finance), "
          "so that any alert on them is raised in priority.",
          "A list of critical assets and crown jewels, so detections can "
          "be stricter for them.",
          "A list of approved scanners, jump hosts and administrative "
          "addresses, so that expected activity can be excluded narrowly.",
          "A list of leavers and people on notice, so that unusual data "
          "access is flagged.",
          "A list of known-bad addresses, domains and hashes from your "
          "intelligence sources, with an expiry so stale entries drop "
          "away.",
        ],
      ),
      LessonSection(
        heading: "Dashboards and Health Checks",
        body:
            "A SOC also needs to watch its own pipeline. Useful dashboards "
            "show log volume per source over time, sources that have gone "
            "quiet, parsing failures, ingestion delays, the number of open "
            "alerts by age and severity, and the share of critical assets "
            "with full coverage.\n"
            "\n"
            "Check the health dashboard at the start of every shift. A gap "
            "you spot on Monday morning can be fixed before it matters. A "
            "gap you discover during a major incident is a gap that has "
            "already cost you.",
      ),
      LessonSection(
        heading: "Sample Enriched Alert in the Queue",
        isTemplate: true,
        body:
            "SAMPLE ALERT AS THE ANALYST SEES IT\n"
            "\n"
            "TITLE:     Multiple failed sign-ins followed by success\n"
            "USER:      l.fernandes   [CRITICAL USER: payment approver]\n"
            "SOURCE IP: 198.51.100.140  [NEW COUNTRY, not seen in 90 days]\n"
            "ASSET:     Mail and finance portal  [TIER 1]\n"
            "OWNER:     Finance Systems team (on call: A. Okoye)\n"
            "MITRE:     T1110 Brute Force, T1078 Valid Accounts\n"
            "PRIOR 30 DAYS: 2 earlier low-severity alerts for this user, "
            "both closed as false positives (travel)\n"
            "SUGGESTED SEVERITY: P2 (critical user, Tier 1 asset)\n"
            "\n"
            "Notice how much of this the analyst did not have to look up: "
            "who the user is, how important the asset is, whom to call, "
            "what technique it resembles, and what has happened to this "
            "user recently.",
      ),
      LessonSection(
        heading: "Searching: The Questions You Will Ask Every Day",
        body:
            "Whatever the product, searching a SIEM comes down to the same "
            "few operations: filter to a time range, filter to the entities"
            " you care about, group and count, and sort. Real syntax varies"
            " between products, so learn the pattern rather than memorizing"
            " one language.\n"
            "\n"
            "Here is the logic of a typical search, written in plain words:"
            " \"Within the last 24 hours, find successful sign-ins for this "
            "user, group them by source address and country, and show me "
            "the first and last time each one appeared.\" If you can say a "
            "question that clearly, you can translate it into any query "
            "language. If you cannot say it clearly, the query will not "
            "save you.",
      ),
      LessonSection(
        heading: "Why Most Alerts Are False Positives",
        body:
            "A large share of alerts in every SOC are false positives, and "
            "that is expected rather than a failure. Rules are written to "
            "be sensitive, because missing a real attack is worse than "
            "checking a harmless event. The cost is that analysts spend "
            "much of their time ruling things out.\n"
            "\n"
            "Understanding this changes how you work. A false positive "
            "handled well is still useful: you close it with a clear "
            "reason, and if the same cause keeps coming up, you raise it so"
            " the rule can be tuned. A false positive handled badly, with "
            "no note and no pattern spotted, will return tomorrow.",
      ),
      LessonSection(
        heading: "When the SIEM Is Wrong About Itself",
        body:
            "A SIEM can fail silently. A log source may stop sending, a "
            "parser may break after a vendor update so that fields come "
            "through empty, or a rule may stop matching after a naming "
            "change. Everything looks calm, but only because the system has"
            " gone blind.\n"
            "\n"
            "A healthy SOC watches for the absence of data as well as the "
            "presence of alerts. If a source that normally produces "
            "thousands of events an hour suddenly produces none, treat that"
            " as an alert in its own right and investigate it.",
      ),
    ],
  ),
  Lesson(
    title: "Reading Logs Like an Analyst",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Start From the Question, Not the Data",
        body:
            "New analysts often open a log and scroll, hoping something "
            "will stand out. That rarely works, because real logs contain "
            "thousands of ordinary lines. Start instead with a specific "
            "question drawn from the alert: was this sign-in really the "
            "user? did this process make an outbound connection? did "
            "anything else happen from this address?\n"
            "\n"
            "A good question narrows the search, tells you which source to "
            "open and gives you a clear answer to write in the ticket: yes,"
            " no, or not enough information. That last answer is allowed, "
            "and it is better than a guess.",
      ),
      LessonSection(
        heading: "Know What Normal Looks Like",
        body:
            "You can only spot the unusual if you know the usual. Every "
            "account, server and service has a normal pattern: the hours it"
            " is active, the places it connects from, the amount of data it"
            " moves, the programs it runs. This is called a baseline.\n"
            "\n"
            "When you triage, compare the event with the baseline. A "
            "finance manager signing in at 09:00 from the office is "
            "unremarkable. The same account signing in at 03:00 from a new "
            "country on a new device is a departure from the baseline, and "
            "that departure, not the sign-in itself, is the evidence.",
      ),
      LessonSection(
        heading: "Look Back 30 to 90 Days Before You Decide",
        body:
            "A single event rarely tells you whether something is wrong. "
            "The history around it usually does. Before you call an alert a"
            " false positive or a true positive, look back across the "
            "previous 30 to 90 days for the user, the device and the source"
            " involved. Ask whether this behavior has happened before, and "
            "if so, whether it was ever explained.\n"
            "\n"
            "This single habit prevents many mistakes in both directions. "
            "It stops you closing a real attack as a harmless oddity, and "
            "it stops you escalating something that turns out to be a "
            "long-standing routine. Always record the look-back window you "
            "used in the ticket, so that the next analyst can see how "
            "thorough the check was.",
      ),
      LessonSection(
        heading: "What to Check in the User's History",
        body:
            "For an alert about a person's account, work through the same "
            "questions each time:",
        bullets: [
          "Sign-in locations and countries: has this user signed in from "
          "here before? How often, and how recently?",
          "Devices and browsers: is this a device the user has used "
          "before, or a first appearance?",
          "Hours of activity: do they normally work at this time, or is "
          "this a break in the pattern?",
          "Previous alerts and tickets: has the user triggered alerts "
          "before, and how were they closed? A run of closed false "
          "positives can hide the first real one.",
          "Account changes: any recent password resets, MFA changes, new "
          "devices registered, mailbox rule changes or forwarding "
          "settings?",
          "Privilege changes: new roles, group memberships or access "
          "grants in the period?",
          "Data access: is the amount and type of data they have touched "
          "unusual compared to their own past?",
          "Failed activity: any earlier failed sign-ins, blocked "
          "downloads or denied access that look like probing?",
        ],
      ),
      LessonSection(
        heading: "What to Check in the Device and Source History",
        body:
            "The same discipline applies to machines and network sources. "
            "Look for earlier detections on the device, recent software "
            "installs, new scheduled tasks or services, unusual outbound "
            "connections, and changes in the amount of traffic. For an "
            "address or domain, check which other users and devices have "
            "contacted it in the same period, and when it first appeared in"
            " your logs.\n"
            "\n"
            "A domain that first appears in your environment yesterday and "
            "has already been contacted by twenty machines is a very "
            "different case from one your company has used for years. "
            "First-seen information is some of the most valuable context "
            "you can find, and a SIEM can produce it in seconds.",
      ),
      LessonSection(
        heading: "Compare With Peers",
        body:
            "Besides the user's own history, compare them with a peer "
            "group: people in the same team, with the same role and the "
            "same access. If every member of the finance team uses a "
            "particular tool every month, the user doing so is "
            "unremarkable. If only one person does, or if one person is "
            "moving ten times as much data as the others, that difference "
            "is a lead.\n"
            "\n"
            "Peer comparison is especially helpful for new joiners and "
            "users with little history, where a personal baseline does not "
            "yet exist.",
      ),
      LessonSection(
        heading: "Add the Human Context",
        body:
            "Logs do not know about the real world. A user signing in from "
            "another country may be on a business trip, a user downloading "
            "a lot of data may be about to leave the company, and a service"
            " account behaving oddly may have just had a planned migration."
            " Ask the people who know: the user's manager, HR for leavers "
            "and role changes, the asset owner for changes, and the change "
            "calendar for planned work.\n"
            "\n"
            "Be careful how you ask. In a possible compromise, contacting "
            "the user through the account that may be controlled by an "
            "attacker alerts the attacker. Use a known, separate channel "
            "such as a phone number from the directory, and keep the "
            "details to what is needed.",
      ),
      LessonSection(
        heading: "Choose the Right Window",
        body:
            "How far back to look depends on what you are investigating. As"
            " a guide:",
        bullets: [
          "30 days: a routine baseline for sign-in patterns and normal "
          "activity.",
          "60 to 90 days: patterns of repeated low-level alerts, slow "
          "password guessing, and first-seen checks on domains and "
          "addresses.",
          "90 days and longer: dormant accounts that suddenly wake, "
          "persistence mechanisms, and insider cases where behavior "
          "changes gradually.",
          "From the first suspicious event onward: for any confirmed "
          "compromise, look back to the earliest sign of the attacker, "
          "which is often much earlier than the alert.",
        ],
      ),
      LessonSection(
        heading: "Remember Your Retention Limits",
        body:
            "A 90-day look-back is only possible if the logs still exist. "
            "Check the retention of each source before you plan your "
            "search, and note when the history you need is simply not "
            "available. Saying \"no data older than 30 days for this source\""
            " in the ticket is honest and useful. Pretending you checked 90"
            " days when you could only see 30 is how wrong conclusions get "
            "written into the record.",
      ),
      LessonSection(
        heading: "Sample Look-Back Notes in a Ticket",
        isTemplate: true,
        body:
            "SAMPLE LOOK-BACK NOTE\n"
            "\n"
            "ALERT: Sign-in from new country for a.kapoor\n"
            "WINDOW CHECKED: 90 days (sign-in log, mail audit, MFA changes)\n"
            "\n"
            "FINDINGS\n"
            "- Previous sign-ins: India only, same phone and laptop, office"
            " hours.\n"
            "- Prior alerts: one in July (VPN exit in another country), "
            "closed as FP after user confirmation.\n"
            "- Account changes: none in 90 days. No MFA or forwarding "
            "changes.\n"
            "- Peers: 3 of 11 team members have signed in from this VPN "
            "provider.\n"
            "- Unavailable: proxy logs retained 30 days only; could not "
            "check earlier web activity.\n"
            "\n"
            "ASSESSMENT\n"
            "New device and VPN are consistent with the July pattern, but "
            "this is the first US exit. Escalating for a user callback via "
            "phone before closing.",
      ),
      LessonSection(
        heading: "A Worked Example: Reading an Authentication Log",
        body:
            "Below is a short extract of sign-in records for one account. "
            "Read it the way you would in a real case, looking for time, "
            "actor, action, source and outcome.",
      ),
      LessonSection(
        heading: "Sample Log Extract and How to Read It",
        isTemplate: true,
        body:
            "SAMPLE AUTHENTICATION LOG (times in UTC)\n"
            "\n"
            "08:58  l.fernandes  sign-in FAILED   198.51.100.140  password "
            "wrong\n"
            "08:58  l.fernandes  sign-in FAILED   198.51.100.140  password "
            "wrong\n"
            "08:59  l.fernandes  sign-in FAILED   198.51.100.140  password "
            "wrong\n"
            "08:59  l.fernandes  sign-in SUCCESS  198.51.100.140  MFA not "
            "required\n"
            "09:03  l.fernandes  mailbox rule CREATED  198.51.100.140\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. Three quick failures, then a success, all from one address:"
            " consistent with someone guessing or testing passwords.\n"
            "2. \"MFA not required\" on the success: why? A policy gap or a "
            "trusted-location exception would explain the attacker getting "
            "in so easily. Worth checking.\n"
            "3. A mailbox rule created four minutes after the first "
            "success, from the same address: a typical first move after "
            "taking over a mailbox.\n"
            "4. Open question: is 198.51.100.140 normal for this user? The "
            "baseline decides whether this is a break-in or a user on a new"
            " network.",
      ),
      LessonSection(
        heading: "Pivoting: Following One Clue to the Next",
        body:
            "Investigation is mostly pivoting. You take one fact from the "
            "alert and use it as the search term for the next question. A "
            "suspicious address leads you to every account it touched. A "
            "suspicious account leads you to every device it used. A "
            "suspicious file hash leads you to every machine where that "
            "file appeared.\n"
            "\n"
            "The skill is knowing when to stop. Each pivot should answer a "
            "question that affects your decision about severity, scope or "
            "containment. If a pivot only produces more data and no new "
            "decision, note it and move on, because time is part of the "
            "cost.",
      ),
      LessonSection(
        heading: "Three Traps That Mislead Beginners",
        body:
            "These habits cause most wrong conclusions in log analysis:",
        bullets: [
          "Reading absence as proof. No results can mean nothing "
          "happened, or that you searched the wrong field, the wrong time"
          " range or a source that does not log that event.",
          "Trusting the first explanation. The innocent reading that fits"
          " first is not necessarily the right one. Look for the evidence"
          " that would contradict it.",
          "Ignoring time zones and clock drift. Events from two systems "
          "only line up if their timestamps are comparable.",
        ],
      ),
      LessonSection(
        heading: "Writing Down What You Found",
        body:
            "A finding that is not written down did not happen, as far as "
            "the next analyst is concerned. Record the query you used, the "
            "time range, the number of results and the conclusion. Someone "
            "else, or you in three weeks, should be able to repeat the "
            "search and reach the same answer.\n"
            "\n"
            "This also protects you. If a decision is questioned later, the"
            " notes show what evidence you had at the time, which is the "
            "fair standard to be judged on.",
      ),
    ],
  ),
  Lesson(
    title: "Threat Intelligence and MITRE ATT&CK",
    estimatedMinutes: 22,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "What Threat Intelligence Is, and Is Not",
        body:
            "Threat intelligence is information about attackers: who they "
            "are, what they target, how they operate and which technical "
            "traces they leave. It reaches a SOC through commercial feeds, "
            "sharing groups, government advisories, vendor reports and the "
            "SOC's own past incidents.\n"
            "\n"
            "It is an input to your judgment, not a verdict. A feed saying "
            "an address is malicious is a reason to look harder, not a "
            "reason to stop thinking. Feeds go out of date, addresses are "
            "reused by innocent parties, and a clean result only means the "
            "feed has not seen it yet.",
      ),
      LessonSection(
        heading: "Indicators of Compromise: Useful but Perishable",
        body:
            "An indicator of compromise, or IOC, is a technical clue that "
            "suggests a compromise: an IP address, a domain, a file hash, a"
            " URL, an email address. IOCs are easy to share and easy to "
            "search for, which makes them popular.\n"
            "\n"
            "They are also easy for an attacker to change. A new domain "
            "costs a few dollars and an address can be swapped in minutes, "
            "so an IOC may be useless within days. Treat them as good for "
            "finding what has already happened, and weak for stopping what "
            "will happen next.",
      ),
      LessonSection(
        heading: "Behavior Lasts Longer Than Artifacts",
        body:
            "Indicators of attack, or IOAs, describe what an attacker does "
            "rather than what they use: dumping credentials from memory, "
            "creating a hidden forwarding rule, running remote-execution "
            "tools from an ordinary workstation at night. These behaviors "
            "are much harder for an attacker to change, because they are "
            "the job itself.\n"
            "\n"
            "This is why mature detections lean towards behavior. A rule "
            "that fires on a known bad address catches one campaign. A rule"
            " that fires on a service account logging on interactively "
            "catches many.",
      ),
      LessonSection(
        heading: "MITRE ATT&CK: A Shared Vocabulary",
        body:
            "MITRE ATT&CK is a public catalog of attacker behavior, "
            "organised so that everyone can describe the same thing in the "
            "same words. It groups behavior into tactics, which are the "
            "attacker's goals, and techniques, which are the ways of "
            "achieving them.",
        bullets: [
          "Initial Access: how they get in, for example a phishing email "
          "or a stolen credential.",
          "Execution: how they run their code.",
          "Persistence: how they stay in after a restart or password "
          "change.",
          "Privilege Escalation: how they gain more power.",
          "Defense Evasion: how they avoid being noticed.",
          "Credential Access: how they steal passwords and tokens.",
          "Discovery: how they learn about the environment.",
          "Lateral Movement: how they spread to other systems.",
          "Collection and Exfiltration: how they gather and take data.",
          "Impact: what they finally do, such as encrypting files.",
        ],
      ),
      LessonSection(
        heading: "How ATT&CK Is Organized: Tactics, Techniques, Sub-techniques",
        body:
            "ATT&CK has three levels. Tactics are the attacker's goals, "
            "such as gaining access or stealing data. Techniques are the "
            "specific ways of reaching a goal, and each has an identifier "
            "starting with T, for example T1566 for Phishing. "
            "Sub-techniques add detail and carry a decimal suffix, for "
            "example T1566.001 for Spearphishing Attachment and T1566.002 "
            "for Spearphishing Link.\n"
            "\n"
            "The catalog is public, maintained by MITRE and updated "
            "regularly, and it lists for each technique what it is, which "
            "groups and tools use it, and how it might be detected and "
            "mitigated. There are separate matrices for enterprise "
            "environments, mobile and industrial systems, and the "
            "enterprise one has further views for cloud and identity "
            "platforms. Think of it as a reference book you consult "
            "constantly, not something you read once.",
      ),
      LessonSection(
        heading: "Techniques You Will See Over and Over",
        body:
            "A handful of techniques account for a great deal of everyday "
            "SOC work. Knowing their identifiers and what they look like in"
            " logs speeds up triage considerably.",
        bullets: [
          "T1566 Phishing: malicious email, link or attachment. The start"
          " of many incidents.",
          "T1078 Valid Accounts: using real, stolen credentials. Often "
          "indistinguishable from the real user except by context.",
          "T1110 Brute Force: password guessing, spraying or credential "
          "stuffing.",
          "T1621 Multi-Factor Authentication Request Generation: "
          "bombarding a user with push prompts until they approve.",
          "T1059.001 PowerShell: command execution through PowerShell, "
          "common for living off the land.",
          "T1021.001 and T1021.002 Remote Services (RDP, SMB/Windows "
          "admin shares): moving between machines.",
          "T1003 OS Credential Dumping: stealing passwords or hashes from"
          " memory.",
          "T1098 Account Manipulation: changing permissions or "
          "credentials to keep access.",
          "T1114.003 Email Forwarding Rule: quietly copying a victim's "
          "mail elsewhere.",
          "T1567 Exfiltration Over Web Service: sending data out through "
          "ordinary web or cloud services.",
          "T1486 Data Encrypted for Impact: ransomware.",
          "T1195 Supply Chain Compromise: attacking a trusted supplier or"
          " software update path.",
        ],
      ),
      LessonSection(
        heading: "Daily Use 1: Label Every Alert and Ticket",
        body:
            "The simplest daily habit is to put the relevant technique "
            "identifier in every alert and ticket. Not because anyone is "
            "checking, but because the act of choosing forces you to state "
            "what the attacker was trying to do. \"T1110, T1078\" in the "
            "ticket header tells the next reader, in two words, that this "
            "looked like guessing followed by a successful login.\n"
            "\n"
            "Labeling consistently also makes your data useful. A month "
            "later, you can count how many incidents involved phishing "
            "versus stolen credentials, and decide where to invest. Free "
            "text cannot be counted that way.",
      ),
      LessonSection(
        heading: "Daily Use 2: Ask What Comes Next, and What Came Before",
        body:
            "Attackers follow a chain. Each step has typical predecessors "
            "and successors, and ATT&CK lets you reason along that chain "
            "instead of treating each alert in isolation.\n"
            "\n"
            "Looking forward: you see discovery commands (T1087 Account "
            "Discovery, T1069 Permission Groups Discovery). The next likely"
            " steps are credential access and lateral movement, so check "
            "whether credentials were dumped or remote services used. "
            "Looking backward: you see lateral movement. Something must "
            "have given the attacker their first foothold and their "
            "credentials, so find the initial access and the credential "
            "theft that you have not yet seen.\n"
            "\n"
            "This forward and backward questioning is how an analyst turns "
            "one alert into a scoped incident, and it is how you find the "
            "parts of the story you were never alerted to.",
      ),
      LessonSection(
        heading: "Daily Use 3: A Worked Chain",
        isTemplate: true,
        body:
            "SAMPLE CHAIN, MAPPED TO ATT&CK\n"
            "\n"
            "1. A user opens a document from an email.       T1566.001 "
            "Initial Access\n"
            "2. The document runs a hidden PowerShell.       T1059.001 "
            "Execution\n"
            "3. A scheduled task is created to survive reboots. T1053 "
            "Persistence\n"
            "4. Credentials are dumped from memory.           T1003 "
            "Credential Access\n"
            "5. The attacker lists domain admins.              T1069 "
            "Discovery\n"
            "6. A remote tool starts a session on a server.    T1021 "
            "Lateral Movement\n"
            "7. Shadow copies are deleted.                     T1490 Impact"
            " (inhibit recovery)\n"
            "8. Files are encrypted.                           T1486 Impact\n"
            "\n"
            "If your first alert is step 5, the chain tells you to hunt "
            "backwards for steps 1 to 4 and forwards for steps 6 to 8. If "
            "it is step 7, you are minutes from step 8, and the correct "
            "response is immediate containment.",
      ),
      LessonSection(
        heading: "Daily Use 4: Explain Severity and Scope",
        body:
            "Technique and tactic also help with severity. An alert at the "
            "Impact stage means damage is happening now. An alert at the "
            "Discovery stage means the attacker is already inside and "
            "planning. Early-stage events such as a blocked phishing "
            "attempt are important but usually lower in urgency.\n"
            "\n"
            "They also help with scope. When you can say \"we have confirmed"
            " Initial Access, Execution and Credential Access, but have not"
            " seen Lateral Movement\", you have told leadership exactly how "
            "far the attacker got, and what you are checking next.",
      ),
      LessonSection(
        heading: "Daily Use 5: Find Gaps in Detection Coverage",
        body:
            "Map your detection rules to ATT&CK techniques and look at the "
            "result. Free tools such as the ATT&CK Navigator let you color "
            "a matrix by coverage. The blank areas are techniques you would"
            " not currently notice.\n"
            "\n"
            "Do not aim to cover every technique. Aim to cover the "
            "techniques most relevant to your organization and your crown "
            "jewels. A company that relies on a cloud identity provider "
            "needs strong coverage of credential and account techniques. "
            "One with an exposed web application needs coverage of initial "
            "access and web-server techniques. Combine the matrix with your"
            " threat intelligence to decide the order.",
      ),
      LessonSection(
        heading: "Daily Use 6: Hunting and Testing",
        body:
            "ATT&CK is a ready supply of hunting ideas. Pick a technique, "
            "write a hypothesis (\"if someone were using stolen credentials "
            "to access mailboxes, we would see sign-ins from new devices "
            "followed by mail access\"), search your logs for it, and record"
            " what you found, including when you found nothing. Each hunt "
            "either finds a threat, finds a gap, or builds confidence.\n"
            "\n"
            "The same catalog supports testing. Teams use it to plan safe, "
            "approved simulations, so they can confirm that their rules "
            "fire for the technique they were written for. A rule that has "
            "never been tested against its technique is a hope, not a "
            "control.",
      ),
      LessonSection(
        heading: "Daily Use 7: Reporting and Shared Language",
        body:
            "In an incident report or root cause analysis, ATT&CK gives "
            "everyone the same words. Instead of describing the attacker's "
            "actions loosely, you list the techniques observed, in order, "
            "with the evidence for each. Other teams, auditors, partners "
            "and threat-intelligence sources can then compare your incident"
            " with others, and defenders can see precisely which controls "
            "failed.\n"
            "\n"
            "It also improves the corrective actions. Naming the technique "
            "that succeeded makes it easier to say which control would have"
            " blocked it, such as stronger MFA for T1078 or restricting "
            "remote tools for T1021.",
      ),
      LessonSection(
        heading: "Mapping an Alert in Five Questions",
        body:
            "When you are unsure how to map an alert, ask:",
        bullets: [
          "What was the attacker, or the tool, trying to achieve? That "
          "gives you the tactic.",
          "How did they do it? That points to the technique and, if "
          "known, the sub-technique.",
          "What evidence in the log supports it? Write it next to the "
          "label so it can be checked.",
          "What usually comes immediately before and after? That gives "
          "you your next searches.",
          "Is there an innocent explanation that uses the same technique?"
          " Many techniques are also normal administration, so confirm "
          "with context.",
        ],
      ),
      LessonSection(
        heading: "Limits and Common Misuse",
        body:
            "ATT&CK is powerful but easy to misuse. Treat these as "
            "warnings:",
        bullets: [
          "It is not a checklist. Covering every box does not make you "
          "secure, and an attacker may use a variation that is not in the"
          " catalog yet.",
          "A technique match is not proof. PowerShell, remote desktop and"
          " scheduled tasks are used by administrators every day. The "
          "technique tells you what to look for, not that the behavior is"
          " malicious.",
          "Do not over-tag. Labeling a ticket with ten techniques that "
          "you did not actually see makes the data worthless.",
          "Do not confuse it with a kill chain. Real intrusions skip "
          "steps, repeat them and run in parallel. The order in the "
          "matrix is a guide, not a script.",
          "Keep it current. The catalog changes, and identifiers and "
          "descriptions evolve, so refer to the live version.",
        ],
      ),
      LessonSection(
        heading: "A Companion Framework: MITRE D3FEND",
        body:
            "ATT&CK describes what attackers do. MITRE also publishes "
            "D3FEND, a companion catalog of defensive techniques that maps "
            "defensive measures to the attacker behavior they counter. When"
            " you write corrective actions after an incident, it helps you "
            "choose controls in a structured way: find the technique that "
            "succeeded, then look at what defensive techniques address it.",
      ),
      LessonSection(
        heading: "Using ATT&CK in Daily Work",
        body:
            "You do not need to memorize the catalog. You need to use it. "
            "When an alert arrives, ask which tactic it represents and what"
            " usually comes next. A discovery command suggests the attacker"
            " is mapping the network, so look for lateral movement. A "
            "forwarding rule suggests collection, so ask what has already "
            "been taken.\n"
            "\n"
            "It is just as useful for gaps. If your detections cover "
            "Initial Access well but say nothing about Persistence, an "
            "attacker who gets past the front door will move unseen. "
            "Mapping rules to tactics shows where the coverage is thin.",
      ),
      LessonSection(
        heading: "Intelligence Needs Context to Be Safe",
        body:
            "The same indicator can mean different things in different "
            "places. A remote-administration tool is an attack signal on an"
            " accounts workstation and a daily routine on an IT help-desk "
            "machine. Before acting on an intelligence match, check whether"
            " it fits the asset, the user and the time.\n"
            "\n"
            "Also remember who else might see your actions. Blocking a "
            "shared hosting address because one tenant misbehaved can cut "
            "off legitimate services. Match the strength of your action to "
            "the confidence in the evidence.",
      ),
    ],
  ),
  Lesson(
    title: "Writing and Tuning Detections",
    estimatedMinutes: 15,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "A Detection Is a Hypothesis",
        body:
            "Every detection rule starts as a guess: if an attacker does "
            "this, we should see that. \"If someone runs a mass file rename,"
            " we should see thousands of file changes in a minute.\" The "
            "rule is useful only if the guess holds up against real data.\n"
            "\n"
            "This framing keeps you honest. A rule is never finished. It is"
            " a working theory that you test, measure and revise as you "
            "learn what the environment really looks like.",
      ),
      LessonSection(
        heading: "The Parts of a Good Rule",
        body:
            "Whatever the language, solid rules contain the same elements:",
        bullets: [
          "Scope: which data source and which assets the rule applies to.",
          "Condition: the pattern that must be present, written as "
          "precisely as the behavior allows.",
          "Threshold and window: how many times within how long, so one "
          "stray event does not trigger it.",
          "Exclusions: known, documented, approved activity that should "
          "not alert, such as the vulnerability scanner.",
          "Severity and context: how serious a match usually is, and the "
          "information an analyst needs to start working immediately.",
          "An owner and a review date, so the rule does not rot.",
        ],
      ),
      LessonSection(
        heading: "The Cost of Noise",
        body:
            "Every false alert costs analyst time and attention. When an "
            "analyst sees the same harmless alert fifty times, the "
            "fifty-first gets less attention than the first, and that is "
            "the one that might be real. This is alert fatigue, and it is "
            "one of the most reliable ways for a SOC to miss a genuine "
            "attack.\n"
            "\n"
            "A noisy rule is not a safe rule. It trains people to ignore "
            "it. Tuning a rule so it fires less often but more meaningfully"
            " is a security improvement, not a relaxation.",
      ),
      LessonSection(
        heading: "Use Context to Decide What Fires and How Loud",
        body:
            "Because your inventory and tags are available to the SIEM, a "
            "rule does not need to treat every asset equally. The same "
            "behavior can raise a high-severity alert on a Tier 1 database,"
            " a medium one on a standard server and only a log entry on a "
            "test machine. The same applies to users: activity from a "
            "privileged or payment-approving account can warrant a lower "
            "threshold than the same activity from an ordinary account.\n"
            "\n"
            "This context-driven approach is how a small team keeps the "
            "noise down without going blind where it matters. It also keeps"
            " decisions consistent: two analysts should reach the same "
            "priority because the tags, not their mood, decided it.",
      ),
      LessonSection(
        heading: "Tuning Without Blinding Yourself",
        body:
            "Tuning means adjusting a rule to reduce false positives while "
            "keeping its ability to catch real attacks. The tempting "
            "shortcut is to exclude the noisy thing completely, but a "
            "blanket exclusion can become a hiding place for an attacker.\n"
            "\n"
            "Safer ways to tune are to add narrow exclusions (this specific"
            " scanner address, only for this rule), to raise the threshold "
            "modestly, to add a condition that real attacks would satisfy, "
            "or to lower the severity rather than disable the rule. Always "
            "write down why the change was made and who approved it. The "
            "port-scan scenario in Investigation Practice shows the "
            "real-life version: the scanner moved, nobody updated the "
            "allow-list, and the rule fired correctly on something "
            "harmless.",
      ),
      LessonSection(
        heading: "Testing Before You Trust",
        body:
            "A rule that has never fired has not been proven to work. "
            "Before relying on one, test it against a known example, either"
            " by replaying old logs that contain the behavior or by safely "
            "simulating it in a lab or with an approved test. Confirm it "
            "fires, check that the alert contains the details an analyst "
            "needs, and measure how often it fires on normal activity.\n"
            "\n"
            "After deployment, keep watching. Track how many alerts the "
            "rule produces, how many were real and how long they took to "
            "close. Those numbers tell you when to tune, and when to retire"
            " it.",
      ),
      LessonSection(
        heading: "Detection as Code and Change Control",
        body:
            "Many teams now manage rules like software: stored in a "
            "repository, reviewed by a second person, tested automatically "
            "and released in a controlled way. The benefits are practical. "
            "You can see who changed a rule and why, you can roll back a "
            "bad change, and you avoid the situation where one person "
            "quietly edits a rule in the console and nobody knows.\n"
            "\n"
            "Even a small SOC can adopt the habit. A one-line note of what "
            "changed, why, and who agreed to it prevents a great deal of "
            "confusion later.",
      ),
      LessonSection(
        heading: "The Lifecycle of a Rule and Its Metrics",
        body:
            "Rules have a life: an idea, a draft, testing, deployment, "
            "tuning and eventually retirement. Review each rule at least "
            "yearly. The numbers that guide the review are simple: how many"
            " times it fired, how many alerts were real, how long they took"
            " to close, and whether the underlying risk still exists.\n"
            "\n"
            "Retire rules that no longer apply, and write a short note on "
            "why. A smaller set of well-maintained rules protects better "
            "than a large collection that nobody understands.",
      ),
    ],
  ),
  Lesson(
    title: "Check Your Understanding: Detection and Log Analysis",
    estimatedMinutes: 12,
    difficulty: LessonDifficulty.intermediate,
    quiz: [
      QuizQuestion(
        question: "A SIEM alert shows one failed sign-in for a user. What best "
                  "describes the value of correlation?",
        options: [
          "It lets the SIEM block any user who fails a sign-in more than "
          "once, regardless of where the attempt came from",
          "It joins events from different sources over time, so a pattern"
          " appears that no single log would show",
          "It lets the SIEM store logs for a longer period so that "
          "analysts can search further back when they need to",
          "It lets the SIEM delete failed sign-ins automatically so that "
          "analysts only ever see successful ones in their queue",
        ],
        correctIndex: 1,
        explanation:
            "One failed sign-in is noise. Correlation links it with later "
            "events, such as a success from the same address and a new "
            "inbox rule, into a sequence an analyst can investigate.",
      ),
      QuizQuestion(
        question: "You build a timeline from a firewall log and a server log, and"
                  " the events look out of order by exactly one hour. What is the"
                  " most likely cause?",
        options: [
          "The SIEM has sorted the events alphabetically, which is how it"
          " normally orders records that come from several sources",
          "The firewall has lost some log records, which is shifting "
          "every later event by the same amount of time in the report",
          "The attacker deliberately changed the server's clock so that "
          "the investigation would be confused about the real order",
          "The sources record times in different zones, so convert both "
          "to UTC before comparing the events they describe",
        ],
        correctIndex: 3,
        explanation:
            "A shift of exactly one hour points to a time zone difference, "
            "not tampering or missing data. Converting every source to UTC "
            "is the standard fix.",
      ),
      QuizQuestion(
        question: "A log source that normally sends thousands of events an hour "
                  "suddenly sends none. What should the SOC do?",
        options: [
          "Investigate the silence as a possible failure or tampering, "
          "since a blind spot can be as risky as an alert",
          "Remove the source's detection rules, since rules that never "
          "fire are using up resources in the SIEM for no benefit",
          "Wait until the end of the week and see whether the volume "
          "comes back, since sources often pause for short periods",
          "Treat the quiet as good news, because no events usually means "
          "no attacks are happening against that system today",
        ],
        correctIndex: 0,
        explanation:
            "Missing data can mean the collector broke, the parser failed "
            "or someone switched logging off. A SOC should alert on the "
            "absence of expected logs as well as on matches.",
      ),
      QuizQuestion(
        question: "An alert shows a service account logging on interactively at "
                  "03:00. How do you decide whether it is unusual?",
        options: [
          "Check whether the account has appeared in the news, since "
          "public reports are the best sign of a real compromise",
          "Check whether the logon happened at night, because any "
          "activity outside office hours is automatically suspicious",
          "Compare it with the account's baseline, since it normally runs"
          " only non-interactive jobs from one host",
          "Check whether the account has a long name, since attackers "
          "tend to create accounts with unusual names to hide",
        ],
        correctIndex: 2,
        explanation:
            "Time alone proves little. The departure from what this "
            "specific account normally does is the evidence.",
      ),
      QuizQuestion(
        question: "Which indicator is hardest for an attacker to change and so "
                  "lasts longest as a detection?",
        options: [
          "The domain name used in the phishing emails, since domains are"
          " tightly controlled by registrars worldwide",
          "The IP address of the server the attacker used for the "
          "campaign, since addresses are expensive to obtain",
          "The hash of the malware file, since a hash is a unique "
          "fingerprint that the attacker cannot alter",
          "The behavior itself, such as dumping credentials or hiding "
          "forwarding rules, the attacker's real job",
        ],
        correctIndex: 3,
        explanation:
            "Addresses, domains and hashes can be swapped cheaply and "
            "quickly. Behaviors are the work the attacker must do, so "
            "detections built on them survive longer.",
      ),
      QuizQuestion(
        question: "An alert matches a threat-intelligence feed entry for an "
                  "address. What is the best next step?",
        options: [
          "Ignore the match unless a second feed also lists the address, "
          "since a single feed is never worth acting upon",
          "Treat it as a reason to look closer, then check it fits the "
          "asset, user and time before acting on it",
          "Close the alert as a false positive, because feeds are old by "
          "definition and they are almost never accurate",
          "Block the address everywhere at once, because a feed match is "
          "a confirmed fact and needs no further checking",
        ],
        correctIndex: 1,
        explanation:
            "A feed match raises suspicion but is not a verdict. Feeds age "
            "and addresses get reused, so check context first and match the"
            " strength of the action to the evidence.",
      ),
      QuizQuestion(
        question: "A rule produces fifty harmless alerts a day. What is the best "
                  "way to tune it?",
        options: [
          "Keep the rule exactly as it is, because any reduction in "
          "alerts is a reduction in security for the company",
          "Disable the rule completely, because a rule that produces "
          "mostly false alerts cannot be made useful again",
          "Add a narrow, documented exclusion or raise the threshold "
          "slightly, and record why and who approved it",
          "Exclude all activity from the affected department, so that the"
          " alerts stop appearing in the analysts' queue",
        ],
        correctIndex: 2,
        explanation:
            "Narrow changes remove noise while keeping the rule's ability "
            "to catch real attacks. Blanket exclusions create hiding places"
            " and disabling loses the detection.",
      ),
      QuizQuestion(
        question: "You are asked to trust a new detection rule that has never "
                  "fired. What should you do first?",
        options: [
          "Test it against a known example, such as replayed logs or a "
          "safe simulation, and check the alert detail",
          "Leave it untested until a real attack happens, since that is "
          "the only reliable way to prove that a rule works",
          "Trust it, because a rule that has never fired is evidence that"
          " the environment has never had an attack",
          "Ask the vendor to confirm it works, since vendors always test "
          "their rules thoroughly against live customer data",
        ],
        correctIndex: 0,
        explanation:
            "A rule that has never fired is unproven. Testing confirms it "
            "triggers and that the alert gives the analyst what they need.",
      ),
      QuizQuestion(
        question: "A device appears in DHCP logs but not in the asset inventory. "
                  "What is the best way to treat it?",
        options: [
          "As a harmless gap in the records, because devices on the "
          "network are almost always owned by the company already",
          "As a task for the IT team in the next quarter, because "
          "inventory clean-up is not something the SOC should do",
          "As an unknown asset to investigate: find its owner and "
          "purpose, then onboard it to monitoring or remove it",
          "As a confirmed attacker device, because anything that is "
          "missing from the inventory must be a hostile system",
        ],
        correctIndex: 2,
        explanation:
            "Differences between lists are findings. The device may be "
            "harmless, but until you know what it is and who owns it you "
            "cannot judge, and unknown assets are where attackers hide.",
      ),
      QuizQuestion(
        question: "Why do mature SOCs tag assets with criticality tiers and "
                  "owners?",
        options: [
          "So alerts show business impact at a glance and the right owner"
          " can be reached quickly when triage begins",
          "So that auditors receive a longer inventory report, which "
          "usually improves the result of a compliance review",
          "So that the SIEM can store smaller amounts of data, since only"
          " the high-tier assets need logs to be kept",
          "So that every alert can be closed automatically when it is "
          "raised on a system with a low criticality tier",
        ],
        correctIndex: 0,
        explanation:
            "Tags let enrichment and rules treat a Tier 1 database "
            "differently from a test laptop and put the owner's name in the"
            " ticket, which speeds up priority and decisions.",
      ),
      QuizQuestion(
        question: "You are triaging an unusual sign-in. How far back should you "
                  "normally look at the user's history before deciding?",
        options: [
          "Only the last year, because anything shorter than that is too "
          "small to describe the user's behavior",
          "Only the sign-in itself, since extra history makes it harder "
          "to see the single event that matters",
          "Only the last hour, because older behavior has little to do "
          "with what the account is doing at the moment",
          "Typically 30 to 90 days of history, recording the window used "
          "and any gaps in available data in the ticket",
        ],
        correctIndex: 3,
        explanation:
            "A 30 to 90 day look-back shows whether the behavior is new or "
            "routine, and recording the window lets the next analyst judge "
            "how thorough the check was.",
      ),
      QuizQuestion(
        question: "An alert shows an attacker running commands that list domain "
                  "administrators. Using ATT&CK, what should you do next?",
        options: [
          "Treat the alert as final, since discovery commands are always "
          "harmless and are never followed by anything else",
          "Label it as Discovery and look backward for initial access and"
          " credentials, and forward for lateral movement",
          "Record the label T1486 Data Encrypted for Impact, since all "
          "discovery activity eventually ends in ransomware",
          "Close the ticket once the commands stop, because an attacker "
          "who finished discovery has completed their work",
        ],
        correctIndex: 1,
        explanation:
            "Discovery means the attacker is already inside. Reasoning "
            "along the chain tells you to find how they got in and what "
            "they have done or will do next.",
      ),
      QuizQuestion(
        question: "Why is it a mistake to treat a technique match in ATT&CK as "
                  "proof of an attack?",
        options: [
          "Because many techniques, such as PowerShell or remote desktop,"
          " are also normal administration and need context",
          "Because attackers never use the techniques that are listed, so"
          " any match is more likely to be a false alarm",
          "Because ATT&CK only lists techniques that were used in "
          "historic attacks and no longer matter to defenders today",
          "Because the SIEM does not support technique identifiers, so "
          "they cannot be used inside alerts or tickets at all",
        ],
        correctIndex: 0,
        explanation:
            "A technique tells you what to look for, not that the behavior "
            "is malicious. Confirm with the asset, the user, the time and "
            "the history.",
      ),
      QuizQuestion(
        question: "What does mapping your detection rules onto the ATT&CK matrix "
                  "help you discover?",
        options: [
          "Which vendors are the cheapest, so that the next SIEM contract"
          " can be negotiated with a better price",
          "Which attackers have the most members, so that those groups "
          "can be reported to the police straight away",
          "Which techniques your current rules would not notice, so you "
          "can prioritize detections for your own risks",
          "Which analysts on the team have written the largest number of "
          "rules, so that they can be recognized for it",
        ],
        correctIndex: 2,
        explanation:
            "A coverage map shows blank areas. You then choose which gaps "
            "matter most for your organization and crown jewels instead of "
            "trying to cover everything.",
      ),
    ],
  ),
];
