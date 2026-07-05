import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> iamLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Identity and Access Management (IAM) Solutions',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'What IAM Actually Is',
        body:
            'Identity and Access Management (IAM) is the complete '
            'discipline of managing digital identities and controlling '
            'exactly what those identities can access, throughout their '
            'entire lifecycle — from the moment an account is created to '
            'the moment it\'s finally deactivated. Every technical '
            'control in this lesson exists to answer one of two '
            'questions reliably: "who is this?" and "what should they '
            'be allowed to do?"',
      ),
      LessonSection(
        heading: 'The Four Core IAM Processes',
        bullets: [
          'Identification — establishing a unique identity for a person or system (a username, an employee ID, a device certificate)',
          'Authentication — proving that identity is genuine, typically through a password, a physical device, or a biometric characteristic',
          'Authorization — determining what an authenticated identity is actually permitted to do',
          'Accounting — monitoring and logging what an authenticated, authorized identity actually does, creating an audit trail',
        ],
      ),
      LessonSection(
        heading: 'How Authentication and SSO Actually Work Together',
        body:
            'A generic authentication exchange always follows the same '
            'basic shape — claim an identity, present a credential, have '
            'it verified, then get access granted or denied. Single '
            'Sign-On builds directly on top of this same flow, adding '
            'one additional step: once verified by a central identity '
            'provider, that same proof of identity is reused across '
            'every connected application, without repeating the '
            'authentication step for each one.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['User Authenticates Once', 'Identity Provider Verifies', 'Trust Token Issued', 'Access to Every Connected App'],
          caption:
              'This single verification, performed once against a '
              'central identity provider, is what eliminates the need '
              'to log in separately to every connected application.',
        ),
      ),
      LessonSection(
        heading: 'Beyond the Four Core Processes: The Full Identity Lifecycle',
        bullets: [
          'Provisioning — creating a new user account and granting the initial set of access appropriate to their role, ideally automatically tied to HR onboarding',
          'Deprovisioning — promptly removing an account\'s access when someone leaves or changes roles; delayed deprovisioning is one of the most common, entirely preventable sources of unauthorized access',
          'Identity proofing — verifying that a real-world individual actually is who they claim to be before an account is even created, using government ID checks, in-person verification, or knowledge-based verification',
          'Interoperability — the ability for identity systems across different platforms, vendors, and organizations to work together using shared standards, rather than every system requiring its own separate, incompatible identity silo',
          'Attestation — a formal, periodic review process where managers or system owners explicitly confirm that existing access is still appropriate, catching accumulated unnecessary permissions before they become a real risk',
        ],
      ),
      LessonSection(
        heading: 'A Real-World Example: The Full Lifecycle in Action',
        body:
            'A new employee\'s account is automatically provisioned the '
            'moment HR marks their start date, granted exactly the '
            'access their specific role template defines — no more, no '
            'less. Over the following two years, they change teams '
            'twice, each time triggering an access review. Every '
            'quarter, their manager attests that their current access '
            'still matches their current role. When they eventually '
            'resign, deprovisioning is triggered automatically the '
            'moment HR processes their termination, revoking every '
            'system access simultaneously rather than relying on '
            'someone remembering to manually disable each individual '
            'account across a dozen different systems.',
      ),
      LessonSection(
        heading: 'Multi-Factor Authentication, In Real Depth',
        body:
            'Building on the three authentication factors you may '
            'already recognize — something you know, something you '
            'have, something you are — modern IAM increasingly '
            'incorporates two additional factors for stronger, more '
            'context-aware authentication.',
        bullets: [
          'Something you know — a password, a PIN, a security question answer',
          'Something you have — a phone, a hardware security key, a smart card',
          'Something you are — a fingerprint, facial recognition, an iris scan',
          'Something you do — behavioral biometrics: typing rhythm, mouse movement patterns, gait recognition on mobile devices',
          'Somewhere you are — location-based verification, flagging or blocking logins from unexpected or impossible locations',
        ],
      ),
      LessonSection(
        heading: 'Passkeys: The Passwordless Future',
        body:
            'A passkey is a phishing-resistant, passwordless credential '
            'built on public-key cryptography — a private key stays '
            'securely on the user\'s device (often protected by a TPM or '
            'secure enclave, both covered in the Cryptography module), '
            'while the corresponding public key is registered with the '
            'service. Logging in simply requires proving possession of '
            'the private key, typically through a device unlock like a '
            'fingerprint or PIN, with no password ever typed, sent, or '
            'stored anywhere for an attacker to phish or steal in the '
            'first place.',
      ),
      LessonSection(
        heading: 'Tokens and Biometrics in Practice',
        bullets: [
          'Hardware tokens — physical devices like a YubiKey generating or storing cryptographic proof of identity',
          'Software tokens — authenticator apps generating time-based one-time codes',
          'Biometric authentication — increasingly built directly into consumer devices (Face ID, Windows Hello), and the primary unlock mechanism most passkey implementations actually rely on',
        ],
      ),
      LessonSection(
        heading: 'Where Each IAM Component Should Actually Be Used',
        bullets: [
          'MFA — on every account without exception, especially email, VPN, and any administrative access',
          'SSO — anywhere an organization manages more than a handful of applications, to centralize authentication policy and reduce password fatigue',
          'PAM — specifically for administrative and privileged accounts, covered in full depth in the final lesson of this module',
          'Passkeys — increasingly the recommended default for both consumer and enterprise applications wherever platform support exists',
        ],
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Password Security',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Why Passwords Still Matter, Even With MFA',
        body:
            'It might seem like MFA makes password strength less '
            'important — after all, a stolen password alone shouldn\'t '
            'be enough to log in. In practice, a weak password remains '
            'genuinely risky even with MFA in place: some MFA '
            'implementations can be bypassed through fatigue attacks or '
            'social engineering, and a compromised password is often '
            'reused across other, less protected accounts the same '
            'person controls. Strong passwords and MFA are complementary '
            'layers, not substitutes for each other.',
      ),
      LessonSection(
        heading: 'Password Rotation: A Practice That Has Evolved',
        body:
            'Older security guidance strongly recommended forcing '
            'frequent password changes — every 30, 60, or 90 days. '
            'Current guidance, including from NIST, has shifted away '
            'from mandatory frequent rotation for most accounts, since '
            'forced frequent changes tend to push users toward '
            'weaker, more predictable patterns (incrementing a number at '
            'the end, for example) rather than genuinely stronger '
            'passwords. Rotation still matters immediately and '
            'specifically after any suspected or confirmed compromise, '
            'and organizations with especially high-risk accounts may '
            'still reasonably choose periodic rotation as an added '
            'layer.',
      ),
      LessonSection(
        heading: 'The Core Password Policy Settings',
        bullets: [
          'Length — modern guidance favors longer minimums (12 or more characters) over complex character requirements, since length contributes more to actual crack resistance than forced special characters',
          'Complexity — requiring a mix of character types; still commonly required, though increasingly considered less important than sheer length alone',
          'Reuse (password history) — preventing immediate reuse of recent previous passwords',
          'Expiration — how long a password remains valid before a change is required, if rotation is enforced at all',
          'Minimum age — preventing a user from changing their password repeatedly in quick succession specifically to cycle back to a previously used one before history tracking catches it',
        ],
      ),
      LessonSection(
        heading: 'Enforcing Password Policy via Windows 11 Local Group Policy',
        body:
            'On a standalone Windows 11 machine (not joined to a domain, '
            'where Group Policy from Active Directory would normally '
            'apply instead), password policy is configured through the '
            'Local Group Policy Editor: open gpedit.msc, then navigate '
            'to Computer Configuration then Windows Settings then '
            'Security Settings then Account Policies then Password '
            'Policy. From there, settings including minimum password '
            'length, maximum password age, password history size, and '
            'complexity requirements can each be configured directly, '
            'applying immediately to every local account on that '
            'machine.',
      ),
      LessonSection(
        heading: 'Password Managers',
        body:
            'A password manager generates, stores, and automatically '
            'fills genuinely long, random, unique passwords for every '
            'account, protected behind a single strong master password '
            'or biometric unlock. This directly solves the practical '
            'problem behind most weak passwords in the first place — '
            'nobody can realistically memorize dozens of genuinely '
            'strong, unique passwords without help, and a password '
            'manager removes that burden entirely.',
      ),
      LessonSection(
        heading: 'Passwordless Options',
        body:
            'Beyond passkeys (covered in the previous lesson), '
            'passwordless authentication increasingly includes '
            'certificate-based device authentication, biometric-only '
            'login on managed devices, and magic links sent to a '
            'verified email or phone. All of these share the same core '
            'goal: eliminating the password itself as an attack '
            'surface, rather than simply trying to make passwords '
            'stronger.',
      ),
      LessonSection(
        heading: 'Password Attacks: How Attackers Actually Crack Passwords',
        bullets: [
          'Brute force — systematically trying every possible character combination until the correct one is found; effective against short or simple passwords but increasingly impractical against genuinely long, random ones',
          'Dictionary attack — trying every word in a large wordlist of common passwords, names, and known leaked passwords, rather than every possible combination blindly',
          'Password spraying — trying one commonly used password (like "Password123") against many different accounts, rather than many passwords against one account, specifically to avoid triggering account lockout thresholds tied to a single account',
          'Hybrid attacks — combining dictionary words with common modifications (appending numbers, substituting letters with symbols) to catch passwords that are "almost" in the dictionary but not an exact match',
        ],
      ),
      LessonSection(
        heading: 'Defenses Against Password Attacks',
        bullets: [
          'Password complexity and length — directly increases the mathematical search space an attacker must work through',
          'Limited login attempts (account lockout) — directly blocks brute-force and dictionary attacks against any single account after a defined number of failures',
          'CAPTCHAs — specifically slow down or block automated, scripted login attempts, forcing a human-solvable challenge before further attempts are permitted',
          'Multi-factor authentication — even if a password attack fully succeeds and recovers the correct password, MFA still blocks the actual account takeover',
        ],
      ),
      LessonSection(
        heading: 'Why Password Spraying Specifically Evades Naive Defenses',
        body:
            'An account lockout policy tuned only to detect many failed '
            'attempts against one specific account can completely miss '
            'password spraying, since each individual account only ever '
            'receives one or two attempts — the attack\'s volume is '
            'spread thin across many accounts instead. Detecting '
            'spraying specifically requires monitoring for many failed '
            'logins across an entire organization within a short time '
            'window, not just per-account thresholds, which is exactly '
            'the kind of correlation a SIEM (covered in the SOC '
            'Operations module) is built to catch.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Single Sign-On and Federation',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'SSO vs. a Normal Sign-On',
        body:
            'Without SSO, a user logging into three separate '
            'applications must authenticate three separate times, each '
            'application maintaining its own independent login screen '
            'and often its own separate password. With SSO, one '
            'successful login against a central identity provider grants '
            'access to every connected application without repeating '
            'authentication for each one.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.ssoComparison),
      ),
      LessonSection(
        heading: 'How SSO Actually Works: The Identity Provider',
        body:
            'An Identity Provider (IdP) is the central system that '
            'actually performs authentication and then vouches for that '
            'authenticated identity to every other connected '
            'application, called service providers. Rather than each '
            'individual application needing to verify a password itself, '
            'it simply trusts an assertion from the IdP confirming who '
            'the user is.',
      ),
      LessonSection(
        heading: 'The Protocols Behind SSO',
        bullets: [
          'LDAP (Lightweight Directory Access Protocol) — a protocol for querying and maintaining a centralized directory of users and groups, commonly the underlying directory an IdP draws from',
          'OAuth — an authorization protocol (not itself an authentication protocol) that lets a user grant one application limited access to their data on another application, without sharing their actual password with the first application',
          'SAML (Security Assertion Markup Language) — an XML-based standard specifically for exchanging authentication and authorization data between an IdP and service providers, widely used in enterprise SSO',
        ],
      ),
      LessonSection(
        heading: 'A Real-World Example',
        body:
            'An employee logs into their company\'s IdP once each '
            'morning. Throughout the day, they open their email, their '
            'HR system, their expense reporting tool, and their project '
            'management software — each one silently trusts the IdP\'s '
            'earlier authentication rather than presenting its own '
            'separate login screen, because each one is configured as a '
            'connected service provider trusting assertions from that '
            'same IdP.',
      ),
      LessonSection(
        heading: 'SSO\'s Real Advantages',
        bullets: [
          'Usability — one login instead of dozens, directly reducing password fatigue',
          'Productivity — no time lost repeatedly authenticating throughout the day',
          'Security — centralizing authentication lets an organization enforce strong policy (MFA, conditional access) in one place rather than trying to enforce it consistently across dozens of separately managed applications',
          'Simplified deprovisioning — disabling one central account immediately cuts off access to every connected application at once',
        ],
      ),
      LessonSection(
        heading: 'Federation: Extending SSO Across Organizations',
        body:
            'Federation extends the same underlying concept beyond a '
            'single organization\'s own applications — linking identities '
            'across separate, independent organizations so a user '
            'authenticated by their own organization\'s IdP can access '
            'a partner organization\'s resources without needing a '
            'completely separate account and password there.',
      ),
      LessonSection(
        heading: 'The Six-Step Federated Login Flow',
        body:
            'A typical federated login, using SAML or OpenID Connect, '
            'follows a consistent sequence.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: [
            'User Requests Resource',
            'Redirected to Home IdP',
            'User Authenticates',
            'IdP Issues Assertion',
            'Assertion Sent to Partner',
            'Access Granted',
          ],
          caption:
              'The user never creates a separate account with the '
              'partner organization at all — their home organization\'s '
              'IdP vouches for them directly.',
        ),
      ),
      LessonSection(
        heading: 'SAML vs. OpenID Connect',
        body:
            'SAML is the older, XML-based standard, still dominant in '
            'many enterprise environments and B2B federation '
            'scenarios. OpenID Connect, built on top of OAuth 2.0, is '
            'newer, uses lighter JSON-based tokens, and has become the '
            'dominant standard for consumer-facing "sign in with '
            'Google" or "sign in with Microsoft" style federated login '
            'across the web.',
      ),
      LessonSection(
        heading: 'When Should an Organization Actually Federate?',
        body:
            'Federation makes sense specifically when users from one '
            'organization need ongoing, legitimate access to another '
            'organization\'s systems — a university federating with a '
            'partner research institution so visiting researchers can '
            'access shared systems using their home university\'s '
            'existing credentials, or a company federating with a key '
            'supplier\'s procurement portal so employees don\'t need yet '
            'another separate account and password to manage. Federation '
            'isn\'t worth the added complexity for one-off or rarely-'
            'used external access — it earns its overhead specifically '
            'when the relationship is ongoing and involves enough users '
            'that managing separate accounts everywhere would itself '
            'become a real burden and security risk.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Privileged Access Management (PAM)',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'What PAM Actually Is',
        body:
            'Privileged Access Management is the specific discipline of '
            'securing, controlling, and monitoring accounts that hold '
            'elevated access — domain administrators, database '
            'administrators, cloud infrastructure owners, and any other '
            'identity whose compromise would cause disproportionate '
            'damage compared to an ordinary user account.',
      ),
      LessonSection(
        heading: 'How PAM Differs From IAM',
        body:
            'IAM is the broad discipline covering every identity in an '
            'organization, from a brand-new intern to the most senior '
            'system administrator. PAM is a specialized, more tightly '
            'controlled subset focused exclusively on the smaller number '
            'of accounts carrying genuinely privileged access — think of '
            'PAM as IAM\'s most heavily reinforced section, applying '
            'significantly stricter controls specifically where the '
            'consequences of compromise are most severe.',
      ),
      LessonSection(
        heading: 'Why Privileged Accounts Deserve Special Treatment',
        body:
            'As covered in the Windows Security module\'s IAM lesson, '
            'compromising a single privileged account — a Domain Admin, '
            'a Backup Operator, a cloud root account — can grant an '
            'attacker access rivaling or exceeding what a dozen '
            'ordinary compromised accounts combined would provide. Data '
            'breach statistics consistently show privileged account '
            'compromise as a factor in a disproportionate share of the '
            'most severe, costly incidents.',
      ),
      LessonSection(
        heading: 'Just-in-Time (JIT) Permissions',
        body:
            'Rather than granting standing, always-on privileged access, '
            'JIT permissions grant elevated rights only for a specific, '
            'limited window of time when actually needed, automatically '
            'expiring afterward. An administrator who needs to perform '
            'a specific maintenance task requests temporary elevation, '
            'completes the task, and their elevated access automatically '
            'reverts — rather than holding standing administrator rights '
            '365 days a year for a task performed a handful of times.',
      ),
      LessonSection(
        heading: 'Password Vaulting',
        body:
            'A password vault securely stores privileged account '
            'credentials centrally, checking them out to an '
            'administrator only when needed, often automatically '
            'rotating the password immediately after each use. This '
            'means no individual person actually needs to memorize or '
            'permanently know a shared privileged password at all — '
            'every use is checked out, logged, and the credential '
            'rotated afterward, closing off the risk of a departed '
            'employee retaining a memorized privileged password '
            'indefinitely.',
      ),
      LessonSection(
        heading: 'Temporal Accounts',
        body:
            'A temporal account is created for a specific, time-bound '
            'purpose — a contractor engagement, a specific project, an '
            'emergency incident response effort — with a defined '
            'expiration built in from the moment of creation, rather '
            'than relying on someone remembering to manually '
            'deprovision it later. This directly addresses the delayed-'
            'deprovisioning risk covered in the first lesson of this '
            'module, specifically for temporary or short-term access '
            'needs.',
      ),
      LessonSection(
        heading: 'Clear Policies and Continuous Monitoring',
        body:
            'Beyond the specific technical controls above, effective PAM '
            'requires clearly documented policy defining exactly which '
            'roles justify privileged access and under what '
            'circumstances, combined with continuous, active monitoring '
            'of every privileged session — since privileged accounts are '
            'exactly the kind of high-value target where the indicators '
            'of compromise covered in the Malware module deserve the '
            'most immediate attention.',
      ),
      LessonSection(
        heading: 'How PAM Directly Reduces Data Breach Risk',
        body:
            'Bringing this together: enforcing least privilege through '
            'JIT access means there\'s far less standing privileged '
            'access available for an attacker to steal at any given '
            'moment. Password vaulting means privileged credentials are '
            'never memorized, sitting in someone\'s head or written down '
            'somewhere insecure, ready to be phished or guessed. '
            'Temporal accounts mean forgotten, still-active temporary '
            'access simply doesn\'t exist as a category of risk at all. '
            'Together, these controls dramatically shrink the window '
            'and the scope of what any single compromised credential '
            'can actually achieve — precisely the same defense-in-depth '
            'and least-privilege thinking from earlier in this course, '
            'applied with maximum rigor to the accounts that matter most.',
      ),
    ],
  ),

  // 5 --------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'Which of the four core IAM processes creates the audit trail of what an authenticated user actually did?',
        options: ['Identification', 'Authentication', 'Authorization', 'Accounting'],
        correctIndex: 3,
        explanation: 'Accounting monitors and logs actions taken by an authenticated, authorized identity.',
      ),
      QuizQuestion(
        question: 'Delayed deprovisioning is risky primarily because:',
        options: [
          'It slows down new employee onboarding',
          'It leaves access active for someone who no longer needs or should have it, such as a departed employee',
          'It requires more storage space',
          'It only affects password policy',
        ],
        correctIndex: 1,
        explanation: 'Prompt deprovisioning closes off access the moment it is no longer appropriate — delay creates unnecessary risk.',
      ),
      QuizQuestion(
        question: 'What is attestation in the IAM lifecycle?',
        options: [
          'Creating a new user account',
          'A periodic formal review where managers confirm existing access is still appropriate',
          'Generating a one-time password',
          'Encrypting stored credentials',
        ],
        correctIndex: 1,
        explanation: 'Attestation is a recurring review process catching accumulated unnecessary access before it becomes a risk.',
      ),
      QuizQuestion(
        question: 'A passkey is described as phishing-resistant because:',
        options: [
          'It requires a password in addition to the key',
          'No password is ever typed, sent, or stored anywhere for an attacker to phish or steal',
          'It only works on one specific device forever',
          'It is always paired with a hardware token',
        ],
        correctIndex: 1,
        explanation: 'Passkeys rely on public-key cryptography with the private key staying on-device, eliminating a phishable password entirely.',
      ),
      QuizQuestion(
        question: 'Why has guidance shifted away from mandatory frequent password rotation for most accounts?',
        options: [
          'Rotation is now illegal in most countries',
          'Forced frequent changes tend to push users toward weaker, predictable patterns rather than genuinely stronger passwords',
          'Passwords never need to change under any circumstances',
          'MFA has made passwords completely obsolete',
        ],
        correctIndex: 1,
        explanation: 'Frequent forced rotation often results in predictable incremental changes rather than meaningfully stronger passwords.',
      ),
      QuizQuestion(
        question: 'On a standalone Windows 11 machine, where is local password policy configured?',
        options: [
          'Control Panel only',
          'Local Group Policy Editor (gpedit.msc), under Account Policies -> Password Policy',
          'Task Manager',
          'BIOS settings',
        ],
        correctIndex: 1,
        explanation: 'Local Group Policy Editor is used to configure password policy on a non-domain-joined Windows 11 machine.',
      ),
      QuizQuestion(
        question: 'Password spraying is designed specifically to evade:',
        options: [
          'Encryption at rest',
          'Account lockout policies tuned only to detect many failed attempts against one specific account',
          'Firewall rules',
          'DNS filtering',
        ],
        correctIndex: 1,
        explanation: 'Spraying spreads attempts thin across many accounts, so per-account lockout thresholds rarely trigger.',
      ),
      QuizQuestion(
        question: 'A hybrid password attack combines:',
        options: [
          'Two separate CAPTCHAs',
          'Dictionary words with common modifications like appended numbers or symbol substitutions',
          'Biometric and password authentication',
          'Two different MFA factors',
        ],
        correctIndex: 1,
        explanation: 'Hybrid attacks catch passwords that are close to a dictionary word but not an exact match.',
      ),
      QuizQuestion(
        question: 'What role does an Identity Provider (IdP) play in SSO?',
        options: [
          'It stores application data',
          'It performs authentication centrally and vouches for that identity to every connected service provider',
          'It replaces the need for any authentication at all',
          'It only works with biometric login',
        ],
        correctIndex: 1,
        explanation: 'The IdP authenticates the user once and asserts that identity to every connected application.',
      ),
      QuizQuestion(
        question: 'OAuth is best described as:',
        options: [
          'An authentication protocol only',
          'An authorization protocol letting a user grant limited access to their data without sharing their password',
          'A password hashing algorithm',
          'A type of firewall',
        ],
        correctIndex: 1,
        explanation: 'OAuth handles authorization — granting limited access — rather than authentication itself.',
      ),
      QuizQuestion(
        question: 'What does federation specifically enable that ordinary single-organization SSO does not?',
        options: [
          'Stronger password hashing',
          'Linking identities across separate, independent organizations so users can access a partner\'s resources without a separate account',
          'Faster internet speeds',
          'Automatic malware removal',
        ],
        correctIndex: 1,
        explanation: 'Federation extends trust across organizational boundaries, unlike SSO which typically operates within one organization.',
      ),
      QuizQuestion(
        question: 'In a federated login flow, who actually authenticates the user?',
        options: [
          'The partner organization requesting access',
          'The user\'s home organization\'s Identity Provider',
          'A public certificate authority',
          'The web browser itself'
        ],
        correctIndex: 1,
        explanation: 'The home IdP performs authentication and issues an assertion the partner trusts — the user never creates a separate account there.',
      ),
      QuizQuestion(
        question: 'How does PAM differ from IAM in scope?',
        options: [
          'They are identical in every way',
          'PAM is a specialized subset of IAM focused specifically on accounts with elevated, privileged access',
          'PAM covers every user account in an organization',
          'IAM only applies to administrators',
        ],
        correctIndex: 1,
        explanation: 'PAM applies stricter controls specifically to the smaller set of high-risk privileged accounts within the broader IAM discipline.',
      ),
      QuizQuestion(
        question: 'Just-in-time (JIT) permissions reduce risk by:',
        options: [
          'Granting permanent standing access to every administrator',
          'Granting elevated rights only for a limited time window when actually needed, then automatically expiring',
          'Removing the need for any authentication',
          'Encrypting all network traffic',
        ],
        correctIndex: 1,
        explanation: 'JIT access limits how long elevated privileges exist, shrinking the window available for misuse or theft.',
      ),
      QuizQuestion(
        question: 'What problem does password vaulting with automatic rotation solve?',
        options: [
          'It makes passwords unnecessary entirely',
          'No individual person needs to memorize a shared privileged password, and each use is logged with the credential rotated afterward',
          'It eliminates the need for MFA',
          'It replaces the need for a firewall',
        ],
        correctIndex: 1,
        explanation: 'Vaulting removes standing knowledge of privileged credentials and ensures each use is tracked and the password refreshed.',
      ),
      QuizQuestion(
        question: 'A temporal account is specifically designed to:',
        options: [
          'Provide permanent access for a contractor',
          'Have a defined expiration built in from creation, addressing the delayed-deprovisioning risk for short-term access needs',
          'Bypass MFA requirements',
          'Replace the need for a password vault',
        ],
        correctIndex: 1,
        explanation: 'Temporal accounts expire automatically rather than relying on someone remembering to deprovision them later.',
      ),
    ],
  ),
];
