// Incident Response & Containment: a theory module of "The Pulse (SOC Blue Team)". Same
// Lesson/LessonSection/QuizQuestion model as every other module.

import 'lesson_model.dart';

final List<Lesson> socIrLessons = [
  Lesson(
    title: "The Incident Response Lifecycle",
    estimatedMinutes: 20,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Why a Lifecycle Matters",
        body:
            "An alert is a question. An incident is the answer when that "
            "question turns out to be yes: something happened that harms, "
            "or could harm, the confidentiality, integrity or availability "
            "of your organization's systems or data. Incident response (IR)"
            " is the discipline of handling that moment so the damage stays"
            " small and the organization learns something.\n"
            "\n"
            "Most people picture IR as the dramatic part, the frantic hours"
            " when the network is on fire. In practice, the quality of a "
            "response is decided long before and long after that moment. A "
            "team that has agreed on who decides what, has working logs and"
            " has rehearsed its playbooks will handle a bad day calmly. A "
            "team that improvises will argue about permissions while the "
            "attacker keeps moving.\n"
            "\n"
            "The lifecycle gives everyone a shared map. It tells you where "
            "you are, what comes next and what question you should be "
            "asking right now. The version most often taught follows the "
            "NIST approach (Special Publication 800-61, check the current "
            "revision at https://csrc.nist.gov): preparation, detection and"
            " analysis, containment, eradication and recovery, and "
            "post-incident activity. Many teams split eradication and "
            "recovery into two phases, which is how this chapter treats "
            "them.",
      ),
      LessonSection(
        heading: "The Phases at a Glance",
        body:
            "Think of the phases as a loop rather than a straight line. "
            "What you learn in the last phase feeds the first one, and you "
            "will often step backward during a real incident.",
        bullets: [
          "Preparation: policies, contacts, tooling, logging, playbooks "
          "and training in place before anything happens.",
          "Detection and analysis: noticing something is wrong, "
          "confirming it is real, and working out what it is and how far "
          "it reaches.",
          "Containment: stopping the spread and limiting damage, while "
          "keeping the evidence you will need.",
          "Eradication: removing the attacker's access and tools, and "
          "closing the way in.",
          "Recovery: returning systems to normal operation safely, with "
          "extra monitoring.",
          "Lessons learned: reviewing what happened, what worked and what"
          " to change.",
        ],
      ),
      LessonSection(
        heading: "Preparation: The Work Nobody Sees",
        body:
            "Preparation is the phase analysts underrate because it feels "
            "like paperwork. It is where most of the outcome is decided. "
            "When an incident starts, you do not want to be asking who has "
            "authority to isolate a server or where the backups live.\n"
            "\n"
            "Preparation covers people, process and technology. On the "
            "people side, that means an on-call roster, named incident "
            "roles and a contact list that includes IT, legal, "
            "communications, HR, executives and external parties such as "
            "your internet provider, cyber insurer or retained responders. "
            "On the process side, it means severity definitions, escalation"
            " rules and playbooks for common cases. On the technology side,"
            " it means the logs, endpoint tools and access you need to "
            "investigate.",
        bullets: [
          "Asset and owner lists, so you know who to call about a given "
          "server.",
          "Centralized logging with enough retention to look back weeks, "
          "not hours.",
          "Time synchronization (NTP) across systems, so timelines line "
          "up.",
          "Known-good baselines and golden images for rebuilding systems.",
          "Offline or immutable backups that are tested by actually "
          "restoring from them.",
          "A secure out-of-band channel for the response team, in case "
          "email or chat is compromised.",
          "Tabletop exercises, where the team talks through a scenario "
          "and finds the gaps.",
        ],
      ),
      LessonSection(
        heading: "Detection and Analysis",
        body:
            "This is the phase you will live in as an L1 or L2 analyst. "
            "Detection means a signal reaches you: a SIEM alert, an "
            "endpoint detection tool, a user report, a notice from a "
            "partner or a call from law enforcement. Analysis means "
            "deciding whether the signal is real, what it is and how big it"
            " is.\n"
            "\n"
            "Two questions drive this phase. First, is this a true "
            "positive, a false positive or something benign but worth "
            "tuning? Second, if it is real, what is the scope: how many "
            "hosts, accounts and data stores, and for how long has the "
            "attacker been there? Scope is the hard part. An alert shows "
            "you one host; the incident may involve fifty.\n"
            "\n"
            "Typical data sources include EDR telemetry, authentication "
            "logs from your identity provider and domain controllers, DNS "
            "and proxy logs, firewall and VPN logs, email gateway logs, "
            "cloud audit logs and, where available, network sensors such as"
            " Zeek or Suricata. Write down what you checked and what you "
            "found as you go, with timestamps. Your notes become the "
            "timeline later.",
      ),
      LessonSection(
        heading: "Containment, Eradication and Recovery",
        body:
            "Containment stops things from getting worse. Short-term "
            "containment is fast and blunt: isolate a host, disable an "
            "account, block a domain. Long-term containment is more "
            "careful, such as moving a system to a clean network segment "
            "while you prepare a rebuild. The next lesson in this chapter "
            "is about how to choose, because containment always has a "
            "business cost.\n"
            "\n"
            "Eradication removes what the attacker left behind: malware, "
            "persistence mechanisms, rogue accounts, stolen credentials "
            "that are still valid, and the vulnerability or "
            "misconfiguration that let them in. Eradicating before you "
            "understand the scope is a classic failure. If you clean ten "
            "hosts and miss the eleventh, the attacker simply returns.\n"
            "\n"
            "Recovery brings systems back into service. That might mean "
            "restoring from backup, rebuilding from a golden image, "
            "resetting credentials or re-enabling accounts. Recovery is not"
            " finished when the service is up. It is finished when you have"
            " watched the systems closely for long enough to be confident "
            "the attacker is gone.",
      ),
      LessonSection(
        heading: "Lessons Learned",
        body:
            "After the incident is closed, the team reviews it. The aim is "
            "to improve the system, not to find someone to blame. A good "
            "review produces a timeline, an honest account of what worked "
            "and failed, and a short list of owned, dated actions. The "
            "final lesson of this chapter covers how to run one and how to "
            "write a useful root cause analysis (RCA).",
      ),
      LessonSection(
        heading: "Walkthrough: One Alert Moves Through the Lifecycle",
        isTemplate: true,
        body:
            "FICTIONAL CASE: SUSPICIOUS LOGIN, THEN A LOT MORE\n"
            "\n"
            "PREPARATION (already done)\n"
            "- On-call roster, severity table and account-compromise "
            "playbook exist.\n"
            "- Identity provider sign-in logs kept 90 days.\n"
            "\n"
            "DETECTION AND ANALYSIS\n"
            "09:12 Alert: impossible travel for user a.mehta@corp.example\n"
            "09:20 Analyst checks sign-ins: success from 198.51.100.24 (new"
            " country), MFA satisfied after 9 prompts\n"
            "09:31 Mailbox audit: new inbox rule forwarding to an external "
            "address\n"
            "09:40 Scope check: same source IP signed in to 2 other "
            "accounts\n"
            "ASSESSMENT: confirmed account compromise, 3 accounts. Severity"
            " raised.\n"
            "\n"
            "CONTAINMENT\n"
            "09:48 Sessions revoked and passwords reset for all 3 accounts\n"
            "09:52 Source IP blocked at proxy; forwarding rule exported as "
            "evidence, then removed\n"
            "\n"
            "ERADICATION\n"
            "10:30 Checked for other persistence: app consents, extra MFA "
            "devices (one found, removed)\n"
            "\n"
            "RECOVERY\n"
            "11:15 Users re-enrolled in MFA; enhanced alerting on the 3 "
            "accounts for 30 days\n"
            "\n"
            "LESSONS LEARNED\n"
            "MFA fatigue allowed the login. Action: move to number "
            "matching, owner IT Identity, due in 30 days.",
      ),
      LessonSection(
        heading: "Common Mistakes to Avoid",
        body:
            "Most early-career errors in IR are about order and discipline,"
            " not technical skill.",
        bullets: [
          "Jumping to eradication before scoping, which tips off the "
          "attacker and leaves footholds behind.",
          "Rebooting or reimaging a host before capturing what you need, "
          "destroying volatile evidence.",
          "Working in your head instead of in notes, so nobody can "
          "reconstruct what you did and when.",
          "Treating the first alert as the whole incident.",
          "Communicating over a channel the attacker may be reading.",
          "Skipping lessons learned because the service is back up and "
          "everyone is tired.",
        ],
      ),
      LessonSection(
        heading: "What to Check First on Any New Incident",
        isTemplate: true,
        body:
            "CHECKLIST: FIRST 15 MINUTES\n"
            "\n"
            "[ ] Write down the time you started and who else is involved\n"
            "[ ] What is the signal and where did it come from?\n"
            "[ ] Is it real? Confirm with a second data source\n"
            "[ ] What is affected (host, account, data) and how important "
            "is it?\n"
            "[ ] Is the activity still happening right now?\n"
            "[ ] Does it match a playbook? Open it\n"
            "[ ] Assign an initial severity and say it out loud\n"
            "[ ] Tell the right person (lead, on-call manager) before you "
            "take disruptive action\n"
            "[ ] Start an incident note with a running timeline\n"
            "[ ] Preserve volatile evidence before changing anything",
      ),
      LessonSection(
        heading: "ATT&CK and the Lifecycle",
        body:
            "MITRE ATT&CK (https://attack.mitre.org) describes what "
            "attackers do, organized by tactic. It does not replace the "
            "lifecycle, but it helps in the analysis phase. For example, an"
            " email-borne intrusion often begins with Phishing (T1566, "
            "Initial Access), then uses Valid Accounts (T1078, which spans "
            "several tactics including Initial Access and Persistence). "
            "Mapping what you see to tactics helps you ask what the "
            "attacker is likely to do next, which is exactly what you need "
            "to scope an incident and choose containment.",
      ),
    ],
  ),
  Lesson(
    title: "Severity, Escalation and Communication",
    estimatedMinutes: 20,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Why Severity Exists",
        body:
            "Not every incident deserves the same response. A single adware"
            " detection on a laptop and a domain controller compromise are "
            "both incidents, but they do not need the same people, the same"
            " speed or the same level of attention. Severity is the "
            "shorthand that tells everyone how fast to move and who needs "
            "to be involved.\n"
            "\n"
            "Without a shared severity scale, two problems appear. Either "
            "everything becomes urgent and people burn out, or a serious "
            "event is treated as routine because nobody had a way to say it"
            " was not. A good scale is simple enough to apply in the first "
            "few minutes, when you know little, and flexible enough to "
            "change as you learn more.",
      ),
      LessonSection(
        heading: "What Drives Severity",
        body:
            "Teams define severity in different ways, but most scales weigh"
            " the same few factors. Learn to ask them in this order.",
        bullets: [
          "Impact: what is lost or at risk? Data exposure, service "
          "outage, financial loss, safety concerns.",
          "Criticality of the asset: a lab machine and a payment server "
          "are not equal.",
          "Sensitivity of the data: personal data, health or payment "
          "information, trade secrets, credentials.",
          "Scope: one host, one department, or many.",
          "Attacker progress: only attempted, successful initial access, "
          "or already moving laterally or exfiltrating.",
          "Activity status: contained and historic, or ongoing right now.",
          "Regulatory or contractual exposure: whether notification "
          "duties might apply (covered later in this lesson).",
        ],
      ),
      LessonSection(
        heading: "A Sample Severity Table",
        isTemplate: true,
        body:
            "SAMPLE SEVERITY TABLE (fictional; use your own organization's)\n"
            "\n"
            "P4 LOW\n"
            "  Example: blocked commodity malware, no execution\n"
            "  Response: next business day, ticket only\n"
            "\n"
            "P3 MEDIUM\n"
            "  Example: single endpoint infection, contained by EDR, no "
            "sign of spread\n"
            "  Response: within 4 hours, SOC handles, notify IT owner\n"
            "\n"
            "P2 HIGH\n"
            "  Example: confirmed compromised user account, or malware on a"
            " server\n"
            "  Response: immediate, SOC lead notified, IT and security "
            "manager engaged\n"
            "\n"
            "P1 CRITICAL\n"
            "  Example: active ransomware, domain admin compromise, "
            "confirmed data theft\n"
            "  Response: all hands, incident commander named, executive and"
            " legal notified\n"
            "\n"
            "RULE: severity is a working assumption. Raise it quickly on "
            "new evidence; lower it only with evidence and a note "
            "explaining why.",
      ),
      LessonSection(
        heading: "Escalation: Knowing When and How",
        body:
            "Escalation means passing an incident, or a decision, to "
            "someone with more authority, skill or context. New analysts "
            "often hold back because they fear looking inexperienced or "
            "bothering the lead. That instinct is wrong in IR. Escalating "
            "early and being told it was fine costs a few minutes. "
            "Escalating late can cost the organization much more.\n"
            "\n"
            "There are two kinds of escalation. Functional escalation hands"
            " the case to someone with deeper skills, such as a malware "
            "analyst, a forensic examiner or a cloud specialist. "
            "Hierarchical escalation brings in people with authority: the "
            "SOC lead, the security manager, the CISO and, when needed, "
            "legal or executives. Most real escalations are both.",
        bullets: [
          "Escalate when severity reaches the threshold in your table, "
          "without waiting to be sure.",
          "Escalate when you need a decision you are not authorized to "
          "make, such as isolating a production server.",
          "Escalate when you are stuck for longer than your team's agreed"
          " time limit.",
          "Escalate when the incident involves executives, legal "
          "exposure, law enforcement or the press.",
          "Escalate when you suspect an insider, because that changes who"
          " may safely know about it.",
        ],
      ),
      LessonSection(
        heading: "Writing an Escalation Message",
        isTemplate: true,
        body:
            "A good escalation message lets the receiver act without asking"
            " you five questions. Put the conclusion first, then the facts,"
            " then what you need.\n"
            "\n"
            "SAMPLE ESCALATION (chat or phone script)\n"
            "\n"
            "\"P2 escalation. Confirmed compromise of three user accounts, "
            "one belongs to a Finance approver. Attacker signed in from "
            "198.51.100.24 and created a mail forwarding rule. Sessions are"
            " revoked and passwords reset. I have not yet checked for "
            "access to the payment system. I need a decision from you on "
            "whether to notify Finance leadership, and I need IT Identity "
            "to check for added MFA devices. Next update from me at 10:30.\"\n"
            "\n"
            "Notice the structure: severity, what happened, what is already"
            " done, what is unknown, what you need, and when you will "
            "report again.",
      ),
      LessonSection(
        heading: "Who Needs to Know, and What They Need",
        body:
            "Different audiences need different information. Sending "
            "everyone everything wastes their time and risks leaking "
            "sensitive details.",
        bullets: [
          "Incident lead or commander: full technical picture, decisions "
          "needed, risks.",
          "IT and system owners: which assets are affected, what actions "
          "will be taken and when, and what they must do or not do.",
          "Management and executives: business impact, customer impact, "
          "expected duration, decisions required. Skip jargon.",
          "Legal and privacy teams: what data may be involved, whether "
          "personal information was accessed, and exact timestamps.",
          "Communications or public relations: what can be said publicly "
          "and what is still unknown.",
          "Affected users: plain instructions, such as change your "
          "password or do not open this file.",
        ],
      ),
      LessonSection(
        heading: "Status Updates That People Can Use",
        isTemplate: true,
        body:
            "During a long incident, silence creates anxiety and rumor. Set"
            " a rhythm for updates, for example every hour for a P1, and "
            "keep to it even when the update is that nothing has changed. "
            "Each update should be short and follow the same pattern so "
            "readers learn where to find what they need.\n"
            "\n"
            "SAMPLE STATUS UPDATE\n"
            "\n"
            "INCIDENT: Account compromise, 3 users   SEVERITY: P2   UPDATE "
            "3 of N\n"
            "TIME: 10:30\n"
            "STATUS: Contained. Eradication in progress.\n"
            "WHAT WE KNOW: Three accounts used from one foreign IP between "
            "08:55 and 09:48. One forwarding rule created and removed. No "
            "evidence yet of access to payment systems.\n"
            "WHAT WE DO NOT KNOW: Whether mail was read before the rule was"
            " removed.\n"
            "ACTIONS TAKEN: Sessions revoked, passwords reset, source IP "
            "blocked.\n"
            "NEXT STEPS: Review mailbox audit logs for the three accounts; "
            "check for added MFA devices.\n"
            "NEEDS: Confirmation from Finance on any unusual payment "
            "requests this week.\n"
            "NEXT UPDATE: 11:30",
      ),
      LessonSection(
        heading: "Legal and Regulatory Awareness: Know When to Ask",
        body:
            "Some incidents trigger legal duties. Depending on where your "
            "organization operates and what data is involved, laws, "
            "regulations and contracts may require notifying regulators, "
            "customers or business partners, sometimes within strict "
            "deadlines. Examples people commonly hear of include data "
            "protection laws such as the GDPR in Europe, breach "
            "notification laws in many US states, sector rules for health "
            "and payments, and customer contracts that name notification "
            "windows.\n"
            "\n"
            "This is awareness, not legal advice. A SOC analyst does not "
            "decide whether a notification is required, and you should "
            "never promise a customer or regulator anything. Your job is to"
            " recognize the signs early and hand them to the people who "
            "decide. If an incident may involve personal data, payment card"
            " data, health records or a regulated customer, tell your lead "
            "and legal or privacy team promptly, and record exact times, "
            "because many deadlines run from the moment of awareness.",
        bullets: [
          "Do record when the organization first became aware, and who "
          "knew what.",
          "Do record what data types and how many records may be "
          "involved, as facts and estimates clearly labeled.",
          "Do not speculate in writing about fault, liability or whether "
          "a breach occurred; stick to observed facts.",
          "Do not contact regulators, customers or the press yourself; "
          "route through the people designated for it.",
          "Do ask your legal contact early whether communications about "
          "the incident should go through them.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes in Escalation and Communication",
        body:
            "These errors show up again and again, even among experienced "
            "staff.",
        bullets: [
          "Waiting for certainty before escalating.",
          "Understating severity to avoid alarm, or overstating it to get"
          " attention.",
          "Mixing facts and guesses in the same sentence. Label each one:"
          " confirmed, likely, unknown.",
          "Discussing the incident in a public channel or over "
          "compromised email.",
          "Forgetting to say what you need from the reader.",
          "Letting updates lapse. Missing an update on a P1 makes people "
          "assume the worst.",
        ],
      ),
      LessonSection(
        heading: "Habits for Clear Incident Communication",
        isTemplate: true,
        body:
            "CHECKLIST: BEFORE YOU SEND AN UPDATE\n"
            "\n"
            "[ ] Does the first line give status and severity?\n"
            "[ ] Are confirmed facts separated from assumptions?\n"
            "[ ] Did I give times in one consistent time zone (UTC is "
            "common)?\n"
            "[ ] Did I say what has been done and what is next?\n"
            "[ ] Did I say what I need from the reader?\n"
            "[ ] Did I give the time of the next update?\n"
            "[ ] Is this the right audience and the right channel?\n"
            "[ ] Did I leave out details this audience should not have?",
      ),
    ],
  ),
  Lesson(
    title: "Containment Decisions and Business Impact",
    estimatedMinutes: 22,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Containment Is a Trade-Off",
        body:
            "Containment sounds simple: stop the attacker. In practice "
            "every containment action has a cost, and the cost lands on "
            "someone. Isolating a server stops a worm and also stops the "
            "customers who use that server. Disabling an executive's "
            "account stops the intruder and also stops the executive. "
            "Blocking a whole network range stops the command-and-control "
            "traffic and might also block a legitimate partner.\n"
            "\n"
            "The analyst's job is not to pick the most aggressive action or"
            " the most cautious one. It is to pick the action that best "
            "limits harm given what you know, to say clearly what it will "
            "cost, and to get the right person to approve it when the cost "
            "is significant. Good containment is fast where the risk is "
            "high and the cost is low, and deliberate where the cost is "
            "high.",
      ),
      LessonSection(
        heading: "Short-Term and Long-Term Containment",
        body:
            "It helps to separate two stages.",
        bullets: [
          "Short-term containment: quick actions that stop the immediate "
          "spread. Examples: isolate the host with your EDR tool, disable"
          " or lock an account, revoke active sessions and tokens, block "
          "an IP address or domain, pull a network cable or disable a "
          "switch port when no tool works.",
          "Long-term containment: steadier measures that keep the "
          "situation stable while eradication and recovery are prepared. "
          "Examples: move affected systems into a quarantine VLAN, apply "
          "a temporary firewall rule, rotate shared secrets, add enhanced"
          " monitoring, or stand up a clean replacement system alongside "
          "the compromised one.",
          "Evidence stays in mind at both stages. Prefer actions that "
          "keep a system powered on and intact, such as network "
          "isolation, over actions that destroy memory, such as a "
          "power-off.",
        ],
      ),
      LessonSection(
        heading: "Common Containment Actions and Their Costs",
        body:
            "Know the usual options, what each stops and what each breaks. "
            "This is the knowledge that lets you give a decision-maker a "
            "useful answer in one minute.",
        bullets: [
          "Network isolation of an endpoint (EDR isolate): stops spread "
          "and command-and-control; keeps the machine on for forensics; "
          "the user loses all connectivity, though most tools keep a "
          "channel to the security console.",
          "Account disable or password reset: stops use of stolen "
          "credentials; does not remove existing sessions or tokens "
          "unless you revoke them too; the user is locked out.",
          "Session and token revocation: ends active logins, including "
          "those that survive a password change; users must sign in "
          "again.",
          "Blocking an IP, domain or URL at proxy, DNS or firewall: cuts "
          "off attacker infrastructure; attackers can switch quickly, and"
          " shared hosting can cause false blocks.",
          "Disabling a service or port, such as exposed RDP: removes a "
          "path in; may break legitimate remote work.",
          "Isolating a network segment: contains spread across many "
          "hosts; can take down whole business functions.",
          "Email purge or mail-flow rule: removes a malicious message "
          "from inboxes; users may have already read or clicked.",
          "Shutting down a host: stops processes but destroys volatile "
          "evidence, so use only when isolation is not possible and the "
          "risk is severe.",
        ],
      ),
      LessonSection(
        heading: "Questions That Drive the Decision",
        body:
            "Before you act, run through a short set of questions. You will"
            " rarely have every answer, but asking them keeps you honest.",
        bullets: [
          "How likely is it that the attacker is still active, and how "
          "fast could harm spread?",
          "What is the worst realistic outcome if I wait 30 minutes? If I"
          " wait 3 hours?",
          "What does this system do for the business, and who depends on "
          "it?",
          "Is there a less disruptive action that gets most of the "
          "benefit?",
          "Will this action tip off the attacker, and does that matter at"
          " this stage?",
          "Can I undo it quickly if I am wrong?",
          "Who has authority to approve it, and have I told them?",
        ],
      ),
      LessonSection(
        heading: "Walkthrough: Deciding Whether to Isolate a Server",
        isTemplate: true,
        body:
            "FICTIONAL SCENARIO\n"
            "At 14:05 EDR flags credential dumping (T1003, OS Credential "
            "Dumping, Credential Access) on FILESRV02, a file server used "
            "by the Finance department. Quarter-end close is tomorrow.\n"
            "\n"
            "FACTS\n"
            "- The process is a renamed tool running as a domain account "
            "svc-backup\n"
            "- The same account authenticated to 4 other servers in the "
            "last hour\n"
            "- No outbound transfer seen yet\n"
            "\n"
            "OPTIONS CONSIDERED\n"
            "A. Isolate FILESRV02 now.\n"
            "   Stops: further dumping from this host, lateral movement "
            "from it.\n"
            "   Costs: Finance loses file access, close process delayed.\n"
            "   Reversible: yes, in minutes.\n"
            "B. Disable svc-backup only.\n"
            "   Stops: use of this account everywhere.\n"
            "   Costs: nightly backups fail until fixed.\n"
            "   Does not stop: tools already on the server.\n"
            "C. Wait and watch for 2 hours.\n"
            "   Risk: credentials for a privileged account may already be "
            "stolen.\n"
            "\n"
            "DECISION\n"
            "Do A and B now. Notify Finance manager and IT owner before "
            "acting (5 minutes). Provide a temporary read-only file share "
            "from a backup copy so close work can continue. Reason: a "
            "privileged service account in use on 5 servers means the "
            "potential harm is far larger than a few hours of file access.\n"
            "\n"
            "RECORD: decision time, who approved, options considered, "
            "expected cost.",
      ),
      LessonSection(
        heading: "Containing Without Breaking the Investigation",
        body:
            "Containment and investigation pull in opposite directions. "
            "Containment wants action now. Investigation wants the attacker"
            " to keep acting while you watch and learn. In most SOC "
            "situations, protection wins: you do not let an attacker run "
            "free to improve your understanding. But you can often do both "
            "by choosing carefully.\n"
            "\n"
            "If you isolate at the network level, the machine stays alive, "
            "memory remains available and you can still collect evidence. "
            "If you disable an account, export its recent activity first. "
            "If you block a command-and-control domain, note every host "
            "that tried to reach it, because that list is your scope. If "
            "you must remove a malicious email rule or scheduled task, copy"
            " it out as evidence first.\n"
            "\n"
            "Sometimes a deliberate pause is the right call: a short, "
            "approved delay while a senior responder collects memory from a"
            " critical server, or while you map every compromised account "
            "so you can reset them all at once. Resetting accounts one at a"
            " time as you find them teaches the attacker what you know. "
            "That decision belongs to the incident lead, not to you alone, "
            "and it should be written down.",
      ),
      LessonSection(
        heading: "Business Impact: Speaking the Language of the Decision-Maker",
        isTemplate: true,
        body:
            "When you need approval for a disruptive action, describe the "
            "situation in terms the approver can weigh. Avoid saying only "
            "that a server is compromised. Instead say what the risk is, "
            "what the action costs and what you recommend.\n"
            "\n"
            "SAMPLE REQUEST FOR APPROVAL\n"
            "\n"
            "\"Recommending isolation of FILESRV02 now. A service account "
            "with access to five servers is being used to steal credentials"
            " from it. If we wait, the attacker may reach the domain "
            "controller. Cost: Finance loses the file share for roughly two"
            " hours; we will provide a read-only copy so close work "
            "continues. Risk of waiting: possible domain-wide compromise, "
            "which would affect every system. I need your approval in the "
            "next five minutes.\"\n"
            "\n"
            "That message states the recommendation first, explains the "
            "risk, quantifies the cost, offers mitigation and sets a "
            "deadline.",
      ),
      LessonSection(
        heading: "Data Sources for Containment Decisions",
        body:
            "Good decisions rest on evidence about scope and attacker "
            "activity. Typical sources include:",
        bullets: [
          "EDR process tree and network connections for the affected "
          "host.",
          "Authentication logs (identity provider, domain controllers) to"
          " see where an account has been used.",
          "VPN, proxy and firewall logs for traffic to suspect addresses.",
          "DNS logs to find every host that resolved a malicious domain.",
          "Asset inventory and business owner records, to understand what"
          " a system does.",
          "Change calendar and maintenance windows, to avoid collisions "
          "or to explain odd activity.",
          "ATT&CK technique mapping, for example Remote Services: RDP "
          "(T1021.001, Lateral Movement) or Scheduled Task (T1053.005, "
          "which supports Persistence), to anticipate the attacker's next"
          " move.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes in Containment",
        body:
            "Most mistakes fall into two groups: acting too hastily and "
            "acting too timidly.",
        bullets: [
          "Isolating or shutting down before checking whether the host is"
          " a critical production system.",
          "Powering off a compromised machine and losing memory evidence.",
          "Resetting a password but leaving active sessions, tokens or "
          "app consents in place.",
          "Blocking one indicator and assuming the attacker is stopped; "
          "they often have several routes.",
          "Containing a single host without searching for the same "
          "activity elsewhere.",
          "Taking disruptive action without telling the owner, then being"
          " surprised by the outage report.",
          "Waiting for perfect information while the attacker keeps "
          "working.",
          "Failing to write down what you did and when, so no one can "
          "tell which changes were yours.",
        ],
      ),
      LessonSection(
        heading: "Containment Checklist",
        isTemplate: true,
        body:
            "CHECKLIST: BEFORE AND AFTER A CONTAINMENT ACTION\n"
            "\n"
            "BEFORE\n"
            "[ ] What am I trying to stop, specifically?\n"
            "[ ] What does this system or account do for the business?\n"
            "[ ] Is there a less disruptive option?\n"
            "[ ] Who must approve? Have I asked?\n"
            "[ ] Is volatile evidence captured or the action "
            "non-destructive?\n"
            "[ ] Can I reverse this, and how?\n"
            "\n"
            "AFTER\n"
            "[ ] Did it work? Verify with logs, not assumption\n"
            "[ ] Notify owners and users who are affected\n"
            "[ ] Look for the same activity elsewhere\n"
            "[ ] Record time, action, approver and result\n"
            "[ ] Set a reminder to review and lift temporary restrictions",
      ),
    ],
  ),
  Lesson(
    title: "Evidence Preservation and Chain of Custody",
    estimatedMinutes: 22,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Why Evidence Handling Matters",
        body:
            "Evidence serves three purposes in an incident. It tells you "
            "what happened, so you can scope and fix it. It supports "
            "decisions, such as whether to notify customers. And it may one"
            " day be needed outside the SOC, in an HR case, an insurance "
            "claim, a regulator inquiry or a criminal investigation. You "
            "will often not know at the start which of these will apply.\n"
            "\n"
            "The practical consequence is that you handle evidence as "
            "though it might matter later. That does not mean treating "
            "every alert like a crime scene. It means building a few habits"
            " that cost little when you do them early and cost a great deal"
            " when you skip them: capture before you change, record what "
            "you did, protect what you collected and be able to show it has"
            " not been altered.\n"
            "\n"
            "This lesson is awareness for SOC analysts, not a forensics "
            "course. If an incident may lead to legal action, ask your lead"
            " whether a trained forensic examiner or counsel should direct "
            "collection. Do not provide legal advice and do not promise "
            "that evidence will be admissible; that depends on laws and "
            "decisions beyond the SOC.",
      ),
      LessonSection(
        heading: "The Order of Volatility",
        body:
            "Some evidence disappears fast. When you collect, start with "
            "the most fragile and work toward the most durable. This "
            "principle is called the order of volatility.",
        bullets: [
          "CPU registers and cache: effectively unreachable for a SOC "
          "analyst.",
          "Memory (RAM): running processes, network connections, loaded "
          "modules, decrypted data, sometimes encryption keys. Lost on "
          "power-off or reboot.",
          "Network state: active connections, ARP and routing tables, "
          "logged-in sessions.",
          "Running processes and open files.",
          "Disk contents: files, registry, event logs, browser data, "
          "scheduled tasks. Persist across reboot but can be overwritten.",
          "Remote logging and monitoring data: SIEM, proxy and cloud "
          "logs. Often kept for a limited retention period.",
          "Backups and archives: most durable, but easy to overlook.",
        ],
      ),
      LessonSection(
        heading: "What to Preserve and from Where",
        body:
            "Different incident types point to different evidence. Think in"
            " categories.",
        bullets: [
          "Endpoint: a memory capture, a disk image or a targeted "
          "collection of key artifacts (event logs, prefetch, registry "
          "hives, browser history, scheduled tasks, startup items), plus "
          "a list of running processes and connections.",
          "Network: firewall, proxy, DNS and VPN logs; packet captures if"
          " they exist; NetFlow-style records.",
          "Identity and cloud: sign-in logs, audit logs, mailbox audit "
          "logs, app consent records, token and session lists, "
          "configuration snapshots.",
          "Email: the original message with full headers (an .eml file), "
          "not a screenshot, and a copy of attachments in a safe "
          "container.",
          "Malware samples: the file, its hashes and the context where it"
          " was found, stored in a locked, clearly labeled archive so "
          "nobody opens it by accident.",
          "Human accounts: a user's description of what they saw, with "
          "time, written down while it is fresh.",
        ],
      ),
      LessonSection(
        heading: "Tools for Collection",
        body:
            "Tool choice depends on your organization. Think in categories "
            "first, then in the specific products you have approved. A few "
            "well-known open-source and free examples are listed below; "
            "check current availability and licensing before relying on any"
            " of them.",
        bullets: [
          "Live response and endpoint collection: Velociraptor, osquery, "
          "and the collection features built into most EDR platforms.",
          "Memory capture: tools from the open-source community and from "
          "EDR vendors; your forensic team will usually name the approved"
          " one.",
          "Disk imaging: write-blocking hardware or software and imaging "
          "utilities that produce a verifiable hash.",
          "Network capture and analysis: Wireshark, Zeek, Suricata.",
          "Timeline and log analysis: Sysmon logs where deployed, SIEM "
          "queries, and spreadsheets for sorting events.",
          "Decoding and quick transformation: CyberChef.",
          "Pattern matching on files and memory: YARA rules.",
        ],
      ),
      LessonSection(
        heading: "Hashing and Integrity",
        body:
            "To show that evidence has not changed, you calculate a "
            "cryptographic hash, a fixed-length fingerprint of the data, as"
            " soon as you collect it. Common algorithms are SHA-256 "
            "(preferred) and, historically, MD5 and SHA-1. If anyone later "
            "recalculates the hash and gets the same value, the content is "
            "identical. If even one bit changed, the hash is completely "
            "different.\n"
            "\n"
            "Hash the original and the copy, record both and confirm they "
            "match. When you work, work on a copy and keep the original "
            "untouched in storage. When you copy a file for sharing, hash "
            "it again so the recipient can verify what they received.",
      ),
      LessonSection(
        heading: "Chain of Custody",
        body:
            "Chain of custody is the written record of who held a piece of "
            "evidence, from the moment it was collected until it is no "
            "longer needed. Each time it changes hands, is stored, is moved"
            " or is analyzed, the record is updated. The goal is to be able"
            " to answer, for any time between collection and now: where was"
            " it, who had access and what was done to it?",
        bullets: [
          "Unique evidence ID for each item.",
          "Description: what it is, source system, how it was collected.",
          "Date, time and time zone of collection, and who collected it.",
          "Hash values at collection.",
          "Storage location, with access controls and a log of who "
          "accessed it.",
          "Every transfer, with date, time, from, to and reason.",
          "Final disposition: retained, returned or destroyed, with "
          "approval.",
        ],
      ),
      LessonSection(
        heading: "Sample Chain of Custody Form",
        isTemplate: true,
        body:
            "SAMPLE CHAIN OF CUSTODY RECORD (fictional)\n"
            "\n"
            "EVIDENCE ID: IR-2026-014-E03\n"
            "CASE: IR-2026-014, suspected credential theft on FILESRV02\n"
            "DESCRIPTION: Memory capture, FILESRV02 (192.0.2.40), 64 GB RAM\n"
            "COLLECTED BY: Priya Nair, SOC analyst\n"
            "COLLECTED: 2026-10-09 14:22 UTC, via EDR live response\n"
            "SHA-256: 4be1...c09a [shortened]\n"
            "STORED: evidence share ir-store.example/IR-2026-014 "
            "(read-only, access logged)\n"
            "\n"
            "CUSTODY LOG\n"
            "2026-10-09 14:22  Collected      Priya Nair       from host to"
            " evidence share\n"
            "2026-10-09 14:40  Hash verified  Priya Nair       copy matches"
            " original\n"
            "2026-10-09 16:05  Transferred    Priya Nair to Marcus Webb "
            "(forensics), for analysis\n"
            "2026-10-09 16:07  Hash verified  Marcus Webb      matches\n"
            "2026-10-10 09:30  Analyzed       Marcus Webb      working copy"
            " only; original untouched\n"
            "\n"
            "NOTES: Host isolated at 14:12, before capture, via EDR network"
            " isolation. Host was not rebooted.",
      ),
      LessonSection(
        heading: "Walkthrough: Preserving Evidence During a Live Incident",
        isTemplate: true,
        body:
            "STEP-BY-STEP: SUSPECTED MALWARE ON AN ENDPOINT (fictional "
            "hostname WS-0417)\n"
            "\n"
            "1. Do not power off or reboot. Note the current time and the "
            "user's description.\n"
            "2. Isolate from the network using EDR, keeping the host "
            "powered on.\n"
            "3. Record the basics: hostname, IP, logged-in user, OS "
            "version, uptime.\n"
            "4. Capture volatile data first: memory image if approved, "
            "process list with command lines, network connections, "
            "logged-in sessions.\n"
            "5. Collect key disk artifacts or a full image as your "
            "procedure requires.\n"
            "6. Hash everything and record the values in your evidence log.\n"
            "7. Copy to the evidence store, set read-only, log the "
            "transfer.\n"
            "8. Only now begin cleaning or reimaging, if the incident lead "
            "approves.\n"
            "9. Record every step, with timestamps, as you go.\n"
            "\n"
            "IF IN DOUBT: stop and ask your lead. Pausing to ask is cheaper"
            " than losing the evidence.",
      ),
      LessonSection(
        heading: "Common Mistakes with Evidence",
        body:
            "These mistakes are easy to make under pressure and hard to "
            "repair afterward.",
        bullets: [
          "Rebooting or powering off a host before capturing memory.",
          "Logging into a compromised machine with a privileged account "
          "and leaving credentials behind for an attacker.",
          "Running tools from the suspect machine's own disk, which "
          "alters it and may be tampered with.",
          "Copying files without recording hashes or times.",
          "Using screenshots as the only record of something that exists "
          "as a log or message.",
          "Forgetting log retention: logs overwritten before anyone "
          "exported them.",
          "Opening a malware sample on a normal workstation.",
          "Leaving evidence in a shared folder anyone can edit, or in "
          "personal storage or a personal cloud account.",
          "Sharing evidence over email or chat without protection, or "
          "with people who have no need to see it.",
          "Cleaning the host first and meaning to collect evidence "
          "afterward.",
        ],
      ),
      LessonSection(
        heading: "Evidence Handling Rules of Thumb",
        isTemplate: true,
        body:
            "CHECKLIST: EVIDENCE HABITS\n"
            "\n"
            "[ ] Capture before you change\n"
            "[ ] Most volatile first\n"
            "[ ] Work on copies, protect originals\n"
            "[ ] Hash at collection and after every copy\n"
            "[ ] Record who, what, when, where, how, and in what time zone\n"
            "[ ] Store in a restricted, logged location\n"
            "[ ] Label malware clearly and never open it on a normal "
            "machine\n"
            "[ ] Export time-limited logs early\n"
            "[ ] Ask your lead whether counsel or a forensic examiner "
            "should direct collection\n"
            "[ ] Do not guess about legal admissibility; ask the right "
            "people",
      ),
    ],
  ),
  Lesson(
    title: "Playbooks: Ransomware and Business Email Compromise",
    estimatedMinutes: 24,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "What a Playbook Is",
        body:
            "A playbook is a written, step-by-step guide for handling a "
            "specific type of incident. It does not replace judgment. It "
            "saves you from deciding everything from scratch under stress, "
            "makes sure the important steps are not forgotten and lets "
            "different analysts produce consistent work. Good playbooks "
            "name the trigger, the decisions, the owners, the evidence to "
            "collect and the points where you must escalate.\n"
            "\n"
            "This lesson walks through two playbooks that every SOC meets "
            "sooner or later: ransomware, where the damage is loud and "
            "fast, and business email compromise (BEC), where the damage is"
            " quiet and expensive. Treat them as general patterns. Your "
            "organization's playbooks will differ in details, tools and "
            "approvals.",
      ),
      LessonSection(
        heading: "Ransomware: How It Usually Unfolds",
        body:
            "Modern ransomware is rarely a single click that encrypts a "
            "laptop. It is usually a staged intrusion by an operator who "
            "spends hours or days inside the network before triggering "
            "encryption. Understanding the stages tells you where you can "
            "catch it.",
        bullets: [
          "Initial access: phishing (T1566, Initial Access), stolen or "
          "purchased credentials used on VPN or remote access (T1078 "
          "Valid Accounts), or an exposed vulnerable service.",
          "Discovery and credential theft: scanning the network, dumping "
          "credentials (T1003, Credential Access).",
          "Lateral movement: using remote services such as RDP "
          "(T1021.001, Lateral Movement) or administrative tools to reach"
          " more systems and ultimately the domain controller.",
          "Defense evasion: disabling security tools (T1562.001, Defense "
          "Evasion) and clearing logs (T1070.001, Defense Evasion).",
          "Data theft: copying data out before encryption (for example "
          "T1567, Exfiltration Over Web Service), so the victim can be "
          "pressured with threats of publication as well as encryption. "
          "This is often called double extortion.",
          "Impact: deleting backups or shadow copies (T1490, Inhibit "
          "System Recovery, Impact) and encrypting files (T1486, Data "
          "Encrypted for Impact, Impact).",
        ],
      ),
      LessonSection(
        heading: "Ransomware Playbook: The First Hour",
        isTemplate: true,
        body:
            "The first hour is about stopping encryption from spreading and"
            " getting the right people on the phone. Speed matters, but so "
            "does avoiding actions that destroy evidence or the chance of "
            "recovery.\n"
            "\n"
            "RANSOMWARE PLAYBOOK: FIRST HOUR (fictional example)\n"
            "\n"
            "TRIGGER: Ransom note on a host, mass file renames with a new "
            "extension, EDR ransomware detection, or users reporting files "
            "that will not open.\n"
            "\n"
            "1. Declare P1. Page the incident commander and security "
            "manager. Open a bridge on a secure out-of-band channel.\n"
            "2. Identify patient zero if possible: which host showed it "
            "first, and the time.\n"
            "3. Isolate affected hosts from the network with EDR. Do not "
            "power them off, so memory stays available. If EDR cannot reach"
            " them, disconnect the network cable or disable the switch "
            "port.\n"
            "4. Protect backups: confirm backup systems are isolated and "
            "their credentials are not in use elsewhere. Disconnect or lock"
            " the backup console if it looks reachable by the attacker.\n"
            "5. Disable accounts seen in the attack, and plan a wider "
            "credential reset, led by the incident commander.\n"
            "6. Block known indicators (domains, IPs, file hashes) at "
            "proxy, DNS and endpoint tools.\n"
            "7. Preserve evidence: ransom note, sample of an encrypted "
            "file, one or two representative encrypted and unencrypted "
            "files, memory from a still-running affected host, logs from "
            "the domain controller and VPN.\n"
            "8. Notify legal, privacy and communications per policy. Ask "
            "whether the cyber insurer and any retained responders must be "
            "contacted first.\n"
            "9. Start the timeline and the status update rhythm.\n"
            "\n"
            "NOT AN ANALYST DECISION: paying a ransom, contacting the "
            "attackers, or contacting law enforcement or regulators. Route "
            "all of these to the incident commander and management.",
      ),
      LessonSection(
        heading: "Ransomware: Scoping and Recovery Thinking",
        body:
            "While containment runs, scoping starts. You are looking for "
            "how far the attacker reached and whether data left the "
            "network. The questions are: which systems are encrypted, which"
            " are merely reachable, which accounts were used, and how did "
            "the attacker get in. Without answers, rebuilding exposes you "
            "to the same attacker.\n"
            "\n"
            "Recovery should be planned, not rushed. Restore from clean "
            "backups that predate the intrusion, which may be earlier than "
            "the encryption by days or weeks. Rebuild domain controllers "
            "and other core systems from known-good sources rather than "
            "trusting them. Reset credentials in a deliberate order, "
            "starting with the most privileged accounts and including "
            "service accounts and the krbtgt account where Active Directory"
            " is involved, as directed by your identity team. Bring back "
            "systems in order of business importance, and monitor each one "
            "closely as it returns.\n"
            "\n"
            "Some organizations are advised by experts about decryptors, "
            "negotiators or threat intelligence on the ransomware group. "
            "These are management decisions with legal implications. Your "
            "role is to supply facts and keep the evidence safe.",
      ),
      LessonSection(
        heading: "Business Email Compromise: What It Is",
        body:
            "BEC is fraud carried out through email. The attacker aims to "
            "convince someone to send money, change payment details or hand"
            " over sensitive data. There are two common forms. In "
            "impersonation, the attacker spoofs or imitates an executive or"
            " vendor from outside the organization. In account takeover, "
            "the attacker gains real access to a mailbox, usually through "
            "phishing or reused passwords, and then works from inside the "
            "legitimate account.\n"
            "\n"
            "Account takeover is more dangerous because it passes every "
            "authentication check. The attacker reads the victim's mail, "
            "learns who pays whom and when, and then inserts themselves "
            "into a real conversation with a believable change: new bank "
            "details, a rush payment or a gift card request. In ATT&CK "
            "terms, you may see Valid Accounts (T1078), Email Forwarding "
            "Rule (T1114.003, Collection) and Financial Theft (T1657, "
            "Impact). Many BEC cases involve no malware at all, so endpoint"
            " tools will see nothing.",
      ),
      LessonSection(
        heading: "Signs of Mailbox Compromise",
        body:
            "When you suspect a taken-over mailbox, look for the traces the"
            " attacker leaves in mail and identity logs.",
        bullets: [
          "Sign-ins from unusual locations, new devices, anonymizing "
          "services or hosting providers, or a successful sign-in right "
          "after many failures.",
          "New inbox rules that forward, delete, or move messages to "
          "obscure folders, often hiding replies containing words such as"
          " invoice, payment or bank.",
          "Mail forwarding or delegate access configured to an external "
          "address or another mailbox.",
          "New OAuth app consents granting access to mail without a "
          "password.",
          "New MFA methods or phone numbers added to the account.",
          "Messages sent from the mailbox that the user did not write, "
          "especially to finance or vendors.",
          "A look-alike domain registered to resemble a vendor or your "
          "own company, used in reply-to or follow-up mail.",
        ],
      ),
      LessonSection(
        heading: "BEC Playbook: Containment and Money",
        isTemplate: true,
        body:
            "BEC is the rare case where minutes after a payment can decide "
            "whether money is recoverable. Banks can sometimes recall "
            "transfers when contacted fast, so finance and the bank enter "
            "the process early.\n"
            "\n"
            "BEC PLAYBOOK (fictional example)\n"
            "\n"
            "TRIGGER: User or finance reports a suspicious payment request,"
            " vendor says bank details changed, or alert for risky sign-in "
            "or new forwarding rule.\n"
            "\n"
            "1. Assess whether money has moved. If yes, escalate at once to"
            " finance leadership and the incident lead, since a bank recall"
            " may be time-critical. The decision to contact the bank "
            "belongs to finance and management.\n"
            "2. Contain the account: reset the password, revoke all "
            "sessions and tokens, require MFA re-registration.\n"
            "3. Preserve evidence first: export mailbox audit logs, inbox "
            "rules, forwarding settings, sign-in logs and the fraudulent "
            "messages with headers.\n"
            "4. Remove the attacker's persistence: forwarding rules, "
            "delegates, app consents, added MFA devices.\n"
            "5. Scope: which other mailboxes did the attacker's IP or app "
            "access? Who received messages from the compromised account?\n"
            "6. Search all mail for the lookalike domain and the fraudulent"
            " invoice or bank details, and purge or quarantine messages.\n"
            "7. Warn the people affected: finance, the vendor and any "
            "customers, through a known-good contact method such as a phone"
            " number on file, not the thread under attack.\n"
            "8. Ask legal or privacy whether any mailbox contents trigger "
            "notification duties.\n"
            "9. Review controls: MFA strength, conditional access, payment "
            "verification process.",
      ),
      LessonSection(
        heading: "Sample Findings From a BEC Investigation",
        isTemplate: true,
        body:
            "SAMPLE ANALYST NOTE (fictional data)\n"
            "\n"
            "CASE: IR-2026-021 Vendor bank detail change\n"
            "MAILBOX: j.ortiz@corp.example (Accounts Payable)\n"
            "\n"
            "TIMELINE (UTC)\n"
            "2026-10-02 03:14  Sign-in success from 203.0.113.77 (VPS "
            "provider, not seen before)\n"
            "2026-10-02 03:21  Inbox rule created: if subject contains "
            "'invoice' move to RSS Feeds, mark read\n"
            "2026-10-02 03:40  Message to finance from j.ortiz asks to "
            "update vendor bank account (lookalike domain: "
            "v3ndor-supply.example)\n"
            "2026-10-05 14:10  Payment of the vendor invoice sent to the "
            "new account\n"
            "2026-10-08 09:02  Real vendor calls to ask where the payment "
            "is\n"
            "\n"
            "INITIAL ACCESS: probable credential phishing 2026-09-30 "
            "(message with fake document link; sign-in page hosted on a "
            "4-day-old domain)\n"
            "AMOUNT AT RISK: reported by Finance\n"
            "ACTIONS: account reset 09:30 on 10-08; rule removed after "
            "export; bank contacted by Finance at 09:45\n"
            "OPEN: whether other vendor threads were read; mailbox audit "
            "log review in progress\n"
            "CONFIDENCE: high that account takeover occurred; medium on how"
            " many vendors affected",
      ),
      LessonSection(
        heading: "Data Sources for These Playbooks",
        body:
            "Keep this short list in mind as your first stops.",
        bullets: [
          "Ransomware: EDR alerts and process trees, domain controller "
          "security logs, VPN and remote access logs, file server audit "
          "logs, backup system logs, DNS and proxy logs for exfiltration,"
          " and Sysmon where deployed.",
          "BEC: identity provider sign-in logs, mailbox audit logs, inbox"
          " rule and forwarding configuration, OAuth consent logs, email "
          "gateway logs and message trace, and finance records of the "
          "payment request.",
          "Both: ticketing and communications records, which become the "
          "timeline later.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes in These Playbooks",
        body:
            "Most failures here come from treating one symptom as the whole"
            " incident.",
        bullets: [
          "Ransomware: restoring systems before the attacker's access is "
          "removed, so encryption happens again.",
          "Ransomware: restoring from a backup that already contains the "
          "attacker's persistence.",
          "Ransomware: wiping infected machines before collecting any "
          "evidence of how the attacker got in.",
          "Ransomware: contacting the attackers or discussing payment "
          "without management and legal direction.",
          "BEC: resetting the password but not removing forwarding rules,"
          " consents and added MFA devices.",
          "BEC: warning the vendor by replying to the compromised email "
          "thread.",
          "BEC: waiting for proof before telling finance, while the bank "
          "recall window closes.",
          "Both: assuming no data left because no alert fired.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Post-Incident Reviews and Writing a Good RCA",
    estimatedMinutes: 22,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "Why Review at All",
        body:
            "When the incident is closed, the pressure drops and people "
            "want to move on. This is exactly when the most valuable work "
            "is available. A post-incident review (also called a "
            "lessons-learned meeting, a retrospective or a post-mortem) "
            "turns one painful event into lasting improvements. Without it,"
            " the same weakness stays in place and the same incident "
            "returns under another name.\n"
            "\n"
            "A review has three goals: establish what actually happened, "
            "understand why the defenses and the response worked or failed,"
            " and agree on specific changes. It is not a trial. If people "
            "expect to be blamed, they stop sharing what they know, and the"
            " review becomes useless. This is often called a blameless "
            "approach: you look for gaps in systems, tools, processes and "
            "information, not for a person to punish. Blameless does not "
            "mean consequence-free for deliberate misconduct; it means the "
            "review itself focuses on learning.",
      ),
      LessonSection(
        heading: "When and How to Hold the Review",
        body:
            "Hold the meeting soon enough that memories are fresh, usually "
            "within a week or two of closing the incident, but not while "
            "the team is still exhausted or while recovery is under way. "
            "Invite everyone who played a part: analysts, IT, system "
            "owners, the incident lead and a business representative. Keep "
            "it focused and give it a facilitator who does not defend any "
            "particular decision.",
        bullets: [
          "Start with the timeline, built from logs and notes, and "
          "correct it as a group.",
          "Go through key decisions and ask what information people had "
          "at that moment, not what we know now.",
          "Ask what went well, so good practice gets copied.",
          "Ask what slowed us down: missing logs, unclear authority, "
          "tools that did not work, wrong contact details.",
          "Agree on actions with an owner and a due date.",
          "Decide who will write the report, who will review it and who "
          "will receive it.",
        ],
      ),
      LessonSection(
        heading: "Root Cause: Going Beyond the First Answer",
        body:
            "A root cause analysis (RCA) asks why an incident was possible,"
            " not only how it started. The first answer is usually a "
            "symptom. The real cause sits deeper, in a control that was "
            "missing or a process that failed.\n"
            "\n"
            "One well-known technique is the five whys: keep asking why "
            "until you reach something you can fix. It is a prompt for "
            "thinking rather than a strict rule, and real incidents usually"
            " have several contributing causes, not one. Aim for causes you"
            " can act on. Stopping at user error is almost always too "
            "shallow. If a single click can compromise the company, the "
            "question becomes what allowed that click to matter.",
      ),
      LessonSection(
        heading: "Example: Five Whys on a Phishing Incident",
        isTemplate: true,
        body:
            "FICTIONAL EXAMPLE: FIVE WHYS\n"
            "\n"
            "INCIDENT: Attacker took over an Accounts Payable mailbox and "
            "redirected a payment.\n"
            "\n"
            "Why 1: Why did the attacker get in?\n"
            "  The user entered credentials on a fake sign-in page.\n"
            "Why 2: Why did entering credentials give full access?\n"
            "  MFA was approved by the attacker after repeated prompts "
            "(prompt fatigue).\n"
            "Why 3: Why was prompt fatigue possible?\n"
            "  The MFA method used simple approve and deny prompts, with no"
            " number matching.\n"
            "Why 4: Why had the stronger method not been enabled?\n"
            "  The rollout was postponed in the spring and not scheduled "
            "again.\n"
            "Why 5: Why did it fall off the plan?\n"
            "  No owner was assigned to track identity hardening actions.\n"
            "\n"
            "Why 6 (detection): Why did it take 6 days to notice?\n"
            "  Alerts for new inbox rules existed but were set to low "
            "priority and never reviewed.\n"
            "\n"
            "ROOT CAUSES (contributing)\n"
            "1. Weak MFA method for high-risk roles.\n"
            "2. No owner for identity hardening work.\n"
            "3. Mailbox rule alerts misprioritized.\n"
            "\n"
            "NOT a root cause: 'the user clicked a link'.",
      ),
      LessonSection(
        heading: "Anatomy of a Good Incident Report",
        body:
            "The report is how the lessons reach people who were not in the"
            " room. Write it for a mixed audience: executives need the "
            "summary, technical teams need the detail. Put the summary "
            "first and keep the rest in sections people can skip to.",
        bullets: [
          "Summary: what happened, impact, current status, in a few "
          "sentences.",
          "Severity, dates and duration: detection time, containment "
          "time, resolution time.",
          "Timeline: key events in time order, in one time zone.",
          "Impact: systems, data, people and business functions affected,"
          " with confidence levels.",
          "Root cause and contributing factors.",
          "What went well.",
          "What did not go well, including detection and response gaps.",
          "Actions: each with an owner, a due date and how success will "
          "be checked.",
          "Appendix: indicators of compromise, evidence list, references.",
        ],
      ),
      LessonSection(
        heading: "Sample RCA Report Skeleton",
        isTemplate: true,
        body:
            "SAMPLE INCIDENT REPORT (fictional, shortened)\n"
            "\n"
            "TITLE: IR-2026-021 Mailbox takeover and fraudulent payment\n"
            "SEVERITY: P2   STATUS: Closed   AUTHOR: P. Nair   DATE: "
            "2026-10-20\n"
            "\n"
            "SUMMARY\n"
            "Between 30 Sep and 8 Oct an attacker used stolen credentials "
            "to control one Accounts Payable mailbox and redirected one "
            "vendor payment. Finance contacted the bank within 45 minutes "
            "of discovery. Recovery of funds is in progress.\n"
            "\n"
            "KEY TIMES (UTC)\n"
            "First malicious sign-in: 2026-10-02 03:14\n"
            "Detected: 2026-10-08 09:02 (by vendor call, not by alert)\n"
            "Contained: 2026-10-08 09:30\n"
            "\n"
            "IMPACT\n"
            "One mailbox, one payment, 3 vendor threads read (confirmed "
            "from audit logs). Personal data exposure: none identified; "
            "legal reviewed.\n"
            "\n"
            "ROOT CAUSES\n"
            "1. MFA used approve/deny prompts only.\n"
            "2. Inbox-rule alert was low priority and unreviewed.\n"
            "3. Payment bank-change requests were not verified by phone.\n"
            "\n"
            "WHAT WENT WELL\n"
            "Fast containment after discovery; clean evidence from audit "
            "logs.\n"
            "\n"
            "ACTIONS\n"
            "1. Enable number matching for all finance roles. Owner: IT "
            "Identity. Due: 2026-11-15.\n"
            "2. Raise priority of mailbox-rule alerts and add a daily "
            "review. Owner: SOC lead. Due: 2026-10-27.\n"
            "3. Require call-back verification for bank changes. Owner: "
            "Finance Controller. Due: 2026-11-01.",
      ),
      LessonSection(
        heading: "Writing Quality: Facts, Confidence and Clarity",
        body:
            "A report is only as useful as it is trustworthy. Readers will "
            "act on what you write, so be careful about the difference "
            "between what you know and what you believe.",
        bullets: [
          "Separate observed facts from analysis. Use a pattern such as "
          "confirmed, likely and unknown.",
          "State your confidence and why. For example: high confidence, "
          "based on audit logs showing the rule creation.",
          "Use specific times with a time zone, not later that day.",
          "Avoid blame language and loaded words. Say the control was not"
          " enabled, not the team failed.",
          "Avoid jargon the audience may not know, or define it on first "
          "use.",
          "Include evidence references so a reader can verify claims.",
          "Keep actions concrete and checkable. Improve security "
          "awareness is vague; require number matching for finance roles "
          "by 15 November is not.",
          "Do not write legal conclusions such as negligence or "
          "violation. Describe the facts and let legal decide.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes in Post-Incident Work",
        body:
            "Even teams that hold reviews often get little out of them. "
            "Watch for these patterns.",
        bullets: [
          "Blaming an individual and stopping the analysis there.",
          "Writing actions with no owner or date, so nothing happens.",
          "Producing a long action list with no priorities, so the "
          "important item is buried.",
          "Skipping what went well, so good practice is not repeated.",
          "Writing the report weeks later from memory instead of from the"
          " timeline.",
          "Never following up on actions. Put the review of open actions "
          "on a recurring agenda.",
          "Leaving detection gaps unaddressed: if you found out from a "
          "vendor call, ask what alert should have fired.",
          "Forgetting to update playbooks, detections and training based "
          "on what you learned.",
        ],
      ),
      LessonSection(
        heading: "Habits of a Good Analyst",
        isTemplate: true,
        body:
            "CHECKLIST: HABITS OF A GOOD INCIDENT RESPONDER\n"
            "\n"
            "[ ] Take notes with timestamps from the first minute\n"
            "[ ] Say what you know, what you think and what you do not know\n"
            "[ ] Escalate early, with a clear ask\n"
            "[ ] Capture evidence before you change anything\n"
            "[ ] Choose the least disruptive action that works, and say "
            "what it costs\n"
            "[ ] Verify that a containment action actually worked\n"
            "[ ] Scope widely: search for the same activity everywhere\n"
            "[ ] Keep communication on a safe channel and on a steady "
            "rhythm\n"
            "[ ] Leave legal and regulatory decisions to the people "
            "responsible, but flag them early\n"
            "[ ] Look for the system gap, not a person to blame\n"
            "[ ] Turn every lesson into an owned, dated action\n"
            "[ ] Update the playbook after each incident\n"
            "[ ] Look after yourself and your team; long incidents need "
            "handovers and rest",
      ),
    ],
  ),
  Lesson(
    title: "Practice Test: Incident Response & Containment",
    estimatedMinutes: 10,
    difficulty: LessonDifficulty.intermediate,
    quiz: [
      QuizQuestion(
        question: "At 09:10 you confirm that a user's account was used from an "
                  "unfamiliar country and a forwarding rule was created. What "
                  "best describes where you are in the lifecycle?",
        options: [
          "Lessons learned, because you can already see which control was"
          " missing here",
          "Eradication, because you found the attacker's rule and can "
          "remove it right away",
          "Preparation, because you are now working out who needs to be "
          "called and when",
          "Detection and analysis, since you are still confirming scope "
          "and actions",
        ],
        correctIndex: 3,
        explanation:
            "You are still working out what happened and how far it "
            "reaches, which is analysis. Removing the rule first would be "
            "eradication before scoping.",
      ),
      QuizQuestion(
        question: "During the first hour of a suspected ransomware outbreak, "
                  "which action best balances stopping spread with keeping "
                  "evidence?",
        options: [
          "Wait until the ransom note appears on all hosts before taking "
          "any step at all",
          "Isolate affected hosts from the network with EDR and leave "
          "them powered on",
          "Power off every affected server at once so that encryption "
          "cannot continue",
          "Reimage the first infected laptop quickly so the user can get "
          "back to work",
        ],
        correctIndex: 1,
        explanation:
            "Network isolation stops spread while keeping memory and disk "
            "intact. Powering off feels safe but destroys volatile evidence"
            " the investigation needs.",
      ),
      QuizQuestion(
        question: "A junior analyst finds a possible domain admin compromise but "
                  "is unsure it is real. The severity table says P1 for confirmed"
                  " domain admin compromise. What should the analyst do?",
        options: [
          "Escalate now, stating what is known and unknown, and ask the "
          "lead to confirm",
          "Wait for the next shift handover to mention it to the team "
          "lead on duty",
          "Keep investigating alone until the evidence is certain, and "
          "then report it",
          "Set the severity to P3 until a second alert appears to back up"
          " the first one",
        ],
        correctIndex: 0,
        explanation:
            "Early escalation costs minutes if you are wrong, while delay "
            "can cost the organization far more. Waiting for certainty is "
            "the common instinct to resist.",
      ),
      QuizQuestion(
        question: "Which status update opening is most useful to executives "
                  "during a P1 incident?",
        options: [
          "We are still analyzing and will tell you more once we know "
          "absolutely everything",
          "Several things happened overnight and the whole team has been "
          "very busy since then",
          "Status: contained. Finance shares are down two hours; no data "
          "theft confirmed",
          "Our EDR flagged 14 hosts with suspicious svchost.exe activity "
          "starting at 02:14 UTC",
        ],
        correctIndex: 2,
        explanation:
            "Executives need status, business impact and what is unknown, "
            "in plain words. Raw technical detail suits the technical team,"
            " and vague updates give them nothing to act on.",
      ),
      QuizQuestion(
        question: "A customer contract may require notice within 72 hours of a "
                  "breach involving their data. You suspect their records were in"
                  " a compromised mailbox. What is your role?",
        options: [
          "Decide that no notice is needed because the mailbox password "
          "was reset",
          "Record the facts with exact times and tell your lead and legal"
          " contact",
          "Draft a note to the regulator that describes the likely cause "
          "of the breach",
          "Email the customer today so that the contract deadline is "
          "clearly met",
        ],
        correctIndex: 1,
        explanation:
            "Notification decisions belong to legal and management, but "
            "they depend on your accurate facts and timestamps. Contacting "
            "outside parties yourself risks wrong or premature statements.",
      ),
      QuizQuestion(
        question: "You need to isolate FILESRV02, which Finance uses before a "
                  "quarter-end deadline. Which request to the approver is "
                  "strongest?",
        options: [
          "Isolation is risky for Finance this week, so I suggest we keep"
          " on monitoring first",
          "The server is infected and has to be isolated, so please "
          "approve it right now, thanks",
          "This is a standard procedure for the SOC and does not need any"
          " business input",
          "Recommend isolating now: privileged account abuse; cost is a "
          "two-hour outage",
        ],
        correctIndex: 3,
        explanation:
            "A good request gives the recommendation, the risk of waiting, "
            "the cost and a mitigation. Saying only that a server is "
            "infected leaves the approver unable to weigh the trade-off.",
      ),
      QuizQuestion(
        question: "An attacker's stolen password was reset, but the user's old "
                  "session is still active. What containment step was missed?",
        options: [
          "Restoring the user's mailbox from last night's backup copy to "
          "remove changes",
          "Disabling the user's laptop record in the asset inventory "
          "system for the team",
          "Revoking active sessions and tokens so that existing logins "
          "end as well",
          "Blocking the user's whole email domain at the mail gateway for"
          " several hours",
        ],
        correctIndex: 2,
        explanation:
            "A password change does not always end sessions or tokens "
            "already issued. Backups and domain blocks do nothing about a "
            "live authenticated session.",
      ),
      QuizQuestion(
        question: "Which item is collected first when gathering evidence from a "
                  "running compromised workstation, following the order of "
                  "volatility?",
        options: [
          "Memory contents plus running process and network connection "
          "information",
          "The full disk image of the system drive, taken with a write "
          "blocker attached",
          "The firewall logs from last month, exported from the central "
          "log platform",
          "The installed software list, taken from the inventory tool for"
          " the device",
        ],
        correctIndex: 0,
        explanation:
            "Memory and live network state vanish on reboot or power-off, "
            "so they come first. Disk and remote logs persist longer and "
            "can wait.",
      ),
      QuizQuestion(
        question: "Why do you calculate a SHA-256 hash of an evidence file at "
                  "collection and again after each copy?",
        options: [
          "To encrypt the file so that attackers cannot read its contents"
          " if they find it",
          "To show your management that the file is malicious and should "
          "be blocked",
          "To compress the file so that it takes up much less storage "
          "space on the share",
          "To show the content is unchanged by confirming that the hash "
          "values match",
        ],
        correctIndex: 3,
        explanation:
            "A matching hash shows the data is identical to what was "
            "collected. Hashing does not encrypt, compress or say anything "
            "about whether a file is malicious.",
      ),
      QuizQuestion(
        question: "Which entry is essential in a chain of custody record?",
        options: [
          "A screenshot of the SIEM dashboard taken at the time the case "
          "was closed",
          "Each transfer of the evidence, with date, time, giver and "
          "receiver",
          "The analyst's personal opinion on which group is likely to be "
          "the attacker",
          "The name of the vendor that sold the tool used to collect the "
          "evidence",
        ],
        correctIndex: 1,
        explanation:
            "Chain of custody documents who held the evidence and when, so "
            "handling can be shown. Attribution opinions and dashboards do "
            "not record custody.",
      ),
      QuizQuestion(
        question: "In a BEC case, you reset the compromised mailbox password and "
                  "remove a forwarding rule. Finance says a payment went out "
                  "three days ago. What is the most urgent additional step?",
        options: [
          "Escalate to finance leadership now so the bank can be asked to"
          " recall it",
          "Reply to the fraudulent thread and ask the sender to confirm "
          "the new details",
          "Delete the fraudulent messages from all mailboxes so nobody "
          "else can see them",
          "Wait for the full mailbox audit review to finish before "
          "raising the payment",
        ],
        correctIndex: 0,
        explanation:
            "Banks may be able to recall transfers only if contacted "
            "quickly, so time matters. Replying on the thread tips off the "
            "attacker and deleting messages destroys evidence.",
      ),
      QuizQuestion(
        question: "After a ransomware attack, the team restores servers from the "
                  "most recent backup, taken the night before encryption. Why "
                  "might this fail?",
        options: [
          "Backups cannot hold files that the ransomware has already "
          "renamed or locked",
          "Restoring from any backup is never allowed once an attack has "
          "been confirmed",
          "The backup may hold the attacker's persistence, so access "
          "would return later",
          "Recent backups are always too large to be restored within the "
          "time available",
        ],
        correctIndex: 2,
        explanation:
            "Intruders are usually present for days before encryption, so a"
            " recent backup may already be tainted. The concern is hidden "
            "persistence, not backup size or file names.",
      ),
      QuizQuestion(
        question: "A post-incident review concludes that the root cause was 'the "
                  "user clicked a phishing link'. What is wrong with this "
                  "conclusion?",
        options: [
          "Phishing is not recognized as a valid initial access method in"
          " ATT&CK at all",
          "It stops at a symptom and never asks why one click could cause"
          " such impact",
          "It should name the user in the report so that they can be "
          "given extra training",
          "It lists too many separate causes at once for a single "
          "incident report to cover",
        ],
        correctIndex: 1,
        explanation:
            "Asking why repeatedly reaches fixable gaps such as weak MFA or"
            " missing alerts. Naming the user shifts blame and leaves the "
            "system weakness in place.",
      ),
      QuizQuestion(
        question: "Which action item from a review is best written?",
        options: [
          "The SOC should try to become noticeably faster at triage of "
          "its alerts",
          "Improve security awareness across the whole company during the"
          " coming year",
          "Enable number-matching MFA for finance; owner IT Identity; due"
          " 15 Nov",
          "Every employee must be more careful with email and with "
          "unknown links",
        ],
        correctIndex: 2,
        explanation:
            "A good action has a clear change, an owner and a date, so "
            "progress can be checked. Vague actions like be more careful "
            "cannot be verified or assigned.",
      ),
    ],
  ),
];
