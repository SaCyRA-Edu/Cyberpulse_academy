// Identity, Cloud & SaaS Investigations: a theory module of "The Pulse (SOC Blue Team)". Same
// Lesson/LessonSection/QuizQuestion model as every other module.

import 'lesson_model.dart';

final List<Lesson> socCloudLessons = [
  Lesson(
    title: "Identity as the New Perimeter: Sign-In Logs, MFA and "
           "Conditional Access",
    estimatedMinutes: 17,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Why Identity Became the Perimeter",
        body:
            "For a long time the network edge was the thing defenders "
            "watched. Users sat in offices, applications ran in a data "
            "center, and a firewall decided what came in. Today your users "
            "work from homes and cafes, the applications are cloud services"
            " reached over the internet, and no firewall sits between a "
            "user and their email, files or code repository. The one "
            "control every request still passes through is the sign-in.\n"
            "\n"
            "That is what people mean when they say identity is the new "
            "perimeter. An attacker who holds a valid account does not need"
            " malware, an exploit or a foothold on a laptop. They log in, "
            "and from then on most of what they do looks like normal use of"
            " a normal account. This is why valid accounts (ATT&CK T1078, "
            "which appears under Initial Access, Persistence, Privilege "
            "Escalation and Defense Evasion) is one of the most commonly "
            "seen techniques in real incidents.\n"
            "\n"
            "For you as an analyst, this changes the question. With malware"
            " you ask what ran. With identity you ask whether the person "
            "behind this sign-in is who the account says they are, and what"
            " that session did afterward. Both answers come from logs, so "
            "learning to read identity logs well is one of the "
            "highest-value skills in a modern SOC.",
      ),
      LessonSection(
        heading: "The Building Blocks You Need to Know",
        body:
            "Whatever platform your organization uses, the same pieces "
            "appear. Learn the vocabulary once and the products become easy"
            " to read.",
        bullets: [
          "Identity provider (IdP): the service that authenticates users "
          "and issues proof of it. Examples of the category include "
          "Microsoft Entra ID, Okta, Google Workspace and Active "
          "Directory with a federation service.",
          "Authentication versus authorization: authentication proves who"
          " you are; authorization decides what you may do. A sign-in log"
          " mostly records the first; audit and activity logs record the "
          "second.",
          "Session and token: after a successful sign-in the service "
          "gives the browser or app a token. Later requests present the "
          "token instead of the password. Whoever holds the token is "
          "treated as the user.",
          "Multi-factor authentication (MFA): a second proof beyond the "
          "password, such as an authenticator app prompt, a code, or a "
          "hardware key.",
          "Conditional access or risk-based policy: rules that decide, "
          "per sign-in, whether to allow, block or demand more proof, "
          "based on user, app, device, location and risk.",
          "Service principal, app registration, service account: "
          "non-human identities used by applications and scripts. They "
          "often have no MFA and rarely get reviewed.",
          "Privileged roles: administrator roles such as Global "
          "Administrator or a cloud account owner. These are the accounts"
          " attackers most want.",
        ],
      ),
      LessonSection(
        heading: "Reading a Sign-In Log Entry",
        body:
            "A sign-in log entry answers a handful of questions. Train "
            "yourself to scan for them in the same order every time, "
            "because the order is what makes you fast.\n"
            "\n"
            "Who: the user principal name and whether it is a member, a "
            "guest or a service identity. What: the application or resource"
            " being accessed. From where: the source IP address, country "
            "and ASN (the network owner). On what: the device, operating "
            "system and browser or user agent, and whether the device is "
            "registered or compliant. How: which authentication methods "
            "were used, whether MFA was satisfied, and which conditional "
            "access policies applied. Result: success, failure, or "
            "interrupted, with an error code that explains why.\n"
            "\n"
            "Error codes matter. In Microsoft Entra ID sign-in logs, for "
            "example, a result type of 0 means success, while other values "
            "encode causes such as a bad password, a locked account, MFA "
            "required but not completed, or a block by conditional access. "
            "Exact codes change over time, so keep the vendor reference "
            "open instead of memorizing it. The habit worth building is "
            "reading a failure code as a story: a run of password failures "
            "followed by one success is very different from a run of MFA "
            "denials followed by one approval.",
      ),
      LessonSection(
        heading: "Annotated Example: A Sign-In That Does Not Fit",
        isTemplate: true,
        body:
            "SAMPLE SIGN-IN LOG EXTRACT (fictional)\n"
            "\n"
            "TIME (UTC)   USER                      APP            IP"
            "              COUNTRY  RESULT\n"
            "02:14:03     priya.nair@corp.example   Office Portal  "
            "198.51.100.20   IN       Success (MFA: app prompt)\n"
            "02:14:40     priya.nair@corp.example   Mail           "
            "198.51.100.20   IN       Success\n"
            "09:51:12     priya.nair@corp.example   Mail           "
            "203.0.113.77    NL       Success (MFA: satisfied by token "
            "claim)\n"
            "09:51:30     priya.nair@corp.example   Graph API      "
            "203.0.113.77    NL       Success\n"
            "09:52:05     priya.nair@corp.example   Mail           "
            "203.0.113.77    NL       Success\n"
            "\n"
            "CONTEXT: Priya works in Bengaluru, normal hours 03:30 to 12:30"
            " UTC.\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. Two countries within roughly seven hours. This could be a "
            "VPN or travel, so it is a question, not a verdict.\n"
            "2. The second sign-in did not prompt for MFA. It says MFA was "
            "satisfied by a claim in an existing token. That means someone "
            "presented a session that already passed MFA elsewhere.\n"
            "3. The Graph API call right after sign-in is programmatic "
            "access to mailbox data, unusual for a user who normally uses "
            "only the portal.\n"
            "4. The user agent (not shown) should be compared with the "
            "first session. A different browser family and operating system"
            " would strengthen suspicion.\n"
            "\n"
            "NEXT STEPS: Contact the user through a separate channel. Check"
            " whether the 203.0.113.77 address appears for any other user. "
            "Review mailbox rules and audit events created after 09:51. If "
            "unconfirmed, revoke sessions and reset the credential.",
      ),
      LessonSection(
        heading: "MFA: What It Stops and What It Does Not",
        body:
            "MFA blocks the most common attack: someone guessing, reusing "
            "or buying a password. It does not block an attacker who tricks"
            " the user into completing the MFA step for them, and it does "
            "not help once a session token has been stolen. Attackers "
            "adapted quickly, so you will see several recurring patterns.",
        bullets: [
          "MFA fatigue or prompt bombing (ATT&CK T1621, MFA Request "
          "Generation, under Credential Access): the attacker already has"
          " the password and triggers prompt after prompt until the user "
          "taps approve. Look for many MFA requests in a short window, "
          "often at odd hours, followed by one success.",
          "Weak methods: SMS and voice codes can be intercepted or "
          "redirected through SIM swapping. App-based number matching and"
          " hardware keys are stronger. Check which method was used on "
          "the successful sign-in.",
          "MFA registration abuse: after taking over an account the "
          "attacker registers their own authenticator so that they can "
          "return later. This is persistence (T1556.006, Modify "
          "Authentication Process: Multi-Factor Authentication). Always "
          "review audit events for new security info or methods.",
          "MFA gaps: legacy protocols such as IMAP or SMTP basic "
          "authentication, or service accounts, may skip MFA entirely. A "
          "success with no MFA detail from a legacy client is worth a "
          "look.",
          "Excluded accounts: break-glass and executive accounts are "
          "sometimes excluded from policies. Attackers who discover "
          "exclusions go straight for those accounts.",
        ],
      ),
      LessonSection(
        heading: "Conditional Access in Plain Language",
        body:
            "Conditional access is a rule engine placed in front of the "
            "sign-in. Each rule has conditions (who, which app, from where,"
            " on what device, at what risk level) and a result (allow, "
            "require MFA, require a compliant device, block). When several "
            "rules match, the strictest combined result applies.\n"
            "\n"
            "As an analyst you will use conditional access in two ways. "
            "First, as evidence: the sign-in log records which policies "
            "were evaluated and whether each succeeded, failed or was not "
            "applied. A sign-in that skipped every policy tells you a gap "
            "exists. Second, as a response tool: a well-built policy can "
            "block a country you never operate in, block legacy "
            "authentication, or force a password change for risky users. "
            "You rarely write the policy, but you should be able to explain"
            " to the identity team what gap you saw and what condition "
            "would have closed it.\n"
            "\n"
            "Also learn the idea of report-only mode, where a policy logs "
            "what it would have done without enforcing it. Reading those "
            "results shows you who a new rule would affect before it is "
            "switched on.",
      ),
      LessonSection(
        heading: "Patterns That Deserve Attention",
        body:
            "Most identity detections are variations of a few ideas. "
            "Knowing them lets you sort alerts quickly.",
        bullets: [
          "Password spray (T1110.003, Brute Force: Password Spraying): "
          "one or a few common passwords tried against many accounts. "
          "Look for many users failing from one IP or a small set of IPs,"
          " spread out to stay below lockout thresholds.",
          "Credential stuffing (T1110.004): reused passwords from other "
          "breaches tried at volume. Failures are often against accounts "
          "that do exist, from many IPs.",
          "Impossible or atypical travel: two sign-ins too far apart for "
          "the time between them. Always rule out VPN exit nodes and "
          "mobile carriers first.",
          "Anonymizing infrastructure: sign-ins from consumer VPNs, proxy"
          " networks or hosting providers for a user who normally signs "
          "in from a home ISP.",
          "First-time application or protocol: an account that has only "
          "used a browser now using a command-line client or a "
          "programmatic API.",
          "Sign-in followed by high-value change: new MFA method, new "
          "mailbox rule, new role assignment or new app consent within "
          "minutes of a risky sign-in.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes",
        body:
            "These are the errors that most often turn a good alert into a "
            "bad outcome.",
        bullets: [
          "Treating a successful MFA as proof of a legitimate user. MFA "
          "proves a second factor was satisfied, not who satisfied it.",
          "Closing an alert because the sign-in came from the user's own "
          "country. Attackers rent infrastructure in the victim's region "
          "on purpose.",
          "Looking only at the alerted sign-in. The question is what "
          "happened in the hour before and after, and whether other "
          "accounts share the same IP.",
          "Resetting the password but leaving existing sessions and "
          "tokens alive. The attacker keeps access until sessions are "
          "revoked.",
          "Forgetting non-interactive sign-ins. Many token-based requests"
          " appear in a separate log view from interactive ones.",
          "Ignoring failures. A spray that hits 400 accounts and succeeds"
          " on two is only visible if you count the failures too.",
        ],
      ),
      LessonSection(
        heading: "What to Check First: A Short Checklist",
        isTemplate: true,
        body:
            "IDENTITY ALERT: FIRST FIVE MINUTES\n"
            "\n"
            "[ ] Confirm the account: type (employee, admin, guest, "
            "service) and business role\n"
            "[ ] Pull 24 hours of interactive and non-interactive sign-ins "
            "for the user\n"
            "[ ] Compare IP, country, ASN, device and user agent with the "
            "user's last 30 days\n"
            "[ ] Note how MFA was satisfied on each success (prompt, claim "
            "in token, none)\n"
            "[ ] Search the same source IP across all users\n"
            "[ ] Check audit events after the sign-in: MFA changes, mailbox"
            " rules, role changes, app consent\n"
            "[ ] Contact the user through a separate channel (phone, chat) "
            "and record the answer\n"
            "[ ] Decide: benign, suspicious (monitor), or confirmed "
            "(contain and escalate)\n"
            "\n"
            "Data sources: identity provider sign-in logs, identity audit "
            "logs, conditional access evaluation results, VPN and proxy "
            "logs, the user's device inventory record.",
      ),
    ],
  ),
  Lesson(
    title: "Token Theft, AiTM, Device Code and OAuth Consent Abuse",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "When the Password and the MFA Are Not the Target",
        body:
            "The previous lesson showed that MFA stopped a lot of account "
            "takeovers. Attackers responded by changing what they steal. "
            "Instead of the password, they go after the thing the service "
            "hands out after the password and MFA have both succeeded: the "
            "session token, or a long-lived permission granted to an "
            "application. Once they have either, there is nothing left to "
            "guess and nothing left to approve.\n"
            "\n"
            "Four techniques account for most of what you will meet in this"
            " area: adversary-in-the-middle (AiTM) phishing, token or "
            "cookie theft from a device, device code phishing, and "
            "malicious OAuth consent. They look different to the user but "
            "have something in common for the analyst. In each case the "
            "sign-in log may show a perfectly valid, MFA-satisfied success,"
            " and the evidence that something is wrong is in the context "
            "around it.",
      ),
      LessonSection(
        heading: "Tokens in One Page",
        body:
            "When you sign in to a cloud service, you receive a set of "
            "tokens. An access token is short-lived (often under an hour or"
            " so) and is presented with each request. A refresh token lasts"
            " much longer and is used to quietly obtain new access tokens, "
            "so users are not asked to sign in all day. A browser also "
            "holds a session cookie that proves the interactive session.\n"
            "\n"
            "Two ideas follow. First, stealing a token is equivalent to "
            "stealing the logged-in session: the service sees the same "
            "proof the real user presented. Using it falls under ATT&CK Use"
            " Alternate Authentication Material, for example T1550.001 for "
            "application access tokens and T1550.004 for web session "
            "cookies (tactics: Defense Evasion and Lateral Movement). "
            "Stealing them is covered by T1539 (Steal Web Session Cookie) "
            "and T1528 (Steal Application Access Token), under Credential "
            "Access. Second, changing the password does not necessarily end"
            " the attacker's access, because tokens already issued may stay"
            " valid until they expire or are explicitly revoked. That is "
            "why response always includes revoking sessions.",
      ),
      LessonSection(
        heading: "Adversary-in-the-Middle Phishing",
        body:
            "In an AiTM attack the victim receives a link to a page that "
            "looks like the real sign-in. The page is a reverse proxy: it "
            "passes everything the user types to the genuine service and "
            "passes the genuine service's replies back. The user completes "
            "MFA for real, the real service issues a real session cookie, "
            "and the proxy captures it on the way through. The attacker "
            "then imports the cookie into their own browser and is already "
            "signed in. Phishing the cookie, not the password, is the point"
            " (ATT&CK T1566 Phishing for the delivery and T1539 for the "
            "stolen cookie).\n"
            "\n"
            "What the analyst sees is often subtle. The first sign-in comes"
            " from the attacker's proxy server, not from the user's device."
            " The sign-in succeeded and MFA was satisfied. Soon after, a "
            "second session appears from a different IP and device, "
            "claiming MFA was satisfied through an existing token.",
        bullets: [
          "Two sessions for one user with different IPs, devices or user "
          "agents within minutes of each other, the second needing no "
          "MFA.",
          "A first sign-in from hosting or proxy infrastructure, not from"
          " the user's usual network.",
          "A phishing email or message to the user shortly before the "
          "first sign-in; check message trace and click logs if "
          "available.",
          "Post-compromise actions within minutes: a new inbox rule, a "
          "new authentication method, or mass access to mail.",
          "Defensive notes for the identity team: phishing-resistant "
          "methods such as hardware security keys and passkeys are bound "
          "to the real website, so a look-alike proxy cannot reuse them; "
          "requiring a compliant or registered device in conditional "
          "access also makes a copied cookie much less useful.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: AiTM Timeline",
        isTemplate: true,
        body:
            "SAMPLE INCIDENT TIMELINE (fictional, UTC)\n"
            "\n"
            "08:57  Email to meera.iyer@corp.example from "
            "billing@docs-share.example\n"
            "       Subject: Shared document: Q3 vendor schedule\n"
            "09:02  Click recorded on https://login.docs-share.example/auth"
            " (domain age: 3 days)\n"
            "09:03  Sign-in SUCCESS, meera.iyer, IP 203.0.113.140 (hosting "
            "provider ASN),\n"
            "       MFA: authenticator prompt approved, user agent: Linux "
            "headless browser\n"
            "09:11  Sign-in SUCCESS, meera.iyer, IP 198.51.100.88, user "
            "agent Windows Edge,\n"
            "       MFA: satisfied by token claim, device: unregistered\n"
            "09:14  AUDIT: Inbox rule created, name: \".\", action: move to "
            "RSS Subscriptions, mark as read,\n"
            "       condition: subject contains \"invoice\" or \"payment\"\n"
            "09:16  AUDIT: New authentication method added (second "
            "authenticator)\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. The first sign-in is from a hosting provider, with a "
            "headless browser. The user works on a Windows laptop. That is "
            "the proxy, not Meera.\n"
            "2. The second sign-in uses the stolen session. It needs no MFA"
            " because the token already carries it.\n"
            "3. The inbox rule hides finance mail from the user. This is a "
            "classic business email compromise preparation step.\n"
            "4. The added authentication method is persistence: the "
            "attacker wants to return after a password reset.\n"
            "\n"
            "RESPONSE: Revoke all sessions, remove the added authentication"
            " method, delete the rule, reset the password, block the "
            "domain, search message trace for other recipients, review what"
            " was read or sent from 09:11 onward.",
      ),
      LessonSection(
        heading: "Device Code Phishing",
        body:
            "The device code flow exists so that devices without a "
            "keyboard, such as a TV or a command-line tool, can sign in. "
            "The device shows a short code; the user opens a Microsoft or "
            "other provider page on another device, types the code and "
            "signs in there. The device then receives tokens.\n"
            "\n"
            "Attackers abuse this by starting a device code flow "
            "themselves, then persuading the victim, by email, chat or even"
            " a phone call, to enter the code on the real provider page. "
            "The page is genuine, the domain is genuine, and the user "
            "completes real MFA. The attacker's waiting session receives "
            "the tokens. Nothing about the page looks wrong because nothing"
            " about it is wrong.\n"
            "\n"
            "In sign-in logs this appears as a sign-in whose authentication"
            " protocol is the device code flow, often for a client "
            "application the user does not normally use, with the source IP"
            " belonging to the attacker's machine and not the user's. A "
            "user who has never used a device code sign-in suddenly having "
            "one is a strong signal. Defensive measures include blocking "
            "device code flow through conditional access for people who do "
            "not need it, and teaching users that nobody legitimate will "
            "ask them to read out or type a code they did not request.",
      ),
      LessonSection(
        heading: "OAuth Consent Abuse",
        body:
            "OAuth lets one application act on a user's behalf without "
            "learning the password. The user sees a consent screen listing "
            "the permissions the application wants, and clicks accept. "
            "Attackers register their own application and send a link that "
            "opens a genuine consent page. If the user accepts, the "
            "attacker's app receives permission to read mail, files or "
            "contacts, and often a refresh token that keeps working after a"
            " password reset. MFA is never challenged for this, because the"
            " user is not signing in to the attacker's app; they are "
            "granting it access. This maps to T1528 (Steal Application "
            "Access Token) and, for persistence through added credentials "
            "or permissions, T1098 (Account Manipulation).\n"
            "\n"
            "What to look at: audit events for consent to application, the "
            "application's name and publisher, the permissions it received,"
            " whether it is verified, how many users granted it and when it"
            " was registered. Permissions that deserve the closest look are"
            " those that allow reading all mail, reading and writing files,"
            " or acting offline (a refresh token), and anything granted "
            "tenant-wide by an administrator. Response is to disable the "
            "application, revoke the grants, and review what the app "
            "accessed using the application's own sign-in and audit "
            "activity.",
      ),
      LessonSection(
        heading: "Annotated Example: A Suspicious Consent",
        isTemplate: true,
        body:
            "SAMPLE AUDIT EXTRACT (fictional)\n"
            "\n"
            "TIME      ACTOR                     EVENT"
            "                          DETAIL\n"
            "14:20:11  arjun.rao@corp.example     Consent to application"
            "         App: SecureDocs Sync (unverified)\n"
            "                                                                   "
            "Scopes: Mail.Read, Files.Read.All, offline_access\n"
            "                                                                   "
            "Registered: 5 days ago, other tenant\n"
            "14:21:02  arjun.rao@corp.example     Consent to application"
            "         (same app, second grant by same user)\n"
            "14:55:40  corp consent log           11 more users"
            "                  same application, same scopes, over 3 hours\n"
            "15:10:02  SecureDocs Sync (service)  Non-interactive sign-in"
            "        IP 203.0.113.9, resource: Graph API\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. An unverified app from an unknown outside tenant asked for "
            "broad read access plus offline_access, which means a token "
            "that outlives the browser session.\n"
            "2. Twelve consents in a few hours indicates a campaign, not "
            "one careless click.\n"
            "3. The app now signs in on its own, from an IP no user owns.\n"
            "4. A password reset would change nothing here. The grant has "
            "to be revoked.\n"
            "\n"
            "CONTAINMENT: Disable the application, revoke grants for all "
            "twelve users, search the audit trail for mail and file access "
            "by the app, and notify the identity team about restricting "
            "user consent.",
      ),
      LessonSection(
        heading: "Common Mistakes and What to Check First",
        body:
            "Each of these attacks looks like a normal success in a log. "
            "The way to catch them is to ask what else is true.",
        bullets: [
          "Dismissing a sign-in because MFA was satisfied. Ask how it was"
          " satisfied and on which device.",
          "Not comparing the first and second sessions. The difference "
          "between them is often the whole story.",
          "Looking for malware on the laptop. In AiTM and consent cases "
          "the endpoint may be clean.",
          "Revoking only the password. Revoke refresh tokens and "
          "sessions, remove added authentication methods, and remove app "
          "grants.",
          "Reporting an app as safe because it has a friendly name. Check"
          " the publisher, verification status, registration date and "
          "permissions instead.",
          "Treating a device code sign-in as a technical curiosity. If "
          "the user cannot explain it, treat it as compromise.",
          "Data sources to pull: sign-in logs (interactive and "
          "non-interactive), audit logs, email message trace and click "
          "data, application and consent logs, proxy or DNS logs for the "
          "lure domain, conditional access results.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Active Directory Attacks at Analyst Level",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "Why Active Directory Still Matters",
        body:
            "Even organizations that live mostly in the cloud usually still"
            " run Active Directory (AD), the directory service that holds "
            "users, groups, computers and policies for Windows "
            "environments. Many cloud identities are synchronized from it. "
            "That makes AD both the keys to the on-premises estate and a "
            "stepping stone to the cloud: an attacker who controls the "
            "domain can often reach the cloud tenant too.\n"
            "\n"
            "You do not need to perform these attacks to detect them. You "
            "need to understand what each one does in plain terms, which "
            "log records it leaves, and what a normal pattern looks like so"
            " the abnormal one stands out. Most AD detection comes from "
            "domain controller security logs, so make sure you know which "
            "Windows event IDs matter and where they are collected.",
      ),
      LessonSection(
        heading: "Core Concepts in Brief",
        body:
            "A few ideas are enough to follow every attack in this lesson.",
        bullets: [
          "Domain controller (DC): the server that authenticates users "
          "and holds the directory database. It is the most sensitive "
          "system in the environment.",
          "Kerberos: the main authentication protocol. A user asks the DC"
          " for a ticket-granting ticket (TGT), then presents it to ask "
          "for service tickets for specific services.",
          "Service principal name (SPN): the label that ties a service, "
          "such as a database, to the account it runs under. Accounts "
          "with SPNs are the ones Kerberoasting targets.",
          "NTLM: an older challenge-response protocol still in use. "
          "Hashes of NTLM passwords can be reused in pass-the-hash "
          "attacks.",
          "Privileged groups: Domain Admins, Enterprise Admins, "
          "Administrators, Account Operators and similar. Membership "
          "changes here are always worth reviewing.",
          "Replication: DCs copy directory data between themselves using "
          "specific permissions. Attackers imitate this to copy password "
          "data.",
          "Tiering: the idea that highly privileged accounts should only "
          "sign in to the most protected systems, so their credentials "
          "are not left on ordinary workstations.",
        ],
      ),
      LessonSection(
        heading: "Kerberoasting",
        body:
            "Kerberoasting (ATT&CK T1558.003, Steal or Forge Kerberos "
            "Tickets: Kerberoasting, under Credential Access) works because"
            " any authenticated domain user may request a service ticket "
            "for any SPN, and part of that ticket is encrypted with a key "
            "derived from the service account's password. The attacker "
            "requests tickets for accounts with SPNs, takes them away, and "
            "tries to crack the passwords offline. Nothing is cracked on "
            "the domain controller, so the only visible part is the ticket "
            "request.\n"
            "\n"
            "The attacker needs only an ordinary account to begin. The risk"
            " is that service accounts often have old, weak passwords and "
            "sometimes high privileges.\n"
            "\n"
            "What the analyst looks for: Windows event ID 4769 (a Kerberos "
            "service ticket was requested) on domain controllers. Normal "
            "users request a few tickets for services they use. A single "
            "account requesting tickets for many different service accounts"
            " in a short period is suspicious. The ticket encryption type "
            "field adds a clue: RC4 (shown as 0x17) is an older cipher that"
            " attackers prefer because it is faster to crack; in an "
            "environment that mostly uses AES, an RC4 request stands out. "
            "Exclude computer accounts (names ending with a dollar sign) "
            "and the krbtgt account when counting.",
      ),
      LessonSection(
        heading: "Annotated Example: Kerberoasting in the Logs",
        isTemplate: true,
        body:
            "SAMPLE DC SECURITY LOG EXTRACT (fictional, simplified)\n"
            "\n"
            "11:42:07  4769  Account: ravi.k@CORP.EXAMPLE   Service: "
            "MSSQLSvc/db01.corp.example   Encryption: 0x17  Client: "
            "192.0.2.61\n"
            "11:42:07  4769  Account: ravi.k@CORP.EXAMPLE   Service: "
            "HTTP/intranet.corp.example   Encryption: 0x17  Client: "
            "192.0.2.61\n"
            "11:42:08  4769  Account: ravi.k@CORP.EXAMPLE   Service: "
            "FIMSvc/fs02.corp.example     Encryption: 0x17  Client: "
            "192.0.2.61\n"
            "11:42:08  4769  Account: ravi.k@CORP.EXAMPLE   Service: "
            "BackupSvc/bk01.corp.example  Encryption: 0x17  Client: "
            "192.0.2.61\n"
            "          (nine more requests in the same two seconds)\n"
            "\n"
            "BASELINE: ravi.k normally requests 2 to 3 service tickets per "
            "day, all AES (0x12).\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. Thirteen different services in two seconds from one "
            "workstation. People do not browse that way; tools do.\n"
            "2. Every request uses RC4, unlike this user's baseline.\n"
            "3. The requested services are all accounts run by service "
            "identities, some with admin rights.\n"
            "4. The workstation 192.0.2.61 should be checked next: what "
            "process ran, who was logged in, and what else it did.\n"
            "\n"
            "NEXT STEPS: Identify which service accounts were requested, "
            "check their privilege and password age, plan password resets "
            "for those accounts (use long random passwords or managed "
            "service accounts), and investigate the source host.",
      ),
      LessonSection(
        heading: "DCSync and Credential Dumping",
        body:
            "DCSync (T1003.006, OS Credential Dumping: DCSync, under "
            "Credential Access) lets an attacker with specific replication "
            "permissions ask a domain controller to send password data, "
            "just as another DC would. No code needs to run on the DC, and "
            "the attacker can obtain the hashes of any account, including "
            "the krbtgt account that signs all Kerberos tickets. Related "
            "techniques include copying the directory database file "
            "directly (T1003.003, NTDS).\n"
            "\n"
            "Normal replication occurs only between domain controllers. So "
            "the key detection idea is simple: a replication request that "
            "comes from something that is not a DC is wrong. In Windows "
            "logs, look at event ID 4662 (an operation was performed on an "
            "object) containing the replication rights "
            "DS-Replication-Get-Changes and DS-Replication-Get-Changes-All,"
            " which are shown as GUIDs. Check the account that made the "
            "request and the source address. If it is a user account or a "
            "member server, treat it as high severity. Network detection "
            "can also see replication calls from a non-DC.\n"
            "\n"
            "Compromise of krbtgt has long consequences: forged tickets "
            "(golden tickets, T1558.001) can persist until the krbtgt "
            "password is reset twice. That is a major operation, so the "
            "question of whether DCSync really occurred needs an accurate "
            "answer.",
      ),
      LessonSection(
        heading: "Privilege Escalation and Lateral Movement",
        body:
            "After the first foothold, attackers aim at privileged "
            "accounts. The patterns you will see most often are below.",
        bullets: [
          "Pass-the-hash (T1550.002) and pass-the-ticket (T1550.003): "
          "reusing a captured hash or Kerberos ticket instead of a "
          "password. Look for network logons (event 4624, logon type 3) "
          "using NTLM from workstations to many servers, or accounts "
          "appearing on hosts they never use.",
          "Group membership changes: events 4728, 4732 and 4756 record "
          "additions to security groups. An unexpected addition to Domain"
          " Admins, outside change windows, is critical. Also check 4720 "
          "for new accounts.",
          "Special privileges assigned at logon (event 4672): expected "
          "for admins, unexpected for ordinary users.",
          "Delegation and permission abuse: changes to account "
          "attributes, delegation settings or access control lists on "
          "sensitive objects. These can silently grant control without "
          "any group change.",
          "Group policy modification (T1484, Domain Policy Modification, "
          "Defense Evasion and Privilege Escalation): changes to policies"
          " can push software or settings to every machine.",
          "Certificate services abuse (T1649, Steal or Forge "
          "Authentication Certificates): misconfigured certificate "
          "templates can let a low-privilege user obtain a certificate "
          "that authenticates as an administrator.",
          "Account discovery (T1087) and permission group discovery "
          "(T1069): bursts of directory queries from one host just before"
          " escalation.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: Privileged Group Change",
        isTemplate: true,
        body:
            "SAMPLE ALERT AND TRIAGE NOTE (fictional)\n"
            "\n"
            "ALERT: Member added to security-enabled global group\n"
            "EVENT 4728 at 23:18:44 on DC02\n"
            "  Group: Domain Admins\n"
            "  Member added: svc-print01\n"
            "  Added by: helpdesk.t (Account Operators)\n"
            "  Source workstation: WKS-0417\n"
            "\n"
            "CONTEXT PULLED\n"
            "\n"
            "- svc-print01 is a service account for printers. It has never "
            "been in a privileged group.\n"
            "- helpdesk.t has no change ticket; last normal logon was "
            "17:40, workstation WKS-0417.\n"
            "- At 23:05 on the same workstation, event 4769 shows 40 "
            "service ticket requests (RC4) from helpdesk.t.\n"
            "- At 23:20 svc-print01 logs on to FS02 and DC02 (type 3).\n"
            "\n"
            "ASSESSMENT: Likely compromise of helpdesk.t, with "
            "Kerberoasting followed by privilege escalation using a cracked"
            " service account password. Severity: critical.\n"
            "\n"
            "ACTIONS: Isolate WKS-0417, disable svc-print01 and helpdesk.t,"
            " remove the group membership, reset both passwords, review "
            "logons by svc-print01 after 23:18, hunt for DCSync-style 4662 "
            "events, escalate to incident response.",
      ),
      LessonSection(
        heading: "Common Mistakes and What to Check First",
        body:
            "Many AD alerts are noisy, so the mistake is often discarding "
            "one that matters or escalating one that does not.",
        bullets: [
          "Counting only the number of 4769 events. Count distinct "
          "services per account and compare it with that account's own "
          "history.",
          "Treating DCSync like ordinary replication. The question is "
          "whether the requester is a domain controller, not whether the "
          "event exists.",
          "Not collecting domain controller logs centrally. If DC "
          "security logs are not in your SIEM, you will be blind to most "
          "of this lesson.",
          "Resetting a privileged account password and stopping. Check "
          "what that account did, and whether others were touched through"
          " it.",
          "Forgetting service accounts. They are privileged, rarely "
          "monitored and often have non-expiring passwords.",
          "Overlooking change management. Many group changes are "
          "legitimate; the ticket, the actor and the time decide.",
        ],
      ),
      LessonSection(
        heading: "Checklist: AD Alert Triage",
        isTemplate: true,
        body:
            "AD ALERT: FIRST CHECKS\n"
            "\n"
            "[ ] Which event ID, which DC, which account is the actor, and "
            "which is the target\n"
            "[ ] Source host and IP: workstation, server or domain "
            "controller\n"
            "[ ] Is there a change ticket or an approved maintenance window\n"
            "[ ] Baseline: what does this account normally do (hosts, "
            "services, hours)\n"
            "[ ] Anything else from this host in the past hour: logons, "
            "process creation, new services\n"
            "[ ] Group changes, new accounts, new delegations in the same "
            "window\n"
            "[ ] Whether the target is privileged, or reaches privileged "
            "systems\n"
            "[ ] Cloud link: is the account synchronized to the cloud, and "
            "did it sign in there afterward\n"
            "\n"
            "Data sources: domain controller security logs (4624, 4625, "
            "4662, 4672, 4720, 4728, 4732, 4756, 4768, 4769, 4771), "
            "endpoint telemetry such as Sysmon where deployed, network "
            "sensors such as Zeek or Suricata for replication and Kerberos "
            "traffic, and AD change auditing.",
      ),
    ],
  ),
  Lesson(
    title: "Cloud Control-Plane Logs, Misconfigurations and Exposed Keys",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Control Plane and Data Plane",
        body:
            "Every cloud service has two layers. The data plane is where "
            "the work happens: reading an object from storage, querying a "
            "database, running a function. The control plane is how the "
            "environment is configured: creating a virtual machine, "
            "changing a firewall rule, granting a role, turning off "
            "logging. Attackers who steal cloud credentials almost always "
            "touch the control plane, because that is how they gain more "
            "access, create persistence and hide.\n"
            "\n"
            "Control-plane activity is recorded in dedicated audit logs. "
            "The names differ by provider, but the idea is the same: each "
            "API call becomes a log record that tells you who called, from "
            "where, which action, on which resource, and whether it worked."
            " These logs are the cloud equivalent of the Windows security "
            "log, and reading them fluently is the central skill of cloud "
            "investigation.",
      ),
      LessonSection(
        heading: "The Logs You Will Meet",
        body:
            "Provider names change, so verify against current "
            "documentation. The categories are stable.",
        bullets: [
          "AWS CloudTrail: records management events (control plane) by "
          "default in the event history for a limited period, with trails"
          " needed for long retention and for data events such as "
          "object-level storage access. Key fields include eventName, "
          "eventSource, userIdentity, sourceIPAddress, userAgent, "
          "awsRegion, errorCode and requestParameters.",
          "Azure Activity Log: subscription-level control-plane "
          "operations, such as role assignment writes and resource "
          "deletions. Resource logs and Entra ID audit and sign-in logs "
          "cover other layers and often need to be routed to a workspace "
          "to be retained.",
          "Google Cloud Audit Logs: Admin Activity logs (control plane, "
          "on by default), Data Access logs (often must be enabled) and "
          "System Event logs.",
          "Microsoft 365 unified audit log: records user and admin "
          "activity across mail, files and identity workloads. "
          "Availability of some events depends on licensing and settings.",
          "Supporting sources: virtual network flow logs, DNS logs, "
          "storage access logs, load balancer logs, and cloud-native "
          "threat detection findings.",
          "Retention: check how long each log is kept and where it goes. "
          "An investigation that begins after the retention window has "
          "ended cannot see what happened.",
        ],
      ),
      LessonSection(
        heading: "Reading a CloudTrail Record",
        body:
            "Take a typical record and read it field by field. The identity"
            " fields are the most important.\n"
            "\n"
            "userIdentity tells you the kind of caller. A root user, an IAM"
            " user, an assumed role or a federated user each behave "
            "differently. For an assumed role, look at the session issuer "
            "and session name to find which role and who assumed it. The "
            "access key ID gives a clue: keys starting with AKIA are "
            "long-term keys tied to an IAM user, while keys starting with "
            "ASIA are temporary credentials issued by a security token "
            "service. A long-term key used from an unexpected network is a "
            "strong lead.\n"
            "\n"
            "sourceIPAddress and userAgent show where and with what. A "
            "request from the cloud provider's own service, from the "
            "corporate range, or from a residential or hosting address mean"
            " different things. The user agent often reveals tools: a "
            "command-line client, a software development kit, or a console "
            "browser. errorCode, when present, shows denied attempts, which"
            " is how attackers reveal themselves while probing what their "
            "stolen key may do.",
      ),
      LessonSection(
        heading: "Annotated Example: A Stolen Access Key at Work",
        isTemplate: true,
        body:
            "SAMPLE CLOUDTRAIL EXTRACT (fictional, simplified)\n"
            "\n"
            "TIME      EVENT                        IDENTITY"
            "                 SOURCE IP       NOTES\n"
            "03:11:05  GetCallerIdentity            user build-bot"
            "           203.0.113.200   key AKIAEXAMPLEKEY0001\n"
            "03:11:20  ListUsers                    user build-bot"
            "           203.0.113.200   AccessDenied\n"
            "03:11:31  ListBuckets                  user build-bot"
            "           203.0.113.200   success\n"
            "03:12:02  CreateAccessKey              user build-bot"
            "           203.0.113.200   for user admin-ops\n"
            "03:12:09  AttachUserPolicy             user build-bot"
            "           203.0.113.200   AdministratorAccess to new user\n"
            "03:14:40  StopLogging                  user build-bot"
            "           203.0.113.200   trail: org-main-trail\n"
            "03:15:12  RunInstances (x 20)          new user ops-temp"
            "        203.0.113.200   region: far from usual regions\n"
            "\n"
            "BASELINE: build-bot is used by a build server at "
            "198.51.100.15, only for artifact storage.\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. GetCallerIdentity is the first move of someone holding an "
            "unknown key: who am I?\n"
            "2. The denied call followed by a successful discovery call "
            "shows probing. Discovery maps to T1580 (Cloud Infrastructure "
            "Discovery).\n"
            "3. Creating a key and attaching an administrator policy is "
            "privilege escalation and persistence (T1098.001 and "
            "T1098.003).\n"
            "4. StopLogging is defense evasion (T1562.008, Disable or "
            "Modify Cloud Logs). Anything after it may be only partly "
            "recorded.\n"
            "5. Twenty instances in an unusual region is consistent with "
            "resource hijacking such as cryptocurrency mining (T1496).\n"
            "\n"
            "RESPONSE: Disable the build-bot key, delete the new key and "
            "user, restore logging, terminate instances, review other keys "
            "and look for how the key leaked.",
      ),
      LessonSection(
        heading: "Misconfigurations That Cause Incidents",
        body:
            "Not every cloud incident involves an attacker with stolen "
            "credentials. Many begin with a setting that exposed something "
            "to the internet. Analysts need to recognize these because "
            "alerts and external reports often start here. The ATT&CK "
            "technique for data pulled from exposed storage is T1530 (Data "
            "from Cloud Storage, under Collection).",
        bullets: [
          "Public storage: a bucket or container readable by anyone, or "
          "by anyone with a link. Check the access policy history to see "
          "when it changed and who changed it.",
          "Overly open network rules: management ports such as SSH or "
          "remote desktop, or database ports, open to the whole internet.",
          "Excessive permissions: wildcard policies, administrator roles "
          "on service accounts, or roles that can grant themselves more "
          "access.",
          "Missing logging: trails, flow logs or data access logs not "
          "enabled, so there is nothing to investigate.",
          "Unprotected snapshots, images and backups shared publicly or "
          "with unknown accounts.",
          "Default or shared credentials on cloud-hosted databases, "
          "dashboards and consoles.",
          "Disabled MFA on cloud root or owner accounts, and long-lived "
          "access keys that were never rotated.",
        ],
      ),
      LessonSection(
        heading: "Exposed Keys and Secrets",
        body:
            "Credentials in code are one of the most common ways cloud "
            "access is lost. Developers commit keys to public repositories,"
            " paste them into tickets or chat, bake them into container "
            "images or leave them in configuration files on servers. "
            "Scanners crawl public sites continuously, so a key pushed to a"
            " public repository can be found and used within minutes. "
            "ATT&CK groups these under T1552 (Unsecured Credentials), with "
            "T1552.001 for credentials in files and T1552.005 for the cloud"
            " instance metadata service, where code running on a cloud "
            "machine can fetch temporary credentials.\n"
            "\n"
            "When you are told a key has been exposed, treat it as "
            "compromised and do two things in parallel. First, contain: "
            "disable or rotate the key, and revoke any temporary sessions "
            "it created. Second, investigate: search the audit logs for "
            "every use of that key from the moment it was created or first "
            "exposed, not from the moment of the report. Group activity by "
            "source IP and by action, and separate known sources (the build"
            " server) from unknown ones. Deleting the repository commit "
            "does not help, because copies exist.\n"
            "\n"
            "Also ask where else the secret lives. The same key may be in "
            "older commits, forks, container layers or deployment "
            "pipelines. Prevention is a different team's job, but your "
            "report should name the control that would have caught it, such"
            " as secret scanning in the repository or short-lived "
            "credentials.",
      ),
      LessonSection(
        heading: "Annotated Example: Key Exposure Triage Note",
        isTemplate: true,
        body:
            "SAMPLE TRIAGE NOTE (fictional)\n"
            "\n"
            "REPORT: External researcher reports a cloud access key in a "
            "public repository (repo: acme-demo-tools, commit 4 days ago).\n"
            "KEY: AKIAEXAMPLEKEY0002 (long-term, user svc-reports)\n"
            "\n"
            "STEPS TAKEN\n"
            "\n"
            "1. Confirmed key belongs to us and is active. Disabled it at "
            "10:05.\n"
            "2. Searched CloudTrail for the key over 5 days: 2,140 calls. "
            "2,100 from 198.51.100.15 (our reporting server). 40 from "
            "203.0.113.99, starting 3 hours after the commit.\n"
            "3. The 40 unknown calls: ListBuckets, GetBucketAcl, then "
            "GetObject on reports-archive (312 objects). Data events were "
            "enabled for this bucket.\n"
            "4. No control-plane changes found. No new keys or roles "
            "created.\n"
            "5. Roles reachable from svc-reports checked: read-only on two "
            "buckets.\n"
            "\n"
            "ASSESSMENT: Confirmed unauthorized access; data read but "
            "nothing modified. 312 files in scope for data-breach "
            "assessment.\n"
            "OPEN ITEMS: Notify data owner and legal/privacy; rotate "
            "secrets in the same repository; add secret scanning.",
      ),
      LessonSection(
        heading: "Common Mistakes and What to Check First",
        body:
            "Cloud investigations fail in predictable ways.",
        bullets: [
          "Starting from the report date. For an exposed key, start from "
          "the creation or exposure time.",
          "Trusting that the logs exist. Confirm trails and retention "
          "first, and check whether anything turned logging off.",
          "Missing other regions. Attackers often use regions you never "
          "use; search all of them.",
          "Looking only at the identity named in the alert. Follow what "
          "it created or assumed: new keys, new roles, new users.",
          "Assuming a denied call is harmless. Repeated denials show "
          "someone testing what the key can do.",
          "Not recording the source IP and user agent. They are your "
          "pivot to other keys and users.",
          "Fixing the setting without asking who changed it and when. The"
          " change event is the beginning of the story.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "SaaS and Mailbox Investigations",
    estimatedMinutes: 17,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Why Mailboxes and SaaS Apps Are Targets",
        body:
            "A mailbox is more than messages. It holds invoices, password "
            "reset links, contracts, calendar details and the trust other "
            "people place in the owner's name. For an attacker, a "
            "compromised mailbox is a way to commit fraud, to reach other "
            "people from a trusted address, and to reset passwords on other"
            " services. The same is true, in smaller measure, of "
            "file-sharing platforms, chat tools, customer relationship "
            "systems and code hosting services.\n"
            "\n"
            "SaaS investigations differ from server investigations in one "
            "important way: you cannot install a tool or collect a disk "
            "image. You depend entirely on the logs the vendor provides and"
            " the settings the administrators enabled. That makes it "
            "essential to know, before an incident, what each critical SaaS"
            " application records, how long it keeps it, and who can export"
            " it.",
      ),
      LessonSection(
        heading: "What Attackers Do After Taking Over a Mailbox",
        body:
            "The same handful of actions appear in case after case. Knowing"
            " them gives you a ready checklist.",
        bullets: [
          "Create inbox rules to hide replies, delete security alerts, or"
          " move messages containing words such as invoice, payment or "
          "bank into obscure folders (ATT&CK T1564.008, Hide Artifacts: "
          "Email Hiding Rules, and T1114.003, Email Collection: Email "
          "Forwarding Rule).",
          "Set up forwarding to an external address, either as an inbox "
          "rule or as a mailbox-level forwarding setting. This quietly "
          "copies all new mail out.",
          "Search and read mail for finance, credentials and executive "
          "topics (T1114.002, Remote Email Collection).",
          "Send internal phishing from the compromised account (T1534, "
          "Internal Spearphishing) because messages from a colleague are "
          "trusted.",
          "Hijack ongoing threads for payment fraud, changing bank "
          "details in a reply to a real conversation.",
          "Add delegate access, extra authentication methods or app "
          "consents so they can return after the password is changed.",
          "Delete sent items and rule-processed mail to remove traces, "
          "which is why you must check for deletions as well as "
          "creations.",
        ],
      ),
      LessonSection(
        heading: "The Mailbox Evidence Trail",
        body:
            "Different logs answer different questions. Treat them as a "
            "set.",
        bullets: [
          "Sign-in logs: how and from where the account was accessed, and"
          " whether the access used a browser, a mail client, or a "
          "programmatic interface.",
          "Mailbox audit and unified audit events: rule creation and "
          "changes (such as New-InboxRule and Set-InboxRule in Exchange),"
          " forwarding changes (Set-Mailbox with a forwarding address), "
          "mailbox permission grants, message sends, and deletions.",
          "Mail access events: some platforms record which messages were "
          "accessed, but the detail available depends on licensing and "
          "settings. Check what you actually have, and say in your report"
          " when it is missing.",
          "Message trace: who sent what to whom, with timestamps, "
          "subjects, sizes and delivery status, including external "
          "destinations.",
          "Rule and forwarding configuration as it exists now: list all "
          "inbox rules, including hidden ones, and mailbox-level "
          "forwarding and delegates.",
          "Email gateway and proxy logs: for the original phishing, and "
          "for any links the attacker sent.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: Mailbox Compromise Audit",
        isTemplate: true,
        body:
            "SAMPLE MAILBOX AUDIT EXTRACT (fictional, UTC)\n"
            "\n"
            "13:02  Sign-in success       vikram.s@corp.example   IP "
            "203.0.113.31  App: Exchange Online (browser)\n"
            "13:06  New-InboxRule         vikram.s                Name: \"  "
            "\"   (blank)\n"
            "                                                     If "
            "subject contains: invoice, payment, wire\n"
            "                                                     Then: "
            "move to Archive, mark as read, stop processing\n"
            "13:07  Set-Mailbox           vikram.s                "
            "ForwardingSmtpAddress: smtp:collect@mailbox-fwd.example\n"
            "13:15  Send                  vikram.s                To: 46 "
            "recipients (internal), subject: \"Updated payroll form\"\n"
            "13:40  Send                  vikram.s                To: "
            "accounts@partner.example, subject: RE: Invoice 8812 (bank "
            "details changed)\n"
            "13:52  HardDelete            vikram.s                Sent "
            "items, 2 messages\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. The blank-named rule is a deliberate hiding technique. It "
            "makes the rule easy to overlook in the interface.\n"
            "2. Mailbox-level forwarding is separate from rules. Removing "
            "the rule without removing it leaves the leak running.\n"
            "3. The 46-recipient message is internal phishing; those people"
            " are now potential victims too.\n"
            "4. The reply to a partner changing bank details is the fraud "
            "attempt. Contact the partner's finance team through a known "
            "channel.\n"
            "5. Hard-deleted sent items show the attacker cleaning up. Look"
            " for recoverable items and message trace to rebuild what was "
            "sent.\n"
            "\n"
            "RESPONSE: Contain the account, remove rule and forwarding, "
            "trace the 46 messages and purge them, warn the partner, review"
            " what the attacker could have read, and report according to "
            "policy.",
      ),
      LessonSection(
        heading: "Investigating Other SaaS Applications",
        body:
            "The method is the same wherever you are: identify the "
            "application's audit log, confirm its retention, find the "
            "actor, the action, the object and the source, and compare them"
            " with the user's baseline. Different categories of application"
            " produce different signs of abuse.",
        bullets: [
          "File sharing and collaboration: bulk downloads, new external "
          "sharing links with anyone access, sharing of folders to "
          "personal addresses, large sync from a new device (T1213, Data "
          "from Information Repositories; T1567, Exfiltration Over Web "
          "Service).",
          "Chat and messaging: new bots or integrations, messages with "
          "login links sent from a compromised account, external guests "
          "added to private channels.",
          "Code hosting: new personal access tokens, deploy keys, new "
          "repository visibility changes, workflows altered to print "
          "secrets, pushes by an unknown device.",
          "Customer or finance systems: report exports, changes to "
          "payment details, new administrators or API keys.",
          "Identity provider integrations: new SSO applications, changed "
          "SAML settings or added signing certificates (T1606.002, Forge "
          "Web Credentials: SAML Tokens, in the most serious cases).",
          "Third-party integrations: connected apps and API tokens that "
          "outlive passwords; list them and remove those no longer "
          "needed.",
        ],
      ),
      LessonSection(
        heading: "Business Email Compromise and Impersonation",
        body:
            "Not every fraud message comes from a compromised account. "
            "Business email compromise (BEC) also uses look-alike domains, "
            "display-name tricks and spoofed addresses (T1656, "
            "Impersonation, under Defense Evasion). The first job is to "
            "decide which situation you have, because the response differs.\n"
            "\n"
            "If the sender is a real account that has been compromised, the"
            " sign-in and audit logs will show unusual access, rules or "
            "forwarding. If the sender is an outside look-alike, there is "
            "nothing wrong with your tenant; the domain, headers and "
            "reply-to address will show it (see the email chapter for "
            "header reading). If the sender is truly your user acting under"
            " pressure from a social engineer, neither will show anything "
            "and the answer is in a phone call. Always verify payment "
            "changes through a known phone number, and record who verified "
            "what.",
      ),
      LessonSection(
        heading: "Annotated Example: Containment and Scoping Note",
        isTemplate: true,
        body:
            "SAMPLE CONTAINMENT NOTE (fictional)\n"
            "\n"
            "CASE: Mailbox compromise, vikram.s@corp.example\n"
            "DETECTED: 13:58 via user report of odd outbound message\n"
            "CONFIRMED COMPROMISE WINDOW: 13:02 to 14:10 (account disabled "
            "14:10)\n"
            "\n"
            "CONTAINMENT DONE\n"
            "- Sessions revoked, password reset, extra authentication "
            "method removed: 14:10\n"
            "- Inbox rule and forwarding address removed: 14:18\n"
            "- 46 internal messages purged from mailboxes: 14:35 (12 had "
            "been opened)\n"
            "- Domain mailbox-fwd.example blocked at gateway: 14:40\n"
            "\n"
            "SCOPING\n"
            "- Messages forwarded externally between 13:07 and 14:18: 31 "
            "(subjects reviewed; 4 contain finance data)\n"
            "- Other accounts signing in from 203.0.113.31: none\n"
            "- Users who clicked the link in the internal phish: 3, "
            "passwords reset, sessions revoked\n"
            "\n"
            "OPEN ITEMS: Partner notification (finance owner), legal review"
            " of the 4 finance messages, MFA method review for Finance "
            "team, retrospective on why the sign-in produced no alert.",
      ),
      LessonSection(
        heading: "Common Mistakes and What to Check First",
        body:
            "These errors repeat across cases. Check your own work against "
            "the list.",
        bullets: [
          "Removing the visible rule and missing forwarding, delegate "
          "access or a second hidden rule.",
          "Resetting the password without revoking sessions and app "
          "consents.",
          "Stopping at one mailbox. Look for the same source IP, same "
          "rule names and same lure in other accounts.",
          "Forgetting to check what was read. Without mail access logs, "
          "state clearly that you cannot prove what was not read.",
          "Alerting the attacker by contacting the compromised user over "
          "the same compromised mailbox. Use a separate channel.",
          "Ignoring external victims. Partners and customers who received"
          " fraudulent mail need to be told.",
          "Skipping the user conversation. Ask what the user clicked, "
          "approved or typed, and when; the answer often dates the "
          "compromise more precisely than any log, and it tells you which"
          " other users received the same lure.",
        ],
      ),
      LessonSection(
        heading: "Habits for Mailbox and SaaS Cases",
        body:
            "Work these cases in a fixed order so nothing is skipped under "
            "pressure. Start with the sign-in that began the access, then "
            "list every change the account made, then list every message "
            "and file it touched, then widen to other accounts sharing the "
            "same infrastructure. Keep a running list of persistence items "
            "as you find them and tick each one off only when you have "
            "removed it and checked it is gone. Ask the business owner "
            "early what the account could reach, because a finance mailbox,"
            " an executive calendar and a shared support inbox carry very "
            "different risks. Finally, write the notification list as you "
            "go (users, partners, legal, privacy), so that nothing waits "
            "until the end of the shift.",
      ),
    ],
  ),
  Lesson(
    title: "A Cloud Investigation Workflow and Habits of a Good Analyst",
    estimatedMinutes: 17,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "From Alert to Answer",
        body:
            "Previous lessons covered individual attacks. In practice you "
            "receive an alert and have to decide what to do with limited "
            "time. A repeatable workflow keeps you from jumping to "
            "conclusions and makes your notes useful to the next person. "
            "The workflow below applies to identity, cloud and SaaS "
            "incidents alike.",
        bullets: [
          "1. Scope the alert: which identity, which resource, which "
          "time, and what rule fired. Write the hypothesis in one "
          "sentence.",
          "2. Verify the data: confirm the logs cover the period and are "
          "complete. Note gaps.",
          "3. Establish the baseline: what does this identity normally "
          "do, from where, with which tools.",
          "4. Build the timeline: sign-ins, then control-plane and audit "
          "events, then data access, all in UTC, in one list.",
          "5. Pivot: from the attacker IP, user agent, key ID, session "
          "ID, application ID or domain to every other place they appear.",
          "6. Decide scope: how many identities, resources and data sets "
          "were touched.",
          "7. Contain: revoke sessions and tokens, disable or rotate "
          "keys, remove persistence, block indicators.",
          "8. Eradicate and recover: close the root cause, restore "
          "settings, verify nothing returned.",
          "9. Report and improve: document findings, evidence and "
          "recommended control changes.",
        ],
      ),
      LessonSection(
        heading: "Pivoting: Where the Time Is Won",
        body:
            "A pivot takes a single detail and turns it into a search "
            "across the environment. In cloud work, a handful of pivots "
            "solve most cases.",
        bullets: [
          "Source IP: every sign-in and API call from this address, "
          "across all users, keys and applications, for as long as logs "
          "go back.",
          "User agent: unusual strings are shared by tools, so they "
          "connect events that look unrelated.",
          "Access key or session ID: everything done with it, including "
          "roles it assumed and keys it created.",
          "Application or client ID: all users who consented, all "
          "sign-ins the app made.",
          "Created objects: users, roles, keys, rules, forwarding "
          "addresses, inbox delegates and consents made during the "
          "incident are persistence until proven otherwise.",
          "Timing: actions in the minutes right after a risky sign-in. "
          "Persistence usually comes fast, before the attacker is worried"
          " about being caught.",
        ],
      ),
      LessonSection(
        heading: "Annotated Example: A Combined Timeline",
        isTemplate: true,
        body:
            "SAMPLE INVESTIGATION TIMELINE (fictional, UTC)\n"
            "\n"
            "Day 1  09:02  Phishing email delivered to 3 users (message "
            "trace)\n"
            "Day 1  09:10  User A clicks link; sign-in from 203.0.113.140 "
            "with MFA satisfied (sign-in log)\n"
            "Day 1  09:18  Second session for User A from 198.51.100.88 "
            "using token claim (sign-in log)\n"
            "Day 1  09:21  Inbox rule created, forwarding set (audit log)\n"
            "Day 1  09:40  Consent to application \"SecureDocs Sync\" by User"
            " A (audit log)\n"
            "Day 1  11:05  User A downloads 220 files from shared drive "
            "(SaaS audit log)\n"
            "Day 2  02:30  App \"SecureDocs Sync\" reads mail via API from "
            "203.0.113.9 (non-interactive sign-in)\n"
            "Day 2  03:12  User A's cloud access key listed in a developer "
            "wiki is used from 203.0.113.9 (CloudTrail)\n"
            "Day 2  03:15  New access key created for user ops-temp "
            "(CloudTrail)\n"
            "\n"
            "HOW AN ANALYST READS IT\n"
            "\n"
            "1. One phishing email links five systems: mail, identity, file"
            " sharing, an OAuth app and a cloud account.\n"
            "2. Without merging logs into one timeline, each team would see"
            " only one fragment and call it low severity.\n"
            "3. The shared IP 203.0.113.9 connects the app activity to the "
            "cloud key use. It is the pivot that expanded the scope.\n"
            "4. The persistence is in four places: forwarding rule, OAuth "
            "grant, new access key, and the new user. Containment must "
            "cover each.\n"
            "\n"
            "LESSON: Scope by following the attacker's identity and "
            "infrastructure, not by following the first alert.",
      ),
      LessonSection(
        heading: "Containment in the Cloud",
        body:
            "Cloud containment is mostly about identities. Isolating a "
            "laptop does nothing when the attacker is using a token from "
            "another country. Typical actions, which you will usually "
            "perform with or through the identity and cloud teams, are "
            "listed below.",
        bullets: [
          "Revoke refresh tokens and active sessions for the user, not "
          "just reset the password.",
          "Disable the account if the situation warrants it, "
          "understanding the business impact first, especially for "
          "service accounts.",
          "Disable and rotate exposed or abused access keys; delete keys "
          "the attacker created.",
          "Remove unauthorized role assignments, MFA methods, mailbox "
          "rules, forwarding, delegates and app consents.",
          "Block attacker infrastructure and lure domains at the proxy, "
          "mail gateway and conditional access.",
          "Restore disabled logging and keep a copy of the relevant logs "
          "before retention expires.",
          "Apply temporary restrictive policy: for instance, require "
          "compliant devices for the affected group while the "
          "investigation continues.",
          "Record every action with time, person and reason. Containment "
          "steps are also evidence.",
        ],
      ),
      LessonSection(
        heading: "Evidence and Reporting",
        body:
            "Cloud logs are your evidence, and they age out. Export the "
            "relevant window early, record the query you used and the time "
            "range, and store the export with a hash. Note the time zone of"
            " every source; mixing time zones in a timeline is a common "
            "cause of wrong conclusions.\n"
            "\n"
            "A good report separates what you observed from what you "
            "concluded. State the facts with their source (\"sign-in log, "
            "09:03, IP 203.0.113.140\"), the confidence level, and what you "
            "could not determine. Do not claim data was not accessed unless"
            " you have access logs that prove it; say instead that the logs"
            " available do not show access, and name the gap. Close with "
            "specific recommendations: policies, logging, detections and "
            "user guidance that would have prevented or shortened the "
            "incident.",
      ),
      LessonSection(
        heading: "Checklist: Cloud Incident Closing Review",
        isTemplate: true,
        body:
            "BEFORE YOU CLOSE THE CASE\n"
            "\n"
            "[ ] Root cause stated (phish, exposed key, weak policy, "
            "misconfiguration)\n"
            "[ ] Compromised identities listed, with sessions and tokens "
            "revoked\n"
            "[ ] Persistence searched: rules, forwarding, delegates, "
            "consents, keys, roles, MFA methods, new users\n"
            "[ ] Attacker infrastructure pivoted across all logs and "
            "blocked\n"
            "[ ] Data exposure assessed with evidence and gaps stated\n"
            "[ ] Logging confirmed on and exports saved\n"
            "[ ] Affected users, partners and owners notified\n"
            "[ ] Detection or control improvement proposed with an owner\n"
            "[ ] Timeline, indicators and decisions recorded in the ticket",
      ),
      LessonSection(
        heading: "Habits of a Good Analyst",
        body:
            "Technical knowledge gets you started. Habits make the work "
            "reliable.",
        bullets: [
          "Question the trust you are given. A valid sign-in, a genuine "
          "page and a known name each prove less than they appear to.",
          "Write down your hypothesis, then look for evidence that would "
          "prove it wrong.",
          "Think in timelines. Order beats volume: ten events in the "
          "right order explain more than a thousand in a pile.",
          "Always check persistence. Containing the visible compromise "
          "without finding the quiet one invites a return.",
          "Know your logs before the incident: where they are, how long "
          "they last and what they leave out.",
          "Separate facts, inferences and gaps in every note.",
          "Communicate early with the identity, cloud and business "
          "owners; they hold context you cannot see.",
          "Use time zones consistently, usually UTC, and keep a record of"
          " the source of every claim.",
          "Learn the attacker's goal. Money, data or access each shapes "
          "where they go next.",
          "Share what you learn: a new detection, a lesson in the ticket "
          "or a note for the next shift improves the whole team.",
        ],
      ),
      LessonSection(
        heading: "Where to Practice and Check Current Information",
        body:
            "Use the MITRE ATT&CK knowledge base at "
            "https://attack.mitre.org to look up the techniques named in "
            "this chapter, and read the detection notes for each. Provider "
            "documentation for log schemas changes often, so always check "
            "the current pages before relying on a field or an error code. "
            "For practice, set up a free or trial account with small "
            "budgets and alerts, turn on audit logging, and generate your "
            "own events: sign in from a new browser, create a user, change "
            "a role, then find those events in the logs. Open-source tools "
            "such as Sysmon, Zeek, Suricata, Velociraptor and osquery cover"
            " the endpoint and network side, and CyberChef is useful for "
            "decoding values pulled from logs; check current availability "
            "before planning around any of them.",
      ),
    ],
  ),
  Lesson(
    title: "Practice Test: Identity, Cloud & SaaS Investigations",
    estimatedMinutes: 10,
    difficulty: LessonDifficulty.intermediate,
    quiz: [
      QuizQuestion(
        question: "Two sign-ins for the same user come from different countries "
                  "20 minutes apart, and the second says MFA was satisfied by a "
                  "token claim. What is the most likely explanation to test "
                  "first?",
        options: [
          "The user restarted the authenticator app and it replayed an "
          "old code",
          "The user's password was guessed and MFA was bypassed by a "
          "policy bug",
          "The identity provider randomly skips MFA when a country "
          "changes",
          "A session token that passed MFA was replayed from another "
          "device",
        ],
        correctIndex: 3,
        explanation:
            "A token claim means an existing authenticated session was "
            "presented, which is what stolen cookies look like. Random MFA "
            "skipping is not a normal behavior, so it should not be the "
            "first theory.",
      ),
      QuizQuestion(
        question: "A user's sign-in log shows 14 MFA prompts denied over ten "
                  "minutes at 3 a.m., then one approval. What technique does this"
                  " suggest?",
        options: [
          "Kerberoasting of service accounts from a workstation",
          "MFA fatigue, with the password already known",
          "Password spraying across many accounts from one address",
          "Token replay through a reverse-proxy phishing page",
        ],
        correctIndex: 1,
        explanation:
            "Many prompts for one account ending in an approval is prompt "
            "bombing and implies the password is already known. Spraying "
            "would show many accounts, not many prompts for one.",
      ),
      QuizQuestion(
        question: "After confirming an AiTM phishing compromise, which action is "
                  "most important besides resetting the password?",
        options: [
          "Revoke sessions and tokens and remove any added authentication"
          " methods",
          "Wait for the stolen token to expire naturally and monitor in "
          "the meantime",
          "Reimage the user's laptop before doing anything else in the "
          "cloud",
          "Block the phishing sender and leave the user session as it is",
        ],
        correctIndex: 0,
        explanation:
            "The attacker holds a valid session and may have registered "
            "their own method, so a password reset alone leaves access "
            "intact. Reimaging the laptop misses the issue because the "
            "endpoint was probably never infected.",
      ),
      QuizQuestion(
        question: "A user was asked on a call to enter a short code on a genuine "
                  "Microsoft sign-in page, and later the attacker accessed their "
                  "mail. Which flow was abused?",
        options: [
          "Authorization code flow with a forged redirect address",
          "Kerberos delegation between two trusted domains",
          "The device code flow, started by the attacker",
          "Legacy basic authentication over an IMAP connection",
        ],
        correctIndex: 2,
        explanation:
            "In device code phishing the real page and real MFA are used, "
            "but the tokens go to the attacker's waiting session. The "
            "domain is genuine, so checking the URL would not have helped.",
      ),
      QuizQuestion(
        question: "Twelve users consent to an unverified app in one afternoon, "
                  "requesting Mail.Read and offline_access. What is the right "
                  "containment step?",
        options: [
          "Force a password reset for all twelve users and close the case",
          "Disable the application and revoke the grants of all who "
          "accepted",
          "Disable the application and revoke the grants for every user "
          "who accepted",
          "Block the sender's email domain and rely on the next token "
          "expiry",
        ],
        correctIndex: 1,
        explanation:
            "OAuth grants survive password resets because the app holds its"
            " own token. Blocking the sender stops new lures but leaves the"
            " existing grants working.",
      ),
      QuizQuestion(
        question: "On a domain controller, one account requests service tickets "
                  "for thirteen different SPNs in two seconds, all using RC4. "
                  "What is the best description?",
        options: [
          "A normal logon burst from a user starting several applications",
          "Probable Kerberoasting, so check the host and targeted "
          "accounts",
          "A DCSync attempt, because ticket requests imitate replication",
          "Probable Kerberoasting, so check the host and targeted "
          "accounts",
        ],
        correctIndex: 3,
        explanation:
            "Many distinct service tickets with a weak cipher, requested by"
            " tooling, is the Kerberoasting pattern. DCSync would show "
            "replication rights in event 4662, not ticket requests.",
      ),
      QuizQuestion(
        question: "Event 4662 shows replication permissions being used by a "
                  "regular user account from a member server. What should the "
                  "analyst conclude?",
        options: [
          "It is routine replication between two domain controllers",
          "It is a failed logon attempt recorded with the wrong event ID",
          "It is likely DCSync, which should be treated as high severity",
          "It is likely DCSync, which should be treated as high severity",
        ],
        correctIndex: 2,
        explanation:
            "Replication is legitimate only between domain controllers, so "
            "the requester's identity and source decide the verdict. "
            "Assuming it is routine ignores that the requester is not a DC.",
      ),
      QuizQuestion(
        question: "An unexpected member is added to Domain Admins at 23:18 by a "
                  "helpdesk account with no change ticket. What is the best first"
                  " move?",
        options: [
          "Gather context on actor and host, then escalate and contain",
          "Delete the new group member and close the alert as resolved",
          "Wait for the next business day and ask the helpdesk manager",
          "Gather context on actor and host, then escalate and contain",
        ],
        correctIndex: 0,
        explanation:
            "An unapproved privileged group change is critical and may "
            "reflect a compromised helpdesk account. Removing the member "
            "without investigating leaves the actor and the path they used "
            "untouched.",
      ),
      QuizQuestion(
        question: "In CloudTrail you see an access key starting with ASIA making "
                  "API calls. What does that prefix tell you?",
        options: [
          "It is the account's root key and always suspicious",
          "It is a long-term key belonging to an IAM user",
          "It is a temporary credential issued by a token service",
          "It is a temporary credential issued by a token service",
        ],
        correctIndex: 3,
        explanation:
            "ASIA keys come from security token service sessions, while "
            "AKIA keys are long-term. The prefix says nothing about whether"
            " the use is malicious, so you still need to check where it "
            "came from.",
      ),
      QuizQuestion(
        question: "A researcher reports an access key in a public repository "
                  "committed four days ago. Where should the log review start?",
        options: [
          "From first exposure of the key, covering all regions",
          "From first exposure of the key, covering all regions",
          "From the time the researcher sent the report, in the main "
          "region",
          "From the date the repository was made public, on the "
          "repository only",
        ],
        correctIndex: 1,
        explanation:
            "The key may have been used well before anyone reported it, and"
            " attackers often use unfamiliar regions. Starting at the "
            "report date misses the earlier activity.",
      ),
      QuizQuestion(
        question: "CloudTrail shows StopLogging called by a key that earlier ran "
                  "GetCallerIdentity and a denied ListUsers. What does this "
                  "sequence indicate?",
        options: [
          "An attacker probing an unfamiliar key, then hiding activity",
          "An attacker probing an unfamiliar key, then hiding activity",
          "A developer testing the build pipeline after a change",
          "The cloud provider rotating the trail configuration",
        ],
        correctIndex: 0,
        explanation:
            "Asking who the key is, hitting denials and then disabling "
            "logging is typical of someone with a stolen credential. A "
            "routine pipeline change would not be probing permissions and "
            "then turning logging off.",
      ),
      QuizQuestion(
        question: "A mailbox compromise response removes a blank-named inbox "
                  "rule. What else must be checked before closing?",
        options: [
          "Only whether the user changed their desktop wallpaper",
          "Forwarding, delegates and added authentication methods",
          "Forwarding, delegates and added authentication methods",
          "Nothing further, since the rule was the only persistence",
        ],
        correctIndex: 2,
        explanation:
            "Forwarding settings and delegates are separate from rules, so "
            "removing a rule can leave the data leak running. Treating the "
            "rule as the only persistence is a common cause of repeat "
            "compromises.",
      ),
      QuizQuestion(
        question: "You cannot find mail access events for a compromised mailbox. "
                  "How should the report describe what the attacker read?",
        options: [
          "State that no mail was read because nothing was logged",
          "State that logs do not show access, and name the gap",
          "Assume everything was read and skip further analysis",
          "State that logs do not show access, and name the gap",
        ],
        correctIndex: 1,
        explanation:
            "Absence of logs is not proof of absence of access, so the "
            "report must separate evidence from limits. Claiming nothing "
            "was read overstates what the data supports.",
      ),
      QuizQuestion(
        question: "An investigation links a phishing email, an OAuth app and a "
                  "cloud key through one shared IP address. What is this "
                  "technique called, and why does it matter?",
        options: [
          "Log rotation, which keeps older events from being overwritten",
          "Pivoting on attacker infrastructure, which widens the scope",
          "Pivoting on attacker infrastructure, which widens the scope",
          "Baseline tuning, which removes noisy events from the alert "
          "queue",
        ],
        correctIndex: 2,
        explanation:
            "Searching every log for the same IP connects systems that each"
            " looked low severity alone. Baseline tuning reduces noise and "
            "would not reveal the connection between systems.",
      ),
    ],
  ),
];
