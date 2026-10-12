// SOC Fundamentals — the five theory lessons for "The Pulse (SOC Blue
// Team)" module. Deliberately reuses the exact same Lesson/LessonSection
// model as the core curriculum (see lesson_model.dart) so these render
// through the exact same LessonScreen widget everyone already uses for
// Read Through — no new reading UI needed.
//
// Content originates from the L1 SOC Analyst Playbook design document,
// Part 0.

import 'lesson_model.dart';
import '../widgets/diagrams.dart';

final List<Lesson> socFundamentalsLessons = [
  Lesson(
    title: "What a SOC Actually Is",
    estimatedMinutes: 10,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Defining It Properly",
        body:
            "A Security Operations Center, or SOC, is the team and "
            "function responsible for continuously watching an "
            "organization's systems, spotting signs of trouble, and "
            "doing something about it before it turns into real damage. "
            "That's the whole job in one sentence — everything else in "
            "this module is really just detail on how that happens "
            "well.\n\n"
            "Worth being precise about one thing: a SOC is not a room "
            "full of monitors, though that's the popular image. It's a "
            "combination of people, defined ways of working, and tools "
            "— and if any one of those three is missing, the other two "
            "can't make up for it on their own.",
      ),
      LessonSection(
        heading: "The Ingredients: People, Process, Technology",
        body:
            "Every functioning SOC is built from the same three "
            "ingredients, and it's worth knowing what each one actually "
            "contributes:",
        bullets: [
          "People — L1 analysts doing first-pass triage, L2 analysts going deeper on confirmed or complex cases, a SOC manager or lead coordinating the team and owning escalations, and often dedicated threat hunters who proactively look for problems nobody's alerted on yet.",
          "Process — the playbooks and runbooks that say what to do for a given alert type, the escalation path, the severity matrix, agreed SLAs for how fast different severities get acknowledged and resolved. Without this, two equally skilled analysts handle the same alert completely differently.",
          "Technology — the SIEM collecting and correlating logs, EDR watching endpoints, a SOAR platform automating repetitive response steps, threat intelligence feeds, a ticketing system tying it all together.",
        ],
      ),
      LessonSection(
        heading: "The Fourth Ingredient Underneath the Other Three",
        body:
            "A less obvious fourth ingredient sits underneath people, "
            "process, and technology: visibility. A SOC can only detect "
            "what it can actually see — if a system isn't sending logs "
            "anywhere, no amount of skilled people or good process "
            "helps, because the alert simply never fires.",
      ),
      LessonSection(
        heading: "What a SOC Team Is Actually Expected to Deliver",
        body:
            "Strip away the tooling and job titles, and a SOC is judged "
            "on a handful of concrete things: how quickly it notices "
            "something real (time to detect), how quickly it does "
            "something about it (time to respond), how accurately it "
            "separates real problems from noise, how clearly it "
            "documents and communicates what happened, and whether it "
            "actually gets better over time — tuning noisy rules, "
            "updating playbooks based on what was learned, not just "
            "handling the same alert the same clumsy way every time.",
      ),
      LessonSection(
        heading: "Internal SOC vs. MSSP SOC",
        body:
            "An internal SOC is built and staffed by the organization "
            "itself. Its biggest advantage is deep, built-in context — "
            "the team already knows which servers matter, who the "
            "executives are, what normal looks like for this specific "
            "environment. Its biggest challenge is cost and staffing: "
            "running real 24x7 coverage in-house needs enough people to "
            "cover every shift, every day of the year, which is "
            "expensive and genuinely hard to hire for continuously.\n\n"
            "An MSSP (Managed Security Service Provider) SOC is a "
            "third-party company that monitors security for multiple "
            "client organizations at once, usually from a shared team "
            "and shared tooling. This makes 24x7 coverage far more "
            "affordable and achievable, since the cost is spread across "
            "many clients. The tradeoff is context: an MSSP analyst "
            "doesn't automatically know your environment the way an "
            "internal analyst does — that has to be deliberately built "
            "through onboarding, documentation, and ongoing "
            "communication, or the MSSP ends up flagging things that "
            "are actually normal for you, or missing things that would "
            "be obviously wrong to someone who knew your systems.",
      ),
      LessonSection(
        heading: "What 'Understanding the Customer' Actually Means",
        body:
            "The single biggest predictor of whether an MSSP "
            "relationship actually works well is how seriously they "
            "treat this — and it's not a generic questionnaire filled "
            "out once at contract signing. Before an MSSP SOC can "
            "classify severity accurately or spot what's genuinely "
            "abnormal, they need real, specific knowledge across seven "
            "dimensions:",
        bullets: [
          "The business itself — what the company actually does, which industry and regulatory context applies (healthcare brings HIPAA, finance brings PCI-DSS or SOX, each with different breach-notification obligations), and when the business genuinely can't tolerate disruption. A retailer's peak is the holiday season, a tax platform's is filing season, and an alert that's routine in March might warrant a much faster response in December for exactly the same company.",
          "The environment — the actual network topology, whether the organization runs on-prem, cloud, or a hybrid mix, how many physical sites and locations exist, and how the network is segmented. An MSSP that doesn't know the environment is hybrid will misread perfectly normal cloud-to-on-prem traffic as suspicious lateral movement.",
          "Critical infrastructure — which specific systems actually run the business: payment processing, customer data stores, authentication infrastructure, the systems that would cause real, immediate harm if they went down or were compromised. This is the same asset-criticality knowledge that's a scoping prerequisite for severity classification — an MSSP needs it just as much as an internal SOC does, arguably more, since they didn't grow up alongside this environment.",
          "Assets — a genuine, current inventory of what exists: servers, endpoints, cloud resources, and industrial/IoT devices if the environment has them. Just as important as the inventory itself is knowing who owns each asset and how critical each one actually is — an asset list with no ownership or tiering attached doesn't actually help triage move faster.",
          "People — the customer's own escalation chain and who to actually contact for what, the executive and VIP list (so a compromised CFO account is recognized as different from a compromised intern account from day one, not learned the hard way), who holds administrative access across the environment, and who's on-call on the customer's side outside the MSSP's own team.",
          "Technologies — the existing security stack already in place (EDR, firewalls, identity and access management), and just as importantly, the non-security technology stack — ERP systems, CRM platforms, custom-built applications — since these are just as often the actual target or source of an alert, and an MSSP unfamiliar with them will struggle to tell normal application behavior from something worth investigating.",
          "Vendors and third parties — who the customer depends on: managed service providers, contractors, SaaS platforms with deep integrations into the environment. This matters directly for incident response, not just onboarding paperwork — a third-party vendor's own breach is a real, recurring scenario, and an MSSP that doesn't know which vendors have access to what can't properly scope an incident that originates from, or spreads through, one of them.",
        ],
      ),
      LessonSection(
        heading: "This Knowledge Goes Stale — It Needs a Refresh Cadence",
        body:
            "None of the seven dimensions above is a one-time form. "
            "Businesses acquire new systems, onboard new vendors, and "
            "reorganize their people constantly — this knowledge needs "
            "a real refresh cadence, or the MSSP's understanding of the "
            "customer quietly goes stale exactly as fast as the "
            "customer's own environment changes.",
      ),
      LessonSection(
        heading: "Expectations From an MSSP SOC Team",
        body:
            "Beyond understanding the customer, there's a specific set "
            "of things any organization should reasonably expect and "
            "ask for from an MSSP relationship:",
        bullets: [
          "Clear, contractual SLAs — exact acknowledgment and escalation times per severity level (e.g., P1 acknowledged within 15 minutes, escalated within 30), not vague commitments like \"prompt response.\"",
          "A real onboarding process before go-live — actively learning the seven dimensions above before monitoring begins. Skipping this means a rough first few weeks of misclassified alerts.",
          "Named escalation contacts on both sides — knowing exactly who to call for what, and the MSSP knowing exactly who to notify for each severity level, not a generic ticket queue.",
          "Data segregation — logs, alerts, and incident data kept clearly separated from the MSSP's other clients, explicitly addressed in the contract.",
          "Regular reporting, not just incident-by-incident updates — a periodic summary of alert volume, trends, false-positive rates, and tuning changes, showing whether the relationship is actually improving over time.",
          "A genuine feedback loop — a real, working mechanism for reporting a misclassification or an irrelevant alert type, with evidence that feedback actually changes tuning rather than disappearing into a form.",
          "Transparency about their own tooling and coverage gaps — an honest MSSP says what it can't see rather than implying full coverage when it doesn't exist.",
          "A defined off-boarding/transition process — a clear plan for handing back logs, documentation, and institutional knowledge if the relationship ends, so the customer isn't starting from zero with the next provider.",
        ],
      ),
      LessonSection(
        heading: "AI SOC: What the Term Actually Means",
        body:
            "\"AI SOC\" refers to a SOC that leans heavily on AI and "
            "machine learning to help with the volume problem — "
            "correlating enormous numbers of events, doing first-pass "
            "triage at machine speed, drafting initial summaries, and "
            "spotting subtle anomalous patterns a human scanning "
            "dashboards all day might miss.\n\n"
            "Worth being honest about what this actually changes and "
            "what it doesn't: AI SOC tooling is genuinely good at "
            "augmenting analysts — cutting through noise faster, "
            "reducing alert fatigue, and surfacing what's actually "
            "worth a human's attention. It is not a replacement for the "
            "judgment this whole module builds toward — deciding "
            "whether ambiguous evidence points to a true positive, "
            "choosing how to communicate a P1 to different audiences, "
            "or recognizing when to escalate for a second opinion. "
            "Those remain human skills. Treat \"AI SOC\" as a "
            "description of better tooling in front of the same "
            "seven-stage workflow, not a different job.",
      ),
      LessonSection(
        heading: "Why 24x7, and How It Actually Runs",
        body:
            "Attackers don't work business hours — a meaningful share "
            "of real attacks are deliberately timed for nights, "
            "weekends, and holidays specifically because they assume "
            "defenders are less alert then. Add in organizations with "
            "users and systems spread across time zones, and the case "
            "for round-the-clock coverage is really just the dwell-time "
            "principle applied to staffing: any gap in monitoring is "
            "time an attacker gets for free.\n\n"
            "In practice, 24x7 coverage is built one of two ways: a "
            "single team working staggered shifts (commonly three "
            "8-hour shifts, or two 12-hour shifts) to cover the full "
            "day, or a \"follow-the-sun\" model where SOCs in different "
            "time zones hand off to each other as their region's "
            "business day ends, so it's always daytime hours somewhere "
            "for whichever team is currently on point.",
      ),
      LessonSection(
        heading: "Shift Handover: The Skill Most Teams Get Wrong",
        body:
            "This deserves real attention, because a bad handover "
            "quietly recreates a \"going dark\" problem, just between "
            "shifts instead of to stakeholders. A good handover covers: "
            "any incident still open or in progress, anything flagged "
            "to keep an eye on even if it's not yet a confirmed "
            "incident, any tuning or suppression changes made during "
            "the shift (so the next team doesn't get confused by an "
            "alert that mysteriously stopped firing), anything left "
            "pending from the previous handover, and known issues — a "
            "noisy rule someone's mid-way through tuning, a tool that's "
            "been flaky all shift.\n\n"
            "The best handovers are both written and verbal where "
            "possible — a written log that's actually searchable later, "
            "plus a few minutes of live overlap to convey the things "
            "that don't fit neatly into ticket fields, like \"this one "
            "felt off but I couldn't pin down why.\" A handover that "
            "just says \"quiet shift, nothing to report\" is the same "
            "failure mode as a content-free rolling status update — it "
            "might be true, but it gives the incoming team nothing to "
            "actually verify or build on.",
      ),
    ],
  ),
  Lesson(
    title: "The Investigation Workflow",
    estimatedMinutes: 8,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Where You Fit",
        body:
            "Every SOC has a rhythm to it, and it starts with you. Alerts "
            "don't arrive already sorted into \"real\" and \"noise\" — "
            "that's the whole job. As an L1 analyst, you're the first "
            "human being to actually look at most of what the tools flag. "
            "Your decisions in the first few minutes shape everything "
            "that happens after.\n\n"
            "Here's the escalation chain you're working inside: L1 (you) "
            "triages and investigates the first pass, L2 takes over "
            "anything that needs deeper technical digging or tooling you "
            "don't have access to, and L3 or the Incident Response lead "
            "steps in once something is confirmed serious enough to need "
            "coordinated action across teams. Knowing this chain matters "
            "because it tells you what's actually your call to make. You "
            "decide whether something looks like a false positive or "
            "needs escalation. You do not need to personally solve every "
            "hard case — recognizing \"I've gathered what I can, and this "
            "needs a second set of eyes\" is itself a core skill, not a "
            "failure to do your job.",
      ),
      LessonSection(
        heading: "The Seven Stages, and What Actually Triggers Each One",
        body:
            "You'll see this workflow again and again throughout this "
            "module, because it's the same seven-stage shape underneath "
            "every single alert type, regardless of what tool fired it "
            "or what it's about:",
        bullets: [
          "Detection — something surfaces the alert in the first place. This isn't one thing: a SIEM correlation rule might fire because five failed logins happened in ten seconds, an EDR agent might flag a process behaving like known ransomware, a DLP policy might catch a file upload matching a sensitive-data pattern, or — just as validly — a real person emails the SOC saying \"this looks weird.\" Different sources, same starting gun.",
          "Triage — your first pass at the alert. What is it actually claiming happened? Who or what does it involve? Is there anything obviously missing that you need before you can even start reasoning about it?",
          "Classify — deciding how serious this could be, covered properly in Lesson 2. For now, just know that this decision happens early, not at the end.",
          "Investigate — the actual digging: pulling logs, checking reputation databases, comparing against what \"normal\" looks like for this user or system. This is where you decide false positive or true positive.",
          "Contain — if it's real, stopping it from getting worse. This might mean isolating a machine, disabling an account, or blocking an IP — whatever cuts off the attacker's current path forward.",
          "Eradicate — removing the actual cause, not just the visible symptom. Deleting a malicious file isn't eradication if the persistence mechanism that keeps re-downloading it is still sitting there.",
          "Report and Communicate — writing it up and telling the right people the right amount of detail, covered in Lessons 3 through 5.",
        ],
      ),
      LessonSection(
        diagram: const DiagramSpec(
          type: DiagramType.socWorkflow,
          caption: "The same seven-stage shape underneath every alert type.",
        ),
      ),
      LessonSection(
        heading: "Dwell Time: Why Speed Early On Compounds",
        body:
            "Dwell time means one simple thing: how long an attacker "
            "stays inside before they get caught and removed.\n\n"
            "The longer they stay, the more damage they can do. More "
            "emails read. More systems reached. More data copied.\n\n"
            "So acting fast early on — in detection and triage — really "
            "matters. Every minute you save is a minute the attacker "
            "doesn't get. Speed at the start isn't about rushing. It's "
            "about giving the attacker less time to work with.",
      ),
      LessonSection(
        heading: "A Full Pass, at a Glance",
        body:
            "Here's all seven stages threaded through one alert, "
            "briefly, so you can see the shape before the worked "
            "scenarios go deep on any single piece.\n\n"
            "A SIEM alert fires: an account just logged in from two "
            "countries eleven minutes apart (detection). You check the "
            "account's normal login pattern and confirm this really is "
            "unusual for this specific user, not just a rule that's "
            "overly sensitive (triage). Given a single account is "
            "affected but the login pattern strongly suggests active "
            "compromise, you provisionally call this P2 (classify). You "
            "check the source IPs, confirm neither matches this user's "
            "usual VPN or office network, and the user confirms they "
            "haven't traveled or logged in from either location "
            "(investigate — true positive). You disable "
            "the account and revoke its active sessions immediately "
            "(contain). You check what that session actually touched "
            "while it was active, and reset the password once you're "
            "sure nothing else needs cleaning up first — then revoke "
            "sessions and tokens again after the reset too, since a "
            "password change alone doesn't always invalidate sessions "
            "that were already issued before it (eradicate). You write "
            "the initial report within the day, noting what's confirmed "
            "and what's still open (report).\n\n"
            "That's the whole shape. Every scenario in this module is "
            "really just this same walk, with different specifics.",
      ),
      LessonSection(
        heading: "Two Ways New Analysts Get This Wrong",
        body:
            "Worth naming both directions, since they look like opposite "
            "mistakes but come from the same root cause: acting on "
            "incomplete understanding.\n\n"
            "The first is moving too fast — disabling an account or "
            "isolating a machine before actually confirming there's a "
            "real problem, based on a gut feeling rather than evidence. "
            "This has real cost: a wrongly-disabled account is a "
            "genuinely disrupted employee, and doing this repeatedly "
            "erodes trust in the SOC's judgment.\n\n"
            "The second, and just as damaging, is moving too slow on "
            "something that's already confirmed — continuing to "
            "\"investigate further\" on a clearly active P1 while the "
            "actual harm keeps happening in real time. Once you have "
            "enough to act, containment shouldn't wait for a complete "
            "picture. You can keep investigating while containing.",
      ),
      LessonSection(
        heading: "Reasoning When the Evidence Is Incomplete",
        body:
            "Most of what makes this job hard isn't technical — it's "
            "that you almost never get to work with complete "
            "information. Waiting for total certainty before doing "
            "anything is itself a failure mode, not caution. A few "
            "concrete ways to actually reason well under that "
            "uncertainty:",
        bullets: [
          "Think in likelihood, not certainty. \"This is more consistent with a true positive than a false one\" is a real, actionable conclusion — you don't need to be 100% sure to justify containing something.",
          "Run the benign-explanation test. Try to construct a genuinely plausible innocent explanation for what you're seeing. If you find yourself straining to invent one, that itself is telling you something.",
          "Escalate for uncertainty, not just for severity. Asking a second person for their read is warranted the moment you're genuinely stuck — that's a different trigger than \"this looks really bad,\" and just as legitimate a reason to loop someone else in.",
          "Write down your reasoning even when your conclusion is \"unclear.\" The next analyst — or you, tomorrow — shouldn't have to start from zero on something you already thought hard about today.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Classifying Incident Severity",
    estimatedMinutes: 6,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Why This Exists At All",
        body:
            "It's tempting to think of severity classification as "
            "paperwork — a label you slap on before moving to the actual "
            "work. It isn't. Severity is what tells the rest of the "
            "organization how much attention, how many people, and how "
            "much urgency an incident actually needs. Get it wrong in "
            "one direction, and a genuine emergency sits in a queue "
            "behind routine tickets. Get it wrong the other way, and "
            "you've paged your SOC lead out of bed at 2 AM for something "
            "that could've waited until morning. The classification "
            "itself is the resourcing decision — that's why it happens "
            "early, not as an afterthought once everything's already "
            "understood.",
      ),
      LessonSection(
        heading: "Reading the Matrix Properly",
        body:
            "Severity has three real axes: scope (how many users or "
            "systems are touched), confirmed-vs-suspected (how sure you "
            "actually are), and business impact (what's actually at "
            "stake if this is real). Here's the part that trips people "
            "up: you don't need all three maxed out to call something "
            "P1. A single compromised domain admin account is P1 on "
            "business impact alone — the scope is technically \"just one "
            "account,\" but that one account can touch everything. "
            "Meanwhile, a phishing email that hit forty inboxes but that "
            "nobody clicked is genuinely lower severity than its "
            "\"scope\" alone might suggest, because the actual risk "
            "realized is close to zero.\n\n"
            "Read the matrix as \"does any axis clearly justify this "
            "level,\" not \"do all axes agree.\"",
      ),
      LessonSection(
        heading: "You Can't Scope an Incident Without Already Knowing What's Critical",
        body:
            "Here's something that has to exist before you can classify "
            "scope accurately at all: a SOC can't judge whether an "
            "affected system is \"a big deal\" or \"not a big deal\" in "
            "the moment, under pressure, without already knowing which "
            "systems and people matter most. This knowledge has to be "
            "built and maintained before an incident ever happens — it's "
            "a genuine prerequisite, not something you look up while the "
            "clock is running.\n\n"
            "What a SOC needs on hand, ready to check quickly, before "
            "severity classification can really work:",
        bullets: [
          "An asset inventory — a real, current list of what systems and applications actually exist, not just what's assumed to exist. You can't know something critical was touched if you don't know it was there in the first place.",
          "Which applications and servers are actually critical to the business — not everything is equally important, and knowing which ones are (payment systems, customer data stores, authentication infrastructure) is what turns \"a server was touched\" into an actual severity decision.",
          "A list of executive and VIP accounts — a compromised intern's account and a compromised CFO's account are not the same severity, even if the technical indicators look identical. This list needs to exist and be kept current, not improvised during an incident.",
          "Which users otherwise have outsized access or impact — admins, service account owners, anyone whose single account touches an unusually large amount of the environment.",
        ],
      ),
      LessonSection(
        heading: "The Escalate-When-Unsure Principle, and Why the Math Actually Favors It",
        body:
            "This is the direct extension of Lesson 1's reasoning under "
            "uncertainty, applied specifically to the severity call. "
            "Here's the actual cost comparison worth internalizing: if "
            "you call something P1 and it turns out to be P2, the cost "
            "is a senior person spending a few extra minutes confirming "
            "that, then downgrading it. If you call something P2 when it "
            "was actually P1, the cost is however much extra dwell time "
            "accumulates before someone with more context re-examines it "
            "and catches the mistake — which could be hours. The "
            "asymmetry is real and consistent: overestimating severity "
            "is cheap to correct; underestimating it is expensive to "
            "discover. When you're genuinely torn between two levels, "
            "that asymmetry is the tiebreaker — go with the higher one.",
      ),
      LessonSection(
        heading: "Severity Isn't Fixed at Classification Time",
        body:
            "The first classification is a snapshot based on what you "
            "know in that moment — it's not a permanent label. As you "
            "investigate, new information should actively reshape it. A "
            "P3 that turns out to involve a domain admin account needs "
            "to become a P1 the moment that's confirmed, not stay P3 "
            "because \"that's what it was labeled as.\" Watch for these "
            "specific triggers to re-classify: the actual scope turns "
            "out to be wider than initially thought, a "
            "previously-suspected compromise gets confirmed, or a system "
            "you didn't realize was in scope turns out to be touched. "
            "Re-classifying mid-investigation isn't a sign you got it "
            "wrong the first time — it's the system working as intended.",
      ),
      LessonSection(
        heading: "Why Consistency Matters More Than Individual Perfection",
        body:
            "No single analyst's judgment on severity will be perfect "
            "every time — that's not a realistic bar, and it's not "
            "actually the goal. What matters more is that the same alert "
            "gets classified roughly the same way regardless of which "
            "analyst is on shift. This is why SOCs run calibration "
            "reviews and postmortems: not to punish a wrong call, but to "
            "align everyone's mental model so a P2 means the same thing "
            "on a Tuesday morning as it does at 3 AM on a Saturday. If "
            "your gut read on a scenario keeps disagreeing with how your "
            "team classifies similar ones, that's worth raising directly "
            "— better to recalibrate together than to have a "
            "persistent, undiscussed gap in how severity gets called.",
      ),
    ],
  ),
  Lesson(
    title: "Documentation Discipline",
    estimatedMinutes: 7,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "One Skill, Three Time Horizons",
        body:
            "It's easy to think of \"the ticket,\" \"the report,\" and "
            "\"writing up a KB article\" as three separate chores. "
            "They're really the same underlying skill practiced at three "
            "different distances from the moment: the ticket is you "
            "writing for yourself an hour from now, the report is you "
            "writing for someone reading tomorrow, and the KB article is "
            "you writing for a stranger — maybe a future coworker, maybe "
            "your own forgotten memory — six months from now. Getting "
            "good at one genuinely makes you better at the others, "
            "because the core discipline is identical: write down what "
            "happened clearly enough that someone without your current "
            "context can actually use it.",
      ),
      LessonSection(
        heading: "Documenting As You Go, Not After",
        body:
            "Here's the part that's easy to skip under pressure, and "
            "also the part that causes the most pain later: updating "
            "your ticket in real time as you investigate, not "
            "reconstructing the whole story from memory once you're "
            "done. When you check a login history and it comes back "
            "clean, write that down immediately — \"checked login "
            "history, nothing unusual\" — even though it feels like "
            "nothing happened. Six steps later, when you're trying to "
            "remember whether you actually ruled that out or just meant "
            "to, that one line saves you from redoing work or, worse, "
            "from confidently stating something you never actually "
            "verified.\n\n"
            "A genuinely useful habit: after every meaningful action "
            "during an investigation — a log pulled, a hypothesis ruled "
            "out, a system checked — take fifteen seconds to add one "
            "line to the ticket. It feels like friction in the moment. "
            "It's the difference between writing your Initial Report "
            "from a real record and writing it from a foggy memory of a "
            "stressful hour.",
      ),
      LessonSection(
        heading: "The Initial Report Itself",
        body:
            "This is the formal, structured document due within one "
            "business day — and its audience is different from your "
            "ticket notes. People reading this weren't in the "
            "investigation with you; they need the story told clearly, "
            "without your internal shorthand. The Summary section is "
            "where this shows most: a good one is specific (\"account X "
            "showed logins from two countries eleven minutes apart; "
            "confirmed as unauthorized access, contained by 14:32\") — a "
            "weak one is vague and hedges everything (\"there may have "
            "been some suspicious activity, still looking into it, will "
            "know more soon\"). Vagueness here isn't caution, it's "
            "actually less useful — it gives the reader nothing to act "
            "on.\n\n"
            "The other real discipline this section teaches: clearly "
            "separating what you know from what you're still "
            "investigating. Write \"confirmed: attacker accessed mailbox "
            "X\" only once you've actually confirmed it. Write "
            "\"investigating: whether any data was exfiltrated during "
            "that window\" for the parts still open. Blurring these two "
            "categories together — stating a hunch with the same "
            "confidence as a confirmed fact — is the single most common "
            "way an Initial Report misleads the people relying on it.",
      ),
      LessonSection(
        heading: "Sample Filled Initial Report",
        isTemplate: true,
        body:
            "Incident ID: INC-2026-0914\n"
            "Date/Time Detected: Sep 14, 2026, 09:14 IST\n"
            "Date/Time Reported: Sep 14, 2026, 16:30 IST\n"
            "Severity: P2\n"
            "Status: Contained\n\n"
            "Summary: A SIEM alert flagged an account login from two "
            "countries eleven minutes apart. Investigation confirmed "
            "unauthorized access — the account has been disabled and "
            "sessions revoked. No evidence yet of data accessed beyond "
            "the mailbox itself.\n\n"
            "Affected Scope: 1 user account (user123@example.com). No "
            "other systems confirmed touched.\n\n"
            "Timeline: 09:14 alert fired. 09:20 triage began. 09:35 "
            "confirmed true positive based on IP mismatch and travel not "
            "confirmed by the user. 09:38 account disabled, sessions "
            "revoked. 10:15 began reviewing mailbox activity during the "
            "compromised window.\n\n"
            "Initial Classification: SIEM impossible-travel rule. "
            "Confirmed true positive — source IPs matched neither the "
            "user's usual VPN nor office network, and the user confirmed "
            "they had not traveled or logged in from either "
            "location.\n\n"
            "Containment Actions Taken: account disabled (09:38, "
            "analyst), sessions revoked (09:38, analyst), password reset "
            "pending mailbox review completion.\n\n"
            "Current Risk/Outstanding Exposure: still reviewing what was "
            "read or forwarded from the mailbox during the compromised "
            "window; no evidence yet of external forwarding rules "
            "created; no data exfiltration identified as of now.\n\n"
            "Next Steps: complete mailbox activity review by end of day; "
            "reset password once review confirms no pending changes to "
            "preserve; full RCA due within 5 business days.\n\n"
            "Notice what this example does well: the Summary states "
            "exactly what's confirmed without speculating further, the "
            "Current Risk section honestly names what's still unknown "
            "rather than implying everything is resolved, and every "
            "containment action has a specific timestamp rather than a "
            "vague \"handled.\"",
      ),
      LessonSection(
        heading: "Contributing to Runbooks and KB Articles",
        body:
            "This is the part most analysts never get around to, "
            "usually because it doesn't feel urgent the way an active "
            "incident does. But it's genuinely valuable: if you just "
            "spent forty minutes figuring out a non-obvious "
            "investigation technique, or noticed a quirk in how a "
            "specific tool behaves, writing that down once saves the "
            "next person forty minutes. The test for whether something's "
            "worth writing up: would a reasonably experienced analyst on "
            "your team not already know this? If yes, it's worth a KB "
            "entry.\n\n"
            "What separates a KB article people actually use from one "
            "that sits ignored: specificity. \"Check for suspicious "
            "PowerShell\" is useless — everyone already knows to do "
            "that. A specific note tied to a real trigger condition — "
            "naming the exact tool quirk, the exact field to check "
            "instead of the misleading default one — is something "
            "someone will actually search for and find useful, because "
            "it's tied to a situation they'll recognize when they hit "
            "it.",
      ),
      LessonSection(
        heading: "Sample KB Article",
        isTemplate: true,
        body:
            "Title: PsExec lateral movement shows wrong parent process "
            "in our EDR\n\n"
            "Trigger: you're investigating suspected lateral movement "
            "and the EDR's process tree shows the parent process as "
            "svchost.exe, which looks like a dead end.\n\n"
            "What's actually happening: our EDR platform sometimes "
            "displays the immediate OS-level parent rather than the "
            "process that genuinely spawned it, which can hide the real "
            "origin of a PsExec-based connection.\n\n"
            "What to do instead: don't trust the displayed parent alone "
            "— open the process details and check the OriginalFileName "
            "and command-line arguments fields directly. These reliably "
            "show the actual spawning tool even when the visual process "
            "tree doesn't.\n\n"
            "Why this matters: relying on the displayed tree alone can "
            "make a real lateral-movement chain look like a dead end, "
            "costing real investigation time.\n\n"
            "Notice this example is specific and actionable — it names "
            "the exact tool, the exact field, and the exact situation "
            "where this applies, rather than general advice anyone could "
            "already guess.",
      ),
    ],
  ),
  Lesson(
    title: "Root Cause Analysis",
    estimatedMinutes: 7,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Symptom vs. Root Cause",
        body:
            "This is the single idea this whole lesson is built around, "
            "so it's worth sitting with directly: a symptom is what you "
            "observed; a root cause is why the observation was even "
            "possible in the first place. \"Phishing email\" is a "
            "symptom — phishing emails arrive at every organization, "
            "constantly. The root cause is whatever made this particular "
            "one succeed: maybe there's no sandboxing for attachments "
            "from first-time sender domains, maybe the organization's "
            "email security gateway doesn't check DMARC alignment "
            "strictly enough, maybe there simply wasn't security "
            "awareness training covering this specific pattern. Fix only "
            "the symptom (delete the email, reset the one affected "
            "password) and the exact same attack succeeds again next "
            "week, against someone else.",
      ),
      LessonSection(
        heading: "What the Timeline Section Is Actually For",
        body:
            "A root cause analysis's timeline isn't just a chronological "
            "list for the record — its real value is in the gaps "
            "between entries. If detection happened at 09:14 but "
            "containment didn't happen until 11:40, that "
            "two-and-a-half-hour gap is worth its own line of "
            "explanation: what was happening during that window? Was the "
            "alert sitting in a queue? Was the analyst investigating "
            "something else first? Was there genuine uncertainty that "
            "took time to resolve? The gaps are where the actual process "
            "improvements usually live — the individual events rarely "
            "need fixing, the delays between them often do.",
      ),
      LessonSection(
        heading: "Lessons Learned Has to Be Blame-Free to Actually Work",
        body:
            "This is worth stating plainly: if the lessons-learned "
            "section reads like it's assigning fault to a specific "
            "person, people will start writing defensively instead of "
            "honestly, and the section stops being useful almost "
            "immediately. \"The analyst failed to notice the suspicious "
            "login\" produces defensiveness and, eventually, sanitized "
            "reports that hide real gaps. \"The alert for this login "
            "pattern doesn't surface prominently enough in the queue, "
            "making it easy to deprioritize\" describes the same "
            "underlying problem in a way that actually points toward a "
            "fix, and that people will tell the truth about next time. "
            "Write about systems and processes, not about people — even "
            "when a person's specific action really was part of the "
            "chain of events.",
      ),
      LessonSection(
        heading: "IOC vs. IOA, and Why the Difference Matters Long-Term",
        body:
            "An Indicator of Compromise is a specific, static artifact — "
            "an IP address, a file hash, a domain name. An Indicator of "
            "Attack is a behavioral pattern — \"PowerShell spawned "
            "directly from Outlook,\" \"a mailbox rule created and then "
            "immediately hidden from the sent-items view,\" \"repeated "
            "MFA denials followed by a single approval.\" The practical "
            "difference matters more than it might seem: attackers "
            "rotate their IPs and repack their malware constantly, so "
            "IOCs age fast — a block list built purely from IOCs needs "
            "constant updating just to stay relevant. IOAs describe how "
            "an attack tends to unfold, which changes far more slowly, "
            "since it reflects genuine constraints on what an attacker "
            "needs to accomplish, not just which specific tools they "
            "happened to use this week. Blocking based on IOAs tends to "
            "catch the next variant of an attack technique; blocking "
            "based on IOCs alone usually only catches the exact one you "
            "already saw.",
      ),
      LessonSection(
        heading: "Corrective Actions That Actually Close",
        body:
            "The difference between a real corrective action and an "
            "aspiration that never resolves: an owner's name, a specific "
            "date, and a description specific enough that \"done\" is "
            "unambiguous. \"Improve security awareness training\" never "
            "closes — it's not clear what would even count as finished. "
            "\"Add a module on lookalike-domain phishing to the Q4 "
            "security awareness training, owned by a named person, live "
            "by a specific date\" closes cleanly, because you can look "
            "at it later and know definitively whether it happened. When "
            "you're writing this section, if you can't picture the "
            "specific moment this action gets marked done, it's still "
            "too vague to write down as-is.",
      ),
      LessonSection(
        heading: "Sample Filled RCA",
        isTemplate: true,
        body:
            "Incident: INC-2026-0914 — Account compromise via impossible "
            "travel\n"
            "Severity: P2\n"
            "Date Occurred: Sep 14, 2026\n"
            "Date Contained: Sep 14, 2026\n\n"
            "Executive Summary: an employee's account was accessed from "
            "an unrecognized location. The account was disabled and "
            "secured the same day. No evidence of further compromise or "
            "data exfiltration was found.\n\n"
            "Root Cause: the account's password had been reused from a "
            "personal account that was exposed in an unrelated, "
            "third-party data breach several months earlier. Multi-factor "
            "authentication was not yet enforced for this user's role, "
            "which is what actually allowed the reused password alone to "
            "grant access.\n\n"
            "Note what makes this a real root cause rather than a "
            "symptom: \"password was guessed\" would be a symptom. "
            "\"Password reuse plus no MFA enforcement for this role\" "
            "names the actual gap that let the symptom succeed.\n\n"
            "IOC: source IP 185.220.101.[REDACTED] (unfamiliar ASN, no "
            "prior association with this user).\n\n"
            "IOA: login pattern showing impossible travel — two "
            "successful authentications from distant locations within "
            "minutes of each other.\n\n"
            "Lessons Learned: MFA enforcement had not yet been extended "
            "to this user's role at the time of the incident, and "
            "password-reuse detection against known-breach databases "
            "isn't currently part of the account security baseline.\n\n"
            "Corrective Actions: extend MFA enforcement to all roles, "
            "owned by IT Security, due within 2 weeks. Evaluate a "
            "breached-password-detection service for new and existing "
            "accounts, owned by IT Security, due within 30 days.\n\n"
            "Notice the Lessons Learned section names a process gap "
            "(\"MFA not yet extended to this role\"), not a person's "
            "mistake — and both corrective actions have a real owner and "
            "a real date, not just an aspiration.",
      ),
    ],
  ),
  Lesson(
    title: "Communicating an Incident",
    estimatedMinutes: 7,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Who Actually Sends These Communications — Not You, Usually",
        body:
            "Worth being explicit about this before anything else in "
            "this lesson: as an L1 analyst, you generally do not send "
            "the external communications described here yourself. "
            "Customer-facing updates, executive communications, and "
            "formal stakeholder messages are normally sent by the "
            "designated incident lead or the senior engineer on shift — "
            "someone with the authority and full picture needed to "
            "represent the organization externally, and who's "
            "accountable for what gets said.\n\n"
            "So why does this lesson matter for you at all? Two "
            "reasons. First, you're very often the person who drafts the "
            "technical content that becomes that communication — your "
            "SOC lead can only write an accurate, well-judged update if "
            "you've fed them accurate, well-organized information in the "
            "first place. Second, on some teams, especially smaller "
            "ones, an experienced L1 genuinely may be asked to send "
            "certain internal-only or lower-stakes updates directly. "
            "Know your own team's actual escalation path for who "
            "communicates what — this lesson teaches the skill; your "
            "team's process determines who applies it and when.",
      ),
      LessonSection(
        heading: "Different Audiences Need Genuinely Different Messages",
        body:
            "The instinct to write one update and send the same text to "
            "everyone is understandable — it feels efficient — but it "
            "actively works against you here. Your internal team needs "
            "full technical detail so they can act on it. Customer "
            "stakeholders need to know impact and timeline, not your "
            "internal system names or your current best theory about "
            "root cause. End users need to know what's happening to them "
            "specifically and what action, if any, they need to take. "
            "Collapsing these into one message means either drowning "
            "non-technical readers in detail they can't use, or "
            "stripping out information your own team actually needs — "
            "there's no version of \"one message for everyone\" that "
            "serves any audience well.",
      ),
      LessonSection(
        heading: "The Golden Rule, and What Happens When It's Broken",
        body:
            "Never state unconfirmed root cause externally — this is "
            "worth understanding through what goes wrong when it's "
            "ignored, not just as a rule to follow. Picture an "
            "organization that tells customers early on \"this was "
            "caused by a vulnerability in our authentication system\" "
            "before that's actually confirmed. Investigation continues, "
            "and it turns out the real cause was something else entirely "
            "— a third-party vendor's compromised credential, say. Now "
            "there are two separate problems: the original incident, and "
            "a public correction that looks like either incompetence or "
            "an attempt to obscure what really happened, regardless of "
            "which it actually was. \"We are investigating an incident "
            "and will share confirmed details as soon as we have them\" "
            "costs you nothing and can never need walking back.",
      ),
      LessonSection(
        heading: "Writing for End Users: Clarity Beats Alarm",
        body:
            "An end-user message that's technically accurate but poorly "
            "written can do real harm even when the underlying situation "
            "is well-handled — either by causing outsized panic, or by "
            "being so vague that people don't understand what they're "
            "actually supposed to do. The test worth applying: after "
            "reading your message, does the recipient know exactly what "
            "action to take, if any? \"We detected unusual activity\" "
            "tells someone to worry without telling them what to do "
            "about it. \"We've reset your password as a precaution — "
            "you'll need to set a new one the next time you sign in\" "
            "tells them precisely what happened and what to expect next. "
            "Specific and calm beats vague and alarming, every time.",
      ),
      LessonSection(
        heading: "Why Legal and Compliance Get Looped In Before External Communication",
        body:
            "The moment there's any possibility that personal or "
            "regulated data was accessed, legal and compliance need to "
            "be brought in before anything goes out externally — not "
            "after, and not only once you're fully certain data was "
            "actually exposed. This isn't about slowing things down "
            "unnecessarily; it's because breach notification laws often "
            "have strict timelines that start counting from when you had "
            "reasonable grounds to suspect exposure, not from when you "
            "achieved full certainty. Waiting for perfect certainty "
            "before looping in legal can mean missing a notification "
            "deadline that started running earlier than you realized.",
      ),
      LessonSection(
        heading: "Rolling Status Updates: A Different Skill Than the Formal Report",
        body:
            "Active P1/P2 incidents need something the one-time Initial "
            "Report doesn't cover: frequent, short updates sent while "
            "the situation is still unfolding — every 30 to 60 minutes "
            "for a P1, every few hours for a P2. This is a genuinely "
            "different writing skill from the formal report: brevity "
            "under real time pressure, often written by someone who's "
            "also actively still investigating.\n\n"
            "The two failure modes worth naming explicitly, because they "
            "look opposite but come from the same underlying mistake — "
            "not respecting how the absence of information affects a "
            "reader. Going quiet for too long reads as either "
            "incompetence or concealment to whoever's waiting, even when "
            "your team is working hard and making real progress. Sending "
            "updates that say nothing new (\"still investigating,\" "
            "repeated every hour with no other detail) trains people to "
            "stop reading your updates entirely, which is exactly the "
            "outcome you don't want the one time an update genuinely "
            "matters. The fix for both is the same: always say something "
            "concrete about current state, even when that's \"still on "
            "the same lead as the last update — here's specifically "
            "what's slow about it right now.\" A stalled lead, honestly "
            "described, is a real update. Silence is not.",
      ),
      LessonSection(
        heading: "Sample Filled Communications: P1 vs. P2",
        isTemplate: true,
        body:
            "Seeing an actual filled example makes the difference "
            "between the two levels concrete, rather than abstract. Both "
            "below are the same style of update, but notice how urgency, "
            "audience, and level of reassurance differ.\n\n"
            "SAMPLE — P1, internal, sent to leadership 20 minutes after "
            "detection:\n"
            "\"P1 confirmed: ransomware activity detected on 3 file "
            "servers, actively isolating now. Patient zero not yet "
            "identified. All hands SOC response underway, war room "
            "bridge open. Next update in 30 minutes or sooner if "
            "anything changes.\"\n\n"
            "SAMPLE — P1, external, sent to customers 45 minutes after "
            "detection, once legal has reviewed:\n"
            "\"We are currently investigating a security incident "
            "affecting a subset of our internal systems. Out of caution, "
            "we have taken some systems offline while we investigate. We "
            "have no evidence at this time that customer data has been "
            "affected, and will share confirmed updates as soon as we "
            "have them.\"\n\n"
            "SAMPLE — P2, internal, sent to the SOC channel:\n"
            "\"P2: confirmed unauthorized access to one employee mailbox "
            "via a phishing link. Account disabled, sessions revoked, "
            "password reset. No evidence of lateral movement or further "
            "access. Continuing to review mailbox activity for anything "
            "sent externally. Initial report by end of day tomorrow.\"\n\n"
            "SAMPLE — P2, end-user, sent directly to the affected "
            "employee:\n"
            "\"We detected suspicious activity on your account today and "
            "have already reset your password as a precaution. You'll "
            "need to set a new password the next time you sign in. No "
            "action is needed from you beyond that — if you notice "
            "anything else unusual, please let the security team know "
            "right away.\"\n\n"
            "Notice what changes and what doesn't: the P1 examples "
            "convey urgency and active, ongoing response; the P2 "
            "examples convey a contained, already-handled situation. "
            "Both are honest, both are specific, and neither one "
            "speculates about root cause it doesn't already know.",
      ),
    ],
  ),
];
