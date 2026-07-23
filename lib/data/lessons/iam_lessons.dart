import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> iamLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Identity and Access Management',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Think of a Corporate Office Building',
        body:
            'Imagine a corporate office building. Before entering a '
            'restricted area, an employee typically shows an ID badge, '
            'enters a PIN or scans a fingerprint, is allowed access '
            'only to authorized areas, and has every entry and exit '
            'recorded. Enterprise IT systems work in a similar way. '
            'They must verify who a user is, what they can access, and '
            'record their activities.',
      ),
      LessonSection(
        heading: 'What IAM Actually Is',
        body:
            'This process is known as Identity and Access Management '
            '(IAM). IAM ensures that the right people have the right '
            'access to the right resources at the right time.',
      ),
      LessonSection(
        heading: 'Why IAM Is Important',
        body: 'Organizations use IAM to:',
        bullets: [
          'Protect sensitive information',
          'Prevent unauthorized access',
          'Support remote and hybrid work',
          'Meet regulatory requirements',
          'Simplify user management',
          'Reduce insider threats',
        ],
      ),
      LessonSection(
        heading: 'What Happens Without It',
        body:
            'Without IAM, users may receive excessive privileges, '
            'increasing the risk of data breaches — access sprawl is '
            'one of the most common, quietly accumulating risks in any '
            'organization that lacks a disciplined IAM program.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/fig_4_1_iam_flow.jpg',
          caption: 'Identity and Access Management verifies user identity and controls access to enterprise resources.',
        ),
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'The Four Pillars of IAM (IAAA)',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Four Fundamental Concepts',
        body: 'IAM is built on four fundamental concepts.',
      ),
      LessonSection(
        heading: '1. Identification',
        body:
            'Identification is the process of claiming an identity. At '
            'this stage, the system does not yet know if the claim is '
            'genuine.',
        bullets: ['Username', 'Employee ID', 'Email address'],
      ),
      LessonSection(
        heading: '2. Authentication',
        body: 'Authentication verifies that the user is who they claim to be.',
        bullets: [
          'Passwords',
          'Fingerprints',
          'Smart cards',
          'One-Time Passwords (OTP)',
          'Face recognition',
          'Security keys',
        ],
      ),
      LessonSection(
        heading: '3. Authorization',
        body:
            'After successful authentication, the system determines '
            'what resources the user is permitted to access.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['User', 'Access'],
          tableRows: [
            ['HR Manager', 'Employee Records'],
            ['Finance Analyst', 'Financial Reports'],
            ['IT Administrator', 'Server Management'],
          ],
        ),
      ),
      LessonSection(
        heading: '4. Accounting (Auditing)',
        body:
            'Accounting records user activities for security, '
            'compliance, and investigations.',
        bullets: [
          'Login time',
          'Logout time',
          'Files accessed',
          'Administrative actions',
          'Failed login attempts',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['User', 'Identification', 'Authentication', 'Authorization', 'Access Granted', 'Accounting (Logging & Auditing)'],
          caption: 'Every access request follows the sequence of identification, authentication, authorization, and accounting.',
        ),
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Identity Lifecycle: Joiner, Mover, Leaver',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'More Than Just Creating Accounts',
        body:
            'Managing identities involves more than creating user '
            'accounts. An enterprise identity follows a lifecycle.',
      ),
      LessonSection(
        heading: 'Join',
        body: 'A new employee joins the organization.',
        bullets: [
          'User account created',
          'Email assigned',
          'Access granted based on job role',
        ],
      ),
      LessonSection(
        heading: 'Move',
        body: 'The employee changes departments.',
        bullets: ['Old permissions removed', 'New permissions assigned'],
      ),
      LessonSection(
        heading: 'Leave',
        body: 'The employee resigns.',
        bullets: [
          'Accounts disabled',
          'Access revoked',
          'Devices recovered',
          'Email archived according to company policy',
        ],
      ),
      LessonSection(
        heading: 'The Joiner–Mover–Leaver (JML) Lifecycle',
        body:
            'This process is often called the Joiner–Mover–Leaver '
            '(JML) lifecycle.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'Sarah joins the Finance department. She automatically '
            'receives access to Finance applications, the payroll '
            'system, corporate email, and shared finance folders. '
            'Later, she transfers to Human Resources. Her Finance '
            'access is removed, and HR permissions are assigned '
            'automatically based on her new role. This reduces the '
            'risk of unnecessary or excessive access.',
      ),
      LessonSection(
        heading: 'Key Takeaways',
        bullets: [
          'IAM ensures users access only the resources they are authorized to use',
          'Identification, Authentication, Authorization, and Accounting form the foundation of IAM',
          'Authentication verifies identity, while authorization determines permissions',
          'The Joiner–Mover–Leaver lifecycle helps organizations manage user access securely throughout employment',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Authentication Methods',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Matching the Method to the Sensitivity',
        body:
            'Authentication is the process of verifying that a user is '
            'who they claim to be. Organizations use different '
            'authentication methods depending on the sensitivity of the '
            'resource being accessed. For example, accessing a public '
            'website may only require a password, while accessing '
            'financial or healthcare systems may require multiple '
            'authentication factors.',
      ),
      LessonSection(
        heading: '1. Something You Know (Knowledge Factor)',
        body: 'This is the most common authentication factor.',
        bullets: ['Password', 'Passphrase', 'PIN (Personal Identification Number)', 'Security questions'],
      ),
      LessonSection(
        heading: 'Knowledge Factor: Advantages and Limitations',
        bullets: [
          'Advantage — easy to implement',
          'Advantage — low cost',
          'Advantage — familiar to users',
          'Limitation — can be guessed or stolen',
          'Limitation — vulnerable to phishing attacks',
          'Limitation — users may reuse passwords across multiple services',
        ],
      ),
      LessonSection(
        heading: '2. Something You Have (Possession Factor)',
        body: 'This factor requires the user to possess a physical or virtual object.',
        bullets: [
          'Smart card',
          'Hardware security key (such as a FIDO2 key)',
          'Mobile authentication app',
          'One-Time Password (OTP) token',
          'Digital certificate stored on a device',
        ],
      ),
      LessonSection(
        heading: 'Possession Factor: Advantages and Limitations',
        bullets: [
          'Advantage — more secure than passwords alone',
          'Advantage — difficult for attackers to duplicate',
          'Limitation — devices can be lost or damaged',
          'Limitation — replacement and management increase operational costs',
        ],
      ),
      LessonSection(
        heading: '3. Something You Are (Inherence Factor)',
        body: 'This factor verifies a unique biological characteristic of the user.',
        bullets: ['Fingerprint', 'Face recognition', 'Iris scan', 'Voice recognition'],
      ),
      LessonSection(
        heading: 'Inherence Factor: Advantages and Limitations',
        bullets: [
          'Advantage — convenient for users',
          'Advantage — difficult to share with others',
          'Limitation — requires specialized hardware',
          'Limitation — environmental conditions may affect accuracy',
          'Limitation — biometric data must be protected because it cannot be changed like a password',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/fig_4_3_auth_factors.jpg',
          caption: 'Authentication factors are grouped into knowledge, possession, and inherence categories.',
        ),
      ),
      LessonSection(
        heading: 'Passwords vs. Passphrases',
        body:
            'A password is typically a short combination of characters, '
            'for example P@ssw0rd!. A passphrase is a longer sequence '
            'of words that is easier to remember and generally more '
            'resistant to brute-force attacks, for example '
            'BlueTiger!RunsAcross7Mountains. Long, unique passphrases '
            'are generally recommended over short, complex passwords.',
      ),
      LessonSection(
        heading: 'Passwordless Authentication',
        body:
            'Many organizations are moving toward passwordless '
            'authentication. Instead of entering a password, users '
            'authenticate using biometrics, hardware security keys, '
            'mobile authenticator approval, or device certificates.',
        bullets: [
          'Reduced phishing risk',
          'Better user experience',
          'Fewer password reset requests',
          'Stronger overall security',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Passwordless authentication is increasingly used with '
            'platforms such as Microsoft Entra ID and modern identity '
            'providers.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A company secures access to its cloud applications using '
            'fingerprint recognition on the employee\'s laptop, a '
            'hardware security key as a backup, device compliance '
            'verification, and Conditional Access policies. Employees '
            'no longer need to remember complex passwords, while the '
            'organization gains stronger protection against credential '
            'theft.',
      ),
      LessonSection(
        heading: 'Comparison of Authentication Methods',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Method', 'Security', 'User Convenience', 'Common Use'],
          tableRows: [
            ['Password', 'Moderate', 'High', 'General user accounts'],
            ['Passphrase', 'High', 'High', 'Enterprise accounts'],
            ['Smart Card', 'High', 'Medium', 'Government and enterprise environments'],
            ['Hardware Security Key', 'Very High', 'Medium', 'Privileged and high-risk accounts'],
            ['Mobile Authenticator', 'High', 'High', 'MFA and cloud applications'],
            ['Biometrics', 'High', 'Very High', 'Mobile devices and laptops'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use long, unique passphrases instead of simple passwords',
          'Avoid password reuse across multiple accounts',
          'Use password managers to generate and store strong credentials',
          'Prefer phishing-resistant authentication methods, such as hardware security keys, for privileged accounts',
          'Enable passwordless authentication where supported',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Multi-Factor Authentication (MFA)',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Is Multi-Factor Authentication?',
        body:
            'Multi-Factor Authentication (MFA) is a security mechanism '
            'that requires users to verify their identity using two or '
            'more independent authentication factors. Even if an '
            'attacker steals a user\'s password, they are unlikely to '
            'have access to the second authentication factor, making '
            'unauthorized access much more difficult. For example, an '
            'employee logs in to a company portal by entering a '
            'password and then approving a notification on their '
            'mobile authentication app.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['User', 'Enter Username & Password', 'Identity Provider', 'Approve MFA (Mobile App or Security Key)', 'Access Granted'],
          caption: 'MFA requires users to complete multiple authentication steps before access is granted.',
        ),
      ),
      LessonSection(
        heading: 'Two-Factor Authentication (2FA) vs. MFA',
        body:
            'Although the terms are often used interchangeably, they '
            'are slightly different. All 2FA is a form of MFA, but MFA '
            'can involve more than two factors.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['', 'Two-Factor Authentication (2FA)', 'Multi-Factor Authentication (MFA)'],
          tableRows: [
            ['Factor count', 'Uses exactly two authentication factors', 'Uses two or more authentication factors'],
            ['Example', 'Password + OTP', 'Password + Fingerprint + Security Key'],
            ['Typical use', 'Common for most online services', 'Often used in enterprise environments'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Common MFA Methods',
        bullets: [
          'Authenticator apps — generate or approve one-time login requests',
          'SMS or email OTPs — send a temporary verification code to the user',
          'Hardware security keys — physical devices that provide phishing-resistant authentication',
          'Biometric verification — fingerprint or facial recognition used as an additional factor',
          'Push notifications — users approve login requests through a trusted mobile application',
        ],
      ),
      LessonSection(
        heading: 'Benefits of MFA',
        bullets: [
          'Reduces the risk of compromised passwords',
          'Protects against many phishing attacks',
          'Improves compliance with security standards',
          'Enhances protection for remote access and cloud services',
          'Secures privileged and administrator accounts',
        ],
      ),
      LessonSection(
        heading: 'Limitations of MFA',
        body: 'While MFA significantly improves security, it is not foolproof.',
        bullets: [
          'Users may lose their authentication device',
          'SMS-based OTPs can be vulnerable to SIM-swapping attacks',
          'Users may approve fraudulent push notifications without careful review',
          'Additional authentication steps may slightly impact user convenience',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A company uses Microsoft Entra ID to protect access to '
            'Microsoft 365. Employees sign in with their corporate '
            'password and a push notification from the Microsoft '
            'Authenticator app. If a login attempt originates from an '
            'unfamiliar location or device, additional verification is '
            'required before access is granted.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Enable MFA for all users, especially administrators',
          'Prefer authenticator apps or hardware security keys over SMS-based OTPs',
          'Educate users to verify login requests before approving them',
          'Require MFA for remote access, VPNs, and cloud applications',
          'Regularly review and update MFA policies',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Single Sign-On (SSO) and Federation',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Is Single Sign-On?',
        body:
            'Single Sign-On (SSO) allows users to authenticate once and '
            'gain access to multiple applications without signing in '
            'repeatedly. Instead of remembering different usernames and '
            'passwords for each application, users authenticate through '
            'a central Identity Provider (IdP), which verifies their '
            'identity and grants access to authorized applications. For '
            'example, after signing in to a corporate account, an '
            'employee can access email, collaboration tools, HR '
            'systems, and cloud applications without logging in again.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/fig_4_5_sso_architecture.jpg',
          caption: 'With Single Sign-On, one successful authentication provides access to multiple authorized applications.',
        ),
      ),
      LessonSection(
        heading: 'Benefits of SSO',
        bullets: [
          'Improves user experience by reducing repeated logins',
          'Decreases password fatigue',
          'Reduces password reset requests',
          'Simplifies user management',
          'Supports centralized security policies',
        ],
      ),
      LessonSection(
        heading: 'What Is Identity Federation?',
        body:
            'Organizations often need users to access applications that '
            'belong to another organization or a cloud service. '
            'Identity Federation enables trusted organizations to share '
            'authentication without creating separate user accounts for '
            'each application. Instead of maintaining multiple '
            'identities, users authenticate with their home '
            'organization, and the trusted service accepts that '
            'authentication. For example, a company employee signs in '
            'using their corporate account to access a third-party '
            'cloud application.',
      ),
      LessonSection(
        heading: 'Common Federation Protocols',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Protocol', 'Primary Use'],
          tableRows: [
            ['SAML', 'Enterprise web applications'],
            ['OAuth 2.0', 'Secure authorization between applications'],
            ['OpenID Connect (OIDC)', 'User authentication for modern web and mobile applications'],
          ],
        ),
      ),
      LessonSection(
        heading: 'SSO vs. Federation',
        body: 'Although closely related, SSO and federation serve different purposes.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['', 'Single Sign-On (SSO)', 'Identity Federation'],
          tableRows: [
            ['Scope', 'One login for multiple applications', 'Trust between different organizations or domains'],
            ['Typical boundary', 'Usually within one organization', 'Often used across organizations or cloud providers'],
            ['Focus', 'User convenience', 'Secure identity sharing'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A company uses Microsoft Entra ID as its Identity '
            'Provider. Employees sign in once using their corporate '
            'credentials and can securely access Microsoft 365, '
            'Salesforce, ServiceNow, and Workday. Because these '
            'applications trust the organization\'s Identity Provider, '
            'users do not need separate accounts for each service.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use a trusted Identity Provider for centralized authentication',
          'Protect SSO with Multi-Factor Authentication (MFA)',
          'Regularly review trusted applications and federation relationships',
          'Remove access promptly when users leave the organization',
          'Monitor authentication logs for unusual login activity',
        ],
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Authorization and Access Control Models',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'What Is Authorization?',
        body:
            'Authorization is the process of determining what an '
            'authenticated user is allowed to access or perform. While '
            'authentication answers the question "Who are you?", '
            'authorization answers "What are you allowed to do?"',
      ),
      LessonSection(
        heading: 'A Practical Example',
        body:
            'After logging into an organization\'s network, an HR '
            'employee can access employee records, a Finance employee '
            'can access payroll systems, and an IT administrator can '
            'manage servers and network devices. Each user has '
            'different permissions based on their role and '
            'responsibilities.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['User', 'Authentication (Verify Identity)', 'Authorization (Check Permissions)', 'Access Granted'],
          caption: 'Authentication verifies identity, while authorization determines what resources a user can access.',
        ),
      ),
      LessonSection(
        heading: '1. Role-Based Access Control (RBAC)',
        body: 'In RBAC, permissions are assigned to roles rather than individual users.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Role', 'Access'],
          tableRows: [
            ['HR Manager', 'HR applications and employee records'],
            ['Finance Analyst', 'Payroll and financial reports'],
            ['IT Administrator', 'Servers, networks, and security tools'],
          ],
        ),
      ),
      LessonSection(
        heading: 'RBAC in Practice',
        body:
            'When a user changes roles, their permissions are updated '
            'by assigning the new role.',
        bullets: ['Easy to manage', 'Reduces administrative effort', 'Ideal for large organizations'],
      ),
      LessonSection(
        heading: '2. Attribute-Based Access Control (ABAC)',
        body: 'ABAC makes access decisions based on attributes such as:',
        bullets: ['User department', 'Job title', 'Device compliance', 'Location', 'Time of access'],
      ),
      LessonSection(
        heading: 'ABAC Example',
        body:
            'An employee may access financial data only if they are '
            'in the Finance department, using a company-managed device, '
            'and connected from within the country. ABAC provides '
            'greater flexibility than RBAC.',
      ),
      LessonSection(
        heading: '3. Discretionary Access Control (DAC)',
        body:
            'In DAC, the owner of a file or resource decides who can '
            'access it. For example, a user creates a document and '
            'shares it with selected colleagues. DAC is commonly used '
            'in desktop operating systems.',
      ),
      LessonSection(
        heading: '4. Mandatory Access Control (MAC)',
        body:
            'In MAC, access decisions are controlled by a central '
            'authority based on security classifications. Users cannot '
            'change permissions themselves. MAC is commonly used in '
            'government and military environments.',
        bullets: ['Public', 'Confidential', 'Secret', 'Top Secret'],
      ),
      LessonSection(
        heading: 'The Principle of Least Privilege',
        body:
            'The Principle of Least Privilege (PoLP) states that users '
            'should receive only the minimum permissions required to '
            'perform their job. For example, a Help Desk technician can '
            'reset passwords but cannot modify firewall rules, and a '
            'database administrator can manage databases but cannot '
            'approve payroll transactions. Applying Least Privilege '
            'reduces the impact of compromised accounts and accidental '
            'misuse.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A company uses RBAC to manage employee access. When a new '
            'employee joins the Marketing department, they '
            'automatically receive access to marketing applications and '
            'shared folders, but cannot access HR or Finance systems. '
            'If they later transfer to Sales, their Marketing '
            'permissions are removed and Sales permissions are assigned. '
            'This ensures employees always have the appropriate level '
            'of access.',
      ),
      LessonSection(
        heading: 'Comparison of Access Control Models',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Model', 'Access Based On', 'Common Use'],
          tableRows: [
            ['RBAC', 'User role', 'Enterprise user management'],
            ['ABAC', 'User and environmental attributes', 'Cloud and Zero Trust environments'],
            ['DAC', 'Resource owner\'s decision', 'Personal files and desktop systems'],
            ['MAC', 'Security classification', 'Government and defense organizations'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Follow the Principle of Least Privilege',
          'Review user permissions regularly',
          'Remove unnecessary access promptly',
          'Use RBAC to simplify permission management',
          'Consider ABAC for environments requiring dynamic access decisions',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Privileged Access Management (PAM)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Is Privileged Access Management?',
        body:
            'Privileged Access Management (PAM) is the process of '
            'securing, controlling, and monitoring accounts with '
            'elevated permissions. Privileged accounts have access to '
            'critical systems and sensitive data. If compromised, they '
            'can cause significant damage to an organization. PAM helps '
            'reduce this risk by ensuring that administrative access is '
            'granted only when needed and is closely monitored.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/fig_4_8_pam.jpg',
          caption: 'A PAM solution securely manages and monitors privileged access to critical enterprise systems.',
        ),
      ),
      LessonSection(
        heading: 'Types of Privileged Accounts',
        bullets: [
          'System administrators — manage servers and operating systems',
          'Database administrators (DBAs) — manage databases and database security',
          'Network administrators — configure routers, switches, and firewalls',
          'Cloud administrators — manage cloud infrastructure and services',
          'Service accounts — used by applications and services to communicate securely',
        ],
      ),
      LessonSection(
        heading: 'Why These Accounts Need Extra Protection',
        body:
            'These accounts should receive additional protection '
            'because of their elevated privileges — a compromised '
            'standard user account is bad, but a compromised '
            'administrator account can potentially touch every system '
            'in the environment.',
      ),
      LessonSection(
        heading: 'Password Vault',
        body:
            'Administrative passwords are stored securely in an '
            'encrypted vault rather than being shared manually.',
      ),
      LessonSection(
        heading: 'Just-in-Time (JIT) Access',
        body:
            'Users receive administrative privileges only for a '
            'limited period when required.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Access Request', 'Approval', 'Temporary Privileged Access', 'Task Completed', 'Privileges Removed'],
          caption: 'Just-in-Time access grants administrative privileges only for the duration required to complete a task.',
        ),
      ),
      LessonSection(
        heading: 'Session Monitoring and Credential Rotation',
        body:
            'Administrative sessions can be monitored or recorded to '
            'support auditing and investigations. Passwords are also '
            'automatically changed at regular intervals to reduce the '
            'risk of credential compromise.',
      ),
      LessonSection(
        heading: 'Benefits of PAM',
        bullets: [
          'Protect administrator accounts',
          'Reduce insider threats',
          'Prevent unauthorized privileged access',
          'Improve compliance and auditing',
          'Minimize the impact of stolen credentials',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A system administrator needs to update a production '
            'database. Instead of using a permanent administrator '
            'account, the administrator requests temporary privileged '
            'access. The PAM solution grants access for one hour. The '
            'session is recorded for auditing. After the task is '
            'complete, the elevated privileges are automatically '
            'revoked. This approach reduces the risk associated with '
            'long-term privileged accounts.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Apply Multi-Factor Authentication (MFA) to all privileged accounts',
          'Use separate accounts for administrative and everyday tasks',
          'Grant privileged access only when necessary',
          'Monitor and audit privileged sessions regularly',
          'Remove unused privileged accounts promptly',
          'Rotate privileged credentials automatically',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Identity Governance and Administration (IGA)',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Is Identity Governance and Administration?',
        body:
            'Identity Governance and Administration (IGA) is the '
            'process of managing user identities and ensuring that '
            'access permissions are appropriate throughout a user\'s '
            'lifecycle. While IAM focuses on authentication and '
            'authorization, IGA focuses on who should have access, why '
            'they need it, and whether that access remains appropriate '
            'over time.',
        bullets: [
          'Manage user accounts efficiently',
          'Reduce excessive permissions',
          'Meet compliance requirements',
          'Minimize insider threats',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Create User', 'Assign Access', 'Review Access', 'Modify Access', 'Remove Access'],
          caption: 'IGA ensures user access is continuously managed throughout the identity lifecycle.',
        ),
      ),
      LessonSection(
        heading: 'User Provisioning',
        body: 'Provisioning is the process of creating user accounts and assigning appropriate access.',
        bullets: [
          'Creating user accounts',
          'Assigning roles',
          'Granting application access',
          'Providing email and collaboration tools',
        ],
      ),
      LessonSection(
        heading: 'Automating Provisioning',
        body:
            'Many organizations automate provisioning based on the '
            'employee\'s department or job role.',
      ),
      LessonSection(
        heading: 'User Deprovisioning',
        body: 'When an employee leaves the organization, access must be removed promptly.',
        bullets: [
          'Disabling user accounts',
          'Revoking application access',
          'Removing VPN access',
          'Recovering company devices',
          'Archiving data according to company policy',
        ],
      ),
      LessonSection(
        heading: 'Why Timely Deprovisioning Matters',
        body:
            'Timely deprovisioning reduces the risk of unauthorized '
            'access — a former employee\'s still-active account is one '
            'of the most avoidable, and most commonly found, gaps '
            'during a security audit.',
      ),
      LessonSection(
        heading: 'Access Reviews',
        body:
            'Over time, employees may accumulate unnecessary '
            'permissions due to promotions, transfers, or project '
            'assignments. Regular access reviews help organizations '
            'verify that users still require their assigned '
            'permissions.',
        bullets: [
          'User roles',
          'Group memberships',
          'Administrative privileges',
          'Access to sensitive applications',
        ],
      ),
      LessonSection(
        heading: 'Segregation of Duties (SoD)',
        body:
            'Segregation of Duties (SoD) prevents a single individual '
            'from having excessive control over critical business '
            'processes. For example, an employee who creates a vendor '
            'should not also approve payments to that vendor, and a '
            'developer should not deploy code directly to production '
            'without an approval process. Implementing SoD reduces the '
            'risk of fraud, errors, and misuse of privileges.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Create Request', 'Manager Approval', 'Finance Approval', 'Payment'],
          caption: 'Segregation of Duties distributes critical tasks among multiple individuals to reduce security and operational risks — each step performed by a different individual.',
        ),
      ),
      LessonSection(
        heading: 'Compliance and Auditing',
        body:
            'Many regulations require organizations to demonstrate that '
            'user access is properly managed. IGA supports compliance '
            'by:',
        bullets: [
          'Maintaining audit logs',
          'Recording access approvals',
          'Performing periodic access certifications',
          'Identifying inactive or excessive privileges',
          'Generating compliance reports',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A company conducts quarterly access reviews for its '
            'Finance application. Department managers receive a list of '
            'users with access and must confirm whether each employee '
            'still requires it. During one review, a former '
            'contractor\'s account is discovered to still have access. '
            'The account is immediately disabled, preventing potential '
            'misuse.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Automate user provisioning where possible',
          'Remove access immediately when employees leave',
          'Perform regular access reviews',
          'Enforce Segregation of Duties for critical business processes',
          'Monitor privileged accounts closely',
          'Maintain accurate audit records',
        ],
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Identity Security Best Practices',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Combining Technology, Policy, and Awareness',
        body:
            'A strong IAM strategy combines technology, policies, and '
            'user awareness. The following practices help organizations '
            'protect user identities and reduce the risk of '
            'unauthorized access.',
      ),
      LessonSection(
        heading: '1. Enforce Multi-Factor Authentication (MFA)',
        body:
            'Require MFA for all users, especially administrators and '
            'users accessing sensitive systems. This adds an extra '
            'layer of protection even if passwords are compromised.',
      ),
      LessonSection(
        heading: '2. Apply the Principle of Least Privilege',
        body:
            'Grant users only the permissions required to perform '
            'their job. Review permissions regularly and remove '
            'unnecessary access.',
      ),
      LessonSection(
        heading: '3. Use Strong Password Policies',
        bullets: [
          'Long, unique passphrases',
          'Password managers',
          'Regular password updates when required by policy',
          'Avoiding password reuse',
        ],
      ),
      LessonSection(
        heading: '4. Enable Conditional Access',
        body: 'Conditional Access evaluates factors such as:',
        bullets: ['User identity', 'Device compliance', 'Location', 'Risk level'],
      ),
      LessonSection(
        heading: 'What Happens Based on the Evaluation',
        body:
            'Based on these conditions, access may be allowed, blocked, '
            'or require additional verification.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['User Login', 'Evaluate User, Device, Location, Risk', 'Grant Access / Require MFA / Block Access'],
          caption: 'Conditional Access applies security policies based on real-time risk and context.',
        ),
      ),
      LessonSection(
        heading: '5. Monitor Identity Activity',
        body: 'Monitor authentication logs to identify:',
        bullets: [
          'Repeated failed login attempts',
          'Impossible travel logins',
          'Sign-ins from unusual locations',
          'Privilege escalation attempts',
        ],
      ),
      LessonSection(
        heading: 'Why Early Detection Matters',
        body:
            'Early detection helps security teams respond quickly to '
            'potential threats — the gap between an account being '
            'compromised and the compromise being noticed is exactly '
            'where an attacker does most of their damage.',
      ),
      LessonSection(
        heading: '6. Automate the Identity Lifecycle',
        body:
            'Automate user onboarding, role changes, and account '
            'removal to reduce manual errors and improve security.',
      ),
      LessonSection(
        heading: 'Common Identity Threats',
        bullets: [
          'Phishing attacks',
          'Password spraying',
          'Credential stuffing',
          'Brute-force attacks',
          'Stolen session tokens',
          'Insider threats',
        ],
      ),
      LessonSection(
        heading: 'Combining Defenses',
        body:
            'Combining MFA, Conditional Access, monitoring, and user '
            'awareness helps reduce these risks — no single control on '
            'its own is sufficient against the full range of identity '
            'threats listed above.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A company uses a Zero Trust identity strategy: every user '
            'signs in with MFA, only compliant, company-managed devices '
            'can access sensitive applications, high-risk sign-in '
            'attempts automatically trigger additional verification or '
            'are blocked, and user access is reviewed quarterly. This '
            'layered approach improves security while allowing '
            'employees to work securely from any location.',
      ),
      LessonSection(
        heading: 'Best Practices Checklist',
        bullets: [
          'Enable MFA for all users',
          'Apply the Principle of Least Privilege',
          'Use Role-Based Access Control (RBAC)',
          'Review user access regularly',
          'Automate provisioning and deprovisioning',
          'Monitor authentication logs continuously',
          'Protect privileged accounts with PAM',
          'Enable Conditional Access policies',
          'Train users to recognize phishing attacks',
          'Remove inactive accounts promptly',
        ],
      ),
      LessonSection(
        heading: 'Identity Is the New Perimeter',
        body:
            'Identity is the new security perimeter in modern '
            'enterprises. MFA, Least Privilege, and Conditional Access '
            'significantly improve security. Continuous monitoring '
            'helps detect suspicious login activity. Automating '
            'identity management reduces administrative effort and '
            'security risks, and regular access reviews ensure users '
            'maintain only the permissions they require.',
      ),
      LessonSection(
        heading: 'Chapter Summary',
        body: 'In this chapter, you learned:',
        bullets: [
          'The fundamentals of Identity and Access Management (IAM)',
          'The concepts of Identification, Authentication, Authorization, and Accounting (IAAA)',
          'Different authentication methods, including passwords, biometrics, and passwordless authentication',
          'The importance of Multi-Factor Authentication (MFA)',
          'How Single Sign-On (SSO) and Identity Federation simplify secure access',
          'Common access control models such as RBAC, ABAC, DAC, and MAC',
          'How Privileged Access Management (PAM) protects administrative accounts',
          'The role of Identity Governance and Administration (IGA) in managing user access',
          'Best practices for securing identities using Zero Trust principles, Conditional Access, and continuous monitoring',
        ],
      ),
    ],
  ),

  // 11 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 18,
    quiz: [
      QuizQuestion(
        question: 'What does IAM ensure, according to its core definition?',
        options: [
          'That all users have unrestricted access to every system',
          'That the right people have the right access to the right resources at the right time',
          'That passwords are never required',
          'That only administrators can log in to any system',
        ],
        correctIndex: 1,
        explanation: 'IAM\'s core purpose is precisely matching access to legitimate need — no more, no less.',
      ),
      QuizQuestion(
        question: 'In the IAAA model, what distinguishes Identification from Authentication?',
        options: [
          'They are the same step with different names',
          'Identification is claiming an identity (e.g. a username); Authentication is proving that claim is genuine',
          'Authentication always happens before Identification',
          'Identification only applies to biometric systems',
        ],
        correctIndex: 1,
        explanation: 'Identification is the claim; Authentication is the verification of that claim.',
      ),
      QuizQuestion(
        question: 'What does the "Accounting" pillar of IAAA specifically provide?',
        options: [
          'It grants permissions to users',
          'It records user activities such as login time, files accessed, and failed login attempts for security and compliance',
          'It verifies passwords against a database',
          'It replaces the need for authorization entirely',
        ],
        correctIndex: 1,
        explanation: 'Accounting is the logging and auditing function — a record of what happened, not a gatekeeping function.',
      ),
      QuizQuestion(
        question: 'In the Joiner-Mover-Leaver lifecycle, what happens during the "Mover" stage?',
        options: [
          'A user account is created for the first time',
          'Old permissions are removed and new permissions are assigned based on the employee\'s new role',
          'All access is permanently revoked',
          'The employee\'s email is archived',
        ],
        correctIndex: 1,
        explanation: 'The Mover stage handles role/department changes, swapping out old access for access matching the new role.',
      ),
      QuizQuestion(
        question: 'Which authentication factor category does a hardware security key belong to?',
        options: ['Something you know', 'Something you have', 'Something you are', 'Something you do'],
        correctIndex: 1,
        explanation: 'A hardware security key is a physical object the user possesses — the "something you have" factor.',
      ),
      QuizQuestion(
        question: 'Why are passphrases generally recommended over short, complex passwords?',
        options: [
          'Passphrases are always shorter and easier to type',
          'Longer passphrases are generally more resistant to brute-force attacks while remaining easier to remember',
          'Passphrases never need to be changed',
          'Passphrases eliminate the need for MFA entirely',
        ],
        correctIndex: 1,
        explanation: 'Length increases resistance to brute-force cracking, and a memorable phrase is easier for users to recall correctly than complex short strings.',
      ),
      QuizQuestion(
        question: 'What is a key limitation specific to biometric authentication (inherence factor)?',
        options: [
          'It cannot be used on mobile devices',
          'Biometric data must be protected carefully because, unlike a password, it cannot be changed if compromised',
          'It requires no specialized hardware',
          'It is never affected by environmental conditions',
        ],
        correctIndex: 1,
        explanation: 'Unlike a password, you can\'t simply "reset" a fingerprint or iris pattern if that biometric data is ever compromised.',
      ),
      QuizQuestion(
        question: 'What is the key difference between Two-Factor Authentication (2FA) and Multi-Factor Authentication (MFA)?',
        options: [
          'They are completely unrelated concepts',
          '2FA uses exactly two factors, while MFA uses two or more — all 2FA is a form of MFA',
          'MFA is less secure than 2FA',
          '2FA is only used for biometric systems',
        ],
        correctIndex: 1,
        explanation: '2FA is a specific case of MFA using exactly two factors; MFA more broadly covers two or more.',
      ),
      QuizQuestion(
        question: 'Why are SMS-based OTPs generally considered weaker than authenticator apps or hardware security keys?',
        options: [
          'SMS OTPs are actually the strongest MFA method available',
          'SMS-based OTPs can be vulnerable to SIM-swapping attacks',
          'SMS OTPs never expire',
          'SMS OTPs require no phone at all',
        ],
        correctIndex: 1,
        explanation: 'SIM-swapping lets an attacker redirect SMS messages to a device they control, undermining this specific MFA method.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of Single Sign-On (SSO)?',
        options: [
          'To require a separate password for every application',
          'To let users authenticate once and gain access to multiple applications without signing in repeatedly',
          'To eliminate the need for an Identity Provider',
          'To replace Multi-Factor Authentication entirely',
        ],
        correctIndex: 1,
        explanation: 'SSO centralizes authentication through an Identity Provider so users don\'t need to log in separately to each application.',
      ),
      QuizQuestion(
        question: 'How does Identity Federation differ from SSO?',
        options: [
          'They are identical concepts with different names',
          'Federation extends trust across different organizations or domains, while SSO typically operates within a single organization',
          'Federation only works for biometric authentication',
          'SSO requires more separate accounts than Federation',
        ],
        correctIndex: 1,
        explanation: 'SSO is usually intra-organizational convenience; Federation is inter-organizational trust between separate identity domains.',
      ),
      QuizQuestion(
        question: 'Which federation protocol is specifically noted as commonly used for enterprise web applications?',
        options: ['OAuth 2.0', 'SAML', 'OpenID Connect (OIDC)', 'FIDO2'],
        correctIndex: 1,
        explanation: 'SAML is the protocol specifically associated with enterprise web application federation in this material.',
      ),
      QuizQuestion(
        question: 'In RBAC, how are permissions assigned?',
        options: [
          'Permissions are assigned directly to each individual user one at a time',
          'Permissions are assigned to roles, and users inherit permissions through their assigned role',
          'Permissions are assigned based purely on the resource owner\'s discretion',
          'Permissions are assigned using government security classifications',
        ],
        correctIndex: 1,
        explanation: 'RBAC\'s defining feature is that permissions attach to roles, not individuals — simplifying management at scale.',
      ),
      QuizQuestion(
        question: 'What distinguishes ABAC from RBAC?',
        options: [
          'ABAC only works for government systems',
          'ABAC makes access decisions using multiple attributes (department, device compliance, location, time) rather than just a fixed role',
          'ABAC is simpler and less flexible than RBAC',
          'ABAC eliminates the need for authentication',
        ],
        correctIndex: 1,
        explanation: 'ABAC evaluates real-time context and multiple attributes, offering more dynamic, flexible access decisions than role alone.',
      ),
      QuizQuestion(
        question: 'In which environments is Mandatory Access Control (MAC) most commonly used?',
        options: ['Personal desktop computers', 'Small retail businesses', 'Government and military environments', 'Social media platforms'],
        correctIndex: 2,
        explanation: 'MAC\'s centrally-enforced security classifications (Public, Confidential, Secret, Top Secret) are characteristic of government and defense use.',
      ),
      QuizQuestion(
        question: 'What does the Principle of Least Privilege state?',
        options: [
          'All users should have administrator access by default',
          'Users should receive only the minimum permissions required to perform their job',
          'Privileges should never be reviewed once granted',
          'Only IT staff need any permissions at all',
        ],
        correctIndex: 1,
        explanation: 'Least Privilege minimizes the damage a compromised or misused account can cause by limiting what it can actually touch.',
      ),
      QuizQuestion(
        question: 'What does Just-in-Time (JIT) access specifically provide in a PAM solution?',
        options: [
          'Permanent administrative access for all users',
          'Administrative privileges granted only for a limited period when actually required, then automatically revoked',
          'A password shared manually between team members',
          'Unrestricted access to all cloud resources',
        ],
        correctIndex: 1,
        explanation: 'JIT access grants elevated privileges temporarily and revokes them automatically once the task is done, reducing standing privileged access.',
      ),
      QuizQuestion(
        question: 'What is the core purpose of Segregation of Duties (SoD)?',
        options: [
          'To let one employee control an entire critical business process alone',
          'To prevent a single individual from having excessive control over a critical process, reducing fraud and error risk',
          'To eliminate the need for manager approvals',
          'To speed up payment processing by removing approval steps',
        ],
        correctIndex: 1,
        explanation: 'SoD distributes critical tasks (like creating a vendor vs. approving payment to that vendor) across different people specifically to prevent abuse.',
      ),
      QuizQuestion(
        question: 'Why is timely user deprovisioning important when an employee leaves an organization?',
        options: [
          'It has no real security impact either way',
          'A still-active account after someone leaves is a common, avoidable security gap that reduces the risk of unauthorized access',
          'It only matters for privileged accounts, never regular users',
          'It is purely a cost-saving measure with no security benefit',
        ],
        correctIndex: 1,
        explanation: 'Leftover active accounts for former employees are a frequently discovered, entirely preventable risk during security audits.',
      ),
      QuizQuestion(
        question: 'What does Conditional Access evaluate before granting, blocking, or challenging a login attempt?',
        options: [
          'Only the user\'s password strength',
          'User identity, device compliance, location, and risk level',
          'Only the time zone of the request',
          'Nothing — it always grants access automatically',
        ],
        correctIndex: 1,
        explanation: 'Conditional Access makes real-time, context-aware decisions based on multiple risk signals, not just a static password check.',
      ),
    ],
  ),
];
