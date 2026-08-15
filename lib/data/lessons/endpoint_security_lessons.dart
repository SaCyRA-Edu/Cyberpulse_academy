import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> endpointSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Why Endpoint Management Matters',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Thousands of Devices, One Attack Surface',
        body:
            'Modern organizations often manage thousands of desktops, '
            'laptops, mobile devices, virtual machines, and corporate-'
            'owned smartphones spread across multiple offices, remote '
            'locations, and cloud environments. Ensuring that each of '
            'these endpoints remains secure, compliant, and properly '
            'configured is a significant challenge — manual '
            'administration is no longer practical given the scale and '
            'complexity of today\'s enterprise environments.',
      ),
      LessonSection(
        heading: 'What Endpoint Management Actually Is',
        body:
            'Endpoint management is the process of centrally '
            'administering, securing, monitoring, and maintaining '
            'endpoint devices throughout their lifecycle. It enables IT '
            'and security teams to deploy operating systems, install '
            'applications, configure security settings, enforce '
            'compliance policies, distribute updates, monitor device '
            'health, and remotely troubleshoot issues — all without '
            'requiring physical access to the device.',
      ),
      LessonSection(
        heading: 'From On-Premises to Cloud-Native',
        body:
            'Modern endpoint management platforms have evolved from '
            'traditional on-premises management systems into cloud-based '
            'solutions that support hybrid workforces and diverse device '
            'ecosystems. Organizations now manage Windows, macOS, Linux, '
            'Android, and iOS devices from centralized management '
            'consoles while applying consistent security policies across '
            'the enterprise. Effective endpoint management not only '
            'improves operational efficiency but also plays a critical '
            'role in reducing cyber risk by ensuring that devices remain '
            'secure, updated, and compliant with organizational policies.',
      ),
      LessonSection(
        heading: 'Every Endpoint Is a Potential Entry Point',
        body:
            'Every endpoint connected to an enterprise network represents '
            'a potential entry point for cyber attackers. An unpatched '
            'laptop, an unmanaged smartphone, or a misconfigured '
            'workstation can become the initial foothold for ransomware, '
            'malware, or credential theft. As organizations adopt remote '
            'work, cloud computing, and Bring Your Own Device (BYOD) '
            'programs, maintaining visibility and control over endpoint '
            'devices becomes increasingly important.',
      ),
      LessonSection(
        heading: 'What Effective Endpoint Management Enables',
        body: 'Effective endpoint management enables organizations to:',
        bullets: [
          'Maintain a complete inventory of enterprise devices',
          'Deploy standardized security configurations',
          'Enforce compliance with organizational policies',
          'Automate software deployment and updates',
          'Monitor endpoint health',
          'Protect sensitive corporate data',
          'Support remote users',
          'Reduce operational costs through centralized administration',
        ],
      ),
      LessonSection(
        heading: 'The Cost of Skipping It',
        body:
            'Without centralized management, organizations may struggle '
            'to identify vulnerable devices, maintain software '
            'consistency, or respond quickly to emerging security '
            'threats — and the gaps that show up are exactly where '
            'attackers look first.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'The Endpoint Lifecycle & Its Building Blocks',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Endpoint Lifecycle Management',
        body:
            'Endpoint management extends throughout the entire lifecycle '
            'of a device, from the time it is procured until it is '
            'securely retired. A typical endpoint lifecycle consists of '
            'several stages:',
        bullets: [
          'Device procurement',
          'Device enrollment',
          'Configuration',
          'Application deployment',
          'Security policy enforcement',
          'Monitoring',
          'Patch management',
          'Compliance verification',
          'Retirement or secure disposal',
        ],
      ),
      LessonSection(
        body:
            'Managing each stage consistently helps ensure that devices '
            'remain secure throughout their operational life — a gap at '
            'any single stage, such as skipping secure disposal or never '
            'formally enrolling a device, can undo the security work done '
            'at every other stage.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/endpoint_lifecycle.jpg',
          caption:
              'Endpoint management encompasses the entire lifecycle of a '
              'device, beginning with procurement and continuing through '
              'configuration, monitoring, maintenance, and secure '
              'retirement.',
        ),
      ),
      LessonSection(
        heading: 'Components of Endpoint Management',
        body:
            'Modern endpoint management solutions combine several '
            'capabilities into a single management platform. Key '
            'components include device enrollment, configuration '
            'management, and software deployment — each covered in turn '
            'below.',
      ),
      LessonSection(
        heading: 'Device Enrollment',
        body:
            'Before a device can be managed, it must be enrolled into the '
            'organization\'s management platform. Enrollment establishes '
            'trust between the endpoint and the management system while '
            'enabling administrators to apply security policies and '
            'deploy software remotely. Enrollment methods include:',
        bullets: [
          'Manual enrollment',
          'Automatic enrollment',
          'Zero-touch provisioning',
          'Windows Autopilot',
          'Apple Automated Device Enrollment (ADE)',
          'Android Zero-touch Enrollment',
        ],
      ),
      LessonSection(
        body:
            'Zero-touch provisioning significantly reduces deployment '
            'time by automatically configuring devices during their '
            'initial setup — a new laptop can ship directly to a remote '
            'employee, enroll itself the moment it powers on, and arrive '
            'fully configured without IT ever physically touching it.',
      ),
      LessonSection(
        heading: 'Configuration Management',
        body:
            'Configuration management ensures that all enterprise devices '
            'follow standardized security and operational settings. '
            'Typical configuration policies include:',
        bullets: [
          'Password requirements',
          'Screen lock settings',
          'BitLocker or FileVault encryption',
          'Firewall configuration',
          'Microsoft Defender settings',
          'Wi-Fi profiles',
          'VPN configuration',
          'Browser security settings',
          'Certificate deployment',
        ],
      ),
      LessonSection(
        body:
            'Consistent configurations reduce security vulnerabilities '
            'and simplify endpoint administration — when every device '
            'starts from the same baseline, drift is easier to spot, and '
            'fixing one misconfigured setting fixes it everywhere at '
            'once.',
      ),
      LessonSection(
        heading: 'Software Deployment',
        body:
            'Enterprise management platforms allow administrators to '
            'remotely deploy applications without requiring user '
            'intervention. Software deployment may include:',
        bullets: [
          'Business applications',
          'Productivity software',
          'Security agents',
          'VPN clients',
          'Collaboration tools',
          'Browser extensions',
        ],
      ),
      LessonSection(
        body:
            'Organizations typically use application groups and '
            'deployment rings to minimize operational disruption during '
            'large-scale software rollouts — pushing a new client to '
            'every device in the company on the same afternoon is a good '
            'way to overwhelm the help desk if something goes wrong.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/management_platforms.jpg',
          caption:
              'Modern endpoint management platforms provide centralized '
              'administration of multiple operating systems and device '
              'types from a single management console.',
        ),
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Modern Endpoint Management Platforms',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Modern Endpoint Management Platforms',
        body:
            'Organizations use various endpoint management platforms '
            'depending on their infrastructure, business requirements, '
            'and device ecosystem. Some commonly used enterprise '
            'solutions include:',
        bullets: [
          'Microsoft Intune',
          'Microsoft Configuration Manager (formerly SCCM)',
          'VMware Workspace ONE',
          'Jamf Pro',
          'Kandji',
          'IBM MaaS360',
          'Ivanti Endpoint Manager',
        ],
      ),
      LessonSection(
        body:
            'These platforms provide capabilities such as policy '
            'enforcement, software deployment, inventory management, '
            'compliance monitoring, and remote administration. '
            'Cloud-based solutions have become increasingly popular '
            'because they simplify management of remote and hybrid '
            'workforces without requiring users to connect through '
            'corporate networks.',
      ),
      LessonSection(
        heading: 'Microsoft Intune',
        body:
            'Microsoft Intune is a cloud-based endpoint management '
            'solution that enables organizations to manage Windows, '
            'macOS, Android, iOS, and Linux devices from the Microsoft '
            'Intune admin center. Intune integrates with:',
        bullets: [
          'Microsoft Entra ID',
          'Microsoft Defender for Endpoint',
          'Microsoft Purview',
          'Windows Autopilot',
          'Microsoft 365',
          'Conditional Access',
        ],
      ),
      LessonSection(
        body: 'Key capabilities include:',
        bullets: [
          'Device enrollment',
          'Compliance policies',
          'Configuration profiles',
          'Application deployment',
          'Remote actions',
          'Device inventory',
          'Endpoint security policies',
          'Patch management',
        ],
      ),
      LessonSection(
        body:
            'Because Intune is cloud-native, administrators can manage '
            'devices regardless of their physical location, making it '
            'well suited for organizations with remote and hybrid '
            'workforces.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global consulting company supports more than 8,000 '
            'employees working from offices and remote locations across '
            'multiple countries. All newly purchased Windows laptops are '
            'shipped directly to employees and automatically enrolled '
            'using Windows Autopilot. During the initial setup process, '
            'Microsoft Intune applies configuration profiles, enables '
            'BitLocker encryption, installs Microsoft Defender for '
            'Endpoint, deploys Microsoft 365 applications, configures VPN '
            'settings, and registers the devices with Microsoft Entra ID.',
      ),
      LessonSection(
        body:
            'Compliance policies verify that devices have current '
            'security updates, active endpoint protection, and full disk '
            'encryption before users are granted access to corporate '
            'resources. If a device becomes non-compliant, Conditional '
            'Access automatically restricts access to Microsoft 365 '
            'services until the issue is resolved. This centralized '
            'approach enables the organization to securely manage '
            'thousands of devices without requiring manual configuration '
            'or on-site IT support.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain a centralized inventory of all managed devices',
          'Automate device enrollment whenever possible',
          'Apply standardized configuration baselines',
          'Use role-based access control (RBAC) for administrative functions',
          'Regularly review compliance policies',
          'Remove inactive or retired devices promptly',
          'Integrate endpoint management with identity and security platforms',
          'Monitor endpoint health continuously',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Centralized endpoint management significantly reduces '
            'administrative overhead while improving security. Automated '
            'enrollment, standardized configurations, and continuous '
            'compliance monitoring help ensure that every managed device '
            'adheres to the organization\'s security requirements.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Device Compliance & Conditional Access',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Device Compliance Management',
        body:
            'A device that has been successfully enrolled into an '
            'endpoint management platform is not automatically considered '
            'secure. Over time, security configurations may change, '
            'software may become outdated, antivirus protection may be '
            'disabled, or encryption may be removed. Device compliance '
            'management is the continuous process of verifying that '
            'managed devices satisfy the organization\'s predefined '
            'security requirements. Compliance policies automatically '
            'evaluate each endpoint and determine whether it is trusted '
            'to access corporate resources. Rather than relying on manual '
            'inspections, endpoint management platforms evaluate '
            'compliance continuously and report the status of each '
            'device in near real time.',
      ),
      LessonSection(
        body: 'Common compliance requirements include:',
        bullets: [
          'Operating system version',
          'Latest security updates installed',
          'Disk encryption enabled',
          'Password complexity requirements',
          'Secure Boot enabled',
          'Trusted Platform Module (TPM) available',
          'Endpoint protection active',
          'Firewall enabled',
          'Device not rooted or jailbroken',
          'Device risk level below an acceptable threshold',
        ],
      ),
      LessonSection(
        body:
            'If a device fails one or more compliance checks, '
            'administrators can automatically restrict access until the '
            'issue has been resolved.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/compliance_policies.jpg',
          caption:
              'Endpoint management platforms continuously evaluate '
              'managed devices against organizational compliance policies '
              'before granting access to corporate resources.',
        ),
      ),
      LessonSection(
        heading: 'Compliance Policies',
        body:
            'Compliance policies define the security standards that '
            'enterprise devices must satisfy before accessing '
            'organizational applications and data. These policies help '
            'ensure that every managed endpoint maintains a consistent '
            'security posture regardless of its operating system or '
            'location. Examples of compliance rules include:',
        bullets: [
          'Windows devices must run a supported operating system version',
          'BitLocker encryption must be enabled',
          'Microsoft Defender Antivirus must be active',
          'Firewall protection must remain enabled',
          'Password complexity requirements must be enforced',
          'Devices must not be rooted or jailbroken',
          'Security updates must be installed within a specified timeframe',
          'Endpoint risk score must remain below a defined threshold',
        ],
      ),
      LessonSection(
        body:
            'Modern management platforms evaluate these rules '
            'automatically and continuously.',
      ),
      LessonSection(
        heading: 'Conditional Access Integration',
        body:
            'Device compliance becomes significantly more powerful when '
            'integrated with identity and access management. Solutions '
            'such as Microsoft Entra ID and Microsoft Intune work '
            'together to enforce Conditional Access policies. Instead of '
            'simply verifying a user\'s identity, Conditional Access also '
            'evaluates the security posture of the device attempting to '
            'access organizational resources.',
      ),
      LessonSection(
        body:
            'For example, a user may successfully authenticate using '
            'multi-factor authentication (MFA). However, if the device is '
            'found to be non-compliant because disk encryption has been '
            'disabled or antivirus software is no longer running, access '
            'to Microsoft 365, SharePoint, or other enterprise '
            'applications can be automatically blocked until compliance '
            'is restored. This approach supports a Zero Trust security '
            'model by continuously verifying both user identity and '
            'device health.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational engineering company manages more than '
            '15,000 Windows, macOS, Android, and iOS devices using '
            'Microsoft Intune. Each enrolled device is evaluated against '
            'compliance policies requiring BitLocker or FileVault '
            'encryption, active endpoint protection, current security '
            'updates, and Secure Boot. Devices that fail compliance '
            'checks are automatically marked as non-compliant and denied '
            'access to Microsoft 365 through Conditional Access policies.',
      ),
      LessonSection(
        body:
            'When an employee reports a lost corporate tablet during '
            'international travel, the IT team immediately performs a '
            'remote wipe, removing sensitive engineering documents and '
            'corporate credentials from the device.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Inventory, Remote Administration & Analytics',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Device Inventory Management',
        body:
            'One of the most important functions of an endpoint '
            'management platform is maintaining an accurate inventory of '
            'all managed devices. A centralized inventory enables '
            'administrators to answer questions such as:',
        bullets: [
          'How many devices are managed?',
          'Which operating systems are deployed?',
          'Which devices require updates?',
          'Which devices have not checked in recently?',
          'Which users are assigned to specific devices?',
          'Which devices have reached end-of-life?',
        ],
      ),
      LessonSection(
        body:
            'Accurate inventory information is essential for asset '
            'management, security monitoring, software licensing, and '
            'compliance reporting. Typical inventory information '
            'includes:',
        bullets: [
          'Device name',
          'Serial number',
          'Assigned user',
          'Operating system version',
          'Hardware specifications',
          'Installed applications',
          'Compliance status',
          'Encryption status',
          'Last check-in time',
          'Device ownership (corporate or personal)',
        ],
      ),
      LessonSection(
        body:
            'Maintaining an up-to-date inventory also simplifies incident '
            'response by allowing security teams to quickly identify '
            'affected devices during security investigations.',
      ),
      LessonSection(
        heading: 'Remote Administration',
        body:
            'Modern organizations frequently support employees working '
            'from home, branch offices, or while traveling. As a result, '
            'IT administrators require the ability to manage devices '
            'without requiring physical access. Endpoint management '
            'platforms provide several remote administration '
            'capabilities, including:',
        bullets: [
          'Remote lock',
          'Remote restart',
          'Remote wipe',
          'Password reset',
          'Sync policies',
          'Application installation',
          'Application removal',
          'Device retirement',
          'Certificate deployment',
          'Configuration updates',
        ],
      ),
      LessonSection(
        body:
            'These capabilities significantly reduce support costs while '
            'improving operational efficiency. For example, if an '
            'employee reports a lost corporate laptop, administrators can '
            'immediately issue a remote wipe command to remove sensitive '
            'organizational data before unauthorized individuals gain '
            'access.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/remote_admin_analytics.jpg',
          caption:
              'Endpoint management platforms provide administrators with '
              'centralized remote management capabilities that improve '
              'operational efficiency while maintaining organizational '
              'security.',
        ),
      ),
      LessonSection(
        heading: 'Endpoint Analytics',
        body:
            'In addition to enforcing security policies, modern endpoint '
            'management platforms collect operational telemetry that '
            'helps administrators understand device performance and user '
            'experience. This capability is commonly referred to as '
            'endpoint analytics. Endpoint analytics helps organizations '
            'identify:',
        bullets: [
          'Slow device startup times',
          'Application crashes',
          'Login performance issues',
          'Low disk space',
          'Battery health',
          'Frequent system errors',
          'Hardware reliability',
          'User productivity issues',
        ],
      ),
      LessonSection(
        body:
            'By analyzing this information, IT teams can proactively '
            'resolve problems before they affect users. For example, if '
            'analytics identify that a recent application update '
            'significantly increases boot time across hundreds of '
            'laptops, administrators can quickly investigate and deploy '
            'corrective actions.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational engineering company manages more than '
            '15,000 Windows, macOS, Android, and iOS devices using '
            'Microsoft Intune. Administrators use the centralized '
            'inventory to identify devices approaching hardware '
            'end-of-life and schedule replacement before failures occur.',
      ),
      LessonSection(
        body:
            'Endpoint analytics later reveal that a recently deployed '
            'application update is causing unusually slow login times on '
            'Windows laptops. Administrators identify the issue through '
            'centralized reporting and deploy an updated application '
            'package to restore normal performance across the enterprise.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Define compliance policies based on organizational security requirements',
          'Continuously monitor device compliance',
          'Integrate compliance evaluation with Conditional Access',
          'Maintain an accurate and up-to-date device inventory',
          'Automate remote administrative actions where appropriate',
          'Review inactive devices regularly and retire obsolete assets',
          'Use endpoint analytics to proactively identify performance issues',
          'Regularly audit compliance reports and management policies',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Endpoint management extends beyond device configuration. '
            'Continuous compliance monitoring, centralized inventory '
            'management, remote administration, and endpoint analytics '
            'help organizations maintain a secure, efficient, and '
            'resilient endpoint environment throughout the device '
            'lifecycle.',
      ),
      LessonSection(
        heading: 'Comparison of Enterprise Endpoint Management Functions',
        body:
            'Modern endpoint management platforms combine multiple '
            'administrative and security functions into a centralized '
            'solution that supports the complete endpoint lifecycle:',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Function', 'Purpose', 'Security Benefit'],
          tableRows: [
            ['Device Enrollment', 'Register devices for management', 'Establishes trust and centralized control'],
            ['Configuration Management', 'Apply standardized settings', 'Reduces configuration drift'],
            ['Compliance Management', 'Verify security posture', 'Prevents non-compliant devices from accessing resources'],
            ['Application Deployment', 'Install and update software', 'Ensures consistent application versions'],
            ['Device Inventory', 'Track enterprise assets', 'Improves visibility and asset management'],
            ['Remote Administration', 'Manage devices remotely', 'Supports hybrid and remote work'],
            ['Endpoint Analytics', 'Monitor performance and health', 'Enables proactive issue resolution'],
            ['Device Retirement', 'Securely remove devices', 'Protects organizational data at end-of-life'],
          ],
        ),
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Why Patch Management Matters',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'A Race Against Disclosed Vulnerabilities',
        body:
            'In today\'s rapidly evolving threat landscape, cybercriminals '
            'continuously search for weaknesses in operating systems, '
            'applications, firmware, and network devices. Software '
            'vulnerabilities are discovered almost daily, and attackers '
            'often attempt to exploit them before organizations have an '
            'opportunity to apply security updates. As a result, '
            'maintaining secure and up-to-date systems has become one of '
            'the most critical responsibilities of enterprise IT and '
            'cybersecurity teams.',
      ),
      LessonSection(
        heading: 'Patch Management vs. Vulnerability Management',
        body:
            'Patch management is the systematic process of acquiring, '
            'testing, deploying, and verifying software updates to '
            'correct security vulnerabilities, fix software defects, '
            'improve system stability, and introduce new functionality. '
            'When combined with vulnerability management, organizations '
            'can prioritize remediation efforts based on business risk '
            'and reduce the likelihood of successful cyberattacks.',
      ),
      LessonSection(
        body:
            'Patch and vulnerability management are closely related but '
            'serve different purposes. Vulnerability management focuses '
            'on identifying, assessing, and prioritizing security '
            'weaknesses, while patch management implements software '
            'updates or other remediation measures to eliminate those '
            'weaknesses. Together, these processes form a fundamental '
            'component of an organization\'s cybersecurity strategy. '
            'Effective patch management not only protects enterprise '
            'systems from exploitation but also supports regulatory '
            'compliance, improves operational stability, and reduces the '
            'organization\'s overall attack surface.',
      ),
      LessonSection(
        heading: 'Why Patch Management Is Important',
        body:
            'Most successful cyberattacks exploit vulnerabilities that '
            'are already publicly known and for which security patches '
            'have been available for weeks or even months. Attackers '
            'actively scan the Internet looking for systems that have not '
            'been updated, allowing them to compromise organizations '
            'using well-documented exploits. Several major cybersecurity '
            'incidents, including ransomware outbreaks and large-scale '
            'data breaches, have been linked to organizations delaying '
            'critical security updates.',
      ),
      LessonSection(
        body: 'A structured patch management program helps organizations:',
        bullets: [
          'Eliminate known software vulnerabilities',
          'Reduce the attack surface',
          'Improve operating system stability',
          'Correct software defects',
          'Maintain regulatory compliance',
          'Protect sensitive business data',
          'Improve application reliability',
          'Reduce the likelihood of malware infections',
        ],
      ),
      LessonSection(
        body:
            'Regular patching remains one of the most effective and '
            'cost-efficient cybersecurity controls available to '
            'organizations.',
      ),
      LessonSection(
        heading: 'Understanding Software Patches',
        body:
            'A software patch is a package released by a software vendor '
            'to modify an existing application or operating system. '
            'Patches may address security vulnerabilities, software bugs, '
            'compatibility issues, or performance improvements. Depending '
            'on their purpose, patches may be categorized into several '
            'types.',
      ),
      LessonSection(
        heading: 'Security Patches',
        body:
            'Security patches correct vulnerabilities that could be '
            'exploited by attackers. These patches are generally '
            'considered the highest priority because delaying deployment '
            'increases organizational risk.',
      ),
      LessonSection(
        heading: 'Bug Fixes, Feature Updates & Firmware Updates',
        body:
            'Bug fix patches correct software defects that affect '
            'functionality or reliability without necessarily addressing '
            'security concerns. Feature updates introduce new '
            'capabilities or improve existing functionality — although '
            'useful, they generally receive lower deployment priority '
            'than security patches. Firmware updates apply to hardware '
            'devices such as routers, switches, servers, storage systems, '
            'and Trusted Platform Modules (TPMs); these updates often '
            'correct hardware-related vulnerabilities or improve device '
            'reliability.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/patch_types.jpg',
          caption:
              'Software vendors release different types of patches to '
              'improve security, reliability, compatibility, and '
              'functionality. Security patches typically receive the '
              'highest deployment priority because they address known '
              'vulnerabilities.',
        ),
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'The Patch Management Lifecycle',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Patch Management Lifecycle',
        body:
            'Successful patch management follows a structured lifecycle '
            'rather than simply installing updates whenever they become '
            'available. A mature patch management program typically '
            'includes the following stages:',
        bullets: [
          'Vulnerability identification',
          'Patch availability review',
          'Risk assessment',
          'Patch testing',
          'Approval',
          'Deployment',
          'Verification',
          'Documentation',
          'Continuous monitoring',
        ],
      ),
      LessonSection(
        body:
            'Each stage helps reduce operational risk while ensuring that '
            'security updates are deployed consistently across the '
            'enterprise.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/patch_lifecycle.jpg',
          caption:
              'Enterprise patch management follows a structured lifecycle '
              'that balances rapid vulnerability remediation with '
              'operational stability and change management requirements.',
        ),
      ),
      LessonSection(
        heading: 'Vulnerability Identification',
        body:
            'Patch management begins by identifying vulnerabilities '
            'within the organization\'s infrastructure. Organizations use '
            'vulnerability scanners and security assessment tools to '
            'discover missing patches and security weaknesses. Common '
            'enterprise vulnerability management solutions include:',
        bullets: [
          'Microsoft Defender Vulnerability Management',
          'Qualys VMDR',
          'Tenable Nessus',
          'Rapid7 InsightVM',
          'OpenVAS',
          'CrowdStrike Falcon Exposure Management',
        ],
      ),
      LessonSection(
        body:
            'These platforms continuously scan enterprise assets and '
            'compare installed software versions against known '
            'vulnerability databases. For each identified vulnerability, '
            'the scanner typically provides the vulnerability identifier '
            '(CVE), severity score (CVSS), affected software, available '
            'remediation, patch availability, and exploit status. This '
            'information helps security teams prioritize remediation '
            'activities.',
      ),
      LessonSection(
        heading: 'Risk Assessment',
        body:
            'Not every vulnerability requires immediate remediation. '
            'Organizations evaluate several factors before deploying '
            'updates, including:',
        bullets: [
          'CVSS severity score',
          'Availability of public exploits',
          'Active exploitation in the wild',
          'Business criticality',
          'Internet exposure',
          'Asset importance',
          'Regulatory requirements',
          'Operational impact',
        ],
      ),
      LessonSection(
        body:
            'For example, a critical vulnerability affecting an '
            'Internet-facing domain controller may require immediate '
            'emergency patching, whereas a low-severity vulnerability on '
            'an isolated laboratory workstation may be addressed during '
            'the next scheduled maintenance window. Risk-based '
            'prioritization enables organizations to allocate remediation '
            'resources efficiently.',
      ),
      LessonSection(
        heading: 'Patch Testing',
        body:
            'Applying patches directly to production systems without '
            'testing can introduce unexpected compatibility problems or '
            'service interruptions. Organizations therefore validate '
            'updates in controlled testing environments before '
            'enterprise-wide deployment. Typical testing activities '
            'include:',
        bullets: [
          'Operating system compatibility',
          'Application compatibility',
          'Performance validation',
          'Authentication testing',
          'Network connectivity verification',
          'Business application functionality',
          'Security validation',
        ],
      ),
      LessonSection(
        body:
            'Testing helps identify issues before updates affect '
            'production systems.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational pharmaceutical company manages approximately '
            '12,000 Windows workstations and 2,000 Windows and Linux '
            'servers. Weekly vulnerability scans identify a newly '
            'disclosed critical vulnerability affecting Microsoft '
            'Windows. Microsoft releases a corresponding security update '
            'on Patch Tuesday.',
      ),
      LessonSection(
        body:
            'The organization\'s vulnerability management team reviews '
            'the CVSS score, confirms active exploitation, and classifies '
            'the vulnerability as Critical. The update is first deployed '
            'to a test environment containing representative systems and '
            'business applications. After successful validation, the '
            'patch is approved through the organization\'s change '
            'management process and gradually deployed using Microsoft '
            'Intune and Microsoft Configuration Manager.',
      ),
      LessonSection(
        body:
            'Post-deployment compliance reports confirm that 99.6% of '
            'managed endpoints have successfully installed the update '
            'within 48 hours, significantly reducing organizational '
            'exposure to the vulnerability.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain an accurate inventory of enterprise assets',
          'Prioritize patches using risk-based vulnerability assessments',
          'Test updates before deploying to production',
          'Automate patch deployment where appropriate',
          'Verify successful installation after deployment',
          'Maintain rollback procedures for failed updates',
          'Integrate vulnerability management with endpoint management platforms',
          'Continuously monitor patch compliance across the enterprise',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Timely patching remains one of the most effective '
            'cybersecurity controls. Organizations that combine '
            'continuous vulnerability assessment with automated, '
            'risk-based patch management significantly reduce their '
            'exposure to known security threats.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Patch Deployment Strategies',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Deployment Is Its Own Discipline',
        body:
            'In the previous lesson we explored the patch management '
            'lifecycle, from identifying vulnerabilities to verifying '
            'successful deployment. However, simply installing updates is '
            'not enough. Organizations must determine how, when, and to '
            'whom patches should be deployed while balancing security, '
            'business continuity, and operational stability.',
      ),
      LessonSection(
        body:
            'Large enterprises rarely deploy updates simultaneously to '
            'every endpoint. Instead, they use carefully planned '
            'deployment strategies, testing groups, phased rollouts, and '
            'emergency response procedures to minimize operational risks '
            'while ensuring that critical vulnerabilities are remediated '
            'as quickly as possible.',
      ),
      LessonSection(
        heading: 'Common Deployment Strategies',
        body:
            'Enterprise environments may contain thousands of '
            'workstations, servers, mobile devices, virtual machines, and '
            'cloud workloads. Deploying updates to all these systems '
            'simultaneously increases the risk of widespread service '
            'disruptions if an update introduces compatibility issues. To '
            'reduce this risk, organizations typically deploy patches in '
            'controlled stages:',
        bullets: [
          'Pilot deployment',
          'Phased deployment',
          'Ring-based deployment',
          'Department-based deployment',
          'Risk-based deployment',
          'Emergency deployment',
        ],
      ),
      LessonSection(
        body:
            'The choice of deployment strategy depends on business '
            'requirements, system criticality, and the severity of the '
            'vulnerability being addressed.',
      ),
      LessonSection(
        heading: 'Pilot Deployment',
        body:
            'A pilot deployment involves installing updates on a small '
            'group of representative devices before broader deployment. '
            'Pilot devices are typically selected from different '
            'departments, hardware models, and software configurations to '
            'identify compatibility issues early. Benefits include:',
        bullets: [
          'Early detection of software conflicts',
          'Reduced deployment risk',
          'Validation of business applications',
          'Improved deployment confidence',
        ],
      ),
      LessonSection(
        body:
            'If no significant issues are identified, the update proceeds '
            'to the next deployment stage.',
      ),
      LessonSection(
        heading: 'Ring-Based Deployment',
        body:
            'Many organizations use deployment rings to gradually '
            'distribute updates across the enterprise. Rather than '
            'updating every endpoint simultaneously, devices are grouped '
            'into successive deployment rings. A typical ring model '
            'includes:',
        bullets: [
          'Ring 0 – IT Administrators: updates are first installed on devices used by IT administrators and endpoint management teams',
          'Ring 1 – Pilot Users: a small number of technically proficient users receive updates for real-world validation',
          'Ring 2 – Business Departments: updates are expanded to selected departments representing normal business operations',
          'Ring 3 – Enterprise Deployment: once testing is complete, updates are deployed across all remaining managed devices',
        ],
      ),
      LessonSection(
        body:
            'This staged approach significantly reduces organizational '
            'risk while maintaining timely patch deployment.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/deployment_rings.jpg',
          caption:
              'Organizations commonly deploy software updates using '
              'phased deployment rings, allowing updates to be validated '
              'progressively before enterprise-wide implementation.',
        ),
      ),
      LessonSection(
        heading: 'Department-Based Deployment',
        body:
            'Some organizations deploy updates according to business '
            'functions — for example, Information Technology, Finance, '
            'Human Resources, Engineering, Sales, and Customer Support. '
            'Departments with mission-critical workloads may receive '
            'updates during carefully scheduled maintenance windows to '
            'minimize operational disruption.',
      ),
      LessonSection(
        heading: 'Risk-Based Deployment',
        body:
            'Risk-based deployment prioritizes systems based on business '
            'impact and vulnerability severity. High-priority systems '
            'typically include:',
        bullets: [
          'Internet-facing servers',
          'Domain controllers',
          'Email servers',
          'VPN gateways',
          'Identity services',
          'Critical business applications',
        ],
      ),
      LessonSection(
        body:
            'Lower-risk systems may be updated during regularly scheduled '
            'maintenance cycles. Risk-based prioritization enables '
            'organizations to address the most significant threats first '
            'while optimizing operational resources.',
      ),
      LessonSection(
        heading: 'Comparing the Strategies',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Strategy', 'Typical Use Case', 'Advantages', 'Limitations'],
          tableRows: [
            ['Pilot Deployment', 'Initial validation', 'Identifies compatibility issues early', 'Limited test coverage'],
            ['Ring-Based Deployment', 'Large enterprises', 'Controlled, phased rollout', 'Longer deployment timeline'],
            ['Department-Based Deployment', 'Business-specific scheduling', 'Minimizes operational disruption', 'Requires careful coordination'],
            ['Risk-Based Deployment', 'Critical assets', 'Prioritizes highest-risk systems', 'Requires accurate asset classification'],
            ['Emergency Deployment', 'Actively exploited vulnerabilities', 'Rapid risk reduction', 'Limited testing time'],
          ],
        ),
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Patch Tuesday, Zero-Days & Emergency Patching',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Microsoft Patch Tuesday',
        body:
            'Microsoft follows a predictable monthly security update '
            'schedule commonly known as Patch Tuesday. Patch Tuesday '
            'occurs on the second Tuesday of each month, when Microsoft '
            'releases security updates for supported operating systems '
            'and products. Updates may include:',
        bullets: [
          'Windows',
          'Microsoft Office',
          'Microsoft Exchange',
          'Microsoft SQL Server',
          'Microsoft Edge',
          'Microsoft Defender',
          'Hyper-V',
          'Azure Stack HCI',
        ],
      ),
      LessonSection(
        body:
            'The predictable release schedule allows organizations to '
            'prepare testing environments, schedule maintenance windows, '
            'and coordinate enterprise-wide deployments. Although Patch '
            'Tuesday addresses most routine vulnerabilities, Microsoft '
            'may also release out-of-band updates for critical security '
            'issues requiring immediate attention.',
      ),
      LessonSection(
        heading: 'Zero-Day Vulnerabilities',
        body:
            'A zero-day vulnerability is a software flaw that becomes '
            'known before a security patch is available. Because '
            'attackers may exploit these vulnerabilities before vendors '
            'release fixes, zero-day vulnerabilities represent one of the '
            'highest cybersecurity risks.',
      ),
      LessonSection(
        body:
            'Organizations frequently mitigate zero-day risks using '
            'compensating controls until official patches become '
            'available. Examples include:',
        bullets: [
          'Disabling vulnerable services',
          'Blocking malicious traffic using firewalls',
          'Applying IPS signatures',
          'Restricting application execution',
          'Network segmentation',
          'Enhanced monitoring',
          'Endpoint Detection and Response (EDR)',
        ],
      ),
      LessonSection(
        body:
            'Once the vendor releases a security update, organizations '
            'begin emergency testing followed by accelerated deployment.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/zero_day_response.jpg',
          caption:
              'Organizations respond to zero-day vulnerabilities by '
              'implementing temporary security controls while awaiting '
              'vendor patches, followed by accelerated testing and '
              'emergency deployment once updates become available.',
        ),
      ),
      LessonSection(
        heading: 'Emergency Patching',
        body:
            'Some vulnerabilities require immediate remediation due to '
            'active exploitation or severe business risk. Emergency '
            'patching typically occurs when:',
        bullets: [
          'Active attacks are observed',
          'Public exploit code is available',
          'Critical infrastructure is affected',
          'Regulatory requirements demand immediate action',
          'Internet-facing systems are vulnerable',
        ],
      ),
      LessonSection(
        body:
            'Unlike routine maintenance windows, emergency patching often '
            'follows an expedited approval process to reduce '
            'organizational exposure. Although emergency deployments '
            'prioritize speed, organizations should still perform basic '
            'compatibility validation whenever possible.',
      ),
      LessonSection(
        heading: 'Patch Rollback',
        body:
            'Despite careful testing, software updates occasionally '
            'introduce unexpected problems. Organizations should '
            'therefore establish rollback procedures before deploying '
            'updates. Rollback planning includes:',
        bullets: [
          'System backups',
          'Virtual machine snapshots',
          'Restore points',
          'Configuration backups',
          'Recovery documentation',
          'Change records',
        ],
      ),
      LessonSection(
        body:
            'Effective rollback procedures enable administrators to '
            'restore affected systems quickly if unexpected issues occur '
            'after deployment.',
      ),
      LessonSection(
        heading: 'Patch Verification',
        body:
            'Deploying a patch does not necessarily guarantee successful '
            'installation. Organizations should verify deployment by '
            'confirming:',
        bullets: [
          'Successful installation status',
          'Device restart completion',
          'Updated software version',
          'Vulnerability remediation',
          'Compliance status',
          'Application functionality',
        ],
      ),
      LessonSection(
        body:
            'Endpoint management platforms such as Microsoft Intune, '
            'Microsoft Configuration Manager, and enterprise vulnerability '
            'scanners provide compliance reports that help administrators '
            'verify deployment success across the organization.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global financial institution receives intelligence '
            'indicating active exploitation of a critical vulnerability '
            'affecting VPN gateways. Because the affected systems provide '
            'remote access for employees worldwide, the vulnerability is '
            'classified as Critical.',
      ),
      LessonSection(
        body:
            'The security team immediately implements temporary firewall '
            'rules and intrusion prevention signatures while the '
            'infrastructure team validates the vendor\'s emergency patch '
            'in a testing environment. Following successful testing, the '
            'update is deployed first to redundant VPN appliances in a '
            'pilot data center before being rolled out to all production '
            'gateways.',
      ),
      LessonSection(
        body:
            'Post-deployment vulnerability scans confirm successful '
            'remediation, and compliance dashboards report that all '
            'affected systems have been updated within 24 hours of the '
            'vendor\'s release.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use phased deployment rings to minimize operational risk',
          'Maintain dedicated testing environments',
          'Prioritize vulnerabilities using business risk and exploitability',
          'Prepare rollback procedures before deployment',
          'Monitor deployment success through compliance reporting',
          'Perform vulnerability rescans after patch installation',
          'Document emergency patching activities',
          'Integrate patch management with vulnerability management and endpoint management platforms',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Rapid deployment is important, but uncontrolled deployment '
            'can introduce business disruptions. Organizations should '
            'balance speed with appropriate testing, phased rollouts, and '
            'verification to maintain both security and operational '
            'stability.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Understanding Vulnerabilities & CVSS',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'From Patching to Prioritizing',
        body:
            'While patch management focuses on deploying software '
            'updates, organizations must first determine which '
            'vulnerabilities require attention and in what order. '
            'Enterprise environments often contain thousands of assets '
            'and tens of thousands of identified vulnerabilities. '
            'Treating every vulnerability as equally important is '
            'neither practical nor efficient.',
      ),
      LessonSection(
        body:
            'Vulnerability management provides a structured approach for '
            'identifying, assessing, prioritizing, remediating, and '
            'continuously monitoring security weaknesses across an '
            'organization\'s technology environment. It enables security '
            'teams to focus resources on vulnerabilities that pose the '
            'greatest risk to business operations. Modern vulnerability '
            'management is a continuous process rather than a one-time '
            'activity — new systems are deployed, software is updated, '
            'and new vulnerabilities are disclosed every day, so '
            'organizations perform ongoing assessments to maintain an '
            'accurate understanding of their security posture.',
      ),
      LessonSection(
        heading: 'Understanding Vulnerabilities',
        body:
            'A vulnerability is a weakness in software, hardware, '
            'firmware, or system configuration that can potentially be '
            'exploited by a threat actor to compromise the '
            'confidentiality, integrity, or availability of information '
            'systems. Vulnerabilities may result from:',
        bullets: [
          'Software coding errors',
          'Misconfigured systems',
          'Weak authentication mechanisms',
          'Missing security patches',
          'Default credentials',
          'Insecure services',
          'Unsupported operating systems',
          'Improper access controls',
        ],
      ),
      LessonSection(
        body:
            'Not every vulnerability will be exploited, but unaddressed '
            'weaknesses increase the organization\'s attack surface and '
            'provide opportunities for attackers.',
      ),
      LessonSection(
        heading: 'The Vulnerability Management Lifecycle',
        body:
            'An effective vulnerability management program follows a '
            'continuous lifecycle that combines automated scanning with '
            'risk-based decision-making. Typical stages include:',
        bullets: [
          'Asset Discovery',
          'Vulnerability Identification',
          'Risk Assessment',
          'Prioritization',
          'Remediation',
          'Verification',
          'Reporting',
          'Continuous Monitoring',
        ],
      ),
      LessonSection(
        body:
            'This structured approach ensures that newly discovered '
            'vulnerabilities are addressed systematically while '
            'maintaining visibility into the organization\'s overall '
            'security posture.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/vuln_mgmt_lifecycle.jpg',
          caption:
              'Vulnerability management is a continuous process that '
              'combines asset discovery, vulnerability assessment, '
              'remediation, verification, and ongoing monitoring to '
              'reduce organizational risk.',
        ),
      ),
      LessonSection(
        heading: 'Asset Discovery',
        body:
            'The first step in vulnerability management is identifying '
            'all assets that require protection. Organizations maintain '
            'an inventory of workstations, servers, virtual machines, '
            'mobile devices, cloud workloads, network devices, '
            'Internet-facing systems, and applications. Without an '
            'accurate asset inventory, security teams cannot determine '
            'which systems should be scanned or protected.',
      ),
      LessonSection(
        heading: 'Vulnerability Identification',
        body:
            'Once assets have been identified, automated vulnerability '
            'scanners evaluate systems for known security weaknesses. '
            'Typical assessment activities include:',
        bullets: [
          'Missing security patches',
          'Unsupported software',
          'Weak cryptographic configurations',
          'Default passwords',
          'Open network ports',
          'Misconfigured services',
          'Outdated firmware',
          'Insecure protocols',
        ],
      ),
      LessonSection(
        body:
            'Modern vulnerability scanners compare discovered software '
            'versions against continuously updated vulnerability '
            'databases.',
      ),
      LessonSection(
        heading: 'Common Vulnerability Scoring System (CVSS)',
        body:
            'Not all vulnerabilities present the same level of risk. To '
            'help organizations prioritize remediation, the '
            'cybersecurity community uses the Common Vulnerability '
            'Scoring System (CVSS). CVSS provides a standardized '
            'numerical score ranging from 0.0 to 10.0 based on factors '
            'such as:',
        bullets: [
          'Attack complexity',
          'Required privileges',
          'User interaction',
          'Confidentiality impact',
          'Integrity impact',
          'Availability impact',
        ],
      ),
      LessonSection(
        body:
            'Higher scores indicate greater potential risk.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['CVSS Score', 'Severity', 'Typical Response'],
          tableRows: [
            ['0.0', 'None', 'No action required'],
            ['0.1 – 3.9', 'Low', 'Address during routine maintenance'],
            ['4.0 – 6.9', 'Medium', 'Schedule remediation'],
            ['7.0 – 8.9', 'High', 'Prioritize remediation'],
            ['9.0 – 10.0', 'Critical', 'Immediate action required'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Common Vulnerabilities and Exposures (CVE)',
        body:
            'The Common Vulnerabilities and Exposures (CVE) program '
            'provides a standardized naming convention for publicly '
            'disclosed security vulnerabilities. Each vulnerability '
            'receives a unique identifier — examples include '
            'CVE-2024-21413, CVE-2025-12345, and CVE-2026-45678. A CVE '
            'entry typically includes:',
        bullets: [
          'Vulnerability identifier',
          'Description',
          'Affected products',
          'References',
          'Severity information',
          'Vendor advisories',
        ],
      ),
      LessonSection(
        body:
            'Using standardized identifiers allows organizations, '
            'vendors, and security researchers to discuss vulnerabilities '
            'consistently.',
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Vulnerability Prioritization & Remediation',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Vulnerability Prioritization',
        body:
            'Although CVSS provides a useful severity score, '
            'organizations should also consider business context when '
            'determining remediation priorities. Additional factors '
            'include:',
        bullets: [
          'Internet exposure',
          'Availability of public exploits',
          'Active exploitation',
          'Business criticality',
          'Regulatory requirements',
          'Asset value',
          'Data sensitivity',
          'Compensating security controls',
        ],
      ),
      LessonSection(
        body:
            'For example, a High-severity vulnerability affecting an '
            'Internet-facing identity server may require more urgent '
            'attention than a Critical vulnerability affecting an '
            'isolated laboratory system.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/vuln_prioritization.jpg',
          caption:
              'Organizations prioritize vulnerabilities using technical '
              'severity, exploitability, business impact, and asset '
              'criticality to ensure that remediation resources are '
              'focused on the highest-risk issues.',
        ),
      ),
      LessonSection(
        heading: 'Remediation and Mitigation',
        body:
            'The preferred response to a vulnerability is remediation, '
            'which completely removes the weakness. Examples include:',
        bullets: [
          'Installing security patches',
          'Upgrading software',
          'Replacing unsupported systems',
          'Correcting insecure configurations',
          'Removing vulnerable services',
        ],
      ),
      LessonSection(
        body:
            'However, immediate remediation is not always possible. In '
            'such cases, organizations implement mitigation, which '
            'reduces the likelihood or impact of exploitation until '
            'permanent remediation becomes available. Examples of '
            'mitigation include:',
        bullets: [
          'Firewall rules',
          'Network segmentation',
          'Disabling vulnerable services',
          'Multi-factor authentication',
          'Application allowlisting',
          'Intrusion Prevention System (IPS) signatures',
        ],
      ),
      LessonSection(
        body:
            'Mitigation reduces risk but does not eliminate the '
            'underlying vulnerability.',
      ),
      LessonSection(
        heading: 'Vulnerability Reporting and Dashboards',
        body:
            'Enterprise vulnerability management platforms provide '
            'dashboards that summarize the organization\'s security '
            'posture. Common dashboard metrics include:',
        bullets: [
          'Total vulnerabilities',
          'Critical vulnerabilities',
          'High-risk assets',
          'Patch compliance',
          'Mean Time to Remediate (MTTR)',
          'Remediation progress',
          'Vulnerability trends',
          'Risk distribution by business unit',
        ],
      ),
      LessonSection(
        body:
            'These dashboards help security leaders monitor remediation '
            'activities and communicate organizational risk to '
            'management.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global healthcare organization performs weekly '
            'vulnerability scans across approximately 18,000 managed '
            'endpoints, servers, and cloud workloads. The latest scan '
            'identifies more than 9,500 vulnerabilities. Rather than '
            'attempting to remediate every issue immediately, the '
            'vulnerability management team prioritizes findings based on '
            'CVSS scores, business criticality, and active threat '
            'intelligence.',
      ),
      LessonSection(
        body:
            'Critical vulnerabilities affecting Internet-facing patient '
            'portals and identity infrastructure are remediated within 24 '
            'hours. Medium-risk vulnerabilities on internal laboratory '
            'workstations are scheduled during the next maintenance '
            'window. Lower-risk findings are documented and monitored '
            'until routine patch cycles.',
      ),
      LessonSection(
        body:
            'Executive dashboards provide continuous visibility into '
            'remediation progress, enabling security leadership to '
            'monitor compliance with organizational service-level '
            'objectives (SLOs).',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain an accurate inventory of enterprise assets',
          'Perform vulnerability scans regularly',
          'Prioritize remediation using both CVSS and business risk',
          'Integrate vulnerability management with patch management processes',
          'Validate remediation through follow-up scans',
          'Continuously monitor emerging vulnerabilities and threat intelligence',
          'Track remediation metrics such as Mean Time to Remediate (MTTR)',
          'Review vulnerability dashboards during regular security governance meetings',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Successful vulnerability management is based on risk, not '
            'volume. Organizations should focus remediation efforts on '
            'vulnerabilities that present the greatest likelihood of '
            'exploitation and the highest potential business impact, '
            'rather than attempting to eliminate every identified '
            'weakness simultaneously.',
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Endpoint Logging Fundamentals',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Why Endpoint Logging Is Important',
        body:
            'As enterprise endpoints become increasingly sophisticated, '
            'they generate vast amounts of information about system '
            'activity, user behavior, application execution, and '
            'security events. Every successful login, failed '
            'authentication attempt, software installation, process '
            'execution, registry modification, and network connection '
            'leaves behind a digital record known as a log. These logs '
            'provide valuable insight into how an endpoint is operating '
            'and often contain the first indicators of malicious '
            'activity.',
      ),
      LessonSection(
        body:
            'Endpoint logging is the process of recording events '
            'generated by operating systems, applications, and security '
            'software running on endpoint devices. These logs enable '
            'administrators and security analysts to monitor system '
            'health, detect suspicious behavior, investigate security '
            'incidents, and meet regulatory compliance requirements.',
      ),
      LessonSection(
        body:
            'Modern organizations rely heavily on endpoint logs because '
            'many cyberattacks originate or execute directly on endpoint '
            'devices. Malware infections, ransomware, credential theft, '
            'insider threats, and unauthorized administrative activities '
            'often leave identifiable traces within endpoint logs. By '
            'collecting and analyzing these records, organizations can '
            'detect attacks earlier and respond more effectively.',
      ),
      LessonSection(
        body:
            'Endpoint logging is also a critical component of Security '
            'Information and Event Management (SIEM) platforms, Endpoint '
            'Detection and Response (EDR) solutions, and Security '
            'Operations Centers (SOCs), where logs from thousands of '
            'devices are centralized and analyzed to identify '
            'enterprise-wide threats. For many regulatory frameworks, '
            'including PCI DSS, HIPAA, ISO/IEC 27001, and NIST '
            'Cybersecurity Framework, maintaining appropriate audit logs '
            'is also a compliance requirement.',
      ),
      LessonSection(
        heading: 'Understanding Endpoint Logs',
        body:
            'An endpoint log is a chronological record of events '
            'generated by an operating system, application, or security '
            'component. Each log entry typically contains information '
            'such as:',
        bullets: [
          'Date and time',
          'Event identifier',
          'User account',
          'Computer name',
          'Process name',
          'Event severity',
          'Source application',
          'Event description',
        ],
      ),
      LessonSection(
        body:
            'Because every recorded event is timestamped, analysts can '
            'reconstruct the sequence of activities that occurred before, '
            'during, and after a security incident. For example, an '
            'endpoint log may record a user successfully logging in, '
            'Microsoft Word launching, PowerShell executing unexpectedly, '
            'a new service being created, antivirus detecting malware, '
            'and an outbound network connection to an unfamiliar IP '
            'address. Individually, these events may appear harmless. '
            'However, when analyzed together, they can reveal the '
            'progression of an attack.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/logging_pipeline.jpg',
          caption:
              'Enterprise endpoint logging collects security events from '
              'multiple operating systems and forwards them to '
              'centralized logging platforms and SIEM solutions for '
              'analysis and incident detection.',
        ),
      ),
      LessonSection(
        heading: 'Types of Endpoint Logs',
        body:
            'Operating systems and applications generate many different '
            'categories of logs, each serving a specific purpose. Common '
            'endpoint log types include authentication logs, security '
            'logs, application logs, and system logs — each covered '
            'below.',
      ),
      LessonSection(
        heading: 'Authentication Logs',
        body:
            'Authentication logs record successful and failed login '
            'attempts, account lockouts, password changes, and privilege '
            'assignments. Examples include user logon, failed '
            'authentication, account lockout, password reset, and '
            'multi-factor authentication events. Authentication logs are '
            'valuable for detecting brute-force attacks, credential '
            'theft, and unauthorized access attempts.',
      ),
      LessonSection(
        heading: 'Security Logs',
        body:
            'Security logs record events related to the protection of '
            'the operating system and organizational resources. Examples '
            'include security policy changes, privilege escalation, user '
            'rights assignments, audit policy modifications, and account '
            'creation or deletion. Security logs often play a central '
            'role during forensic investigations.',
      ),
      LessonSection(
        heading: 'Application Logs',
        body:
            'Applications maintain their own logs describing operational '
            'and security-related events — application startup, software '
            'crashes, configuration changes, database connections, '
            'application updates, and licensing events. These logs help '
            'administrators troubleshoot application issues and '
            'investigate abnormal application behavior.',
      ),
      LessonSection(
        heading: 'System Logs',
        body:
            'System logs record events generated by the operating system '
            'itself — device startup, system shutdown, driver failures, '
            'hardware errors, service failures, and operating system '
            'updates. System logs assist administrators in diagnosing '
            'hardware and software problems affecting endpoint '
            'stability.',
      ),
    ],
  ),

  // 13 ---------------------------------------------------------------------
  Lesson(
    title: 'OS-Specific Logs: Windows, Linux & macOS',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Windows Event Logs',
        body:
            'Microsoft Windows records operating system activities '
            'through the Windows Event Log service. Windows organizes '
            'events into several primary categories.',
      ),
      LessonSection(
        heading: 'Application Log',
        body:
            'Contains events generated by installed applications and '
            'software components. Typical events include application '
            'startup, application failures, software updates, and '
            'application errors.',
      ),
      LessonSection(
        heading: 'Security Log',
        body:
            'Contains security-related events audited by Windows. '
            'Typical events include user authentication, failed logins, '
            'account lockouts, privilege assignments, and security policy '
            'changes. Because these logs document security-sensitive '
            'activities, they are among the most important sources for '
            'security investigations.',
      ),
      LessonSection(
        heading: 'System Log',
        body:
            'Records operating system and hardware events — examples '
            'include driver loading, device failures, operating system '
            'startup, service initialization, and hardware errors.',
      ),
      LessonSection(
        heading: 'Setup Log & Forwarded Events',
        body:
            'The Setup Log records operating system installation '
            'activities and Windows Update operations, and is primarily '
            'used during system deployment and troubleshooting. Forwarded '
            'Events contains events forwarded from other Windows systems '
            'using Windows Event Forwarding (WEF) — large organizations '
            'commonly use forwarded events to centralize log collection '
            'before forwarding data to enterprise SIEM platforms.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/windows_event_logs.jpg',
          caption:
              'Windows organizes operating system events into multiple '
              'log categories that support troubleshooting, auditing, and '
              'security investigations.',
        ),
      ),
      LessonSection(
        heading: 'Linux Syslog',
        body:
            'Unlike Windows, Linux systems commonly use the Syslog '
            'framework to record operating system and application '
            'events. Syslog collects messages generated by operating '
            'system services, applications, authentication systems, '
            'network services, and security tools. Common Linux log '
            'files include:',
        bullets: [
          '/var/log/syslog',
          '/var/log/messages',
          '/var/log/auth.log',
          '/var/log/secure',
          '/var/log/kern.log',
        ],
      ),
      LessonSection(
        body:
            'Administrators frequently use these logs to investigate '
            'authentication failures, service interruptions, and '
            'unauthorized administrative activities.',
      ),
      LessonSection(
        heading: 'macOS Unified Logging',
        body:
            'Apple macOS uses the Unified Logging System, which '
            'centralizes logging across the operating system and '
            'applications. Unified Logging records system events, '
            'application events, security events, performance '
            'information, and diagnostic messages. Enterprise '
            'administrators can analyze these logs using built-in macOS '
            'tools or forward them to centralized monitoring platforms.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational insurance company centrally collects '
            'endpoint logs from more than 20,000 Windows workstations, '
            'Linux servers, and macOS laptops. During routine monitoring, '
            'the SIEM identifies multiple failed authentication attempts '
            'against a senior executive\'s Windows laptop, followed by a '
            'successful login from an unusual location.',
      ),
      LessonSection(
        body:
            'Shortly afterward, Windows Security logs record the '
            'creation of a new administrative account, while endpoint '
            'protection logs detect PowerShell execution and attempts to '
            'disable antivirus software. Because all endpoint logs are '
            'centrally collected and correlated, the Security Operations '
            'Center quickly identifies the activity as a likely '
            'credential compromise. The affected device is isolated, the '
            'compromised account is disabled, and incident response '
            'procedures are initiated before attackers can access '
            'sensitive corporate data.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Enable auditing for security-critical events',
          'Synchronize system clocks using NTP',
          'Protect log integrity from unauthorized modification',
          'Centralize log collection using SIEM or log management platforms',
          'Define log retention policies that satisfy business and regulatory requirements',
          'Monitor authentication, administrative, and process execution events continuously',
          'Regularly review logging configurations to ensure appropriate coverage',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Logs are valuable only if they are protected and regularly '
            'reviewed. Organizations should centralize endpoint logs, '
            'restrict administrative access, and continuously monitor '
            'security events to improve threat detection and incident '
            'response capabilities.',
      ),
    ],
  ),

  // 14 ---------------------------------------------------------------------
  Lesson(
    title: 'Endpoint Telemetry & Real-Time Monitoring',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Understanding Endpoint Telemetry',
        body:
            'Endpoint telemetry refers to the continuous collection of '
            'operational and security-related data generated by endpoint '
            'devices. Instead of capturing only individual events, '
            'telemetry provides a broader picture of system behavior over '
            'time. Common telemetry collected from endpoints includes:',
        bullets: [
          'Process execution',
          'Network connections',
          'User logon and logoff events',
          'File creation and modification',
          'Registry changes',
          'Scheduled task creation',
          'Service installation',
          'USB device activity',
          'Application launches',
          'Security agent status',
        ],
      ),
      LessonSection(
        body:
            'This data enables security platforms such as Endpoint '
            'Detection and Response (EDR) and Extended Detection and '
            'Response (XDR) solutions to detect suspicious patterns that '
            'may indicate malicious activity. For example, while a '
            'single PowerShell execution may appear legitimate, telemetry '
            'showing PowerShell launching immediately after a suspicious '
            'email attachment is opened and followed by outbound network '
            'connections may indicate malware execution.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/endpoint_monitoring_events.jpg',
          caption:
              'Endpoint telemetry continuously captures system activities '
              'and forwards them through security agents to EDR and SIEM '
              'platforms for threat detection and analysis.',
        ),
      ),
      LessonSection(
        heading: 'Real-Time Endpoint Monitoring',
        body:
            'Traditional security audits often relied on reviewing logs '
            'after an incident occurred. Modern cybersecurity requires '
            'organizations to detect threats as they happen. Real-time '
            'monitoring continuously observes endpoint activity and '
            'immediately notifies security teams when predefined '
            'conditions or suspicious behaviors are detected. Examples of '
            'events that may trigger alerts include:',
        bullets: [
          'Multiple failed logon attempts',
          'Privilege escalation',
          'Execution of unsigned applications',
          'Antivirus being disabled',
          'Unauthorized software installation',
          'Suspicious PowerShell commands',
          'Ransomware-like file encryption activity',
          'Connections to known malicious IP addresses',
        ],
      ),
      LessonSection(
        body:
            'Early detection enables security teams to isolate '
            'compromised systems before attackers can move laterally '
            'across the network.',
      ),
      LessonSection(
        heading: 'File Integrity Monitoring (FIM)',
        body:
            'One important aspect of endpoint monitoring is File '
            'Integrity Monitoring (FIM). FIM continuously monitors '
            'critical files and directories for unauthorized '
            'modifications. Organizations typically monitor:',
        bullets: [
          'Operating system files',
          'Application executables',
          'Configuration files',
          'Security policies',
          'Registry hives',
          'Certificates',
          'Scripts',
          'Database configuration files',
        ],
      ),
      LessonSection(
        body:
            'Whenever a protected file is created, modified, deleted, '
            'renamed, or replaced, the monitoring system records the '
            'event and can generate an alert if the activity is '
            'unexpected. File Integrity Monitoring is particularly '
            'valuable for detecting ransomware, malware persistence, and '
            'unauthorized configuration changes. Many compliance '
            'frameworks, including PCI DSS, recommend or require FIM for '
            'critical systems.',
      ),
      LessonSection(
        heading: 'Process Monitoring',
        body:
            'A process is an instance of a running program. Process '
            'monitoring tracks the execution of applications and system '
            'processes to identify abnormal behavior. Typical events '
            'include:',
        bullets: [
          'Process creation',
          'Process termination',
          'Parent-child process relationships',
          'Command-line arguments',
          'Process privileges',
          'Memory injection attempts',
          'Unsigned executable execution',
        ],
      ),
      LessonSection(
        body:
            'Security analysts frequently examine process activity '
            'because many attacks rely on launching legitimate '
            'administrative tools such as PowerShell, Command Prompt, '
            'WMI, PsExec, Rundll32, and Regsvr32. Monitoring process '
            'relationships helps detect techniques such as Living off '
            'the Land (LotL) attacks, where adversaries abuse trusted '
            'system utilities to avoid detection.',
      ),
      LessonSection(
        heading: 'Registry Monitoring',
        body:
            'The Windows Registry stores configuration settings for the '
            'operating system, applications, and user profiles. '
            'Attackers frequently modify registry keys to establish '
            'persistence, disable security controls, execute malware '
            'automatically during startup, alter security settings, or '
            'hide malicious software.',
      ),
      LessonSection(
        body:
            'Registry monitoring detects changes to sensitive registry '
            'locations and alerts administrators when unauthorized '
            'modifications occur. Examples of monitored registry areas '
            'include:',
        bullets: [
          'Run keys',
          'Startup entries',
          'Windows Defender configuration',
          'Security policy settings',
          'Service configurations',
        ],
      ),
      LessonSection(
        body:
            'Because registry modifications are commonly used by '
            'malware, continuous monitoring significantly improves '
            'endpoint visibility.',
      ),
      LessonSection(
        heading: 'User Activity Monitoring',
        body:
            'Monitoring user activity helps organizations detect '
            'compromised accounts, insider threats, and policy '
            'violations. Typical activities monitored include:',
        bullets: [
          'Interactive logons',
          'Remote desktop sessions',
          'Administrative logins',
          'Failed authentication attempts',
          'Account lockouts',
          'Privilege assignments',
          'User account creation',
          'Group membership changes',
        ],
      ),
      LessonSection(
        body:
            'User behavior analytics (UBA) can identify unusual patterns '
            'such as logins outside normal working hours, access from '
            'unexpected geographic locations, sudden increases in '
            'privileged activity, simultaneous logins from multiple '
            'locations, and unusual access to sensitive files. These '
            'anomalies may indicate compromised credentials or malicious '
            'insider activity.',
      ),
      LessonSection(
        heading: 'Service Monitoring & Scheduled Task Monitoring',
        body:
            'Windows and Linux systems rely on background services to '
            'provide essential operating system and application '
            'functionality. Attackers often create or modify services to '
            'establish persistence after compromising a system. Service '
            'monitoring records new service creation, deletion, startup, '
            'shutdown, and configuration changes — unexpected service '
            'installations should always be investigated because they '
            'may indicate malware or unauthorized software deployment.',
      ),
      LessonSection(
        body:
            'Many legitimate administrative tasks are automated using '
            'scheduled tasks. However, attackers also abuse scheduled '
            'tasks to execute malicious code at predefined intervals or '
            'during system startup. Monitoring scheduled tasks helps '
            'identify new task creation, existing task modification, '
            'task deletion, task execution failures, and unauthorized '
            'automation. Security analysts often review scheduled tasks '
            'during forensic investigations because they are a common '
            'persistence mechanism used by malware.',
      ),
      LessonSection(
        heading: 'Common Endpoint Monitoring Events',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Monitoring Area', 'Examples of Events'],
          tableRows: [
            ['Process Monitoring', 'Process creation, termination, command-line execution'],
            ['File Integrity Monitoring', 'File creation, modification, deletion'],
            ['Registry Monitoring', 'Registry key creation, deletion, value changes'],
            ['User Activity', 'Logons, privilege changes, account lockouts'],
            ['Service Monitoring', 'Service creation, startup, configuration changes'],
            ['Scheduled Tasks', 'Task creation, deletion, execution'],
            ['Network Activity', 'Outbound connections, DNS queries, port usage'],
            ['Security Agent', 'Antivirus status, policy updates, tamper attempts'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A software development company deploys an EDR solution '
            'across 8,000 employee laptops. During routine monitoring, '
            'the platform detects Microsoft Word spawning PowerShell, '
            'which subsequently launches an encoded command and '
            'establishes a connection to an unfamiliar external IP '
            'address. Simultaneously, File Integrity Monitoring '
            'identifies unauthorized modifications to startup scripts, '
            'while registry monitoring detects changes to '
            'persistence-related keys.',
      ),
      LessonSection(
        body:
            'Because telemetry from multiple monitoring components is '
            'correlated in real time, the EDR platform classifies the '
            'activity as a likely malware infection. The affected device '
            'is automatically isolated from the corporate network, and an '
            'alert is forwarded to the SOC for investigation, preventing '
            'the threat from spreading to additional systems.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Continuously collect endpoint telemetry from all managed devices',
          'Monitor process execution and command-line activity',
          'Enable File Integrity Monitoring for critical files and configurations',
          'Track registry modifications on Windows systems',
          'Monitor user authentication and privileged account activity',
          'Review service and scheduled task changes regularly',
          'Integrate endpoint telemetry with EDR and SIEM platforms',
          'Define alert thresholds to reduce false positives while maintaining effective threat detection',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'No single event typically confirms a cyberattack. Effective '
            'endpoint monitoring correlates multiple telemetry sources — '
            'such as process execution, registry changes, network '
            'connections, and user activity — to identify suspicious '
            'patterns and improve detection accuracy.',
      ),
    ],
  ),

  // 15 ---------------------------------------------------------------------
  Lesson(
    title: 'Microsoft Sysmon',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Microsoft Sysmon',
        body:
            'Microsoft Sysmon (System Monitor) is a Windows system '
            'service developed as part of the Sysinternals Suite. It '
            'extends the native Windows Event Log by recording detailed '
            'information about system activities that are often '
            'essential during security investigations.',
      ),
      LessonSection(
        body:
            'Unlike traditional Windows logs, Sysmon provides enhanced '
            'visibility into process execution, network connections, '
            'driver loading, registry modifications, and file creation '
            'activities. Once installed, Sysmon runs continuously in the '
            'background and records events in the '
            'Microsoft-Windows-Sysmon/Operational event log. Sysmon does '
            'not replace Windows Event Logs; instead, it complements them '
            'by providing additional telemetry that improves threat '
            'detection and forensic analysis.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/sysmon_visibility.jpg',
          caption:
              'Microsoft Sysmon enhances endpoint visibility by recording '
              'detailed security events that are forwarded to centralized '
              'monitoring platforms for analysis and threat detection.',
        ),
      ),
      LessonSection(
        heading: 'Why Sysmon Is Important',
        body:
            'Modern cyberattacks frequently use legitimate Windows '
            'utilities such as PowerShell, Windows Management '
            'Instrumentation (WMI), and command-line tools to evade '
            'traditional antivirus solutions. Sysmon captures detailed '
            'information that helps analysts identify these techniques. '
            'Benefits of Sysmon include:',
        bullets: [
          'Enhanced process visibility',
          'Parent-child process relationships',
          'Command-line logging',
          'Network connection tracking',
          'Driver loading events',
          'Registry modifications',
          'File creation timestamps',
          'Process hashing (SHA-1, SHA-256, MD5)',
        ],
      ),
      LessonSection(
        body:
            'Because of its detailed telemetry, Sysmon is widely deployed '
            'in enterprise Security Operations Centers (SOCs) and threat '
            'hunting environments.',
      ),
      LessonSection(
        heading: 'Common Sysmon Event Types',
        body:
            'Sysmon records many different categories of endpoint '
            'activity. These events provide detailed forensic evidence '
            'that is often unavailable in standard operating system '
            'logs. Some of the most valuable event categories are '
            'covered below.',
      ),
      LessonSection(
        heading: 'Process Creation',
        body:
            'Records every newly created process, including executable '
            'path, parent process, command-line arguments, user account, '
            'and process hash. Process creation events are extremely '
            'useful for detecting malicious scripts, ransomware, and '
            'attacker tool execution.',
      ),
      LessonSection(
        heading: 'Network Connections',
        body:
            'Sysmon records outbound network connections initiated by '
            'processes, including source IP address, destination IP '
            'address, port numbers, process name, and user account. '
            'Analysts frequently use these events to identify malware '
            'communicating with command-and-control (C2) servers.',
      ),
      LessonSection(
        heading: 'Driver Loading, Registry Changes & File Creation',
        body:
            'Sysmon also records drivers loaded into the operating '
            'system — unexpected driver installations may indicate '
            'rootkits, malicious kernel modules, or unauthorized '
            'software. It records modifications to important registry '
            'keys, including startup persistence, security policy '
            'changes, service configuration, and auto-run entries, which '
            'helps detect malware persistence mechanisms. And it can '
            'monitor file creation in selected directories such as the '
            'Downloads folder, temporary directories, startup folders, '
            'and administrative script locations — assisting '
            'investigators in identifying malware payloads and '
            'unauthorized software deployment.',
      ),
      LessonSection(
        heading: 'Common Sysmon Event IDs',
        body:
            'Each Sysmon event is assigned a unique Event ID that '
            'identifies the type of activity being recorded. Security '
            'analysts frequently reference these Event IDs when creating '
            'detection rules and conducting threat hunting.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Event ID', 'Description', 'Security Use'],
          tableRows: [
            ['1', 'Process Creation', 'Detect malware and suspicious process execution'],
            ['2', 'File Creation Time Changed', 'Identify timestamp manipulation'],
            ['3', 'Network Connection', 'Detect outbound malicious communications'],
            ['5', 'Process Terminated', 'Investigate process lifecycle'],
            ['6', 'Driver Loaded', 'Detect malicious or unsigned drivers'],
            ['7', 'Image Loaded', 'Monitor DLL loading activity'],
            ['8', 'CreateRemoteThread', 'Detect code injection attempts'],
            ['11', 'File Created', 'Monitor dropped malware files'],
            ['12–14', 'Registry Events', 'Detect persistence and configuration changes'],
            ['22', 'DNS Query', 'Identify suspicious domain lookups'],
          ],
        ),
      ),
    ],
  ),

  // 16 ---------------------------------------------------------------------
  Lesson(
    title: 'Centralized Log Collection & Forwarding',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Windows Event Forwarding (WEF)',
        body:
            'Collecting logs individually from thousands of Windows '
            'devices is inefficient and difficult to manage. Windows '
            'Event Forwarding (WEF) allows organizations to automatically '
            'forward selected Windows Event Logs from multiple endpoints '
            'to centralized Windows Event Collectors. WEF provides '
            'several advantages:',
        bullets: [
          'Centralized log collection',
          'Reduced administrative effort',
          'Standardized event collection',
          'Improved forensic preservation',
          'Integration with SIEM platforms',
        ],
      ),
      LessonSection(
        body:
            'Organizations can define subscription rules that specify '
            'which events should be forwarded, reducing unnecessary data '
            'collection.',
      ),
      LessonSection(
        heading: 'Syslog Forwarding',
        body:
            'Linux, Unix, and many network devices commonly use the '
            'Syslog protocol for centralized logging. Instead of storing '
            'logs only on local systems, Syslog forwards events to '
            'centralized log servers. Common devices using Syslog '
            'include Linux servers, firewalls, routers, switches, '
            'wireless controllers, and network appliances. Centralized '
            'Syslog servers simplify monitoring by collecting events from '
            'multiple infrastructure components in one location.',
      ),
      LessonSection(
        heading: 'Centralized Log Collection',
        body:
            'Large enterprises rarely analyze logs directly on endpoint '
            'devices. Instead, logs are forwarded to centralized '
            'platforms where they can be searched, correlated, and '
            'retained for extended periods. Typical enterprise log '
            'sources include:',
        bullets: [
          'Windows Event Logs',
          'Sysmon',
          'Linux Syslog',
          'macOS Unified Logs',
          'Endpoint Detection and Response (EDR)',
          'Antivirus software',
          'Identity services',
          'Cloud security platforms',
        ],
      ),
      LessonSection(
        body:
            'Centralization enables security teams to investigate '
            'incidents across multiple systems using a single interface.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/centralized_log_collection.jpg',
          caption:
              'Enterprise environments centralize logs from multiple '
              'operating systems and infrastructure devices before '
              'forwarding them to SIEM platforms for correlation, '
              'monitoring, and long-term storage.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Logging Pipelines',
        body:
            'A logging pipeline is the sequence of components '
            'responsible for collecting, processing, storing, and '
            'analyzing security logs. A typical enterprise logging '
            'pipeline includes: the endpoint generates an event, a '
            'security agent collects telemetry, local logs are created, '
            'logs are forwarded to centralized collectors, the SIEM '
            'normalizes and enriches events, correlation rules identify '
            'suspicious patterns, alerts are generated, and SOC analysts '
            'investigate the incident.',
      ),
      LessonSection(
        body:
            'Modern pipelines often include data enrichment, such as '
            'adding asset information, user identity, threat '
            'intelligence, geographic location, and device criticality. '
            'This additional context helps analysts prioritize alerts '
            'and accelerate investigations.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational manufacturing company uses Sysmon on all '
            'Windows endpoints, Syslog on Linux servers, and centralized '
            'log forwarding for network infrastructure. During routine '
            'monitoring, the SIEM detects a Sysmon Process Creation event '
            'indicating that powershell.exe launched with an encoded '
            'command. Moments later, a Sysmon Network Connection event '
            'shows communication with a known malicious IP address, '
            'while DNS Query events reveal requests for domains '
            'associated with malware.',
      ),
      LessonSection(
        body:
            'Because these events are centrally collected and correlated '
            'with threat intelligence, the SIEM automatically generates a '
            'high-severity alert. The SOC isolates the endpoint through '
            'the EDR platform and begins a forensic investigation before '
            'the attacker can establish persistence or move laterally.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Deploy Sysmon using standardized enterprise configurations',
          'Forward endpoint logs to centralized collectors immediately',
          'Protect log integrity through access controls and encryption',
          'Synchronize timestamps across all systems using NTP',
          'Filter unnecessary events to optimize storage and performance',
          'Retain logs according to organizational and regulatory requirements',
          'Continuously update detection rules based on emerging threats',
          'Validate logging configurations regularly to ensure complete visibility',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Detailed telemetry is one of the strongest defenses against '
            'modern cyber threats. Tools such as Sysmon provide '
            'visibility into attacker techniques that may be invisible in '
            'standard operating system logs, enabling faster detection, '
            'investigation, and response.',
      ),
    ],
  ),

  // 17 ---------------------------------------------------------------------
  Lesson(
    title: 'Endpoint Monitoring in the SOC',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'The SOC\'s View of the Endpoint',
        body:
            'A Security Operations Center (SOC) is a centralized team '
            'responsible for continuously monitoring an organization\'s '
            'security posture, detecting cyber threats, investigating '
            'alerts, and coordinating incident response activities. '
            'Endpoint monitoring provides SOC analysts with visibility '
            'into activities occurring on workstations, servers, virtual '
            'machines, and other managed devices. Common endpoint events '
            'monitored by a SOC include:',
        bullets: [
          'User authentication',
          'Process execution',
          'PowerShell activity',
          'File creation and deletion',
          'Registry modifications',
          'Service installation',
          'Scheduled task creation',
          'Network connections',
          'Malware detections',
          'Endpoint health status',
        ],
      ),
      LessonSection(
        body:
            'Rather than reviewing logs manually, SOC analysts rely on '
            'automated detection rules, behavioral analytics, and machine '
            'learning to identify suspicious activities requiring '
            'investigation.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/enterprise_telemetry_pipeline.jpg',
          caption:
              'Enterprise endpoint telemetry is collected, enriched with '
              'threat intelligence, analyzed by the SIEM, and '
              'investigated by SOC analysts before incident response '
              'activities are initiated.',
        ),
      ),
      LessonSection(
        heading: 'SIEM Integration',
        body:
            'Security Information and Event Management (SIEM) platforms '
            'serve as the central analysis engine for enterprise security '
            'operations. A SIEM collects logs from numerous sources, '
            'including:',
        bullets: [
          'Windows Event Logs',
          'Sysmon',
          'Linux Syslog',
          'macOS Unified Logging',
          'Endpoint Detection and Response (EDR)',
          'Firewalls',
          'Identity providers',
          'Cloud services',
          'Email security platforms',
        ],
      ),
      LessonSection(
        body:
            'The SIEM normalizes logs into a consistent format, enriches '
            'them with contextual information, and applies detection '
            'rules to identify suspicious behavior. This centralized '
            'approach allows analysts to investigate incidents across '
            'multiple systems from a single interface.',
      ),
      LessonSection(
        heading: 'Alert Correlation',
        body:
            'A single security event rarely provides enough evidence to '
            'determine whether a cyberattack is occurring. Modern SIEM '
            'platforms correlate multiple events from different sources '
            'to identify meaningful attack patterns. For example, the '
            'following sequence may indicate a compromised endpoint: a '
            'user opens an email attachment, Microsoft Word launches '
            'PowerShell, PowerShell downloads an executable from the '
            'internet, the executable modifies registry startup keys, '
            'and the endpoint establishes communication with an external '
            'command-and-control (C2) server.',
      ),
      LessonSection(
        body:
            'Although each event may appear legitimate in isolation, '
            'correlating them reveals a likely malware infection. '
            'Correlation significantly reduces false positives and helps '
            'security teams focus on high-confidence alerts.',
      ),
      LessonSection(
        heading: 'Threat Hunting',
        body:
            'While automated detection identifies many attacks, some '
            'advanced threats evade predefined detection rules. Threat '
            'hunting is the proactive process of searching enterprise '
            'environments for indicators of compromise (IOCs), suspicious '
            'behaviors, and attacker techniques that have not yet '
            'generated security alerts. Threat hunters commonly '
            'investigate:',
        bullets: [
          'Unusual PowerShell activity',
          'Suspicious parent-child process relationships',
          'Encoded command execution',
          'Rare administrative tool usage',
          'Unexpected outbound network connections',
          'Unauthorized scheduled tasks',
          'Persistence mechanisms',
          'Credential dumping activity',
        ],
      ),
      LessonSection(
        body:
            'Threat hunting combines endpoint telemetry, threat '
            'intelligence, and analyst expertise to identify hidden '
            'threats before they cause significant damage.',
      ),
      LessonSection(
        heading: 'Detection Engineering',
        body:
            'Detection engineering is the practice of designing, '
            'testing, and maintaining security detection rules that '
            'identify malicious activity while minimizing false '
            'positives. Detection engineers develop rules based on known '
            'attack techniques, threat intelligence, MITRE ATT&CK '
            'tactics and techniques, organizational risk, and historical '
            'incident data. Examples of detection rules include:',
        bullets: [
          'PowerShell executing Base64-encoded commands',
          'Office applications spawning command interpreters',
          'Creation of new local administrator accounts',
          'Antivirus service termination',
          'Unsigned drivers being loaded',
          'Multiple failed authentication attempts followed by a successful login',
        ],
      ),
      LessonSection(
        body:
            'Effective detection engineering improves the organization\'s '
            'ability to identify attacks quickly while reducing '
            'unnecessary analyst workload.',
      ),
    ],
  ),

  // 18 ---------------------------------------------------------------------
  Lesson(
    title: 'Incident Investigation Workflow',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Incident Investigation',
        body:
            'When the SIEM generates a high-confidence alert, SOC '
            'analysts begin an investigation to determine whether the '
            'event represents malicious activity. A typical investigation '
            'includes initial alert review, evidence collection, event '
            'correlation, threat validation, and response.',
      ),
      LessonSection(
        heading: 'Initial Alert Review',
        body:
            'Analysts examine the alert severity, affected endpoint, '
            'user account, and triggering events.',
      ),
      LessonSection(
        heading: 'Evidence Collection',
        body:
            'Additional endpoint telemetry is gathered, including '
            'process history, registry changes, network connections, '
            'file modifications, user logins, and security agent status.',
      ),
      LessonSection(
        heading: 'Event Correlation',
        body:
            'Logs from other enterprise systems are reviewed to '
            'determine whether similar activities occurred elsewhere.',
      ),
      LessonSection(
        heading: 'Threat Validation',
        body:
            'Analysts determine whether the activity represents a '
            'legitimate administrative task, a policy violation, '
            'malware, insider activity, or external compromise.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/investigation_workflow.jpg',
          caption:
              'SOC analysts investigate endpoint security alerts through '
              'a structured workflow that validates threats, initiates '
              'incident response, and supports continuous improvement.',
        ),
      ),
      LessonSection(
        heading: 'Response',
        body:
            'If malicious activity is confirmed, incident response '
            'procedures begin. Typical actions include isolating the '
            'endpoint, blocking malicious IP addresses, disabling '
            'compromised accounts, collecting forensic evidence, removing '
            'malware, and restoring affected systems.',
      ),
      LessonSection(
        heading: 'Enterprise Endpoint Log Sources',
        body:
            'Security Operations Centers collect logs from multiple '
            'endpoint and infrastructure sources to build a comprehensive '
            'view of enterprise security events:',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Log Source', 'Typical Information Collected', 'Common Security Use'],
          tableRows: [
            ['Windows Event Logs', 'Authentication, services, system events', 'User activity and system auditing'],
            ['Microsoft Sysmon', 'Process execution, registry changes, network connections', 'Threat hunting and forensic investigations'],
            ['Linux Syslog', 'Authentication, services, kernel events', 'Server monitoring and incident analysis'],
            ['macOS Unified Logging', 'Application, system, and security events', 'macOS security monitoring'],
            ['Endpoint Detection and Response (EDR)', 'Endpoint telemetry, behavioral detections', 'Real-time threat detection and response'],
            ['Antivirus / Endpoint Protection', 'Malware detections, scans, quarantines', 'Malware monitoring'],
            ['Identity Providers', 'User authentication, MFA events, privilege changes', 'Identity threat detection'],
            ['Network Devices', 'Firewall events, VPN sessions, connection logs', 'Correlation with endpoint activity'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational pharmaceutical company uses Microsoft '
            'Defender for Endpoint, Sysmon, Windows Event Forwarding, and '
            'Microsoft Sentinel to monitor more than 35,000 endpoints. '
            'One afternoon, the SIEM generates an alert indicating that '
            'Microsoft Excel launched PowerShell with an encoded '
            'command. Sysmon records the creation of a scheduled task, '
            'while endpoint telemetry shows outbound communication with '
            'a domain recently identified in a threat intelligence feed. '
            'At the same time, authentication logs reveal multiple '
            'failed login attempts against privileged accounts.',
      ),
      LessonSection(
        body:
            'Because the SIEM correlates events from endpoint telemetry, '
            'identity services, and threat intelligence, the alert is '
            'automatically classified as high severity. The SOC isolates '
            'the affected endpoint, disables the compromised account, '
            'blocks the malicious domain, and initiates a forensic '
            'investigation. Rapid detection prevents the attacker from '
            'deploying ransomware or moving laterally within the '
            'enterprise.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Centralize endpoint logs in a SIEM platform',
          'Deploy enhanced telemetry tools such as Sysmon on Windows systems',
          'Integrate endpoint monitoring with threat intelligence feeds',
          'Continuously tune detection rules to reduce false positives',
          'Monitor endpoint telemetry in real time',
          'Perform proactive threat hunting using endpoint data',
          'Retain logs according to organizational and regulatory requirements',
          'Regularly validate incident response procedures through tabletop exercises and simulations',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Endpoint monitoring is most effective when combined with '
            'identity, network, cloud, and threat intelligence data. '
            'Correlating multiple sources of telemetry enables security '
            'teams to detect sophisticated attacks that would be '
            'difficult to identify using endpoint logs alone.',
      ),
    ],
  ),

  // 19 ---------------------------------------------------------------------
  Lesson(
    title: 'Bringing It Together: Endpoint Security in Practice',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'One Continuous System, Not Separate Tools',
        body:
            'Endpoint management, patch and vulnerability management, and '
            'endpoint logging and monitoring aren\'t independent '
            'disciplines — they\'re stages of the same continuous effort '
            'to keep every device in an enterprise secure, visible, and '
            'trustworthy. Management enrolls and configures the device. '
            'Patch and vulnerability management keeps it free of known '
            'weaknesses. Logging and monitoring watch for the moment '
            'something goes wrong anyway.',
      ),
      LessonSection(
        heading: 'Where Each Piece Fits in an Attack Timeline',
        body:
            'Picture a real intrusion end to end. A phishing email lands '
            'on a laptop that endpoint management enrolled and '
            'configured months ago. The device is compliant, so it has '
            'access to corporate resources — but a vulnerability in a '
            'browser plugin that hasn\'t been patched yet is exactly what '
            'the attacker exploits. Sysmon and EDR telemetry catch the '
            'resulting PowerShell execution and outbound connection to a '
            'C2 server; the SIEM correlates it into a high-confidence '
            'alert; a SOC analyst walks the investigation workflow — '
            'review, evidence, correlation, validation — and isolates the '
            'device before the attacker can move laterally. Every lesson '
            'in this chapter is a link in that same chain.',
      ),
      LessonSection(
        heading: 'What Good Looks Like',
        body:
            'Mature endpoint security programs share a few habits: they '
            'automate enrollment and configuration so nothing depends on '
            'manual setup, they patch based on actual risk rather than a '
            'blanket schedule, they deploy telemetry tools like Sysmon '
            'widely rather than relying on default OS logging alone, and '
            'they centralize everything into a SIEM so no single log on '
            'a single device is ever the only copy of the evidence. None '
            'of these controls is sufficient by itself — it\'s the '
            'combination, applied consistently across every managed '
            'device, that closes the gap attackers are counting on.',
      ),
    ],
  ),
  // 20 — Practice Quiz -------------------------------------------------------
  Lesson(
    title: 'Practice Quiz: Endpoint Security',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'What is the primary purpose of device enrollment in an endpoint management platform?',
        options: [
          'To establish trust between the endpoint and the management system so policies and software can be deployed',
          'To permanently encrypt the device',
          'To remove the device from the corporate network',
          'To assign a static IP address',
        ],
        correctIndex: 0,
        explanation: 'Enrollment establishes trust between the endpoint and the management platform, enabling administrators to apply policy and deploy software remotely.',
      ),
      QuizQuestion(
        question: 'Which zero-touch enrollment method is specific to Windows devices?',
        options: [
          'Apple Automated Device Enrollment (ADE)',
          'Android Zero-touch Enrollment',
          'Windows Autopilot',
          'Manual enrollment',
        ],
        correctIndex: 2,
        explanation: 'Windows Autopilot automatically configures Windows devices during initial setup, reducing deployment time.',
      ),
      QuizQuestion(
        question: 'What does Conditional Access add to a standard identity-based login check?',
        options: [
          'A second password',
          'Evaluation of the device\'s security posture (compliance) before granting access',
          'A CAPTCHA',
          'A VPN tunnel',
        ],
        correctIndex: 1,
        explanation: 'Conditional Access evaluates both user identity and device compliance, blocking access if the device is non-compliant even if the user authenticates successfully.',
      ),
      QuizQuestion(
        question: 'A device management platform reports which devices haven\'t checked in recently and which are approaching end-of-life. Which function is this?',
        options: [
          'Endpoint analytics',
          'Device inventory management',
          'Remote administration',
          'Patch deployment',
        ],
        correctIndex: 1,
        explanation: 'Device inventory management maintains an accurate, centralized record of all managed devices, supporting asset management and security monitoring.',
      ),
      QuizQuestion(
        question: 'An employee reports a lost corporate laptop. What remote administration action removes sensitive data before it can be accessed?',
        options: [
          'Remote restart',
          'Sync policies',
          'Remote wipe',
          'Certificate deployment',
        ],
        correctIndex: 2,
        explanation: 'A remote wipe removes sensitive organizational data from a lost or stolen device before unauthorized individuals can access it.',
      ),
      QuizQuestion(
        question: 'What is the highest-priority category of software patch?',
        options: [
          'Feature updates',
          'Bug fixes',
          'Security patches',
          'Firmware updates',
        ],
        correctIndex: 2,
        explanation: 'Security patches correct exploitable vulnerabilities and are generally considered the highest priority, since delaying them increases organizational risk.',
      ),
      QuizQuestion(
        question: 'Which stage of the patch management lifecycle comes immediately before Deployment?',
        options: [
          'Vulnerability identification',
          'Approval',
          'Verification',
          'Documentation',
        ],
        correctIndex: 1,
        explanation: 'The lifecycle runs vulnerability identification → patch availability review → risk assessment → patch testing → approval → deployment → verification → documentation → continuous monitoring.',
      ),
      QuizQuestion(
        question: 'In a ring-based patch deployment, which ring receives updates first?',
        options: [
          'Ring 3 – Enterprise Deployment',
          'Ring 2 – Business Departments',
          'Ring 1 – Pilot Users',
          'Ring 0 – IT Administrators',
        ],
        correctIndex: 3,
        explanation: 'Ring 0 covers IT administrators and endpoint management teams, who receive updates first before they progress to pilot users, business departments, and finally full enterprise deployment.',
      ),
      QuizQuestion(
        question: 'On which day of the month does Microsoft\'s routine "Patch Tuesday" release fall?',
        options: [
          'The first Tuesday',
          'The second Tuesday',
          'The last Tuesday',
          'Every Tuesday',
        ],
        correctIndex: 1,
        explanation: 'Patch Tuesday occurs on the second Tuesday of each month, when Microsoft releases scheduled security updates for supported products.',
      ),
      QuizQuestion(
        question: 'What defines a zero-day vulnerability?',
        options: [
          'A vulnerability with a CVSS score of zero',
          'A vulnerability that becomes known before a security patch is available',
          'A vulnerability that was patched on day zero of disclosure',
          'A vulnerability affecting only legacy systems',
        ],
        correctIndex: 1,
        explanation: 'A zero-day vulnerability is a flaw that becomes publicly known (or actively exploited) before the vendor has released a fix.',
      ),
      QuizQuestion(
        question: 'Which factor is NOT part of the standardized CVSS score itself, but IS used in broader vulnerability prioritization?',
        options: [
          'Attack complexity',
          'Required privileges',
          'Business criticality of the affected asset',
          'Confidentiality impact',
        ],
        correctIndex: 2,
        explanation: 'Business criticality, internet exposure, and regulatory requirements are business-context factors layered on top of the CVSS technical score during real-world prioritization.',
      ),
      QuizQuestion(
        question: 'A CVSS score of 9.2 falls into which severity band?',
        options: [
          'Medium',
          'High',
          'Critical',
          'Low',
        ],
        correctIndex: 2,
        explanation: 'CVSS scores from 9.0–10.0 are rated Critical and typically call for immediate remediation.',
      ),
      QuizQuestion(
        question: 'What is the key difference between remediation and mitigation of a vulnerability?',
        options: [
          'Remediation completely removes the weakness; mitigation reduces risk without eliminating it',
          'Mitigation is always faster than remediation',
          'Remediation only applies to firmware',
          'There is no meaningful difference',
        ],
        correctIndex: 0,
        explanation: 'Remediation (e.g. patching) eliminates the vulnerability entirely, while mitigation (e.g. firewall rules, segmentation) reduces risk when immediate remediation isn\'t possible.',
      ),
      QuizQuestion(
        question: 'Which Windows Event Log category is most central to security investigations?',
        options: [
          'Application Log',
          'Security Log',
          'Setup Log',
          'System Log',
        ],
        correctIndex: 1,
        explanation: 'The Security Log records authentication, privilege escalation, and policy change events, making it a primary source for security investigations.',
      ),
      QuizQuestion(
        question: 'Which log file would a Linux administrator check first to investigate authentication failures?',
        options: [
          '/var/log/kern.log',
          '/var/log/auth.log',
          '/var/log/messages',
          '/var/log/syslog',
        ],
        correctIndex: 1,
        explanation: '/var/log/auth.log (or /var/log/secure on some distributions) records authentication-related events on Linux systems.',
      ),
      QuizQuestion(
        question: 'What does File Integrity Monitoring (FIM) primarily detect?',
        options: [
          'Network bandwidth usage',
          'Unauthorized creation, modification, or deletion of critical files',
          'CPU temperature',
          'User password strength',
        ],
        correctIndex: 1,
        explanation: 'FIM continuously monitors critical files and directories for unauthorized changes, which is especially valuable for detecting ransomware and malware persistence.',
      ),
      QuizQuestion(
        question: 'What technique do attackers use when they abuse legitimate tools like PowerShell and WMI to avoid detection?',
        options: [
          'Living off the Land (LotL)',
          'Zero-day exploitation',
          'Credential stuffing',
          'DNS tunneling',
        ],
        correctIndex: 0,
        explanation: 'Living off the Land (LotL) attacks abuse trusted, pre-installed system utilities to blend in with normal administrative activity and evade detection.',
      ),
      QuizQuestion(
        question: 'Which Sysmon Event ID records a new process being created?',
        options: [
          'Event ID 1',
          'Event ID 3',
          'Event ID 11',
          'Event ID 22',
        ],
        correctIndex: 0,
        explanation: 'Sysmon Event ID 1 records Process Creation, including the executable path, parent process, command-line arguments, and process hash.',
      ),
      QuizQuestion(
        question: 'What is the main purpose of Windows Event Forwarding (WEF)?',
        options: [
          'To encrypt local log files',
          'To automatically forward selected Windows event logs from endpoints to centralized collectors',
          'To disable unnecessary logging',
          'To synchronize system clocks',
        ],
        correctIndex: 1,
        explanation: 'WEF centralizes log collection by forwarding selected events from multiple Windows endpoints to Windows Event Collectors, reducing administrative effort.',
      ),
      QuizQuestion(
        question: 'In alert correlation, why does a SIEM connect multiple individually-legitimate-looking events together?',
        options: [
          'To reduce storage costs',
          'Because a single event rarely provides enough evidence on its own to confirm a real attack',
          'To comply with GDPR',
          'To disable false alerts entirely',
        ],
        correctIndex: 1,
        explanation: 'A single event is rarely conclusive; correlating a sequence of events across sources reveals attack patterns, reduces false positives, and increases alert confidence.',
      ),
      QuizQuestion(
        question: 'What best describes threat hunting?',
        options: [
          'Waiting passively for the SIEM to generate alerts',
          'Proactively searching the environment for indicators of compromise that haven\'t yet triggered an alert',
          'Installing antivirus software',
          'Reviewing patch compliance reports',
        ],
        correctIndex: 1,
        explanation: 'Threat hunting is the proactive process of searching for IOCs and attacker techniques that automated detection hasn\'t flagged yet.',
      ),
      QuizQuestion(
        question: 'In the SOC incident investigation workflow, which step comes right before "Response"?',
        options: [
          'Initial Alert Review',
          'Evidence Collection',
          'Threat Validation',
          'Event Correlation',
        ],
        correctIndex: 2,
        explanation: 'The workflow runs: Initial Alert Review → Evidence Collection → Event Correlation → Threat Validation → Response.',
      ),
      QuizQuestion(
        question: 'What is the practice of designing and tuning security detection rules to catch malicious activity while minimizing false positives called?',
        options: [
          'Threat hunting',
          'Detection engineering',
          'Patch management',
          'Asset discovery',
        ],
        correctIndex: 1,
        explanation: 'Detection engineering is the practice of building and maintaining detection rules based on known attack techniques, threat intelligence, and frameworks like MITRE ATT&CK.',
      ),
      QuizQuestion(
        question: 'Which patch deployment strategy is best suited to an actively exploited critical vulnerability affecting internet-facing systems?',
        options: [
          'Department-based deployment',
          'Pilot deployment only',
          'Emergency / risk-based deployment',
          'No deployment until the next Patch Tuesday',
        ],
        correctIndex: 2,
        explanation: 'Risk-based and emergency deployment prioritize the highest-risk, actively exploited systems for immediate remediation, even outside the routine patch cycle.',
      ),
      QuizQuestion(
        question: 'Why do organizations maintain rollback procedures such as system backups and VM snapshots before deploying patches?',
        options: [
          'To speed up deployment',
          'To allow quick restoration if an update introduces unexpected problems',
          'Because it is legally required for all patches',
          'To avoid needing to test patches at all',
        ],
        correctIndex: 1,
        explanation: 'Rollback planning lets administrators restore affected systems quickly if a deployed update causes unexpected compatibility or stability issues.',
      ),
      QuizQuestion(
        question: 'Which of the following would MOST likely be classified as a Critical CVSS-rated vulnerability requiring immediate action?',
        options: [
          'A 2.1-scored vulnerability on an isolated test server',
          'A 9.6-scored vulnerability on a domain controller',
          'A 5.5-scored vulnerability with no known exploit',
          'A feature update with no CVSS score',
        ],
        correctIndex: 1,
        explanation: 'A CVSS score of 9.0–10.0 is rated Critical, and a domain controller is a high-value asset — combining severity and asset criticality demands immediate action.',
      ),
      QuizQuestion(
        question: 'What is Mean Time to Remediate (MTTR) used to measure?',
        options: [
          'How long a device stays enrolled in management',
          'How quickly identified vulnerabilities are remediated on average',
          'How many CVEs exist in a given year',
          'The average CVSS score across all assets',
        ],
        correctIndex: 1,
        explanation: 'MTTR tracks the average time between identifying a vulnerability and successfully remediating it, a key metric on vulnerability management dashboards.',
      ),
    ],
  ),
];
