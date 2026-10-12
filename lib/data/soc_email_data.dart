// Email and Phishing Analysis: the third theory module of "The Pulse (SOC
// Blue Team)". Uses the same Lesson/LessonSection/QuizQuestion model as
// every other module, so it renders through the existing LessonScreen.
//
// Order matters: the lessons build on each other (headers -> links and files -> phishing types
// -> response workflow -> defenses), ending with a practice test.

import 'lesson_model.dart';

final List<Lesson> socEmailLessons = [
  Lesson(
    title: "Anatomy of an Email: Reading the Headers",
    estimatedMinutes: 20,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Why Email Is Still the Front Door",
        body:
            "Email remains the most common way attackers reach people. It "
            "is cheap to send in bulk, easy to target, and it needs only "
            "one person to make one mistake. For a SOC analyst, that makes "
            "email analysis a daily skill rather than a specialty: a large "
            "share of the alerts and user reports you handle will begin "
            "with a message.\n"
            "\n"
            "The good news is that every email carries a built-in record of"
            " where it came from and how it traveled. Learning to read that"
            " record, the headers, lets you judge a message on evidence "
            "instead of on how convincing it looks. Attackers can make the "
            "visible part of a message look perfect. They have far less "
            "control over the hidden part.",
      ),
      LessonSection(
        heading: "What You See and What Is Really There",
        body:
            "An email has two layers. The visible layer is what the user "
            "reads: the display name, the subject, the body and any links "
            "or attachments. The hidden layer is the header block, which "
            "records the routing, the authentication results and the true "
            "addresses involved.\n"
            "\n"
            "The key lesson is that the visible sender can be set to almost"
            " anything. A display name of \"Finance Director\" costs the "
            "attacker nothing. The header fields are where inconsistencies "
            "between what the message claims and what actually happened "
            "give the attacker away.",
      ),
      LessonSection(
        heading: "The Header Fields That Matter Most",
        body:
            "Headers can run to dozens of lines. In practice, a handful "
            "tell you most of what you need.",
        bullets: [
          "From: the address and display name shown to the user. Easily "
          "forged and the first thing to question.",
          "Return-Path (the envelope sender): where bounces go. "
          "Frequently differs from From in bulk and malicious mail.",
          "Reply-To: where your reply will actually go. A different "
          "domain here is a classic sign of fraud.",
          "Received: one line added by each server that handled the "
          "message. The chain shows the real path.",
          "Message-ID: a unique identifier. Its domain should usually "
          "match the sender's infrastructure.",
          "Authentication-Results: the receiving server's verdict on SPF,"
          " DKIM and DMARC.",
          "X-Originating-IP or similar: sometimes reveals the sending "
          "client's address.",
          "Date: compare it with the Received timestamps; large "
          "mismatches are suspicious.",
        ],
      ),
      LessonSection(
        heading: "How to Get the Raw Headers",
        body:
            "You cannot analyze what you cannot see, and mail clients hide "
            "headers by default. Where to find the full headers depends on "
            "the client, but the principle is the same everywhere: open the"
            " message properties or source, not the pretty view. Better "
            "still, ask the user to forward the original as an attachment "
            "(an .eml or .msg file), which preserves the headers and the "
            "attachments exactly.",
        bullets: [
          "Outlook desktop: open the message in its own window, then "
          "File, Properties, and read the Internet headers box. Or save "
          "the message as an .msg or .eml file.",
          "Outlook on the web and Microsoft 365: the three dots menu, "
          "View, then View message details.",
          "Gmail: the three dots menu on the message, then Show original.",
          "Apple Mail: View, Message, All Headers (or Raw Source).",
          "Thunderbird: View, Headers, All, or View Source.",
          "From the mail platform or gateway: most security tools let the"
          " analyst download the original message or run a message trace "
          "without asking the user at all.",
        ],
      ),
      LessonSection(
        heading: "Where to Focus First: A Header Triage Order",
        body:
            "Headers are long and mostly boring. The skill is knowing where"
            " to look first so you reach a verdict quickly. A practical "
            "order is:",
        bullets: [
          "1. Authentication-Results: did SPF, DKIM and DMARC pass, and "
          "for which domains? Note the domains named, not just the word "
          "pass.",
          "2. The three sender fields side by side: From (what the user "
          "sees), Return-Path (the envelope sender) and Reply-To (where "
          "answers go). Do they belong to the same organization? "
          "Mismatches deserve a reason.",
          "3. The first external Received hop: the IP address and server "
          "name where the message entered the chain from outside. "
          "Reputation, country, hosting provider and whether it fits the "
          "sender.",
          "4. The domains themselves: age, registration, similarity to a "
          "real brand (see the OSINT checks in the next lesson).",
          "5. DKIM-Signature: the d= value shows who signed the message. "
          "A signature by an unrelated domain is a flag.",
          "6. Vendor verdict headers: your own gateway or cloud platform "
          "adds spam and phishing scores. In Microsoft 365, for example, "
          "X-Forefront-Antispam-Report carries values such as the spam "
          "confidence level, and the composite authentication result is "
          "shown as compauth.",
          "7. Thread headers (In-Reply-To, References) and timestamps: a "
          "reply inside a conversation the sender was never part of can "
          "mean a hijacked thread.",
          "8. Content headers: Content-Type and attachment names, to see "
          "what the message carries before opening anything.",
        ],
      ),
      LessonSection(
        heading: "Reading the Authentication-Results Line",
        isTemplate: true,
        body:
            "ANNOTATED EXAMPLE (fictional)\n"
            "\n"
            "Authentication-Results: mx.contoso-demo.example;\n"
            "  spf=pass smtp.mailfrom=bulkrelay.example;\n"
            "  dkim=fail header.d=c0ntoso-demo.example;\n"
            "  dmarc=fail header.from=c0ntoso-demo.example;\n"
            "  compauth=fail reason=000\n"
            "\n"
            "HOW TO READ IT\n"
            "\n"
            "- spf=pass smtp.mailfrom=bulkrelay.example: SPF passed, but "
            "for the relay's domain, not the From domain. It proves almost "
            "nothing about the brand being claimed.\n"
            "- dkim=fail header.d=c0ntoso-demo.example: the signature was "
            "present but did not validate. Possible tampering or a forged "
            "signature.\n"
            "- dmarc=fail header.from=c0ntoso-demo.example: the visible "
            "From domain did not align with any passing check. This is the "
            "line that matters most.\n"
            "- compauth=fail: the platform's composite verdict agrees.\n"
            "\n"
            "ANALYST CHECKLIST FOR THIS LINE: which domains were checked, "
            "do they match the visible sender, and what did the platform "
            "decide to do with the message? A message can still be "
            "delivered despite failing, depending on policy.",
      ),
      LessonSection(
        heading: "Other Headers That Add Evidence",
        body:
            "Beyond the core set, these fields often confirm or contradict "
            "your first impression:",
        bullets: [
          "ARC headers (Authenticated Received Chain): added by "
          "forwarders and mailing lists to preserve the original "
          "authentication results. They explain why legitimate forwarded "
          "mail sometimes fails SPF.",
          "MIME-Version, Content-Type and boundary: show whether the "
          "message is plain text, HTML, multipart, and which attachment "
          "types it carries. Unusual nesting, such as an .eml inside an "
          ".eml, is worth noting.",
          "X-Mailer or User-Agent: the sending software. A message "
          "claiming to be from an executive but sent with a bulk-mailing "
          "tool is a mismatch.",
          "List-Unsubscribe: normal for newsletters, odd for a personal "
          "request from a colleague.",
          "Message-ID: the domain after the @ should generally fit the "
          "sending system. Messages from one campaign often share "
          "patterns.",
          "Date and Received timestamps: compare time zones and look for "
          "implausible gaps or a send time that does not fit the claimed "
          "sender's day.",
          "X-Originating-IP and similar: sometimes reveals the user's "
          "actual IP, which can show a compromised real account sending "
          "from an unexpected place.",
        ],
      ),
      LessonSection(
        heading: "Why Legitimate Mail Sometimes Fails Checks",
        body:
            "Do not treat every failure as an attack. Forwarding rewrites "
            "the path and breaks SPF. Mailing lists change the message and "
            "break DKIM. Third-party senders (marketing, ticketing, "
            "invoicing platforms) sending on behalf of a company may not be"
            " authorized in the company's records. The question to ask is "
            "not just whether a check failed, but whether the failure has "
            "an innocent explanation that the other evidence supports.",
      ),
      LessonSection(
        heading: "Header Review Checklist",
        isTemplate: true,
        body:
            "HEADER REVIEW CHECKLIST (copy into the ticket)\n"
            "\n"
            "[ ] Original message saved as .eml or .msg\n"
            "[ ] SPF, DKIM, DMARC results noted with the domains involved\n"
            "[ ] From / Return-Path / Reply-To compared\n"
            "[ ] First external hop IP and server checked (reputation, "
            "country, hosting)\n"
            "[ ] Sender domain age and lookalike check done\n"
            "[ ] DKIM d= domain compared with the From domain\n"
            "[ ] Platform verdict headers read (spam score, composite "
            "authentication)\n"
            "[ ] Thread headers checked if it looks like a reply\n"
            "[ ] Attachment and link inventory written down\n"
            "[ ] Recipients list captured before purging\n"
            "\n"
            "CONCLUSION: legitimate / suspicious / malicious, with the two "
            "or three facts that decided it.",
      ),
      LessonSection(
        heading: "Reading the Received Chain",
        body:
            "Each server that handles the message adds a Received line at "
            "the top. That means the chain reads from the bottom upward: "
            "the lowest line is the first hop, closest to the sender, and "
            "the top line is your own mail system.\n"
            "\n"
            "Look for the first external hop, the point where the message "
            "entered the chain from outside. Check its IP address against "
            "your threat intelligence and against the sender's claimed "
            "organization. A message that says it is from a major bank but "
            "first appeared from a residential address in another country, "
            "or from a cheap hosting provider, deserves close attention. "
            "Remember that lines below the first server you trust can be "
            "faked by the sender, so the hops you control are the most "
            "reliable.",
      ),
      LessonSection(
        heading: "SPF, DKIM and DMARC in Plain Language",
        body:
            "Three checks help receivers decide whether a message really "
            "came from the domain it claims. Knowing what each proves, and "
            "what it does not, avoids both over- and under-reacting.",
        bullets: [
          "SPF (Sender Policy Framework): checks whether the sending "
          "server's IP address is allowed to send mail for the envelope "
          "domain. It validates the Return-Path domain, not the visible "
          "From address.",
          "DKIM (DomainKeys Identified Mail): a cryptographic signature "
          "added by the sending domain, proving the message was not "
          "altered in transit and that the signing domain authorized it.",
          "DMARC: ties it together. It checks that the domain in the "
          "visible From address aligns with the SPF or DKIM domain that "
          "passed, and tells receivers what to do on failure: nothing "
          "(none), quarantine or reject.",
          "Pass does not mean safe. An attacker can register a lookalike "
          "domain, set up SPF and DKIM correctly, and pass all three "
          "checks. Authentication proves the mail came from that domain, "
          "not that the domain is trustworthy.",
          "Fail does not always mean malicious. Misconfigured legitimate "
          "senders, mailing lists and forwarding can break "
          "authentication.",
        ],
      ),
      LessonSection(
        heading: "Spoofing, Lookalikes and Display Name Tricks",
        body:
            "Attackers use several ways to make a sender look right:",
        bullets: [
          "Direct spoofing: forging the From address of a real domain. "
          "DMARC enforcement largely stops this for domains that use it.",
          "Lookalike domains: contoso-demo.example versus "
          "c0ntoso-demo.example, or adding a word such as "
          "contoso-demo-support.example.",
          "Homoglyphs: swapping characters that look alike, such as a "
          "Cyrillic letter for a Latin one, or \"rn\" for \"m\".",
          "Display name spoofing: using a trusted person's name with an "
          "unrelated address. On a phone, only the name may be visible.",
          "Compromised real accounts: mail from a genuine, authenticated "
          "mailbox that an attacker has taken over. The hardest to spot, "
          "and a common route in business email compromise.",
        ],
      ),
      LessonSection(
        heading: "A Worked Example of a Header Review",
        isTemplate: true,
        body:
            "SAMPLE HEADERS (shortened, fictional)\n"
            "\n"
            "From: \"Finance Director\" <accounts@c0ntoso-demo.example>\n"
            "Reply-To: payments.desk@mailhub-secure.example\n"
            "Return-Path: <bounce@bulkrelay.example>\n"
            "Received: from mail.contoso-demo.example (our gateway) ...\n"
            "Received: from vps-2291.cheaphost.example (203.0.113.55) ...\n"
            "Authentication-Results: spf=pass (bulkrelay.example); "
            "dkim=none; dmarc=fail (p=none)\n"
            "Subject: Urgent: updated bank details for vendor payment\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. The From domain has a zero instead of the letter o. A "
            "lookalike.\n"
            "2. Reply-To points to a third, unrelated domain. Replies would"
            " go elsewhere.\n"
            "3. The first external hop is a cheap hosting server, not a "
            "real mail provider.\n"
            "4. SPF passed, but only for bulkrelay.example, which does not "
            "match the From domain. This is why DMARC failed. Passing one "
            "check proved nothing.\n"
            "5. dmarc=fail with policy p=none means the receiver was told "
            "to deliver anyway. The domain owner does not enforce the "
            "policy.\n"
            "\n"
            "CONCLUSION: Strong indicators of a fraudulent vendor-payment "
            "email (a business email compromise attempt). Check who else "
            "received it and whether anyone replied.",
      ),
      LessonSection(
        heading: "Safe Handling When You Analyze a Message",
        body:
            "Treat every suspicious message as potentially dangerous.",
        bullets: [
          "Work from the original message saved as a file or a forwarded "
          "attachment, not by clicking inside a live mailbox.",
          "Do not open attachments or follow links on your normal "
          "workstation. Use a sandbox or analysis environment.",
          "Do not reply to the sender or call numbers given in the "
          "message.",
          "Record the message ID, the headers and the recipients before "
          "anything is deleted, so you keep evidence.",
          "Verify the sender through a separate, trusted channel if the "
          "message claims to come from someone you know.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Links, Attachments and QR Codes",
    estimatedMinutes: 22,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Where the Payload Hides",
        body:
            "Most phishing aims to get one of three things: a click on a "
            "link, an opened attachment, or a reply. Each of these has its "
            "own analysis skills. A link usually leads to a page that "
            "steals credentials or delivers malware. An attachment can run "
            "code or contain a link of its own. A reply can start a "
            "conversation that ends in fraud.\n"
            "\n"
            "The analyst's job is to find out safely what the link or file "
            "does, to find everyone else who received or opened it, and to "
            "decide what to block. You almost never need to detonate "
            "anything on a real machine.",
      ),
      LessonSection(
        heading: "Reading a URL Properly",
        body:
            "A URL has several parts, and attackers rely on readers not "
            "looking beyond the first few words. A simplified structure is:"
            " scheme, then optional user information, then host, then path,"
            " then query. The part that decides who really controls the "
            "page is the registered domain within the host, which is the "
            "last two labels before the first single slash (and sometimes "
            "three, such as co.uk).",
        bullets: [
          "https://login.contoso-demo.example.attacker-site.example/signin"
          " : the real domain is attacker-site.example. The words before "
          "it are just subdomains the attacker chose.",
          "https://contoso-demo.example@attacker-site.example/ : "
          "everything before the @ is user information; the real host is "
          "after it.",
          "https://contoso-demo.example.verify-account.example/ : looks "
          "right at a glance, but the registered domain is "
          "verify-account.example.",
          "Long encoded query strings are often tracking or redirect "
          "data. Note them and do not guess.",
          "Punycode (starting xn--) can encode lookalike characters from "
          "other alphabets. Check the decoded form.",
        ],
      ),
      LessonSection(
        heading: "Shorteners, Redirectors and Trusted Platforms",
        body:
            "Attackers hide the final destination behind layers. Link "
            "shorteners and open redirectors on legitimate sites make a "
            "malicious address start with a trusted name. Legitimate cloud "
            "services, file sharing, form builders and document platforms "
            "are also widely abused, so a link to a trusted brand is not "
            "automatically safe.\n"
            "\n"
            "The right approach is to follow the chain safely: use a URL "
            "expansion or analysis service, or a sandboxed browser, and "
            "record every hop until the final page. Each hop is an "
            "indicator you can search for and block.",
      ),
      LessonSection(
        heading: "Safe Ways to Examine a Link",
        body:
            "You can learn a great deal without ever loading the page on a "
            "corporate machine.",
        bullets: [
          "Check the reputation of the domain and URL in your "
          "intelligence sources and in public analysis services.",
          "Look up the domain age and registration. Newly registered "
          "domains are a strong warning sign.",
          "Use a URL analysis sandbox that renders the page in an "
          "isolated environment and shows screenshots, redirects and "
          "requests.",
          "Check certificates: a free certificate on a brand-new domain "
          "is common for phishing, but also for legitimate sites, so use "
          "it only as supporting evidence.",
          "Search your proxy, DNS and email logs for the domain, to see "
          "who else received or visited it.",
        ],
      ),
      LessonSection(
        heading: "Free OSINT Tools by Question",
        body:
            "OSINT means open-source intelligence: information gathered "
            "from public sources. These services let an analyst answer most"
            " first-pass questions without special licenses. Availability, "
            "limits and free-tier terms change, so check each one's current"
            " policy, and use only the tools your organization has "
            "approved.",
        bullets: [
          "Header parsing: Google Admin Toolbox Messageheader "
          "(toolbox.googleapps.com/apps/messageheader), MXToolbox Email "
          "Header Analyzer (mxtoolbox.com/EmailHeaders.aspx), and "
          "Microsoft's Message Header Analyzer. They sort the Received "
          "hops and show delays.",
          "Domain and mail records: MXToolbox for SPF, DKIM, DMARC, MX "
          "and blacklist lookups; DMARC record checkers; ICANN Lookup "
          "(lookup.icann.org) for registration data over RDAP; the dig "
          "and nslookup commands.",
          "Domain age and history: WHOIS or RDAP records, passive DNS "
          "services and SecurityTrails or ViewDNS-style lookups for "
          "earlier hosting and neighboring domains.",
          "Certificates: crt.sh (certificate transparency search) shows "
          "when certificates were issued for a domain and which similar "
          "names exist.",
          "IP reputation and context: AbuseIPDB, Cisco Talos Intelligence"
          " reputation lookup, AlienVault OTX, and GreyNoise for "
          "separating background internet noise from targeted activity.",
          "Exposure and hosting: Shodan and Censys show what a server "
          "exposes and what else lives on the same address.",
          "URL and file reputation: VirusTotal (aggregates many engines "
          "and community comments), URLhaus and MalwareBazaar from "
          "abuse.ch, PhishTank, OpenPhish.",
          "URL rendering: urlscan.io loads a page in a remote browser and"
          " returns screenshots, redirects, requests and the DOM.",
          "Lookalike discovery: dnstwist (open source) generates "
          "permutations of your domain and checks which are registered.",
          "Credential exposure: Have I Been Pwned for checking whether an"
          " address appears in known breaches.",
          "Decoding: CyberChef (GCHQ, open source) for Base64, URL "
          "decoding, extracting URLs and other quick transformations.",
        ],
      ),
      LessonSection(
        heading: "Free Online Sandboxes",
        body:
            "A sandbox runs the file or URL for you in an isolated machine "
            "and reports what it did. Several services offer free or "
            "community tiers.",
        bullets: [
          "Hybrid Analysis: free file and URL analysis with behavior "
          "reports and indicators.",
          "ANY.RUN: interactive sandbox where you can watch and click "
          "inside the virtual machine; the free tier makes submissions "
          "public.",
          "Joe Sandbox (community/cloud): detailed reports for documents,"
          " scripts and URLs.",
          "Triage (tria.ge): quick behavioral reports with extracted "
          "configurations for common malware families.",
          "urlscan.io: strictly for URLs and web pages rather than files.",
          "VirusTotal: not a sandbox as such but shows behavior reports "
          "from partner sandboxes along with engine detections.",
        ],
      ),
      LessonSection(
        heading: "Open-Source and Self-Hosted Tools",
        body:
            "Teams that cannot send material to public services, or who "
            "want full control, run their own tools. None of these needs a "
            "commercial license, but each needs setup and upkeep.",
        bullets: [
          "CAPEv2: an actively maintained successor to Cuckoo. Runs "
          "Windows guest machines, extracts malware configurations, good "
          "for production analysis.",
          "DRAKVUF Sandbox (CERT Polska): analysis at hypervisor level, "
          "useful against evasive samples, needs specific hardware and "
          "expertise.",
          "Cuckoo Sandbox: the original open-source sandbox. Its main "
          "project has been dormant for years, so it suits legacy setups "
          "and learning rather than new deployments.",
          "Lookyloo (CIRCL): open-source web capture tool that records a "
          "page's redirects and resources for analysis.",
          "MISP: an open-source platform for storing and sharing "
          "indicators between teams and organizations.",
          "TheHive and Cortex: open-source case management with analyzers"
          " that automate lookups against many of the services above.",
          "oletools (such as olevba), Didier Stevens' pdfid and "
          "pdf-parser, and YARA rules: static analysis of Office macros, "
          "PDFs and patterns, without running anything.",
        ],
      ),
      LessonSection(
        heading: "A Confidentiality Warning About Public Services",
        body:
            "Submitting a file or URL to a public service can share it with"
            " the world. Many free tiers publish submissions, and other "
            "people, including the attacker, can search for them. This can "
            "alert the attacker that you have found their campaign, and it "
            "can leak the sensitive content of a real internal document "
            "that happens to be attached.\n"
            "\n"
            "Rules of thumb: never upload files that may contain customer "
            "or company data; use private or paid submission options if "
            "your organization has them; check a hash first, since looking "
            "up a hash does not upload the file; and follow your "
            "organization's policy on which services are approved.",
      ),
      LessonSection(
        heading: "A Ten-Minute OSINT Routine",
        body:
            "When time is short, a consistent routine keeps you from "
            "skipping steps:",
        bullets: [
          "Minute 0 to 2: parse the headers and note the authentication "
          "results, sender fields and first external hop.",
          "Minute 2 to 4: check the sender and link domains for age, "
          "registrar and lookalikes.",
          "Minute 4 to 6: check IPs and URLs for reputation and render "
          "the page with a URL scanner.",
          "Minute 6 to 8: hash the attachment, look the hash up, and "
          "submit to the approved sandbox if it is not known.",
          "Minute 8 to 10: search your own logs for the same sender, URL "
          "and hash, write down the indicators, and decide: benign, "
          "suspicious or malicious.",
        ],
      ),
      LessonSection(
        heading: "What OSINT Cannot Tell You",
        body:
            "Open sources are fast but imperfect. A clean result means "
            "unknown, not safe, especially for new infrastructure. "
            "Reputation lists lag behind attackers, whose domains may live "
            "for only hours or days. A sandbox can be evaded by malware "
            "that waits or checks for analysis environments. And the "
            "reverse also happens: a shared hosting address may be flagged "
            "because of another tenant. Combine OSINT with your own logs, "
            "with context about the user and asset, and with a clear "
            "reasoned conclusion.",
      ),
      LessonSection(
        heading: "Attachments: The Common Types",
        body:
            "Know what each file type can do before you decide how worrying"
            " it is.",
        bullets: [
          "Office documents with macros: code that runs when the user "
          "enables editing. Historically very common.",
          "PDFs: often just carry a link or a QR code, rarely code "
          "themselves.",
          "Archives (ZIP, RAR) and disk images (ISO, IMG): used to hide "
          "the real file inside. Password-protected archives avoid "
          "scanning, with the password given in the message body.",
          "Shortcut files (LNK) and scripts (JS, VBS, PowerShell, HTA): "
          "run commands directly when opened.",
          "HTML attachments: either a fake login page stored locally, or "
          "a file that assembles malware in the browser, often called "
          "HTML smuggling.",
          "Executable files and installers: obvious, but sometimes "
          "renamed with a double extension such as invoice.pdf.exe.",
        ],
      ),
      LessonSection(
        heading: "Static and Dynamic Analysis, Without the Jargon",
        body:
            "Static analysis means examining a file without running it: its"
            " type, its hash, its strings, its embedded links, its "
            "metadata. A hash of the file can be looked up against "
            "known-bad databases in seconds, and is also how you search for"
            " every other copy in the company.\n"
            "\n"
            "Dynamic analysis means running it in a sandbox and watching "
            "what it does: which processes start, which files change, which"
            " addresses it contacts. For an L1 analyst the practical "
            "routine is: take the hash, look it up, submit the file or URL "
            "to the approved sandbox, read the report, and write down the "
            "indicators. Never open an unknown file on your own workstation"
            " to see what happens.",
      ),
      LessonSection(
        heading: "QR Codes: Phishing That Skips Your Email Filter",
        body:
            "A QR code in an email, a PDF or a physical poster hides its "
            "destination from the reader and from many security tools, "
            "which see only an image. It also moves the victim from a "
            "protected work computer to a personal phone that has fewer "
            "defenses. Attackers call this quishing.\n"
            "\n"
            "The safe approach is to decode the QR code in a controlled "
            "analysis tool, not by scanning with a phone, and then treat "
            "the address like any other URL. In the investigation exercise "
            "on the lobby poster you saw this on a wall. The same logic "
            "applies to codes inside emails.",
      ),
      LessonSection(
        heading: "A Sample Analysis Note",
        isTemplate: true,
        body:
            "SAMPLE ANALYSIS NOTE\n"
            "\n"
            "ITEM: Email \"Invoice 4471 attached\", 4 recipients\n"
            "ATTACHMENT: Invoice_4471.html (38 KB)\n"
            "HASH (SHA-256): 9f2c... [shortened]; no match in reputation "
            "sources\n"
            "SANDBOX RESULT: Page mimics SSO login; form posts credentials "
            "to https://collect.cdn-sync.example/p\n"
            "DOMAIN AGE: collect.cdn-sync.example registered 2 days ago\n"
            "OTHER RECIPIENTS: 4 internal, 1 opened (proxy shows POST to "
            "the collection domain)\n"
            "INDICATORS TO BLOCK: sender domain, collection domain, "
            "attachment hash\n"
            "ASSESSMENT: Credential-harvesting phishing; 1 user submitted "
            "credentials",
      ),
      LessonSection(
        heading: "What Not to Do",
        body:
            "A few well-meant actions cause harm, so avoid them:",
        bullets: [
          "Do not click \"unsubscribe\" or reply to confirm the address is "
          "live.",
          "Do not forward the live suspicious message widely. Share the "
          "evidence in a safe form.",
          "Do not rely on a single reputation result. No result means "
          "unknown, not safe.",
          "Do not delete evidence before you have saved the message, "
          "headers and recipient list.",
          "Do not share indicators outside the company without approval.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Phishing Types and What the Attacker Wants",
    estimatedMinutes: 14,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Start With the Goal, Not the Label",
        body:
            "There are many names for phishing, and the labels can be "
            "confusing. A more useful question is always: what does the "
            "attacker want from this? The answer shapes how urgent the case"
            " is and what you need to check next. Broadly, the goals are to"
            " steal credentials, to deliver malware, to trick someone into "
            "sending money or data, to gain access through a consent or "
            "approval, or simply to gather information for a later attack.",
      ),
      LessonSection(
        heading: "The Main Types",
        body:
            "These are the types an L1 analyst meets most often, with the "
            "typical ATT&CK mapping alongside.",
        bullets: [
          "Bulk phishing: millions of identical messages, low effort. "
          "Often credentials or malware. T1566.",
          "Spear phishing: targeted at one person or group, using "
          "personal details. Attachment is T1566.001, link is T1566.002.",
          "Whaling: spear phishing aimed at executives, usually to "
          "authorize payments or reveal data.",
          "Business email compromise (BEC): fraud by email, often with no"
          " link or attachment at all, using impersonation or a hijacked "
          "mailbox. Relates to T1078 and T1114.003 when mailbox rules are"
          " used.",
          "Vendor email compromise: a real supplier's mailbox is taken "
          "over and used to send altered bank details to the customer.",
          "Consent phishing: a link that asks the user to grant an app "
          "access to their mailbox or files, bypassing the password and "
          "often MFA. T1528.",
          "Phishing via a service: messages through collaboration, social"
          " or file-sharing platforms. T1566.003.",
          "Phishing for information: asking questions to learn about the "
          "organization for later use. T1598.",
          "Quishing, smishing and vishing: QR codes, text messages and "
          "phone calls, sometimes combined with email as a lead-in.",
        ],
      ),
      LessonSection(
        heading: "Credential Harvesting: The Fake Login Page",
        body:
            "The most common goal is a fake sign-in page. It copies the "
            "real login, collects the username and password, then often "
            "redirects to the real site so the user suspects nothing. "
            "Modern kits also relay the real sign-in in the background to "
            "capture the session cookie after MFA, which is why MFA alone "
            "does not make an account immune.\n"
            "\n"
            "When a user has entered credentials, the incident is not about"
            " the email any more. It is about an account that must be "
            "treated as compromised, so the response moves straight to "
            "resetting credentials, revoking sessions and reviewing what "
            "the attacker did.",
      ),
      LessonSection(
        heading: "Malware Delivery",
        body:
            "Here the attacker wants code running on a device. The typical "
            "chain is: attachment or link, user action, first-stage script,"
            " download of a further tool, persistence, then credential "
            "theft and movement. Your key questions are whether anyone "
            "opened the file, whether the endpoint tool recorded unusual "
            "child processes, and whether the device has made outbound "
            "connections to new destinations.\n"
            "\n"
            "If the answers point to execution, the case becomes an "
            "endpoint incident. Isolate the device, collect the evidence "
            "and scope how far it spread, using the same approach as in the"
            " lateral movement scenario.",
      ),
      LessonSection(
        heading: "Business Email Compromise and Payment Fraud",
        body:
            "BEC is often the most expensive form of email fraud, and it "
            "often looks the least technical. There may be no malware, no "
            "link and no attachment. The message simply asks for an urgent "
            "change of bank details, a gift-card purchase or a confidential"
            " payment. Success depends on authority, urgency and secrecy.\n"
            "\n"
            "Signals to look for include a new or changed payment "
            "instruction, pressure to avoid normal approvals, a Reply-To "
            "that differs from the sender, a lookalike domain, or a genuine"
            " account that has recently had a sign-in from somewhere new "
            "together with a new inbox rule. The most effective control is "
            "not technical: a rule that any change of payment details must "
            "be verified by phone using a number already on file.",
      ),
      LessonSection(
        heading: "Consent Phishing and Malicious Apps",
        body:
            "In consent phishing, the link leads to a genuine login page of"
            " a real provider, which then asks the user to approve an "
            "application's access to their data. The user signs in on the "
            "real site, so nothing looks wrong. If they click accept, the "
            "attacker's app gets a token and can read mail or files without"
            " needing the password again.\n"
            "\n"
            "This is why one question belongs in every suspected phishing "
            "check: have any new applications been granted access to this "
            "account? Removing the app's consent, and revoking its tokens, "
            "is part of the containment. Changing the password alone does "
            "not remove it.",
      ),
      LessonSection(
        heading: "Telling Real Threats From Noise",
        body:
            "Many reported messages turn out to be harmless: marketing "
            "mail, newsletters, a colleague's unusual but legitimate "
            "request, or a security test. A good analyst treats these as "
            "valuable too. The user was right to ask, and the reply should "
            "say so.\n"
            "\n"
            "Close each report with a clear reason (the headers "
            "authenticate to the real sender, the link goes to a known "
            "supplier, the request was confirmed with the sender by phone)."
            " Notice patterns: if the same legitimate sender keeps being "
            "reported, a banner or training change may help.",
      ),
      LessonSection(
        heading: "Mapping Phishing to the Rest of the Chain",
        body:
            "Phishing is usually step one. Use ATT&CK to ask what follows: "
            "credential access if a login page was used, execution if a "
            "file was opened, persistence if a mailbox rule or app was "
            "added, collection and exfiltration if mail was read or "
            "forwarded. Looking at the next steps is what turns a single "
            "reported email into a properly scoped incident.",
      ),
    ],
  ),
  Lesson(
    title: "Phishing Today: Contemporary Attacks",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "How to Read This Lesson",
        body:
            "Phishing changes quickly, so this lesson describes patterns "
            "reported in 2026 by major security vendors, not a permanent "
            "list. Statistics come from the named vendors' own telemetry "
            "and research and differ in method, so treat the numbers as "
            "indicators of direction rather than exact measures. The aim is"
            " to teach the shape of current attacks so you recognize new "
            "variants. Check the sources named here for the latest figures.",
      ),
      LessonSection(
        heading: "Credential Phishing Still Dominates",
        body:
            "Despite attention on malware, most email threats seek "
            "credentials. Microsoft's Q2 2026 email threat landscape report"
            " found credential phishing made up roughly 94 to 96 percent of"
            " payload-based attacks each month, and malware only 4 to 6 "
            "percent. The target is usually a cloud identity, because a "
            "stolen identity opens mail, files, chat and every connected "
            "application.",
      ),
      LessonSection(
        heading: "Adversary-in-the-Middle Kits and Phishing-as-a-Service",
        body:
            "Phishing-as-a-service lets low-skill criminals rent complete "
            "kits. The most important type is the adversary-in-the-middle "
            "(AiTM) kit, which acts as a reverse proxy between the victim "
            "and the real login page, relaying the password and the "
            "one-time code and stealing the resulting session cookie. This "
            "defeats codes, push approvals and text-message MFA.\n"
            "\n"
            "Microsoft reported disrupting the Tycoon2FA kit in March 2026,"
            " with linked phishing volume falling by about 92 percent from "
            "earlier averages and no single replacement reaching the same "
            "scale in the quarter. The lesson for defenders is that kits "
            "come and go, but the technique remains, and other kits exist. "
            "Control the technique: phishing-resistant MFA, device-bound "
            "sessions and fast session revocation.",
      ),
      LessonSection(
        heading: "QR Codes, CAPTCHA Gates and Odd File Types",
        body:
            "Attackers keep rotating the packaging to dodge filters.",
        bullets: [
          "QR codes inside PDF and Word attachments, and in the email "
          "body, move the real link out of reach of text scanners and the"
          " victim onto a phone. Microsoft reported a surge in QR "
          "phishing in Q1 2026, with the carrier shifting between PDF and"
          " DOC/DOCX in Q2.",
          "CAPTCHA-gated phishing places a real-looking "
          "human-verification step before the fake login, which blocks "
          "automated scanners from reaching the malicious page.",
          "HTML and SVG attachments: Microsoft's Q2 2026 data showed HTML"
          " as the most common attachment type among attacks, and SVG "
          "files rising. These can carry scripts or redirects and run in "
          "the browser.",
          "ICS calendar invites: meeting requests that put a link into "
          "the victim's calendar, with no email click needed. Small but "
          "growing in Microsoft's data.",
          "Nested files and OAuth redirects: for example, an .eml inside "
          "an .eml, with a fake voicemail lure, using a silent sign-in "
          "redirect on a legitimate cloud application to reach a "
          "malicious download, as Microsoft described in a June 2026 "
          "campaign.",
        ],
      ),
      LessonSection(
        heading: "Business Email Compromise Without Links",
        body:
            "BEC increasingly uses nothing but text. Microsoft's Q2 report "
            "highlighted generic conversation-starter messages as the large"
            " majority of initial BEC emails, designed to get a reply and "
            "begin a conversation. It also described an automated campaign "
            "in June that reached tens of thousands of users at over 40,000"
            " organizations within hours, with no links or attachments, "
            "sent through a legitimate bulk email service. There is nothing"
            " for a link scanner to inspect, so detection relies on sender "
            "reputation, behavior, thread context and, above all, human "
            "verification of payment and payroll changes.",
      ),
      LessonSection(
        heading: "Vishing, Teams and the Help Desk",
        body:
            "Attackers are leaving email entirely. Microsoft reported rapid"
            " growth in malicious Microsoft Teams calls and vishing in "
            "2026, often impersonating the help desk or IT support. "
            "CrowdStrike's 2026 threat hunting findings, reported by Dark "
            "Reading in August, said vishing doubled between the second "
            "half of 2025 and the first half of 2026. In the cases "
            "described, the victim is sent to a convincing single-sign-on "
            "page on a mobile device. After capturing credentials and MFA "
            "codes, the attacker registers their own MFA device, which "
            "gives lasting access to every single-sign-on application. In "
            "one example, the attacker authenticated and added a device "
            "within about four minutes.\n"
            "\n"
            "The response is to watch for new MFA device registrations, not"
            " only for suspicious emails, and to make sure mobile devices "
            "are covered by security tooling.",
      ),
      LessonSection(
        heading: "Device Code Phishing and Consent Abuse",
        body:
            "In device code phishing, the attacker starts a legitimate "
            "sign-in on their own device and gets a short code, then "
            "persuades the victim to enter that code on the real provider's"
            " page. The victim signs in properly, even with MFA, and the "
            "attacker's device receives the access token. CrowdStrike "
            "reported about 15 times more device code attacks in the first "
            "half of 2026 than in the second half of 2025. A related "
            "technique is consent phishing, in which the victim approves a "
            "malicious application. In both, the password and MFA were not "
            "bypassed, they were used by the victim for the attacker's "
            "benefit, which is why identity-layer controls matter more than"
            " email filtering.",
      ),
      LessonSection(
        heading: "ClickFix and Fake Verification Pages",
        body:
            "ClickFix attacks show a fake CAPTCHA or error message and "
            "instruct the user to press a key combination and paste a "
            "command, which the user's own hands then run. The result is "
            "often an infostealer or remote access tool. The attack arrives"
            " by email, but more often through search results, malicious "
            "ads and compromised sites. Some vendors report ClickFix as a "
            "leading initial access method in 2026 (for example, "
            "Microsoft's Digital Defense Report is cited as putting it near"
            " half of observed initial access, a figure to verify against "
            "the source). Variants abuse fake software install pages, "
            "shared AI chat conversations and OAuth flows.\n"
            "\n"
            "For analysts, this means looking at the endpoint: a browser or"
            " Explorer launching PowerShell or a command shell with an "
            "encoded or downloaded command is a strong sign. In ATT&CK "
            "terms, this is T1204.004 Malicious Copy and Paste.",
      ),
      LessonSection(
        heading: "Beyond Email: Phishing in Every Channel",
        body:
            "Some vendors estimate that about half of phishing now arrives "
            "outside email, through chat, social media, SMS, search ads and"
            " personal messaging. Browser extensions, session token theft "
            "from infostealer malware, and password logins that bypass "
            "single sign-on add to the picture. A vendor reported that most"
            " phishing domains are active for less than two days, so "
            "blocklists lag. These claims come from vendor telemetry, so "
            "treat them as directional, but the direction is clear: the "
            "email filter is one control among many, and the SOC needs "
            "visibility of identity, endpoint, browser and collaboration "
            "logs as well.",
      ),
      LessonSection(
        heading: "AI in Phishing",
        body:
            "Generative AI has removed the old tells of bad grammar and "
            "awkward phrasing. Attackers use it to write fluent messages in"
            " any language, tailor lures from public information about a "
            "target, and support voice cloning and deepfake video in calls."
            " The practical effect on analysts is that style is no longer "
            "evidence. Focus on the technical and contextual signals: "
            "authentication, infrastructure, request type, and whether the "
            "request follows the verified process. The earlier exercise on "
            "the cloned executive voice is the type of case to expect more "
            "often.",
      ),
      LessonSection(
        heading: "A Modern Chain, Mapped to ATT&CK",
        isTemplate: true,
        body:
            "SAMPLE CHAIN: VISHING TO PERSISTENT CLOUD ACCESS\n"
            "\n"
            "1. Caller poses as IT support and asks the user to fix a "
            "problem.     T1566.004 Spearphishing Voice\n"
            "2. The user is sent to a fake single-sign-on page on a phone."
            "            T1566.002 / AiTM page\n"
            "3. Password and MFA code are relayed; session captured."
            "                    T1539 Steal Web Session Cookie\n"
            "4. Attacker signs in as the user from a new device."
            "                          T1078.004 Valid Accounts: Cloud\n"
            "5. A new MFA device is registered for persistence."
            "                          T1098.005 Device Registration\n"
            "6. Mail is read and a forwarding rule is created."
            "                           T1114.003 Email Forwarding Rule\n"
            "7. A payment-change email goes to Finance from the real "
            "mailbox.          BEC fraud\n"
            "\n"
            "NOTES FOR THE ANALYST\n"
            "- The email filter never saw steps 1 to 5.\n"
            "- Your best detection points: new MFA registration, sign-in "
            "from a new device soon after a help desk call, and the new "
            "mail rule.\n"
            "- Containment: revoke sessions and tokens, remove the "
            "attacker's MFA device and mail rule, reset the password, and "
            "check application consents.",
      ),
      LessonSection(
        heading: "What This Means for Your Daily Work",
        body:
            "Turn the trends into habits:",
        bullets: [
          "Ask where the victim was when they were tricked: email, chat, "
          "phone or browser. The logs you need depend on it.",
          "Always check MFA registrations, mailbox rules and app consents"
          " on any account that interacted with a lure.",
          "Check the endpoint when a user says they pasted something or "
          "opened a verification page.",
          "Treat QR codes, HTML, SVG and calendar invites as payload "
          "carriers, not just PDFs and Office files.",
          "Look beyond links: a reply-only BEC message has no indicators "
          "except behavior and context.",
          "Do not rely on writing quality, brand logos or a padlock to "
          "judge a message.",
          "Refresh your knowledge regularly. Vendor threat reports are "
          "published quarterly and are the quickest way to see what "
          "changed.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "The Phishing Response Workflow",
    estimatedMinutes: 20,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "The Same Seven Stages, Applied to Email",
        body:
            "The investigation workflow from the first chapter applies "
            "directly. A phishing case starts with detection (a user report"
            " or a gateway alert) and runs through triage, classification, "
            "investigation, containment, eradication and reporting. This "
            "lesson turns each stage into specific email checks.",
      ),
      LessonSection(
        heading: "Intake and Triage",
        body:
            "When a report arrives, first make sure you have the original "
            "message, not a screenshot or a plain forward. Confirm who "
            "reported it, what they did with it (opened, clicked, replied, "
            "entered anything) and when it arrived.\n"
            "\n"
            "Then give a quick first judgment: obviously harmless, "
            "obviously malicious, or needs analysis. Even a quick judgment "
            "helps you decide how urgent the case is. If the user entered "
            "credentials or opened an attachment, treat it as a possible "
            "compromise from the start and do not wait for the full "
            "analysis.",
      ),
      LessonSection(
        heading: "Analysis: Questions to Answer",
        body:
            "Work through the same questions each time, and write the "
            "answers into the ticket.",
        bullets: [
          "Who is the sender, and do the headers and authentication "
          "results match the claimed identity?",
          "What is the message trying to get: a click, a file, a reply, a"
          " payment?",
          "What do the links and attachments do, based on safe analysis?",
          "Is the sender, domain, URL or file hash already known as bad, "
          "and when did it first appear in our logs?",
          "Is the sender a known contact or vendor, and could their "
          "account have been compromised?",
          "Does the message relate to anything the recipient was "
          "expecting?",
        ],
      ),
      LessonSection(
        heading: "Scoping: Who Else Got It, and Who Acted?",
        body:
            "Never close a phishing case on a single mailbox. Search for "
            "the same sender, subject, link or file hash across all "
            "mailboxes, and for every recipient work out what happened. A "
            "message delivered to 400 people and opened by 3 is a very "
            "different case from one delivered to 4 people and opened by "
            "all of them.",
        bullets: [
          "Message trace: all recipients of the same sender, subject, URL"
          " or attachment hash.",
          "Mail logs: which recipients opened or interacted, and whether "
          "the message was forwarded internally.",
          "Proxy and DNS logs: who visited the link or domain, and when.",
          "Web log POSTs to the collection domain: who submitted data.",
          "Endpoint telemetry: who opened the attachment, and what "
          "processes started.",
          "Sign-in logs for every affected user, looking back 30 to 90 "
          "days for earlier attempts and forward for any use of stolen "
          "credentials.",
          "Mailbox audit: new inbox rules, forwarding, delegate access "
          "and new app consents on the affected accounts.",
        ],
      ),
      LessonSection(
        heading: "Classifying Severity",
        body:
            "Severity depends on how far the attacker got, not on how "
            "clever the email was. A blocked message with no interactions "
            "is low. A message that reached many people but was clicked by "
            "none is low to medium. One user who submitted credentials is "
            "typically medium to high, and rises quickly if the account is "
            "critical, such as finance, an executive or an administrator. "
            "Confirmed malware execution or fraudulent payments is high.\n"
            "\n"
            "Use your asset and user tags: the same phishing email that "
            "fools a standard user is a different incident if it fools a "
            "payment approver. If in doubt, take the higher level, as in "
            "the severity lesson.",
      ),
      LessonSection(
        heading: "Containment: Stop More People Being Caught",
        body:
            "Containment for phishing has a clear order: stop new exposure "
            "first, then deal with people who were affected.",
        bullets: [
          "Purge or quarantine the message from every mailbox it reached.",
          "Block the sender, the domain, the URL and the file hash at the"
          " gateway, proxy and endpoint tools.",
          "For users who entered credentials: reset the password, revoke "
          "sessions and tokens, and check MFA registrations.",
          "For users who opened an attachment: isolate the device and "
          "start an endpoint investigation.",
          "Remove malicious inbox rules, forwarding and application "
          "consents.",
          "Alert the finance team or relevant owners if payment fraud is "
          "possible.",
        ],
      ),
      LessonSection(
        heading: "Eradication and Recovery",
        body:
            "Make sure nothing is left behind: the persistence mechanisms, "
            "the consents, the forwarding rules and any secondary malware. "
            "Check that the user can sign in cleanly, with MFA "
            "re-registered where needed. Confirm that the blocks you added "
            "do not break legitimate business traffic, and set an expiry or"
            " review date for temporary blocks.\n"
            "\n"
            "Finally, look at why it worked. Was the message delivered "
            "because a rule was missing? Did the user have no way to report"
            " it quickly? Those are the root causes that your report should"
            " name.",
      ),
      LessonSection(
        heading: "Communicating With the Reporter and the Wider Company",
        body:
            "The person who reported the message should always hear back. A"
            " quick, friendly reply that explains what you found encourages"
            " reporting next time. If it was malicious, thank them and say "
            "what you did. If it was harmless, say so, and explain what "
            "made you sure.\n"
            "\n"
            "For wider communication, send a short warning to staff only "
            "when it helps them act, and keep it factual: what the message "
            "looks like, what to do if they received it, and how to report "
            "it. Keep internal technical detail and any unconfirmed theory "
            "out of messages to staff.",
      ),
      LessonSection(
        heading: "Sample Reply to a Reporter and Sample Ticket",
        isTemplate: true,
        body:
            "SAMPLE REPLY TO A USER WHO REPORTED A MESSAGE\n"
            "\n"
            "\"Thank you for reporting this. You were right to be careful. "
            "The email was a fake sign-in request, and we have removed it "
            "from everyone's inbox and blocked the sender. You did not "
            "click the link, so nothing more is needed from you. If you "
            "ever receive something similar, please report it again the "
            "same way.\"\n"
            "\n"
            "SAMPLE TICKET SUMMARY\n"
            "\n"
            "CASE: Credential phishing, fake benefits portal\n"
            "RECEIVED BY: 38 users; OPENED: 9; SUBMITTED CREDENTIALS: 2\n"
            "INDICATORS: sender domain (4 days old), collection domain, "
            "attachment hash\n"
            "ACTIONS: message purged 10:42; domains blocked 10:45; 2 "
            "accounts reset and sessions revoked 10:50; mailbox rules "
            "reviewed (none); 90-day sign-in review done\n"
            "SEVERITY: P2 (one affected user is a payment approver)\n"
            "OPEN ITEMS: awareness reminder to Finance; review why the "
            "gateway delivered the message",
      ),
      LessonSection(
        heading: "What Should Be Reported, and to Whom",
        body:
            "Reporting has several audiences, and each needs a different "
            "slice of the facts. Think of it as three layers: the internal "
            "record, internal escalation and notification, and external "
            "reporting.",
        bullets: [
          "Internal record (the ticket and the incident report): "
          "everything below, with times in UTC.",
          "Internal escalation: the SOC lead or incident manager for any "
          "case with credentials entered, malware executed or money "
          "involved. IT and the system owners for containment actions. "
          "Finance for payment fraud. HR if an employee is involved. "
          "Legal and Compliance for any possible personal-data exposure.",
          "The affected users and the reporter: a short, specific message"
          " on what happened and what, if anything, they must do.",
          "The email provider or gateway vendor: submit the message as "
          "phishing or a false negative, so detection improves for "
          "everyone.",
          "Hosting providers, registrars and platform abuse teams: report"
          " the malicious site or sending account so it can be taken "
          "down. Use the abuse contacts in the domain and IP records.",
          "Community and national channels: sharing indicators with your "
          "sector group, with a national CERT, or with a service such as "
          "PhishTank or the Anti-Phishing Working Group, where your "
          "organization's policy allows.",
          "Regulators and law enforcement: where a breach, fraud loss or "
          "legal duty exists. Legal decides. Rules and deadlines vary by "
          "country and sector. In India, for example, the CERT-In "
          "directions of 2022 require certain cyber incidents to be "
          "reported within six hours of being noticed, so a case with "
          "real impact should go to Compliance quickly to check whether "
          "it qualifies.",
        ],
      ),
      LessonSection(
        heading: "The Contents of a Good Phishing Report",
        isTemplate: true,
        body:
            "SAMPLE REPORT FIELDS\n"
            "\n"
            "1. Case ID, reporter, analyst, times (UTC): received, "
            "reported, triaged, contained, closed.\n"
            "2. Message details: subject, sender (display name, From, "
            "Return-Path, Reply-To), recipients count and list, delivery "
            "time, message ID.\n"
            "3. Authentication: SPF, DKIM, DMARC results with domains; "
            "platform verdict.\n"
            "4. Delivery path: first external hop IP, hosting, country.\n"
            "5. Content analysis: lure theme, call to action, links (full "
            "redirect chain, final URL), attachments (name, type, size, "
            "hash).\n"
            "6. Indicators: sender addresses and domains, URLs, IPs, "
            "hashes, subject patterns, with the first-seen time in our "
            "logs.\n"
            "7. Impact: number who received, opened, clicked, submitted "
            "credentials, ran the file; which users are critical users or "
            "privileged; any mailbox rules, forwarding, app consents or MFA"
            " changes.\n"
            "8. Detection: how it was found (user report, gateway, hunt) "
            "and how long it was live.\n"
            "9. Actions taken with timestamps and owners: purge, blocks, "
            "resets, session revocations, device isolation, notifications.\n"
            "10. Severity, status and open questions.\n"
            "11. Root cause and gaps: why it was delivered, why it was "
            "clicked.\n"
            "12. Recommendations: owner and due date for each.\n"
            "13. ATT&CK techniques observed, with the evidence for each.",
      ),
      LessonSection(
        heading: "What Not to Include",
        body:
            "Equally important is what stays out of wider reports: "
            "unconfirmed theories stated as fact, personal blame for the "
            "person who clicked, full employee personal data beyond what is"
            " needed, raw credentials or tokens, and live malicious links "
            "that someone might click. Defang indicators when sharing "
            "(write hxxps and square brackets around dots) so that a report"
            " cannot become a delivery mechanism.",
      ),
      LessonSection(
        heading: "Measuring Whether You Are Getting Better",
        body:
            "A few simple numbers show whether the process works: how long "
            "from first delivery to purge, how long from user report to "
            "analyst reply, how many users interacted before containment, "
            "the share of reports that were real, and the number of repeat "
            "victims. Track them over time and use them to justify changes,"
            " such as better filtering or a faster reporting button.",
      ),
    ],
  ),
  Lesson(
    title: "Email Defenses and Reducing the Risk",
    estimatedMinutes: 24,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "Layers, Because No Single Control Is Enough",
        body:
            "No filter stops everything, no training makes every user "
            "perfect, and no policy catches every trick. Real protection "
            "comes from layers: a message must slip past the gateway, fool "
            "the user, defeat identity controls and then evade endpoint "
            "detection before it does harm. The SOC's job is partly to run "
            "those layers and partly to make sure each one is measured and "
            "tuned.",
      ),
      LessonSection(
        heading: "What Organizations Actually Use: Categories of Email Security "
                 "Tools",
        body:
            "Most organizations combine several kinds of tool. The names of"
            " products change, but the categories are stable.",
        bullets: [
          "Built-in suite protection: the filtering and anti-phishing "
          "features that come with the email platform (for example, "
          "Microsoft Defender for Office 365 or Google Workspace security"
          " settings).",
          "Secure email gateways (SEGs): a filtering service that sits in"
          " the mail path, usually by MX record, and scans mail before "
          "delivery.",
          "Integrated or API-based email security: a service connected to"
          " the mailbox platform through its API, which scans after "
          "delivery and can remove messages, and adds behavioral analysis"
          " of normal communication patterns.",
          "URL protection: time-of-click checking and rewriting of links,"
          " and attachment sandboxing before delivery.",
          "Authentication and brand protection: DMARC management and "
          "reporting tools, lookalike domain monitoring and takedown "
          "services.",
          "Data protection: data loss prevention and email encryption.",
          "User-facing tools: report-phishing buttons, awareness training"
          " and phishing simulation platforms.",
          "Response automation: SOAR playbooks and XDR features that "
          "purge messages, disable accounts and enrich cases "
          "automatically.",
          "Adjacent controls: endpoint protection (EDR), identity "
          "protection and conditional access, DNS filtering, web proxies "
          "and browser protection.",
        ],
      ),
      LessonSection(
        heading: "Finding Out More Without a Recommendation",
        body:
            "This course does not recommend a particular product. The right"
            " choice depends on your platform, size, budget, risk and "
            "skills. For an independent view of the market, Gartner Peer "
            "Insights publishes verified-customer reviews of email security"
            " products at "
            "https://www.gartner.com/reviews/market/email-security (Gartner"
            " is an analyst firm; these are user reviews and ratings rather"
            " than a formal ranking or an endorsement, and the order shown "
            "on the page changes). Gartner also publishes market research "
            "reports, usually behind a paywall. Use these as one input, "
            "then test shortlisted products against your own mail with a "
            "pilot.",
      ),
      LessonSection(
        heading: "Safe Links, Safe Attachments and Zero-Hour Purge",
        body:
            "Three features appear, under different names, in most modern "
            "products.",
        bullets: [
          "Time-of-click URL protection (Safe Links in Microsoft 365 is "
          "one example): links are checked when the user clicks, not just"
          " when the message arrives. A link that was harmless at "
          "delivery but weaponized an hour later is still caught. Many "
          "products also rewrite the link so that the check happens "
          "through the vendor's service, and so that blocked links are "
          "blocked everywhere the message goes.",
          "Attachment detonation (Safe Attachments is one example): "
          "attachments are opened in a sandbox before the user receives "
          "them. Some products offer dynamic delivery, which sends the "
          "message body immediately and attaches the file once the scan "
          "completes.",
          "Zero-hour auto purge (ZAP in Microsoft 365 is one example): "
          "after delivery, if a message is later identified as malicious,"
          " it is automatically removed from mailboxes that have not yet "
          "read it, or moved to quarantine.",
          "Limits: each of these can be evaded. Links can be safe at scan"
          " time and malicious later through delayed redirects. Content "
          "can be hidden in QR codes, images, password-protected archives"
          " or inside web pages reached after a CAPTCHA, which security "
          "scanners may not pass.",
        ],
      ),
      LessonSection(
        heading: "Best-Practice Blocking Checklist",
        body:
            "A practical set of controls, grouped by layer. Not every item "
            "applies to every organization.",
        bullets: [
          "Authentication: publish SPF and DKIM for every sending domain,"
          " move DMARC to reject after monitoring, and add MTA-STS and "
          "TLS reporting where possible.",
          "Impersonation protection: enable anti-spoofing and "
          "impersonation detection for executives, finance and brands, "
          "using the critical-user list.",
          "External sender tagging: a clear marker on messages from "
          "outside, with a stronger warning on first-time or rarely seen "
          "senders.",
          "Attachment policy: block or sandbox executable and script "
          "types, disk images (ISO, IMG), shortcut files, and by policy "
          "consider HTML, SVG and password-protected archives. Remove "
          "macros from files from the internet by default.",
          "Link policy: time-of-click protection on, no click-through to "
          "blocked URLs, and QR code detection in images and PDFs where "
          "available.",
          "Auto-forwarding: block automatic external forwarding, and "
          "alert on new inbox rules that forward or delete.",
          "Quarantine hygiene: restrict who can release items, and review"
          " releases.",
          "Identity: phishing-resistant MFA (security keys or passkeys) "
          "for administrators and high-risk roles at least; block legacy "
          "authentication; conditional access requiring managed or "
          "compliant devices.",
          "Consent control: require administrator approval for "
          "application consent, limit high-risk permissions, and review "
          "granted apps.",
          "Device code flow: restrict or block it with conditional access"
          " unless there is a business need.",
          "Collaboration tools: restrict external messaging and calls in "
          "chat and meeting platforms to approved partners, and warn on "
          "external contacts.",
          "Endpoint: attack surface reduction rules that block Office "
          "from spawning scripts, script-engine restrictions, application"
          " control, and EDR in blocking mode.",
          "Browser and DNS: DNS or web filtering that blocks newly "
          "registered domains and known bad categories, and safe browsing"
          " protections.",
          "Process: a mandatory call-back verification for payment detail"
          " changes and urgent transfer requests; a help desk script that"
          " verifies identity before resets or MFA changes.",
          "People: a visible report button, fast replies to reporters, "
          "short role-based training, and simulations that teach rather "
          "than punish.",
          "Detection and response: alerts on MFA device registrations, "
          "new consents, risky sign-ins and impossible travel, with "
          "playbooks to purge and revoke quickly.",
        ],
      ),
      LessonSection(
        heading: "Hardening Against Today's Bypasses",
        body:
            "Some of the most active techniques avoid the email filters "
            "altogether, so email controls need partners:",
        bullets: [
          "Fake CAPTCHA and copy-and-paste attacks: users are told to "
          "paste a command into the Run dialog or a terminal. Train staff"
          " that no legitimate site needs this, and use endpoint controls"
          " that restrict what those programs may launch.",
          "Device code and consent phishing: the user signs in on a real "
          "provider page, so the password and even MFA are not the weak "
          "point. Control consent and device code at the identity layer.",
          "Voice and chat: phone calls and messages in collaboration "
          "tools bypass the mail filter. Give the help desk a strict "
          "identity-verification script and make MFA registration changes"
          " an alertable, reviewed event.",
          "Session theft: after a successful relay, the attacker holds a "
          "valid session. Short session lifetimes, token protection, "
          "device compliance checks and fast session revocation shrink "
          "the window.",
          "Short-lived infrastructure: attacker domains often live for "
          "under two days according to some vendors' data, so blocklists "
          "alone lag. Prefer behavior and age-based rules.",
        ],
      ),
      LessonSection(
        heading: "The Email Gateway and Filtering",
        body:
            "Secure email gateways and built-in cloud filters do the first "
            "and heaviest work. They check reputation, scan attachments, "
            "rewrite and check links at the moment of click, detect "
            "impersonation of your executives and brands, and quarantine "
            "suspicious items. Know what yours can do and what it cannot, "
            "and review the quarantine regularly, since the false positives"
            " and misses in there are your tuning data.",
      ),
      LessonSection(
        heading: "Authentication Policy for Your Own Domains",
        body:
            "Protecting others from spoofing of your domain is a defense "
            "too. Publishing SPF and DKIM records, and moving the DMARC "
            "policy from none to quarantine and then to reject, stops "
            "attackers from sending mail that claims to be from you. The "
            "move is done in stages, watching the DMARC reports, because "
            "legitimate senders such as marketing platforms must be added "
            "first or their mail will be blocked.\n"
            "\n"
            "Also watch for lookalike domains that others register. Domain "
            "monitoring services and certificate transparency logs can warn"
            " you when someone registers a name close to yours.",
      ),
      LessonSection(
        heading: "Protecting the People Most Likely to Be Targeted",
        body:
            "Use the critical user tags from the logs lesson. Executives, "
            "finance, HR and administrators warrant extra protection: "
            "impersonation protection lists, stricter policy for external "
            "mail to those users, and a clear verification procedure for "
            "payment changes. A watchlist of these names lets the gateway "
            "flag any external message that pretends to be one of them.",
      ),
      LessonSection(
        heading: "Make Reporting Easy",
        body:
            "The best detection sensor in the company is a user who notices"
            " something odd, and that works only if reporting is "
            "effortless. A one-click report button in the mail client, an "
            "immediate automatic acknowledgment and a human reply soon "
            "after, all build the habit. Punishing mistakes has the "
            "opposite effect: people hide what they clicked, and the SOC "
            "loses the early warning.",
      ),
      LessonSection(
        heading: "Awareness Training That Actually Works",
        body:
            "Short, frequent, relevant training works better than a long "
            "annual session. Use real examples from your own incidents, "
            "tailored to roles: finance sees payment fraud, HR sees fake "
            "applications with malicious attachments. Phishing simulations "
            "are useful for measuring and practicing, but should be a "
            "teaching tool rather than a trap. Track the report rate as "
            "much as the click rate.",
      ),
      LessonSection(
        heading: "Identity Controls That Limit the Damage",
        body:
            "Assume some phishing will succeed and limit what it can do. "
            "Phishing-resistant MFA, such as hardware security keys or "
            "passkeys, defeats the fake-login techniques that relay "
            "passwords and one-time codes. Conditional access can block "
            "sign-ins from unmanaged devices or unusual places. Restricting"
            " who can approve application consents shuts down consent "
            "phishing. Limiting standing administrative privileges reduces "
            "what a stolen account can reach.",
      ),
      LessonSection(
        heading: "Detections the SOC Should Own",
        body:
            "From the detection lesson, these are good rules to have for "
            "the email area:",
        bullets: [
          "Mailbox rules that forward externally or delete mail, "
          "especially on critical users.",
          "New application consents with broad mail or file permissions.",
          "Sign-ins from new countries or devices shortly after a "
          "phishing delivery.",
          "Many users receiving the same sender or URL in a short time.",
          "Endpoint processes spawned by mail clients or document "
          "readers, such as a script engine launched from an Office "
          "document.",
          "Messages from newly registered or lookalike domains to "
          "critical users.",
        ],
      ),
      LessonSection(
        heading: "A Final Check: The Questions to Ask Every Time",
        body:
            "Before closing any email case, run through this list: Did I "
            "check the headers and authentication? Did I analyze the links "
            "and files safely? Did I find everyone who received it? Did I "
            "check who acted on it? Did I look back 30 to 90 days on "
            "affected users? Did I check for mailbox rules and application "
            "consents? Did I block the indicators and purge the message? "
            "Did I reply to the reporter and record what I learned? If the "
            "answer to all of these is yes, the case is closed properly.",
      ),
    ],
  ),
  Lesson(
    title: "Practice Test: Email and Phishing Analysis",
    estimatedMinutes: 10,
    difficulty: LessonDifficulty.intermediate,
    quiz: [
      QuizQuestion(
        question: "An email's visible From name says \"Finance Director\". What is "
                  "the most reliable way to judge who really sent it?",
        options: [
          "Trust the display name if the message passes through the "
          "company gateway without being blocked or quarantined",
          "Trust the display name if the subject line uses the same "
          "wording as earlier messages from that department",
          "Trust the display name if the writing style and the tone match"
          " the way that person normally writes to staff",
          "Compare the headers with the claim: the From and Return-Path "
          "domains, Reply-To and the first external hop",
        ],
        correctIndex: 3,
        explanation:
            "The visible sender can be set to anything. The header fields "
            "show the real path, and inconsistencies between claim and "
            "routing reveal the fake.",
      ),
      QuizQuestion(
        question: "In which direction should you read the Received lines to "
                  "follow a message's path?",
        options: [
          "Only the middle lines, because the first and last servers are "
          "always added by the sender to hide the route",
          "Bottom to top, because each server adds its line above the "
          "previous ones, so the bottom is the first hop",
          "Alphabetically by server name, since the headers are sorted "
          "that way by every mail system in the same way",
          "Top to bottom, because the top line is the first server that "
          "handled the message after it left the sender",
        ],
        correctIndex: 1,
        explanation:
            "The lowest Received line is closest to the sender and the top "
            "is your own system. Trust the hops you control most.",
      ),
      QuizQuestion(
        question: "A message passes SPF and DKIM. Why is that not proof that it "
                  "is safe?",
        options: [
          "Because an attacker can pass them using their own lookalike "
          "domain; they prove origin, not trustworthiness",
          "Because passing both checks means that the message was sent "
          "from an address that a mail filter has blocked",
          "Because those checks are used only for mail sent inside the "
          "company and have no value for incoming messages",
          "Because SPF and DKIM only test whether the message has an "
          "attachment, and not who the sender really is",
        ],
        correctIndex: 0,
        explanation:
            "Authentication proves the mail came from that domain. A "
            "criminal can register and configure a domain properly, so "
            "passing is not the same as safe.",
      ),
      QuizQuestion(
        question: "What does DMARC add on top of SPF and DKIM?",
        options: [
          "It checks that the visible From domain aligns with the domain "
          "that passed, and sets a policy for failures",
          "It encrypts the message body so that no one on the path can "
          "read it, which stops all forms of phishing attacks",
          "It checks that the visible From domain aligns with the "
          "authenticated domain and tells receivers what to do",
          "It scans attachments for malware and removes macros, so that "
          "opened documents can no longer run harmful code",
        ],
        correctIndex: 2,
        explanation:
            "DMARC links the checks to the From address the user sees and "
            "sets none, quarantine or reject. Without enforcement, the "
            "policy is only advice.",
      ),
      QuizQuestion(
        question: "Which URL really leads to attacker-site.example?",
        options: [
          "https://www.contoso-demo.example/attacker-site.example, "
          "because the name is used as a part of the page path",
          "https://login.contoso-demo.example@attacker-site.example/, "
          "because everything before the @ is user information",
          "https://contoso-demo.example/login?next=attacker-site.example,"
          " because the name appears in the part after the slash",
          "https://attacker-site.example.contoso-demo.example/login, "
          "because the attacker's name comes first in the address",
        ],
        correctIndex: 1,
        explanation:
            "The real host comes after the @, and the registered domain is "
            "the last labels of the host. Names elsewhere in the string are"
            " decoration.",
      ),
      QuizQuestion(
        question: "You receive a suspicious attachment. What is the right way to "
                  "examine it?",
        options: [
          "Forward it to the whole security team so that several people "
          "can open it at once and compare what they see",
          "Ask the sender to confirm that the file is safe, since the "
          "sender is the person who knows most about it",
          "Open it on your own workstation with the network cable "
          "unplugged, so that nothing can communicate outside",
          "Take its hash, look it up, and submit it to the approved "
          "sandbox rather than opening it on a device",
        ],
        correctIndex: 3,
        explanation:
            "Hash lookup and sandbox detonation give you the behavior and "
            "the indicators without risking a real machine.",
      ),
      QuizQuestion(
        question: "What makes QR-code phishing hard for filters to catch?",
        options: [
          "The code is always sent from a trusted domain, so the gateway "
          "has no reason to doubt the mail around it",
          "The destination is hidden in an image, and the victim often "
          "scans it on a personal phone with fewer defenses",
          "The destination hides in an image, and the scan often happens "
          "on a phone with fewer protections in place",
          "The code uses strong encryption that no security tool is able "
          "to decode, even in an isolated analysis tool",
        ],
        correctIndex: 2,
        explanation:
            "Many tools see only a picture, and the phone sits outside "
            "corporate controls. Decode the code safely in an analysis tool"
            " to get the URL.",
      ),
      QuizQuestion(
        question: "A user reports a message but did not click anything. What "
                  "should happen before you close the case?",
        options: [
          "Search for other recipients and interactions, purge and block "
          "it, and reply to the reporter with the outcome",
          "Delete the message from the reporter's mailbox only, because "
          "other mailboxes were not part of the report",
          "Close it right away, since a message that nobody has clicked "
          "cannot be linked to any wider problem at all",
          "Tell the reporter to forget the matter, since replies to users"
          " about their reports only encourage more reports",
        ],
        correctIndex: 0,
        explanation:
            "Phishing is rarely sent to one person. Scoping, purging, "
            "blocking and replying turns a single report into a closed, "
            "useful case.",
      ),
      QuizQuestion(
        question: "A user entered credentials on a fake login page. Which "
                  "response is correct?",
        options: [
          "Wait to see whether the attacker uses the password before "
          "taking action, to avoid disturbing the employee",
          "Delete the email from the inbox and remind the user to be more"
          " careful when they open messages in future",
          "Block the sender's address at the gateway and consider the "
          "case finished, since no more mail will arrive",
          "Reset the password, revoke sessions and tokens, check MFA, "
          "rules and consents, and sign-in history",
        ],
        correctIndex: 3,
        explanation:
            "Once credentials are entered the account is compromised. "
            "Containment must remove the attacker's access and any "
            "persistence.",
      ),
      QuizQuestion(
        question: "Why is changing the password not enough after consent "
                  "phishing?",
        options: [
          "Because the password is stored by the attacker's server and "
          "stays valid until the user clicks a reset link",
          "Because the malicious app holds its own access token, so its "
          "consent must be removed and tokens revoked",
          "Because consent phishing works only on shared accounts, so the"
          " personal password has no part in the attack",
          "Because the attacker will always be able to guess the new "
          "password within minutes of the reset being done",
        ],
        correctIndex: 1,
        explanation:
            "The attacker's app does not need the password. Removing the "
            "consent and revoking tokens is part of containment.",
      ),
      QuizQuestion(
        question: "What is the best control against fraudulent changes of "
                  "supplier bank details?",
        options: [
          "A rule that any change is verified by phone, using a number "
          "already on file, before payment is made",
          "A rule that any change must be verified by phone using a "
          "number already on file, before payment is made",
          "A warning banner on all external email, because users read "
          "banners carefully before they act on a request",
          "Stronger spam filtering, because that alone will remove any "
          "message that asks for payment details to change",
        ],
        correctIndex: 0,
        explanation:
            "BEC often has no malware or link. A non-technical verification"
            " step defeats the pressure, secrecy and urgency attackers "
            "depend on.",
      ),
      QuizQuestion(
        question: "Which statement about DMARC policy p=none is correct?",
        options: [
          "It is the strongest setting and it should be kept permanently,"
          " since stricter settings block genuine mail",
          "It tells receivers to reject every message that fails "
          "authentication, so spoofed mail never reaches an inbox",
          "It tells receivers to take no action on failures; it is a "
          "monitoring stage before quarantine or reject",
          "It tells receivers to take no action on failures, and is a "
          "monitoring stage on the way to quarantine or reject",
        ],
        correctIndex: 2,
        explanation:
            "Policy none provides reports but no protection. Domains "
            "normally move to quarantine and then reject once legitimate "
            "senders are covered.",
      ),
      QuizQuestion(
        question: "Why should user reporting be easy and free of blame?",
        options: [
          "Because blame causes people to hide mistakes, and the SOC then"
          " loses the early warning that reports provide",
          "Because users who fear blame hide what they clicked, and the "
          "SOC loses the early warning from reports",
          "Because users who report more messages will receive larger "
          "bonuses, which makes the awareness campaign cheaper",
          "Because blame is against the law in most countries, so a "
          "company cannot hold anyone responsible for a click",
        ],
        correctIndex: 1,
        explanation:
            "Employees are the best sensors. Quick acknowledgment and "
            "friendly replies build the reporting habit, while punishment "
            "destroys it.",
      ),
      QuizQuestion(
        question: "You open a message's headers. Which item should you read first"
                  " to judge whether the sender is who they claim to be?",
        options: [
          "The X-Mailer line, because it names the person who wrote the "
          "message and where they work in the company",
          "The Date line, because the time a message was sent is the "
          "strongest sign of whether the sender is genuine",
          "Authentication-Results, then From, Return-Path and Reply-To "
          "side by side, and the first external hop",
          "The Subject line, because attackers rarely write subjects that"
          " look like those of real business email",
        ],
        correctIndex: 2,
        explanation:
            "The authentication verdict and the sender fields show whether "
            "the claimed identity matches the routing, and the first "
            "external hop shows where it really came from.",
      ),
      QuizQuestion(
        question: "Why should you avoid uploading an internal-looking attachment "
                  "to a free public sandbox?",
        options: [
          "Free tiers often publish submissions, leaking company data or "
          "warning the attacker; check the hash first",
          "Because uploading a file to any sandbox permanently marks it "
          "as malware in every antivirus database in use",
          "Because public sandboxes cannot open Office files, so the "
          "analysis would be incomplete and misleading",
          "Because free tiers often make submissions public, which can "
          "tip off the attacker or leak real company data",
        ],
        correctIndex: 0,
        explanation:
            "A hash lookup uploads nothing. Use private or approved options"
            " for anything that may contain real data.",
      ),
      QuizQuestion(
        question: "What does time-of-click URL protection (such as Safe Links) "
                  "add that scanning at delivery does not?",
        options: [
          "It guarantees that every website in a rewritten link is safe, "
          "because the vendor has reviewed it by hand",
          "It checks the link when the user clicks, so a link that turned"
          " malicious after delivery is still caught",
          "It deletes every message that contains a link, so that users "
          "are never given the chance to click on one",
          "It checks the link at the moment of the click, so a page that "
          "turned malicious after delivery is caught",
        ],
        correctIndex: 3,
        explanation:
            "Attackers often make a page harmful only after the message has"
            " passed scanning. Checking at click time closes that gap, "
            "though it can still be evaded.",
      ),
      QuizQuestion(
        question: "A user says a website told them to press Win+R and paste a "
                  "command to 'verify you are human'. What is this, and what is "
                  "the first check?",
        options: [
          "A DMARC failure that shows the site's mail records are "
          "misconfigured, so the mail team should be contacted",
          "A ClickFix-style attack; check the endpoint for PowerShell or "
          "a shell started by the browser or Explorer",
          "A ClickFix attack, so check the endpoint for a shell or script"
          " launched from the browser or Explorer",
          "A normal CAPTCHA step that some sites use, so no action is "
          "required unless the user reports a problem",
        ],
        correctIndex: 1,
        explanation:
            "The user ran the attacker's command themselves. Endpoint "
            "telemetry shows the child process, the downloaded payload and "
            "any new connections.",
      ),
      QuizQuestion(
        question: "Why is device code phishing hard to stop with email filtering "
                  "and MFA alone?",
        options: [
          "Because the attack uses a fake website that copies the login "
          "page, and the filter can never see websites at all",
          "Because the attack needs malware on the user's laptop, which "
          "email filters are not designed to look for at all",
          "The victim signs in on the real provider page, MFA included, "
          "while the attacker's own device receives the token",
          "Because the victim signs in on the genuine provider page with "
          "MFA, and the attacker's device receives the token",
        ],
        correctIndex: 2,
        explanation:
            "Nothing is bypassed; the victim authenticates for the "
            "attacker. Controls belong at the identity layer: restrict "
            "device code flow and monitor new sign-ins and devices.",
      ),
      QuizQuestion(
        question: "Which is the best thing to include when sharing a phishing "
                  "indicator in a report?",
        options: [
          "The defanged indicator, written with hxxps and bracketed dots,"
          " plus the first-seen time and how it was used",
          "The live link written out in full as a clickable address, so "
          "that every reader can open it and check it themselves",
          "The sender's full personal details and home address, so that "
          "the investigators can contact them quickly later",
          "The defanged indicator, such as hxxps and bracketed dots, with"
          " first-seen time and what it was used for",
        ],
        correctIndex: 0,
        explanation:
            "Defanging prevents accidental clicks, and the context lets "
            "others search their own logs. Personal data and live links do "
            "not belong in shared reports.",
      ),
    ],
  ),
];
