import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> identityFederationSsoLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Understanding Single Sign-On (SSO)',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Too Many Passwords',
        body:
            'As organizations increasingly adopt cloud services, Software '
            'as a Service (SaaS) applications, and hybrid IT '
            'environments, users are expected to access numerous business '
            'applications every day. Without a centralized identity '
            'solution, users would need to maintain separate usernames '
            'and passwords for each application, increasing '
            'administrative overhead, password fatigue, and the '
            'likelihood of insecure practices such as password reuse.',
      ),
      LessonSection(
        body:
            'To address these challenges, organizations implement '
            'Identity Federation and Single Sign-On (SSO). These '
            'technologies enable users to authenticate once and securely '
            'access multiple applications while allowing organizations to '
            'centralize authentication, enforce security policies, and '
            'simplify identity management.',
      ),
      LessonSection(
        body:
            'Identity federation establishes trust between different '
            'organizations or security domains, while Single Sign-On '
            'provides a seamless authentication experience by allowing '
            'users to access multiple applications after a single '
            'successful login. Modern enterprise identity platforms such '
            'as Microsoft Entra ID, Okta, Ping Identity, and Google Cloud '
            'Identity use federation technologies to provide secure '
            'authentication for cloud, on-premises, and hybrid '
            'environments.',
      ),
      LessonSection(
        heading: 'What Is Single Sign-On?',
        body:
            'Single Sign-On (SSO) is an authentication mechanism that '
            'enables a user to log in once and gain access to multiple '
            'independent applications without being prompted to '
            'authenticate repeatedly. Instead of maintaining separate '
            'credentials for every application, users authenticate with a '
            'centralized identity provider. After successful '
            'authentication, the identity provider securely verifies the '
            'user\'s identity to other trusted applications.',
      ),
      LessonSection(
        body:
            'For example, an employee may log in to the corporate '
            'identity portal in the morning and then access Microsoft '
            '365, Salesforce, ServiceNow, Workday, Concur, Zoom, and '
            'internal HR applications without entering their password '
            'again.',
      ),
      LessonSection(
        body:
            'SSO improves both user experience and organizational '
            'security by reducing password fatigue and encouraging the '
            'use of strong authentication mechanisms such as Multi-Factor '
            'Authentication (MFA).',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/sso_federation_overview.jpg',
          caption:
              'Single Sign-On enables users to authenticate once through '
              'a trusted Identity Provider, which then grants access to '
              'multiple enterprise and cloud applications without '
              'requiring additional logins.',
        ),
      ),
      LessonSection(
        heading: 'Improved User Experience & Stronger Security',
        body:
            'Users authenticate only once, reducing the number of '
            'passwords they must remember and minimizing login '
            'interruptions throughout the workday. Because authentication '
            'is centralized, organizations can also enforce Multi-Factor '
            'Authentication (MFA), Conditional Access policies, password '
            'policies, risk-based authentication, and device compliance '
            'requirements — rather than configuring these controls '
            'individually for every application.',
      ),
      LessonSection(
        heading: 'Reduced Password Fatigue & Simplified Administration',
        body:
            'Employees often reuse passwords when managing multiple '
            'accounts. SSO reduces the number of credentials users must '
            'maintain, decreasing the likelihood of weak or reused '
            'passwords. It also lets administrators manage identities and '
            'authentication policies centrally, making onboarding, '
            'offboarding, and access management significantly easier.',
      ),
      LessonSection(
        heading: 'Better Auditing',
        body:
            'Authentication events are recorded by a centralized identity '
            'platform, providing consistent audit logs for compliance, '
            'investigations, and reporting.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Identity Federation: IdP, SP & Trust',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Understanding Identity Federation',
        body:
            'Identity Federation is the process of establishing a trusted '
            'relationship between two or more independent security '
            'domains so that users can access resources without requiring '
            'separate accounts in each domain. Rather than storing '
            'duplicate user accounts in every application, organizations '
            'trust an external identity provider to authenticate users on '
            'their behalf.',
      ),
      LessonSection(
        body:
            'For example, a company may use Microsoft Entra ID as its '
            'central identity platform while employees access '
            'applications hosted by external vendors. Instead of '
            'maintaining separate usernames and passwords for each vendor '
            'application, the applications trust Microsoft Entra ID to '
            'verify user identities.',
      ),
      LessonSection(
        body:
            'Identity federation enables secure collaboration between '
            'business partners, cloud service providers, government '
            'agencies, educational institutions, subsidiaries, customers, '
            'and suppliers. Federation reduces administrative complexity '
            'while improving user convenience and security.',
      ),
      LessonSection(
        heading: 'Identity Provider (IdP)',
        body:
            'An Identity Provider (IdP) is a trusted system responsible '
            'for authenticating users and issuing identity assertions or '
            'security tokens to applications. The Identity Provider '
            'verifies username, password, Multi-Factor Authentication, '
            'device compliance, Conditional Access policies, user risk, '
            'and group membership. Once authentication succeeds, the IdP '
            'issues a secure authentication token that applications use '
            'to verify the user\'s identity.',
      ),
      LessonSection(
        body:
            'Common enterprise Identity Providers include Microsoft Entra '
            'ID, Active Directory Federation Services (AD FS), Okta, Ping '
            'Identity, and Google Cloud Identity. The IdP becomes the '
            'central authority responsible for verifying identities '
            'across the organization.',
      ),
      LessonSection(
        heading: 'Service Provider (SP)',
        body:
            'A Service Provider (SP) is an application or service that '
            'relies on an external Identity Provider for authentication '
            '— examples include Microsoft 365, Salesforce, ServiceNow, '
            'AWS Management Console, Workday, Dropbox Business, and '
            'Atlassian Cloud. Rather than authenticating users directly, '
            'the Service Provider trusts the Identity Provider to confirm '
            'the user\'s identity. This trust relationship simplifies '
            'identity management while reducing the need to store '
            'passwords within every application.',
      ),
      LessonSection(
        heading: 'Trust Relationships',
        body:
            'Federation relies on a trust relationship between the '
            'Identity Provider and the Service Provider. A trust '
            'relationship enables the Service Provider to accept '
            'authentication decisions made by the Identity Provider. This '
            'trust is established using digital certificates, '
            'cryptographic signatures, secure communication protocols, '
            'metadata exchange, and federation agreements. Because trust '
            'is based on cryptographic verification rather than shared '
            'passwords, authentication remains secure even when '
            'applications belong to different organizations.',
      ),
      LessonSection(
        heading: 'Authentication Tokens',
        body:
            'After successful authentication, the Identity Provider '
            'generates an authentication token. A token is a digitally '
            'signed data structure containing information about the '
            'authenticated user. Typical token contents include user '
            'identifier, username, email address, group memberships, '
            'assigned roles, token expiration time, and digital '
            'signature. Applications validate the token before granting '
            'access to requested resources.',
      ),
      LessonSection(
        body:
            'Since tokens have limited lifetimes, they reduce the risk '
            'associated with long-lived credentials while supporting '
            'seamless access to multiple applications.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational consulting company uses Microsoft Entra ID '
            'as its centralized Identity Provider. Employees authenticate '
            'once using their corporate credentials and complete '
            'Multi-Factor Authentication. After successful authentication, '
            'Entra ID issues security tokens that allow users to access '
            'Microsoft 365, Salesforce, ServiceNow, Workday, and internal '
            'HR systems without additional logins.',
      ),
      LessonSection(
        body:
            'When an employee leaves the organization, disabling the '
            'account in Entra ID immediately prevents access to all '
            'connected applications, simplifying offboarding and reducing '
            'the risk of orphaned accounts.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use a centralized Identity Provider for enterprise authentication',
          'Protect SSO with Multi-Factor Authentication',
          'Establish trust relationships using digital certificates',
          'Monitor authentication logs for suspicious activity',
          'Implement Conditional Access policies for high-risk logins',
          'Limit token lifetime to reduce exposure if a token is compromised',
          'Regularly review trust relationships with third-party service providers',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Single Sign-On improves convenience, but it also centralizes '
            'authentication. Protect the Identity Provider with strong '
            'security controls such as Multi-Factor Authentication, '
            'Conditional Access, privileged access management, and '
            'continuous monitoring, as compromising the IdP could affect '
            'access to multiple enterprise applications.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Assertion Markup Language (SAML)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'From Concepts to Protocols',
        body:
            'In the previous lessons, we explored how Single Sign-On '
            '(SSO) and Identity Federation simplify user authentication '
            'by allowing organizations to centralize identity management. '
            'However, for federation to work securely, the Identity '
            'Provider (IdP) and the Service Provider (SP) must exchange '
            'identity information using standardized protocols.',
      ),
      LessonSection(
        body:
            'One of the most widely adopted federation standards is the '
            'Security Assertion Markup Language (SAML). For more than two '
            'decades, SAML has enabled organizations to securely '
            'authenticate users across web applications without requiring '
            'multiple usernames and passwords. Today, thousands of '
            'enterprise applications — including Microsoft 365, '
            'Salesforce, Workday, ServiceNow, SAP, and many others — '
            'support SAML-based Single Sign-On.',
      ),
      LessonSection(
        heading: 'Understanding SAML',
        body:
            'Security Assertion Markup Language (SAML) is an XML-based '
            'open standard used to exchange authentication and '
            'authorization information between an Identity Provider (IdP) '
            'and a Service Provider (SP). Rather than transmitting '
            'passwords between applications, SAML exchanges digitally '
            'signed assertions that confirm a user\'s identity.',
      ),
      LessonSection(
        body:
            'When a user attempts to access a SAML-enabled application, '
            'the application redirects the user to the Identity Provider. '
            'After successful authentication, the Identity Provider sends '
            'a signed SAML assertion back to the application, which then '
            'grants access. This process allows organizations to '
            'centralize authentication while enabling users to access '
            'multiple applications with a single login.',
      ),
      LessonSection(
        heading: 'Why SAML Is Important',
        body:
            'Organizations widely deploy SAML because it provides secure '
            'identity federation across different organizations and cloud '
            'providers. Benefits include:',
      ),
      LessonSection(
        heading: 'Centralized Authentication & Improved Security',
        body:
            'Users authenticate through a trusted Identity Provider '
            'rather than directly with each application, and passwords '
            'remain with the Identity Provider rather than being shared '
            'with Service Providers.',
      ),
      LessonSection(
        heading: 'Simplified User Experience & Easier Identity Management',
        body:
            'Employees authenticate once and access multiple enterprise '
            'applications without repeated logins, while user accounts, '
            'password policies, and Multi-Factor Authentication (MFA) are '
            'managed centrally.',
      ),
      LessonSection(
        heading: 'Strong Trust Model',
        body:
            'Digital signatures and certificates ensure that '
            'authentication assertions cannot be modified during '
            'transmission.',
      ),
      LessonSection(
        heading: 'SAML Components',
        body:
            'Several components work together during a SAML '
            'authentication process.',
      ),
      LessonSection(
        heading: 'Identity Provider (IdP) & Service Provider (SP)',
        body:
            'The Identity Provider authenticates users and generates '
            'SAML assertions — examples include Microsoft Entra ID, Okta, '
            'Ping Identity, and Active Directory Federation Services (AD '
            'FS). The Service Provider is the application requesting '
            'authentication — examples include Salesforce, ServiceNow, '
            'Workday, Zoom, and SAP SuccessFactors. The Service Provider '
            'trusts the Identity Provider to verify user identities.',
      ),
      LessonSection(
        heading: 'User & Web Browser',
        body:
            'The user attempts to access a protected application using a '
            'web browser. The browser transfers authentication requests '
            'and responses between the Identity Provider and the Service '
            'Provider. Unlike many API authentication protocols, SAML '
            'authentication typically occurs through browser redirects.',
      ),
      LessonSection(
        heading: 'SAML Assertion',
        body:
            'A SAML Assertion is an XML document generated by the '
            'Identity Provider after successful authentication. It serves '
            'as proof that the user has already been authenticated. A '
            'SAML assertion commonly contains a user identifier, '
            'username, email address, group membership, assigned roles, '
            'authentication timestamp, token expiration time, and digital '
            'signature. Because the assertion is digitally signed, the '
            'Service Provider can verify that it originated from the '
            'trusted Identity Provider and has not been altered.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Component', 'Role'],
          tableRows: [
            ['User', 'Requests access to an application'],
            ['Web Browser', 'Transfers authentication requests and responses'],
            ['Identity Provider (IdP)', 'Authenticates users and issues SAML assertions'],
            ['Service Provider (SP)', 'Validates assertions and grants application access'],
            ['SAML Assertion', 'Carries authenticated user information'],
            ['Digital Certificate', 'Verifies the authenticity of assertions'],
          ],
        ),
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'SAML Authentication Flow & Federation Metadata',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'SAML Authentication Flow',
        body:
            'The following sequence describes a typical SAML '
            'authentication process.',
      ),
      LessonSection(
        heading: 'Step 1 – User Requests an Application',
        body:
            'The user opens a browser and navigates to a SAML-enabled '
            'application such as Salesforce. The Service Provider detects '
            'that the user has not yet been authenticated.',
      ),
      LessonSection(
        heading: 'Step 2 – Redirect to Identity Provider',
        body:
            'The Service Provider redirects the browser to the trusted '
            'Identity Provider. The request contains information '
            'identifying the application requesting authentication.',
      ),
      LessonSection(
        heading: 'Step 3 – User Authentication',
        body:
            'The Identity Provider verifies the user\'s identity. '
            'Authentication may involve username and password, '
            'Multi-Factor Authentication, smart card authentication, '
            'passkeys, and Conditional Access policies. If authentication '
            'succeeds, the process continues.',
      ),
      LessonSection(
        heading: 'Step 4 – SAML Assertion Generation',
        body:
            'The Identity Provider creates a digitally signed SAML '
            'assertion containing information about the authenticated '
            'user. The assertion includes identity attributes and '
            'authentication details required by the Service Provider.',
      ),
      LessonSection(
        heading: 'Step 5 – Assertion Validation',
        body:
            'The browser returns the signed assertion to the Service '
            'Provider. The Service Provider verifies the digital '
            'signature, certificate validity, assertion expiration, '
            'trusted Identity Provider, and audience restrictions. If '
            'validation succeeds, the user is authenticated.',
      ),
      LessonSection(
        heading: 'Step 6 – Access Granted',
        body:
            'The Service Provider creates an application session and '
            'grants access without requiring another password.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/saml_access_granted.jpg',
          caption:
              'During SAML authentication, the Service Provider delegates '
              'user authentication to the Identity Provider, which '
              'returns a signed assertion confirming the user\'s '
              'identity.',
        ),
      ),
      LessonSection(
        heading: 'Federation Metadata',
        body:
            'For SAML federation to function correctly, both the '
            'Identity Provider and Service Provider exchange metadata. '
            'Federation metadata contains configuration information '
            'required to establish trust. Typical metadata includes the '
            'Entity ID, Assertion Consumer Service (ACS) URL, Single '
            'Sign-On URL, Single Logout URL, supported bindings, X.509 '
            'certificates, and digital signature information. Metadata '
            'exchange reduces manual configuration errors and simplifies '
            'federation setup.',
      ),
      LessonSection(
        heading: 'SAML Claims and Attributes',
        body:
            'In addition to confirming that a user has authenticated '
            'successfully, SAML assertions can include attributes (often '
            'referred to as claims) that provide additional information '
            'about the user. Examples include full name, email address, '
            'department, employee ID, job title, group memberships, '
            'manager, and assigned roles. Applications use these claims '
            'to determine what resources the authenticated user is '
            'permitted to access.',
      ),
      LessonSection(
        body:
            'For example, an HR application may use a user\'s department '
            'and role to display only information relevant to that '
            'employee\'s responsibilities.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational manufacturing company uses Microsoft Entra '
            'ID as its Identity Provider and Salesforce as a Service '
            'Provider. An employee attempts to access Salesforce through '
            'a web browser. Because the user is not yet authenticated, '
            'Salesforce redirects the browser to Microsoft Entra ID. The '
            'employee signs in using corporate credentials and completes '
            'Multi-Factor Authentication.',
      ),
      LessonSection(
        body:
            'After successful authentication, Microsoft Entra ID '
            'generates a digitally signed SAML assertion containing the '
            'employee\'s identity and role information. Salesforce '
            'validates the assertion using the organization\'s trusted '
            'certificate and grants access without prompting the '
            'employee for another password. This centralized '
            'authentication model improves user experience while '
            'ensuring that password policies and security controls '
            'remain managed by the organization\'s Identity Provider.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use trusted digital certificates to sign SAML assertions',
          'Protect the Identity Provider with Multi-Factor Authentication',
          'Exchange federation metadata securely',
          'Configure short assertion lifetimes to reduce replay risks',
          'Validate digital signatures before granting application access',
          'Monitor SAML authentication logs for unusual login activity',
          'Review and renew federation certificates before expiration',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'A SAML assertion is equivalent to a trusted identity '
            'credential. Protect signing certificates, validate every '
            'assertion, and use short assertion lifetimes to minimize the '
            'impact of stolen or replayed authentication tokens.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'OAuth 2.0 & OpenID Connect (OIDC)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'OAuth 2.0',
        body:
            'OAuth 2.0 is an industry-standard authorization framework '
            'that enables one application to access resources on behalf '
            'of a user without exposing the user\'s password. Unlike '
            'SAML, OAuth 2.0 is primarily an authorization protocol, not '
            'an authentication protocol.',
      ),
      LessonSection(
        body:
            'For example, suppose a photo-printing website wants '
            'permission to access a user\'s photos stored in Google '
            'Drive. Instead of requesting the user\'s Google password, the '
            'application redirects the user to Google, where the user '
            'grants permission. Google then issues an access token, '
            'allowing the application to access only the authorized '
            'resources.',
      ),
      LessonSection(
        body:
            'OAuth 2.0 is widely used by Google APIs, Microsoft Graph, '
            'GitHub, Facebook, LinkedIn, Dropbox, Salesforce, and Slack. '
            'It is particularly well suited for mobile applications, web '
            'applications, cloud services, REST APIs, and third-party '
            'integrations.',
      ),
      LessonSection(
        heading: 'OAuth 2.0 Components',
        body:
            'OAuth 2.0 defines several key participants in the '
            'authorization process.',
      ),
      LessonSection(
        heading: 'Resource Owner & Client',
        body:
            'The Resource Owner is the user who owns the protected data. '
            'The Client is the application requesting access to the '
            'user\'s resources.',
      ),
      LessonSection(
        heading: 'Authorization Server & Resource Server',
        body:
            'The Authorization Server is responsible for authenticating '
            'the user and issuing access tokens. The Resource Server is '
            'the server hosting the protected resources — it validates '
            'the access token before granting access.',
      ),
      LessonSection(
        heading: 'OAuth 2.0 Access Tokens',
        body:
            'After successful authorization, the Authorization Server '
            'issues an access token. The token contains information that '
            'allows applications to access approved resources without '
            'storing user credentials. Typical token characteristics '
            'include limited lifetime, specific permissions (scopes), '
            'digital signing, revocability, and application-specificity. '
            'Because tokens expire automatically, they reduce the risks '
            'associated with long-lived credentials.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/oauth2_access_tokens.jpg',
          caption:
              'OAuth 2.0 enables applications to access protected '
              'resources using access tokens instead of user passwords.',
        ),
      ),
      LessonSection(
        heading: 'OpenID Connect (OIDC)',
        body:
            'OpenID Connect (OIDC) is an authentication protocol built on '
            'top of OAuth 2.0. While OAuth 2.0 determines what an '
            'application is allowed to access, OpenID Connect determines '
            'who the user is. OIDC adds an ID Token, allowing '
            'applications to verify the authenticated user\'s identity.',
      ),
      LessonSection(
        body:
            'Modern cloud identity platforms widely support OpenID '
            'Connect because it is lightweight, secure, and well suited '
            'for APIs, mobile devices, and cloud-native applications. '
            'Major providers supporting OpenID Connect include Microsoft '
            'Entra ID, Google Identity, Okta, Auth0, and Amazon Cognito.',
      ),
      LessonSection(
        heading: 'ID Tokens',
        body:
            'An ID Token is typically a JSON Web Token (JWT) containing '
            'identity information about the authenticated user. Common '
            'claims include User ID, username, email address, '
            'authentication time, token expiration, issuer, and audience. '
            'Applications validate the token before establishing a user '
            'session.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/oidc_id_tokens.jpg',
          caption:
              'OpenID Connect extends OAuth 2.0 by providing '
              'authenticated identity information through an ID Token '
              'while continuing to use access tokens for resource '
              'authorization.',
        ),
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Kerberos, LDAP & Comparing Authentication Protocols',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Kerberos',
        body:
            'Kerberos is a network authentication protocol developed by '
            'MIT and widely used in Microsoft Active Directory '
            'environments. Kerberos provides secure mutual authentication '
            'using secret-key cryptography and eliminates the need to '
            'transmit passwords across the network. Instead of '
            'repeatedly entering credentials, users receive encrypted '
            'tickets that allow them to access network resources '
            'securely.',
      ),
      LessonSection(
        body:
            'Kerberos is commonly used for Windows domain authentication, '
            'Active Directory, file servers, print servers, and '
            'enterprise applications.',
      ),
      LessonSection(
        heading: 'Kerberos Components',
        body: 'Kerberos includes several important components.',
      ),
      LessonSection(
        heading: 'Client & Key Distribution Center (KDC)',
        body:
            'The Client is the user requesting access to a network '
            'service. The Key Distribution Center (KDC) is the trusted '
            'authentication authority responsible for issuing Kerberos '
            'tickets. The KDC consists of an Authentication Server (AS) '
            'and a Ticket Granting Server (TGS).',
      ),
      LessonSection(
        heading: 'Service Server, TGT & Service Ticket',
        body:
            'The Service Server is the system providing access to '
            'network resources. A Ticket Granting Ticket (TGT) is issued '
            'after initial authentication — it allows users to request '
            'additional service tickets without re-entering credentials. '
            'A Service Ticket allows access to a specific network '
            'service.',
      ),
      LessonSection(
        body:
            'Because Kerberos relies on encrypted tickets rather than '
            'passwords, it provides strong authentication while '
            'supporting Single Sign-On within Windows domains.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/kerberos_tickets.jpg',
          caption:
              'Kerberos authenticates users by issuing encrypted tickets '
              'that enable secure access to enterprise services without '
              'repeatedly transmitting passwords.',
        ),
      ),
      LessonSection(
        heading: 'Lightweight Directory Access Protocol (LDAP)',
        body:
            'Lightweight Directory Access Protocol (LDAP) is a protocol '
            'used to query and manage directory services. Unlike '
            'Kerberos, LDAP is not an authentication protocol. Instead, '
            'LDAP provides access to directory information such as user '
            'accounts, groups, Organizational Units (OUs), devices, '
            'printers, and contact information.',
      ),
      LessonSection(
        body:
            'LDAP is commonly used with Microsoft Active Directory, '
            'OpenLDAP, Apache Directory, and Red Hat Directory Server. '
            'Applications query LDAP directories to retrieve user '
            'information and group memberships used for authorization '
            'decisions.',
      ),
      LessonSection(
        heading: 'Comparing Authentication Protocols',
        body:
            'Although these technologies are often used together, they '
            'serve different purposes.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Protocol', 'Primary Purpose', 'Common Use Cases'],
          tableRows: [
            ['SAML', 'Authentication and federation', 'Enterprise web-based Single Sign-On'],
            ['OAuth 2.0', 'Authorization', 'API access, cloud applications, mobile apps'],
            ['OpenID Connect (OIDC)', 'Authentication', 'Cloud-native applications, mobile authentication'],
            ['Kerberos', 'Network authentication', 'Windows domains, Active Directory'],
            ['LDAP', 'Directory access', 'User and group lookups, directory management'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational retail organization uses Microsoft Entra ID '
            'to authenticate employees accessing cloud applications. '
            'Employees sign in using OpenID Connect to Microsoft 365 and '
            'internal web portals. Third-party applications access '
            'Microsoft Graph APIs using OAuth 2.0 access tokens, while '
            'on-premises Windows workstations authenticate to Active '
            'Directory using Kerberos. Human Resources applications '
            'retrieve employee and group information through LDAP '
            'queries.',
      ),
      LessonSection(
        body:
            'By combining these technologies, the organization provides '
            'seamless authentication across cloud and on-premises '
            'environments while maintaining centralized identity '
            'management and strong security controls.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use SAML for browser-based enterprise Single Sign-On where supported',
          'Use OAuth 2.0 for delegated authorization to APIs and cloud services',
          'Implement OpenID Connect for modern web and mobile application authentication',
          'Use Kerberos within Windows Active Directory environments',
          'Protect signing keys and certificates used for federation',
          'Configure short-lived tokens and enforce token validation',
          'Require Multi-Factor Authentication for privileged and remote access',
          'Monitor federation, OAuth, and authentication logs for suspicious activity',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Choose identity protocols based on their intended purpose. '
            'OAuth 2.0 authorizes access to resources, OpenID Connect '
            'authenticates users, SAML enables enterprise federation, '
            'Kerberos secures Windows domain authentication, and LDAP '
            'provides directory access. Using each protocol appropriately '
            'improves both security and interoperability.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Identity Monitoring & Behavioral Analytics (UEBA)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Identity Is the New Perimeter',
        body:
            'As organizations increasingly adopt cloud computing, remote '
            'work, and Software as a Service (SaaS) applications, the '
            'traditional network perimeter has become less important '
            'than the user identity. Today, attackers frequently target '
            'user accounts rather than attempting to compromise network '
            'infrastructure directly. Stolen credentials, compromised '
            'privileged accounts, and identity-based attacks have become '
            'some of the most common methods used to gain unauthorized '
            'access to enterprise environments.',
      ),
      LessonSection(
        body:
            'To address these evolving threats, organizations implement '
            'Identity Monitoring and Threat Detection solutions that '
            'continuously analyze authentication events, user behavior, '
            'and identity-related activities. Rather than relying solely '
            'on preventive controls such as passwords and Multi-Factor '
            'Authentication (MFA), these solutions detect suspicious '
            'behavior after authentication and help security teams '
            'identify compromised accounts before significant damage '
            'occurs.',
      ),
      LessonSection(
        body:
            'Modern identity monitoring combines log analysis, '
            'behavioral analytics, artificial intelligence, and threat '
            'intelligence to provide continuous visibility into '
            'identity-related risks across cloud and on-premises '
            'environments.',
      ),
      LessonSection(
        heading: 'Understanding Identity Monitoring',
        body:
            'Identity Monitoring is the continuous observation and '
            'analysis of authentication events, user activities, account '
            'changes, and access patterns to identify suspicious or '
            'unauthorized behavior. Unlike traditional authentication '
            'systems that simply verify user credentials, identity '
            'monitoring focuses on determining whether authenticated '
            'activities are consistent with a user\'s normal behavior.',
      ),
      LessonSection(
        body:
            'Identity monitoring platforms collect data from various '
            'sources, including Identity Providers (IdPs), Active '
            'Directory, Microsoft Entra ID, cloud applications, VPN '
            'gateways, Endpoint Detection and Response (EDR), Security '
            'Information and Event Management (SIEM) platforms, and '
            'Multi-Factor Authentication systems. By analyzing this '
            'information, organizations can identify compromised '
            'accounts, insider threats, and policy violations before '
            'attackers achieve their objectives.',
      ),
      LessonSection(
        heading: 'Why Identity Monitoring Is Important',
        body:
            'Successful authentication does not always indicate '
            'legitimate access. Attackers frequently obtain valid '
            'credentials through phishing attacks, credential theft, '
            'password spraying, credential stuffing, malware, social '
            'engineering, and insider misuse. Once attackers possess '
            'valid credentials, they may appear to be legitimate users.',
      ),
      LessonSection(
        body: 'Identity monitoring helps detect abnormal behavior such as:',
        bullets: [
          'Logins from unusual locations',
          'Access outside normal working hours',
          'Simultaneous logins from multiple countries',
          'Unusual privilege escalation',
          'Large-scale data downloads',
          'Access to unfamiliar applications',
          'Changes to authentication methods',
          'Creation of unauthorized privileged accounts',
        ],
      ),
      LessonSection(
        body:
            'Continuous monitoring enables organizations to detect these '
            'activities quickly and initiate incident response procedures '
            'before attackers can move laterally or exfiltrate sensitive '
            'data.',
      ),
      LessonSection(
        heading: 'Identity Threat Landscape',
        body:
            'Modern identity attacks focus on exploiting weaknesses in '
            'authentication processes rather than vulnerabilities in '
            'operating systems. Common identity-related threats include '
            'credential theft, password spraying, credential stuffing, '
            'phishing, session hijacking, Pass-the-Hash attacks, '
            'privilege escalation, insider threats, token theft, and MFA '
            'fatigue attacks. Because these attacks often involve '
            'legitimate credentials, traditional antivirus software may '
            'not detect them. Identity monitoring therefore becomes a '
            'critical component of enterprise cybersecurity.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/identity_threat_landscape.jpg',
          caption:
              'Identity monitoring platforms collect authentication and '
              'access events from multiple enterprise systems and '
              'forward correlated security information to the Security '
              'Operations Center for continuous monitoring and incident '
              'response.',
        ),
      ),
      LessonSection(
        heading: 'User and Entity Behavior Analytics (UEBA)',
        body:
            'One of the most effective identity monitoring technologies '
            'is User and Entity Behavior Analytics (UEBA). UEBA uses '
            'statistical analysis, machine learning, and behavioral '
            'modeling to establish a baseline of normal user and device '
            'activity. Rather than relying solely on predefined detection '
            'rules, UEBA continuously compares current behavior against '
            'historical patterns.',
      ),
      LessonSection(
        body: 'Typical behavioral characteristics include:',
        bullets: [
          'Login times',
          'Geographic locations',
          'Frequently accessed applications',
          'Typical devices',
          'Network usage',
          'File access patterns',
          'Administrative activities',
          'Authentication methods',
        ],
      ),
      LessonSection(
        body:
            'If significant deviations occur, UEBA assigns a higher risk '
            'score and may generate an alert. For example, if an '
            'employee who normally logs in from Bengaluru during '
            'business hours suddenly authenticates from another country '
            'at 2:00 AM and attempts to access administrative resources, '
            'UEBA identifies the behavior as anomalous and notifies the '
            'security team.',
      ),
      LessonSection(
        heading: 'Behavioral Baselines',
        body:
            'A behavioral baseline represents the normal activity pattern '
            'for a user, device, or application. Examples of baseline '
            'information include normal login hours, typical office '
            'locations, frequently used devices, regular business '
            'applications, average daily file access, and common '
            'authentication methods. Baselines enable security platforms '
            'to distinguish ordinary user behavior from potentially '
            'malicious activities. However, because legitimate user '
            'behavior changes over time, behavioral baselines are '
            'continuously updated.',
      ),
      LessonSection(
        heading: 'Risk Scoring',
        body:
            'Identity monitoring solutions often assign risk scores to '
            'authentication events. Risk scores are calculated using '
            'factors such as login location, device reputation, user '
            'behavior, threat intelligence, impossible travel detection, '
            'anonymous IP addresses, malware indicators, and failed '
            'authentication history. Higher risk scores may trigger '
            'additional security actions, including Multi-Factor '
            'Authentication, session termination, account lockout, '
            'Conditional Access policies, and SOC investigation.',
      ),
      LessonSection(
        body:
            'Risk-based authentication enables organizations to balance '
            'security with user convenience by applying stronger '
            'verification only when increased risk is detected.',
      ),
      LessonSection(
        heading: 'Identity Signals',
        body:
            'Identity monitoring platforms continuously analyze multiple '
            'identity signals rather than relying on a single event. '
            'Authentication Signals include successful logins, failed '
            'logins, password resets, MFA requests, and account '
            'lockouts. Device Signals include device compliance, '
            'operating system version, endpoint health, and managed vs. '
            'unmanaged devices. Location Signals include geographic '
            'location, IP address reputation, VPN usage, and anonymous '
            'proxy detection. User Behavior Signals include login '
            'frequency, resource access, administrative actions, '
            'privilege changes, and file downloads.',
      ),
      LessonSection(
        body:
            'Combining multiple signals significantly improves detection '
            'accuracy while reducing false positives.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global consulting company uses Microsoft Entra ID Identity '
            'Protection integrated with Microsoft Sentinel and Defender '
            'for Endpoint. An employee typically signs in from Bengaluru '
            'between 9:00 AM and 6:00 PM using a managed Windows laptop. '
            'One evening, the identity monitoring platform detects a '
            'login from another country using an unmanaged device, '
            'followed by repeated attempts to access privileged '
            'administrative portals and download sensitive project '
            'files.',
      ),
      LessonSection(
        body:
            'UEBA identifies this behavior as highly anomalous based on '
            'the employee\'s historical activity. The authentication '
            'event receives a high-risk score, triggering Conditional '
            'Access to require Multi-Factor Authentication. Because '
            'authentication fails, the account is temporarily blocked, '
            'and a high-severity alert is forwarded to Microsoft '
            'Sentinel, where SOC analysts begin investigating the '
            'potential credential compromise.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Continuously monitor authentication events across cloud and on-premises environments',
          'Establish behavioral baselines using UEBA',
          'Integrate identity monitoring with SIEM and EDR platforms',
          'Monitor privileged accounts more aggressively than standard user accounts',
          'Use risk-based authentication to adapt security controls dynamically',
          'Analyze multiple identity signals rather than relying on individual events',
          'Review high-risk authentication events promptly',
          'Regularly update detection policies to address emerging attack techniques',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Identity monitoring should focus on user behavior rather '
            'than authentication success alone. A valid login using '
            'stolen credentials can appear legitimate unless it is '
            'evaluated in the context of device health, location, '
            'historical behavior, and overall risk.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Identity-Based Attack Techniques & ITDR',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Impossible Travel Detection',
        body:
            'One of the most common identity protection features is '
            'Impossible Travel Detection. Impossible travel occurs when '
            'the same user account appears to authenticate successfully '
            'from two geographically distant locations within a time '
            'period that makes legitimate travel impossible.',
      ),
      LessonSection(
        body:
            'For example: a successful login from Bengaluru, India at '
            '9:00 AM, followed by a successful login from London, United '
            'Kingdom at 9:35 AM. Because it is impossible for the same '
            'individual to travel between these locations in such a '
            'short period, the authentication events are considered '
            'highly suspicious.',
      ),
      LessonSection(
        body:
            'Identity platforms calculate geographic distance, time '
            'between logins, estimated travel time, IP address '
            'reputation, VPN usage, and device information. If the '
            'calculated travel speed exceeds realistic limits, the login '
            'is assigned a higher risk score and may trigger additional '
            'security controls.',
      ),
      LessonSection(
        body:
            'Organizations should note that legitimate VPN usage or '
            'cloud proxy services can occasionally generate false '
            'positives. Modern identity platforms reduce these by '
            'correlating additional signals such as device identity and '
            'user history.',
      ),
      LessonSection(
        heading: 'Password Spray Attacks',
        body:
            'Unlike traditional brute-force attacks that target a single '
            'account using many passwords, a password spray attack '
            'attempts to authenticate against many user accounts using a '
            'small number of commonly used passwords. For example, an '
            'attacker may try passwords such as Welcome@123, '
            'Summer2026!, or CompanyName@123 against hundreds of user '
            'accounts. Because each account receives only a few failed '
            'attempts, password spraying often avoids account lockout '
            'policies designed to stop brute-force attacks.',
      ),
      LessonSection(
        body:
            'Identity monitoring solutions detect password spraying by '
            'identifying numerous authentication failures across many '
            'accounts, repeated use of identical passwords, attempts '
            'originating from the same IP address, and authentication '
            'attempts targeting multiple business units. Once detected, '
            'organizations may temporarily block the attacking IP '
            'address, require Multi-Factor Authentication, or notify the '
            'Security Operations Center (SOC).',
      ),
      LessonSection(
        heading: 'Credential Stuffing',
        body:
            'Credential stuffing occurs when attackers use usernames and '
            'passwords stolen during previous data breaches to attempt '
            'authentication against other services. This attack relies '
            'on the fact that many users reuse passwords across multiple '
            'websites. For example, credentials stolen from a compromised '
            'shopping website may later be used to access Microsoft 365, '
            'banking portals, corporate VPNs, and cloud applications.',
      ),
      LessonSection(
        body:
            'Identity monitoring platforms help detect credential '
            'stuffing by analyzing large numbers of authentication '
            'attempts, known breached credentials, password reuse '
            'indicators, login attempts from suspicious IP addresses, '
            'and automated authentication behavior. Many identity '
            'providers compare passwords against databases of publicly '
            'known compromised credentials and require users to change '
            'passwords if a match is found.',
      ),
      LessonSection(
        heading: 'Brute-Force Attack Detection',
        body:
            'A brute-force attack attempts to guess a user\'s password by '
            'repeatedly trying different combinations until the correct '
            'password is found. Unlike password spraying, brute-force '
            'attacks focus on a single account. Indicators include '
            'numerous failed login attempts, rapid authentication '
            'requests, sequential password attempts, and authentication '
            'attempts from unusual IP addresses.',
      ),
      LessonSection(
        body:
            'Organizations reduce the effectiveness of brute-force '
            'attacks through Multi-Factor Authentication, account '
            'lockout policies, smart lockout mechanisms, CAPTCHA '
            'challenges, risk-based Conditional Access, and passwordless '
            'authentication. Identity monitoring platforms continuously '
            'analyze authentication logs to distinguish malicious '
            'brute-force activity from legitimate user mistakes.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/brute_force_detection.jpg',
          caption:
              'Identity monitoring platforms evaluate authentication '
              'events using behavioral analytics and threat intelligence '
              'before determining the appropriate security response.',
        ),
      ),
      LessonSection(
        heading: 'Privilege Escalation Monitoring',
        body:
            'Many cyberattacks involve obtaining elevated privileges '
            'after compromising a standard user account. Privilege '
            'escalation monitoring identifies unauthorized changes to '
            'permissions, administrative roles, or privileged group '
            'memberships. Examples include a user added to Domain '
            'Admins, Global Administrator assignment, privileged role '
            'activation, administrative group modifications, creation of '
            'new administrator accounts, and service account privilege '
            'changes. Because privileged accounts provide extensive '
            'access to enterprise resources, organizations typically '
            'apply stricter monitoring and generate immediate alerts '
            'when privilege changes occur.',
      ),
      LessonSection(
        heading: 'Identity Threat Detection and Response (ITDR)',
        body:
            'Identity Threat Detection and Response (ITDR) is a security '
            'capability focused on detecting, investigating, and '
            'responding to identity-based attacks. While Endpoint '
            'Detection and Response (EDR) protects endpoint devices, '
            'ITDR focuses specifically on identities, credentials, '
            'authentication systems, and privileged accounts.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/identity_threat_detection_response.jpg',
          caption:
              'Identity Threat Detection and Response (ITDR) combines '
              'monitoring, behavioral analytics, and automated response '
              'to detect and contain identity-based attacks before '
              'attackers can establish persistence.',
        ),
      ),
      LessonSection(
        body: 'Typical ITDR capabilities include:',
        bullets: [
          'Identity monitoring',
          'UEBA',
          'Credential theft detection',
          'Privileged account monitoring',
          'Impossible travel detection',
          'Password spray detection',
          'Token misuse detection',
          'Session monitoring',
          'Automated account protection',
        ],
      ),
      LessonSection(
        body:
            'ITDR integrates with Identity Providers, Multi-Factor '
            'Authentication, SIEM platforms, EDR solutions, threat '
            'intelligence platforms, and Security Orchestration, '
            'Automation, and Response (SOAR). By combining these '
            'technologies, organizations gain comprehensive visibility '
            'into identity-related threats.',
      ),
      LessonSection(
        heading: 'Common Identity-Based Attack Techniques',
        body:
            'Modern identity platforms monitor multiple attack techniques '
            'simultaneously to detect compromised accounts and '
            'unauthorized access attempts.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Attack Technique', 'Description', 'Typical Detection Method'],
          tableRows: [
            ['Impossible Travel', 'Logins from geographically impossible locations', 'Location analytics, UEBA'],
            ['Password Spray', 'Common passwords used against many accounts', 'Authentication pattern analysis'],
            ['Credential Stuffing', 'Reuse of stolen credentials', 'Breached credential detection, abnormal login activity'],
            ['Brute Force', 'Repeated password guessing against one account', 'Failed login thresholds, smart lockout'],
            ['Privilege Escalation', 'Unauthorized increase in permissions', 'Privileged role monitoring'],
            ['Token Theft', 'Stolen authentication tokens used to access resources', 'Token validation, session analysis'],
            ['MFA Fatigue', 'Repeated MFA prompts to trick users into approving access', 'MFA request monitoring and anomaly detection'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A financial services organization uses Microsoft Entra ID '
            'Identity Protection integrated with Microsoft Sentinel and '
            'Defender for Endpoint. During routine monitoring, the '
            'identity platform detects hundreds of failed authentication '
            'attempts against multiple employee accounts originating from '
            'the same public IP address. Shortly afterward, one account '
            'authenticates successfully using a commonly reused password '
            'from a previous public breach. Minutes later, the account '
            'attempts to activate a privileged administrative role and '
            'access sensitive financial applications.',
      ),
      LessonSection(
        body:
            'The identity platform identifies the sequence as a '
            'combination of password spraying and credential stuffing. '
            'Based on the elevated risk score, Conditional Access blocks '
            'access, requires password reset, and generates a '
            'high-severity alert in Microsoft Sentinel. SOC analysts '
            'investigate the incident and determine that the account '
            'credentials were compromised, preventing further '
            'unauthorized access.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Enable continuous monitoring of authentication events',
          'Deploy User and Entity Behavior Analytics (UEBA)',
          'Monitor privileged accounts separately from standard user accounts',
          'Enable impossible travel and password spray detection',
          'Require Multi-Factor Authentication for all privileged accounts',
          'Monitor authentication tokens and active user sessions',
          'Integrate identity monitoring with SIEM, EDR, and SOAR platforms',
          'Review identity-related alerts promptly and validate automated responses',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Many successful identity attacks begin with valid '
            'credentials rather than malware. Monitoring authentication '
            'behavior, privilege changes, and access patterns is '
            'essential for detecting compromised accounts before '
            'attackers can establish persistence or access sensitive '
            'resources.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Continuous Access Evaluation & Conditional Access',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Continuous Access Evaluation (CAE)',
        body:
            'Traditionally, once a user successfully authenticated, '
            'access remained valid until the authentication token '
            'expired. This meant that even if an account was compromised '
            'or a device became non-compliant, the user might continue '
            'accessing corporate resources until the session ended.',
      ),
      LessonSection(
        body:
            'Continuous Access Evaluation (CAE) addresses this limitation '
            'by allowing applications and identity providers to reassess '
            'access in near real time when significant security events '
            'occur. Examples of events that can trigger CAE include a '
            'user account being disabled, password changed, Multi-Factor '
            'Authentication (MFA) reset, device marked as non-compliant, '
            'high-risk sign-in detected, privileged role revoked, user '
            'location changing significantly, or account compromise '
            'detected.',
      ),
      LessonSection(
        body:
            'Instead of waiting for a token to expire, CAE enables '
            'applications to immediately re-evaluate the user\'s session '
            'and require reauthentication or terminate access when '
            'necessary. This significantly reduces the time attackers can '
            'use compromised credentials.',
      ),
      LessonSection(
        heading: 'Conditional Access Policies',
        body:
            'Conditional Access is a policy-based security mechanism '
            'that determines whether a user should be granted access to '
            'a resource based on contextual information. Unlike '
            'traditional authentication systems that only verify a '
            'username and password, Conditional Access evaluates '
            'multiple factors before making an access decision.',
      ),
      LessonSection(
        body: 'Common evaluation criteria include:',
        bullets: [
          'User identity',
          'Device compliance',
          'Device ownership',
          'Geographic location',
          'IP address reputation',
          'Risk score',
          'Application being accessed',
          'Authentication strength',
          'Time of access',
        ],
      ),
      LessonSection(
        body: 'Based on these factors, Conditional Access may:',
        bullets: [
          'Allow access',
          'Require Multi-Factor Authentication',
          'Require password reset',
          'Require compliant device',
          'Block access',
          'Restrict session capabilities',
        ],
      ),
      LessonSection(
        body:
            'Organizations often implement Conditional Access to enforce '
            'Zero Trust principles, ensuring that every access request is '
            'evaluated based on current risk.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/conditional_access_platform.jpg',
          caption:
              'Enterprise identity protection platforms evaluate user '
              'identity, device posture, and threat intelligence before '
              'granting access to enterprise applications and notifying '
              'the SOC of high-risk activities.',
        ),
      ),
      LessonSection(
        heading: 'Automated Identity Response',
        body:
            'Manual investigation of every identity alert is not '
            'practical in large enterprises where thousands of '
            'authentication events occur every minute. Modern identity '
            'protection platforms automatically respond to high-risk '
            'events.',
      ),
      LessonSection(
        body: 'Typical automated actions include:',
        bullets: [
          'Blocking authentication attempts',
          'Requiring Multi-Factor Authentication',
          'Forcing password changes',
          'Revoking authentication tokens',
          'Disabling compromised accounts',
          'Isolating risky sessions',
          'Blocking privileged role activation',
          'Creating incidents in SIEM or SOAR platforms',
        ],
      ),
      LessonSection(
        body:
            'Automation enables organizations to contain attacks before '
            'security analysts begin their investigation.',
      ),
      LessonSection(
        heading: 'Identity Protection Platforms',
        body:
            'Identity protection capabilities are available in many '
            'enterprise identity solutions. Common features include '
            'risk-based authentication, impossible travel detection, '
            'password spray detection, breached credential detection, '
            'token protection, session monitoring, UEBA, Conditional '
            'Access, and automated remediation.',
      ),
      LessonSection(
        body:
            'Examples of enterprise platforms include Microsoft Entra ID '
            'Protection, Okta ThreatInsight, Cisco Duo, Ping Identity, '
            'IBM Verify, and SailPoint Identity Security. Although '
            'product implementations differ, they all aim to reduce the '
            'risk of identity compromise through continuous monitoring '
            'and automated response.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Identity Monitoring Metrics & Dashboards',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Identity Monitoring Metrics',
        body:
            'Organizations measure the effectiveness of identity '
            'monitoring programs using operational and security metrics. '
            'Tracking these metrics helps security leaders identify '
            'trends, evaluate security controls, and demonstrate '
            'compliance with organizational policies.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Metric', 'Purpose'],
          tableRows: [
            ['High-Risk Sign-ins', 'Monitor potentially compromised accounts'],
            ['Failed Authentication Attempts', 'Detect brute-force and password spray attacks'],
            ['MFA Success Rate', 'Measure effectiveness of strong authentication'],
            ['Password Spray Detections', 'Identify widespread password guessing attempts'],
            ['Credential Stuffing Incidents', 'Detect reuse of compromised credentials'],
            ['Privileged Account Alerts', 'Monitor administrative account activity'],
            ['Mean Time to Detect (MTTD)', 'Measure detection speed'],
            ['Mean Time to Respond (MTTR)', 'Measure incident response efficiency'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Identity Security Dashboards',
        body:
            'Security teams use centralized dashboards to monitor '
            'identity-related risks in real time. Typical dashboard '
            'information includes active users, high-risk users, blocked '
            'sign-ins, MFA enrollment status, password spray detections, '
            'impossible travel alerts, privileged account activity, '
            'recent policy changes, and identity risk trends.',
      ),
      LessonSection(
        body:
            'These dashboards provide executives, security analysts, and '
            'administrators with visibility into the organization\'s '
            'identity security posture.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/identity_security_dashboard.jpg',
          caption:
              'Identity incidents follow a structured response process '
              'that validates suspicious authentication activity, '
              'contains compromised accounts, restores normal '
              'operations, and improves future detection capabilities.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational healthcare organization uses Microsoft '
            'Entra ID Protection, Microsoft Sentinel, and Defender for '
            'Endpoint to secure more than 40,000 employee identities.',
      ),
      LessonSection(
        body:
            'During routine monitoring, the identity platform detects a '
            'successful sign-in from an unmanaged device using '
            'credentials previously identified in a public data breach. '
            'Continuous Access Evaluation immediately reassesses the '
            'active session, while Conditional Access blocks access to '
            'sensitive healthcare applications because the device is '
            'non-compliant. Simultaneously, the identity protection '
            'platform revokes active tokens, forces a password reset, and '
            'creates a high-severity incident in Microsoft Sentinel.',
      ),
      LessonSection(
        body:
            'SOC analysts review the correlated alerts, confirm the '
            'attempted credential compromise, and verify that automated '
            'response actions successfully prevented unauthorized access '
            'to patient records.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Enforce Multi-Factor Authentication for all users, especially privileged accounts',
          'Implement Conditional Access policies based on user, device, location, and risk',
          'Enable Continuous Access Evaluation where supported',
          'Integrate identity protection with SIEM, EDR, and SOAR platforms',
          'Continuously review privileged account activity',
          'Automate responses to high-confidence identity threats',
          'Monitor identity security metrics regularly',
          'Conduct periodic reviews of authentication policies and risk thresholds',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Identity security should be continuous rather than '
            'event-driven. Even after successful authentication, '
            'organizations should continuously evaluate user sessions, '
            'device compliance, and emerging risks to ensure that access '
            'remains appropriate throughout the session.',
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Enterprise IAM Architecture',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'A Unified Ecosystem, Not Isolated Systems',
        body:
            'Identity and Access Management (IAM) technologies become '
            'most effective when they operate as part of a unified '
            'enterprise architecture rather than as isolated systems. '
            'Modern organizations rarely rely on a single identity '
            'solution. Instead, they integrate multiple components — '
            'including on-premises directory services, cloud identity '
            'providers, authentication protocols, governance platforms, '
            'privileged access management solutions, and security '
            'monitoring tools — to create a centralized identity '
            'ecosystem.',
      ),
      LessonSection(
        body:
            'An enterprise IAM architecture enables organizations to '
            'authenticate users consistently, enforce access policies, '
            'automate identity lifecycle management, and monitor '
            'identity-related threats across hybrid environments. '
            'Whether employees access applications from corporate '
            'offices, home networks, or mobile devices, the IAM '
            'architecture provides a common framework for verifying '
            'identities and controlling access to enterprise resources.',
      ),
      LessonSection(
        heading: 'Understanding Enterprise IAM Architecture',
        body:
            'An Enterprise IAM Architecture is the collection of '
            'technologies, processes, and policies that manage digital '
            'identities and control access to organizational resources. '
            'Rather than maintaining separate user accounts for every '
            'application, the architecture centralizes identity '
            'management through a trusted identity platform that '
            'integrates with business applications, cloud services, and '
            'security systems.',
      ),
      LessonSection(
        body: 'A well-designed IAM architecture provides:',
        bullets: [
          'Centralized authentication',
          'Centralized authorization',
          'Identity lifecycle management',
          'Single Sign-On (SSO)',
          'Multi-Factor Authentication (MFA)',
          'Identity governance',
          'Privileged access management',
          'Identity monitoring',
          'Regulatory compliance',
        ],
      ),
      LessonSection(
        body:
            'By centralizing identity services, organizations reduce '
            'administrative complexity while improving security and user '
            'experience.',
      ),
      LessonSection(
        heading: 'Identity Repository',
        body:
            'The identity repository stores information about users, '
            'groups, devices, and service accounts. Typical identity '
            'data includes username, employee ID, email address, '
            'department, job title, group memberships, assigned roles, '
            'and authentication methods. Common repositories include '
            'Microsoft Active Directory, Microsoft Entra ID, LDAP '
            'directories, and HR information systems. The repository '
            'acts as the authoritative source for digital identities '
            'throughout the organization.',
      ),
      LessonSection(
        heading: 'Identity Provider (IdP)',
        body:
            'The Identity Provider (IdP) authenticates users and issues '
            'security tokens that allow access to trusted applications. '
            'The IdP is responsible for verifying user credentials, '
            'performing Multi-Factor Authentication, enforcing '
            'Conditional Access policies, evaluating user risk, issuing '
            'authentication tokens, and managing user sessions. Because '
            'every authentication request passes through the IdP, it '
            'serves as the central trust authority within the IAM '
            'architecture.',
      ),
      LessonSection(
        heading: 'Authentication Services',
        body:
            'Authentication services verify that users are who they '
            'claim to be before access is granted. Modern authentication '
            'services support password authentication, passwordless '
            'authentication, passkeys, smart cards, biometrics, FIDO2 '
            'security keys, and Multi-Factor Authentication (MFA). '
            'Authentication services often integrate with risk-based '
            'authentication engines to apply additional verification '
            'when suspicious activity is detected.',
      ),
      LessonSection(
        heading: 'Authorization Services',
        body:
            'Once a user\'s identity has been verified, authorization '
            'services determine what resources the user is allowed to '
            'access. Authorization decisions may consider assigned '
            'roles, group memberships, device compliance, user location, '
            'risk score, time of access, and application sensitivity. '
            'Common authorization models include Role-Based Access '
            'Control (RBAC), Attribute-Based Access Control (ABAC), '
            'Mandatory Access Control (MAC), and Discretionary Access '
            'Control (DAC). Authorization ensures that authenticated '
            'users receive only the permissions necessary to perform '
            'their job responsibilities.',
      ),
      LessonSection(
        heading: 'Enterprise Applications',
        body:
            'Enterprise IAM platforms provide centralized authentication '
            'for a wide variety of applications, including Microsoft '
            '365, Salesforce, ServiceNow, SAP, Workday, Oracle '
            'applications, internal web portals, VPN gateways, and cloud '
            'services. Instead of maintaining separate authentication '
            'systems, these applications trust the Identity Provider '
            'through federation protocols such as SAML or OpenID '
            'Connect.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/enterprise_iam_architecture.jpg',
          caption:
              'An enterprise IAM architecture centralizes authentication, '
              'authorization, identity repositories, and security '
              'monitoring to provide consistent access control across '
              'on-premises and cloud environments.',
        ),
      ),
      LessonSection(
        heading: 'Hybrid Identity & Identity Synchronization',
        body:
            'Most organizations today operate in hybrid environments, '
            'where some resources remain on-premises while others are '
            'hosted in the cloud. A hybrid identity architecture '
            'synchronizes identities between on-premises directory '
            'services and cloud identity platforms — for example, Active '
            'Directory manages on-premises resources while Microsoft '
            'Entra ID provides cloud identity services. Identity '
            'synchronization ensures that users have a single digital '
            'identity across both environments, simplifying '
            'administration while supporting hybrid work and cloud '
            'adoption.',
      ),
      LessonSection(
        body:
            'Identity synchronization ensures that identity information '
            'remains consistent across multiple systems. Information '
            'commonly synchronized includes user accounts, password '
            'hashes (where appropriate), group memberships, '
            'organizational units, role assignments, and contact '
            'information. Automated synchronization reduces '
            'administrative effort and minimizes inconsistencies between '
            'identity repositories.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational engineering company maintains Active '
            'Directory for on-premises systems while using Microsoft '
            'Entra ID for Microsoft 365, Azure, and several SaaS '
            'applications. Employees authenticate through Microsoft '
            'Entra ID using Single Sign-On and Multi-Factor '
            'Authentication. Identity information is synchronized from '
            'Active Directory, ensuring that changes such as new '
            'employees, department transfers, or account deactivations '
            'are reflected consistently across both on-premises and '
            'cloud resources.',
      ),
      LessonSection(
        body:
            'Security events generated by the Identity Provider are '
            'forwarded to Microsoft Sentinel, where SOC analysts monitor '
            'authentication activity and investigate identity-related '
            'threats.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain a centralized identity repository',
          'Integrate cloud and on-premises identity systems securely',
          'Use federation protocols such as SAML and OpenID Connect',
          'Enforce Multi-Factor Authentication for all users',
          'Synchronize identity data automatically',
          'Monitor authentication events continuously',
          'Apply the principle of least privilege for authorization decisions',
          'Regularly review identity architecture to support evolving business requirements',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'A centralized IAM architecture reduces complexity and '
            'improves security, but it also makes the Identity Provider '
            'a critical asset. Protect identity infrastructure with '
            'strong authentication, continuous monitoring, privileged '
            'access management, and regular security assessments.',
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Active Directory, Microsoft Entra ID & Hybrid Identity',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Active Directory Domain Services (AD DS)',
        body:
            'Active Directory Domain Services (AD DS) is Microsoft\'s '
            'on-premises directory service that stores and manages '
            'information about users, computers, groups, printers, and '
            'other network resources within a Windows domain. Since its '
            'introduction with Windows 2000 Server, Active Directory has '
            'become one of the most widely deployed enterprise identity '
            'solutions.',
      ),
      LessonSection(
        body:
            'AD DS provides several essential services: centralized user '
            'authentication, computer authentication, group management, '
            'policy enforcement, access control, directory services, and '
            'domain management. Organizations use Active Directory to '
            'ensure that users can authenticate once and securely access '
            'authorized resources across the corporate network.',
      ),
      LessonSection(
        heading: 'Domain & Domain Controller (DC)',
        body:
            'A domain is a logical boundary that contains users, '
            'computers, and other directory objects sharing a common '
            'security database. Each domain maintains its own '
            'authentication and authorization policies. A Domain '
            'Controller is a server responsible for authenticating users '
            'and maintaining the Active Directory database. '
            'Responsibilities include user authentication, password '
            'validation, group policy processing, directory replication, '
            'and Kerberos ticket issuance. Most enterprises deploy '
            'multiple Domain Controllers to provide redundancy and high '
            'availability.',
      ),
      LessonSection(
        heading: 'Organizational Units (OUs) & Group Policy',
        body:
            'Organizational Units (OUs) are containers used to organize '
            'directory objects. Administrators commonly create OUs based '
            'on departments, geographic locations, business units, and '
            'device types. OUs simplify administrative delegation and '
            'Group Policy management.',
      ),
      LessonSection(
        body:
            'Group Policy enables administrators to centrally configure '
            'security settings and operating system behavior for users '
            'and computers. Common policy settings include password '
            'policies, firewall configuration, software installation, '
            'USB device restrictions, security baselines, and desktop '
            'configuration. Group Policy helps ensure consistent '
            'security configurations across enterprise endpoints.',
      ),
      LessonSection(
        heading: 'Microsoft Entra ID',
        body:
            'Microsoft Entra ID (formerly Azure Active Directory) is '
            'Microsoft\'s cloud-based Identity and Access Management '
            'platform. Unlike Active Directory, which primarily manages '
            'on-premises resources, Microsoft Entra ID provides identity '
            'services for cloud applications, Software as a Service '
            '(SaaS) platforms, and hybrid environments.',
      ),
      LessonSection(
        body:
            'Microsoft Entra ID supports cloud authentication, Single '
            'Sign-On (SSO), Multi-Factor Authentication (MFA), '
            'Conditional Access, Identity Protection, self-service '
            'password reset, external identities, and application '
            'federation. Because it is cloud-native, Microsoft Entra ID '
            'enables secure access regardless of user location or '
            'device.',
      ),
      LessonSection(
        heading: 'Active Directory vs Microsoft Entra ID',
        body:
            'Although Active Directory and Microsoft Entra ID work '
            'together in many organizations, they serve different '
            'purposes. Active Directory and Microsoft Entra ID '
            'complement one another by providing identity services for '
            'on-premises and cloud environments.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Active Directory Domain Services', 'Microsoft Entra ID'],
          tableRows: [
            ['Primary Deployment', 'On-premises', 'Cloud'],
            ['Authentication', 'Kerberos, NTLM', 'Modern authentication (OAuth 2.0, OpenID Connect, SAML)'],
            ['Device Management', 'Domain Join', 'Microsoft Entra Join and Microsoft Entra Registered'],
            ['Policy Management', 'Group Policy', 'Conditional Access'],
            ['Primary Purpose', 'Manage on-premises resources', 'Manage cloud identities and applications'],
            ['Typical Resources', 'File servers, printers, Windows domains', 'Microsoft 365, SaaS applications, Azure services'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Hybrid Identity',
        body:
            'A hybrid identity architecture combines on-premises Active '
            'Directory with Microsoft Entra ID, allowing users to '
            'maintain a single identity across both environments. In a '
            'hybrid deployment, user accounts are created in Active '
            'Directory, identity information is synchronized with '
            'Microsoft Entra ID, users authenticate using the same '
            'corporate identity, and access policies apply consistently '
            'across on-premises and cloud applications. Hybrid identity '
            'enables organizations to modernize gradually without '
            'replacing existing infrastructure.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/hybrid_identity_sync.jpg',
          caption:
              'Hybrid identity synchronizes identities between '
              'on-premises Active Directory and Microsoft Entra ID, '
              'enabling users to access both local and cloud resources '
              'using a unified digital identity.',
        ),
      ),
      LessonSection(
        heading: 'Identity Synchronization',
        body:
            'Identity synchronization ensures that identity information '
            'remains consistent across multiple identity platforms. '
            'Synchronization typically includes user accounts, group '
            'memberships, password hashes (when configured), contact '
            'information, and organizational attributes. Modern '
            'synchronization solutions automatically replicate approved '
            'identity changes from on-premises directories to cloud '
            'identity platforms. This automation reduces administrative '
            'effort while minimizing inconsistencies and configuration '
            'errors.',
      ),
      LessonSection(
        heading: 'Zero Trust Identity',
        body:
            'Traditional security models assumed that users inside the '
            'corporate network could generally be trusted. Modern '
            'organizations instead adopt a Zero Trust approach, based on '
            'the principle: "Never trust, always verify." Zero Trust '
            'Identity requires every authentication request to be '
            'evaluated continuously using contextual information.',
      ),
      LessonSection(
        body: 'Factors considered include:',
        bullets: [
          'User identity',
          'Device compliance',
          'User location',
          'Risk score',
          'Application sensitivity',
          'Authentication strength',
          'Threat intelligence',
        ],
      ),
      LessonSection(
        body:
            'Access decisions are based on current risk rather than '
            'network location alone.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/zero_trust_identity.jpg',
          caption:
              'Zero Trust identity continuously verifies users, devices, '
              'and contextual risk before granting access to enterprise '
              'applications.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational logistics company maintains Active '
            'Directory Domain Services for on-premises servers and '
            'Microsoft Entra ID for Microsoft 365, Azure resources, and '
            'cloud-based business applications. Identity synchronization '
            'ensures that employee accounts, group memberships, and '
            'organizational information remain consistent across both '
            'environments.',
      ),
      LessonSection(
        body:
            'When an employee signs in remotely, Microsoft Entra ID '
            'performs Multi-Factor Authentication and evaluates '
            'Conditional Access policies based on device compliance and '
            'sign-in risk. If the authentication meets the organization\'s '
            'Zero Trust requirements, the employee receives seamless '
            'access to both cloud applications and on-premises '
            'resources.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain a single authoritative identity source',
          'Synchronize identities automatically between on-premises and cloud environments',
          'Protect privileged accounts with Multi-Factor Authentication',
          'Implement Conditional Access for cloud resources',
          'Deploy multiple Domain Controllers for redundancy',
          'Regularly review synchronization health and identity data quality',
          'Apply Zero Trust principles to every authentication request',
          'Continuously monitor authentication and synchronization events',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Hybrid identity environments increase flexibility but also '
            'expand the attack surface. Protect synchronization services, '
            'monitor identity changes, and apply consistent security '
            'policies across both on-premises and cloud identity '
            'platforms.',
      ),
    ],
  ),

  // 13 ---------------------------------------------------------------------
  Lesson(
    title: 'IAM Integration, Governance & Resilience',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'IAM Integration with SIEM',
        body:
            'Identity systems generate large volumes of security-related '
            'events, including user authentications, privilege changes, '
            'password resets, account lockouts, and administrative '
            'actions. Individually, these events may appear routine, but '
            'when correlated with endpoint, network, and cloud '
            'telemetry, they provide valuable insight into potential '
            'security incidents. To achieve centralized visibility, '
            'organizations forward identity logs to a Security '
            'Information and Event Management (SIEM) platform.',
      ),
      LessonSection(
        body: 'Common IAM events sent to a SIEM include:',
        bullets: [
          'Successful and failed logins',
          'Multi-Factor Authentication events',
          'Password changes',
          'Account lockouts',
          'Privileged role assignments',
          'User provisioning and deprovisioning',
          'Conditional Access policy evaluations',
          'Risk-based authentication events',
          'Identity Protection alerts',
        ],
      ),
      LessonSection(
        body:
            'The SIEM normalizes these events, correlates them with logs '
            'from other security systems, and generates alerts when '
            'suspicious activity is detected.',
      ),
      LessonSection(
        heading: 'IAM Integration with SOAR',
        body:
            'While SIEM platforms focus on collecting and analyzing '
            'security events, Security Orchestration, Automation, and '
            'Response (SOAR) platforms automate security workflows. IAM '
            'integration with SOAR enables organizations to respond '
            'rapidly to identity-related threats without requiring '
            'manual intervention.',
      ),
      LessonSection(
        body: 'Examples of automated SOAR actions include:',
        bullets: [
          'Disabling compromised user accounts',
          'Revoking authentication tokens',
          'Forcing password resets',
          'Isolating high-risk user sessions',
          'Creating incident tickets',
          'Notifying security teams',
          'Initiating approval workflows for privileged access',
        ],
      ),
      LessonSection(
        body:
            'Automation reduces response time and helps contain identity '
            'attacks before they spread.',
      ),
      LessonSection(
        heading: 'Identity Governance Integration',
        body:
            'Enterprise IAM architectures also integrate with Identity '
            'Governance and Administration (IGA) platforms. These '
            'integrations support automated provisioning, automated '
            'deprovisioning, Joiner-Mover-Leaver (JML) processes, '
            'periodic access reviews, role management, Separation of '
            'Duties (SoD) validation, and compliance reporting.',
      ),
      LessonSection(
        body:
            'Identity governance ensures that access rights remain '
            'appropriate throughout the user\'s lifecycle and helps '
            'organizations meet regulatory requirements.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/iam_governance_integration.jpg',
          caption:
              'Enterprise IAM integrates with governance, monitoring, and '
              'automation platforms to provide secure authentication, '
              'centralized monitoring, and rapid response to '
              'identity-related threats.',
        ),
      ),
      LessonSection(
        heading: 'High Availability and Resilience',
        body:
            'Identity services are critical infrastructure components. '
            'If authentication services become unavailable, employees '
            'may lose access to essential business applications. To '
            'minimize downtime, organizations implement high availability '
            '(HA) and resilience measures.',
      ),
      LessonSection(
        body: 'Common approaches include:',
        bullets: [
          'Multiple Domain Controllers',
          'Redundant Identity Providers',
          'Geographic redundancy',
          'Load balancing',
          'Database replication',
          'Backup authentication methods',
          'Regular disaster recovery testing',
        ],
      ),
      LessonSection(
        body:
            'These measures ensure that identity services remain '
            'available even during hardware failures, software issues, '
            'or regional outages.',
      ),
      LessonSection(
        heading: 'Business Continuity for IAM',
        body:
            'Business continuity planning ensures that identity services '
            'remain operational during disruptive events such as '
            'cyberattacks, natural disasters, or infrastructure failures. '
            'Typical IAM continuity strategies include backup identity '
            'repositories, offline administrative accounts, emergency '
            'access procedures, cloud-based failover services, regular '
            'backup verification, and recovery testing.',
      ),
      LessonSection(
        body:
            'Organizations should document recovery procedures and '
            'regularly test failover mechanisms to ensure that '
            'authentication services can be restored within acceptable '
            'recovery objectives.',
      ),
      LessonSection(
        heading: 'Identity Architecture Security Best Practices',
        body:
            'A secure IAM architecture combines preventive, detective, '
            'and corrective controls.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Best Practice', 'Security Benefit'],
          tableRows: [
            ['Centralize identity management', 'Simplifies administration and improves consistency'],
            ['Enforce Multi-Factor Authentication', 'Reduces credential compromise risk'],
            ['Implement Conditional Access', 'Applies adaptive security controls'],
            ['Apply least privilege', 'Limits unnecessary access'],
            ['Conduct periodic access reviews', 'Removes excessive permissions'],
            ['Integrate IAM with SIEM', 'Improves visibility and threat detection'],
            ['Automate responses with SOAR', 'Reduces response time'],
            ['Deploy redundant identity infrastructure', 'Improves availability and resilience'],
            ['Protect synchronization services', 'Prevents identity compromise across environments'],
            ['Test disaster recovery procedures', 'Ensures rapid restoration of authentication services'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global manufacturing company operates a hybrid identity '
            'environment using Active Directory Domain Services, '
            'Microsoft Entra ID, Microsoft Sentinel, and a SOAR platform. '
            'When an employee account exhibits suspicious activity, '
            'Microsoft Entra ID Protection identifies the sign-in as high '
            'risk and forwards the alert to Microsoft Sentinel. The SIEM '
            'correlates the event with endpoint telemetry from Microsoft '
            'Defender for Endpoint and determines that the associated '
            'device is communicating with a known malicious domain.',
      ),
      LessonSection(
        body:
            'The SOAR platform automatically revokes authentication '
            'tokens, disables the compromised account, creates an '
            'incident ticket, and notifies the Security Operations '
            'Center. After the incident is investigated and resolved, '
            'identity governance workflows verify that privileged access '
            'remains appropriate before restoring the account. This '
            'integrated architecture minimizes response time while '
            'maintaining business continuity and ensuring that identity '
            'controls remain effective throughout the incident '
            'lifecycle.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/idfed/enterprise_identity_ecosystem.jpg',
          caption:
              'An enterprise identity ecosystem connects authentication, '
              'governance, monitoring, automation, and business '
              'applications through a centralized Identity Provider.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Centralize authentication through a trusted Identity Provider',
          'Synchronize identities securely between on-premises and cloud environments',
          'Integrate IAM with SIEM and SOAR platforms',
          'Deploy redundant identity services to improve availability',
          'Monitor privileged accounts continuously',
          'Review identity governance policies regularly',
          'Automate high-confidence response actions where appropriate',
          'Test business continuity and disaster recovery plans periodically',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Identity systems are among the most critical components of '
            'an enterprise security architecture. Protect identity '
            'infrastructure with strong authentication, continuous '
            'monitoring, redundancy, and regular governance reviews to '
            'ensure both security and operational resilience.',
      ),
    ],
  ),

  // 14 — Practice Quiz -------------------------------------------------------
  Lesson(
    title: 'Practice Quiz: Identity Federation & SSO',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 20,
    quiz: [
      QuizQuestion(
        question: 'What is the core benefit of Single Sign-On (SSO) for end users?',
        options: [
          'It eliminates the need for any authentication whatsoever',
          'Users log in once and gain access to multiple independent applications without repeated authentication prompts',
          'It replaces the need for a centralized Identity Provider',
          'It only works for on-premises applications',
        ],
        correctIndex: 1,
        explanation: 'SSO allows a user to authenticate once with a centralized identity provider and then access multiple trusted applications without re-entering credentials.',
      ),
      QuizQuestion(
        question: 'What is the key distinction between an Identity Provider (IdP) and a Service Provider (SP)?',
        options: [
          'They are interchangeable terms for the same system',
          'The IdP authenticates users and issues tokens; the SP relies on the IdP for authentication and grants access based on trust',
          'The SP always authenticates users directly with passwords',
          'The IdP only works with SAML, never with other protocols',
        ],
        correctIndex: 1,
        explanation: 'The Identity Provider authenticates the user and issues tokens/assertions; the Service Provider trusts the IdP\'s decision rather than authenticating the user itself.',
      ),
      QuizQuestion(
        question: 'How is trust established between an Identity Provider and a Service Provider in a federation?',
        options: [
          'By sharing the same plaintext password',
          'Using digital certificates, cryptographic signatures, and metadata exchange',
          'By placing both systems on the same physical network',
          'Trust is not required in federation',
        ],
        correctIndex: 1,
        explanation: 'Federation trust relies on cryptographic verification — digital certificates, signatures, and metadata exchange — rather than shared passwords.',
      ),
      QuizQuestion(
        question: 'What is a SAML assertion?',
        options: [
          'A plaintext password sent between applications',
          'A digitally signed XML document generated by the IdP that serves as proof the user has already been authenticated',
          'An encrypted database of all enterprise passwords',
          'A network firewall rule',
        ],
        correctIndex: 1,
        explanation: 'A SAML assertion is a digitally signed XML document generated by the Identity Provider after successful authentication, serving as proof of the user\'s authenticated identity.',
      ),
      QuizQuestion(
        question: 'In a typical SAML authentication flow, what happens immediately after the Service Provider detects an unauthenticated user?',
        options: [
          'The user\'s account is permanently locked',
          'The Service Provider redirects the browser to the trusted Identity Provider',
          'The application immediately grants full access',
          'The user is asked to create a new account',
        ],
        correctIndex: 1,
        explanation: 'Step 2 of the SAML flow is redirecting the browser to the Identity Provider so authentication can occur there rather than at the Service Provider.',
      ),
      QuizQuestion(
        question: 'What is the primary difference between OAuth 2.0 and SAML?',
        options: [
          'They are functionally identical',
          'OAuth 2.0 is primarily an authorization protocol, while SAML is used for authentication and federation',
          'OAuth 2.0 only works with XML, and SAML only works with JSON',
          'SAML cannot be used in enterprise environments',
        ],
        correctIndex: 1,
        explanation: 'OAuth 2.0 is primarily an authorization framework — granting limited access to resources — while SAML is used for authentication and federation.',
      ),
      QuizQuestion(
        question: 'In OAuth 2.0, what role does the "Authorization Server" play?',
        options: [
          'It hosts the protected resources being requested',
          'It authenticates the user and issues access tokens',
          'It is the application requesting access on the user\'s behalf',
          'It is the end user who owns the data',
        ],
        correctIndex: 1,
        explanation: 'The Authorization Server is responsible for authenticating the user and issuing access tokens; the Resource Server (a separate component) hosts the protected data.',
      ),
      QuizQuestion(
        question: 'How does OpenID Connect (OIDC) relate to OAuth 2.0?',
        options: [
          'OIDC is completely unrelated to OAuth 2.0',
          'OIDC is an authentication layer built on top of OAuth 2.0, adding an ID Token to verify user identity',
          'OIDC replaces OAuth 2.0 entirely',
          'OAuth 2.0 is built on top of OIDC',
        ],
        correctIndex: 1,
        explanation: 'OpenID Connect is an authentication protocol built on top of OAuth 2.0 — while OAuth 2.0 determines what an app can access, OIDC determines who the user is via an ID Token.',
      ),
      QuizQuestion(
        question: 'What advantage does Kerberos provide over transmitting passwords directly across a network?',
        options: [
          'Kerberos is slower but more user-friendly',
          'Kerberos uses encrypted tickets, eliminating the need to repeatedly transmit passwords across the network',
          'Kerberos requires no authentication at all',
          'Kerberos only works with cloud applications',
        ],
        correctIndex: 1,
        explanation: 'Kerberos provides secure mutual authentication using secret-key cryptography and encrypted tickets, eliminating the need to transmit passwords across the network.',
      ),
      QuizQuestion(
        question: 'What is the correct role of LDAP in enterprise identity management?',
        options: [
          'LDAP is an authentication protocol like Kerberos',
          'LDAP provides access to directory information such as user accounts and group memberships, but is not itself an authentication protocol',
          'LDAP replaces the need for an Identity Provider',
          'LDAP is only used for encrypting data at rest',
        ],
        correctIndex: 1,
        explanation: 'LDAP is a protocol for querying and managing directory services (users, groups, OUs) — it is not itself an authentication protocol like Kerberos.',
      ),
      QuizQuestion(
        question: 'Why might a password spray attack succeed even with account lockout policies in place?',
        options: [
          'Lockout policies are always disabled by default',
          'Because each targeted account only receives a few failed attempts, staying under lockout thresholds tuned for single-account brute-force attacks',
          'Password spraying always uses the correct password on the first try',
          'Lockout policies only apply to administrator accounts',
        ],
        correctIndex: 1,
        explanation: 'Password spraying spreads a small number of guesses across many accounts, so each individual account rarely triggers a lockout threshold designed to catch many attempts against one account.',
      ),
      QuizQuestion(
        question: 'What distinguishes credential stuffing from a traditional brute-force attack?',
        options: [
          'Credential stuffing uses usernames and passwords stolen from previous breaches rather than guessing new combinations',
          'Credential stuffing only targets a single specific account',
          'Credential stuffing never involves automation',
          'There is no meaningful difference between the two',
        ],
        correctIndex: 0,
        explanation: 'Credential stuffing reuses usernames and passwords stolen in prior data breaches, relying on the fact that many users reuse the same passwords across different services.',
      ),
      QuizQuestion(
        question: 'What does User and Entity Behavior Analytics (UEBA) use to detect suspicious activity?',
        options: [
          'Only the success or failure of a login attempt',
          'Statistical analysis, machine learning, and behavioral baselines compared against current activity',
          'A fixed list of banned IP addresses updated once a year',
          'Manual review of every single login by a human analyst',
        ],
        correctIndex: 1,
        explanation: 'UEBA uses statistical analysis, machine learning, and behavioral modeling to build a baseline of normal activity, then flags significant deviations from that baseline.',
      ),
      QuizQuestion(
        question: 'What is "impossible travel" in the context of identity monitoring?',
        options: [
          'A user traveling to a country with no internet access',
          'The same user account authenticating successfully from two geographically distant locations in a time period that makes legitimate travel impossible',
          'A VPN connection failing to establish',
          'An employee requesting international travel approval',
        ],
        correctIndex: 1,
        explanation: 'Impossible travel occurs when the same account logs in from two locations so far apart that legitimate travel between them in that timeframe is not physically possible.',
      ),
      QuizQuestion(
        question: 'What does Identity Threat Detection and Response (ITDR) specifically focus on, as distinct from EDR?',
        options: [
          'ITDR focuses on physical building security',
          'ITDR focuses on identities, credentials, authentication systems, and privileged accounts, while EDR protects endpoint devices',
          'ITDR and EDR are the exact same technology',
          'ITDR only applies to email security',
        ],
        correctIndex: 1,
        explanation: 'While EDR protects endpoint devices, ITDR is specifically focused on identity-based attacks — credentials, authentication systems, and privileged accounts.',
      ),
      QuizQuestion(
        question: 'What problem does Continuous Access Evaluation (CAE) solve compared to traditional token-based access?',
        options: [
          'It eliminates the need for any tokens at all',
          'It allows near real-time reassessment of access when a significant security event occurs, instead of waiting for the token to expire',
          'It makes tokens last indefinitely without expiration',
          'It only applies to on-premises Active Directory',
        ],
        correctIndex: 1,
        explanation: 'CAE allows applications and identity providers to reassess access in near real time when events like account disablement or high-risk sign-in occur, rather than waiting for the token to naturally expire.',
      ),
      QuizQuestion(
        question: 'Which of the following is a factor that Conditional Access commonly evaluates before granting access?',
        options: [
          'Only the username, nothing else',
          'Device compliance, geographic location, risk score, and authentication strength, among other contextual factors',
          'The physical color of the user\'s laptop',
          'The user\'s favorite web browser',
        ],
        correctIndex: 1,
        explanation: 'Conditional Access evaluates multiple contextual factors — including device compliance, location, IP reputation, risk score, and authentication strength — before making an access decision.',
      ),
      QuizQuestion(
        question: 'What is the main difference between Active Directory Domain Services (AD DS) and Microsoft Entra ID?',
        options: [
          'They are identical products with different names',
          'AD DS primarily manages on-premises resources using Kerberos/NTLM, while Microsoft Entra ID is cloud-based and supports modern authentication like OAuth 2.0 and SAML',
          'Microsoft Entra ID is only used for physical security',
          'AD DS cannot be used with any Microsoft product',
        ],
        correctIndex: 1,
        explanation: 'AD DS is an on-premises directory service using Kerberos/NTLM, while Microsoft Entra ID is a cloud-based identity platform supporting modern authentication protocols like OAuth 2.0, OIDC, and SAML.',
      ),
      QuizQuestion(
        question: 'What does a "hybrid identity" architecture achieve for an organization?',
        options: [
          'It eliminates the need for any cloud services',
          'It synchronizes identities between on-premises Active Directory and cloud platforms like Microsoft Entra ID, giving users a single identity across both environments',
          'It requires users to maintain two completely separate sets of credentials',
          'It only works for organizations with no on-premises infrastructure',
        ],
        correctIndex: 1,
        explanation: 'Hybrid identity synchronizes on-premises Active Directory with cloud identity platforms like Microsoft Entra ID, giving users a single, consistent identity across both environments.',
      ),
      QuizQuestion(
        question: 'What does the Zero Trust principle "Never trust, always verify" mean for identity systems?',
        options: [
          'Users inside the corporate network are automatically trusted without further checks',
          'Every authentication request is evaluated continuously using contextual information like device compliance, location, and risk, rather than assuming trust based on network location',
          'Verification only happens once, at the very first login ever',
          'Zero Trust means disabling all authentication requirements',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust Identity requires every access request to be continuously evaluated using contextual factors, rather than assuming a user is trustworthy simply because they are on the internal network.',
      ),
      QuizQuestion(
        question: 'Why do organizations forward identity events to a SIEM platform?',
        options: [
          'To permanently delete all authentication logs',
          'To centralize and correlate identity events with endpoint, network, and cloud telemetry, enabling detection of security incidents',
          'SIEM platforms have no relationship to identity data',
          'To replace the need for an Identity Provider',
        ],
        correctIndex: 1,
        explanation: 'Forwarding identity logs to a SIEM enables correlation with other telemetry sources, providing the visibility needed to detect security incidents that individual events might not reveal alone.',
      ),
      QuizQuestion(
        question: 'What is a key difference between SIEM and SOAR in the context of IAM integration?',
        options: [
          'They are the exact same type of platform',
          'SIEM focuses on collecting and analyzing security events, while SOAR automates the response workflows to those events',
          'SOAR only works with SAML, and SIEM only works with OAuth',
          'SIEM automates responses, and SOAR only collects logs',
        ],
        correctIndex: 1,
        explanation: 'SIEM platforms focus on collecting and analyzing security events, while SOAR platforms automate the security response workflows that follow — such as disabling accounts or revoking tokens.',
      ),
      QuizQuestion(
        question: 'What does Identity Governance and Administration (IGA) integration typically support?',
        options: [
          'Only password resets',
          'Automated provisioning/deprovisioning, Joiner-Mover-Leaver processes, periodic access reviews, and Separation of Duties validation',
          'Physical badge printing',
          'Network cable management',
        ],
        correctIndex: 1,
        explanation: 'IGA integration supports automated provisioning and deprovisioning, JML lifecycle processes, periodic access reviews, role management, and Separation of Duties validation.',
      ),
      QuizQuestion(
        question: 'Why is high availability important for identity infrastructure specifically?',
        options: [
          'Identity infrastructure is rarely used and downtime has no impact',
          'If authentication services become unavailable, employees may lose access to essential business applications entirely',
          'High availability is only relevant for database servers, not identity systems',
          'It has no relationship to business continuity',
        ],
        correctIndex: 1,
        explanation: 'Identity services are critical infrastructure — if they go down, employees may be unable to authenticate to any connected application, making HA and resilience measures essential.',
      ),
      QuizQuestion(
        question: 'Why is protecting the Identity Provider (IdP) itself so critical in an SSO/federation architecture?',
        options: [
          'The IdP has no special significance compared to any other application',
          'Because compromising the IdP could affect access to every connected enterprise application, since it is the central trust authority',
          'The IdP only handles cosmetic branding, not security',
          'IdPs cannot be targeted by attackers',
        ],
        correctIndex: 1,
        explanation: 'Because the IdP is the central authority that every Service Provider trusts, compromising it could give an attacker access to every connected application at once.',
      ),
    ],
  ),
];
