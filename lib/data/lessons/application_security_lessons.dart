import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> applicationSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Application Security',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Applications Are the New Front Line',
        body:
            'Applications have become the primary interface through which '
            'organizations deliver business services. Employees access '
            'enterprise applications to perform daily tasks, customers use '
            'web and mobile applications to purchase products, and '
            'organizations increasingly rely on cloud-hosted applications '
            'to support critical business operations.',
      ),
      LessonSection(
        body:
            'As applications become more feature-rich and interconnected, '
            'they also become attractive targets for attackers. '
            'Vulnerabilities in applications can allow unauthorized users '
            'to steal sensitive information, modify data, disrupt '
            'services, or gain access to underlying systems.',
      ),
      LessonSection(
        heading: 'What Application Security Covers',
        body:
            'Application Security (AppSec) refers to the processes, '
            'technologies, and practices used to protect software '
            'applications from security threats throughout their entire '
            'lifecycle — from design and development to deployment, '
            'operation, and retirement. Unlike traditional network '
            'security, which focuses on protecting infrastructure, '
            'application security focuses on protecting the software '
            'itself and the data it processes.',
      ),
      LessonSection(
        heading: 'Why Application Security Is Important',
        body: 'Applications often handle valuable information such as:',
        bullets: [
          'Customer records',
          'Financial transactions',
          'Healthcare information',
          'Employee data',
          'Intellectual property',
          'Authentication credentials',
        ],
      ),
      LessonSection(
        body: 'If an application contains security weaknesses, attackers may exploit them to:',
        bullets: [
          'Steal confidential information',
          'Execute malicious code',
          'Modify or delete data',
          'Bypass authentication',
          'Disrupt business operations',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/ciatriad_appsec.jpg',
          caption:
              'Implementing application security controls helps reduce '
              'these risks and supports the Confidentiality, Integrity, '
              'and Availability (CIA) principles.',
        ),
      ),
      LessonSection(
        heading: 'Objectives of Application Security',
        body:
            'Application security aims to protect software and the '
            'information it processes against both accidental and '
            'intentional threats. The primary objectives include:',
        bullets: [
          'Prevent unauthorized access',
          'Protect sensitive information',
          'Ensure application availability',
          'Maintain data integrity',
          'Detect and respond to attacks',
          'Reduce software vulnerabilities',
          'Support regulatory compliance',
        ],
      ),
      LessonSection(
        body:
            'These objectives are achieved through secure design, secure '
            'coding, regular testing, continuous monitoring, and timely '
            'patching — not through any single control acting alone.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Common Application Security Threats',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'A Wide and Growing Attack Surface',
        body:
            'Applications are exposed to numerous threats throughout '
            'their lifecycle. Attackers continuously search for '
            'weaknesses that allow them to bypass security controls or '
            'manipulate application behavior. Some of the most common '
            'threats are covered below.',
      ),
      LessonSection(
        heading: 'Injection Attacks',
        body:
            'Injection attacks occur when untrusted input is interpreted '
            'as executable commands or queries. Examples include SQL '
            'Injection, Command Injection, LDAP Injection, and XML '
            'Injection. Poor input validation is one of the primary '
            'causes of injection attacks.',
      ),
      LessonSection(
        heading: 'Broken Authentication',
        body:
            'Weak authentication mechanisms allow attackers to '
            'impersonate legitimate users. Examples include weak '
            'passwords, password reuse, missing Multi-Factor '
            'Authentication (MFA), session hijacking, and credential '
            'stuffing. Strong authentication mechanisms significantly '
            'reduce these risks.',
      ),
      LessonSection(
        heading: 'Broken Access Control',
        body:
            'Applications should ensure that users access only the '
            'resources they are authorized to use. Examples include '
            'viewing another user\'s records, accessing administrative '
            'pages without authorization, and modifying restricted '
            'information. Access control should be enforced on the '
            'server side rather than relying solely on client-side '
            'controls.',
      ),
      LessonSection(
        heading: 'Security Misconfiguration',
        body:
            'Applications may become vulnerable because of incorrect '
            'security settings. Examples include default passwords, '
            'unnecessary services, debug mode enabled in production, '
            'incorrect file permissions, and publicly accessible '
            'storage. Regular configuration reviews help reduce these '
            'risks.',
      ),
      LessonSection(
        heading: 'Sensitive Data Exposure',
        body:
            'Applications must adequately protect sensitive information. '
            'Examples include plaintext passwords, unencrypted databases, '
            'weak encryption algorithms, and improper key management. '
            'Encryption should be used to protect sensitive data both at '
            'rest and in transit.',
      ),
      LessonSection(
        heading: 'Vulnerable Components',
        body:
            'Modern applications often rely on third-party libraries and '
            'frameworks. If these components contain known '
            'vulnerabilities, attackers may exploit them to compromise '
            'the application. Organizations should regularly update '
            'software dependencies and monitor for newly disclosed '
            'vulnerabilities.',
      ),
      LessonSection(
        heading: 'Common Application Security Threats at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Threat', 'Possible Impact'],
          tableRows: [
            ['Injection', 'Unauthorized database access'],
            ['Broken Authentication', 'Account compromise'],
            ['Broken Access Control', 'Unauthorized resource access'],
            ['Security Misconfiguration', 'System compromise'],
            ['Sensitive Data Exposure', 'Data breach'],
            ['Vulnerable Components', 'Remote exploitation'],
          ],
        ),
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Secure Software Development Life Cycle (SSDLC)',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Building Security In From the Start',
        body:
            'Building security into software from the beginning is more '
            'effective and less expensive than fixing vulnerabilities '
            'after deployment. The Secure Software Development Life '
            'Cycle (SSDLC) integrates security activities into every '
            'stage of software development. Instead of treating security '
            'as a final testing step, SSDLC makes security a continuous '
            'process. Typical phases include:',
        bullets: [
          'Planning',
          'Requirements',
          'Design',
          'Development',
          'Testing',
          'Deployment',
          'Maintenance',
        ],
      ),
      LessonSection(
        body:
            'Each phase includes security-related activities — covered '
            'one by one below.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/ssdlc_phases.jpg',
          caption:
              'The Secure Software Development Life Cycle integrates '
              'security activities into every phase, from planning '
              'through maintenance, rather than treating security as a '
              'final testing step.',
        ),
      ),
      LessonSection(
        heading: 'Planning',
        body:
            'During planning, organizations identify business '
            'objectives, security goals, compliance requirements, and '
            'risk tolerance. Early planning ensures that security '
            'requirements are considered before development begins.',
      ),
      LessonSection(
        heading: 'Requirements',
        body:
            'Security requirements define what protections the '
            'application must provide — examples include authentication, '
            'authorization, encryption, logging, data privacy, and audit '
            'requirements. These requirements guide developers throughout '
            'the project.',
      ),
      LessonSection(
        heading: 'Design',
        body:
            'The design phase focuses on building a secure architecture. '
            'Design activities include threat modeling, selecting '
            'authentication methods, defining access control, designing '
            'secure APIs, and planning encryption. A secure design '
            'reduces the likelihood of vulnerabilities later in '
            'development.',
      ),
      LessonSection(
        heading: 'Development',
        body:
            'Developers implement application functionality while '
            'following secure coding practices. Activities include input '
            'validation, secure session management, error handling, '
            'dependency management, and secure API development.',
      ),
      LessonSection(
        heading: 'Testing',
        body:
            'Applications should undergo multiple security tests before '
            'deployment — examples include Static Application Security '
            'Testing (SAST), Dynamic Application Security Testing '
            '(DAST), penetration testing, and vulnerability scanning. '
            'Testing helps identify vulnerabilities before users are '
            'affected.',
      ),
      LessonSection(
        heading: 'Deployment',
        body: 'During deployment, organizations should:',
        bullets: [
          'Disable unnecessary services',
          'Remove default credentials',
          'Apply secure configurations',
          'Enable logging',
          'Verify encryption settings',
        ],
      ),
      LessonSection(
        heading: 'Maintenance',
        body:
            'Security continues after deployment. Maintenance activities '
            'include installing security patches, monitoring application '
            'logs, updating software libraries, conducting periodic '
            'security reviews, and responding to vulnerabilities.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Secure by Design & Secure by Default',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Secure by Design',
        body:
            'Secure by Design means incorporating security into the '
            'application\'s architecture from the earliest stages of '
            'development rather than adding security features later. '
            'Developers consider security requirements while making '
            'design decisions. Examples include:',
        bullets: [
          'Strong authentication mechanisms',
          'Least privilege architecture',
          'Secure API design',
          'Data encryption',
          'Comprehensive logging',
        ],
      ),
      LessonSection(
        body:
            'Secure by Design reduces the likelihood of introducing '
            'security weaknesses into the application.',
      ),
      LessonSection(
        heading: 'Secure by Default',
        body:
            'Applications should be secure immediately after '
            'installation without requiring administrators to manually '
            'enable security features. Examples include:',
        bullets: [
          'Strong default configurations',
          'Disabled unnecessary services',
          'Enforced encryption',
          'Default password change requirements',
          'Secure logging enabled',
        ],
      ),
      LessonSection(
        body:
            'Secure by Default minimizes security risks caused by '
            'improper configuration.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/secure_by_default.jpg',
          caption:
              'Secure by Design and Secure by Default work together — '
              'one shapes the architecture during development, the other '
              'ensures the shipped application is safe without extra '
              'configuration.',
        ),
      ),
      LessonSection(
        heading: 'Secure Coding Practices',
        body:
            'Secure coding involves writing software that resists common '
            'attacks and handles unexpected situations safely. Developers '
            'should follow established coding standards and security '
            'guidelines throughout development. Important secure coding '
            'practices include:',
        bullets: [
          'Validate all user input',
          'Encode output before displaying it',
          'Use parameterized database queries',
          'Protect sensitive information',
          'Handle errors securely',
          'Remove unnecessary code',
          'Keep software dependencies updated',
          'Avoid hardcoded credentials',
        ],
      ),
      LessonSection(
        body:
            'Secure coding significantly reduces the number of '
            'vulnerabilities introduced during development.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Secure Coding: Input, Output & Errors',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Input Validation',
        body:
            'Applications should never assume that user-supplied '
            'information is safe. Input validation verifies that data '
            'conforms to expected formats before it is processed. '
            'Validation checks may include:',
        bullets: [
          'Length',
          'Data type',
          'Allowed characters',
          'Numeric ranges',
          'Required fields',
        ],
      ),
      LessonSection(
        body:
            'For example, an age field should accept only reasonable '
            'numeric values rather than arbitrary text. Proper input '
            'validation helps prevent injection attacks and unexpected '
            'application behavior.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/input_validation.jpg',
          caption:
              'Input validation checks that submitted data matches the '
              'expected length, type, characters, and range before the '
              'application ever processes it.',
        ),
      ),
      LessonSection(
        heading: 'Output Encoding',
        body:
            'Even when user input has been validated, applications '
            'should also safely process data before displaying it to '
            'users. Output encoding converts special characters into a '
            'safe format so that browsers interpret them as text rather '
            'than executable code. Output encoding is particularly '
            'effective in reducing the risk of Cross-Site Scripting '
            '(XSS) attacks. Different output contexts — such as HTML, '
            'JavaScript, CSS, and URLs — may require different encoding '
            'techniques.',
      ),
      LessonSection(
        heading: 'Secure Error Handling',
        body:
            'Applications should provide meaningful error messages to '
            'users without revealing sensitive technical information. '
            'Poorly designed error messages may expose:',
        bullets: [
          'Database names',
          'File paths',
          'Server information',
          'Source code details',
          'Software versions',
        ],
      ),
      LessonSection(
        body: 'Instead, applications should:',
        bullets: [
          'Display generic messages to users',
          'Record detailed information in secure log files',
          'Avoid exposing internal implementation details',
        ],
      ),
      LessonSection(
        body:
            'This approach assists administrators while limiting '
            'information available to attackers.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Integrate security into every phase of the SSDLC',
          'Follow Secure by Design and Secure by Default principles',
          'Validate all user input',
          'Encode application output appropriately',
          'Use secure coding standards',
          'Keep third-party libraries updated',
          'Protect sensitive information using encryption',
          'Log security events for auditing and investigation',
          'Regularly perform security testing throughout development',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Authentication vs Authorization',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Two Related but Distinct Processes',
        body:
            'One of the primary objectives of application security is '
            'ensuring that only authorized users can access application '
            'resources. This is achieved through two closely related but '
            'distinct security processes: authentication and '
            'authorization. Although these terms are often used '
            'together, they serve different purposes — authentication '
            'verifies the identity of a user, while authorization '
            'determines what that authenticated user is allowed to do. '
            'Implementing both correctly helps prevent unauthorized '
            'access and protects sensitive business data.',
      ),
      LessonSection(
        heading: 'Authentication: "Who Are You?"',
        body:
            'Authentication is the process of verifying the identity of '
            'a user, application, or device before granting access. '
            'Applications typically authenticate users before providing '
            'access to protected resources. Common authentication '
            'methods include:',
        bullets: [
          'Username and password',
          'Multi-Factor Authentication (MFA)',
          'Biometrics',
          'Smart cards',
          'Hardware security keys',
          'Digital certificates',
        ],
      ),
      LessonSection(
        body:
            'For example, when a user enters a username and password to '
            'sign in to an online banking application, the application '
            'verifies the credentials before allowing access.',
      ),
      LessonSection(
        heading: 'Authorization: "What Are You Allowed to Do?"',
        body:
            'After authentication is successful, the application '
            'determines what the user is permitted to access. '
            'Authorization controls may determine whether a user can:',
        bullets: [
          'View records',
          'Edit information',
          'Delete files',
          'Create new users',
          'Access administrative functions',
        ],
      ),
      LessonSection(
        body:
            'For example, a customer may be allowed to view only their '
            'own orders, while an administrator can manage all customer '
            'accounts.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/authz_examples.jpg',
          caption:
              'Authorization decisions determine exactly what an already-'
              'authenticated user can view, edit, or delete — access is '
              'scoped per user, not all-or-nothing.',
        ),
      ),
      LessonSection(
        heading: 'Authentication vs Authorization at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Authentication', 'Authorization'],
          tableRows: [
            ['Verifies identity', 'Determines permissions'],
            ['Occurs first', 'Occurs after authentication'],
            ['Answers "Who are you?"', 'Answers "What can you access?"'],
            ['Uses credentials', 'Uses access control policies'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Authentication Factors',
        body:
            'Applications can verify identities using one or more '
            'authentication factors. Authentication factors are grouped '
            'into three categories.',
      ),
      LessonSection(
        heading: 'Something You Know',
        body:
            'Information remembered by the user — examples include a '
            'password, PIN, or passphrase.',
      ),
      LessonSection(
        heading: 'Something You Have',
        body:
            'A physical object possessed by the user — examples include '
            'a smart card, hardware security key, authenticator '
            'application, or One-Time Password (OTP) token.',
      ),
      LessonSection(
        heading: 'Something You Are',
        body:
            'Biological characteristics unique to the user — examples '
            'include fingerprint, facial recognition, iris scan, and '
            'voice recognition.',
      ),
      LessonSection(
        body:
            'Combining factors from different categories significantly '
            'improves authentication security.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/auth_factors.jpg',
          caption:
              'The three authentication factor categories — something '
              'you know, something you have, and something you are — '
              'combine to make authentication significantly stronger '
              'than any single factor alone.',
        ),
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Session Management & Cookies',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Session Management',
        body:
            'After authentication, applications usually create a '
            'session. A session allows users to interact with an '
            'application without repeatedly entering their credentials '
            'for every request. Instead of authenticating every request, '
            'the application issues a session identifier (Session ID) '
            'that uniquely identifies the authenticated user. The '
            'Session ID is presented with subsequent requests, allowing '
            'the application to recognize the user until the session '
            'expires or is terminated.',
      ),
      LessonSection(
        heading: 'Session Lifecycle',
        body: 'A typical application session consists of:',
        bullets: [
          'User logs in',
          'Application authenticates the user',
          'Session ID is created',
          'Session ID is stored by the client',
          'Client sends Session ID with each request',
          'Application validates the Session ID',
          'User logs out or session expires',
        ],
      ),
      LessonSection(
        body:
            'Proper session management is essential because attackers '
            'often target session identifiers instead of user passwords.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/session_lifecycle.jpg',
          caption:
              'A session moves through a defined lifecycle from login to '
              'termination — attackers who steal a live Session ID can '
              'impersonate the user without ever needing their password.',
        ),
      ),
      LessonSection(
        heading: 'Session Security',
        body:
            'Poor session management can allow attackers to hijack '
            'authenticated sessions. Applications should implement '
            'several protections, covered below.',
      ),
      LessonSection(
        heading: 'Session Timeout',
        body:
            'Inactive sessions should automatically expire after a '
            'defined period. This reduces the likelihood of unauthorized '
            'access if a user leaves a session unattended.',
      ),
      LessonSection(
        heading: 'Session Termination',
        body:
            'Applications should destroy the session immediately when '
            'the user logs out. The Session ID should become invalid and '
            'unusable.',
      ),
      LessonSection(
        heading: 'Session Regeneration',
        body:
            'Applications should generate a new Session ID after '
            'successful authentication or when user privileges change. '
            'This helps prevent session fixation attacks, where an '
            'attacker attempts to force a user to use a known Session '
            'ID.',
      ),
      LessonSection(
        heading: 'Secure Session Storage',
        body:
            'Applications should avoid exposing Session IDs in URLs. '
            'Session identifiers should be stored securely using cookies '
            'protected with appropriate security attributes.',
      ),
      LessonSection(
        heading: 'Cookies',
        body:
            'A cookie is a small piece of data stored by the user\'s web '
            'browser on behalf of a web application. Cookies allow '
            'applications to remember information between requests. '
            'Common uses include session management, user preferences, '
            'language settings, shopping cart information, and '
            'authentication. Although cookies improve usability, they '
            'must be protected because attackers may attempt to steal or '
            'manipulate them.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/cookies_overview.jpg',
          caption:
              'Cookies let an application remember state between '
              'requests, but that same persistence makes them a target '
              'attackers try to steal or manipulate.',
        ),
      ),
      LessonSection(
        heading: 'Secure Cookie Attributes',
        body:
            'Modern browsers support several cookie attributes that '
            'improve security.',
      ),
      LessonSection(
        heading: 'Secure Attribute',
        body:
            'The Secure attribute instructs browsers to send the cookie '
            'only over encrypted HTTPS connections. This helps protect '
            'cookies from interception over unencrypted networks.',
      ),
      LessonSection(
        heading: 'HttpOnly Attribute',
        body:
            'The HttpOnly attribute prevents client-side scripts such as '
            'JavaScript from accessing the cookie. This reduces the risk '
            'of cookie theft during Cross-Site Scripting (XSS) attacks.',
      ),
      LessonSection(
        heading: 'SameSite Attribute',
        body:
            'The SameSite attribute controls when browsers include '
            'cookies in cross-site requests. Common settings include:',
        bullets: [
          'Strict – Cookie is sent only for requests originating from the same website',
          'Lax – Cookie is sent for most same-site requests and limited cross-site navigation',
          'None – Cookie is sent with both same-site and cross-site requests; this setting requires the Secure attribute',
        ],
      ),
      LessonSection(
        body:
            'Proper use of the SameSite attribute helps reduce the risk '
            'of Cross-Site Request Forgery (CSRF) attacks.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Attribute', 'Purpose'],
          tableRows: [
            ['Secure', 'Sends cookie only over HTTPS'],
            ['HttpOnly', 'Prevents JavaScript access'],
            ['SameSite', 'Controls cross-site cookie usage'],
          ],
        ),
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Passwords, MFA, SSO & Identity Federation',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Password Security',
        body:
            'Passwords remain one of the most widely used authentication '
            'methods. Weak passwords significantly increase the risk of '
            'unauthorized access. Applications should enforce password '
            'policies that encourage users to create strong, unique '
            'passwords.',
      ),
      LessonSection(
        heading: 'Characteristics of Strong Passwords',
        body: 'A strong password should:',
        bullets: [
          'Be sufficiently long',
          'Include a combination of uppercase and lowercase letters',
          'Include numbers and special characters where appropriate',
          'Avoid dictionary words',
          'Avoid personal information',
          'Be unique for each application',
        ],
      ),
      LessonSection(
        body:
            'Long passphrases are often easier to remember and more '
            'resistant to guessing attacks than short, complex '
            'passwords.',
      ),
      LessonSection(
        heading: 'Password Policy',
        body: 'Organizations commonly enforce password policies that include:',
        bullets: [
          'Minimum password length',
          'Password history',
          'Account lockout after repeated failed attempts',
          'Password expiration where required by organizational policy',
          'Detection of commonly used or compromised passwords',
        ],
      ),
      LessonSection(
        body:
            'Password policies should balance usability and security.',
      ),
      LessonSection(
        heading: 'Secure Password Storage',
        body:
            'Applications should never store passwords in plaintext. '
            'Instead, passwords should be processed using secure '
            'cryptographic hashing algorithms before storage. When users '
            'log in: the entered password is hashed, the application '
            'compares the generated hash with the stored hash, and if '
            'both hashes match, authentication succeeds.',
      ),
      LessonSection(
        body:
            'Additionally, applications should use a unique random salt '
            'for each password before hashing. A salt helps protect '
            'against attacks that use precomputed hash tables, such as '
            'rainbow tables, and ensures that identical passwords produce '
            'different stored hash values.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/password_storage.jpg',
          caption:
              'Passwords are salted and hashed before storage — the '
              'application never keeps the plaintext password, only a '
              'value it can compare against on the next login.',
        ),
      ),
      LessonSection(
        heading: 'Multi-Factor Authentication (MFA)',
        body:
            'Passwords alone are no longer sufficient to protect many '
            'applications. Multi-Factor Authentication (MFA) requires '
            'users to provide two or more independent authentication '
            'factors before access is granted. A typical MFA process may '
            'require a password plus a verification code from an '
            'authenticator application. Even if an attacker obtains the '
            'user\'s password, they would still need the second '
            'authentication factor to complete the login.',
      ),
      LessonSection(
        body: 'MFA is particularly important for:',
        bullets: [
          'Administrative accounts',
          'Financial applications',
          'Cloud services',
          'Remote access portals',
          'Email systems',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/mfa_process.jpg',
          caption:
              'MFA requires two or more independent factors before '
              'granting access — a stolen password alone is no longer '
              'enough to log in.',
        ),
      ),
      LessonSection(
        heading: 'Single Sign-On (SSO)',
        body:
            'Organizations often use multiple business applications. '
            'Requiring users to authenticate separately for each '
            'application increases administrative overhead and can lead '
            'to poor password practices. Single Sign-On (SSO) allows '
            'users to authenticate once and gain access to multiple '
            'trusted applications without signing in again. Benefits '
            'include:',
        bullets: [
          'Improved user experience',
          'Reduced password fatigue',
          'Centralized authentication',
          'Simplified account management',
          'Fewer password reset requests',
        ],
      ),
      LessonSection(
        body: 'SSO should be combined with MFA to provide stronger security.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/sso_benefits.jpg',
          caption:
              'SSO lets a user authenticate once and reach every trusted '
              'application from that single login — which is exactly why '
              'it should always be paired with MFA.',
        ),
      ),
      LessonSection(
        heading: 'Identity Federation',
        body:
            'Identity Federation enables trusted organizations or '
            'applications to share authentication information securely. '
            'Rather than maintaining separate user accounts for every '
            'application or partner organization, users authenticate '
            'through a trusted identity provider, which shares '
            'authentication information with participating services. '
            'Federation is widely used in cloud applications, '
            'business-to-business (B2B) integrations, educational '
            'institutions, and government services. It simplifies user '
            'management while allowing organizations to maintain control '
            'over their own user identities.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Implement strong authentication mechanisms',
          'Enable Multi-Factor Authentication (MFA), especially for privileged accounts',
          'Use secure session management and regenerate session identifiers after authentication',
          'Configure cookies with the Secure, HttpOnly, and appropriate SameSite attributes',
          'Store passwords as salted hashes, never in plaintext',
          'Apply account lockout or rate-limiting controls to reduce password guessing attacks',
          'Use Single Sign-On (SSO) where appropriate to simplify authentication while maintaining security',
          'Regularly review authentication and authorization policies',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'SQL Injection & Cross-Site Scripting',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Common Web Application Attacks',
        body:
            'Web applications are continuously exposed to the Internet, '
            'making them one of the most frequently targeted components '
            'of an organization\'s IT environment. Attackers attempt to '
            'exploit application vulnerabilities to gain unauthorized '
            'access, steal sensitive information, modify data, or '
            'disrupt business operations.',
      ),
      LessonSection(
        body:
            'Many organizations use the OWASP Top 10 as a reference for '
            'understanding the most common categories of web application '
            'security risks. OWASP (Open Worldwide Application Security '
            'Project) is a nonprofit organization that publishes guidance '
            'on improving application security. While the specific '
            'categories evolve over time, the underlying attack '
            'techniques remain highly relevant.',
      ),
      LessonSection(
        heading: 'SQL Injection (SQLi)',
        body:
            'Many web applications interact with databases to store and '
            'retrieve information. SQL Injection (SQLi) occurs when an '
            'application accepts untrusted user input and incorporates '
            'it into SQL queries without proper validation or '
            'parameterization. An attacker may manipulate the query so '
            'that the database performs unintended operations.',
      ),
      LessonSection(
        body: 'Potential consequences include:',
        bullets: [
          'Reading confidential information',
          'Modifying database records',
          'Deleting data',
          'Bypassing authentication',
          'Executing administrative database commands',
        ],
      ),
      LessonSection(
        body:
            'For example, an application that directly inserts user '
            'input into a database query without validation may allow an '
            'attacker to alter the intended query.',
      ),
      LessonSection(
        heading: 'Causes of SQL Injection',
        bullets: [
          'Dynamic SQL queries',
          'Lack of input validation',
          'Failure to use parameterized queries',
          'Poor database security practices',
        ],
      ),
      LessonSection(
        heading: 'Preventing SQL Injection',
        bullets: [
          'Use parameterized queries (prepared statements)',
          'Validate all user input',
          'Apply the Principle of Least Privilege to database accounts',
          'Avoid constructing SQL statements using user input',
          'Monitor database activity',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/sqli_prevention.jpg',
          caption:
              'Parameterized queries keep user input as data rather than '
              'executable SQL, closing off the most common path to SQL '
              'Injection.',
        ),
      ),
      LessonSection(
        heading: 'Cross-Site Scripting (XSS)',
        body:
            'Cross-Site Scripting (XSS) occurs when an application '
            'includes untrusted input in a web page without properly '
            'handling it. As a result, malicious client-side script may '
            'execute within the browser of another user. Unlike SQL '
            'Injection, which targets databases, XSS targets users of '
            'the application.',
      ),
      LessonSection(
        body: 'Possible consequences include:',
        bullets: [
          'Session cookie theft',
          'Account compromise',
          'Unauthorized actions',
          'Defacement of web pages',
          'Redirection to malicious websites',
        ],
      ),
      LessonSection(
        heading: 'Stored XSS',
        body:
            'Malicious content is permanently stored by the application '
            'and delivered to users when they access affected pages — '
            'examples include discussion forums, comment sections, and '
            'user profiles.',
      ),
      LessonSection(
        heading: 'Reflected XSS',
        body:
            'The malicious content is included in the server\'s '
            'immediate response to a specially crafted request. This '
            'often requires a user to follow a malicious link.',
      ),
      LessonSection(
        heading: 'DOM-Based XSS',
        body:
            'The vulnerability exists within client-side JavaScript that '
            'modifies the Document Object Model (DOM) using untrusted '
            'data. The attack occurs within the browser rather than '
            'through server-side processing.',
      ),
      LessonSection(
        heading: 'Preventing XSS',
        bullets: [
          'Validate user input',
          'Apply context-appropriate output encoding',
          'Use Content Security Policy (CSP)',
          'Avoid unsafe JavaScript functions',
          'Sanitize user-generated content',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/xss_prevention.jpg',
          caption:
              'Context-appropriate output encoding, together with a '
              'Content Security Policy, stops malicious scripts from '
              'executing even if untrusted content makes it onto the '
              'page.',
        ),
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'CSRF, Command Injection & Directory Traversal',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Cross-Site Request Forgery (CSRF)',
        body:
            'Cross-Site Request Forgery (CSRF) tricks an authenticated '
            'user into submitting an unintended request to a web '
            'application. If the victim is already authenticated, the '
            'application may treat the malicious request as legitimate.',
      ),
      LessonSection(
        body: 'Examples include:',
        bullets: [
          'Changing account settings',
          'Initiating financial transactions',
          'Modifying user profiles',
          'Deleting data',
        ],
      ),
      LessonSection(
        body:
            'The attack succeeds because the application trusts the '
            'authenticated session without verifying that the request '
            'originated from the legitimate user interface.',
      ),
      LessonSection(
        heading: 'Preventing CSRF',
        bullets: [
          'CSRF tokens',
          'SameSite cookie attribute',
          'Re-authentication for sensitive operations',
          'Validation of request origin',
          'User confirmation for critical actions',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/csrf_prevention.jpg',
          caption:
              'A CSRF token, unique to the user\'s session, must '
              'accompany any state-changing request — a forged request '
              'from another site simply won\'t have it.',
        ),
      ),
      LessonSection(
        heading: 'Command Injection',
        body:
            'Applications sometimes interact with the operating system '
            'to perform administrative or processing tasks. Command '
            'Injection occurs when an attacker influences application '
            'input so that unintended operating system commands are '
            'executed.',
      ),
      LessonSection(
        body: 'Potential consequences include:',
        bullets: [
          'Reading sensitive files',
          'Creating unauthorized accounts',
          'Installing malware',
          'Executing arbitrary programs',
          'Compromising the underlying server',
        ],
      ),
      LessonSection(
        heading: 'Preventing Command Injection',
        bullets: [
          'Avoid executing operating system commands whenever possible',
          'Validate all user input',
          'Use allowlists for acceptable values',
          'Run applications with minimal operating system privileges',
          'Monitor system activity',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/command_injection_prevention.jpg',
          caption:
              'Running applications with minimal OS privileges limits '
              'how much damage a successful command injection can '
              'actually do, even if input validation is imperfect.',
        ),
      ),
      LessonSection(
        heading: 'Directory Traversal',
        body:
            'Applications often provide access to files stored on the '
            'server. Directory Traversal, also called Path Traversal, '
            'occurs when an attacker attempts to access files or '
            'directories outside the intended application directory.',
      ),
      LessonSection(
        body: 'Potential targets include:',
        bullets: [
          'Configuration files',
          'Password files',
          'Application source code',
          'Log files',
          'Backup files',
        ],
      ),
      LessonSection(
        body:
            'Improper validation of file paths often enables this '
            'vulnerability.',
      ),
      LessonSection(
        heading: 'Preventing Directory Traversal',
        bullets: [
          'Restrict file access to approved directories',
          'Validate file names',
          'Use allowlists',
          'Avoid directly accepting file paths from users',
          'Apply least privilege to file permissions',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/directory_traversal_prevention.jpg',
          caption:
              'Restricting file access to a known, approved directory '
              'means a manipulated file path simply has nowhere outside '
              'it to reach.',
        ),
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'File Inclusion, SSRF, XXE & Clickjacking',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'File Inclusion Vulnerabilities',
        body:
            'Some applications dynamically include files during '
            'execution. Improper validation may allow attackers to '
            'influence which files are included. Two common categories '
            'are covered below.',
      ),
      LessonSection(
        heading: 'Local File Inclusion (LFI)',
        body:
            'The application unintentionally loads files already present '
            'on the local server.',
      ),
      LessonSection(
        heading: 'Remote File Inclusion (RFI)',
        body:
            'The application loads files from an external location when '
            'insecure configurations permit this behavior.',
      ),
      LessonSection(
        heading: 'Preventing File Inclusion Vulnerabilities',
        bullets: [
          'Validate file names',
          'Use predefined file lists',
          'Disable unnecessary remote inclusion features',
          'Restrict file permissions',
          'Keep software updated',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/file_inclusion_prevention.jpg',
          caption:
              'A predefined, validated list of allowed files closes off '
              'both Local and Remote File Inclusion — the application '
              'never has to trust a file path it wasn\'t expecting.',
        ),
      ),
      LessonSection(
        heading: 'Server-Side Request Forgery (SSRF)',
        body:
            'Server-Side Request Forgery (SSRF) occurs when an '
            'application accepts a user-supplied resource location and '
            'retrieves it on behalf of the user without adequate '
            'validation. An attacker may attempt to cause the server to '
            'make unintended requests to internal or external systems.',
      ),
      LessonSection(
        body: 'Potential impacts include:',
        bullets: [
          'Accessing internal services not directly exposed to users',
          'Retrieving sensitive metadata',
          'Bypassing network restrictions',
          'Scanning internal network resources',
        ],
      ),
      LessonSection(
        heading: 'Preventing SSRF',
        bullets: [
          'Validate and restrict resource locations',
          'Use allowlists for permitted destinations',
          'Block access to internal services where unnecessary',
          'Monitor outbound requests',
          'Apply network segmentation',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/ssrf_prevention.jpg',
          caption:
              'Network segmentation and destination allowlists keep a '
              'compromised server-side request from ever reaching '
              'internal services it has no legitimate reason to touch.',
        ),
      ),
      LessonSection(
        heading: 'XML External Entity (XXE)',
        body:
            'Applications that process XML documents may be vulnerable '
            'if XML parsers are improperly configured. XML External '
            'Entity (XXE) attacks exploit XML processing features to '
            'access unauthorized resources or retrieve sensitive '
            'information.',
      ),
      LessonSection(
        body: 'Possible impacts include:',
        bullets: [
          'Reading local files',
          'Accessing internal systems',
          'Denial of Service',
          'Information disclosure',
        ],
      ),
      LessonSection(
        heading: 'Preventing XXE',
        bullets: [
          'Disable unnecessary external entity processing',
          'Use secure XML parser configurations',
          'Validate XML input',
          'Keep XML libraries updated',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/xxe_prevention.jpg',
          caption:
              'Disabling external entity processing in the XML parser '
              'configuration removes the exact feature XXE attacks '
              'depend on.',
        ),
      ),
      LessonSection(
        heading: 'Clickjacking',
        body:
            'Clickjacking is a technique that tricks users into clicking '
            'something different from what they believe they are '
            'clicking. Attackers typically overlay a transparent or '
            'disguised web page over a legitimate page, causing users to '
            'unknowingly perform unintended actions.',
      ),
      LessonSection(
        body: 'Examples include:',
        bullets: [
          'Approving transactions',
          'Granting permissions',
          'Changing account settings',
          'Initiating unwanted actions',
        ],
      ),
      LessonSection(
        heading: 'Preventing Clickjacking',
        bullets: [
          'Frame restrictions using HTTP response headers',
          'User confirmation for sensitive actions',
          'Multi-Factor Authentication (MFA) for critical operations',
          'Regular application security testing',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/clickjacking_prevention.jpg',
          caption:
              'Frame-restriction response headers stop a legitimate page '
              'from being loaded inside a disguised overlay in the first '
              'place.',
        ),
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'General Defensive Techniques',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'A Layered Defense',
        body:
            'Although each application attack has unique characteristics, '
            'several defensive practices help reduce the risk of many '
            'different attacks at once. Organizations should:',
        bullets: [
          'Validate all user input',
          'Encode output appropriately',
          'Use parameterized database queries',
          'Apply secure authentication mechanisms',
          'Enforce least privilege',
          'Keep software components updated',
          'Perform regular vulnerability assessments',
          'Conduct penetration testing',
          'Monitor application logs for suspicious activity',
          'Apply security patches promptly',
          'Implement secure HTTP response headers where appropriate',
          'Follow secure coding standards throughout development',
        ],
      ),
      LessonSection(
        body:
            'A layered security approach significantly improves an '
            'application\'s resistance to common attacks — no single '
            'control on this list is enough by itself, but together '
            'they close off most of the paths attackers rely on.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Integrate security testing into the Secure Software Development Life Cycle (SSDLC)',
          'Protect sensitive data using strong encryption',
          'Review third-party libraries for known vulnerabilities',
          'Validate all external input before processing',
          'Use secure session management techniques',
          'Conduct periodic code reviews',
          'Implement continuous monitoring and logging',
          'Train developers on secure coding practices and emerging threats',
        ],
      ),
    ],
  ),

  // 13 ---------------------------------------------------------------------
  Lesson(
    title: 'Secure APIs: Architecture, REST & SOAP',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Why APIs Matter for Security',
        body:
            'Modern applications rarely operate in isolation. They '
            'communicate with databases, cloud services, mobile '
            'applications, third-party platforms, and other software '
            'through Application Programming Interfaces (APIs). An '
            'Application Programming Interface (API) is a set of rules '
            'and protocols that allows different software applications '
            'to communicate and exchange data. For example, a mobile '
            'banking application retrieves account information from a '
            'banking server using APIs; an e-commerce website '
            'communicates with a payment gateway through APIs; and a '
            'weather application retrieves forecasts from an external '
            'service using APIs.',
      ),
      LessonSection(
        body:
            'Because APIs often expose sensitive business functions and '
            'data, they are attractive targets for attackers. A '
            'vulnerable API can lead to unauthorized access, data '
            'breaches, or service disruption. Secure API design is '
            'therefore an essential part of application security.',
      ),
      LessonSection(
        heading: 'Why API Security Is Important',
        body: 'APIs often provide direct access to:',
        bullets: [
          'Customer information',
          'Financial records',
          'Authentication services',
          'Business transactions',
          'Cloud resources',
          'Administrative functions',
        ],
      ),
      LessonSection(
        body: 'If an API is not properly secured, attackers may:',
        bullets: [
          'Access confidential information',
          'Modify application data',
          'Bypass authentication',
          'Abuse application functionality',
          'Launch automated attacks',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/api_security_importance.jpg',
          caption:
              'APIs expose business functions and data directly, so '
              'implementing strong API security controls protects both '
              'the application and everything it processes.',
        ),
      ),
      LessonSection(
        heading: 'API Architecture',
        body:
            'APIs act as intermediaries between clients and backend '
            'services. A typical API architecture consists of a Client '
            'Application, an API Endpoint, Business Logic, and a '
            'Database. The client sends a request to the API. The API '
            'validates the request, processes it, communicates with the '
            'backend systems if necessary, and returns an appropriate '
            'response. This separation allows developers to update '
            'backend systems without changing the client application.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/api_architecture.jpg',
          caption:
              'A request flows from client to API endpoint to business '
              'logic to database and back — this separation is what lets '
              'backend systems change without breaking the client.',
        ),
      ),
      LessonSection(
        heading: 'REST and SOAP APIs',
        body:
            'Two common approaches for building web APIs are REST and '
            'SOAP.',
      ),
      LessonSection(
        heading: 'Representational State Transfer (REST)',
        body:
            'REST is an architectural style for designing web services. '
            'REST APIs typically use HTTP or HTTPS, exchange data using '
            'JSON, are lightweight, support stateless communication, and '
            'are widely used for web and mobile applications. Common '
            'HTTP methods include:',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Method', 'Purpose'],
          tableRows: [
            ['GET', 'Retrieve information'],
            ['POST', 'Create new data'],
            ['PUT', 'Update existing data'],
            ['PATCH', 'Partially update existing data'],
            ['DELETE', 'Remove data'],
          ],
        ),
      ),
      LessonSection(
        body:
            'REST APIs are commonly preferred because they are simple, '
            'efficient, and easy to integrate.',
      ),
      LessonSection(
        heading: 'Simple Object Access Protocol (SOAP)',
        body:
            'SOAP is a messaging protocol used for exchanging structured '
            'information between applications. SOAP typically uses XML '
            'messages, defines strict message formats, includes '
            'built-in standards for security and reliability, and is '
            'commonly found in enterprise and legacy systems. Compared '
            'to REST, SOAP messages are generally more structured and '
            'may require additional processing.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/rest_vs_soap.jpg',
          caption:
              'REST favors lightweight JSON over HTTP for web and mobile '
              'use; SOAP favors strict XML messaging built for '
              'enterprise and legacy integration.',
        ),
      ),
      LessonSection(
        heading: 'REST vs SOAP at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'REST', 'SOAP'],
          tableRows: [
            ['Data Format', 'Usually JSON', 'XML'],
            ['Communication', 'HTTP/HTTPS', 'Multiple protocols (commonly HTTP/HTTPS)'],
            ['Message Structure', 'Flexible', 'Strict'],
            ['Performance', 'Generally faster', 'Generally more processing overhead'],
            ['Typical Use', 'Web and mobile applications', 'Enterprise integrations'],
          ],
        ),
      ),
    ],
  ),

  // 14 ---------------------------------------------------------------------
  Lesson(
    title: 'API Authentication & Authorization',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'API Authentication',
        body:
            'Before allowing access to protected resources, APIs must '
            'verify the identity of the requesting user or application. '
            'API authentication ensures that requests originate from '
            'trusted sources. Common authentication mechanisms include:',
        bullets: [
          'Username and password',
          'API Keys',
          'OAuth 2.0',
          'OpenID Connect (OIDC)',
          'JSON Web Tokens (JWT)',
          'Client certificates',
        ],
      ),
      LessonSection(
        body:
            'Authentication should always occur before sensitive '
            'operations are performed.',
      ),
      LessonSection(
        heading: 'API Keys',
        body:
            'An API Key is a unique value assigned to an application or '
            'service. The client includes the key with each API request, '
            'allowing the server to identify the requesting application. '
            'API keys help identify applications but should not be '
            'considered sufficient protection for sensitive operations '
            'on their own, because they can be exposed or misused if not '
            'properly protected. API keys should:',
        bullets: [
          'Be stored securely',
          'Be rotated periodically',
          'Never be hardcoded into client-side applications',
          'Be transmitted only over HTTPS',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/api_keys.jpg',
          caption:
              'An API key identifies which application is calling, but '
              'on its own it\'s a weak credential — it needs secure '
              'storage, rotation, and HTTPS to be worth trusting.',
        ),
      ),
      LessonSection(
        heading: 'API Authorization',
        body:
            'Authentication identifies the requester, while authorization '
            'determines what the requester is allowed to do. Examples '
            'include reading customer records, creating new '
            'transactions, updating account information, and deleting '
            'application data. Applications should verify authorization '
            'for every request, even if the requester has already been '
            'authenticated.',
      ),
      LessonSection(
        body: 'Authorization decisions are commonly based on:',
        bullets: [
          'User roles',
          'Permissions',
          'Policies',
          'Attributes',
        ],
      ),
      LessonSection(
        body:
            'Proper authorization prevents users from accessing '
            'resources beyond their assigned privileges.',
      ),
      LessonSection(
        heading: 'OAuth 2.0',
        body:
            'OAuth 2.0 is an authorization framework that allows users '
            'to grant limited access to resources without sharing their '
            'passwords with third-party applications. For example, a '
            'photo editing application may request permission to access '
            'a user\'s cloud storage without requiring the user\'s '
            'storage account password. Instead of sharing credentials, '
            'OAuth 2.0 issues an access token with limited permissions.',
      ),
      LessonSection(
        heading: 'Benefits of OAuth 2.0',
        bullets: [
          'Passwords are not shared with third-party applications',
          'Permissions can be limited to specific resources',
          'Access can be revoked without changing user passwords',
          'Widely supported by cloud services',
        ],
      ),
      LessonSection(
        body:
            'OAuth 2.0 focuses on authorization, not user identity '
            'verification.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/oauth2_benefits.jpg',
          caption:
              'OAuth 2.0 issues a limited-scope access token instead of '
              'sharing the user\'s password — access can be revoked at '
              'any time without touching their credentials.',
        ),
      ),
      LessonSection(
        heading: 'OpenID Connect (OIDC)',
        body:
            'OpenID Connect (OIDC) is an identity layer built on top of '
            'OAuth 2.0. While OAuth 2.0 answers the question "What '
            'resources may this application access?", OIDC answers "Who '
            'is the authenticated user?" OIDC provides identity '
            'information through an ID Token, enabling applications to '
            'authenticate users using a trusted identity provider. OIDC '
            'is commonly used for Single Sign-On (SSO), cloud '
            'applications, mobile applications, and enterprise identity '
            'management.',
      ),
      LessonSection(
        heading: 'JSON Web Tokens (JWT)',
        body:
            'A JSON Web Token (JWT) is a compact, digitally signed token '
            'used to securely transmit information between parties. '
            'JWTs are widely used in API authentication because they '
            'allow servers to verify the integrity of token contents. A '
            'JWT typically contains a Header, Payload, and Signature. '
            'The digital signature helps detect whether the token has '
            'been modified.',
      ),
      LessonSection(
        body: 'Applications should:',
        bullets: [
          'Validate token signatures',
          'Check token expiration times',
          'Verify the intended audience',
          'Reject expired or invalid tokens',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/jwt_structure.jpg',
          caption:
              'A JWT\'s header, payload, and signature travel together — '
              'the signature is what lets a server detect if the token '
              'contents were tampered with.',
        ),
      ),
    ],
  ),

  // 15 ---------------------------------------------------------------------
  Lesson(
    title: 'API Gateway, Rate Limiting & Best Practices',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'API Gateway',
        body:
            'An API Gateway serves as a central entry point for API '
            'requests. Instead of clients communicating directly with '
            'multiple backend services, all requests pass through the '
            'gateway. An API gateway may perform authentication, '
            'authorization, request routing, logging, rate limiting, and '
            'request validation. Centralizing these functions simplifies '
            'API management and improves security.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/api_gateway.jpg',
          caption:
              'Every request passes through the gateway first, so '
              'authentication, rate limiting, and logging are enforced '
              'consistently in one place rather than duplicated across '
              'every backend service.',
        ),
      ),
      LessonSection(
        heading: 'Rate Limiting and Throttling',
        body:
            'Public APIs may receive thousands of requests every second. '
            'Without controls, attackers may overwhelm the API or '
            'attempt automated attacks such as credential stuffing or '
            'brute-force login attempts.',
      ),
      LessonSection(
        heading: 'Rate Limiting',
        body:
            'Rate limiting restricts the number of requests a client can '
            'make during a specified period — for example, a maximum of '
            '100 requests per minute per client. Rate limiting helps '
            'protect APIs from abuse while ensuring fair resource usage.',
      ),
      LessonSection(
        heading: 'Throttling',
        body:
            'Throttling temporarily slows or limits requests when '
            'predefined thresholds are exceeded instead of completely '
            'rejecting all traffic. Throttling helps maintain service '
            'availability during periods of unusually high demand.',
      ),
      LessonSection(
        heading: 'Benefits of Rate Limiting and Throttling',
        bullets: [
          'Reduces Denial-of-Service (DoS) impact',
          'Limits automated attacks',
          'Protects backend services',
          'Improves application stability',
        ],
      ),
      LessonSection(
        heading: 'API Input Validation',
        body:
            'API endpoints should never assume incoming data is '
            'trustworthy. Applications should validate data types, '
            'required fields, length, numeric ranges, allowed values, '
            'and file types. Proper validation helps prevent injection '
            'attacks, buffer-related errors, unexpected application '
            'behavior, and data corruption.',
      ),
      LessonSection(
        heading: 'API Error Handling',
        body:
            'API responses should provide enough information for '
            'legitimate clients to understand the outcome of a request '
            'while avoiding disclosure of sensitive implementation '
            'details. Good API error handling should return standardized '
            'error responses, avoid revealing database names or internal '
            'paths, record detailed errors in secure logs, and use '
            'appropriate HTTP status codes.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/api_error_handling.jpg',
          caption:
              'Good API error handling tells a legitimate client enough '
              'to understand what went wrong, without leaking internal '
              'paths, database names, or stack traces an attacker could '
              'use.',
        ),
      ),
      LessonSection(
        body: 'Examples of commonly used status codes include:',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Status Code', 'Meaning'],
          tableRows: [
            ['200', 'Request completed successfully'],
            ['201', 'Resource created successfully'],
            ['400', 'Invalid client request'],
            ['401', 'Authentication required or failed'],
            ['403', 'Request understood but access denied'],
            ['404', 'Requested resource not found'],
            ['500', 'Internal server error'],
          ],
        ),
      ),
      LessonSection(
        heading: 'API Security Best Practices',
        bullets: [
          'Require HTTPS for all API communication',
          'Implement strong authentication and authorization',
          'Use OAuth 2.0 or OpenID Connect where appropriate',
          'Validate all input received by APIs',
          'Protect API keys and rotate them regularly',
          'Verify JSON Web Token (JWT) signatures and expiration times',
          'Apply rate limiting and throttling to reduce abuse',
          'Use an API gateway to centralize security controls',
          'Log API requests and monitor for suspicious activity',
          'Perform regular API security testing and vulnerability assessments',
          'Keep API frameworks and dependencies updated with security patches',
        ],
      ),
    ],
  ),

  // 16 ---------------------------------------------------------------------
  Lesson(
    title: 'Application Security Testing: SAST, DAST, IAST & SCA',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Why Testing Matters',
        body:
            'Building secure applications requires more than following '
            'secure coding practices. Even well-designed software may '
            'contain vulnerabilities introduced during development, '
            'configuration, or integration with third-party components. '
            'Application Security Testing (AST) is the process of '
            'identifying security weaknesses in an application before '
            'they can be exploited by attackers. Security testing should '
            'be integrated throughout the Secure Software Development '
            'Life Cycle (SSDLC) rather than being performed only before '
            'deployment.',
      ),
      LessonSection(
        body: 'The objectives of application security testing include:',
        bullets: [
          'Identifying vulnerabilities early',
          'Reducing remediation costs',
          'Improving software quality',
          'Verifying compliance with security requirements',
          'Reducing the likelihood of security incidents',
        ],
      ),
      LessonSection(
        body:
            'Different testing techniques examine applications from '
            'different perspectives. Organizations often use multiple '
            'testing methods together to obtain a comprehensive '
            'assessment.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/ast_overview.jpg',
          caption:
              'SAST, DAST, IAST, and SCA each examine an application from '
              'a different angle — combining them gives far broader '
              'coverage than any single technique alone.',
        ),
      ),
      LessonSection(
        heading: 'Static Application Security Testing (SAST)',
        body:
            'Static Application Security Testing (SAST) analyzes an '
            'application\'s source code, bytecode, or compiled code '
            'without executing the application. Since the application '
            'does not need to be running, SAST is often called white-box '
            'testing, as it examines the internal structure of the '
            'software. SAST tools inspect the code for patterns that may '
            'indicate security weaknesses.',
      ),
      LessonSection(
        body: 'Common issues detected include:',
        bullets: [
          'Hardcoded credentials',
          'Weak cryptographic implementations',
          'Input validation problems',
          'Buffer-related programming errors',
          'Insecure error handling',
          'Improper authentication logic',
        ],
      ),
      LessonSection(
        body:
            'Advantages of SAST include identifying vulnerabilities '
            'early in development, supporting secure coding practices, '
            'integrating into development environments and CI/CD '
            'pipelines, and allowing developers to fix issues before '
            'deployment. Limitations include producing false positives, '
            'being unable to identify vulnerabilities that occur only '
            'during application execution, and effectiveness depending '
            'on code quality and tool configuration.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/sast_limitations.jpg',
          caption:
              'SAST reads the code itself without running it — powerful '
              'for catching issues early, but blind to anything that '
              'only shows up while the application is actually '
              'executing.',
        ),
      ),
      LessonSection(
        heading: 'Dynamic Application Security Testing (DAST)',
        body:
            'Dynamic Application Security Testing (DAST) evaluates an '
            'application while it is running. Unlike SAST, DAST does not '
            'require access to the application\'s source code. Instead, '
            'it interacts with the application from an external '
            'perspective, similar to how an attacker might. DAST tools '
            'send requests to the application and analyze responses to '
            'identify security vulnerabilities.',
      ),
      LessonSection(
        body: 'Common vulnerabilities detected include:',
        bullets: [
          'SQL Injection',
          'Cross-Site Scripting (XSS)',
          'Authentication weaknesses',
          'Session management issues',
          'Security misconfigurations',
          'Information disclosure',
        ],
      ),
      LessonSection(
        body:
            'Advantages of DAST include simulating real-world attacks, '
            'requiring no source code access, detecting runtime '
            'vulnerabilities, and being suitable for production-like '
            'environments. Limitations include being unable to identify '
            'vulnerabilities in unused code, potentially not locating the '
            'exact source code responsible for a vulnerability, and '
            'requiring a functioning application.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/dast_limitations.jpg',
          caption:
              'DAST attacks the running application from the outside, '
              'the same way a real attacker would — but it can only find '
              'what it can actually reach and trigger.',
        ),
      ),
      LessonSection(
        heading: 'Interactive Application Security Testing (IAST)',
        body:
            'Interactive Application Security Testing (IAST) combines '
            'characteristics of both SAST and DAST. IAST tools monitor '
            'an application while it is running by using sensors or '
            'agents integrated into the application environment. As the '
            'application processes requests, the tool analyzes both '
            'application behavior and internal execution. This allows '
            'IAST to identify vulnerabilities with greater context than '
            'either SAST or DAST alone.',
      ),
      LessonSection(
        body:
            'Advantages of IAST include higher accuracy, reduced false '
            'positives, better vulnerability context, faster remediation, '
            'and continuous security assessment during testing. '
            'Limitations include requiring instrumentation of the '
            'application, typically being used only in testing or '
            'staging environments, and potentially requiring additional '
            'configuration.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/iast_limitations.jpg',
          caption:
              'IAST watches the application from the inside while it '
              'runs, combining SAST\'s code awareness with DAST\'s '
              'runtime visibility — at the cost of needing '
              'instrumentation built into the test environment.',
        ),
      ),
      LessonSection(
        heading: 'Software Composition Analysis (SCA)',
        body:
            'Modern applications frequently rely on open-source '
            'libraries, frameworks, and third-party components. Software '
            'Composition Analysis (SCA) identifies software dependencies '
            'and evaluates them for known security vulnerabilities, '
            'outdated versions, and licensing considerations. An SCA '
            'tool builds an inventory of components used by an '
            'application and compares them against vulnerability '
            'databases.',
      ),
      LessonSection(
        body: 'Examples of issues identified include:',
        bullets: [
          'Vulnerable libraries',
          'Unsupported software versions',
          'Outdated dependencies',
          'License compliance issues',
        ],
      ),
      LessonSection(
        body:
            'Maintaining current dependencies reduces the likelihood of '
            'attackers exploiting publicly known vulnerabilities.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/sca_overview.jpg',
          caption:
              'SCA inventories every third-party library an application '
              'depends on and checks each one against known-vulnerability '
              'databases — code you didn\'t write is still code you\'re '
              'responsible for.',
        ),
      ),
    ],
  ),

  // 17 ---------------------------------------------------------------------
  Lesson(
    title: 'Fuzzing, Penetration Testing & Vulnerability Management',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Fuzz Testing (Fuzzing)',
        body:
            'Fuzz Testing, commonly called Fuzzing, is a testing '
            'technique in which large amounts of unexpected, invalid, '
            'random, or malformed input are supplied to an application. '
            'The objective is to observe how the application behaves '
            'when it receives data outside its normal operating '
            'conditions. Well-designed applications should reject '
            'invalid input safely, continue operating normally, record '
            'appropriate log entries, and avoid exposing sensitive '
            'information.',
      ),
      LessonSection(
        body: 'Fuzz testing may identify:',
        bullets: [
          'Input validation weaknesses',
          'Application crashes',
          'Memory-related errors',
          'Unexpected exceptions',
          'Denial-of-Service conditions',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/fuzz_testing.jpg',
          caption:
              'Fuzzing floods the application with malformed and '
              'unexpected input to see what breaks — crashes and memory '
              'errors under fuzzing often point straight to exploitable '
              'vulnerabilities.',
        ),
      ),
      LessonSection(
        heading: 'Penetration Testing for Applications',
        body:
            'A penetration test evaluates an application\'s security by '
            'simulating techniques that attackers might use to '
            'compromise it. Unlike automated scanners, penetration '
            'testing combines automated tools with manual analysis '
            'performed by experienced security professionals. The '
            'objective is to identify vulnerabilities that could '
            'realistically be exploited.',
      ),
      LessonSection(
        body: 'Typical activities include:',
        bullets: [
          'Authentication testing',
          'Authorization testing',
          'Session management testing',
          'Input validation testing',
          'Business logic testing',
          'API security assessment',
          'Privilege escalation attempts',
        ],
      ),
      LessonSection(
        body:
            'Penetration testing provides valuable insight into an '
            'application\'s real-world security posture.',
      ),
      LessonSection(
        heading: 'Benefits of Penetration Testing',
        bullets: [
          'Identifies exploitable vulnerabilities',
          'Validates existing security controls',
          'Supports regulatory compliance',
          'Improves incident preparedness',
        ],
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/pentest_benefits.jpg',
          caption:
              'A penetration test combines automated tooling with manual '
              'expertise to prove which vulnerabilities are actually '
              'exploitable, not just theoretically present.',
        ),
      ),
      LessonSection(
        heading: 'Secure Code Review',
        body:
            'A code review is the process of examining application '
            'source code to identify programming errors, maintain coding '
            'standards, and improve software quality. A secure code '
            'review specifically focuses on identifying security '
            'vulnerabilities before deployment. Code reviews may be '
            'manual, tool-assisted, peer reviewed, or automated within '
            'CI/CD pipelines.',
      ),
      LessonSection(
        body: 'Reviewers typically examine:',
        bullets: [
          'Authentication logic',
          'Authorization checks',
          'Input validation',
          'Error handling',
          'Cryptographic implementations',
          'Logging practices',
        ],
      ),
      LessonSection(
        body:
            'Secure code reviews help identify vulnerabilities that '
            'automated tools may miss.',
      ),
      LessonSection(
        heading: 'Vulnerability Management for Applications',
        body:
            'Application security testing is not a one-time activity. '
            'Organizations should establish an ongoing Application '
            'Vulnerability Management process that includes identifying '
            'vulnerabilities, assessing risk, prioritizing remediation, '
            'applying fixes, verifying remediation, and continuous '
            'monitoring.',
      ),
      LessonSection(
        body: 'Prioritization should consider:',
        bullets: [
          'Severity',
          'Exploitability',
          'Business impact',
          'Exposure',
          'Availability of patches',
        ],
      ),
      LessonSection(
        body:
            'A structured vulnerability management process ensures that '
            'the most significant risks are addressed promptly.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/vuln_mgmt_appsec.jpg',
          caption:
              'Application vulnerability management is a continuous '
              'cycle, not a one-time scan — identify, assess, prioritize, '
              'fix, verify, and monitor, on repeat.',
        ),
      ),
      LessonSection(
        heading: 'Security Testing in CI/CD Pipelines',
        body:
            'Modern software is often developed using Continuous '
            'Integration and Continuous Delivery/Deployment (CI/CD) '
            'pipelines. Security testing can be integrated into these '
            'automated pipelines so that applications are evaluated each '
            'time new code is introduced.',
      ),
      LessonSection(
        body: 'Typical security activities include:',
        bullets: [
          'Static code analysis',
          'Dependency scanning',
          'Secret detection',
          'Automated security testing',
          'Container image scanning',
          'Policy compliance checks',
        ],
      ),
      LessonSection(
        body:
            'Integrating security into CI/CD pipelines supports the '
            'DevSecOps approach by identifying issues earlier in the '
            'development process and reducing the time required to '
            'remediate vulnerabilities.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/cicd_security_testing.jpg',
          caption:
              'Folding security checks directly into the CI/CD pipeline '
              'means every code change is evaluated automatically — '
              'DevSecOps in practice, not just in name.',
        ),
      ),
      LessonSection(
        heading: 'Application Security Testing Best Practices',
        bullets: [
          'Integrate security testing throughout the SSDLC',
          'Combine multiple testing techniques such as SAST, DAST, IAST, and SCA',
          'Perform regular penetration testing',
          'Conduct secure code reviews for critical applications',
          'Scan third-party components for known vulnerabilities',
          'Include security testing in CI/CD pipelines',
          'Prioritize vulnerabilities based on risk and business impact',
          'Verify remediation through retesting',
          'Continuously monitor applications after deployment',
          'Provide secure coding training to developers and testers',
        ],
      ),
      LessonSection(
        body:
            'Using multiple complementary testing methods provides '
            'broader coverage and helps identify vulnerabilities that '
            'may not be detected by a single approach.',
      ),
    ],
  ),

  // 18 ---------------------------------------------------------------------
  Lesson(
    title: 'Application Hardening, Deployment & Configuration',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Application Hardening',
        body:
            'Developing a secure application is only the first step '
            'toward protecting software from cyber threats. Applications '
            'must also be hardened before deployment to reduce their '
            'attack surface and eliminate unnecessary security risks. '
            'Application hardening is the process of removing '
            'unnecessary features, disabling insecure functionality, '
            'applying secure configurations, and implementing additional '
            'security controls to make an application more resistant to '
            'attacks. Hardening should be performed before the '
            'application is released into production and should continue '
            'throughout the application\'s lifecycle.',
      ),
      LessonSection(
        heading: 'Objectives of Application Hardening',
        bullets: [
          'Reduce the attack surface',
          'Eliminate unnecessary functionality',
          'Strengthen application security configurations',
          'Prevent unauthorized access',
          'Improve application resilience',
          'Support compliance requirements',
        ],
      ),
      LessonSection(
        heading: 'Common Hardening Activities',
        bullets: [
          'Remove unnecessary services and modules',
          'Disable debugging features',
          'Remove sample applications and test pages',
          'Enforce HTTPS',
          'Disable insecure protocols',
          'Apply secure file permissions',
          'Remove default credentials',
          'Configure secure HTTP headers',
          'Enable application logging',
        ],
      ),
      LessonSection(
        body:
            'Hardening reduces opportunities for attackers to exploit '
            'known weaknesses.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/hardening_activities.jpg',
          caption:
              'Hardening strips away everything an attacker could '
              'otherwise use — debug endpoints, sample apps, default '
              'credentials — before the application ever reaches '
              'production.',
        ),
      ),
      LessonSection(
        heading: 'Secure Application Deployment',
        body:
            'Even a securely developed application can become vulnerable '
            'if it is deployed incorrectly. Secure deployment ensures '
            'that applications are configured according to security '
            'best practices before becoming available to users. '
            'Deployment activities should follow standardized procedures '
            'to maintain consistency and reduce configuration errors.',
      ),
      LessonSection(
        heading: 'Secure Deployment Practices',
        bullets: [
          'Verify application integrity before deployment',
          'Deploy only approved software versions',
          'Enable HTTPS for all communication',
          'Configure secure authentication mechanisms',
          'Apply least privilege permissions',
          'Disable unnecessary network ports',
          'Encrypt sensitive configuration data',
          'Validate environment-specific settings',
          'Verify security configurations after deployment',
        ],
      ),
      LessonSection(
        body:
            'Organizations often automate these activities using '
            'deployment pipelines to ensure consistency across '
            'environments.',
      ),
      LessonSection(
        heading: 'Secure Configuration Management',
        body:
            'Applications depend on numerous configuration settings, '
            'including database connections, authentication parameters, '
            'API endpoints, encryption settings, and logging options. '
            'Improper configuration may introduce security '
            'vulnerabilities even when the application\'s source code is '
            'secure. Configuration management involves controlling these '
            'settings throughout the application lifecycle.',
      ),
      LessonSection(
        heading: 'Secure Configuration Practices',
        bullets: [
          'Store sensitive configuration information securely',
          'Protect encryption keys',
          'Avoid hardcoded credentials',
          'Use environment-specific configuration files',
          'Restrict administrative access',
          'Regularly review configuration changes',
        ],
      ),
      LessonSection(
        body:
            'Configuration changes should be documented, reviewed, '
            'tested, and approved before implementation.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/secure_config_practices.jpg',
          caption:
              'A source-code-secure application can still be broken by a '
              'careless configuration change — which is why every change '
              'gets documented, reviewed, tested, and approved.',
        ),
      ),
    ],
  ),

  // 19 ---------------------------------------------------------------------
  Lesson(
    title: 'Logging, Monitoring, RASP, WAF & Incident Response',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 18,
    sections: [
      LessonSection(
        heading: 'Application Logging',
        body:
            'Applications continuously generate information about user '
            'activities, system events, errors, and security-related '
            'operations. Application logging records these events to '
            'support troubleshooting, auditing, incident response, and '
            'compliance. Effective logging provides visibility into '
            'application behavior and assists security teams in '
            'identifying suspicious activities.',
      ),
      LessonSection(
        heading: 'Common Events to Log',
        bullets: [
          'Successful logins',
          'Failed login attempts',
          'Password changes',
          'Account lockouts',
          'Privilege changes',
          'Administrative actions',
          'API requests',
          'Configuration modifications',
          'Security exceptions',
        ],
      ),
      LessonSection(
        body:
            'Logs should contain sufficient detail for investigation '
            'without exposing sensitive information such as passwords or '
            'cryptographic keys.',
      ),
      LessonSection(
        heading: 'Application Monitoring',
        body:
            'Logging records events, while monitoring continuously '
            'analyzes those events to identify abnormal or malicious '
            'activity. Application monitoring enables security teams to '
            'detect issues in near real time and respond before they '
            'become major incidents.',
      ),
      LessonSection(
        body: 'Monitoring may identify:',
        bullets: [
          'Repeated authentication failures',
          'Sudden increases in API requests',
          'Unauthorized privilege changes',
          'Unexpected application crashes',
          'Resource exhaustion',
          'Suspicious user behavior',
        ],
      ),
      LessonSection(
        body:
            'Organizations often integrate application logs into a '
            'Security Information and Event Management (SIEM) platform '
            'for centralized analysis and alerting.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/app_monitoring.jpg',
          caption:
              'Monitoring turns raw application logs into near-real-time '
              'detection — feeding a SIEM lets security teams catch '
              'abnormal patterns before they escalate into incidents.',
        ),
      ),
      LessonSection(
        heading: 'Runtime Application Self-Protection (RASP)',
        body:
            'Runtime Application Self-Protection (RASP) is a security '
            'technology that operates within an application while it is '
            'running. Unlike traditional security tools that inspect '
            'traffic from outside the application, RASP observes '
            'application execution from within and can detect and '
            'respond to attacks as they occur.',
      ),
      LessonSection(
        body: 'RASP monitors:',
        bullets: [
          'User input',
          'Application execution',
          'Database interactions',
          'API requests',
          'File operations',
        ],
      ),
      LessonSection(
        body: 'When suspicious behavior is detected, RASP may:',
        bullets: [
          'Block malicious requests',
          'Terminate user sessions',
          'Generate security alerts',
          'Record forensic information',
        ],
      ),
      LessonSection(
        body:
            'Because RASP has visibility into application behavior, it '
            'can often distinguish legitimate activity from malicious '
            'requests more accurately than external security devices.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/rasp_protection.jpg',
          caption:
              'RASP sits inside the running application itself, giving '
              'it context an external device never has — it can '
              'distinguish a legitimate request from a malicious one '
              'with far more precision.',
        ),
      ),
      LessonSection(
        heading: 'Web Application Firewall (WAF)',
        body:
            'A Web Application Firewall (WAF) protects web applications '
            'by monitoring and filtering HTTP and HTTPS traffic between '
            'users and the application. Unlike traditional network '
            'firewalls, which focus on network traffic, a WAF '
            'understands application-layer communication and helps '
            'protect against common web attacks.',
      ),
      LessonSection(
        body: 'A WAF may detect or block:',
        bullets: [
          'SQL Injection attempts',
          'Cross-Site Scripting (XSS)',
          'Command Injection',
          'Directory Traversal',
          'Malformed HTTP requests',
          'Automated attack traffic',
        ],
      ),
      LessonSection(
        body:
            'A WAF complements secure coding practices but should not be '
            'considered a replacement for fixing application '
            'vulnerabilities.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/waf_protection.jpg',
          caption:
              'A WAF filters application-layer traffic in front of the '
              'app, catching known attack patterns like SQLi and XSS — '
              'but it\'s a shield, not a substitute for fixing the '
              'underlying vulnerability.',
        ),
      ),
      LessonSection(
        heading: 'Patch and Update Management',
        body:
            'New vulnerabilities are regularly discovered in '
            'applications, frameworks, libraries, and operating systems. '
            'Organizations should implement a structured patch '
            'management process to ensure that security updates are '
            'applied in a timely manner. A typical patch management '
            'process includes:',
        bullets: [
          'Identify available updates',
          'Evaluate security impact',
          'Test updates',
          'Approve deployment',
          'Deploy updates',
          'Verify successful installation',
          'Monitor for issues',
        ],
      ),
      LessonSection(
        body:
            'Delaying critical security updates increases the risk of '
            'exploitation.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/patch_update_mgmt.jpg',
          caption:
              'A structured patch process — identify, evaluate, test, '
              'approve, deploy, verify, monitor — keeps updates timely '
              'without introducing new instability.',
        ),
      ),
      LessonSection(
        heading: 'Application Incident Response',
        body:
            'Despite preventive controls, security incidents may still '
            'occur. Organizations should establish procedures for '
            'responding quickly and effectively. An Application Incident '
            'Response process helps minimize damage, restore services, '
            'and identify opportunities for improvement. Typical phases '
            'are covered below.',
      ),
      LessonSection(
        heading: 'Preparation',
        body:
            'Develop response plans, assign responsibilities, and '
            'establish communication procedures.',
      ),
      LessonSection(
        heading: 'Detection',
        body:
            'Identify suspicious activity through monitoring, alerts, '
            'user reports, or security testing.',
      ),
      LessonSection(
        heading: 'Analysis',
        body: 'Determine the cause of the incident, the affected systems, the scope of impact, and the severity.',
      ),
      LessonSection(
        heading: 'Containment',
        body:
            'Limit the spread of the incident by isolating affected '
            'applications, disabling compromised accounts, or blocking '
            'malicious traffic.',
      ),
      LessonSection(
        heading: 'Eradication',
        body:
            'Remove malicious code, correct vulnerabilities, and '
            'eliminate the root cause.',
      ),
      LessonSection(
        heading: 'Recovery',
        body:
            'Restore applications to normal operation after verifying '
            'that they are secure and functioning correctly.',
      ),
      LessonSection(
        heading: 'Lessons Learned',
        body:
            'Conduct a post-incident review to identify improvements in '
            'security controls, monitoring, and response procedures.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/appsec/incident_response_lessons.jpg',
          caption:
              'Application incident response moves through preparation, '
              'detection, analysis, containment, eradication, recovery, '
              'and lessons learned — the final phase feeding improvements '
              'back into every earlier one.',
        ),
      ),
      LessonSection(
        heading: 'Application Security Best Practices',
        bullets: [
          'Integrate security into every phase of the Secure Software Development Life Cycle (SSDLC)',
          'Follow Secure by Design and Secure by Default principles',
          'Implement strong authentication and Multi-Factor Authentication (MFA)',
          'Enforce Role-Based Access Control (RBAC) or other appropriate authorization models',
          'Validate all user input and encode output appropriately',
          'Protect sensitive data using strong, industry-accepted encryption',
          'Use parameterized queries for database access',
          'Keep operating systems, frameworks, and third-party libraries updated',
          'Perform regular SAST, DAST, IAST, SCA, and penetration testing',
          'Monitor applications continuously using centralized logging and SIEM platforms',
          'Secure APIs using HTTPS, OAuth 2.0, or OpenID Connect (OIDC) where appropriate',
          'Apply least privilege to users, services, and application components',
          'Regularly review application configurations and access permissions',
          'Establish a documented incident response process',
          'Conduct periodic secure coding training for development teams',
        ],
      ),
      LessonSection(
        body:
            'Following these practices significantly reduces application '
            'security risks and improves the overall security posture of '
            'an organization.',
      ),
    ],
  ),
  // 20 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 20,
    quiz: [
      QuizQuestion(
        question: 'How does Application Security (AppSec) primarily differ from traditional network security?',
        options: [
          'AppSec only applies to mobile applications',
          'AppSec protects the software itself and the data it processes, rather than focusing on infrastructure',
          'AppSec is only relevant after an application is deployed',
          'AppSec and network security are identical disciplines',
        ],
        correctIndex: 1,
        explanation: 'Network security protects infrastructure; application security protects the software and the data it processes throughout its lifecycle.',
      ),
      QuizQuestion(
        question: 'Which of the following is an example of Broken Access Control rather than Broken Authentication?',
        options: [
          'A user reusing the same weak password across sites',
          'A regular user successfully viewing another user\'s private records',
          'A missing MFA requirement on an admin account',
          'An attacker performing credential stuffing',
        ],
        correctIndex: 1,
        explanation: 'Broken Access Control lets an authenticated user reach data or functions they should not be authorized for, such as another user\'s records.',
      ),
      QuizQuestion(
        question: 'Why is it more effective and less expensive to integrate security into the SSDLC than to fix issues after deployment?',
        options: [
          'It removes the need for any security testing entirely',
          'Vulnerabilities caught early in Design or Development are far cheaper to fix than those discovered after release',
          'SSDLC eliminates the need for a Testing phase',
          'It guarantees an application will have zero vulnerabilities',
        ],
        correctIndex: 1,
        explanation: 'Catching a flaw during design or development avoids the cost of reworking a deployed, live application.',
      ),
      QuizQuestion(
        question: 'What is the key distinction between Secure by Design and Secure by Default?',
        options: [
          'They are the same concept described differently',
          'Secure by Design shapes the architecture from the start; Secure by Default ensures the shipped application is secure without extra configuration',
          'Secure by Default only applies to open-source software',
          'Secure by Design happens only after deployment',
        ],
        correctIndex: 1,
        explanation: 'Secure by Design is about architectural decisions made early; Secure by Default is about the out-of-the-box configuration being safe.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of output encoding, as distinct from input validation?',
        options: [
          'It replaces the need for input validation entirely',
          'It converts special characters into a safe format before display, so browsers treat them as text rather than executable code',
          'It encrypts all data before storage',
          'It only applies to numeric fields',
        ],
        correctIndex: 1,
        explanation: 'Output encoding is a distinct, complementary control to input validation, and is particularly effective against XSS.',
      ),
      QuizQuestion(
        question: 'Why should an application avoid displaying detailed technical error messages to end users?',
        options: [
          'Detailed errors slow down the application',
          'Detailed errors can expose database names, file paths, server information, or source code details useful to attackers',
          'Users always prefer generic messages',
          'It is a legal requirement in every jurisdiction',
        ],
        correctIndex: 1,
        explanation: 'Generic user-facing messages combined with detailed secure logging limits what an attacker can learn while still helping administrators.',
      ),
      QuizQuestion(
        question: 'What question does Authorization answer, as opposed to Authentication?',
        options: [
          '"Who are you?"',
          '"What are you allowed to do?"',
          '"When did you last log in?"',
          '"Where are you located?"',
        ],
        correctIndex: 1,
        explanation: 'Authentication answers "Who are you?"; Authorization answers "What are you allowed to do?"',
      ),
      QuizQuestion(
        question: 'A hardware security key used to log in belongs to which authentication factor category?',
        options: ['Something You Know', 'Something You Have', 'Something You Are', 'Something You Do'],
        correctIndex: 1,
        explanation: 'A hardware security key is a physical object the user possesses — "Something You Have."',
      ),
      QuizQuestion(
        question: 'Why should an application regenerate the Session ID immediately after successful authentication?',
        options: [
          'To make the application run faster',
          'To prevent session fixation attacks, where an attacker tries to force a victim to use a known Session ID',
          'It is only needed for administrator accounts',
          'To automatically log the user out',
        ],
        correctIndex: 1,
        explanation: 'Regenerating the Session ID after login invalidates any pre-set ID an attacker may have tried to fixate on the victim.',
      ),
      QuizQuestion(
        question: 'Which cookie attribute specifically prevents client-side JavaScript from reading the cookie, reducing theft during an XSS attack?',
        options: ['Secure', 'HttpOnly', 'SameSite=None', 'Path'],
        correctIndex: 1,
        explanation: 'HttpOnly blocks script access to the cookie, which is the main defense against cookie theft via XSS.',
      ),
      QuizQuestion(
        question: 'Why is salting a password before hashing important, even though hashing alone is one-way?',
        options: [
          'Salting makes the password easier to remember',
          'A unique salt per password defeats precomputed hash-table (rainbow table) attacks and ensures identical passwords produce different stored hashes',
          'Salting replaces the need for hashing entirely',
          'Salting is only relevant for SSO systems',
        ],
        correctIndex: 1,
        explanation: 'Salting protects against rainbow tables and prevents identical passwords from producing identical hashes.',
      ),
      QuizQuestion(
        question: 'What does Multi-Factor Authentication protect against that a strong password alone cannot?',
        options: [
          'Nothing additional — MFA and strong passwords provide identical protection',
          'An attacker who has obtained the password still cannot complete login without the second independent factor',
          'MFA prevents all forms of phishing automatically',
          'MFA eliminates the need for encryption',
        ],
        correctIndex: 1,
        explanation: 'MFA adds an independent factor, so a compromised password alone is insufficient for an attacker to gain access.',
      ),
      QuizQuestion(
        question: 'What is the core benefit Single Sign-On (SSO) provides to an organization managing many applications?',
        options: [
          'It removes the need for any authentication whatsoever',
          'Users authenticate once and gain access to multiple trusted applications, reducing password fatigue and administrative overhead',
          'It automatically encrypts all application traffic',
          'It is required by every compliance framework',
        ],
        correctIndex: 1,
        explanation: 'SSO centralizes authentication, improving usability and reducing password-related risk and support overhead.',
      ),
      QuizQuestion(
        question: 'How does Identity Federation differ from a standard SSO deployment within a single organization?',
        options: [
          'Federation only works for a single application',
          'Federation lets trusted external organizations or partner applications share authentication information via a common identity provider',
          'Federation eliminates the need for an identity provider',
          'Federation is exclusively used for internal employee logins',
        ],
        correctIndex: 1,
        explanation: 'Federation extends trusted authentication across organizational boundaries, such as B2B integrations, without duplicating user accounts.',
      ),
      QuizQuestion(
        question: 'What makes SQL Injection possible in a vulnerable application?',
        options: [
          'The database server is physically unsecured',
          'Untrusted input is incorporated into SQL queries without proper validation or parameterization',
          'The application uses HTTPS instead of HTTP',
          'The application has too many database tables',
        ],
        correctIndex: 1,
        explanation: 'SQLi arises when untrusted input reaches a query without parameterization or validation, letting attackers alter query logic.',
      ),
      QuizQuestion(
        question: 'What is the single most effective technical control against SQL Injection?',
        options: [
          'Using longer database passwords',
          'Parameterized queries (prepared statements)',
          'Disabling the database entirely',
          'Increasing server RAM',
        ],
        correctIndex: 1,
        explanation: 'Parameterized queries separate code from data, preventing user input from altering query structure.',
      ),
      QuizQuestion(
        question: 'What distinguishes Stored XSS from Reflected XSS?',
        options: [
          'Stored XSS requires no victim interaction at all, ever',
          'Stored XSS is permanently saved by the application and served to any visiting user, while Reflected XSS is returned immediately in a response to a crafted request',
          'Reflected XSS only affects mobile applications',
          'Stored XSS cannot steal session cookies',
        ],
        correctIndex: 1,
        explanation: 'Stored XSS persists in the application (e.g. a comment field); Reflected XSS depends on a victim following a specially crafted link.',
      ),
      QuizQuestion(
        question: 'Why does DOM-Based XSS occur entirely within the browser, unlike Stored or Reflected XSS?',
        options: [
          'It requires database access',
          'The vulnerability lies in client-side JavaScript that unsafely modifies the DOM using untrusted data, with no server round-trip needed for the attack itself',
          'It only affects legacy browsers',
          'It always requires a compromised server',
        ],
        correctIndex: 1,
        explanation: 'DOM-based XSS is driven by unsafe client-side script execution, not server-side processing.',
      ),
      QuizQuestion(
        question: 'Why does CSRF succeed against an authenticated user even though the attacker never sees their credentials?',
        options: [
          'CSRF requires the attacker to steal the session cookie first',
          'The application trusts the authenticated session and does not verify that the request genuinely originated from the legitimate interface',
          'CSRF only works on unauthenticated pages',
          'CSRF always requires malware on the victim\'s device',
        ],
        correctIndex: 1,
        explanation: 'CSRF exploits the browser automatically attaching session credentials to a forged request, which the app treats as legitimate.',
      ),
      QuizQuestion(
        question: 'Which control most directly defends against CSRF?',
        options: [
          'Output encoding',
          'CSRF tokens tied to the user\'s session and validated on each state-changing request',
          'Rate limiting',
          'Parameterized queries',
        ],
        correctIndex: 1,
        explanation: 'A unique, unpredictable CSRF token that must accompany legitimate requests prevents forged cross-site requests from succeeding.',
      ),
      QuizQuestion(
        question: 'What does Command Injection allow an attacker to do that most other web vulnerabilities do not directly enable?',
        options: [
          'Only view public web pages',
          'Execute arbitrary operating system commands on the underlying server',
          'Change the browser\'s display language',
          'Only slow down page load times',
        ],
        correctIndex: 1,
        explanation: 'Command Injection lets an attacker run OS-level commands, potentially compromising the entire server.',
      ),
      QuizQuestion(
        question: 'Directory (Path) Traversal attacks typically try to access which kind of resource?',
        options: [
          'Only publicly listed web pages',
          'Files and directories outside the intended application directory, such as configuration or password files',
          'Only image files uploaded by users',
          'Only expired session tokens',
        ],
        correctIndex: 1,
        explanation: 'Directory Traversal escapes the intended directory to reach sensitive files elsewhere on the server.',
      ),
      QuizQuestion(
        question: 'What is the key difference between Local File Inclusion (LFI) and Remote File Inclusion (RFI)?',
        options: [
          'They are identical vulnerabilities with different names',
          'LFI loads files already present on the local server, while RFI loads files from an external location due to insecure configuration',
          'RFI can only be exploited over a local network',
          'LFI requires no user input at all',
        ],
        correctIndex: 1,
        explanation: 'LFI stays within the local server\'s files; RFI reaches out to an external, attacker-controlled location.',
      ),
      QuizQuestion(
        question: 'What is the defining characteristic of a Server-Side Request Forgery (SSRF) attack?',
        options: [
          'The attacker directly accesses the victim\'s browser',
          'The application is tricked into making unintended requests to internal or external systems on the attacker\'s behalf',
          'SSRF only targets client-side JavaScript',
          'SSRF requires physical access to the server',
        ],
        correctIndex: 1,
        explanation: 'SSRF abuses the server\'s own request-making capability to reach systems the attacker could not access directly.',
      ),
      QuizQuestion(
        question: 'XML External Entity (XXE) attacks exploit what specific weakness?',
        options: [
          'Weak password hashing',
          'Improperly configured XML parsers that process external entities, allowing file reads or internal system access',
          'Missing HTTPS certificates',
          'Overly long session timeouts',
        ],
        correctIndex: 1,
        explanation: 'XXE relies on an XML parser resolving external entities that should be disabled or restricted.',
      ),
      QuizQuestion(
        question: 'How does Clickjacking deceive a victim?',
        options: [
          'By directly stealing the victim\'s password through a fake login form',
          'By overlaying a transparent or disguised page over a legitimate one so the user unknowingly clicks something other than what they see',
          'By exploiting weak database encryption',
          'By flooding the network with traffic',
        ],
        correctIndex: 1,
        explanation: 'Clickjacking visually tricks the user into interacting with a hidden element rather than the one they believe they are clicking.',
      ),
      QuizQuestion(
        question: 'Why are APIs considered an attractive target for attackers?',
        options: [
          'APIs are rarely used in modern applications',
          'APIs often expose sensitive business functions and data directly, such as customer information and financial records',
          'APIs cannot be authenticated',
          'APIs only run on internal networks',
        ],
        correctIndex: 1,
        explanation: 'Because APIs provide direct programmatic access to sensitive data and functionality, they are high-value targets.',
      ),
      QuizQuestion(
        question: 'What is a key structural difference between REST and SOAP APIs?',
        options: [
          'REST always requires XML; SOAP always requires JSON',
          'REST is a lightweight architectural style typically using JSON over HTTP, while SOAP is a stricter XML-based messaging protocol common in enterprise/legacy systems',
          'SOAP cannot be secured in any way',
          'REST and SOAP are the same protocol with different names',
        ],
        correctIndex: 1,
        explanation: 'REST favors simplicity and JSON; SOAP defines stricter, more structured XML messaging often seen in enterprise systems.',
      ),
      QuizQuestion(
        question: 'Why are API keys alone considered insufficient protection for sensitive operations?',
        options: [
          'API keys are always encrypted automatically',
          'They can be exposed or misused if not properly protected, such as being hardcoded into client-side applications',
          'API keys never expire',
          'API keys are more secure than OAuth 2.0',
        ],
        correctIndex: 1,
        explanation: 'Because API keys can leak (e.g. embedded in client code), they should be combined with other controls rather than relied on alone.',
      ),
      QuizQuestion(
        question: 'What core problem does OAuth 2.0 solve for third-party application access?',
        options: [
          'It verifies the end user\'s identity to the third party',
          'It lets a user grant a third-party application limited access to resources without sharing their actual password',
          'It replaces the need for HTTPS',
          'It only works for government applications',
        ],
        correctIndex: 1,
        explanation: 'OAuth 2.0 issues scoped access tokens instead of sharing credentials, focusing on authorization rather than identity verification.',
      ),
      QuizQuestion(
        question: 'How does OpenID Connect (OIDC) extend OAuth 2.0?',
        options: [
          'It replaces OAuth 2.0 entirely',
          'It adds an identity layer on top of OAuth 2.0, answering "Who is the authenticated user?" via an ID Token',
          'It removes the need for access tokens',
          'It is unrelated to OAuth 2.0',
        ],
        correctIndex: 1,
        explanation: 'OIDC builds on OAuth 2.0 to add user identity verification through a signed ID Token.',
      ),
      QuizQuestion(
        question: 'What should an application always verify when validating a JSON Web Token (JWT)?',
        options: [
          'Only that the token exists in the request',
          'The signature, expiration time, and intended audience',
          'Only the token\'s length',
          'Only whether the token is base64-encoded',
        ],
        correctIndex: 1,
        explanation: 'Proper JWT validation requires checking the signature, expiration, and audience — skipping any invites forged or replayed tokens.',
      ),
      QuizQuestion(
        question: 'What is the primary role of an API Gateway?',
        options: [
          'To directly store all application data',
          'To act as a central entry point that can handle authentication, authorization, routing, logging, and rate limiting for API requests',
          'To replace the need for any backend services',
          'To generate JWTs for end users only',
        ],
        correctIndex: 1,
        explanation: 'An API Gateway centralizes cross-cutting concerns like auth, routing, and rate limiting instead of duplicating them per service.',
      ),
      QuizQuestion(
        question: 'What is the difference between rate limiting and throttling?',
        options: [
          'They are identical techniques',
          'Rate limiting restricts requests to a fixed cap per period, while throttling slows or limits requests temporarily when thresholds are exceeded rather than rejecting outright',
          'Throttling only applies to database queries',
          'Rate limiting requires disabling the API entirely',
        ],
        correctIndex: 1,
        explanation: 'Rate limiting enforces a hard cap; throttling gracefully slows traffic under load instead of an outright block.',
      ),
      QuizQuestion(
        question: 'Why is SAST often called "white-box" testing?',
        options: [
          'It only works on white-listed IP addresses',
          'It analyzes source, bytecode, or compiled code directly, without executing the application, examining its internal structure',
          'It requires a live production environment',
          'It only tests the user interface',
        ],
        correctIndex: 1,
        explanation: 'SAST inspects the code itself rather than observing external behavior, giving it visibility into internal structure — hence "white-box."',
      ),
      QuizQuestion(
        question: 'What is the main advantage DAST has over SAST?',
        options: [
          'DAST requires access to source code',
          'DAST interacts with a running application from an external perspective, similar to a real attacker, and requires no source code access',
          'DAST is always faster to run',
          'DAST eliminates the need for any other testing',
        ],
        correctIndex: 1,
        explanation: 'DAST tests the live, running application like an outside attacker would, independent of source code access.',
      ),
      QuizQuestion(
        question: 'How does IAST combine the strengths of SAST and DAST?',
        options: [
          'It only analyzes static code, like SAST',
          'It uses sensors or agents within a running application to correlate runtime behavior with internal code execution',
          'It requires no instrumentation of any kind',
          'It replaces the need for a running application entirely',
        ],
        correctIndex: 1,
        explanation: 'IAST instruments the running application, giving it visibility into both behavior and internal execution simultaneously.',
      ),
      QuizQuestion(
        question: 'What specific risk does Software Composition Analysis (SCA) address?',
        options: [
          'Weaknesses in custom-written business logic only',
          'Known vulnerabilities, outdated versions, and licensing issues in third-party and open-source dependencies',
          'Network-layer misconfigurations',
          'Physical server security',
        ],
        correctIndex: 1,
        explanation: 'SCA inventories dependencies and checks them against vulnerability databases, since apps rarely rely solely on custom code.',
      ),
      QuizQuestion(
        question: 'What is the goal of Fuzz Testing?',
        options: [
          'To verify the application\'s visual design',
          'To supply unexpected, invalid, or malformed input and observe whether the application handles it safely without crashing or exposing data',
          'To measure network bandwidth usage',
          'To confirm password complexity rules only',
        ],
        correctIndex: 1,
        explanation: 'Fuzzing probes an application\'s resilience to malformed input, surfacing crashes, memory errors, and validation gaps.',
      ),
      QuizQuestion(
        question: 'How does Penetration Testing differ from automated vulnerability scanning?',
        options: [
          'They are exactly the same activity',
          'Penetration testing combines automated tools with manual analysis by experienced professionals to find realistically exploitable vulnerabilities',
          'Penetration testing never uses any tools',
          'Automated scanning always finds more issues than penetration testing',
        ],
        correctIndex: 1,
        explanation: 'Pen testing adds skilled manual analysis on top of automated tools, aiming to validate real-world exploitability.',
      ),
      QuizQuestion(
        question: 'What factors should organizations weigh when prioritizing vulnerability remediation?',
        options: [
          'Only the alphabetical name of the vulnerability',
          'Severity, exploitability, business impact, exposure, and availability of patches',
          'Only how recently the vulnerability was discovered',
          'Only the size of the development team',
        ],
        correctIndex: 1,
        explanation: 'Effective vulnerability management weighs multiple risk factors together, not any single dimension alone.',
      ),
      QuizQuestion(
        question: 'Why does integrating security testing into CI/CD pipelines support a DevSecOps approach?',
        options: [
          'It removes the need for developers to write secure code',
          'It evaluates code automatically each time changes are introduced, surfacing issues earlier and reducing remediation time',
          'It only runs once per year',
          'It replaces the need for a security team',
        ],
        correctIndex: 1,
        explanation: 'Automated pipeline checks catch problems close to when they are introduced, which is central to the DevSecOps philosophy.',
      ),
      QuizQuestion(
        question: 'What is the primary objective of application hardening?',
        options: [
          'To add as many new features as possible',
          'To reduce the attack surface by removing unnecessary functionality and applying secure configurations before and after deployment',
          'To increase application response time',
          'To replace the need for authentication',
        ],
        correctIndex: 1,
        explanation: 'Hardening strips away unnecessary functionality and locks down configuration to minimize what an attacker can target.',
      ),
      QuizQuestion(
        question: 'Why can an application with secure source code still be vulnerable after deployment?',
        options: [
          'Secure code guarantees a secure deployment automatically',
          'Improper configuration — such as default credentials, exposed debug modes, or missing encryption — can introduce vulnerabilities independent of the code itself',
          'Deployment never affects application security',
          'Only network security matters after deployment',
        ],
        correctIndex: 1,
        explanation: 'Configuration and deployment practices are a separate risk layer from source code quality, and both must be secured.',
      ),
      QuizQuestion(
        question: 'What is the difference between application logging and application monitoring?',
        options: [
          'They are the same activity performed twice',
          'Logging records events as they happen, while monitoring continuously analyzes those events to identify abnormal or malicious activity',
          'Monitoring replaces the need for logging entirely',
          'Logging is only used for billing purposes',
        ],
        correctIndex: 1,
        explanation: 'Logging captures the raw event record; monitoring is the ongoing analysis layered on top of those logs.',
      ),
      QuizQuestion(
        question: 'What makes Runtime Application Self-Protection (RASP) different from a traditional external security tool?',
        options: [
          'RASP only works on network traffic, like a firewall',
          'RASP operates from within the running application, giving it visibility into execution, database calls, and API requests as they happen',
          'RASP requires no integration with the application at all',
          'RASP can only detect issues after an attack has already succeeded',
        ],
        correctIndex: 1,
        explanation: 'RASP\'s in-application vantage point lets it observe and react to attacks in real time from the inside, unlike perimeter tools.',
      ),
      QuizQuestion(
        question: 'What does a Web Application Firewall (WAF) protect against that a traditional network firewall typically does not?',
        options: [
          'Physical intrusion into a data center',
          'Application-layer attacks such as SQL Injection and XSS, by understanding HTTP/HTTPS traffic content',
          'Power outages',
          'Hardware failures',
        ],
        correctIndex: 1,
        explanation: 'A WAF inspects application-layer traffic content, catching attacks a network-layer firewall would not recognize.',
      ),
      QuizQuestion(
        question: 'Why is a WAF not considered a replacement for fixing application vulnerabilities?',
        options: [
          'A WAF actively introduces new vulnerabilities',
          'A WAF filters and blocks malicious traffic patterns but does not correct the underlying insecure code',
          'A WAF only works on internal networks',
          'A WAF cannot be deployed alongside secure coding practices',
        ],
        correctIndex: 1,
        explanation: 'A WAF is a complementary control, not a substitute for remediating the actual vulnerability in the application.',
      ),
      QuizQuestion(
        question: 'What is the correct order of the Application Incident Response phases described in this chapter?',
        options: [
          'Detection, Preparation, Recovery, Containment, Analysis, Eradication, Lessons Learned',
          'Preparation, Detection, Analysis, Containment, Eradication, Recovery, Lessons Learned',
          'Containment, Eradication, Preparation, Detection, Analysis, Recovery, Lessons Learned',
          'Lessons Learned, Preparation, Detection, Containment, Analysis, Eradication, Recovery',
        ],
        correctIndex: 1,
        explanation: 'The phases run Preparation, Detection, Analysis, Containment, Eradication, Recovery, then Lessons Learned.',
      ),
      QuizQuestion(
        question: 'During which Incident Response phase would an organization isolate an affected application or disable a compromised account?',
        options: ['Preparation', 'Detection', 'Containment', 'Lessons Learned'],
        correctIndex: 2,
        explanation: 'Containment focuses on limiting the spread of an active incident, such as isolating systems or disabling accounts.',
      ),
      QuizQuestion(
        question: 'Why is timely patch management critical for application security?',
        options: [
          'Patches only ever add new features, never fix security issues',
          'Delaying critical security updates increases the window of time attackers have to exploit known, disclosed vulnerabilities',
          'Patch management is unrelated to application security',
          'Patches automatically fix all zero-day vulnerabilities',
        ],
        correctIndex: 1,
        explanation: 'Once a vulnerability is publicly disclosed, unpatched systems remain exploitable until the fix is applied.',
      ),
      QuizQuestion(
        question: 'Which combination best reflects a mature, layered approach to application security described across this chapter?',
        options: [
          'Relying solely on a WAF and skipping secure coding practices',
          'Combining Secure by Design/Default, secure coding, SSDLC integration, multiple testing techniques (SAST/DAST/IAST/SCA), hardening, monitoring, and incident response',
          'Performing a single penetration test before every major release and nothing else',
          'Disabling logging to reduce storage costs',
        ],
        correctIndex: 1,
        explanation: 'No single control is sufficient — comprehensive application security combines design, coding, testing, hardening, and operational practices together.',
      ),
    ],
  ),
];
