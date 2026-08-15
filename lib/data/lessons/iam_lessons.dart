import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> iamLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Identity and Access Management',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 8,
    sections: [
      LessonSection(
        heading: 'The Corporate Office Building Analogy',
        body:
            'Imagine a corporate office building. Before entering a '
            'restricted area, an employee typically shows an ID badge, '
            'enters a PIN or scans a fingerprint, is allowed access only '
            'to authorized areas, and has every entry and exit recorded.',
      ),
      LessonSection(
        body:
            'Enterprise IT systems work in a similar way. They must '
            'verify who a user is, what they can access, and record '
            'their activities. This process is known as Identity and '
            'Access Management (IAM). IAM ensures that the right people '
            'have the right access to the right resources at the right '
            'time.',
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
        body:
            'Without IAM, users may receive excessive privileges, '
            'increasing the risk of data breaches.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/iam_overview.jpg',
          caption:
              'Identity and Access Management verifies user identity '
              'and controls access to enterprise resources.',
        ),
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'The Four Pillars of IAM (IAAA)',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Four Fundamental Concepts',
        body: 'IAM is built on four fundamental concepts.',
      ),
      LessonSection(
        heading: '1. Identification',
        body:
            'Identification is the process of claiming an identity. '
            'Examples include a username, employee ID, or email address. '
            'At this stage, the system does not yet know if the claim is '
            'genuine.',
      ),
      LessonSection(
        heading: '2. Authentication',
        body:
            'Authentication verifies that the user is who they claim to '
            'be. Common methods include passwords, fingerprints, smart '
            'cards, One-Time Passwords (OTP), face recognition, and '
            'security keys.',
      ),
      LessonSection(
        heading: '3. Authorization',
        body:
            'After successful authentication, the system determines '
            'what resources the user is permitted to access.',
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
            'compliance, and investigations. Typical events logged '
            'include login time, logout time, files accessed, '
            'administrative actions, and failed login attempts.',
      ),
      LessonSection(
        body:
            'Every access request follows the sequence of '
            'identification, authentication, authorization, and '
            'accounting.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/iaaa_process.jpg',
          caption:
              'Every access request follows the sequence of '
              'identification, authentication, authorization, and '
              'accounting.',
        ),
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'The Identity Lifecycle',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'More Than Just Creating Accounts',
        body:
            'Managing identities involves more than creating user '
            'accounts. An enterprise identity follows a lifecycle.',
      ),
      LessonSection(
        heading: 'Join',
        body:
            'A new employee joins the organization. A user account is '
            'created, email is assigned, and access is granted based on '
            'job role.',
      ),
      LessonSection(
        heading: 'Move',
        body:
            'The employee changes departments. Old permissions are '
            'removed and new permissions are assigned.',
      ),
      LessonSection(
        heading: 'Leave',
        body:
            'The employee resigns. Accounts are disabled, access is '
            'revoked, devices are recovered, and email is archived '
            'according to company policy.',
      ),
      LessonSection(
        body:
            'This process is often called the Joiner-Mover-Leaver (JML) '
            'lifecycle.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'Sarah joins the Finance department. She automatically '
            'receives access to Finance applications, the Payroll '
            'system, corporate email, and shared finance folders.',
      ),
      LessonSection(
        body:
            'Later, she transfers to Human Resources. Her Finance access '
            'is removed, and HR permissions are assigned automatically '
            'based on her new role. This reduces the risk of unnecessary '
            'or excessive access.',
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
    title: 'Authentication Factors',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'What Is Authentication?',
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
        body:
            'Authentication factors are generally grouped into three '
            'categories.',
      ),
      LessonSection(
        heading: '1. Something You Know (Knowledge Factor)',
        body:
            'This is the most common authentication factor. Examples '
            'include a password, passphrase, PIN (Personal '
            'Identification Number), and security questions.',
      ),
      LessonSection(
        body: 'Advantages: easy to implement, low cost, familiar to users.',
      ),
      LessonSection(
        body:
            'Limitations: can be guessed or stolen, vulnerable to '
            'phishing attacks, and users may reuse passwords across '
            'multiple services.',
      ),
      LessonSection(
        heading: '2. Something You Have (Possession Factor)',
        body:
            'This factor requires the user to possess a physical or '
            'virtual object. Examples include a smart card, hardware '
            'security key (such as a FIDO2 key), mobile authentication '
            'app, One-Time Password (OTP) token, and digital certificate '
            'stored on a device.',
      ),
      LessonSection(
        body:
            'Advantages: more secure than passwords alone, difficult for '
            'attackers to duplicate.',
      ),
      LessonSection(
        body:
            'Limitations: devices can be lost or damaged, and '
            'replacement and management increase operational costs.',
      ),
      LessonSection(
        heading: '3. Something You Are (Inherence Factor)',
        body:
            'This factor verifies a unique biological characteristic of '
            'the user. Examples include fingerprint, face recognition, '
            'iris scan, and voice recognition.',
      ),
      LessonSection(
        body: 'Advantages: convenient for users, difficult to share with others.',
      ),
      LessonSection(
        body:
            'Limitations: requires specialized hardware, environmental '
            'conditions may affect accuracy, and biometric data must be '
            'protected because it cannot be changed like a password.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/authentication_factor_categories.jpg',
          caption:
              'Authentication factors are grouped into knowledge, '
              'possession, and inherence categories.',
        ),
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Passwords, Passphrases & Passwordless Authentication',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Passwords vs Passphrases',
        body:
            'A password is typically a short combination of characters '
            '— for example, P@ssw0rd!. A passphrase is a longer sequence '
            'of words that is easier to remember and generally more '
            'resistant to brute-force attacks — for example, '
            'BlueTiger!RunsAcross7Mountains.',
      ),
      LessonSection(
        body:
            'Long, unique passphrases are generally recommended over '
            'short, complex passwords.',
      ),
      LessonSection(
        heading: 'Passwordless Authentication',
        body:
            'Many organizations are moving toward passwordless '
            'authentication. Instead of entering a password, users '
            'authenticate using biometrics, hardware security keys, '
            'mobile authenticator approval, and device certificates.',
      ),
      LessonSection(
        body: 'Benefits include:',
        bullets: [
          'Reduced phishing risk',
          'Better user experience',
          'Fewer password reset requests',
          'Stronger overall security',
        ],
      ),
      LessonSection(
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
            'verification, and Conditional Access policies.',
      ),
      LessonSection(
        body:
            'Employees no longer need to remember complex passwords, '
            'while the organization gains stronger protection against '
            'credential theft.',
      ),
      LessonSection(
        heading: 'Comparison of Authentication Methods',
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
      LessonSection(
        heading: 'Key Takeaways',
        bullets: [
          'Authentication verifies a user\'s identity before granting access',
          'Authentication factors are categorized as something you know, have, or are',
          'Passphrases are generally stronger and easier to remember than short passwords',
          'Passwordless authentication improves both security and user experience',
          'Organizations should adopt stronger authentication methods for sensitive systems',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Multi-Factor Authentication (MFA)',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Is Multi-Factor Authentication (MFA)?',
        body:
            'Multi-Factor Authentication (MFA) is a security mechanism '
            'that requires users to verify their identity using two or '
            'more independent authentication factors. Even if an '
            'attacker steals a user\'s password, they are unlikely to '
            'have access to the second authentication factor, making '
            'unauthorized access much more difficult.',
      ),
      LessonSection(
        body:
            'For example, an employee logs in to a company portal by '
            'entering a password and then approving a notification on '
            'their mobile authentication app.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/iam/mfa_authentication_steps.jpg',
          caption:
              'MFA requires users to complete multiple authentication '
              'steps before access is granted.',
        ),
      ),
      LessonSection(
        heading: 'Two-Factor Authentication (2FA) vs Multi-Factor Authentication (MFA)',
        body:
            'Although the terms are often used interchangeably, they '
            'are slightly different. All 2FA is a form of MFA, but MFA '
            'can involve more than two factors.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Two-Factor Authentication (2FA)', 'Multi-Factor Authentication (MFA)'],
          tableRows: [
            ['Uses exactly two authentication factors', 'Uses two or more authentication factors'],
            ['Example: Password + OTP', 'Example: Password + Fingerprint + Security Key'],
            ['Common for most online services', 'Often used in enterprise environments'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Common MFA Methods',
        body: 'Organizations can implement MFA using different methods, including:',
        bullets: [
          'Authenticator Apps: Generate or approve one-time login requests',
          'SMS or Email OTPs: Send a temporary verification code to the user',
          'Hardware Security Keys: Physical devices that provide phishing-resistant authentication',
          'Biometric Verification: Fingerprint or facial recognition used as an additional factor',
          'Push Notifications: Users approve login requests through a trusted mobile application',
        ],
      ),
      LessonSection(
        body:
            'Each method offers a different balance of security, '
            'convenience, and cost.',
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
        body:
            'Because of these benefits, many organizations require MFA '
            'for all users, especially when accessing sensitive systems.',
      ),
      LessonSection(
        heading: 'Limitations of MFA',
        body:
            'While MFA significantly improves security, it is not '
            'foolproof. Potential challenges include:',
        bullets: [
          'Users may lose their authentication device',
          'SMS-based OTPs can be vulnerable to SIM-swapping attacks',
          'Users may approve fraudulent push notifications without careful review',
          'Additional authentication steps may slightly impact user convenience',
        ],
      ),
      LessonSection(
        body:
            'Organizations should choose MFA methods appropriate to '
            'their security requirements.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'MFA in the Enterprise',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A company uses Microsoft Entra ID to protect access to '
            'Microsoft 365. Employees sign in with their corporate '
            'password and a push notification from the Microsoft '
            'Authenticator app.',
      ),
      LessonSection(
        body:
            'If a login attempt originates from an unfamiliar location '
            'or device, additional verification is required before '
            'access is granted.',
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
      LessonSection(
        heading: 'Key Takeaways',
        bullets: [
          'MFA requires users to provide two or more authentication factors',
          'It significantly reduces the risk of unauthorized access caused by stolen credentials',
          'Hardware security keys and authenticator apps provide stronger protection than SMS-based OTPs',
          'User awareness and proper implementation are essential for maximizing the effectiveness of MFA',
        ],
      ),
    ],
  ),

  // 8 — Practice Quiz -------------------------------------------------------
  Lesson(
    title: 'Practice Quiz: Identity and Access Management',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 10,
    quiz: [
      QuizQuestion(
        question: 'What does IAM ensure, according to the chapter\'s core definition?',
        options: [
          'That every user has administrative access by default',
          'That the right people have the right access to the right resources at the right time',
          'That passwords are never required for authentication',
          'That all user activity is deleted after 24 hours',
        ],
        correctIndex: 1,
        explanation: 'IAM ensures that the right people have the right access to the right resources at the right time.',
      ),
      QuizQuestion(
        question: 'In the corporate office building analogy, what does recording every entry and exit represent?',
        options: [
          'Identification',
          'Authentication',
          'Authorization',
          'Accounting',
        ],
        correctIndex: 3,
        explanation: 'Recording activity for later review corresponds to Accounting (Auditing), the fourth pillar of IAM.',
      ),
      QuizQuestion(
        question: 'Which of the four pillars of IAM involves a user simply claiming an identity, such as typing in a username?',
        options: [
          'Identification',
          'Authentication',
          'Authorization',
          'Accounting',
        ],
        correctIndex: 0,
        explanation: 'Identification is the process of claiming an identity (e.g., username, employee ID, or email); at this stage the system does not yet know if the claim is genuine.',
      ),
      QuizQuestion(
        question: 'What is the key difference between authentication and authorization?',
        options: [
          'They are the same process performed twice',
          'Authentication verifies identity; authorization determines what resources that identity can access',
          'Authorization happens before authentication',
          'Authentication only applies to administrators',
        ],
        correctIndex: 1,
        explanation: 'Authentication verifies that a user is who they claim to be, while authorization determines what resources that authenticated user is permitted to access.',
      ),
      QuizQuestion(
        question: 'What is the Joiner-Mover-Leaver (JML) lifecycle?',
        options: [
          'A password rotation schedule',
          'The process of managing user access as employees join, change roles, and leave an organization',
          'A type of multi-factor authentication',
          'A network segmentation strategy',
        ],
        correctIndex: 1,
        explanation: 'The Joiner–Mover–Leaver lifecycle describes how identities are managed as employees join, move between roles or departments, and eventually leave the organization.',
      ),
      QuizQuestion(
        question: 'When Sarah transfers from Finance to Human Resources, what should happen to her access, per the chapter\'s example?',
        options: [
          'She keeps all Finance access permanently as a backup',
          'Her Finance access is removed and new HR permissions are assigned based on her new role',
          'All her access is immediately deleted with no replacement',
          'Nothing changes since she is still employed by the same company',
        ],
        correctIndex: 1,
        explanation: 'During the "Move" stage of the JML lifecycle, old permissions are removed and new permissions are assigned based on the employee\'s new role, reducing unnecessary access.',
      ),
      QuizQuestion(
        question: 'A fingerprint scan is an example of which authentication factor category?',
        options: [
          'Something you know',
          'Something you have',
          'Something you are',
          'Something you do',
        ],
        correctIndex: 2,
        explanation: 'Fingerprints, face recognition, iris scans, and voice recognition all fall under the inherence factor — "something you are."',
      ),
      QuizQuestion(
        question: 'What is a key limitation of the "something you know" authentication factor?',
        options: [
          'It requires specialized hardware',
          'It can be guessed, stolen, or reused across multiple services, and is vulnerable to phishing',
          'It cannot be used for enterprise accounts',
          'It requires biometric data protection',
        ],
        correctIndex: 1,
        explanation: 'Knowledge factors like passwords can be guessed or stolen, are vulnerable to phishing, and users often reuse them across services.',
      ),
      QuizQuestion(
        question: 'Why must biometric data be handled with special care compared to a password?',
        options: [
          'Biometric data is always publicly available',
          'Biometric data cannot be changed like a password if it is compromised',
          'Biometric data is never actually stored anywhere',
          'Biometric authentication is always less secure than passwords',
        ],
        correctIndex: 1,
        explanation: 'Unlike a password, biometric data cannot be changed if compromised, which is why it requires special protection.',
      ),
      QuizQuestion(
        question: 'What is the main advantage of a passphrase over a traditional short password?',
        options: [
          'Passphrases are always shorter and faster to type',
          'Passphrases are longer sequences of words that are easier to remember and more resistant to brute-force attacks',
          'Passphrases never need to be changed',
          'Passphrases eliminate the need for any other authentication factor',
        ],
        correctIndex: 1,
        explanation: 'A passphrase is a longer sequence of words that is easier to remember and generally more resistant to brute-force attacks than a short, complex password.',
      ),
      QuizQuestion(
        question: 'Which of the following is NOT listed as a benefit of passwordless authentication?',
        options: [
          'Reduced phishing risk',
          'Fewer password reset requests',
          'Guaranteed elimination of all cyberattacks',
          'Better user experience',
        ],
        correctIndex: 2,
        explanation: 'Passwordless authentication reduces phishing risk, improves user experience, and reduces password reset requests — but it does not guarantee elimination of all cyberattacks.',
      ),
      QuizQuestion(
        question: 'What is the correct relationship between Two-Factor Authentication (2FA) and Multi-Factor Authentication (MFA)?',
        options: [
          'They are unrelated concepts',
          'All 2FA is a form of MFA, but MFA can involve more than two factors',
          'MFA is a subset of 2FA',
          '2FA always uses more factors than MFA',
        ],
        correctIndex: 1,
        explanation: 'All 2FA is a form of MFA, but MFA can involve more than two independent authentication factors.',
      ),
      QuizQuestion(
        question: 'Why does MFA make unauthorized access significantly harder, even if an attacker steals a password?',
        options: [
          'MFA automatically changes the password every hour',
          'The attacker is unlikely to also have access to the second independent authentication factor',
          'MFA disables the account after any password theft',
          'MFA only works if the password is never used',
        ],
        correctIndex: 1,
        explanation: 'Even if an attacker steals a password, they are unlikely to have access to the second independent authentication factor, making unauthorized access much more difficult.',
      ),
      QuizQuestion(
        question: 'Which MFA method is specifically noted as vulnerable to SIM-swapping attacks?',
        options: [
          'Hardware security keys',
          'Authenticator apps',
          'SMS-based OTPs',
          'Biometric verification',
        ],
        correctIndex: 2,
        explanation: 'SMS-based OTPs can be vulnerable to SIM-swapping attacks, which is why hardware security keys and authenticator apps are generally preferred.',
      ),
      QuizQuestion(
        question: 'What enterprise risk is associated with users approving push notifications without careful review?',
        options: [
          'No risk — push notifications are always safe',
          'Users may approve fraudulent push notifications, granting an attacker access',
          'Push notifications automatically block all login attempts',
          'Push notifications replace the need for a password entirely',
        ],
        correctIndex: 1,
        explanation: 'One limitation of MFA is that users may approve fraudulent push notifications without careful review, potentially granting an attacker access.',
      ),
      QuizQuestion(
        question: 'According to the enterprise MFA best practices in this chapter, which authentication methods should be preferred over SMS-based OTPs?',
        options: [
          'Security questions',
          'Authenticator apps or hardware security keys',
          'Plain usernames without any additional factor',
          'Shared team passwords',
        ],
        correctIndex: 1,
        explanation: 'Best practice is to prefer authenticator apps or hardware security keys over SMS-based OTPs, since SMS is vulnerable to SIM-swapping.',
      ),
    ],
  ),
];
