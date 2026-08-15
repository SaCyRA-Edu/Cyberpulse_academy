import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> cloudSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Cloud Security & Cloud Computing',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'A Fundamental Component of Modern IT',
        body:
            'Cloud computing has become a fundamental component of '
            'modern information technology. Organizations of all sizes '
            'use cloud services to host applications, store data, run '
            'business operations, and deliver services to customers. '
            'Instead of purchasing and maintaining their own physical '
            'infrastructure, organizations can obtain computing '
            'resources from cloud service providers whenever they are '
            'needed.',
      ),
      LessonSection(
        heading: 'What Is Cloud Security?',
        body:
            'As organizations increasingly rely on cloud platforms, '
            'protecting cloud-based resources has become one of the '
            'most important responsibilities of cybersecurity '
            'professionals. Cloud Security is the practice of '
            'protecting cloud infrastructure, applications, data, '
            'identities, and services against unauthorized access, '
            'cyberattacks, accidental data exposure, and operational '
            'failures. Cloud security combines technology, policies, '
            'processes, and security controls to ensure that cloud '
            'resources remain confidential, accurate, and available '
            'while supporting business operations.',
      ),
      LessonSection(
        heading: 'What Is Cloud Computing?',
        body:
            'Cloud computing is the on-demand delivery of computing '
            'services over the Internet. These services include '
            'computing power, storage, networking, databases, software, '
            'analytics, and artificial intelligence. Rather than '
            'purchasing physical servers and networking equipment, '
            'organizations rent these resources from cloud providers '
            'and pay only for the resources they consume. Cloud '
            'computing enables organizations to rapidly deploy '
            'applications, expand services, and support users worldwide '
            'without building large data centers.',
        bullets: [
          'Hosting company websites',
          'Storing business documents',
          'Running virtual servers',
          'Managing customer databases',
          'Delivering email services',
          'Performing data analytics',
          'Supporting disaster recovery',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_computing_architecture.jpg',
          caption: 'Basic cloud computing architecture — users access provider-managed resources over the Internet.',
        ),
      ),
      LessonSection(
        heading: 'Why Organizations Adopt Cloud Computing',
        body:
            'Organizations adopt cloud computing because it provides '
            'flexibility, scalability, and operational efficiency while '
            'reducing the need to manage physical infrastructure.',
      ),
      LessonSection(
        heading: 'Scalability, Cost Efficiency & Faster Deployment',
        body:
            'Cloud resources can be increased or reduced according to '
            'business demand — for example, an online retailer can '
            'automatically allocate additional computing resources '
            'during a festival sale and reduce them afterward. '
            'Organizations avoid large upfront investments in hardware '
            'and data centers, paying only for the resources they use, '
            'which reduces capital expenditure while improving '
            'operational flexibility. Cloud infrastructure can often be '
            'deployed within minutes instead of the days or weeks '
            'required for purchasing and installing physical hardware.',
      ),
      LessonSection(
        heading: 'High Availability, Business Continuity & Global Access',
        body:
            'Cloud providers operate multiple geographically '
            'distributed data centers that improve service availability '
            'and reduce downtime. Cloud services simplify backup and '
            'disaster recovery by storing data across multiple '
            'locations and providing recovery options when failures '
            'occur. Employees can securely access cloud services from '
            'different geographic locations using Internet connectivity '
            'and appropriate authentication.',
      ),
      LessonSection(
        heading: 'Benefits of Cloud Computing',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Benefit', 'Description'],
          tableRows: [
            ['Scalability', 'Resources expand or shrink based on demand'],
            ['Cost Efficiency', 'Pay only for consumed resources'],
            ['High Availability', 'Improved service reliability'],
            ['Faster Deployment', 'Rapid provisioning of infrastructure'],
            ['Business Continuity', 'Supports backup and disaster recovery'],
            ['Global Accessibility', 'Secure access from multiple locations'],
          ],
        ),
      ),
      LessonSection(
        heading: 'What Cloud Security Covers',
        body: 'Cloud security covers every layer of a cloud environment, including:',
        bullets: [
          'Cloud infrastructure',
          'Virtual machines',
          'Containers',
          'Applications',
          'Storage',
          'Databases',
          'Networks',
          'User identities',
          'APIs',
          'Administrative interfaces',
        ],
      ),
      LessonSection(
        heading: 'Grounded in the Same Fundamental Principles',
        body:
            'The objective is to ensure that cloud resources remain '
            'secure while allowing authorized users to access them '
            'efficiently. Cloud security is based on the same '
            'fundamental security principles used throughout '
            'cybersecurity: Confidentiality (prevent unauthorized '
            'disclosure of information), Integrity (ensure information '
            'is accurate and has not been altered), and Availability '
            '(ensure systems and services remain accessible when '
            'required).',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/what_is_cloud_security.jpg',
          caption: 'Cloud security spans identity, data, network, application, monitoring, and compliance domains simultaneously.',
        ),
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud Security Objectives, Shared Responsibility & Common Risks',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Cloud Security Objectives',
        body:
            'Cloud security focuses on protecting business operations '
            'while minimizing security risks. The primary objectives '
            'include protecting data, securing user identities, '
            'securing applications, monitoring cloud resources, and '
            'ensuring compliance.',
      ),
      LessonSection(
        heading: 'Protecting Data & Securing Identities',
        body:
            'Sensitive information stored in cloud environments should '
            'be protected from unauthorized access, accidental '
            'deletion, and data breaches using encryption, access '
            'control, backup, and data classification. Only authorized '
            'users should have access to cloud resources, achieved '
            'through Multi-Factor Authentication (MFA), strong password '
            'policies, Identity and Access Management (IAM), and '
            'Role-Based Access Control (RBAC).',
      ),
      LessonSection(
        heading: 'Securing Applications & Monitoring Resources',
        body:
            'Cloud-hosted applications should be protected against '
            'common attacks such as SQL Injection, Cross-Site Scripting '
            '(XSS), broken authentication, and API abuse — secure '
            'software development and regular vulnerability assessments '
            'help reduce these risks. Continuous monitoring helps '
            'organizations detect unauthorized access attempts, '
            'configuration changes, suspicious user activity, malware '
            'infections, and data exfiltration, generating alerts that '
            'support timely incident response.',
      ),
      LessonSection(
        heading: 'Ensuring Compliance',
        body:
            'Many industries must comply with regulatory requirements '
            'governing the protection of sensitive information. Cloud '
            'security controls help organizations satisfy compliance '
            'requirements through audit logging, encryption, access '
            'controls, security assessments, and data retention '
            'policies.',
      ),
      LessonSection(
        heading: 'The Shared Responsibility Model',
        body:
            'One of the most important concepts in cloud security is '
            'the Shared Responsibility Model. Many organizations '
            'mistakenly assume that once data is moved to the cloud, '
            'the cloud provider becomes responsible for all aspects of '
            'security. In reality, security responsibilities are '
            'divided between the cloud service provider and the '
            'customer. The exact division depends on the cloud service '
            'model (IaaS, PaaS, or SaaS), but the fundamental principle '
            'remains the same: the provider secures the cloud '
            'infrastructure, while the customer secures what they '
            'deploy and manage within the cloud.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/shared_responsibility_model.jpg',
          caption: 'The Shared Responsibility Model divides security obligations between the cloud provider and the customer.',
        ),
      ),
      LessonSection(
        heading: 'Provider Responsibilities vs. Customer Responsibilities',
        bullets: [
          'Cloud Provider — physical data centers, physical servers, storage hardware, networking equipment, hypervisors, power and cooling systems, physical access controls',
          'Customer — user accounts, identity management, data stored in the cloud, virtual machine configurations, operating systems (where applicable), applications, access permissions, security monitoring, regulatory compliance',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Cloud Provider Secures', 'Customer Secures'],
          tableRows: [
            ['Physical Security', 'Users'],
            ['Servers', 'Applications'],
            ['Storage', 'Data'],
            ['Networking', 'Identity'],
            ['Hypervisor', 'Configurations & Access Control'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Common Cloud Security Risks',
        bullets: [
          'Misconfigured Cloud Resources — incorrectly configured storage accounts, security groups, or virtual machines can expose sensitive information to unauthorized users',
          'Weak Identity Management — poor password practices, excessive privileges, or the absence of MFA can allow attackers to compromise cloud accounts',
          'Data Breaches — sensitive information may be exposed due to compromised credentials, insecure storage configurations, or application vulnerabilities',
          'Insecure APIs — weak authentication or poor API security can provide attackers with unauthorized access to cloud resources',
          'Insider Threats — employees, contractors, or administrators with excessive privileges may intentionally or unintentionally expose sensitive data',
          'Lack of Visibility — organizations using multiple cloud platforms may find it difficult to maintain visibility into cloud assets, configurations, and user activities',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Risk', 'Possible Impact'],
          tableRows: [
            ['Misconfigured Resources', 'Unauthorized access'],
            ['Weak Identity Management', 'Account compromise'],
            ['Data Breaches', 'Loss of confidential information'],
            ['Insecure APIs', 'Unauthorized system access'],
            ['Insider Threats', 'Data misuse or theft'],
            ['Lack of Visibility', 'Delayed detection of security incidents'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Cloud Security',
        bullets: [
          'Enable Multi-Factor Authentication (MFA) for privileged and administrative accounts',
          'Follow the Principle of Least Privilege when assigning permissions',
          'Encrypt sensitive data both at rest and in transit',
          'Regularly review cloud configurations for security weaknesses',
          'Monitor cloud activity using centralized logging and security monitoring tools',
          'Keep cloud workloads and applications updated with the latest security patches',
          'Perform regular backups and test disaster recovery procedures',
          'Conduct periodic security assessments and compliance audits',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud Deployment Models',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Where the Infrastructure Lives',
        body:
            'Organizations adopt different cloud deployment models '
            'based on their business requirements, security needs, '
            'regulatory obligations, and budget. A cloud deployment '
            'model defines where the cloud infrastructure is located, '
            'who owns it, and who has access to it. The four primary '
            'deployment models are Public Cloud, Private Cloud, Hybrid '
            'Cloud, and Community Cloud. Each model offers different '
            'advantages and security considerations.',
      ),
      LessonSection(
        heading: 'Public Cloud',
        body:
            'A Public Cloud is a cloud environment owned and operated '
            'by a third-party cloud service provider. Computing '
            'resources are shared among multiple customers (known as '
            'tenants), while logical separation ensures that each '
            'customer\'s data remains isolated. Public cloud services '
            'are accessible over the Internet and are typically offered '
            'on a pay-as-you-use basis.',
        bullets: ['Websites', 'Mobile applications', 'Email services', 'Data analytics', 'Virtual servers', 'Cloud storage'],
      ),
      LessonSection(
        heading: 'Public Cloud: Advantages and Limitations',
        bullets: [
          'Advantages — low initial investment, rapid deployment, high scalability, global availability, provider-managed infrastructure',
          'Limitations — less control over the underlying infrastructure, shared infrastructure environment, compliance requirements may require additional security controls',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/public_cloud.jpg',
          caption: 'Public Cloud resources are shared among multiple tenants while remaining logically isolated from one another.',
        ),
      ),
      LessonSection(
        heading: 'Private Cloud',
        body:
            'A Private Cloud is dedicated to a single organization. The '
            'infrastructure may be located in the organization\'s own '
            'data center or hosted by a third-party provider, but it is '
            'not shared with other customers. Private clouds provide '
            'greater control over security configurations, networking, '
            'and compliance. Organizations operating in highly '
            'regulated industries often prefer private cloud '
            'environments.',
        bullets: [
          'Advantages — greater administrative control, improved customization, enhanced data privacy, easier regulatory compliance, dedicated infrastructure',
          'Limitations — higher deployment and maintenance costs, greater management responsibility, reduced elasticity compared to public cloud',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/private_cloud.jpg',
          caption: 'A Private Cloud is dedicated to a single organization, providing greater control over security and compliance.',
        ),
      ),
      LessonSection(
        heading: 'Hybrid Cloud',
        body:
            'A Hybrid Cloud combines two or more cloud environments, '
            'typically a private cloud and a public cloud, allowing '
            'data and applications to move securely between them. '
            'Organizations use hybrid cloud environments to balance '
            'flexibility, cost, and security — for example, a company '
            'may store sensitive customer information in a private '
            'cloud while hosting its public website in a public cloud.',
        bullets: [
          'Advantages — greater flexibility, better workload distribution, cost optimization, easier disaster recovery, supports gradual cloud migration',
          'Limitations — more complex management, additional network security requirements, greater integration challenges',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/hybrid_cloud.jpg',
          caption: 'A Hybrid Cloud combines private and public cloud environments, allowing data and applications to move securely between them.',
        ),
      ),
      LessonSection(
        heading: 'Community Cloud',
        body:
            'A Community Cloud is shared by multiple organizations that '
            'have similar operational, security, or regulatory '
            'requirements. Participating organizations jointly use the '
            'infrastructure while maintaining agreed-upon security '
            'policies — commonly used by government agencies, '
            'healthcare organizations, universities, financial '
            'institutions, and research organizations.',
        bullets: [
          'Advantages — shared operational costs, common security standards, easier collaboration, supports industry-specific compliance',
          'Limitations — shared governance, limited flexibility, more complex coordination among participating organizations',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/community_cloud.jpg',
          caption: 'A Community Cloud is shared by multiple organizations with similar operational, security, or regulatory requirements.',
        ),
      ),
      LessonSection(
        heading: 'Comparison of Cloud Deployment Models',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Public', 'Private', 'Hybrid', 'Community'],
          tableRows: [
            ['Infrastructure Ownership', 'Cloud Provider', 'Single Organization', 'Shared', 'Shared Community'],
            ['Resource Sharing', 'Yes', 'No', 'Partial', 'Community Members'],
            ['Scalability', 'High', 'Moderate', 'High', 'Moderate'],
            ['Administrative Control', 'Limited', 'High', 'High', 'Shared'],
            ['Cost', 'Lower', 'Higher', 'Moderate', 'Shared'],
            ['Typical Use Cases', 'Web Applications, SaaS', 'Sensitive Workloads', 'Mixed Workloads', 'Government, Healthcare'],
          ],
        ),
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud Service Models: IaaS, PaaS & SaaS',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'What Services the Provider Delivers',
        body:
            'While deployment models describe where cloud services are '
            'hosted, service models define what services the cloud '
            'provider delivers and what responsibilities remain with '
            'the customer. The three primary cloud service models are '
            'Infrastructure as a Service (IaaS), Platform as a Service '
            '(PaaS), and Software as a Service (SaaS). As organizations '
            'move from IaaS to SaaS, the cloud provider assumes greater '
            'responsibility for managing the environment.',
      ),
      LessonSection(
        heading: 'Infrastructure as a Service (IaaS)',
        body:
            'IaaS provides virtualized computing infrastructure over '
            'the Internet. The cloud provider supplies virtual '
            'machines, networking, storage, and physical infrastructure. '
            'The customer manages operating systems, applications, user '
            'accounts, security configurations, and data. IaaS offers '
            'the greatest flexibility because customers have '
            'significant control over their virtual infrastructure.',
        bullets: ['Virtual data centers', 'Development and testing environments', 'Disaster recovery', 'Enterprise applications'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/iaas.jpg',
          caption: 'IaaS provides virtualized computing infrastructure while customers manage operating systems, applications, and data.',
        ),
      ),
      LessonSection(
        heading: 'Platform as a Service (PaaS)',
        body:
            'PaaS provides a complete application development platform. '
            'The cloud provider manages infrastructure, operating '
            'systems, runtime environment, and middleware. Customers '
            'focus on developing applications and managing application '
            'data. PaaS allows developers to build and deploy '
            'applications without managing underlying infrastructure.',
        bullets: ['Web application development', 'API development', 'Database-backed applications', 'Software testing'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/paas.jpg',
          caption: 'PaaS provides a complete application development platform, letting developers focus on building applications rather than managing infrastructure.',
        ),
      ),
      LessonSection(
        heading: 'Software as a Service (SaaS)',
        body:
            'SaaS delivers complete software applications over the '
            'Internet. The provider manages almost every aspect of the '
            'environment, including infrastructure, operating systems, '
            'applications, updates, and maintenance. Customers simply '
            'access the application through a web browser or client '
            'application.',
        bullets: ['Email platforms', 'Office productivity suites', 'Customer Relationship Management (CRM) systems', 'Video conferencing platforms'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/saas.jpg',
          caption: 'SaaS delivers complete software applications over the Internet, with the provider managing nearly every aspect of the environment.',
        ),
      ),
      LessonSection(
        heading: 'SaaS: Advantages and Customer Responsibilities',
        body:
            'Advantages include minimal administration, automatic '
            'software updates, rapid deployment, and accessibility from '
            'multiple devices. Although the provider manages the '
            'application, customers remain responsible for user '
            'accounts, password policies, Multi-Factor Authentication '
            '(MFA), data classification, and access permissions.',
      ),
      LessonSection(
        heading: 'Comparison of Cloud Service Models',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'IaaS', 'PaaS', 'SaaS'],
          tableRows: [
            ['Infrastructure Managed By', 'Provider', 'Provider', 'Provider'],
            ['Operating System Managed By', 'Customer', 'Provider', 'Provider'],
            ['Applications Managed By', 'Customer', 'Customer', 'Provider'],
            ['Customer Control', 'High', 'Moderate', 'Limited'],
            ['Deployment Speed', 'Moderate', 'Fast', 'Very Fast'],
            ['Typical Users', 'System Administrators', 'Developers', 'End Users'],
          ],
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/choosing_cloud_model.jpg',
          caption: 'Selecting the appropriate cloud model requires balancing security requirements, compliance, budget, and operational expertise.',
        ),
      ),
      LessonSection(
        heading: 'Choosing the Appropriate Cloud Model',
        bullets: [
          'Security Requirements — sensitive workloads may require a private or hybrid cloud',
          'Compliance — regulated industries often need additional controls and auditing',
          'Budget — public cloud services generally reduce upfront costs',
          'Operational Expertise — organizations with experienced IT teams may prefer IaaS for greater control, while others may benefit from the simplicity of SaaS',
          'Scalability Needs — applications with changing workloads benefit from cloud environments that can scale rapidly',
        ],
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Evaluate business and security requirements before selecting a deployment model',
          'Understand the Shared Responsibility Model for each service model',
          'Apply the principle of least privilege to cloud resources',
          'Enable Multi-Factor Authentication (MFA) for administrative accounts',
          'Regularly review cloud configurations and access permissions',
          'Encrypt sensitive data stored in cloud environments',
          'Continuously monitor cloud resources for security events and configuration changes',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud IAM: Authentication, Federation, SSO & MFA',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Protecting Digital Identities',
        body:
            'As organizations move their applications and data to the '
            'cloud, protecting digital identities becomes one of the '
            'most important aspects of cloud security. Whether users '
            'are employees, customers, administrators, or applications, '
            'each identity must be authenticated before accessing cloud '
            'resources. Identity and Access Management (IAM) is a '
            'framework of policies, technologies, and processes used to '
            'ensure that the right users have the right level of access '
            'to the right resources at the right time.',
      ),
      LessonSection(
        heading: 'Why IAM Is Important',
        body:
            'Cloud environments are accessible over the Internet, '
            'making them attractive targets for attackers. If '
            'identities are not properly managed, attackers may gain '
            'access to sensitive information or critical systems. '
            'Effective IAM helps organizations verify user identities, '
            'control access to cloud resources, enforce security '
            'policies, protect privileged accounts, support regulatory '
            'compliance, and monitor user activities.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/authentication_authorization.jpg',
          caption: 'IAM sits between the user and cloud resources, verifying identity before determining what that identity is permitted to access.',
        ),
      ),
      LessonSection(
        heading: 'Authentication vs. Authorization',
        body:
            'Although closely related, authentication and authorization '
            'perform different functions. Authentication is the process '
            'of verifying the identity of a user, device, or '
            'application — it answers "Who are you?" Authorization '
            'determines what an authenticated user is permitted to do '
            '— it answers "What are you allowed to access?"',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Authentication', 'Authorization'],
          tableRows: [
            ['Verifies identity', 'Determines permissions'],
            ['Happens first', 'Happens after authentication'],
            ['Confirms who the user is', 'Determines what the user can do'],
            ['Example: Login', 'Example: Access to cloud storage'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Identity Federation',
        body:
            'Many organizations use multiple cloud services and '
            'applications. Managing separate usernames and passwords '
            'for each service increases administrative effort and '
            'creates a poor user experience. Identity Federation allows '
            'trusted identity providers to authenticate users once and '
            'share that authentication with multiple cloud services. '
            'Instead of creating separate accounts for every '
            'application, users authenticate through a central identity '
            'provider.',
        bullets: [
          'Single user identity across applications',
          'Reduced password management',
          'Simplified administration',
          'Centralized security policies',
          'Improved user experience',
        ],
      ),
      LessonSection(
        heading: 'Single Sign-On (SSO)',
        body:
            'Single Sign-On (SSO) enables users to authenticate once '
            'and access multiple applications without repeatedly '
            'entering their credentials. For example, after signing in '
            'to the organization\'s identity platform, an employee may '
            'access email, collaboration tools, HR applications, CRM '
            'software, and cloud storage without signing in again. '
            'Although SSO simplifies access, organizations should '
            'combine it with Multi-Factor Authentication (MFA) to '
            'strengthen security.',
        bullets: ['Improved user convenience', 'Reduced password fatigue', 'Fewer password reset requests', 'Centralized authentication', 'Better security management'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/single_sign_on.jpg',
          caption: 'Single Sign-On enables users to authenticate once and securely access multiple cloud applications without repeatedly entering credentials.',
        ),
      ),
      LessonSection(
        heading: 'Multi-Factor Authentication (MFA)',
        body:
            'Passwords alone are often insufficient to protect cloud '
            'accounts because they may be guessed, stolen, or reused. '
            'Multi-Factor Authentication (MFA) requires users to '
            'present two or more independent authentication factors '
            'before access is granted. Using multiple authentication '
            'factors significantly reduces the likelihood of '
            'unauthorized access, even if a password is compromised.',
      ),
      LessonSection(
        heading: 'The Three Authentication Factor Categories',
        bullets: [
          'Something You Know — password, PIN, passphrase',
          'Something You Have — mobile authenticator application, hardware security token, smart card, security key',
          'Something You Are — fingerprint, facial recognition, iris scan',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/multi_factor_authentication.jpg',
          caption: 'MFA combines a knowledge factor with a possession or inherence factor before granting cloud access.',
        ),
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud IAM: RBAC, ABAC, PAM & Identity Governance',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Role-Based Access Control (RBAC)',
        body:
            'Most organizations assign permissions based on an '
            'employee\'s job responsibilities rather than granting '
            'permissions individually. Role-Based Access Control (RBAC) '
            'assigns permissions to predefined roles, and users inherit '
            'permissions by being assigned to those roles.',
        bullets: ['Cloud Administrator', 'Security Administrator', 'Database Administrator', 'Network Administrator', 'Help Desk Technician', 'Finance User'],
      ),
      LessonSection(
        heading: 'RBAC in Practice',
        body:
            'For example, members of the "Database Administrator" role '
            'may manage databases but not modify network firewall '
            'rules. RBAC simplifies administration, provides consistent '
            'permission management, supports the Principle of Least '
            'Privilege, reduces administrative errors, and enables '
            'easier auditing and compliance.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/role_based_access_control.jpg',
          caption: 'RBAC assigns permissions to roles, and users inherit those permissions by being assigned to a role.',
        ),
      ),
      LessonSection(
        heading: 'Attribute-Based Access Control (ABAC)',
        body:
            'While RBAC grants permissions based on predefined roles, '
            'Attribute-Based Access Control (ABAC) makes access '
            'decisions using attributes associated with users, '
            'resources, actions, and the environment — user department, '
            'job title, device compliance status, geographic location, '
            'time of day, and data classification.',
      ),
      LessonSection(
        heading: 'ABAC in Practice',
        body:
            'For example, an organization may allow access to '
            'confidential financial reports only if the user belongs '
            'to the Finance department, the device is managed and '
            'compliant, the user connects from an approved country, and '
            'the access request occurs during business hours. ABAC '
            'provides greater flexibility than RBAC and is commonly '
            'used in Zero Trust architectures.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'RBAC', 'ABAC'],
          tableRows: [
            ['Access Based On', 'User role', 'Multiple attributes'],
            ['Flexibility', 'Moderate', 'High'],
            ['Ease of Administration', 'Easier', 'More complex'],
            ['Common Use', 'Enterprise administration', 'Dynamic cloud environments'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Privileged Access Management (PAM)',
        body:
            'Administrative accounts have elevated permissions that '
            'allow them to manage cloud infrastructure, create '
            'resources, and modify security settings. If a privileged '
            'account is compromised, attackers may gain extensive '
            'control over the cloud environment. Privileged Access '
            'Management (PAM) helps organizations secure, monitor, and '
            'control the use of privileged accounts.',
        bullets: [
          'Privileged account discovery',
          'Secure credential storage',
          'Just-in-Time (JIT) administrative access',
          'Session monitoring',
          'Approval workflows',
          'Privileged session recording',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/privileged_access_management.jpg',
          caption: 'PAM reduces the risk associated with high-privilege accounts and supports accountability through detailed audit records.',
        ),
      ),
      LessonSection(
        heading: 'Identity Governance',
        body:
            'As organizations grow, employees join, change roles, and '
            'leave the organization. Identity governance ensures that '
            'user accounts and permissions remain accurate throughout '
            'this lifecycle — user provisioning, role assignment, '
            'access reviews, removal of unused accounts, periodic '
            'permission audits, and compliance reporting. Proper '
            'identity governance reduces excessive permissions and '
            'minimizes the risk of unauthorized access.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_iam_best_practices.jpg',
          caption: 'A layered set of IAM best practices reduces the risk of unauthorized access to cloud resources.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Cloud IAM',
        bullets: [
          'Enable Multi-Factor Authentication (MFA) for all privileged accounts',
          'Apply the Principle of Least Privilege',
          'Use Role-Based Access Control (RBAC) wherever appropriate',
          'Implement Attribute-Based Access Control (ABAC) for dynamic access requirements',
          'Regularly review and remove unnecessary permissions',
          'Protect administrative accounts with Privileged Access Management (PAM)',
          'Monitor authentication logs for suspicious activity',
          'Disable inactive and unused accounts promptly',
          'Conduct periodic access reviews to ensure permissions remain appropriate',
        ],
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud Data Security & Data Classification',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Protecting the Organization\'s Most Valuable Asset',
        body:
            'Data is one of an organization\'s most valuable assets. '
            'Whether it contains customer information, financial '
            'records, intellectual property, or business documents, '
            'protecting this data is a primary objective of cloud '
            'security. Cloud Data Security refers to the technologies, '
            'policies, and processes used to protect data stored, '
            'processed, and transmitted in cloud environments.',
      ),
      LessonSection(
        heading: 'A Different Challenge Than On-Premises',
        body:
            'Unlike traditional on-premises environments, cloud data '
            'may reside in multiple geographic regions, be accessed '
            'from various devices, and move between different cloud '
            'services. As a result, organizations must implement '
            'security controls that protect data regardless of where '
            'it is stored or accessed.',
      ),
      LessonSection(
        heading: 'Objectives of Cloud Data Security',
        bullets: [
          'Prevent unauthorized access to data',
          'Protect sensitive information from disclosure',
          'Ensure data integrity by preventing unauthorized modification',
          'Maintain data availability for authorized users',
          'Meet legal and regulatory compliance requirements',
          'Support secure backup and disaster recovery',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_encryption.jpg',
          caption: 'Cloud data security combines multiple complementary controls to protect information throughout its lifecycle.',
        ),
      ),
      LessonSection(
        heading: 'Data Classification in the Cloud',
        body:
            'Not all information requires the same level of protection. '
            'Organizations classify data based on its sensitivity and '
            'business value so that appropriate security controls can '
            'be applied. Data classification helps organizations '
            'determine who can access the data, how it should be '
            'stored, whether encryption is required, how long it should '
            'be retained, and how it should be securely disposed of.',
      ),
      LessonSection(
        heading: 'Public Data & Internal Data',
        body:
            'Public data is intended for unrestricted access — company '
            'brochures, public websites, product catalogs, press '
            'releases — and generally requires minimal protection but '
            'should still be protected against unauthorized '
            'modification. Internal data is intended for use within the '
            'organization — internal procedures, employee directories, '
            'meeting schedules, operational documentation — with access '
            'usually limited to employees and authorized contractors.',
      ),
      LessonSection(
        heading: 'Confidential Data & Restricted Data',
        body:
            'Confidential data contains sensitive business information '
            'that could harm the organization if disclosed — financial '
            'reports, customer records, business contracts, employee '
            'information — and should be protected using encryption and '
            'strict access controls. Restricted data represents the '
            'organization\'s most sensitive information — encryption '
            'keys, government-classified information, trade secrets, '
            'medical records, payment card information — and access '
            'should be granted only to specifically authorized '
            'individuals, with additional monitoring and security '
            'controls.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Classification', 'Examples', 'Protection Level'],
          tableRows: [
            ['Public', 'Marketing materials', 'Low'],
            ['Internal', 'Policies and procedures', 'Moderate'],
            ['Confidential', 'Customer records', 'High'],
            ['Restricted', 'Encryption keys, regulated data', 'Very High'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Data States in Cloud Computing',
        body:
            'Cloud data exists in different states throughout its '
            'lifecycle, and each state requires appropriate protection.',
      ),
      LessonSection(
        heading: 'Data at Rest, in Transit & in Use',
        bullets: [
          'Data at Rest — information stored on storage devices not actively moving across a network (cloud storage accounts, databases, backup files, VM disks, archived documents); protected using disk encryption, database encryption, access control policies, and secure backups',
          'Data in Transit — information moving between devices, cloud services, or users (file uploads, web browsing, email, API requests, database synchronization); protected using TLS, HTTPS, IPsec VPN, and SSH',
          'Data in Use — information currently being processed by applications or users (editing documents, running database queries, processing financial transactions); protected using strong authentication, memory protection, least privilege access, and secure application design',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/data_states_cloud.jpg',
          caption: 'Cloud data moves through three distinct states throughout its lifecycle, each requiring different protective controls.',
        ),
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Cloud Encryption & Key Management',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'One of the Most Effective Data Protection Methods',
        body:
            'Encryption is one of the most effective methods for '
            'protecting cloud data. Encryption converts readable '
            'information (plaintext) into an unreadable format '
            '(ciphertext) using a cryptographic algorithm and an '
            'encryption key. Even if encrypted data is stolen, it '
            'cannot be understood without the correct decryption key. '
            'Cloud providers often support encryption for storage '
            'accounts, databases, virtual machine disks, backups, and '
            'network communication. Organizations should encrypt '
            'sensitive data both at rest and in transit.',
      ),
      LessonSection(
        heading: 'Server-Side Encryption',
        body:
            'With Server-Side Encryption, the cloud provider '
            'automatically encrypts data after it is uploaded. The '
            'provider manages the encryption process and may also '
            'manage the encryption keys, depending on the chosen '
            'configuration. This approach simplifies deployment while '
            'providing strong protection for stored data.',
      ),
      LessonSection(
        heading: 'Client-Side Encryption',
        body:
            'With Client-Side Encryption, data is encrypted before it '
            'is uploaded to the cloud. Only encrypted data is stored in '
            'the cloud environment. This approach provides greater '
            'control because the organization manages the encryption '
            'process and typically retains control of the encryption '
            'keys.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Approach', 'Encryption Occurs', 'Who Manages Keys'],
          tableRows: [
            ['Client-Side Encryption', 'Before upload, on the client', 'Typically the customer'],
            ['Server-Side Encryption', 'After upload, by the provider', 'Provider (or customer, depending on configuration)'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Key Management',
        body:
            'Encryption is only as secure as the protection provided '
            'for the encryption keys. Key Management refers to the '
            'processes used to generate, distribute, store, rotate, '
            'back up, and securely destroy cryptographic keys. Many '
            'cloud providers offer managed key management services that '
            'help organizations securely administer encryption keys.',
        bullets: ['Key generation', 'Secure key storage', 'Key rotation', 'Key backup', 'Key revocation', 'Key destruction'],
      ),
      LessonSection(
        heading: 'Provider-Managed Keys vs. Customer-Managed Keys',
        body:
            'Organizations typically choose between two approaches. '
            'With Provider-Managed Keys, the cloud provider generates, '
            'stores, and rotates encryption keys — offering easy '
            'administration, automatic key rotation, and simplified '
            'deployment. With Customer-Managed Keys, the organization '
            'controls the encryption keys — offering greater '
            'administrative control, enhanced compliance, better '
            'separation of duties, and stronger control over sensitive '
            'information.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Provider-Managed', 'Customer-Managed'],
          tableRows: [
            ['Key Ownership', 'Cloud Provider', 'Customer'],
            ['Administrative Effort', 'Low', 'Higher'],
            ['Customer Control', 'Moderate', 'High'],
            ['Compliance Flexibility', 'Moderate', 'High'],
          ],
        ),
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Tokenization, Data Masking & Data Loss Prevention (DLP)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Tokenization',
        body:
            'Tokenization replaces sensitive information with a '
            'non-sensitive value known as a token. The token has no '
            'meaningful value by itself and cannot reveal the original '
            'information without access to the secure token database. '
            'For example, a payment card number stored in an '
            'application may be replaced with a randomly generated '
            'token.',
        bullets: ['Credit card numbers', 'Bank account numbers', 'National identification numbers', 'Customer account information'],
      ),
      LessonSection(
        heading: 'How Tokenization Differs From Encryption',
        body:
            'Unlike encryption, tokenization does not rely on '
            'decryption keys to reveal the original value. Instead, the '
            'original data is securely mapped to the token in a '
            'protected repository. This means an attacker who steals '
            'tokenized data has nothing mathematically reversible to '
            'work with, unlike stolen ciphertext which could '
            'theoretically be decrypted if the key is ever compromised.',
      ),
      LessonSection(
        heading: 'Data Masking',
        body:
            'Data Masking hides sensitive information while preserving '
            'the overall format of the data — commonly used in software '
            'development, testing environments, training systems, and '
            'customer support applications. This allows personnel to '
            'work with realistic data without exposing sensitive '
            'information.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Original Data', 'Masked Data'],
          tableRows: [
            ['9876543210', '******3210'],
            ['alice@example.com', 'a***@example.com'],
            ['Employee ID: 452178', 'Employee ID: ******'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Data Loss Prevention (DLP)',
        body:
            'Data Loss Prevention (DLP) is a collection of technologies '
            'and policies designed to detect, monitor, and prevent '
            'unauthorized disclosure of sensitive information. A DLP '
            'solution identifies sensitive data and enforces '
            'organizational policies when users attempt to upload '
            'confidential files, email sensitive information, copy data '
            'to removable media, share files externally, or print '
            'protected documents.',
      ),
      LessonSection(
        heading: 'DLP in Practice',
        body:
            'For example, if an employee attempts to upload confidential '
            'financial data to an unauthorized cloud storage service, '
            'the DLP system can block the transfer and generate an '
            'alert for the security team.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/data_loss_prevention.jpg',
          caption: 'DLP evaluates data transfers against organizational policy in real time, blocking unauthorized disclosure before it occurs.',
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_data_security_best_practices.jpg',
          caption: 'Protecting cloud data requires combining classification, encryption, access control, and continuous monitoring.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Cloud Data Security',
        bullets: [
          'Classify data according to its sensitivity',
          'Encrypt sensitive data both at rest and in transit',
          'Protect encryption keys using secure key management practices',
          'Apply the Principle of Least Privilege to data access',
          'Use tokenization or masking where appropriate',
          'Implement Data Loss Prevention (DLP) policies',
          'Monitor access to sensitive cloud data',
          'Regularly review storage permissions and sharing settings',
          'Perform regular backups and test data recovery procedures',
        ],
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Network Security Fundamentals',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Connecting and Protecting Cloud Resources',
        body:
            'As organizations migrate applications and data to the '
            'cloud, securing the cloud network becomes essential. A '
            'cloud network connects virtual machines, databases, '
            'storage services, applications, and users. If the network '
            'is not properly protected, attackers may gain unauthorized '
            'access, intercept sensitive information, or disrupt '
            'business operations.',
      ),
      LessonSection(
        heading: 'Software-Defined by Nature',
        body:
            'Unlike traditional data centers, cloud networks are '
            'software-defined, allowing administrators to quickly '
            'create, modify, and secure network resources through '
            'management portals or automation tools.',
      ),
      LessonSection(
        heading: 'Objectives of Cloud Network Security',
        bullets: [
          'Protect communication between cloud resources',
          'Prevent unauthorized network access',
          'Limit the spread of cyberattacks',
          'Secure Internet-facing services',
          'Protect hybrid cloud connectivity',
          'Monitor network traffic for suspicious activity',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/virtual_networks.jpg',
          caption: 'Cloud network security layers filter and protect traffic before it reaches virtual machines, applications, and databases.',
        ),
      ),
      LessonSection(
        heading: 'Virtual Networks',
        body:
            'Cloud providers allow organizations to create Virtual '
            'Networks (VNets) or Virtual Private Clouds (VPCs) to '
            'isolate their cloud resources. A virtual network functions '
            'similarly to a traditional on-premises network but is '
            'implemented using software rather than physical switches '
            'and routers. Within a virtual network, administrators can '
            'define IP address ranges, subnets, routing tables, '
            'security policies, Internet connectivity, and private '
            'connectivity. Each virtual network is logically isolated '
            'from other customers using the cloud provider\'s '
            'infrastructure.',
        bullets: ['Logical isolation of resources', 'Flexible network design', 'Easy scalability', 'Integration with on-premises networks', 'Simplified management through cloud portals'],
      ),
      LessonSection(
        heading: 'Network Segmentation',
        body:
            'Network segmentation divides a network into smaller '
            'sections called subnets. Each subnet can have its own '
            'security rules and access controls. Segmentation limits '
            'communication between systems and reduces the impact of '
            'security incidents — for example, web servers may reside '
            'in one subnet, application servers in another, and '
            'database servers in a separate protected subnet. If a web '
            'server is compromised, segmentation helps prevent '
            'attackers from directly accessing the database servers.',
        bullets: ['Reduces the attack surface', 'Limits lateral movement by attackers', 'Improves security policy enforcement', 'Simplifies network management', 'Supports regulatory compliance'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/network_segmentation.jpg',
          caption: 'Network segmentation divides a cloud network into smaller, isolated subnets, limiting the impact of a compromise.',
        ),
      ),
      LessonSection(
        heading: 'Security Groups',
        body:
            'A Security Group is a virtual firewall that controls '
            'inbound and outbound traffic for cloud resources. Security '
            'groups contain rules that determine allowed source IP '
            'addresses, destination IP addresses, network protocols, '
            'port numbers, and allowed or denied traffic. Unlike '
            'traditional firewalls, security groups are usually '
            'associated directly with individual cloud resources such '
            'as virtual machines or network interfaces.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/security_groups.jpg',
          caption: 'A Security Group functions as a virtual firewall, controlling inbound and outbound traffic for individual cloud resources.',
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Direction', 'Protocol', 'Port', 'Action'],
          tableRows: [
            ['Inbound', 'HTTPS', '443', 'Allow'],
            ['Inbound', 'SSH', '22', 'Allow (Admin Only)'],
            ['Inbound', 'HTTP', '80', 'Allow'],
            ['Outbound', 'Any', 'Any', 'Allow'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Network Access Control Lists (Network ACLs)',
        body:
            'While security groups protect individual cloud resources, '
            'Network Access Control Lists (Network ACLs) protect entire '
            'subnets. A Network ACL evaluates network traffic entering '
            'or leaving a subnet based on predefined rules, commonly '
            'evaluating source IP address, destination IP address, '
            'protocol, port number, and allow/deny action. Because ACLs '
            'operate at the subnet level, they provide an additional '
            'layer of network protection. Using both security groups '
            'and Network ACLs provides layered network security.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Security Group', 'Network ACL'],
          tableRows: [
            ['Protects', 'Individual resources', 'Entire subnet'],
            ['Rule Type', 'Usually stateful', 'Often stateless (provider-dependent)'],
            ['Applied To', 'Virtual machine or network interface', 'Subnet'],
            ['Primary Purpose', 'Resource protection', 'Network boundary protection'],
          ],
        ),
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Firewalls, WAF, Bastion Hosts & Zero Trust Networking',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Cloud Firewalls',
        body:
            'A cloud firewall filters network traffic entering or '
            'leaving cloud environments based on security rules. Cloud '
            'firewalls inspect traffic and determine whether it should '
            'be allowed or blocked, commonly evaluating source and '
            'destination addresses, port numbers, protocols, '
            'applications, and network services. Cloud firewalls help '
            'prevent unauthorized access to cloud resources while '
            'allowing legitimate business traffic.',
        bullets: ['Block unauthorized connections', 'Restrict administrative access', 'Filter inbound and outbound traffic', 'Log network activity', 'Detect suspicious communication patterns'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_firewalls.jpg',
          caption: 'Cloud firewalls filter traffic entering or leaving cloud environments, allowing legitimate business traffic while blocking unauthorized access.',
        ),
      ),
      LessonSection(
        heading: 'Web Application Firewall (WAF)',
        body:
            'A Web Application Firewall (WAF) protects web applications '
            'by inspecting HTTP and HTTPS traffic. Unlike a traditional '
            'firewall, which focuses on network traffic, a WAF examines '
            'application-layer requests, helping protect against SQL '
            'Injection, Cross-Site Scripting (XSS), Command Injection, '
            'File Inclusion attacks, and HTTP protocol abuse. '
            'Organizations commonly place a WAF in front of '
            'Internet-facing web applications.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/web_application_firewall.jpg',
          caption: 'A WAF inspects HTTP/HTTPS traffic at the application layer, protecting web applications from attacks that traditional network firewalls cannot detect.',
        ),
      ),
      LessonSection(
        heading: 'Bastion Hosts (Jump Servers)',
        body:
            'Administrative access to cloud resources should never be '
            'directly exposed to the Internet. A Bastion Host, also '
            'known as a Jump Server, is a hardened system that provides '
            'a secure entry point for administrators. Instead of '
            'connecting directly to production servers, administrators '
            'first authenticate to the bastion host and then access '
            'internal systems.',
        bullets: ['Reduces the attack surface', 'Centralizes administrative access', 'Supports logging and auditing', 'Simplifies monitoring of privileged activities'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/bastion_hosts.jpg',
          caption: 'A bastion host provides a single, hardened, auditable entry point for administrative access rather than exposing production systems directly to the Internet.',
        ),
      ),
      LessonSection(
        heading: 'Zero Trust Networking',
        body:
            'Traditional security models assumed that users inside the '
            'corporate network were trustworthy. Modern cloud '
            'environments require a different approach. Zero Trust is '
            'a security model based on the principle: "Never trust, '
            'always verify." Every access request is evaluated '
            'regardless of where it originates — considering user '
            'identity, device health, location, time of access, '
            'requested resource, and risk level.',
        bullets: ['Continuous verification of users and devices', 'Reduced risk of unauthorized access', 'Supports remote and hybrid work', 'Limits lateral movement within the network', 'Better protection against compromised accounts'],
      ),
      LessonSection(
        heading: 'Secure Connectivity to the Cloud',
        body:
            'Organizations often connect their on-premises environments '
            'to the cloud using two common approaches.',
      ),
      LessonSection(
        heading: 'VPN vs. Dedicated Private Connections',
        bullets: [
          'Virtual Private Network (VPN) — establishes encrypted tunnels over the Internet between on-premises networks and cloud environments; offers lower implementation cost, secure communication, and is suitable for branch offices and remote users',
          'Dedicated Private Connections — bypass the public Internet entirely; provide more consistent network performance, lower latency, higher reliability, and enhanced privacy',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/secure_cloud_connectivity.jpg',
          caption: 'Hybrid cloud connectivity extends the corporate network securely into the cloud using either encrypted VPN tunnels or dedicated private connections.',
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_network_security_best_practices.jpg',
          caption: 'Layered network security combines segmentation, firewalls, secure connectivity, and continuous monitoring.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Cloud Network Security',
        bullets: [
          'Design networks using multiple subnets for different workloads',
          'Apply network segmentation to isolate critical systems',
          'Configure Security Groups and Network ACLs using the principle of least privilege',
          'Deploy firewalls to filter network traffic',
          'Protect public-facing applications with a Web Application Firewall (WAF)',
          'Use bastion hosts for administrative access to internal resources',
          'Secure hybrid connectivity using VPNs or dedicated private connections',
          'Monitor network traffic continuously for suspicious activity',
          'Review firewall and access rules regularly to remove unnecessary permissions',
        ],
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Workload Security: Virtual Machines & Containers',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'What Is a Cloud Workload?',
        body:
            'A cloud workload is any application, service, virtual '
            'machine, container, database, or serverless function that '
            'performs computing tasks in a cloud environment. '
            'Organizations often run hundreds or even thousands of '
            'workloads across public, private, and hybrid clouds. '
            'Because workloads process sensitive business information '
            'and support critical applications, they are frequent '
            'targets for cyberattacks. Cloud Workload Security refers '
            'to the security measures used to protect these workloads '
            'throughout their lifecycle — from deployment and operation '
            'to updates and retirement.',
      ),
      LessonSection(
        heading: 'Objectives of Cloud Workload Security',
        bullets: ['Protect cloud-hosted applications', 'Secure operating systems and software', 'Prevent unauthorized access', 'Detect malicious activity', 'Reduce vulnerabilities', 'Maintain business continuity'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/vm_security.jpg',
          caption: 'Cloud workload security applies consistent controls across every workload type, regardless of where it is deployed.',
        ),
      ),
      LessonSection(
        heading: 'Virtual Machine (VM) Security',
        body:
            'Virtual machines remain one of the most widely used cloud '
            'computing resources. A virtual machine behaves like a '
            'physical computer with its own operating system, '
            'applications, storage, and network interfaces. Although '
            'cloud providers secure the underlying physical '
            'infrastructure, organizations are generally responsible '
            'for securing the operating system and applications running '
            'inside their virtual machines.',
        bullets: ['Unpatched operating systems', 'Weak administrator passwords', 'Open management ports', 'Malware infections', 'Misconfigured firewall rules', 'Excessive user privileges'],
      ),
      LessonSection(
        heading: 'Best Practices for VM Security',
        bullets: ['Apply security updates promptly', 'Disable unnecessary services', 'Enable endpoint protection', 'Restrict administrative access', 'Encrypt virtual machine disks', 'Monitor system logs', 'Perform regular vulnerability assessments'],
      ),
      LessonSection(
        heading: 'Container Security',
        body:
            'Containers package an application together with its '
            'required libraries and dependencies, allowing it to run '
            'consistently across different computing environments. '
            'Unlike virtual machines, containers share the host '
            'operating system kernel, making them lightweight and '
            'faster to deploy. Container technologies are widely used '
            'in modern cloud-native application development.',
        bullets: ['Faster deployment', 'Efficient resource utilization', 'Easy scalability', 'Consistent application environments', 'Simplified application updates'],
      ),
      LessonSection(
        heading: 'Container Security Risks',
        bullets: ['Vulnerable container images', 'Misconfigured container settings', 'Excessive privileges', 'Insecure container registries', 'Outdated software components'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/container_security.jpg',
          caption: 'Containers share the host operating system kernel, making them lightweight but requiring dedicated security controls.',
        ),
      ),
      LessonSection(
        heading: 'Container Image Security',
        body:
            'A container image is a template used to create containers. '
            'If an image contains malware or vulnerable software, every '
            'container created from that image inherits the same '
            'weaknesses. Organizations should use trusted image '
            'repositories, scan images for vulnerabilities, remove '
            'unnecessary software packages, digitally sign trusted '
            'images, and update base images regularly. Container image '
            'scanning is commonly integrated into software development '
            'pipelines before applications are deployed.',
      ),
    ],
  ),

  // 13 ---------------------------------------------------------------------
  Lesson(
    title: 'Kubernetes & Serverless Security',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Kubernetes Security Fundamentals',
        body:
            'As organizations deploy large numbers of containers, they '
            'often use Kubernetes to automate container deployment, '
            'scaling, and management. Kubernetes helps administrators '
            'deploy containers, scale applications, replace failed '
            'containers, balance workloads, and manage application '
            'availability. Because Kubernetes manages critical cloud '
            'workloads, securing the platform is essential.',
      ),
      LessonSection(
        heading: 'What Needs to Be Secured',
        bullets: ['Kubernetes control plane', 'Worker nodes', 'API server', 'Secrets', 'Network communication', 'User access permissions'],
      ),
      LessonSection(
        heading: 'RBAC Within Kubernetes',
        body:
            'Role-Based Access Control (RBAC) is commonly used to '
            'restrict administrative privileges within Kubernetes '
            'clusters — the same principle applied across the rest of '
            'cloud IAM, now scoped down to the cluster level.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/kubernetes_security.jpg',
          caption: 'A simplified Kubernetes architecture — the control plane orchestrates containers running across multiple worker nodes.',
        ),
      ),
      LessonSection(
        heading: 'Serverless Security',
        body:
            'Serverless computing allows developers to run code without '
            'managing servers or operating systems. In a serverless '
            'environment, the cloud provider manages the underlying '
            'infrastructure while developers focus on writing '
            'application code.',
        bullets: ['Event-driven applications', 'Image processing', 'Data transformation', 'Automated notifications', 'API processing'],
      ),
      LessonSection(
        heading: 'Security Responsibilities in Serverless',
        body:
            'Although the provider manages the infrastructure, '
            'organizations remain responsible for securing application '
            'code, user identities, access permissions, sensitive data, '
            'and API security. Proper input validation, secure coding '
            'practices, and least-privilege permissions remain '
            'essential.',
        bullets: ['Automatic scaling', 'Reduced infrastructure management', 'Faster development', 'Efficient resource utilization'],
      ),
    ],
  ),

  // 14 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Patch & Vulnerability Management',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Cloud Patch Management',
        body:
            'Software vulnerabilities are regularly discovered in '
            'operating systems, applications, and cloud services. Patch '
            'Management is the process of identifying, testing, '
            'deploying, and verifying security updates. Timely patching '
            'reduces the likelihood that attackers can exploit known '
            'vulnerabilities.',
      ),
      LessonSection(
        heading: 'The Patch Management Process',
        bullets: ['Identify available updates', 'Assess affected systems', 'Test patches in a non-production environment', 'Deploy approved updates', 'Verify successful installation', 'Monitor systems for unexpected issues'],
      ),
      LessonSection(
        body:
            'Organizations should establish regular patch cycles while '
            'also maintaining procedures for deploying emergency '
            'security patches.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_patch_management.jpg',
          caption: 'The patch management lifecycle balances rapid vulnerability remediation with operational stability.',
        ),
      ),
      LessonSection(
        heading: 'Vulnerability Management',
        body:
            'Patching is only one part of vulnerability management. '
            'Vulnerability Management is the continuous process of '
            'identifying, assessing, prioritizing, and remediating '
            'security weaknesses. Organizations often perform scheduled '
            'vulnerability scans to identify outdated software, '
            'insecure configurations, and missing security patches.',
        bullets: ['Asset discovery', 'Vulnerability scanning', 'Risk assessment', 'Prioritization', 'Remediation', 'Verification'],
      ),
      LessonSection(
        heading: 'Benefits of Vulnerability Management',
        bullets: ['Reduces the attack surface', 'Improves security posture', 'Supports compliance requirements', 'Identifies high-risk systems', 'Helps prioritize remediation activities'],
      ),
      LessonSection(
        heading: 'Endpoint Protection in Cloud Environments',
        body:
            'Cloud workloads should be protected using endpoint '
            'security solutions similar to those used for traditional '
            'computers. Modern endpoint protection platforms provide '
            'malware detection, behavioral analysis, ransomware '
            'protection, Endpoint Detection and Response (EDR), threat '
            'intelligence integration, and incident investigation. '
            'Endpoint protection continuously monitors workload activity '
            'and alerts security teams when suspicious behavior is '
            'detected.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/endpoint_protection_cloud.jpg',
          caption: 'Endpoint protection agents continuously monitor cloud workloads and forward suspicious activity to the security team.',
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_workload_security_best_practices.jpg',
          caption: 'Securing cloud workloads requires consistent patching, endpoint protection, and continuous monitoring across VMs, containers, and serverless functions.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Cloud Workload Security',
        bullets: [
          'Keep operating systems and applications up to date',
          'Scan container images before deployment',
          'Apply the Principle of Least Privilege',
          'Enable endpoint protection on cloud workloads',
          'Continuously monitor workload activity',
          'Perform regular vulnerability assessments',
          'Secure Kubernetes clusters with strong authentication and RBAC',
          'Protect serverless applications using secure coding practices',
          'Remove unused workloads and unnecessary software',
          'Regularly review workload configurations and security settings',
        ],
      ),
    ],
  ),

  // 15 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Monitoring & Logging',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Security Doesn\'t End at Deployment',
        body:
            'Protecting cloud resources is not limited to configuring '
            'security controls during deployment. Organizations must '
            'continuously monitor their cloud environments to detect '
            'security incidents, operational issues, and policy '
            'violations.',
      ),
      LessonSection(
        heading: 'Cloud Monitoring vs. Cloud Logging',
        body:
            'Cloud Monitoring is the continuous observation of cloud '
            'resources to evaluate their performance, availability, '
            'health, and security. Cloud Logging involves collecting '
            'and storing records of activities performed by users, '
            'applications, and cloud services. Together, monitoring and '
            'logging provide visibility into cloud operations and help '
            'security teams quickly identify abnormal or malicious '
            'behavior.',
      ),
      LessonSection(
        heading: 'Objectives of Cloud Monitoring',
        bullets: ['Detect security threats', 'Monitor resource utilization', 'Identify system failures', 'Track configuration changes', 'Verify compliance with security policies', 'Support incident investigations'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_native_security_services.jpg',
          caption: 'Continuous monitoring allows organizations to identify issues early, before they affect business operations.',
        ),
      ),
      LessonSection(
        heading: 'Cloud Logging',
        body:
            'Every activity performed within a cloud environment '
            'generates logs. These logs provide valuable information '
            'about user actions, system events, and security-related '
            'activities — helping administrators understand what '
            'happened, when it happened, who performed the action, and '
            'whether the activity was successful.',
        bullets: ['User authentication logs', 'Administrative activity logs', 'Network traffic logs', 'Application logs', 'Database logs', 'Operating system logs', 'API activity logs'],
      ),
      LessonSection(
        heading: 'Importance of Log Collection',
        body:
            'Proper log collection supports security monitoring, '
            'incident response, compliance reporting, performance '
            'analysis, troubleshooting, and digital forensics. '
            'Organizations should protect logs against unauthorized '
            'modification or deletion to preserve their integrity.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Log Type', 'Information Recorded'],
          tableRows: [
            ['Authentication Log', 'User login attempts'],
            ['Activity Log', 'Administrative actions'],
            ['Network Log', 'Traffic entering and leaving the network'],
            ['Application Log', 'Application events and errors'],
            ['Database Log', 'Database queries and modifications'],
            ['Security Log', 'Security-related events and alerts'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Cloud-Native Security Services',
        body:
            'Major cloud providers offer built-in security services '
            'that help organizations monitor, detect, and respond to '
            'security threats. These cloud-native security services '
            'integrate with cloud resources and often require minimal '
            'infrastructure deployment.',
        bullets: ['Threat detection', 'Vulnerability assessment', 'Security recommendations', 'Configuration monitoring', 'Compliance assessment', 'Identity monitoring'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_native_security_services.jpg',
          caption: 'Cloud-native security services provide integrated monitoring and detection capabilities with minimal additional infrastructure.',
        ),
      ),
    ],
  ),

  // 16 ---------------------------------------------------------------------
  Lesson(
    title: 'SIEM, Cloud Threat Detection & Incident Response',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Security Information and Event Management (SIEM)',
        body:
            'Large organizations generate thousands or even millions of '
            'security events every day. Reviewing each event manually '
            'is impractical. A Security Information and Event '
            'Management (SIEM) solution collects, normalizes, '
            'correlates, and analyzes security events from multiple '
            'sources to identify potential security incidents.',
        bullets: ['Identity services', 'Virtual machines', 'Firewalls', 'Cloud applications', 'Databases', 'Endpoint protection platforms', 'Network devices'],
      ),
      LessonSection(
        heading: 'SIEM Functions',
        bullets: ['Log collection', 'Event correlation', 'Alert generation', 'Threat detection', 'Dashboard visualization', 'Incident investigation', 'Compliance reporting'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/siem.jpg',
          caption: 'A SIEM provides centralized visibility across the organization\'s entire cloud environment.',
        ),
      ),
      LessonSection(
        heading: 'Cloud Threat Detection',
        body:
            'Threat detection involves identifying suspicious or '
            'malicious activities occurring within a cloud environment. '
            'Modern cloud security platforms use multiple techniques to '
            'detect threats, including signature-based detection, '
            'behavioral analysis, machine learning, threat intelligence, '
            'and anomaly detection.',
        bullets: ['Multiple failed login attempts', 'Logins from unusual geographic locations', 'Unexpected administrative actions', 'Large volumes of data downloads', 'Privilege escalation attempts'],
      ),
      LessonSection(
        heading: 'Indicators of Suspicious Activity',
        bullets: ['New administrator account creation', 'Disabled security controls', 'Unusual API usage', 'Unexpected configuration changes', 'Network communication with unknown destinations', 'Abnormal resource usage'],
      ),
      LessonSection(
        heading: 'Cloud Incident Response',
        body:
            'Even with strong preventive controls, security incidents '
            'may still occur. Organizations therefore need a structured '
            'process for responding to cloud security events. A typical '
            'cloud incident response lifecycle consists of Preparation, '
            'Detection and Analysis, Containment, Eradication, Recovery, '
            'and Lessons Learned.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_incident_response.jpg',
          caption: 'The cloud incident response lifecycle minimizes the impact of an incident and improves future response efforts.',
        ),
      ),
      LessonSection(
        heading: 'Preparation & Detection and Analysis',
        body:
            'Preparation involves establishing policies, procedures, '
            'communication plans, and response teams before an incident '
            'occurs — incident response plans, staff training, backup '
            'procedures, security monitoring tools, and contact lists. '
            'During Detection and Analysis, security teams identify '
            'suspicious activities through monitoring systems, alerts, '
            'user reports, or automated detection tools, determining '
            'what happened, which systems are affected, the severity of '
            'the incident, and potential business impact.',
      ),
      LessonSection(
        heading: 'Containment & Eradication',
        body:
            'Containment prevents the incident from spreading — '
            'isolating virtual machines, blocking malicious IP '
            'addresses, disabling compromised user accounts, and '
            'restricting network communication. Eradication removes the '
            'root cause of the incident — removing malware, applying '
            'security patches, closing exploited vulnerabilities, and '
            'resetting compromised credentials.',
      ),
      LessonSection(
        heading: 'Recovery & Lessons Learned',
        body:
            'Recovery restores affected systems to normal operation — '
            'restoring backups, validating system integrity, monitoring '
            'for recurring attacks, and returning services to '
            'production. After the incident, organizations review what '
            'occurred, what worked well, areas for improvement, required '
            'policy updates, and additional security controls — '
            'strengthening future incident response capabilities.',
      ),
    ],
  ),

  // 17 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Compliance, CSPM, CWPP & CASB',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Cloud Governance and Compliance',
        body:
            'Organizations using cloud services must comply with '
            'legal, regulatory, and internal security requirements. '
            'Cloud Governance establishes policies and processes that '
            'guide how cloud resources are deployed, managed, and '
            'secured. Cloud Compliance ensures that cloud environments '
            'satisfy applicable laws, regulations, contractual '
            'obligations, and industry standards. Governance helps '
            'organizations maintain consistency, while compliance '
            'demonstrates adherence to required controls.',
      ),
      LessonSection(
        heading: 'Governance Objectives & Compliance Considerations',
        body:
            'Cloud governance helps organizations standardize cloud '
            'deployments, control resource usage, enforce security '
            'policies, manage costs, reduce operational risks, and '
            'support regulatory compliance. Organizations should '
            'regularly review security configurations, audit user '
            'permissions, maintain activity logs, protect sensitive '
            'information, conduct risk assessments, and document '
            'security controls. Examples of commonly referenced '
            'compliance frameworks include ISO/IEC 27001, PCI DSS, '
            'HIPAA (where applicable), and SOC 2.',
      ),
      LessonSection(
        heading: 'Cloud Security Posture Management (CSPM)',
        body:
            'Cloud environments are dynamic, with resources being '
            'created, modified, and removed frequently. Manual reviews '
            'alone are often insufficient to identify security '
            'misconfigurations. Cloud Security Posture Management '
            '(CSPM) solutions continuously assess cloud environments '
            'against security best practices and organizational '
            'policies.',
        bullets: ['Detecting misconfigured storage', 'Identifying publicly exposed resources', 'Monitoring identity and access configurations', 'Checking encryption settings', 'Evaluating compliance with security standards', 'Prioritizing remediation recommendations'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cspm.jpg',
          caption: 'CSPM continuously evaluates cloud configurations to reduce the likelihood of security incidents caused by configuration errors.',
        ),
      ),
      LessonSection(
        heading: 'Cloud Workload Protection Platforms (CWPP)',
        body:
            'A Cloud Workload Protection Platform (CWPP) provides '
            'security for workloads running in cloud environments, '
            'including virtual machines, containers, and serverless '
            'functions. A CWPP focuses on protecting workloads during '
            'runtime and throughout their operational lifecycle — '
            'malware detection, runtime monitoring, vulnerability '
            'assessment, file integrity monitoring, behavioral analysis, '
            'and compliance monitoring. Unlike CSPM, which evaluates '
            'cloud configurations, CWPP focuses on protecting the '
            'workloads themselves.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'CSPM', 'CWPP'],
          tableRows: [
            ['Primary Focus', 'Cloud configuration security', 'Workload security'],
            ['Protects', 'Cloud resources and settings', 'VMs, containers, serverless workloads'],
            ['Detects', 'Misconfigurations', 'Runtime threats and vulnerabilities'],
            ['Typical Use', 'Governance and compliance', 'Operational workload protection'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Cloud Access Security Broker (CASB)',
        body:
            'As organizations adopt Software as a Service (SaaS) '
            'applications, they require visibility into how users '
            'access cloud services. A Cloud Access Security Broker '
            '(CASB) acts as a policy enforcement point between users '
            'and cloud applications, helping organizations apply '
            'consistent security controls across multiple cloud '
            'services.',
        bullets: ['Discovery of cloud applications', 'Access control enforcement', 'Data Loss Prevention (DLP)', 'Threat protection', 'User activity monitoring', 'Compliance reporting'],
      ),
      LessonSection(
        heading: 'CASB in Practice',
        body:
            'For example, a CASB can prevent users from uploading '
            'confidential documents to unauthorized cloud storage '
            'services or enforce encryption policies before data is '
            'shared externally.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/casb.jpg',
          caption: 'A CASB sits between users and cloud applications, enforcing consistent security policy across every SaaS service in use.',
        ),
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_security_operations_best_practices.jpg',
          caption: 'Effective cloud security operations combine continuous monitoring, threat detection, and structured incident response.',
        ),
      ),
      LessonSection(
        heading: 'Best Practices for Cloud Security Operations',
        bullets: [
          'Enable continuous monitoring across cloud resources',
          'Collect and securely retain logs from critical systems',
          'Integrate cloud logs with a SIEM for centralized analysis',
          'Investigate security alerts promptly',
          'Maintain and regularly test incident response procedures',
          'Continuously assess cloud configurations using CSPM',
          'Protect workloads using a Cloud Workload Protection Platform (CWPP)',
          'Control access to SaaS applications through a CASB',
          'Perform regular compliance assessments and security audits',
        ],
      ),
    ],
  ),

  // 18 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Migration Security & DevSecOps',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Cloud Migration Security',
        body:
            'Many organizations are moving applications, databases, and '
            'business services from traditional on-premises data '
            'centers to cloud environments. While cloud migration '
            'offers scalability, flexibility, and cost benefits, it '
            'also introduces new security challenges. Cloud Migration '
            'Security refers to the security measures implemented '
            'before, during, and after moving workloads to the cloud. '
            'Cloud migration should be viewed as a business '
            'transformation project rather than simply transferring '
            'data from one location to another.',
      ),
      LessonSection(
        heading: 'Rehosting (Lift and Shift)',
        body:
            'Applications are moved to the cloud with minimal '
            'modifications, offering fast migration, minimal redesign, '
            'and lower migration effort. However, existing security '
            'weaknesses may also be migrated, and applications may not '
            'fully utilize cloud-native capabilities.',
      ),
      LessonSection(
        heading: 'Replatforming & Refactoring',
        body:
            'Replatforming migrates applications with limited '
            'modifications to improve cloud compatibility — migrating '
            'databases to managed database services, using managed '
            'storage services, or moving to managed web application '
            'platforms. Refactoring (Re-architecting) redesigns '
            'applications to take advantage of cloud-native services '
            'such as microservices, containers, serverless computing, '
            'and auto-scaling services. Although refactoring requires '
            'greater effort, it often provides better scalability, '
            'resilience, and long-term operational efficiency.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/devsecops.jpg',
          caption: 'Organizations choose a migration strategy based on the balance of speed, effort, and long-term cloud-native benefit they need.',
        ),
      ),
      LessonSection(
        heading: 'Security Considerations During Cloud Migration',
        body:
            'Before migrating workloads, organizations should perform a '
            'thorough security assessment across four key areas.',
      ),
      LessonSection(
        heading: 'Asset Inventory & Risk Assessment',
        body:
            'Organizations should identify applications, servers, '
            'databases, storage systems, user accounts, and network '
            'dependencies — a complete inventory helps prevent important '
            'resources from being overlooked during migration. They '
            'should also evaluate sensitive information, regulatory '
            'requirements, existing vulnerabilities, business impact, '
            'and recovery objectives to prioritize workloads and '
            'determine appropriate security controls.',
      ),
      LessonSection(
        heading: 'Secure Data Transfer & Post-Migration Validation',
        body:
            'During migration, data should be protected using '
            'encryption, secure communication protocols, access '
            'controls, and integrity verification, reducing the risk of '
            'interception or unauthorized modification. Following '
            'migration, organizations should verify access permissions, '
            'security configurations, network connectivity, application '
            'functionality, backup operations, and logging and '
            'monitoring — confirming that security controls operate '
            'correctly in the new environment.',
      ),
      LessonSection(
        heading: 'DevSecOps',
        body:
            'Traditional software development often treated security '
            'as the final step before deployment. This approach could '
            'delay projects and allow vulnerabilities to remain '
            'undetected until late in the development process. '
            'DevSecOps integrates security into every phase of the '
            'software development lifecycle (SDLC) — combining '
            'Development (Dev), Security (Sec), and Operations (Ops). '
            'Instead of performing security testing only after '
            'development is complete, security activities are performed '
            'continuously throughout development, testing, deployment, '
            'and operations.',
        bullets: ['Early identification of vulnerabilities', 'Faster software delivery', 'Automated security testing', 'Improved collaboration', 'Reduced remediation costs', 'More secure applications'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/devsecops.jpg',
          caption: 'DevSecOps embeds security throughout every phase of this lifecycle, rather than treating it as a final gate before release.',
        ),
      ),
    ],
  ),

  // 19 ---------------------------------------------------------------------
  Lesson(
    title: 'Infrastructure as Code Security & Cloud Automation',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Infrastructure as Code (IaC)',
        body:
            'Cloud environments are increasingly deployed using '
            'Infrastructure as Code (IaC). Instead of manually creating '
            'servers, networks, and storage through management '
            'consoles, administrators define infrastructure using '
            'configuration files that can be version-controlled and '
            'automatically deployed.',
        bullets: ['Virtual networks', 'Virtual machines', 'Storage accounts', 'Firewalls', 'Security groups', 'Identity configurations'],
      ),
      LessonSection(
        heading: 'IaC Security Risks',
        body:
            'Automation improves consistency and reduces manual '
            'configuration errors, but IaC introduces several security '
            'considerations of its own.',
        bullets: ['Insecure default configurations', 'Hardcoded passwords or API keys', 'Excessive permissions', 'Unreviewed configuration changes', 'Misconfigured cloud resources'],
      ),
      LessonSection(
        heading: 'IaC Security Best Practices',
        bullets: ['Review infrastructure templates before deployment', 'Store templates in version control systems', 'Scan templates for security issues', 'Remove embedded credentials', 'Use least privilege for deployment accounts', 'Apply automated policy validation'],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/iac_security.jpg',
          caption: 'Infrastructure templates should be validated for security issues before automated deployment, since errors are replicated at scale.',
        ),
      ),
      LessonSection(
        heading: 'Cloud Automation',
        body:
            'Large cloud environments often contain thousands of '
            'resources. Performing administrative tasks manually is '
            'inefficient and increases the likelihood of errors. Cloud '
            'Automation uses scripts and tools to perform repetitive '
            'tasks without manual intervention.',
        bullets: ['Provisioning virtual machines', 'Creating storage accounts', 'Deploying applications', 'Applying security updates', 'Creating backups', 'Managing user accounts'],
      ),
      LessonSection(
        heading: 'Cloud Orchestration',
        body:
            'While automation focuses on individual tasks, '
            'orchestration coordinates multiple automated tasks into a '
            'complete workflow. For example, deploying a secure web '
            'application may involve creating a virtual network, '
            'deploying virtual machines, configuring security groups, '
            'installing software, configuring monitoring, and '
            'registering backups. An orchestration platform performs '
            'these tasks in the correct sequence.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/cloud_automation_orchestration.jpg',
          caption: 'Orchestration sequences many individual automated tasks into one coordinated, repeatable deployment workflow.',
        ),
      ),
    ],
  ),

  // 20 ---------------------------------------------------------------------
  Lesson(
    title: 'Cloud Security Challenges, AI & Chapter Summary',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Cloud Security Challenges',
        body:
            'Although cloud computing offers numerous advantages, '
            'organizations continue to face several security '
            'challenges.',
      ),
      LessonSection(
        heading: 'Misconfigured Resources & Identity-Based Attacks',
        body:
            'Incorrectly configured storage accounts, firewalls, or '
            'identity permissions remain one of the leading causes of '
            'cloud security incidents. Compromised credentials can '
            'allow attackers to access cloud resources without '
            'exploiting software vulnerabilities at all — organizations '
            'should implement strong authentication and continuous '
            'monitoring to reduce this risk.',
      ),
      LessonSection(
        heading: 'Rapidly Changing Environments & Multi-Cloud Management',
        body:
            'Cloud resources are frequently created and removed. '
            'Security teams must continuously monitor these changes to '
            'maintain visibility. Organizations often use services from '
            'multiple cloud providers, and managing consistent security '
            'policies across different platforms can be genuinely '
            'complex.',
      ),
      LessonSection(
        heading: 'Compliance Requirements',
        body:
            'Organizations operating in regulated industries must '
            'ensure that cloud environments continue to satisfy legal '
            'and contractual obligations, even as the environment '
            'itself continues to change.',
      ),
      LessonSection(
        heading: 'Artificial Intelligence (AI) in Cloud Security',
        body:
            'Artificial Intelligence (AI) is increasingly used to '
            'improve cloud security operations by helping security '
            'teams analyze large volumes of data and identify '
            'suspicious activities more efficiently. AI does not replace '
            'security professionals but assists them by automating '
            'repetitive tasks and providing insights based on data '
            'analysis.',
        bullets: ['Threat detection', 'Behavioral analysis', 'Anomaly detection', 'Malware identification', 'Risk prioritization', 'Automated incident investigation'],
      ),
      LessonSection(
        heading: 'AI in Practice',
        body:
            'For example, AI can identify unusual login patterns or '
            'detect abnormal network activity that may indicate a '
            'compromised account.',
      ),
      LessonSection(
        heading: 'Benefits and Limits of AI',
        body:
            'Organizations may gain faster threat detection, reduced '
            'alert fatigue, improved operational efficiency, better '
            'prioritization of security events, and enhanced analysis '
            'of large datasets. AI should be used alongside human '
            'expertise, as automated systems may occasionally generate '
            'false positives or require human judgment to interpret '
            'complex situations.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cloud/ai_in_cloud_security.jpg',
          caption: 'AI assists human analysts by processing large volumes of cloud telemetry and surfacing the events most likely to matter.',
        ),
      ),
      LessonSection(
        heading: 'Cloud Security Best Practices — Chapter Summary',
        bullets: [
          'Understand and implement the Shared Responsibility Model',
          'Enable Multi-Factor Authentication (MFA) for all privileged accounts',
          'Apply the Principle of Least Privilege',
          'Encrypt sensitive data at rest and in transit',
          'Regularly review access permissions',
          'Continuously monitor cloud environments',
          'Keep workloads updated with security patches',
          'Perform regular vulnerability assessments',
          'Secure APIs and cloud applications',
          'Implement backup and disaster recovery plans',
          'Use Infrastructure as Code (IaC) securely',
          'Integrate security into the software development lifecycle through DevSecOps',
          'Conduct regular security awareness training for employees',
          'Periodically review cloud security configurations and compliance status',
        ],
      ),
      LessonSection(
        heading: 'Bringing This Chapter Together',
        body:
            'Cloud security is not a single product or technology — it '
            'is a continuous discipline spanning identity, data, '
            'network, workload, and operational domains, all built on '
            'top of the Shared Responsibility Model established at the '
            'start of this chapter. Whether an organization is running '
            'a handful of virtual machines or a globally distributed, '
            'multi-cloud environment, the same fundamental principles '
            'apply: verify identity continuously, protect data '
            'throughout its lifecycle, segment and monitor the network, '
            'harden every workload, and never stop watching.',
      ),
    ],
  ),

  // 21 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 26,
    quiz: [
      QuizQuestion(
        question: 'What is the fundamental principle of the Shared Responsibility Model?',
        options: [
          'The cloud provider is responsible for absolutely everything, including customer data',
          'The provider secures the cloud infrastructure, while the customer secures what they deploy and manage within the cloud',
          'The customer is solely responsible for physical data center security',
          'Security responsibility disappears once data moves to the cloud',
        ],
        correctIndex: 1,
        explanation: 'This is one of the most commonly misunderstood concepts in cloud security — the provider and customer each own distinct parts of the security responsibility.',
      ),
      QuizQuestion(
        question: 'Which cloud deployment model is dedicated to a single organization, whether hosted on-premises or by a third party?',
        options: ['Public Cloud', 'Private Cloud', 'Community Cloud', 'Hybrid Cloud'],
        correctIndex: 1,
        explanation: 'A Private Cloud is not shared with other customers, providing greater control over security, networking, and compliance for one organization.',
      ),
      QuizQuestion(
        question: 'In a Hybrid Cloud, why might an organization store sensitive customer data in a private cloud while hosting its public website in a public cloud?',
        options: [
          'Hybrid cloud does not actually allow mixing environments',
          'To balance flexibility, cost, and security by placing each workload in the environment best suited to its sensitivity and requirements',
          'Public clouds cannot host any sensitive data under any circumstances',
          'Private clouds cannot connect to the Internet at all',
        ],
        correctIndex: 1,
        explanation: 'Hybrid cloud lets organizations match each workload to the most appropriate environment rather than forcing an all-or-nothing choice.',
      ),
      QuizQuestion(
        question: 'As organizations move from IaaS to PaaS to SaaS, what happens to the division of responsibility?',
        options: [
          'The customer takes on more and more responsibility',
          'The cloud provider assumes greater responsibility for managing the environment',
          'Responsibility remains exactly the same across all three models',
          'The customer becomes responsible for the physical infrastructure',
        ],
        correctIndex: 1,
        explanation: 'IaaS gives customers the most control (and responsibility); SaaS shifts nearly all infrastructure and platform responsibility to the provider.',
      ),
      QuizQuestion(
        question: 'In IaaS, who is typically responsible for managing the operating system?',
        options: ['The cloud provider exclusively', 'The customer', 'Neither party manages the OS', 'A third-party auditor'],
        correctIndex: 1,
        explanation: 'In IaaS, the provider supplies virtualized infrastructure, but the customer manages the OS, applications, and security configurations on top of it.',
      ),
      QuizQuestion(
        question: 'What is the key difference between Authentication and Authorization?',
        options: [
          'They are the same process with different names',
          'Authentication verifies identity ("Who are you?"), while Authorization determines permissions ("What are you allowed to access?") and happens afterward',
          'Authorization always happens before Authentication',
          'Authentication determines what a user can do, not who they are',
        ],
        correctIndex: 1,
        explanation: 'Authentication confirms identity first; only after that succeeds does authorization determine what that identity is permitted to do.',
      ),
      QuizQuestion(
        question: 'What is the primary benefit of Identity Federation for organizations using multiple cloud services?',
        options: [
          'It requires creating separate accounts for every single application',
          'It allows trusted identity providers to authenticate users once and share that authentication with multiple cloud services, avoiding separate credentials per app',
          'It eliminates the need for any authentication whatsoever',
          'It only works with a single cloud application at a time',
        ],
        correctIndex: 1,
        explanation: 'Federation centralizes authentication through a trusted identity provider rather than requiring separate credentials for every service.',
      ),
      QuizQuestion(
        question: 'What is the key difference between RBAC and ABAC?',
        options: [
          'They are identical access control models',
          'RBAC grants permissions based on predefined roles; ABAC makes access decisions using multiple attributes like department, device compliance, location, and time of day',
          'ABAC is simpler to administer than RBAC',
          'RBAC is commonly used in Zero Trust architectures, not ABAC',
        ],
        correctIndex: 1,
        explanation: 'ABAC provides more dynamic, context-aware access decisions using multiple attributes, while RBAC relies on simpler, predefined role assignments.',
      ),
      QuizQuestion(
        question: 'What does Privileged Access Management (PAM) specifically help organizations do?',
        options: [
          'Grant every user administrative access by default',
          'Secure, monitor, and control the use of privileged accounts through capabilities like Just-in-Time access and session recording',
          'Eliminate the need for any administrative accounts',
          'Replace the need for Multi-Factor Authentication',
        ],
        correctIndex: 1,
        explanation: 'PAM specifically addresses the elevated risk of privileged/administrative accounts through discovery, JIT access, session monitoring, and approval workflows.',
      ),
      QuizQuestion(
        question: 'What is the difference between Confidential and Restricted data classifications?',
        options: [
          'They are identical classification levels',
          'Confidential data (like customer records) requires encryption and strict access controls; Restricted data (like encryption keys or medical records) represents the most sensitive information requiring the highest level of protection',
          'Restricted data requires no protection at all',
          'Confidential data is always less sensitive than Public data',
        ],
        correctIndex: 1,
        explanation: 'Restricted data sits at the top of the sensitivity scale, above Confidential, Internal, and Public, requiring the strictest access controls and monitoring.',
      ),
      QuizQuestion(
        question: 'What is the key difference between Client-Side Encryption and Server-Side Encryption?',
        options: [
          'They are the same approach with different names',
          'Client-Side Encryption encrypts data before upload (customer typically controls keys); Server-Side Encryption encrypts data after upload (provider manages the process)',
          'Server-Side Encryption always provides more customer control',
          'Client-Side Encryption is performed entirely by the cloud provider',
        ],
        correctIndex: 1,
        explanation: 'The key distinction is WHEN and WHERE encryption happens, which directly affects who controls the encryption keys.',
      ),
      QuizQuestion(
        question: 'How does Tokenization differ from encryption in protecting sensitive data like credit card numbers?',
        options: [
          'They are functionally identical',
          'Tokenization replaces sensitive data with a non-reversible token mapped in a secure database, rather than relying on a mathematically reversible decryption key',
          'Tokenization requires a decryption key just like encryption',
          'Tokenization is only used for encrypting entire databases',
        ],
        correctIndex: 1,
        explanation: 'Tokenized data has no mathematical relationship to the original value — an attacker who steals it has nothing to decrypt, unlike stolen ciphertext.',
      ),
      QuizQuestion(
        question: 'What does a Security Group protect in cloud networking, as opposed to a Network ACL?',
        options: [
          'Security Groups protect entire subnets, while Network ACLs protect individual resources',
          'Security Groups protect individual cloud resources like VMs, while Network ACLs protect entire subnets',
          'They protect exactly the same scope',
          'Neither actually filters any network traffic',
        ],
        correctIndex: 1,
        explanation: 'Security Groups are resource-level virtual firewalls; Network ACLs operate at the broader subnet level — using both provides layered protection.',
      ),
      QuizQuestion(
        question: 'What is the purpose of a Bastion Host (Jump Server)?',
        options: [
          'To directly expose production servers to the Internet',
          'To provide a hardened, single, auditable entry point for administrators, rather than exposing production systems directly',
          'To replace the need for any authentication',
          'To automatically encrypt all cloud storage',
        ],
        correctIndex: 1,
        explanation: 'Bastion hosts centralize and harden administrative access, reducing the attack surface and simplifying monitoring of privileged activity.',
      ),
      QuizQuestion(
        question: 'What is the core principle behind Zero Trust Networking?',
        options: [
          '"Trust users automatically once they are inside the corporate network"',
          '"Never trust, always verify" — every access request is evaluated regardless of where it originates',
          '"Verify once at initial login, then trust permanently"',
          '"Only external users need to be verified"',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust rejects the old assumption that internal network location implies trustworthiness, evaluating every request continuously.',
      ),
      QuizQuestion(
        question: 'Why do containers require different security considerations than virtual machines?',
        options: [
          'Containers require no security controls at all',
          'Containers share the host operating system kernel, making them lightweight but meaning a vulnerable image or kernel-level issue can affect every container built from it',
          'Containers are always more secure than virtual machines with no tradeoffs',
          'Virtual machines and containers have identical security models',
        ],
        correctIndex: 1,
        explanation: 'Sharing the host kernel is what makes containers lightweight, but it also means container-specific risks like vulnerable images and kernel-level exposure need dedicated attention.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of Role-Based Access Control (RBAC) within a Kubernetes cluster?',
        options: [
          'To grant every user unrestricted cluster-wide access',
          'To restrict administrative privileges within the cluster, applying the same least-privilege principle used elsewhere in cloud IAM',
          'To replace the need for the Kubernetes control plane',
          'RBAC cannot be used within Kubernetes',
        ],
        correctIndex: 1,
        explanation: 'Kubernetes RBAC scopes the same least-privilege principle down to the cluster level, controlling who can perform which actions.',
      ),
      QuizQuestion(
        question: 'In serverless computing, who remains responsible for securing application code and access permissions?',
        options: [
          'The cloud provider handles all security with no customer responsibility',
          'The organization/developer remains responsible for application code, identities, access permissions, and data, even though the provider manages the infrastructure',
          'No one is responsible for serverless security',
          'Only end users are responsible for serverless security',
        ],
        correctIndex: 1,
        explanation: 'Even in serverless models, the Shared Responsibility Model still applies — the provider manages infrastructure, but code and data security remain with the customer.',
      ),
      QuizQuestion(
        question: 'What is the key difference between CSPM and CWPP?',
        options: [
          'They are identical tools with different names',
          'CSPM focuses on cloud configuration security (misconfigurations), while CWPP focuses on protecting the workloads themselves during runtime',
          'CWPP only evaluates compliance, never actual workload threats',
          'CSPM protects containers while CWPP protects storage accounts',
        ],
        correctIndex: 1,
        explanation: 'CSPM is about getting the configuration right; CWPP is about protecting the running workload itself — complementary, not overlapping, functions.',
      ),
      QuizQuestion(
        question: 'What does a Cloud Access Security Broker (CASB) provide?',
        options: [
          'Nothing related to SaaS application security',
          'A policy enforcement point between users and cloud applications, providing visibility, access control, DLP, and consistent security across multiple SaaS services',
          'CASB only works for a single cloud application',
          'CASB replaces the need for any encryption',
        ],
        correctIndex: 1,
        explanation: 'CASB gives organizations centralized visibility and control across the many different SaaS applications employees actually use.',
      ),
      QuizQuestion(
        question: 'What is the key difference between Rehosting ("Lift and Shift") and Refactoring during cloud migration?',
        options: [
          'They are identical migration strategies',
          'Rehosting moves applications with minimal changes (fast but may carry over existing weaknesses); Refactoring redesigns applications to use cloud-native services (more effort, better long-term scalability)',
          'Refactoring is always faster than Rehosting',
          'Rehosting always produces better long-term results than Refactoring',
        ],
        correctIndex: 1,
        explanation: 'Rehosting prioritizes migration speed; Refactoring prioritizes long-term cloud-native benefits at the cost of greater upfront effort.',
      ),
      QuizQuestion(
        question: 'What does DevSecOps fundamentally change about how security is handled in the software development lifecycle?',
        options: [
          'Security testing only occurs after development is completely finished',
          'Security is integrated into every phase of development, testing, deployment, and operations, rather than being a final gate before release',
          'DevSecOps removes the need for any security testing',
          'DevSecOps only applies to on-premises software, never cloud applications',
        ],
        correctIndex: 1,
        explanation: 'DevSecOps embeds continuous security throughout the SDLC, catching vulnerabilities earlier rather than only at the very end.',
      ),
      QuizQuestion(
        question: 'What security risks does Infrastructure as Code (IaC) specifically introduce if not properly managed?',
        options: [
          'IaC introduces no security risks whatsoever',
          'Insecure default configurations, hardcoded credentials, excessive permissions, and unreviewed configuration changes — all of which get replicated at scale through automation',
          'IaC only affects a single server at a time, limiting any risk',
          'IaC eliminates the possibility of misconfiguration entirely',
        ],
        correctIndex: 1,
        explanation: 'Because IaC templates are reused repeatedly, a single flawed template can replicate a security weakness across many deployments.',
      ),
      QuizQuestion(
        question: 'Why does multi-cloud management present a particular security challenge?',
        options: [
          'Multi-cloud environments are actually simpler to secure than single-cloud environments',
          'Organizations using multiple cloud providers must maintain consistent security policies across genuinely different platforms, which can be complex',
          'Multi-cloud eliminates the need for any security monitoring',
          'Multi-cloud only applies to organizations with a single cloud provider',
        ],
        correctIndex: 1,
        explanation: 'Different providers have different tools, configurations, and controls, making consistent policy enforcement across platforms a real operational challenge.',
      ),
      QuizQuestion(
        question: 'What role does AI play in cloud security, according to how it should ideally be used?',
        options: [
          'AI completely replaces the need for human security professionals',
          'AI assists security professionals by automating repetitive analysis and surfacing insights from large datasets, but should be used alongside human judgment since it may generate false positives',
          'AI should never be used in any cloud security context',
          'AI is only useful for marketing, not actual threat detection',
        ],
        correctIndex: 1,
        explanation: 'AI is positioned as an assistant to human analysts, not a replacement — automated systems still require human judgment for complex situations.',
      ),
    ],
  ),
];
