import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> endpointSecurityLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Endpoint Security',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Is an Endpoint?',
        body:
            'An endpoint is any device that connects to an '
            'organization\'s network and communicates with other '
            'systems or cloud services. Examples include desktop '
            'computers, laptops, servers, smartphones, tablets, virtual '
            'machines, and Internet of Things (IoT) devices.',
      ),
      LessonSection(
        heading: 'What Is Endpoint Security?',
        body:
            'Endpoint Security is the process of protecting these '
            'devices from cyber threats while ensuring they remain '
            'available, compliant, and secure throughout their '
            'lifecycle. Unlike network security, which focuses on '
            'protecting data as it travels across the network, endpoint '
            'security focuses on securing the devices that users '
            'interact with every day. These devices often store '
            'sensitive information, run business-critical applications, '
            'and provide access to corporate resources, making them '
            'attractive targets for attackers.',
      ),
      LessonSection(
        heading: 'From Antivirus to a Comprehensive Strategy',
        body:
            'As organizations embrace cloud computing, remote work, and '
            'mobile devices, endpoint security has evolved from simple '
            'antivirus software to a comprehensive security strategy '
            'involving prevention, detection, response, and continuous '
            'monitoring.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/fig_6_1_enterprise_endpoint.jpg',
          caption: 'Endpoint security protects every device connected to the enterprise network, reducing the risk of cyberattacks.',
        ),
      ),
      LessonSection(
        heading: 'Why Is Endpoint Security Important?',
        body:
            'In a modern enterprise, employees work from offices, '
            'homes, airports, customer locations, and public spaces. '
            'They connect using company-issued laptops, personal '
            'smartphones, tablets, and virtual desktops. While this '
            'flexibility improves productivity, it also increases the '
            'organization\'s attack surface — the number of potential '
            'entry points an attacker can exploit.',
      ),
      LessonSection(
        heading: 'Endpoints Are Often the Easier Target',
        body:
            'Cybercriminals often target endpoints because they are '
            'easier to compromise than well-protected data centers. A '
            'single infected laptop or stolen smartphone may provide '
            'attackers with access to confidential data, cloud '
            'applications, or the internal corporate network. For '
            'example, an employee who unknowingly opens a malicious '
            'email attachment may infect their laptop with ransomware. '
            'If the device is not properly protected, the malware could '
            'spread to shared folders, servers, or other endpoints, '
            'causing significant business disruption.',
      ),
      LessonSection(
        heading: 'What a Strong Endpoint Security Program Achieves',
        bullets: [
          'Protect sensitive business information',
          'Prevent malware infections',
          'Secure remote and hybrid workers',
          'Detect suspicious activities quickly',
          'Reduce the impact of cyberattacks',
          'Meet regulatory and compliance requirements',
        ],
      ),
      LessonSection(
        heading: 'Understanding the Endpoint Attack Surface',
        body:
            'Every connected endpoint represents a potential point of '
            'entry for attackers. An endpoint may become vulnerable '
            'because of:',
        bullets: [
          'Outdated operating systems',
          'Missing security patches',
          'Weak passwords',
          'Malicious email attachments',
          'Insecure applications',
          'Lost or stolen devices',
          'Misconfigured security settings',
        ],
      ),
      LessonSection(
        heading: 'Common Types of Enterprise Endpoints',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Endpoint', 'Typical Use'],
          tableRows: [
            ['Desktop Computer', 'Office productivity and business applications'],
            ['Laptop', 'Mobile workforce and remote work'],
            ['Server', 'Hosts business applications and services'],
            ['Smartphone', 'Email, communication, and mobile applications'],
            ['Tablet', 'Field operations, sales, and executive access'],
            ['Virtual Machine', 'Cloud and data center workloads'],
            ['IoT Device', 'Printers, cameras, sensors, and smart devices'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Common Endpoint Threats',
        bullets: [
          'Malware — malicious software designed to damage systems, steal data, or disrupt operations',
          'Ransomware — encrypts files or systems and demands payment to restore access',
          'Phishing — tricks users into revealing passwords or downloading malicious software through fraudulent emails or websites',
          'Unpatched software — attackers often exploit known software vulnerabilities that have not yet been patched',
          'Insider threats — employees or contractors may intentionally or unintentionally expose sensitive information or misuse company resources',
          'Lost or stolen devices — sensitive corporate information can result in a data breach if the device is not properly encrypted',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/fig_6_2_threats.jpg',
          caption: 'Endpoint devices face multiple threats, requiring layered security controls to protect business data.',
        ),
      ),
      LessonSection(
        heading: 'Layered Endpoint Protection',
        body:
            'No single security solution can stop every attack. '
            'Organizations therefore use a layered security approach, '
            'where multiple controls work together to protect endpoint '
            'devices.',
      ),
      LessonSection(
        heading: 'Typical Security Layers',
        bullets: [
          'User Authentication — verifies identity through passwords, biometrics, or Multi-Factor Authentication (MFA)',
          'Antivirus / Endpoint Protection Platform (EPP) — detects and blocks known malware before it can infect the device',
          'Endpoint Detection and Response (EDR) — continuously monitors endpoint activity, detects suspicious behavior, and helps security teams investigate and respond to threats',
          'Disk Encryption — protects data stored on the device so it cannot be read if the device is lost or stolen',
          'Patch Management — ensures operating systems and applications are updated with the latest security fixes',
          'Application Control — restricts unauthorized or unapproved software from running on endpoint devices',
          'Security Monitoring — collects logs and security events, sending them to centralized platforms such as SIEM for analysis',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/fig_6_3_layered_protection.jpg',
          caption: 'Layered endpoint protection combines multiple security controls to defend against different types of cyber threats.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global consulting company has employees working from '
            'offices, homes, and customer locations. Each company-'
            'issued laptop is protected using an Endpoint Protection '
            'Platform (EPP), Endpoint Detection and Response (EDR), '
            'BitLocker disk encryption, Multi-Factor Authentication '
            '(MFA), automatic patch management, and centralized '
            'monitoring through a SIEM platform. One employee '
            'unknowingly opens a phishing email containing a malicious '
            'attachment. The EDR solution detects unusual behavior, '
            'isolates the laptop from the network, and alerts the '
            'Security Operations Center (SOC). The security team '
            'investigates the incident, removes the malware, and '
            'restores the device without affecting other systems.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Endpoint security is most effective when combined with '
            'user awareness. Even the best security technologies cannot '
            'completely eliminate risks caused by phishing, weak '
            'passwords, or unsafe browsing habits. Regular '
            'cybersecurity awareness training helps employees recognize '
            'and avoid common attacks.',
      ),
      LessonSection(
        heading: 'Key Takeaways',
        bullets: [
          'Endpoints are devices that connect to an organization\'s network and access business resources',
          'Modern endpoints include desktops, laptops, servers, smartphones, tablets, virtual machines, and IoT devices',
          'Endpoints are common targets because they provide direct access to enterprise data and applications',
          'Effective endpoint security combines prevention, detection, response, encryption, patching, and continuous monitoring',
          'A layered security approach provides stronger protection than relying on a single security solution',
        ],
      ),
      LessonSection(
        heading: 'Review Questions',
        bullets: [
          'What is an endpoint, and why is it important to secure it?',
          'Why have endpoints become one of the primary targets for cybercriminals?',
          'List six common endpoint threats',
          'Explain why a layered security approach is more effective than using antivirus software alone',
          'How does Endpoint Detection and Response (EDR) improve endpoint security compared to traditional antivirus solutions?',
        ],
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Types of Endpoints & Enterprise Endpoint Management',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'The Modern Workplace Has Changed',
        body:
            'The modern workplace has changed significantly over the '
            'past decade. Employees no longer work only from office '
            'desktops. Today, they use laptops while traveling, '
            'smartphones to access email, tablets during customer '
            'meetings, and cloud-hosted virtual machines to run '
            'business applications.',
      ),
      LessonSection(
        heading: 'Growth Brings Growing Complexity',
        body:
            'As organizations adopt remote work, cloud computing, and '
            'Bring Your Own Device (BYOD) policies, the number and '
            'variety of endpoints continue to grow. Each of these '
            'devices increases productivity, but it also expands the '
            'organization\'s attack surface. Managing thousands of '
            'endpoints manually is neither practical nor secure. '
            'Organizations therefore rely on centralized endpoint '
            'management solutions that allow IT administrators to '
            'deploy software, enforce security policies, monitor device '
            'health, and respond to security incidents from a single '
            'management console.',
      ),
      LessonSection(
        heading: 'Desktop Computers',
        body:
            'Desktop computers are commonly used in office environments '
            'where employees perform daily business activities such as '
            'document creation, email communication, financial '
            'operations, and software development. Since desktops '
            'usually remain inside the corporate network, they are '
            'easier to manage than mobile devices. However, they are '
            'still vulnerable to malware, phishing attacks, unauthorized '
            'USB devices, and insider threats.',
        bullets: [
          'Endpoint Protection Platform (EPP)',
          'Disk encryption',
          'Automatic patch management',
          'Application control',
          'Multi-Factor Authentication (MFA)',
        ],
      ),
      LessonSection(
        heading: 'Laptops',
        body:
            'Laptops provide flexibility for employees working remotely '
            'or traveling between office locations. They often store '
            'sensitive business information and regularly connect '
            'through public Wi-Fi or home networks. Because laptops '
            'operate outside the organization\'s perimeter, they require '
            'stronger security controls than desktop computers.',
        bullets: [
          'Full-disk encryption',
          'VPN or Zero Trust Network Access (ZTNA)',
          'Endpoint Detection and Response (EDR)',
          'Device compliance policies',
          'Remote lock and wipe capabilities',
        ],
      ),
      LessonSection(
        heading: 'Servers',
        body:
            'Servers provide services and resources to multiple users '
            'and applications across the organization. They are often '
            'considered high-value targets because they host critical '
            'business systems.',
        bullets: ['File Servers', 'Web Servers', 'Database Servers', 'Application Servers', 'Domain Controllers'],
      ),
      LessonSection(
        heading: 'A Compromised Server Affects Everyone',
        body:
            'A compromised server can affect hundreds or thousands of '
            'users, making server security a top priority.',
        bullets: [
          'Restrict administrative access',
          'Apply security updates promptly',
          'Enable continuous monitoring',
          'Perform regular backups',
          'Use Privileged Access Management (PAM) for administrator accounts',
        ],
      ),
      LessonSection(
        heading: 'Mobile Devices',
        body:
            'Smartphones and tablets have become essential business '
            'tools, used to access corporate email, collaboration '
            'platforms, business applications, video conferencing, and '
            'cloud storage. However, mobile devices are more likely to '
            'be lost or stolen than traditional computers.',
        bullets: [
          'PIN or biometric authentication',
          'Device encryption',
          'Mobile Device Management (MDM)',
          'Remote wipe',
          'Application restrictions',
        ],
      ),
      LessonSection(
        heading: 'Virtual Machines (VMs)',
        body:
            'A Virtual Machine (VM) is a software-based computer that '
            'runs on a physical server using virtualization technology. '
            'Organizations use virtual machines because they reduce '
            'hardware costs, improve resource utilization, simplify '
            'disaster recovery, and enable rapid deployment of new '
            'systems. Although virtual machines do not have physical '
            'hardware, they require the same security controls as '
            'physical endpoints, including antivirus protection, patch '
            'management, and access control.',
      ),
      LessonSection(
        heading: 'Internet of Things (IoT) Devices',
        body:
            'The Internet of Things (IoT) refers to devices that '
            'connect to a network and communicate automatically, '
            'including smart security cameras, network printers, smart '
            'TVs, environmental sensors, badge readers, and medical '
            'devices. Many IoT devices have limited processing power '
            'and may not support advanced security features. As a '
            'result, they are frequently targeted by attackers. '
            'Organizations should isolate IoT devices using network '
            'segmentation and regularly update their firmware whenever '
            'possible.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/fig_6_4_endpoint_types.jpg',
          caption: 'Modern enterprises manage a diverse range of endpoint devices, each requiring appropriate security controls.',
        ),
      ),
      LessonSection(
        heading: 'What Is Endpoint Management?',
        body:
            'Managing endpoint devices involves much more than '
            'installing antivirus software. Endpoint Management is the '
            'process of deploying, configuring, securing, monitoring, '
            'updating, and retiring endpoint devices throughout their '
            'lifecycle.',
        bullets: [
          'Device procurement',
          'Initial configuration',
          'Software deployment',
          'Security policy enforcement',
          'Continuous monitoring',
          'Patch management',
          'Device retirement or replacement',
        ],
      ),
      LessonSection(
        heading: 'Endpoint Protection Platform (EPP)',
        body:
            'An Endpoint Protection Platform (EPP) is designed to '
            'prevent common threats before they compromise a device. '
            'EPP serves as the first line of defense against known '
            'threats and is installed on desktops, laptops, and '
            'servers.',
        bullets: [
          'Antivirus and anti-malware protection',
          'Firewall management',
          'Web protection',
          'USB device control',
          'Application control',
          'Behavioral malware detection',
        ],
      ),
      LessonSection(
        heading: 'Examples of EPP Solutions',
        bullets: [
          'Microsoft Defender for Endpoint (Protection capabilities)',
          'Trend Micro Apex One',
          'Symantec Endpoint Security',
          'Sophos Intercept X',
        ],
      ),
      LessonSection(
        heading: 'Mobile Device Management (MDM)',
        body:
            'As organizations adopted smartphones and tablets, '
            'traditional endpoint management tools became insufficient. '
            'Mobile Device Management (MDM) enables administrators to '
            'manage mobile devices remotely.',
        bullets: [
          'Enforcing screen lock policies',
          'Configuring corporate email',
          'Deploying mobile applications',
          'Managing Wi-Fi and VPN settings',
          'Monitoring device compliance',
          'Performing remote lock and remote wipe',
        ],
      ),
      LessonSection(
        heading: 'Unified Endpoint Management (UEM)',
        body:
            'Modern enterprises often use Windows, macOS, Linux, '
            'Android, and iOS devices simultaneously. Managing each '
            'platform separately increases administrative effort. '
            'Unified Endpoint Management (UEM) combines traditional '
            'endpoint management and mobile device management into a '
            'single platform capable of managing multiple operating '
            'systems from one console.',
        bullets: [
          'Device enrollment',
          'Software deployment',
          'Operating system updates',
          'Security policy enforcement',
          'Compliance reporting',
          'Asset inventory',
          'Remote troubleshooting',
        ],
      ),
      LessonSection(
        heading: 'Examples of UEM Solutions',
        bullets: [
          'Microsoft Intune',
          'VMware Workspace ONE',
          'IBM MaaS360',
          'Ivanti Neurons',
          'ManageEngine Endpoint Central',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint/fig_6_uem.jpg',
          caption: 'Unified Endpoint Management enables administrators to manage multiple device types from a single centralized console.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational organization manages more than 12,000 '
            'endpoint devices across offices in North America, Europe, '
            'and Asia. Using a Unified Endpoint Management platform, '
            'the IT team can automatically deploy security updates, '
            'install approved business applications, enforce BitLocker '
            'encryption on Windows laptops, ensure smartphones comply '
            'with security policies before accessing corporate email, '
            'generate compliance reports for auditors, and remotely '
            'lock or wipe lost devices. Without centralized endpoint '
            'management, performing these tasks manually would require '
            'significant time and increase the risk of configuration '
            'errors.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'You cannot protect what you cannot see. Maintaining an '
            'accurate inventory of all endpoint devices is one of the '
            'first steps in building an effective endpoint security '
            'program. Unknown or unmanaged devices can become easy '
            'targets for attackers.',
      ),
      LessonSection(
        heading: 'Comparison of Endpoint Management Solutions',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Solution', 'Primary Purpose', 'Typical Devices Managed'],
          tableRows: [
            ['EPP', 'Prevent malware and common endpoint threats', 'Desktops, Laptops, Servers'],
            ['MDM', 'Secure and manage mobile devices', 'Smartphones and Tablets'],
            ['UEM', 'Centrally manage all endpoint types', 'Windows, macOS, Linux, Mobile Devices, Virtual Machines'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Key Takeaways',
        bullets: [
          'Enterprise environments include a wide variety of endpoint devices, each with different security requirements',
          'Desktop computers, laptops, servers, mobile devices, virtual machines, and IoT devices all require appropriate protection',
          'Endpoint management covers the entire device lifecycle, from deployment to retirement',
          'EPP helps prevent common threats, while MDM focuses on mobile devices',
          'UEM provides centralized management for multiple operating systems and device types, improving both security and operational efficiency',
        ],
      ),
      LessonSection(
        heading: 'Review Questions',
        bullets: [
          'Why has endpoint management become more challenging in modern enterprises?',
          'Compare the security requirements of desktops, laptops, and servers',
          'What is the primary purpose of an Endpoint Protection Platform (EPP)?',
          'How does Unified Endpoint Management (UEM) differ from Mobile Device Management (MDM)?',
          'Why is maintaining an accurate inventory of endpoint devices important for security?',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Malware and Endpoint Threats',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'A Constant Barrage of Attacks',
        body:
            'Every day, organizations around the world face thousands '
            'of cyberattacks targeting endpoint devices. Attackers know '
            'that compromising a single laptop, desktop, or server can '
            'provide access to sensitive business information, user '
            'credentials, or even an organization\'s entire network.',
      ),
      LessonSection(
        heading: 'What Is Malware?',
        body:
            'Malware (short for malicious software) is any software '
            'intentionally designed to disrupt computer operations, '
            'steal information, damage systems, or gain unauthorized '
            'access to devices. Unlike legitimate software, malware is '
            'created with malicious intent. It may operate silently in '
            'the background, making it difficult for users to detect '
            'until significant damage has already occurred.',
        bullets: [
          'Stealing usernames and passwords',
          'Encrypting business files',
          'Monitoring user activity',
          'Disabling security software',
          'Providing remote access to attackers',
          'Spreading to other devices on the network',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Malicious Email / Infected Website / USB Device', 'Endpoint Infection', 'Malware Execution', 'Data Theft or System Damage'],
          caption: 'Malware typically enters an endpoint through a delivery method, executes malicious code, and performs unauthorized actions.',
        ),
      ),
      LessonSection(
        heading: 'How Malware Reaches Endpoints',
        bullets: [
          'Phishing emails — malicious attachments or links that install malware when opened',
          'Malicious websites — compromised or fake sites that automatically download malicious software',
          'Infected USB devices — removable media can introduce malware, especially without proper security controls',
          'Software downloads — downloading from untrusted sources increases the risk of installing disguised malware',
          'Exploiting software vulnerabilities — attackers frequently exploit outdated operating systems or applications',
        ],
      ),
      LessonSection(
        heading: 'Virus',
        body:
            'A virus is malware that attaches itself to legitimate '
            'files or programs. It requires user action, such as '
            'opening an infected file, before it can execute. Once '
            'activated, a virus may corrupt files, delete data, slow '
            'system performance, and spread to other files. Viruses '
            'usually require human interaction to spread.',
      ),
      LessonSection(
        heading: 'Worm',
        body:
            'A worm is self-replicating malware that spreads '
            'automatically across networks without user intervention. '
            'Unlike viruses, worms do not need to attach themselves to '
            'another program. They often exploit network vulnerabilities '
            'to infect multiple devices rapidly.',
      ),
      LessonSection(
        heading: 'Trojan Horse',
        body:
            'A Trojan Horse, or simply Trojan, disguises itself as '
            'legitimate software. For example, an attacker may create '
            'a fake PDF reader or software update. Once installed, the '
            'Trojan secretly performs malicious activities such as '
            'installing additional malware, creating backdoors, and '
            'stealing sensitive information. Unlike worms, Trojans do '
            'not spread automatically.',
      ),
      LessonSection(
        heading: 'Ransomware',
        body:
            'Ransomware is one of the most damaging forms of malware. '
            'It encrypts files or entire systems and demands payment in '
            'exchange for the decryption key. A ransomware attack can '
            'disrupt business operations, prevent access to important '
            'files, cause financial losses, and damage an organization\'s '
            'reputation. Modern ransomware groups often steal data '
            'before encryption and threaten to publish it if the ransom '
            'is not paid.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Phishing Email', 'User Opens Attachment', 'Malware Executes', 'Files Encrypted', 'Ransom Demand'],
          caption: 'Ransomware commonly begins with phishing and can quickly encrypt business-critical data.',
        ),
      ),
      LessonSection(
        heading: 'Spyware',
        body:
            'Spyware secretly collects information from an infected '
            'device without the user\'s knowledge. It may capture login '
            'credentials, browsing history, financial information, '
            'screenshots, and keystrokes. The stolen information is '
            'then transmitted to the attacker.',
      ),
      LessonSection(
        heading: 'Adware',
        body:
            'Adware displays unwanted advertisements and may collect '
            'information about user behavior. Although generally less '
            'destructive than ransomware or spyware, adware can slow '
            'system performance, display intrusive advertisements, '
            'redirect web browsers, and create privacy concerns.',
      ),
      LessonSection(
        heading: 'Rootkit',
        body:
            'A Rootkit is malware designed to hide itself from users '
            'and security software. It often provides attackers with '
            'persistent administrative access to a compromised system. '
            'Because rootkits operate at a very low level within the '
            'operating system, they can be extremely difficult to '
            'detect and remove.',
      ),
      LessonSection(
        heading: 'Fileless Malware',
        body:
            'Traditional malware installs files on a computer\'s hard '
            'drive. Fileless malware behaves differently by executing '
            'directly in system memory using legitimate operating '
            'system tools. This makes it much harder for traditional '
            'antivirus software to detect. Modern EDR solutions are '
            'particularly effective at identifying fileless attacks by '
            'monitoring suspicious behavior rather than relying solely '
            'on file signatures.',
      ),
      LessonSection(
        heading: 'Comparison of Malware Types',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Malware Type', 'Primary Objective', 'Requires User Action?'],
          tableRows: [
            ['Virus', 'Infect files and programs', 'Yes'],
            ['Worm', 'Self-replicate across networks', 'No'],
            ['Trojan', 'Disguise malicious software', 'Yes'],
            ['Ransomware', 'Encrypt files for ransom', 'Usually'],
            ['Spyware', 'Steal information', 'Often'],
            ['Adware', 'Display unwanted advertisements', 'Usually'],
            ['Rootkit', 'Hide malicious activity', 'No'],
            ['Fileless Malware', 'Execute in memory to evade detection', 'Often'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'An employee receives an email claiming to contain an '
            'urgent invoice from a supplier. The employee opens the '
            'attachment, believing it to be legitimate. The attachment '
            'installs ransomware, which begins encrypting documents '
            'stored on the laptop. The EDR solution immediately detects '
            'abnormal file encryption activity, isolates the laptop '
            'from the network, and alerts the SOC. Because the attack '
            'was detected early, the ransomware is contained before it '
            'can spread to file servers or other endpoint devices.',
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Most malware infections begin with human error. Regular '
            'cybersecurity awareness training, combined with email '
            'security and endpoint protection, significantly reduces '
            'the risk of successful malware attacks.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Install reputable endpoint protection software',
          'Keep operating systems and applications updated',
          'Avoid downloading software from untrusted sources',
          'Disable unnecessary USB storage devices where appropriate',
          'Scan email attachments before opening them',
          'Back up important business data regularly',
          'Train employees to recognize phishing attacks',
        ],
      ),
      LessonSection(
        heading: 'Key Takeaways',
        bullets: [
          'Malware is software designed to damage systems, steal information, or gain unauthorized access',
          'Common malware types include viruses, worms, Trojans, ransomware, spyware, rootkits, and fileless malware',
          'Malware commonly reaches endpoints through phishing emails, malicious websites, infected USB devices, and unpatched software',
          'Modern threats increasingly rely on stealth techniques to avoid traditional antivirus detection',
          'Layered endpoint security and user awareness are essential for preventing malware infections',
        ],
      ),
      LessonSection(
        heading: 'Review Questions',
        bullets: [
          'What is malware, and what are its primary objectives?',
          'How does a worm differ from a virus?',
          'Why is ransomware considered one of the most dangerous forms of malware?',
          'What makes fileless malware difficult to detect?',
          'List four best practices that help prevent malware infections',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Antivirus, EPP, EDR & XDR',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'From Simple Signatures to Sophisticated Detection',
        body:
            'Traditional antivirus software was once sufficient to '
            'protect computers from common malware. It relied primarily '
            'on identifying known malware using signatures and worked '
            'well when cyber threats were relatively simple. Today, '
            'however, attackers use advanced techniques such as '
            'ransomware, fileless malware, zero-day exploits, and '
            'living-off-the-land attacks. These threats often bypass '
            'traditional antivirus solutions, making modern endpoint '
            'security much more sophisticated.',
      ),
      LessonSection(
        heading: 'Four Complementary Technologies',
        body:
            'To address these evolving threats, organizations now use '
            'multiple technologies, including Antivirus (AV), Endpoint '
            'Protection Platform (EPP), Endpoint Detection and Response '
            '(EDR), and Extended Detection and Response (XDR). '
            'Together, these solutions provide prevention, detection, '
            'investigation, and response capabilities.',
      ),
      LessonSection(
        heading: 'Antivirus (AV)',
        body:
            'Antivirus software is designed to detect, block, and '
            'remove malicious software from endpoint devices. It '
            'primarily identifies malware by comparing files against a '
            'database of known malware signatures. Many modern '
            'antivirus solutions also use heuristic and behavioral '
            'analysis to detect suspicious activities.',
        bullets: ['Malware scanning', 'Virus removal', 'Real-time protection', 'Scheduled scans', 'Quarantine of infected files'],
      ),
      LessonSection(
        heading: 'Endpoint Protection Platform (EPP)',
        body:
            'An Endpoint Protection Platform (EPP) expands upon '
            'traditional antivirus by providing multiple preventive '
            'security capabilities within a single solution. The '
            'primary goal of EPP is to prevent threats before they '
            'compromise an endpoint. Most modern enterprises deploy an '
            'EPP solution on every managed device.',
      ),
      LessonSection(
        heading: 'Endpoint Detection and Response (EDR)',
        body:
            'While EPP focuses on prevention, Endpoint Detection and '
            'Response (EDR) focuses on detecting and responding to '
            'threats that bypass preventive controls. EDR continuously '
            'monitors endpoint activity and records events such as '
            'process execution, file modifications, registry changes, '
            'network connections, and user logins.',
        bullets: [
          'Generate alerts',
          'Investigate attack activity',
          'Isolate compromised devices',
          'Terminate malicious processes',
          'Support incident response',
        ],
      ),
      LessonSection(
        heading: 'Why EDR Catches What Antivirus Misses',
        body:
            'Unlike traditional antivirus, EDR relies heavily on '
            'behavioral analysis, making it effective against advanced '
            'and fileless attacks.',
      ),
      LessonSection(
        heading: 'Extended Detection and Response (XDR)',
        body:
            'As organizations deploy multiple security tools, '
            'investigating incidents across different systems can '
            'become difficult. Extended Detection and Response (XDR) '
            'provides centralized threat detection by collecting and '
            'correlating data from multiple security sources.',
        bullets: [
          'Endpoint security (EDR)',
          'Email security',
          'Firewalls',
          'Identity providers',
          'Cloud applications',
          'Network security tools',
          'Security Information and Event Management (SIEM)',
        ],
      ),
      LessonSection(
        heading: 'Antivirus vs. EPP vs. EDR vs. XDR',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Technology', 'Primary Focus', 'Key Capability'],
          tableRows: [
            ['Antivirus', 'Detect known malware', 'Signature-based protection'],
            ['EPP', 'Prevent endpoint threats', 'Multiple preventive controls'],
            ['EDR', 'Detect and respond', 'Continuous monitoring and investigation'],
            ['XDR', 'Correlate enterprise-wide threats', 'Unified detection across multiple security tools'],
          ],
        ),
      ),
      LessonSection(
        body:
            'A mature security program typically uses EPP and EDR '
            'together, with XDR providing broader visibility across the '
            'enterprise.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A financial organization deploys Microsoft Defender for '
            'Endpoint across all employee devices. During routine '
            'monitoring, an employee unknowingly downloads a malicious '
            'file. The EPP scans the file before execution; the malware '
            'bypasses the initial prevention controls; the EDR detects '
            'unusual PowerShell activity and identifies it as '
            'suspicious; the affected laptop is automatically isolated '
            'from the network; security analysts investigate the '
            'incident using the EDR console; and related alerts from '
            'email security and identity systems are correlated by the '
            'XDR platform, revealing that the attack originated from a '
            'phishing email. The security team removes the malware, '
            'restores the device, and blocks similar phishing emails '
            'from reaching other employees.',
      ),
      LessonSection(
        heading: 'Benefits of Modern Endpoint Protection',
        bullets: [
          'Preventing malware infections',
          'Detecting advanced threats',
          'Responding quickly to security incidents',
          'Reducing attacker dwell time',
          'Improving visibility across endpoint devices',
          'Supporting regulatory compliance',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'No single security solution can stop every attack. '
            'Organizations should combine EPP, EDR, email security, '
            'identity protection, and user awareness training to build '
            'a strong defense against modern cyber threats.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Deploy endpoint protection on every managed device',
          'Keep security signatures and detection engines updated',
          'Enable real-time protection',
          'Monitor EDR alerts continuously',
          'Integrate endpoint protection with SIEM or XDR platforms',
          'Regularly review and tune detection policies to reduce false positives',
        ],
      ),
      LessonSection(
        heading: 'Key Takeaways',
        bullets: [
          'Antivirus provides basic protection against known malware',
          'EPP extends antivirus with additional preventive security controls',
          'EDR continuously monitors endpoint activity and helps investigate advanced threats',
          'XDR correlates security events across multiple technologies to improve threat detection',
          'Combining these technologies provides stronger protection than relying on any single solution',
        ],
      ),
      LessonSection(
        heading: 'Review Questions',
        bullets: [
          'What are the primary functions of antivirus software?',
          'How does an Endpoint Protection Platform (EPP) differ from traditional antivirus?',
          'Why is Endpoint Detection and Response (EDR) effective against fileless malware?',
          'What is the primary advantage of Extended Detection and Response (XDR)?',
          'Why should organizations integrate endpoint protection with SIEM or XDR platforms?',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Endpoint Management Fundamentals',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Managing Thousands of Devices at Once',
        body:
            'Modern organizations often manage thousands of desktops, '
            'laptops, mobile devices, virtual machines, and '
            'corporate-owned smartphones spread across multiple offices, '
            'remote locations, and cloud environments. Ensuring that '
            'each endpoint remains secure, compliant, and properly '
            'configured is a significant challenge — manual '
            'administration is no longer practical due to the scale and '
            'complexity of today\'s enterprise environments.',
      ),
      LessonSection(
        heading: 'What Is Endpoint Management?',
        body:
            'Endpoint management is the process of centrally '
            'administering, securing, monitoring, and maintaining '
            'endpoint devices throughout their lifecycle. It enables IT '
            'and security teams to deploy operating systems, install '
            'applications, configure security settings, enforce '
            'compliance policies, distribute updates, monitor device '
            'health, and remotely troubleshoot issues without requiring '
            'physical access to the device.',
      ),
      LessonSection(
        heading: 'From On-Premises Tools to the Cloud',
        body:
            'Modern endpoint management platforms have evolved from '
            'traditional on-premises management systems to cloud-based '
            'solutions that support hybrid workforces and diverse '
            'device ecosystems. Organizations now manage Windows, '
            'macOS, Linux, Android, and iOS devices from centralized '
            'management consoles while applying consistent security '
            'policies across the enterprise.',
      ),
      LessonSection(
        heading: 'Why Endpoint Management Is Important',
        body:
            'Every endpoint connected to an enterprise network '
            'represents a potential entry point for cyber attackers. An '
            'unpatched laptop, an unmanaged smartphone, or a '
            'misconfigured workstation can become the initial foothold '
            'for ransomware, malware, or credential theft.',
        bullets: [
          'Maintain a complete inventory of enterprise devices',
          'Deploy standardized security configurations',
          'Enforce compliance with organizational policies',
          'Automate software deployment and updates',
          'Monitor endpoint health',
          'Support remote users',
          'Reduce operational costs through centralized administration',
        ],
      ),
      LessonSection(
        heading: 'Endpoint Lifecycle Management',
        body:
            'Endpoint management extends throughout the entire '
            'lifecycle of a device, from the time it is procured until '
            'it is securely retired: procurement, enrollment, '
            'configuration, application deployment, security policy '
            'enforcement, monitoring, patch management, compliance '
            'verification, and retirement or secure disposal.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/endpoint_lifecycle.jpg',
          caption: 'Endpoint management encompasses the entire lifecycle of a device, beginning with procurement and continuing through configuration, monitoring, maintenance, and secure retirement.',
        ),
      ),
      LessonSection(
        heading: 'Device Enrollment',
        body:
            'Before a device can be managed, it must be enrolled into '
            'the organization\'s management platform. Enrollment '
            'establishes trust between the endpoint and the management '
            'system while enabling administrators to apply security '
            'policies and deploy software remotely.',
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
        heading: 'Configuration Management',
        body:
            'Configuration management ensures that all enterprise '
            'devices follow standardized security and operational '
            'settings — password requirements, screen lock settings, '
            'BitLocker or FileVault encryption, firewall configuration, '
            'Microsoft Defender settings, Wi-Fi profiles, VPN '
            'configuration, browser security settings, and certificate '
            'deployment. Consistent configurations reduce security '
            'vulnerabilities and simplify endpoint administration.',
      ),
      LessonSection(
        heading: 'Software Deployment',
        body:
            'Enterprise management platforms allow administrators to '
            'remotely deploy business applications, productivity '
            'software, security agents, VPN clients, collaboration '
            'tools, and browser extensions without requiring user '
            'intervention. Organizations typically use application '
            'groups and deployment rings to minimize operational '
            'disruption during large-scale software rollouts.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/management_platforms.jpg',
          caption: 'Modern endpoint management platforms provide centralized administration of multiple operating systems and device types from a single management console.',
        ),
      ),
      LessonSection(
        heading: 'Modern Endpoint Management Platforms',
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
        heading: 'Microsoft Intune',
        body:
            'Microsoft Intune is a cloud-based endpoint management '
            'solution that enables organizations to manage Windows, '
            'macOS, Android, iOS, and Linux devices from the Microsoft '
            'Intune admin center. It integrates with Microsoft Entra '
            'ID, Microsoft Defender for Endpoint, Microsoft Purview, '
            'Windows Autopilot, Microsoft 365, and Conditional Access — '
            'providing device enrollment, compliance policies, '
            'configuration profiles, application deployment, remote '
            'actions, device inventory, endpoint security policies, and '
            'patch management. Because Intune is cloud-native, '
            'administrators can manage devices regardless of physical '
            'location, making it well suited for remote and hybrid '
            'workforces.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global consulting company supports more than 8,000 '
            'employees working from offices and remote locations across '
            'multiple countries. All newly purchased Windows laptops '
            'are shipped directly to employees and automatically '
            'enrolled using Windows Autopilot. During initial setup, '
            'Microsoft Intune applies configuration profiles, enables '
            'BitLocker encryption, installs Microsoft Defender for '
            'Endpoint, deploys Microsoft 365 applications, configures '
            'VPN settings, and registers the devices with Microsoft '
            'Entra ID. Compliance policies verify current security '
            'updates, active endpoint protection, and full disk '
            'encryption before users are granted access to corporate '
            'resources — if a device becomes non-compliant, Conditional '
            'Access automatically restricts access until the issue is '
            'resolved.',
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
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Centralized endpoint management significantly reduces '
            'administrative overhead while improving security. '
            'Automated enrollment, standardized configurations, and '
            'continuous compliance monitoring help ensure that every '
            'managed device adheres to the organization\'s security '
            'requirements.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Device Compliance & Conditional Access',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Enrolled Doesn\'t Mean Secure',
        body:
            'A device that has been successfully enrolled into an '
            'endpoint management platform is not automatically '
            'considered secure. Over time, security configurations may '
            'change, software may become outdated, antivirus protection '
            'may be disabled, or encryption may be removed.',
      ),
      LessonSection(
        heading: 'Device Compliance Management',
        body:
            'Device compliance management is the continuous process of '
            'verifying that managed devices satisfy the organization\'s '
            'predefined security requirements. Compliance policies '
            'automatically evaluate each endpoint and determine whether '
            'it is trusted to access corporate resources — rather than '
            'relying on manual inspections, endpoint management '
            'platforms evaluate compliance continuously and report the '
            'status of each device in near real time.',
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
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/device_compliance.jpg',
          caption: 'Endpoint management platforms continuously evaluate managed devices against organizational compliance policies before granting access to corporate resources.',
        ),
      ),
      LessonSection(
        heading: 'Compliance Policies',
        body:
            'Compliance policies define the security standards that '
            'enterprise devices must satisfy before accessing '
            'organizational applications and data, helping ensure every '
            'managed endpoint maintains a consistent security posture '
            'regardless of operating system or location — for example: '
            'Windows devices must run a supported OS version, BitLocker '
            'must be enabled, Defender Antivirus must be active, '
            'firewall protection must remain enabled, devices must not '
            'be rooted or jailbroken, and security updates must be '
            'installed within a specified timeframe.',
      ),
      LessonSection(
        heading: 'Conditional Access Integration',
        body:
            'Device compliance becomes significantly more powerful when '
            'integrated with identity and access management. Solutions '
            'such as Microsoft Entra ID and Microsoft Intune work '
            'together to enforce Conditional Access policies — instead '
            'of simply verifying a user\'s identity, Conditional Access '
            'also evaluates the security posture of the device '
            'attempting to access organizational resources. For '
            'example, a user may successfully authenticate with MFA, '
            'but if the device is non-compliant because disk encryption '
            'has been disabled, access to Microsoft 365 or SharePoint '
            'can be automatically blocked until compliance is restored '
            '— supporting a Zero Trust security model by continuously '
            'verifying both user identity and device health.',
      ),
      LessonSection(
        heading: 'Device Inventory Management',
        body:
            'A centralized inventory enables administrators to answer '
            'questions such as how many devices are managed, which '
            'operating systems are deployed, which devices require '
            'updates, which devices have not checked in recently, which '
            'users are assigned to specific devices, and which devices '
            'have reached end-of-life.',
        bullets: [
          'Device name and serial number',
          'Assigned user',
          'Operating system version',
          'Hardware specifications and installed applications',
          'Compliance and encryption status',
          'Last check-in time',
          'Device ownership (Corporate or Personal)',
        ],
      ),
      LessonSection(
        heading: 'Remote Administration',
        body:
            'IT administrators require the ability to manage devices '
            'without physical access — remote lock, remote restart, '
            'remote wipe, password reset, sync policies, application '
            'installation and removal, device retirement, certificate '
            'deployment, and configuration updates. For example, if an '
            'employee reports a lost corporate laptop, administrators '
            'can immediately issue a remote wipe command to remove '
            'sensitive organizational data before unauthorized '
            'individuals gain access.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/remote_administration.jpg',
          caption: 'Endpoint management platforms provide administrators with centralized remote management capabilities that improve operational efficiency while maintaining organizational security.',
        ),
      ),
      LessonSection(
        heading: 'Endpoint Analytics',
        body:
            'Modern endpoint management platforms collect operational '
            'telemetry that helps administrators understand device '
            'performance and user experience — identifying slow device '
            'startup times, application crashes, login performance '
            'issues, low disk space, battery health, and hardware '
            'reliability. For example, if analytics identify that a '
            'recent application update significantly increases boot '
            'time across hundreds of laptops, administrators can '
            'quickly investigate and deploy corrective actions.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational engineering company manages more than '
            '15,000 Windows, macOS, Android, and iOS devices using '
            'Microsoft Intune. Each enrolled device is evaluated '
            'against compliance policies requiring BitLocker or '
            'FileVault encryption, active endpoint protection, current '
            'security updates, and Secure Boot. Devices that fail '
            'compliance checks are automatically marked non-compliant '
            'and denied access through Conditional Access. When an '
            'employee reports a lost corporate tablet during '
            'international travel, the IT team immediately performs a '
            'remote wipe, removing sensitive engineering documents and '
            'corporate credentials. Endpoint analytics later reveal '
            'that a recently deployed application update is causing '
            'unusually slow login times — administrators identify and '
            'resolve the issue through centralized reporting.',
      ),
      LessonSection(
        heading: 'Comparison of Enterprise Endpoint Management Functions',
      ),
      LessonSection(
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
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Define compliance policies based on organizational security requirements',
          'Continuously monitor device compliance',
          'Integrate compliance evaluation with Conditional Access',
          'Maintain an accurate and up-to-date device inventory',
          'Automate remote administrative actions where appropriate',
          'Use endpoint analytics to proactively identify performance issues',
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
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Patch Management Fundamentals',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Attackers Race to Exploit Known Weaknesses',
        body:
            'Cybercriminals continuously search for weaknesses in '
            'operating systems, applications, firmware, and network '
            'devices. Software vulnerabilities are discovered almost '
            'daily, and attackers often attempt to exploit them before '
            'organizations have an opportunity to apply security '
            'updates. Maintaining secure and up-to-date systems has '
            'become one of the most critical responsibilities of '
            'enterprise IT and cybersecurity teams.',
      ),
      LessonSection(
        heading: 'What Is Patch Management?',
        body:
            'Patch management is the systematic process of acquiring, '
            'testing, deploying, and verifying software updates to '
            'correct security vulnerabilities, fix software defects, '
            'improve system stability, and introduce new functionality. '
            'Vulnerability management focuses on identifying, '
            'assessing, and prioritizing security weaknesses, while '
            'patch management implements software updates or other '
            'remediation measures to eliminate those weaknesses — '
            'together, these processes form a fundamental component of '
            'an organization\'s cybersecurity strategy.',
      ),
      LessonSection(
        heading: 'Why Patch Management Is Important',
        body:
            'Most successful cyberattacks exploit vulnerabilities that '
            'are already publicly known and for which security patches '
            'have been available for weeks or even months. Attackers '
            'actively scan the Internet looking for systems that have '
            'not been updated. Several major cybersecurity incidents, '
            'including ransomware outbreaks and large-scale data '
            'breaches, have been linked to organizations delaying '
            'critical security updates.',
        bullets: [
          'Eliminate known software vulnerabilities',
          'Reduce the attack surface',
          'Improve operating system stability',
          'Maintain regulatory compliance',
          'Protect sensitive business data',
          'Reduce the likelihood of malware infections',
        ],
      ),
      LessonSection(
        heading: 'Types of Software Patches',
        bullets: [
          'Security Patches — correct vulnerabilities that could be exploited by attackers; generally the highest priority',
          'Bug Fixes — correct software defects affecting functionality or reliability without necessarily addressing security',
          'Feature Updates — introduce new capabilities; generally lower deployment priority than security patches',
          'Firmware Updates — apply to hardware devices such as routers, switches, servers, and TPMs',
          'Driver Updates — correct or improve hardware device drivers',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Insight',
        body:
            'Software vendors release different types of patches to '
            'improve security, reliability, compatibility, and '
            'functionality. Security patches typically receive the '
            'highest deployment priority because they address known '
            'vulnerabilities.',
      ),
      LessonSection(
        heading: 'The Patch Management Lifecycle',
        body:
            'Successful patch management follows a structured lifecycle '
            'rather than simply installing updates whenever they become '
            'available: vulnerability identification, patch '
            'availability review, risk assessment, patch testing, '
            'approval, deployment, verification, documentation, and '
            'continuous monitoring.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/patch_management_lifecycle.jpg',
          caption: 'Enterprise patch management follows a structured lifecycle that balances rapid vulnerability remediation with operational stability and change management requirements.',
        ),
      ),
      LessonSection(
        heading: 'Vulnerability Identification',
        body:
            'Organizations use vulnerability scanners and security '
            'assessment tools to discover missing patches and security '
            'weaknesses — Microsoft Defender Vulnerability Management, '
            'Qualys VMDR, Tenable Nessus, Rapid7 InsightVM, OpenVAS, and '
            'CrowdStrike Falcon Exposure Management. For each '
            'identified vulnerability, the scanner typically provides a '
            'CVE identifier, CVSS severity score, affected software, '
            'available remediation, patch availability, and exploit '
            'status.',
      ),
      LessonSection(
        heading: 'Risk Assessment',
        body:
            'Not every vulnerability requires immediate remediation. '
            'Organizations evaluate CVSS severity score, availability '
            'of public exploits, active exploitation in the wild, '
            'business criticality, Internet exposure, and regulatory '
            'requirements before deploying updates. For example, a '
            'critical vulnerability affecting an Internet-facing domain '
            'controller may require immediate emergency patching, '
            'whereas a low-severity vulnerability on an isolated '
            'laboratory workstation may be addressed during the next '
            'scheduled maintenance window.',
      ),
      LessonSection(
        heading: 'Patch Testing',
        body:
            'Applying patches directly to production systems without '
            'testing can introduce unexpected compatibility problems or '
            'service interruptions. Organizations validate updates in '
            'controlled testing environments first, checking operating '
            'system and application compatibility, performance, '
            'authentication, network connectivity, and business '
            'application functionality before enterprise-wide '
            'deployment.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational pharmaceutical company manages '
            'approximately 12,000 Windows workstations and 2,000 '
            'Windows and Linux servers. Weekly vulnerability scans '
            'identify a newly disclosed critical vulnerability affecting '
            'Microsoft Windows. Microsoft releases a corresponding '
            'security update on Patch Tuesday. The vulnerability '
            'management team reviews the CVSS score, confirms active '
            'exploitation, and classifies it as Critical. The update is '
            'first deployed to a test environment containing '
            'representative systems, then approved through change '
            'management and gradually deployed using Microsoft Intune '
            'and Microsoft Configuration Manager. Post-deployment '
            'compliance reports confirm 99.6% of managed endpoints '
            'successfully installed the update within 48 hours.',
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
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'How, When, and to Whom',
        body:
            'Simply installing updates is not enough. Organizations '
            'must determine how, when, and to whom patches should be '
            'deployed while balancing security, business continuity, '
            'and operational stability. Large enterprises rarely deploy '
            'updates simultaneously to every endpoint — instead, they '
            'use carefully planned deployment strategies, testing '
            'groups, phased rollouts, and emergency response procedures '
            'to minimize operational risks while ensuring critical '
            'vulnerabilities are remediated quickly.',
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
        heading: 'Pilot Deployment',
        body:
            'A pilot deployment involves installing updates on a small '
            'group of representative devices before broader deployment '
            '— devices selected from different departments, hardware '
            'models, and software configurations to identify '
            'compatibility issues early. If no significant issues are '
            'identified, the update proceeds to the next deployment '
            'stage.',
      ),
      LessonSection(
        heading: 'Ring-Based Deployment',
        body:
            'Many organizations use deployment rings to gradually '
            'distribute updates across the enterprise rather than '
            'updating every endpoint simultaneously.',
        bullets: [
          'Ring 0 — IT Administrators: updates first installed on devices used by IT and endpoint management teams',
          'Ring 1 — Pilot Users: a small number of technically proficient users receive updates for real-world validation',
          'Ring 2 — Business Departments: updates expanded to selected departments representing normal business operations',
          'Ring 3 — Enterprise Deployment: once testing is complete, updates are deployed across all remaining managed devices',
        ],
      ),
      LessonSection(
        heading: 'Department-Based and Risk-Based Deployment',
        body:
            'Department-based deployment rolls out updates according to '
            'business functions (IT, Finance, HR, Engineering, Sales), '
            'with mission-critical workloads receiving updates during '
            'carefully scheduled maintenance windows. Risk-based '
            'deployment prioritizes systems based on business impact and '
            'vulnerability severity — Internet-facing servers, domain '
            'controllers, email servers, VPN gateways, and identity '
            'services typically receive updates first, while lower-risk '
            'systems are updated during regularly scheduled maintenance '
            'cycles.',
      ),
      LessonSection(
        heading: 'Microsoft Patch Tuesday',
        body:
            'Microsoft follows a predictable monthly security update '
            'schedule commonly known as Patch Tuesday, occurring on the '
            'second Tuesday of each month, covering Windows, Microsoft '
            'Office, Exchange, SQL Server, Edge, Defender, Hyper-V, and '
            'Azure Stack HCI. The predictable schedule allows '
            'organizations to prepare testing environments and '
            'coordinate deployments. Microsoft may also release '
            'out-of-band updates for critical security issues requiring '
            'immediate attention.',
      ),
      LessonSection(
        heading: 'Zero-Day Vulnerabilities',
        body:
            'A zero-day vulnerability is a software flaw that becomes '
            'known before a security patch is available. Because '
            'attackers may exploit these vulnerabilities before vendors '
            'release fixes, they represent one of the highest '
            'cybersecurity risks. Organizations mitigate zero-day risks '
            'using compensating controls until official patches become '
            'available — disabling vulnerable services, blocking '
            'malicious traffic with firewalls, applying IPS signatures, '
            'restricting application execution, network segmentation, '
            'and enhanced EDR monitoring. Once the vendor releases a '
            'patch, organizations begin emergency testing followed by '
            'accelerated deployment.',
      ),
      LessonSection(
        heading: 'Emergency Patching',
        body:
            'Some vulnerabilities require immediate remediation due to '
            'active exploitation or severe business risk — active '
            'attacks observed, public exploit code available, critical '
            'infrastructure affected, or regulatory requirements '
            'demanding immediate action. Unlike routine maintenance '
            'windows, emergency patching follows an expedited approval '
            'process, though organizations should still perform basic '
            'compatibility validation whenever possible.',
      ),
      LessonSection(
        heading: 'Patch Rollback and Verification',
        body:
            'Despite careful testing, software updates occasionally '
            'introduce unexpected problems. Organizations establish '
            'rollback procedures before deploying updates, including '
            'system backups, virtual machine snapshots, restore points, '
            'and configuration backups. After deployment, organizations '
            'verify successful installation status, device restart '
            'completion, updated software version, vulnerability '
            'remediation, and compliance status — endpoint management '
            'platforms such as Microsoft Intune and Microsoft '
            'Configuration Manager provide compliance reports that help '
            'verify deployment success across the organization.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global financial institution receives intelligence '
            'indicating active exploitation of a critical vulnerability '
            'affecting VPN gateways used for remote access by employees '
            'worldwide. The security team immediately implements '
            'temporary firewall rules and IPS signatures while the '
            'infrastructure team validates the vendor\'s emergency patch '
            'in a testing environment. Following successful testing, '
            'the update is deployed first to redundant VPN appliances '
            'in a pilot data center before being rolled out to all '
            'production gateways. Post-deployment vulnerability scans '
            'confirm successful remediation, with all affected systems '
            'updated within 24 hours of the vendor\'s release.',
      ),
      LessonSection(
        heading: 'Comparison of Patch Deployment Strategies',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Deployment Strategy', 'Typical Use Case', 'Advantages', 'Limitations'],
          tableRows: [
            ['Pilot Deployment', 'Initial validation', 'Identifies compatibility issues early', 'Limited test coverage'],
            ['Ring-Based Deployment', 'Large enterprises', 'Controlled, phased rollout', 'Longer deployment timeline'],
            ['Department-Based', 'Business-specific scheduling', 'Minimizes operational disruption', 'Requires careful coordination'],
            ['Risk-Based Deployment', 'Critical assets', 'Prioritizes highest-risk systems', 'Requires accurate asset classification'],
            ['Emergency Deployment', 'Actively exploited vulnerabilities', 'Rapid risk reduction', 'Limited testing time'],
          ],
        ),
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
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Rapid deployment is important, but uncontrolled deployment '
            'can introduce business disruptions. Organizations should '
            'balance speed with appropriate testing, phased rollouts, '
            'and verification to maintain both security and operational '
            'stability.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Vulnerability Management',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Which Vulnerabilities Actually Need Attention',
        body:
            'While patch management focuses on deploying software '
            'updates, organizations must first determine which '
            'vulnerabilities require attention and in what order. '
            'Enterprise environments often contain thousands of assets '
            'and tens of thousands of identified vulnerabilities — '
            'treating every vulnerability as equally important is '
            'neither practical nor efficient.',
      ),
      LessonSection(
        heading: 'What Is Vulnerability Management?',
        body:
            'Vulnerability management provides a structured approach '
            'for identifying, assessing, prioritizing, remediating, and '
            'continuously monitoring security weaknesses across an '
            'organization\'s technology environment. It enables '
            'security teams to focus resources on vulnerabilities that '
            'pose the greatest risk to business operations. Modern '
            'vulnerability management is a continuous process rather '
            'than a one-time activity — new systems are deployed, '
            'software is updated, and new vulnerabilities are disclosed '
            'every day.',
      ),
      LessonSection(
        heading: 'Understanding Vulnerabilities',
        body:
            'A vulnerability is a weakness in software, hardware, '
            'firmware, or system configuration that can potentially be '
            'exploited by a threat actor to compromise confidentiality, '
            'integrity, or availability.',
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
        heading: 'The Vulnerability Management Lifecycle',
        body:
            'An effective vulnerability management program follows a '
            'continuous lifecycle that combines automated scanning with '
            'risk-based decision-making: asset discovery, vulnerability '
            'identification, risk assessment, prioritization, '
            'remediation, verification, reporting, and continuous '
            'monitoring.',
      ),
      LessonSection(
        heading: 'Asset Discovery',
        body:
            'The first step in vulnerability management is identifying '
            'all assets that require protection — workstations, '
            'servers, virtual machines, mobile devices, cloud '
            'workloads, network devices, Internet-facing systems, and '
            'applications. Without an accurate asset inventory, '
            'security teams cannot determine which systems should be '
            'scanned or protected.',
      ),
      LessonSection(
        heading: 'Vulnerability Identification',
        body:
            'Once assets have been identified, automated vulnerability '
            'scanners evaluate systems for missing security patches, '
            'unsupported software, weak cryptographic configurations, '
            'default passwords, open network ports, misconfigured '
            'services, outdated firmware, and insecure protocols — '
            'comparing discovered software versions against '
            'continuously updated vulnerability databases.',
      ),
      LessonSection(
        heading: 'Common Vulnerability Scoring System (CVSS)',
        body:
            'CVSS provides a standardized numerical score ranging from '
            '0.0 to 10.0, based on attack complexity, required '
            'privileges, user interaction, and confidentiality/'
            'integrity/availability impact. Higher scores indicate '
            'greater potential risk.',
      ),
      LessonSection(
        heading: 'CVSS Severity Ratings',
      ),
      LessonSection(
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
            'The CVE program provides a standardized naming convention '
            'for publicly disclosed security vulnerabilities. Each '
            'vulnerability receives a unique identifier (such as '
            'CVE-2024-21413), with an entry typically including a '
            'description, affected products, references, severity '
            'information, and vendor advisories — allowing '
            'organizations, vendors, and researchers to discuss '
            'vulnerabilities consistently.',
      ),
      LessonSection(
        heading: 'Vulnerability Prioritization',
        body:
            'Although CVSS provides a useful severity score, '
            'organizations should also consider business context — '
            'Internet exposure, availability of public exploits, active '
            'exploitation, business criticality, regulatory '
            'requirements, asset value, data sensitivity, and existing '
            'compensating controls. For example, a High-severity '
            'vulnerability affecting an Internet-facing identity server '
            'may require more urgent attention than a Critical '
            'vulnerability affecting an isolated laboratory system.',
      ),
      LessonSection(
        heading: 'Remediation vs. Mitigation',
        body:
            'The preferred response to a vulnerability is remediation, '
            'which completely removes the weakness — installing '
            'security patches, upgrading software, replacing '
            'unsupported systems, correcting insecure configurations. '
            'However, immediate remediation is not always possible. In '
            'such cases, organizations implement mitigation, which '
            'reduces the likelihood or impact of exploitation until '
            'permanent remediation becomes available — firewall rules, '
            'network segmentation, disabling vulnerable services, MFA, '
            'application allowlisting, or IPS signatures. Mitigation '
            'reduces risk but does not eliminate the underlying '
            'vulnerability.',
      ),
      LessonSection(
        heading: 'Vulnerability Reporting and Dashboards',
        body:
            'Enterprise vulnerability management platforms provide '
            'dashboards summarizing the organization\'s security posture '
            '— total vulnerabilities, critical vulnerabilities, '
            'high-risk assets, patch compliance, Mean Time to Remediate '
            '(MTTR), remediation progress, and risk distribution by '
            'business unit — helping security leaders monitor '
            'remediation and communicate organizational risk to '
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
            'vulnerability management team prioritizes findings based '
            'on CVSS scores, business criticality, and active threat '
            'intelligence. Critical vulnerabilities affecting '
            'Internet-facing patient portals and identity infrastructure '
            'are remediated within 24 hours. Medium-risk vulnerabilities '
            'on internal laboratory workstations are scheduled during '
            'the next maintenance window. Executive dashboards provide '
            'continuous visibility into remediation progress against '
            'organizational service-level objectives.',
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

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Endpoint Logging Fundamentals',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Every Action Leaves a Digital Record',
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
        heading: 'What Is Endpoint Logging?',
        body:
            'Endpoint logging is the process of recording events '
            'generated by operating systems, applications, and security '
            'software running on endpoint devices. These logs enable '
            'administrators and security analysts to monitor system '
            'health, detect suspicious behavior, investigate security '
            'incidents, and meet regulatory compliance requirements. '
            'Endpoint logging is also a critical component of SIEM '
            'platforms, EDR solutions, and Security Operations Centers, '
            'where logs from thousands of devices are centralized and '
            'analyzed to identify enterprise-wide threats.',
      ),
      LessonSection(
        heading: 'Why Endpoint Logging Is Important',
        body:
            'Without comprehensive logging, organizations may struggle '
            'to determine who accessed a system, when an incident '
            'occurred, which files were modified, what processes '
            'executed, whether malware was executed, how attackers '
            'gained access, and what actions were performed after '
            'compromise. Endpoint logs provide the evidence needed to '
            'reconstruct security incidents and support forensic '
            'investigations. For many regulatory frameworks, including '
            'PCI DSS, HIPAA, ISO/IEC 27001, and the NIST Cybersecurity '
            'Framework, maintaining appropriate audit logs is also a '
            'compliance requirement.',
      ),
      LessonSection(
        heading: 'Understanding Endpoint Logs',
        body:
            'An endpoint log is a chronological record of events '
            'generated by an operating system, application, or security '
            'component — typically containing date and time, event '
            'identifier, user account, computer name, process name, '
            'event severity, source application, and event description. '
            'Because every recorded event is timestamped, analysts can '
            'reconstruct the sequence of activities that occurred '
            'before, during, and after a security incident. '
            'Individually, events may appear harmless — a login, Word '
            'launching, PowerShell executing — but analyzed together, '
            'they can reveal the progression of an attack.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/endpoint_logging_overview.jpg',
          caption: 'Enterprise endpoint logging collects security events from multiple operating systems and forwards them to centralized logging platforms and SIEM solutions for analysis and incident detection.',
        ),
      ),
      LessonSection(
        heading: 'Types of Endpoint Logs',
        bullets: [
          'Authentication Logs — successful/failed logins, account lockouts, password changes, MFA events; valuable for detecting brute-force attacks and credential theft',
          'Security Logs — security policy changes, privilege escalation, user rights assignments, account creation/deletion; often central to forensic investigations',
          'Application Logs — application startup, crashes, configuration changes, database connections; help troubleshoot abnormal application behavior',
          'System Logs — device startup/shutdown, driver failures, hardware errors, service failures; assist diagnosing hardware and software problems',
        ],
      ),
      LessonSection(
        heading: 'Windows Event Log Categories',
        body:
            'Microsoft Windows records operating system activities '
            'through the Windows Event Log service, organizing events '
            'into several primary categories.',
        bullets: [
          'Application Log — events from installed applications and software components',
          'Security Log — security-related audited events (authentication, failed logins, account lockouts); among the most important sources for investigations',
          'System Log — operating system and hardware events (driver loading, device failures, service initialization)',
          'Setup Log — operating system installation activities and Windows Update operations',
          'Forwarded Events — events forwarded from other systems using Windows Event Forwarding (WEF), commonly used to centralize log collection before forwarding to SIEM platforms',
        ],
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/windows_event_log_categories.jpg',
          caption: 'Windows organizes operating system events into multiple log categories that support troubleshooting, auditing, and security investigations.',
        ),
      ),
      LessonSection(
        heading: 'Linux Syslog',
        body:
            'Linux systems commonly use the Syslog framework to record '
            'operating system and application events from services, '
            'applications, authentication systems, network services, '
            'and security tools. Common log files include '
            '/var/log/syslog, /var/log/messages, /var/log/auth.log, '
            '/var/log/secure, and /var/log/kern.log — used to '
            'investigate authentication failures, service interruptions, '
            'and unauthorized administrative activities.',
      ),
      LessonSection(
        heading: 'macOS Unified Logging',
        body:
            'Apple macOS uses the Unified Logging System, which '
            'centralizes logging across the operating system and '
            'applications, recording system events, application events, '
            'security events, performance information, and diagnostic '
            'messages. Enterprise administrators can analyze these logs '
            'using built-in macOS tools or forward them to centralized '
            'monitoring platforms.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational insurance company centrally collects '
            'endpoint logs from more than 20,000 Windows workstations, '
            'Linux servers, and macOS laptops. During routine '
            'monitoring, the SIEM identifies multiple failed '
            'authentication attempts against a senior executive\'s '
            'Windows laptop, followed by a successful login from an '
            'unusual location. Shortly afterward, Windows Security logs '
            'record the creation of a new administrative account, while '
            'endpoint protection logs detect PowerShell execution and '
            'attempts to disable antivirus software. Because all logs '
            'are centrally collected and correlated, the SOC quickly '
            'identifies the activity as a likely credential compromise '
            '— the affected device is isolated, the compromised account '
            'is disabled, and incident response procedures are '
            'initiated before attackers can access sensitive corporate '
            'data.',
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

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Endpoint Telemetry & Real-Time Monitoring',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Beyond Individual Log Events',
        body:
            'Endpoint telemetry refers to the continuous collection of '
            'operational and security-related data generated by '
            'endpoint devices. Instead of capturing only individual '
            'events, telemetry provides a broader picture of system '
            'behavior over time — process execution, network '
            'connections, logon/logoff events, file creation and '
            'modification, registry changes, scheduled task creation, '
            'service installation, USB device activity, and application '
            'launches.',
      ),
      LessonSection(
        heading: 'Why Telemetry Matters',
        body:
            'This data enables security platforms such as EDR and XDR '
            'to detect suspicious patterns that may indicate malicious '
            'activity. For example, while a single PowerShell execution '
            'may appear legitimate, telemetry showing PowerShell '
            'launching immediately after a suspicious email attachment '
            'is opened, followed by outbound network connections, may '
            'indicate malware execution.',
      ),
      LessonSection(
        heading: 'Real-Time Endpoint Monitoring',
        body:
            'Traditional security audits often relied on reviewing logs '
            'after an incident occurred. Modern cybersecurity requires '
            'organizations to detect threats as they happen. Real-time '
            'monitoring continuously observes endpoint activity and '
            'immediately notifies security teams when predefined '
            'conditions or suspicious behaviors are detected — multiple '
            'failed logon attempts, privilege escalation, execution of '
            'unsigned applications, antivirus being disabled, '
            'ransomware-like file encryption activity, and connections '
            'to known malicious IP addresses. Early detection enables '
            'security teams to isolate compromised systems before '
            'attackers can move laterally.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/endpoint_telemetry_collection.jpg',
          caption: 'Endpoint telemetry continuously captures system activities and forwards them through security agents to EDR and SIEM platforms for threat detection and analysis.',
        ),
      ),
      LessonSection(
        heading: 'File Integrity Monitoring (FIM)',
        body:
            'FIM continuously monitors critical files and directories '
            'for unauthorized modifications — operating system files, '
            'application executables, configuration files, security '
            'policies, registry hives, certificates, and scripts. '
            'Whenever a protected file is created, modified, deleted, '
            'renamed, or replaced, the monitoring system records the '
            'event and can generate an alert. FIM is particularly '
            'valuable for detecting ransomware, malware persistence, '
            'and unauthorized configuration changes — many compliance '
            'frameworks, including PCI DSS, recommend or require FIM '
            'for critical systems.',
      ),
      LessonSection(
        heading: 'Process Monitoring',
        body:
            'Process monitoring tracks the execution of applications '
            'and system processes to identify abnormal behavior — '
            'process creation and termination, parent-child process '
            'relationships, command-line arguments, process privileges, '
            'and memory injection attempts. Security analysts frequently '
            'examine process activity because many attacks rely on '
            'launching legitimate administrative tools such as '
            'PowerShell, WMI, PsExec, Rundll32, and Regsvr32. Monitoring '
            'process relationships helps detect Living off the Land '
            '(LotL) attacks, where adversaries abuse trusted system '
            'utilities to avoid detection.',
      ),
      LessonSection(
        heading: 'Registry Monitoring',
        body:
            'The Windows Registry stores configuration settings for the '
            'operating system, applications, and user profiles. '
            'Attackers frequently modify registry keys to establish '
            'persistence, disable security controls, execute malware '
            'automatically during startup, or hide malicious software. '
            'Registry monitoring detects changes to sensitive locations '
            '— run keys, startup entries, Windows Defender '
            'configuration, and service configurations.',
      ),
      LessonSection(
        heading: 'User Activity Monitoring',
        body:
            'Monitoring user activity helps organizations detect '
            'compromised accounts, insider threats, and policy '
            'violations — interactive logons, remote desktop sessions, '
            'administrative logins, failed authentication attempts, and '
            'group membership changes. User Behavior Analytics (UBA) '
            'can identify unusual patterns such as logins outside '
            'normal working hours, access from unexpected geographic '
            'locations, sudden increases in privileged activity, or '
            'simultaneous logins from multiple locations — anomalies '
            'that may indicate compromised credentials or malicious '
            'insider activity.',
      ),
      LessonSection(
        heading: 'Service and Scheduled Task Monitoring',
        body:
            'Attackers often create or modify services to establish '
            'persistence after compromising a system, and also abuse '
            'scheduled tasks to execute malicious code at predefined '
            'intervals or during startup. Monitoring records new '
            'service/task creation, deletion, configuration changes, '
            'and execution failures — security analysts often review '
            'scheduled tasks during forensic investigations because '
            'they are a common persistence mechanism used by malware.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/endpoint_monitoring_components.jpg',
          caption: 'Endpoint monitoring provides visibility into multiple system components, allowing security teams to detect suspicious behavior and investigate potential compromises.',
        ),
      ),
      LessonSection(
        heading: 'Common Endpoint Monitoring Events',
      ),
      LessonSection(
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
            'persistence-related keys. Because telemetry from multiple '
            'monitoring components is correlated in real time, the EDR '
            'platform classifies the activity as a likely malware '
            'infection — the affected device is automatically isolated '
            'from the corporate network, preventing the threat from '
            'spreading.',
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
          'Define alert thresholds to reduce false positives while maintaining effective threat detection',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'No single event typically confirms a cyberattack. '
            'Effective endpoint monitoring correlates multiple '
            'telemetry sources — such as process execution, registry '
            'changes, network connections, and user activity — to '
            'identify suspicious patterns and improve detection '
            'accuracy.',
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Microsoft Sysmon & SOC Investigation',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'What Is Microsoft Sysmon?',
        body:
            'Microsoft Sysmon (System Monitor) is a Windows system '
            'service developed as part of the Sysinternals Suite. It '
            'extends the native Windows Event Log by recording detailed '
            'information about system activities that are often '
            'essential during security investigations. Unlike '
            'traditional Windows logs, Sysmon provides enhanced '
            'visibility into process execution, network connections, '
            'driver loading, registry modifications, and file creation '
            'activities. Sysmon does not replace Windows Event Logs — '
            'it complements them by providing additional telemetry that '
            'improves threat detection and forensic analysis.',
      ),
      LessonSection(
        heading: 'Why Sysmon Is Important',
        body:
            'Modern cyberattacks frequently use legitimate Windows '
            'utilities such as PowerShell, Windows Management '
            'Instrumentation (WMI), and command-line tools to evade '
            'traditional antivirus solutions. Sysmon captures detailed '
            'information that helps analysts identify these techniques.',
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
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/sysmon_visibility.jpg',
          caption: 'Microsoft Sysmon enhances endpoint visibility by recording detailed security events that are forwarded to centralized monitoring platforms for analysis and threat detection.',
        ),
      ),
      LessonSection(
        heading: 'Common Sysmon Event Types',
        bullets: [
          'Process Creation — records every newly created process, including executable path, parent process, command-line arguments, user account, and process hash; extremely useful for detecting malicious scripts, ransomware, and attacker tool execution',
          'Network Connections — records outbound connections initiated by processes (source/destination IP, ports, process name); used to identify malware communicating with C2 servers',
          'Driver Loading — records drivers loaded into the OS; unexpected driver installations may indicate rootkits or malicious kernel modules',
          'Registry Changes — records modifications to important registry keys, helping detect startup persistence and malware persistence mechanisms',
          'File Creation — monitors file creation in selected directories (Downloads, temp folders, startup folders), assisting investigators in identifying malware payloads',
        ],
      ),
      LessonSection(
        heading: 'Common Sysmon Event IDs',
        body:
            'Each Sysmon event is assigned a unique Event ID that '
            'identifies the type of activity being recorded. Security '
            'analysts frequently reference these Event IDs when '
            'creating detection rules and conducting threat hunting.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Event ID', 'Description', 'Security Use'],
          tableRows: [
            ['1', 'Process Creation', 'Detect malware and suspicious process execution'],
            ['2', 'File Creation Time Changed', 'Identify timestamp manipulation'],
            ['3', 'Network Connection', 'Detect outbound malicious communications'],
            ['5', 'Process Terminated', 'Investigate process lifecycle'],
            ['7', 'Image/Driver Loaded', 'Detect unauthorized drivers or DLLs'],
            ['11', 'File Created', 'Identify dropped malware payloads'],
            ['12–14', 'Registry Events', 'Detect persistence mechanisms'],
            ['22', 'DNS Query', 'Identify communication with malicious domains'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Log Sources a SOC Correlates',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Log Source', 'Typical Information Collected', 'Common Security Use'],
          tableRows: [
            ['Windows Event Logs', 'Authentication, services, system events', 'User activity and system auditing'],
            ['Microsoft Sysmon', 'Process execution, registry changes, network connections', 'Threat hunting and forensic investigations'],
            ['Linux Syslog', 'Authentication, services, kernel events', 'Server monitoring and incident analysis'],
            ['macOS Unified Logging', 'Application, system, and security events', 'macOS security monitoring'],
            ['EDR', 'Endpoint telemetry, behavioral detections', 'Real-time threat detection and response'],
            ['Antivirus / EPP', 'Malware detections, scans, quarantines', 'Malware monitoring'],
            ['Identity Providers', 'User authentication, MFA events, privilege changes', 'Identity threat detection'],
            ['Network Devices', 'Firewall events, VPN sessions, connection logs', 'Correlation with endpoint activity'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Log Forwarding',
        body:
            'Enterprise environments centralize logs from multiple '
            'operating systems and infrastructure sources rather than '
            'reviewing each device individually — forwarding Windows '
            'Event Logs, Sysmon telemetry, Linux Syslog, macOS Unified '
            'Logs, and network device logs to a central collector, which '
            'then feeds the organization\'s SIEM platform.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/enterprise_log_forwarding.jpg',
          caption: 'Enterprise environments centralize logs from multiple operating systems and infrastructure sources to build a comprehensive view of security events.',
        ),
      ),
      LessonSection(
        heading: 'Endpoint Monitoring in the SOC',
        body:
            'Enterprise endpoint telemetry is collected, enriched with '
            'threat intelligence, and analyzed by the Security '
            'Operations Center around the clock — turning raw endpoint '
            'events into prioritized, actionable alerts for analysts.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/endpoint_monitoring_soc.jpg',
          caption: 'Enterprise endpoint telemetry is collected, enriched with threat intelligence, and analyzed by the Security Operations Center to detect and respond to cyber threats.',
        ),
      ),
      LessonSection(
        heading: 'Endpoint Event Investigation Workflow',
        body:
            'SOC analysts investigate endpoint security alerts through '
            'a structured workflow — triaging the alert, correlating '
            'related telemetry across log sources, determining scope '
            'and impact, containing the affected endpoint, and '
            'documenting findings for follow-up remediation.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/endpoint2/endpoint_event_investigation.jpg',
          caption: 'SOC analysts investigate endpoint security alerts through a structured workflow that combines triage, correlation, containment, and documentation.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational pharmaceutical company uses Microsoft '
            'Defender for Endpoint, Sysmon, Windows Event Forwarding, '
            'and Microsoft Sentinel to monitor more than 35,000 '
            'endpoints. One afternoon, the SIEM generates an alert '
            'indicating that Microsoft Excel launched PowerShell with '
            'an encoded command. Sysmon records the creation of a '
            'scheduled task, while endpoint telemetry shows outbound '
            'communication with a domain recently identified in a '
            'threat intelligence feed. At the same time, authentication '
            'logs reveal multiple failed login attempts against '
            'privileged accounts. Because the SIEM correlates events '
            'from endpoint telemetry, identity services, and threat '
            'intelligence, the alert is automatically classified as '
            'high severity. The SOC isolates the affected endpoint, '
            'disables the compromised account, blocks the malicious '
            'domain, and initiates a forensic investigation — rapid '
            'detection prevents the attacker from deploying ransomware '
            'or moving laterally within the enterprise.',
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

  // 13 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 20,
    quiz: [
      QuizQuestion(
        question: 'How does endpoint security differ from network security?',
        options: [
          'They are identical disciplines with different names',
          'Endpoint security focuses on securing the devices users interact with, while network security focuses on protecting data as it travels across the network',
          'Endpoint security only applies to smartphones',
          'Network security has been replaced entirely by endpoint security',
        ],
        correctIndex: 1,
        explanation: 'Endpoint security protects the device itself; network security protects data in transit — complementary but distinct disciplines.',
      ),
      QuizQuestion(
        question: 'Why do cybercriminals frequently target endpoints rather than data centers?',
        options: [
          'Endpoints never contain valuable data',
          'Endpoints are often easier to compromise than well-protected data centers, and a single infected device can provide a path to broader access',
          'Data centers have no security controls at all',
          'Endpoints cannot connect to corporate networks',
        ],
        correctIndex: 1,
        explanation: 'Endpoints are typically less hardened than centralized infrastructure, making them an attractive, easier entry point.',
      ),
      QuizQuestion(
        question: 'What distinguishes a worm from a virus?',
        options: [
          'A worm requires user action to spread; a virus does not',
          'A worm self-replicates and spreads automatically across networks without user intervention, while a virus requires user action like opening an infected file',
          'They are exactly the same type of malware',
          'A virus can never corrupt files',
        ],
        correctIndex: 1,
        explanation: 'Worms spread autonomously by exploiting network vulnerabilities; viruses need a human to trigger execution.',
      ),
      QuizQuestion(
        question: 'What makes fileless malware particularly difficult for traditional antivirus to detect?',
        options: [
          'It always requires a USB device to spread',
          'It executes directly in system memory using legitimate OS tools rather than installing files on disk',
          'It only affects mobile devices',
          'It cannot cause any actual damage',
        ],
        correctIndex: 1,
        explanation: 'Fileless malware avoids leaving file-based signatures behind, which is exactly what traditional signature-based antivirus relies on.',
      ),
      QuizQuestion(
        question: 'What is the key difference between EPP and EDR?',
        options: [
          'They are the same technology marketed under two names',
          'EPP focuses on preventing threats before compromise; EDR focuses on detecting and responding to threats that bypass preventive controls',
          'EDR only works on mobile devices',
          'EPP requires no installation on endpoints',
        ],
        correctIndex: 1,
        explanation: 'EPP is prevention-focused; EDR is detection-and-response-focused for threats that get past EPP.',
      ),
      QuizQuestion(
        question: 'What does XDR add beyond what EDR alone provides?',
        options: [
          'Nothing — they are identical',
          'XDR correlates data from multiple security sources (endpoint, email, firewall, identity, cloud) for enterprise-wide threat visibility',
          'XDR only monitors network firewalls',
          'XDR replaces the need for a SOC entirely',
        ],
        correctIndex: 1,
        explanation: 'XDR extends detection beyond the endpoint alone, correlating signals across many different security tools at once.',
      ),
      QuizQuestion(
        question: 'What is endpoint telemetry?',
        options: [
          'A type of malware',
          'The continuous collection of security and operational data generated by endpoints, enabling behavioral analysis rather than periodic scanning',
          'A backup solution for lost devices',
          'A password policy standard',
        ],
        correctIndex: 1,
        explanation: 'Telemetry is the continuous stream of endpoint activity data that modern EDR and SIEM tools analyze.',
      ),
      QuizQuestion(
        question: 'What is the primary function of a SIEM platform?',
        options: [
          'To physically secure endpoint devices',
          'To collect, store, correlate, and analyze logs from multiple sources, helping analysts identify attacks not visible from any single endpoint',
          'To replace the need for MFA',
          'To manage mobile device enrollment exclusively',
        ],
        correctIndex: 1,
        explanation: 'SIEM\'s value is in correlating events across many different log sources to reveal attacks that a single source wouldn\'t show.',
      ),
      QuizQuestion(
        question: 'What does Conditional Access evaluate before granting, blocking, or challenging an access request?',
        options: [
          'Only the user\'s typed password',
          'User identity, group membership, device compliance, geographic location, sign-in risk, and application sensitivity',
          'Nothing — it grants access automatically',
          'Only the time of day',
        ],
        correctIndex: 1,
        explanation: 'Conditional Access makes context-aware, real-time decisions based on multiple risk signals, not just a static credential check.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of device enrollment in endpoint management?',
        options: [
          'To permanently disable the device',
          'To establish trust between the endpoint and the management platform, enabling administrators to apply security policies and deploy software remotely',
          'To physically track the device\'s location at all times',
          'To remove the device from the corporate network entirely',
        ],
        correctIndex: 1,
        explanation: 'Enrollment is the foundational step that lets a management platform actually apply policy and push software to a device.',
      ),
      QuizQuestion(
        question: 'Why is a device that has been successfully enrolled not automatically considered secure?',
        options: [
          'Enrollment guarantees permanent security with no further action needed',
          'Security configurations may change over time — antivirus can be disabled, encryption removed, or software become outdated — requiring continuous compliance verification',
          'Enrolled devices cannot be monitored at all',
          'Compliance only needs to be checked once, at enrollment time',
        ],
        correctIndex: 1,
        explanation: 'Compliance is a continuous state, not a one-time checkbox — device posture can degrade after initial enrollment.',
      ),
      QuizQuestion(
        question: 'How does Conditional Access integration with device compliance support a Zero Trust model?',
        options: [
          'By trusting any device once the user enters a password',
          'By evaluating both user identity AND device security posture before granting access, blocking non-compliant devices even after successful authentication',
          'By removing the need for authentication entirely',
          'By only checking compliance once per year',
        ],
        correctIndex: 1,
        explanation: 'Zero Trust requires continuous verification of both identity and device health, not just a one-time login check.',
      ),
      QuizQuestion(
        question: 'What is the difference between patch management and vulnerability management?',
        options: [
          'They are identical processes with different names',
          'Vulnerability management identifies, assesses, and prioritizes security weaknesses, while patch management implements the actual updates or remediation to eliminate them',
          'Patch management only applies to hardware',
          'Vulnerability management replaces the need for any patching',
        ],
        correctIndex: 1,
        explanation: 'Vulnerability management is about finding and prioritizing weaknesses; patch management is about actually fixing them.',
      ),
      QuizQuestion(
        question: 'Which type of software patch generally receives the highest deployment priority?',
        options: ['Feature updates', 'Security patches', 'Driver updates', 'Bug fixes unrelated to security'],
        correctIndex: 1,
        explanation: 'Security patches address exploitable vulnerabilities, making them the highest priority since delaying them increases organizational risk.',
      ),
      QuizQuestion(
        question: 'In a ring-based patch deployment model, which group typically receives updates first?',
        options: ['Enterprise-wide deployment to all devices', 'Ring 0 — IT Administrators', 'Guest and contractor devices', 'Unmanaged personal devices'],
        correctIndex: 1,
        explanation: 'Ring 0 (IT Administrators) receives updates first, allowing early validation before wider rollout through subsequent rings.',
      ),
      QuizQuestion(
        question: 'What does Microsoft\'s "Patch Tuesday" refer to?',
        options: [
          'A random, unpredictable update schedule',
          'A predictable monthly security update release occurring on the second Tuesday of each month',
          'A one-time historical event, no longer in use',
          'An update schedule exclusive to Linux systems',
        ],
        correctIndex: 1,
        explanation: 'Patch Tuesday is Microsoft\'s regular, predictable monthly release cadence for security updates.',
      ),
      QuizQuestion(
        question: 'What compensating controls might an organization use to mitigate a zero-day vulnerability before an official patch is released?',
        options: [
          'Waiting silently with no action until a patch appears',
          'Disabling vulnerable services, blocking malicious traffic via firewalls, applying IPS signatures, and enhanced EDR monitoring',
          'Immediately shutting down the entire network permanently',
          'Ignoring the vulnerability since no patch exists yet',
        ],
        correctIndex: 1,
        explanation: 'Compensating controls reduce risk temporarily while the organization awaits and tests an official vendor patch.',
      ),
      QuizQuestion(
        question: 'What does a CVSS score of 9.5 indicate, and what response does it typically warrant?',
        options: [
          'Low severity — no action required',
          'Critical severity — immediate action required',
          'Medium severity — schedule remediation during routine maintenance',
          'The score has no bearing on response urgency',
        ],
        correctIndex: 1,
        explanation: 'Scores from 9.0-10.0 are rated Critical, warranting immediate remediation action.',
      ),
      QuizQuestion(
        question: 'What is the key difference between remediation and mitigation for a vulnerability?',
        options: [
          'They are the same thing with different names',
          'Remediation completely removes the underlying weakness (e.g. patching); mitigation reduces the likelihood or impact of exploitation without eliminating the vulnerability itself',
          'Mitigation is always preferred over remediation',
          'Remediation is only used for hardware, never software',
        ],
        correctIndex: 1,
        explanation: 'Remediation eliminates the vulnerability; mitigation is a temporary risk-reduction measure used when remediation isn\'t immediately possible.',
      ),
      QuizQuestion(
        question: 'Why are Windows Security Logs considered among the most important sources for security investigations?',
        options: [
          'They only record printer activity',
          'They document security-sensitive activities such as authentication, failed logins, account lockouts, and privilege assignments',
          'They are the only log type Windows generates',
          'They cannot be centrally collected or analyzed',
        ],
        correctIndex: 1,
        explanation: 'Security Logs specifically capture the authentication and privilege-related events most relevant to investigating a compromise.',
      ),
      QuizQuestion(
        question: 'On a Linux system, which log file would an administrator typically check to investigate authentication failures?',
        options: ['/var/log/kern.log', '/var/log/auth.log', '/var/log/messages exclusively', 'There is no such log on Linux'],
        correctIndex: 1,
        explanation: '/var/log/auth.log (or /var/log/secure on some distributions) specifically records authentication-related events.',
      ),
      QuizQuestion(
        question: 'What does File Integrity Monitoring (FIM) specifically detect?',
        options: [
          'Only network bandwidth usage',
          'Unauthorized creation, modification, deletion, renaming, or replacement of critical files and directories',
          'The physical temperature of a server',
          'User typing speed',
        ],
        correctIndex: 1,
        explanation: 'FIM tracks changes to protected files, making it especially valuable for detecting ransomware and unauthorized configuration changes.',
      ),
      QuizQuestion(
        question: 'What is a "Living off the Land" (LotL) attack technique?',
        options: [
          'An attack that only works in outdoor, non-networked environments',
          'An attacker abusing legitimate, trusted system utilities (like PowerShell or WMI) to carry out malicious activity while evading detection',
          'A type of physical, non-cyber attack',
          'An attack that requires custom-built malware exclusively',
        ],
        correctIndex: 1,
        explanation: 'LotL attacks rely on tools already present and trusted on the system, making them harder to detect than custom malware.',
      ),
      QuizQuestion(
        question: 'What does Microsoft Sysmon add beyond standard Windows Event Logs?',
        options: [
          'Nothing — it duplicates existing Windows logs exactly',
          'Enhanced telemetry including parent-child process relationships, command-line logging, network connection tracking, and process hashing',
          'It replaces the need for any antivirus software',
          'It only works on Linux systems',
        ],
        correctIndex: 1,
        explanation: 'Sysmon complements native Windows logs with much more granular, forensically valuable telemetry.',
      ),
      QuizQuestion(
        question: 'In Sysmon, which Event ID specifically corresponds to Process Creation?',
        options: ['Event ID 22', 'Event ID 1', 'Event ID 11', 'Event ID 7'],
        correctIndex: 1,
        explanation: 'Event ID 1 records process creation, one of the most heavily referenced Sysmon events for detecting malware and suspicious execution.',
      ),
    ],
  ),
];
