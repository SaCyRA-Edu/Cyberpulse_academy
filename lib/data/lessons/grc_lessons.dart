import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> grcLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Governance, Risk & Compliance (GRC)',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Security Beyond the Technical Controls',
        body:
            'Firewalls, encryption, and endpoint detection tools protect '
            'an organization technically, but none of them answer a more '
            'fundamental question: who decides what the organization is '
            'trying to protect, how much risk it is willing to accept, '
            'and whether it is actually meeting its legal and contractual '
            'obligations? That is the job of Governance, Risk, and '
            'Compliance (GRC) — the management layer that sits above '
            'individual security controls and ties them back to business '
            'objectives.',
      ),
      LessonSection(
        heading: 'The Three Pillars',
        body:
            'GRC is a unified approach combining three related '
            'disciplines. Governance defines who is accountable for '
            'security decisions and how those decisions get made — '
            'policies, standards, roles, and executive oversight. Risk '
            'Management identifies, assesses, and treats the things that '
            'could go wrong. Compliance ensures the organization actually '
            'meets the laws, regulations, contracts, and internal '
            'policies it is subject to.',
      ),
      LessonSection(
        body:
            'These three disciplines are deeply interdependent. '
            'Governance sets the risk appetite that risk management works '
            'within; risk assessments reveal gaps that compliance '
            'programs must address; and compliance failures are '
            'themselves a category of risk that governance must account '
            'for. Treating them as three separate, disconnected '
            'functions — as many organizations historically did — leads '
            'to duplicated effort, contradictory priorities, and blind '
            'spots.',
      ),
      LessonSection(
        heading: 'Why Organizations Invest in GRC',
        bullets: [
          'Align security spending with actual business risk rather than reacting to the loudest alarm',
          'Demonstrate due diligence to regulators, auditors, insurers, and customers',
          'Avoid duplicated or contradictory controls across departments',
          'Provide executives and boards with a clear, consolidated view of organizational risk',
          'Reduce the likelihood and impact of costly compliance failures and fines',
          'Build customer and partner trust through demonstrable governance maturity',
        ],
      ),
      LessonSection(
        heading: 'What GRC Is Not',
        body:
            'GRC is not a single piece of software, a checklist to '
            'complete once a year, or a task that belongs exclusively to '
            'legal or compliance teams. It is an ongoing management '
            'discipline that touches every part of the organization — '
            'IT, security, legal, HR, finance, and business units all '
            'have a role. GRC platforms (tools that automate policy '
            'distribution, risk registers, and compliance tracking) '
            'support the discipline, but the discipline itself is a way '
            'of making decisions, not a product you buy.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Security Governance',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'What Governance Actually Does',
        body:
            'Security governance establishes the leadership structures, '
            'policies, and decision rights that determine how an '
            'organization manages cybersecurity. Without governance, '
            'security decisions get made ad hoc by whoever happens to be '
            'in the room — leading to inconsistent priorities, gaps '
            'between teams, and no clear accountability when something '
            'goes wrong.',
      ),
      LessonSection(
        heading: 'The Governance Hierarchy: Policies, Standards, Procedures, Guidelines',
        body:
            'Organizations typically document their governance decisions '
            'in a layered hierarchy:',
        bullets: [
          'Policy — a high-level statement of management intent (e.g., "All laptops must be encrypted"). Policies are mandatory and rarely change.',
          'Standard — a specific, mandatory requirement that supports a policy (e.g., "All laptops must use AES-256 full-disk encryption"). Standards are more detailed and updated more often than policies.',
          'Procedure — step-by-step instructions for carrying out a standard (e.g., the exact steps an IT technician follows to enable BitLocker on a new laptop).',
          'Guideline — recommended, non-mandatory advice that helps people make good decisions where a strict rule doesn\'t fit every situation.',
        ],
      ),
      LessonSection(
        body:
            'This layering matters because it separates the "why" '
            '(policy, set by leadership and rarely revised) from the '
            '"how" (procedures, which change often as tools and threats '
            'evolve) — letting the organization update implementation '
            'details without having to re-approve the underlying policy '
            'every time.',
      ),
      LessonSection(
        heading: 'Roles and Accountability',
        body:
            'Effective governance requires clearly assigned roles. Common '
            'roles include:',
        bullets: [
          'Board of Directors — sets overall risk appetite and holds executives accountable',
          'Chief Information Security Officer (CISO) — owns the security program and reports risk to leadership',
          'Data Owners — business leaders accountable for the sensitivity and appropriate use of specific data sets',
          'Data Custodians — technical staff responsible for implementing the controls data owners require',
          'Risk Committee / Governance Committee — cross-functional group that reviews and approves major risk and policy decisions',
        ],
      ),
      LessonSection(
        body:
            'A common governance failure is confusing "data owner" with '
            '"data custodian" — the business leader who decides how '
            'sensitive a data set is (owner) is not the same person who '
            'configures the access controls protecting it (custodian), '
            'and conflating the two roles often leaves nobody actually '
            'accountable for the decision itself.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A mid-sized healthcare company\'s security policy states '
            'that all systems handling patient data must encrypt data at '
            'rest. The corresponding standard specifies AES-256 as the '
            'required algorithm and mandates centralized key management. '
            'The procedure gives database administrators exact '
            'configuration steps for enabling transparent data '
            'encryption on the organization\'s SQL Server instances. When '
            'a new encryption technology becomes available, only the '
            'procedure needs to change — the policy and standard remain '
            'stable, avoiding a lengthy re-approval process for a purely '
            'technical update.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Review policies on a defined cycle (e.g., annually) rather than leaving them static indefinitely',
          'Assign a named owner to every policy, standard, and procedure',
          'Separate data owner and data custodian responsibilities explicitly',
          'Ensure governance decisions are documented and auditable',
          'Tie every policy back to a specific business or regulatory driver',
        ],
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Risk Management Fundamentals',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Risk Is Not the Same as Threat',
        body:
            'Risk management begins with precise vocabulary. A threat is '
            'anything that could cause harm (a ransomware group, a '
            'careless employee, a hurricane). A vulnerability is a '
            'weakness a threat could exploit (an unpatched server, a '
            'poorly trained help desk). Risk is the combination of the '
            'two, expressed as likelihood multiplied by impact: how '
            'probable is it that this threat exploits this vulnerability, '
            'and how bad would the consequences be if it did?',
      ),
      LessonSection(
        heading: 'The Risk Management Process',
        body: 'Enterprise risk management typically follows a repeating cycle:',
        bullets: [
          'Risk Identification — catalog assets and the threats/vulnerabilities that could affect them',
          'Risk Assessment — estimate likelihood and impact for each identified risk',
          'Risk Prioritization — rank risks so limited resources go where they matter most',
          'Risk Treatment — decide how to respond to each risk',
          'Monitoring and Review — reassess regularly, since likelihood and impact change over time',
        ],
      ),
      LessonSection(
        heading: 'Qualitative vs. Quantitative Risk Assessment',
        body:
            'Qualitative assessment rates risks using descriptive '
            'categories — Low/Medium/High or a 1-5 scale — based on '
            'expert judgment. It is fast and easy to communicate but '
            'somewhat subjective. Quantitative assessment assigns actual '
            'dollar figures, commonly using:',
      ),
      LessonSection(
        bullets: [
          'Asset Value (AV) — the monetary value of the asset at risk',
          'Exposure Factor (EF) — the percentage of the asset\'s value that would be lost in a single incident',
          'Single Loss Expectancy (SLE) = AV × EF — the expected loss from one occurrence',
          'Annualized Rate of Occurrence (ARO) — how many times per year the event is expected to happen',
          'Annualized Loss Expectancy (ALE) = SLE × ARO — the expected yearly cost of the risk',
        ],
      ),
      LessonSection(
        body:
            'For example, if a server holding \$500,000 of processing '
            'capacity has a 20% exposure factor per ransomware incident '
            '(SLE = \$100,000) and such incidents are expected roughly '
            'once every four years (ARO = 0.25), the ALE is \$25,000 per '
            'year — a figure that can be directly compared against the '
            'annual cost of a control that would prevent it.',
      ),
      LessonSection(
        heading: 'The Four Risk Treatment Options',
        bullets: [
          'Avoid — eliminate the activity that creates the risk entirely (e.g., discontinue a risky product feature)',
          'Mitigate — reduce likelihood or impact through controls (e.g., deploy MFA, patch systems)',
          'Transfer — shift financial responsibility elsewhere, typically through cyber insurance or contractual terms with a vendor',
          'Accept — knowingly take no further action because the cost of treatment exceeds the risk itself',
        ],
      ),
      LessonSection(
        body:
            'Risk acceptance should always be a deliberate, documented '
            'decision made by someone with the authority to accept it on '
            'the organization\'s behalf — silently doing nothing about a '
            'known risk is not the same thing as formally accepting it, '
            'and the distinction matters enormously during an audit or '
            'after an incident.',
      ),
      LessonSection(
        heading: 'Inherent Risk vs. Residual Risk',
        body:
            'Inherent risk is the level of risk that exists before any '
            'controls are applied. Residual risk is what remains after '
            'controls are in place. The gap between the two shows how '
            'much a given control actually reduces risk — a useful '
            'measure when deciding whether an additional control is worth '
            'its cost.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A logistics company identifies that its customer-facing '
            'web application has an inherent risk of SQL injection rated '
            'High, given the sensitivity of the data and the '
            'application\'s internet exposure. After implementing '
            'parameterized queries, a web application firewall, and '
            'regular penetration testing, the residual risk drops to Low '
            '— the risk register documents both the inherent and '
            'residual ratings, along with which specific controls '
            'accounted for the reduction, giving auditors and leadership '
            'a clear trail of why the current risk level is considered '
            'acceptable.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain a centralized risk register documenting every identified risk, its owner, and its treatment decision',
          'Reassess risk ratings on a regular cadence, not just when something goes wrong',
          'Require formal sign-off for any risk acceptance decision',
          'Express risk in business terms (cost, downtime, reputational impact) so non-technical leaders can act on it',
          'Track residual risk over time to demonstrate the value of security investment',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Compliance & Regulatory Requirements',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'What Compliance Actually Means',
        body:
            'Compliance is the process of demonstrating that an '
            'organization meets the laws, regulations, industry '
            'standards, and contractual obligations that apply to it. '
            'Compliance is not the same thing as security — an '
            'organization can be fully compliant with a regulation and '
            'still be insecure, because compliance frameworks generally '
            'set a minimum baseline, not a ceiling. Treating compliance '
            'as the finish line rather than the floor is one of the most '
            'common governance mistakes.',
      ),
      LessonSection(
        heading: 'Common Regulatory Frameworks',
        body:
            'Different industries and jurisdictions impose different '
            'requirements. Some of the most widely encountered include:',
      ),
      LessonSection(
        bullets: [
          'GDPR (General Data Protection Regulation) — EU regulation governing the collection and processing of personal data of EU residents, with steep fines for violations',
          'HIPAA (Health Insurance Portability and Accountability Act) — U.S. regulation protecting patient health information',
          'PCI DSS (Payment Card Industry Data Security Standard) — industry standard (not law) required by card networks for any organization that processes, stores, or transmits cardholder data',
          'SOX (Sarbanes-Oxley Act) — U.S. law requiring accurate financial reporting and internal controls for public companies',
          'CCPA/CPRA (California Consumer Privacy Act) — California state law giving residents rights over their personal data, similar in spirit to GDPR',
          'GLBA (Gramm-Leach-Bliley Act) — U.S. law requiring financial institutions to protect customer financial information',
        ],
      ),
      LessonSection(
        heading: 'Applicability Depends on the Organization',
        body:
            'An organization is generally subject to a given regulation '
            'because of what data it handles, where its customers are '
            'located, or which industry it operates in — not simply '
            'because the regulation exists. A US-based e-commerce company '
            'that sells to EU customers must comply with GDPR regardless '
            'of where its servers are located; a hospital must comply '
            'with HIPAA; any merchant accepting credit cards must meet '
            'PCI DSS. Determining exactly which regulations apply is '
            'itself an important early step in a compliance program, '
            'often requiring legal counsel.',
      ),
      LessonSection(
        heading: 'Consequences of Non-Compliance',
        bullets: [
          'Regulatory fines, which for frameworks like GDPR can reach a percentage of global annual revenue',
          'Loss of the ability to process card payments (for PCI DSS violations)',
          'Legal liability and civil lawsuits',
          'Mandatory breach notification costs and reputational damage',
          'Loss of business — many enterprise customers require proof of compliance (e.g., a SOC 2 report) before signing a contract',
        ],
      ),
      LessonSection(
        heading: 'Audits and Assessments',
        body:
            'Organizations demonstrate compliance through audits — '
            'formal, evidence-based reviews performed by internal audit '
            'teams or independent third parties. Common audit types '
            'include:',
        bullets: [
          'Internal Audit — performed by the organization\'s own audit function, often as preparation for an external audit',
          'External Audit — performed by an independent third-party firm, resulting in a formal report (e.g., a SOC 2 Type II report)',
          'Regulatory Audit — performed by a government or industry regulator with enforcement authority',
          'Self-Assessment — the organization evaluates its own compliance against a framework (common for smaller PCI DSS merchants)',
        ],
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A payment processing startup must achieve PCI DSS '
            'compliance before it can legally handle credit card '
            'transactions for its customers. The compliance team first '
            'scopes exactly which systems touch cardholder data, then '
            'implements the required controls (network segmentation, '
            'encryption, access logging), documents policies, and '
            'engages a Qualified Security Assessor to conduct a formal '
            'audit. The resulting Attestation of Compliance becomes a '
            'prerequisite document that enterprise customers request '
            'before signing a contract — turning what started as a legal '
            'obligation into a sales enabler.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Maintain a regulatory inventory documenting exactly which laws and standards apply and why',
          'Treat compliance as a minimum baseline, not the security program\'s end goal',
          'Assign clear ownership for each compliance obligation',
          'Prepare for audits continuously rather than scrambling right before one',
          'Track remediation of audit findings to closure with documented evidence',
        ],
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Cybersecurity & Governance Frameworks',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Why Frameworks Matter',
        body:
            'Rather than building a security program from scratch, most '
            'organizations adopt one or more established frameworks — '
            'structured, widely-vetted sets of controls and practices '
            'developed by standards bodies, industry groups, or '
            'government agencies. Frameworks provide a common vocabulary, '
            'a defensible basis for audits, and a way to measure program '
            'maturity over time.',
      ),
      LessonSection(
        heading: 'Frameworks vs. Regulations',
        body:
            'It is worth distinguishing frameworks from regulations. '
            'Regulations (GDPR, HIPAA) are legally mandatory for '
            'organizations that meet certain criteria. Frameworks (NIST '
            'CSF, ISO 27001, COBIT) are voluntary structures an '
            'organization can adopt to help meet those regulations — and '
            'often, satisfying a well-regarded framework goes a long way '
            'toward satisfying several regulations at once, since many '
            'controls overlap.',
      ),
      LessonSection(
        heading: 'Common Frameworks at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Framework', 'Primary Focus', 'Typical Use'],
          tableRows: [
            ['NIST Cybersecurity Framework (CSF)', 'Cybersecurity risk management lifecycle', 'General-purpose enterprise security programs'],
            ['ISO/IEC 27001', 'Information Security Management System (ISMS)', 'Certification and internationally recognized governance'],
            ['COBIT', 'IT governance and management', 'Aligning IT investment with business goals'],
            ['CIS Critical Security Controls', 'Prioritized, practical technical controls', 'Tactical hardening and operational improvement'],
            ['COSO', 'Enterprise risk management and internal controls', 'Financial reporting and broader organizational risk'],
            ['SOC 2', 'Trust Services Criteria (security, availability, confidentiality, etc.)', 'Demonstrating control effectiveness to customers'],
          ],
        ),
      ),
      LessonSection(
        heading: 'The NIST Cybersecurity Framework in More Depth',
        body:
            'The NIST CSF organizes cybersecurity activities into six '
            'core functions: Govern, Identify, Protect, Detect, Respond, '
            'and Recover. Each function contains categories and '
            'subcategories that map to specific outcomes — for example, '
            'under "Identify," organizations are expected to maintain an '
            'asset inventory and understand their risk environment; under '
            '"Respond," they need documented incident response '
            'procedures. Because the CSF is outcome-based rather than '
            'prescriptive about specific tools, it works across '
            'industries and organization sizes.',
      ),
      LessonSection(
        heading: 'ISO/IEC 27001 in More Depth',
        body:
            'ISO/IEC 27001 defines requirements for establishing, '
            'implementing, maintaining, and continually improving an '
            'Information Security Management System (ISMS) — essentially '
            'the governance structure around security, not just a list '
            'of technical controls. Organizations can pursue formal '
            'certification against ISO 27001 through an accredited '
            'certification body, which produces a certificate that can '
            'be shown to customers and partners as independent evidence '
            'of a mature security program.',
      ),
      LessonSection(
        heading: 'Choosing and Combining Frameworks',
        body:
            'Most mature organizations don\'t pick just one framework — '
            'they map several together, using a common controls '
            'repository so that one piece of evidence (say, a quarterly '
            'access review) can satisfy multiple frameworks at once '
            'rather than being collected and documented separately for '
            'each. This practice, often called "controls mapping" or '
            '"harmonization," significantly reduces the audit burden as '
            'the number of applicable frameworks grows.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Select a primary framework that matches organizational size, industry, and maturity',
          'Map overlapping controls across frameworks to reduce duplicated audit evidence',
          'Use framework maturity models to track improvement over time, not just pass/fail compliance',
          'Revisit framework selection periodically as the organization and regulatory landscape evolve',
          'Involve both technical and business stakeholders in framework adoption decisions',
        ],
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Third-Party & Vendor Risk Management',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Your Risk Doesn\'t Stop at Your Perimeter',
        body:
            'Modern organizations rely on dozens or hundreds of '
            'third-party vendors — cloud providers, SaaS applications, '
            'payment processors, contractors, and suppliers. Every one '
            'of those relationships introduces risk the organization '
            'does not directly control, since a vendor\'s security '
            'failure can become the organization\'s security failure. '
            'Third-Party Risk Management (TPRM) is the discipline of '
            'identifying, assessing, and monitoring the risk introduced '
            'by these external relationships.',
      ),
      LessonSection(
        heading: 'The Vendor Risk Lifecycle',
        bullets: [
          'Due Diligence — assess a vendor\'s security posture before signing a contract (questionnaires, security certifications, references)',
          'Contracting — negotiate security requirements, data handling terms, breach notification obligations, and right-to-audit clauses into the contract',
          'Onboarding — provision only the access the vendor actually needs, following least privilege',
          'Ongoing Monitoring — periodically reassess the vendor\'s security posture throughout the relationship, not just at signing',
          'Offboarding — revoke access and confirm data return or destruction when the relationship ends',
        ],
      ),
      LessonSection(
        heading: 'Tiering Vendors by Risk',
        body:
            'Not every vendor deserves the same level of scrutiny. '
            'Organizations typically tier vendors based on factors such '
            'as what data the vendor can access, whether the vendor '
            'connects directly to internal systems, and how critical the '
            'vendor\'s service is to business operations. A critical '
            'cloud provider hosting sensitive customer data warrants deep '
            'due diligence and continuous monitoring; a vendor supplying '
            'office snacks does not.',
      ),
      LessonSection(
        heading: 'Common Due Diligence Tools',
        bullets: [
          'Security questionnaires (e.g., SIG, CAIQ) — standardized sets of questions covering a vendor\'s security practices',
          'SOC 2 Type II reports — independent auditor attestations of a vendor\'s control effectiveness over time',
          'Penetration test summaries — evidence the vendor tests its own security',
          'Certifications — ISO 27001, PCI DSS attestation, and similar credentials',
          'Right-to-audit clauses — contractual terms allowing the organization to inspect the vendor\'s controls directly',
        ],
      ),
      LessonSection(
        heading: 'Fourth-Party Risk',
        body:
            'A vendor\'s own subcontractors and suppliers introduce '
            '"fourth-party risk" — a risk the organization often can\'t '
            'see directly. A payment processor may itself rely on a '
            'cloud hosting provider; if that hosting provider suffers a '
            'breach, the impact can cascade down to the organization '
            'even though it never contracted with the hosting provider '
            'directly. Mature TPRM programs ask vendors to disclose their '
            'own critical subcontractors for exactly this reason.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A retail company evaluates a new marketing analytics vendor '
            'that will receive customer purchase histories. Because the '
            'vendor will process personal data, the vendor risk team '
            'requires a completed SIG questionnaire, a current SOC 2 '
            'Type II report, and a Data Processing Agreement specifying '
            'breach notification timelines. During the relationship, the '
            'vendor is reassessed annually, and access is automatically '
            'reviewed each quarter. When the contract ends, the '
            'offboarding checklist confirms that customer data was '
            'deleted and access credentials were revoked.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Tier vendors by risk rather than applying identical scrutiny to every relationship',
          'Build security requirements into contracts before signing, not after',
          'Reassess critical vendors on a recurring schedule, not only at onboarding',
          'Maintain a complete, current inventory of all active vendors and what data or systems they can access',
          'Include a formal offboarding process that revokes access and confirms data disposition',
        ],
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Audits, Assessments & Continuous Compliance',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'From Annual Event to Continuous Practice',
        body:
            'Historically, many organizations treated compliance as an '
            'annual scramble — gathering evidence, patching gaps, and '
            'passing an audit once a year, then largely ignoring the '
            'program until the next cycle. Modern GRC practice pushes '
            'toward continuous compliance: monitoring controls in near '
            'real time so that gaps are caught and fixed as they appear, '
            'rather than being discovered months later during an audit.',
      ),
      LessonSection(
        heading: 'Types of Assessments',
        bullets: [
          'Control Self-Assessment — teams evaluate their own compliance against a checklist, often as an interim check between formal audits',
          'Gap Analysis — comparing current practices against a target framework to identify what\'s missing before pursuing certification',
          'Readiness Assessment — a dry run ahead of a formal external audit, intended to surface issues while there\'s still time to fix them',
          'Penetration Testing — technical assessment simulating real attacks, distinct from a compliance audit but often required by frameworks like PCI DSS',
        ],
      ),
      LessonSection(
        heading: 'The Audit Lifecycle',
        bullets: [
          'Scoping — define exactly which systems, processes, and data fall within the audit boundary',
          'Evidence Collection — gather documentation, logs, screenshots, and interview notes proving each control operates as described',
          'Testing — the auditor independently verifies that controls actually work, not just that policy says they should',
          'Findings — gaps or weaknesses the auditor identifies, typically rated by severity',
          'Remediation — the organization fixes findings and documents the fix',
          'Reporting — the auditor issues a formal report (e.g., a SOC 2 report, an ISO 27001 certificate, or a PCI DSS Attestation of Compliance)',
        ],
      ),
      LessonSection(
        heading: 'Common Audit Findings',
        body:
            'Certain gaps show up again and again across organizations '
            'and industries:',
        bullets: [
          'Access reviews that were scheduled but never actually performed',
          'Terminated employees whose accounts were not promptly disabled',
          'Policies that exist on paper but don\'t match actual practice',
          'Missing evidence — a control that genuinely operates but was never documented',
          'Inconsistent enforcement of a policy across different business units',
        ],
      ),
      LessonSection(
        body:
            'That last category — a control that works but was never '
            'documented — is a common and frustrating audit failure: '
            'auditors can only certify what they can verify, so a strong '
            'security practice with no supporting evidence is treated the '
            'same as if the practice didn\'t happen at all.',
      ),
      LessonSection(
        heading: 'GRC Platforms and Automation',
        body:
            'Dedicated GRC software platforms help operationalize '
            'continuous compliance by centralizing policy documents, '
            'automating evidence collection from connected systems (e.g., '
            'automatically pulling proof that MFA is enforced from an '
            'identity provider), maintaining a live risk register, and '
            'generating dashboards for auditors and executives. '
            'Automation reduces the manual burden of evidence gathering '
            'and shortens the time between a control failing and someone '
            'noticing.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A SaaS company pursuing SOC 2 Type II certification '
            'integrates its GRC platform directly with its cloud '
            'infrastructure, identity provider, and ticketing system. '
            'Instead of manually screenshotting configuration settings '
            'once a year, the platform continuously pulls evidence — '
            'confirming daily that MFA remains enforced, that terminated '
            'employees\' accounts were disabled within 24 hours, and that '
            'critical vulnerabilities were patched within the required '
            'SLA. When the external auditor arrives, most of the '
            'evidence is already collected and organized, cutting audit '
            'preparation time significantly.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Shift toward continuous, automated evidence collection rather than annual scrambles',
          'Document controls as they are actually performed, not just as policy describes them',
          'Track audit findings to closure with assigned owners and deadlines',
          'Conduct internal readiness assessments before external audits',
          'Use a GRC platform to centralize policies, risk register, and evidence where scale justifies the investment',
        ],
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'GRC Metrics, Reporting & Security Culture',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Measuring a Program That Isn\'t Purely Technical',
        body:
            'Unlike a firewall\'s block count or an antivirus engine\'s '
            'detection rate, GRC effectiveness is harder to measure '
            'directly — success often looks like "nothing bad happened," '
            'which isn\'t a metric by itself. Mature GRC programs instead '
            'track a mix of leading indicators (predictive signals of '
            'future risk) and lagging indicators (evidence of past '
            'performance) to give leadership a genuine picture of program '
            'health.',
      ),
      LessonSection(
        heading: 'Common GRC Metrics',
        bullets: [
          'Percentage of risks with a documented, current treatment plan',
          'Average time to remediate audit findings',
          'Percentage of employees completing required security awareness training',
          'Number of policy exceptions granted and their aging',
          'Vendor risk assessments completed on schedule vs. overdue',
          'Number of days since the risk register was last reviewed',
          'Compliance status by framework or regulation (percentage of controls met)',
        ],
      ),
      LessonSection(
        heading: 'Reporting to the Board',
        body:
            'Boards of directors increasingly expect regular '
            'cybersecurity risk reporting, but board members are '
            'typically not security specialists — effective reporting '
            'translates technical risk into business language. Rather '
            'than reporting "we blocked 4,000 phishing emails last '
            'month," a board-level report might frame the same '
            'underlying data as "our top three risks this quarter are X, '
            'Y, and Z; here is our current exposure in financial terms; '
            'here is what we\'re doing about each one, and here is what '
            'we need from you to reduce risk further" (budget, policy '
            'backing, or a strategic decision).',
      ),
      LessonSection(
        heading: 'Security Awareness as a Governance Function',
        body:
            'Security awareness training is often treated as a purely '
            'HR or IT exercise, but from a GRC perspective it is a '
            'governance control — many regulations and frameworks '
            'explicitly require documented, recurring training, and '
            'completion rates are a standard audit evidence item. A '
            'well-governed awareness program tracks completion rates by '
            'department, ties training content to the organization\'s '
            'actual top risks (e.g., phishing simulation results feeding '
            'back into what the next training module covers), and '
            'reports gaps to leadership just like any other control '
            'deficiency.',
      ),
      LessonSection(
        heading: 'Building a Risk-Aware Culture',
        body:
            'The most mature GRC programs go beyond mandatory training '
            'and try to build genuine risk awareness into daily '
            'decision-making — for example, giving business units enough '
            'visibility into their own risk posture that they '
            'proactively flag new projects for security review rather '
            'than security having to chase them down after the fact. '
            'This cultural shift is difficult to measure directly but is '
            'often what separates organizations that treat GRC as a '
            'genuine strategic function from those that treat it as a '
            'compliance chore.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A financial services firm\'s quarterly board report shows '
            'that phishing simulation click rates dropped from 22% to '
            '9% over the past year following a redesigned awareness '
            'program, that 94% of critical audit findings were remediated '
            'within their target SLA, and that three vendor '
            'reassessments are currently overdue and flagged for '
            'follow-up. Rather than a technical dashboard, the report '
            'ties each of these figures back to a specific business risk '
            'and a clear owner — giving the board an actionable view of '
            'where the program is improving and where it still needs '
            'investment.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Combine leading and lagging indicators rather than relying on either alone',
          'Translate technical metrics into business and financial terms for executive audiences',
          'Report GRC metrics on a consistent, recurring cadence',
          'Treat security awareness completion and effectiveness as a tracked governance metric',
          'Use metrics to drive resource allocation decisions, not just to fill a slide deck',
        ],
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Bringing GRC Together',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'One Continuous Loop, Not Three Silos',
        body:
            'Governance, Risk, and Compliance are often taught — and '
            'organized — as three separate functions, but in a '
            'well-run program they operate as a single continuous loop. '
            'Governance sets direction and risk appetite. Risk '
            'management identifies where reality diverges from that '
            'appetite. Compliance verifies whether the organization is '
            'meeting its external obligations along the way. Findings '
            'from any one discipline feed back into the other two — an '
            'audit finding is a new risk; a new risk may require a policy '
            'update; a policy update changes what compliance has to '
            'verify next cycle.',
      ),
      LessonSection(
        heading: 'How GRC Connects to the Rest of Security',
        body:
            'Every technical chapter in this course ultimately feeds '
            'into GRC somewhere. Cryptography and endpoint controls '
            'satisfy specific compliance requirements. Incident response '
            'plans are themselves governance artifacts that auditors '
            'review. Identity and access management generates the '
            'evidence — access reviews, deprovisioning logs, MFA '
            'enforcement — that compliance teams rely on. GRC is not a '
            'replacement for technical security work; it is the '
            'management structure that makes technical work defensible, '
            'prioritized, and demonstrably effective.',
      ),
      LessonSection(
        heading: 'What Good GRC Looks Like',
        body:
            'A mature GRC program has policies that map cleanly down to '
            'standards and procedures, a risk register that is actually '
            'reviewed on a schedule rather than gathering dust, '
            'compliance evidence collected continuously rather than '
            'assembled in a last-minute scramble, vendor risk tiered and '
            'monitored rather than treated as a one-time checkbox, and '
            'metrics that get reported to leadership in language '
            'business decision-makers can actually act on. None of these '
            'pieces works well in isolation — it is the combination, '
            'consistently maintained, that turns GRC from a compliance '
            'obligation into a genuine driver of better security '
            'decisions.',
      ),
    ],
  ),

  // 10 — Practice Quiz -------------------------------------------------------
  Lesson(
    title: 'Practice Quiz: Governance, Risk & Compliance',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'What is the core relationship between the three pillars of GRC?',
        options: [
          'They are entirely independent and should be managed separately',
          'Governance sets direction and risk appetite, risk management identifies gaps from that appetite, and compliance verifies external obligations are met — with findings feeding back between all three',
          'Compliance is the only pillar that matters; governance and risk are optional',
          'Risk management replaces the need for governance entirely',
        ],
        correctIndex: 1,
        explanation: 'GRC works as a continuous loop where each discipline informs the others, rather than as three disconnected silos.',
      ),
      QuizQuestion(
        question: 'In the policy hierarchy, what is the key difference between a policy and a procedure?',
        options: [
          'They are interchangeable terms for the same document',
          'A policy is a high-level, rarely-changing statement of intent; a procedure gives step-by-step instructions that can be updated more frequently',
          'Procedures are mandatory while policies are optional',
          'Policies only apply to IT staff, while procedures apply to everyone',
        ],
        correctIndex: 1,
        explanation: 'Policies capture stable, high-level intent set by leadership, while procedures contain the detailed steps that can change as tools and threats evolve without requiring policy re-approval.',
      ),
      QuizQuestion(
        question: 'What is the key distinction between a "data owner" and a "data custodian"?',
        options: [
          'They are the same role with two different titles',
          'The data owner is the business leader accountable for a data set\'s sensitivity and appropriate use; the data custodian implements the technical controls protecting it',
          'The data custodian sets business policy, and the data owner configures technical systems',
          'Only data owners can be held accountable during an audit',
        ],
        correctIndex: 1,
        explanation: 'Data owners are business-side decision-makers accountable for how sensitive data is classified and used; data custodians are the technical staff who implement the resulting controls.',
      ),
      QuizQuestion(
        question: 'How is "risk" formally defined relative to "threat" and "vulnerability"?',
        options: [
          'Risk is just another word for threat',
          'Risk is the combination of likelihood and impact resulting from a threat exploiting a vulnerability',
          'Risk only applies to financial systems',
          'Vulnerability and risk are identical concepts',
        ],
        correctIndex: 1,
        explanation: 'Risk is the likelihood of a threat exploiting a vulnerability, combined with the resulting impact — not simply a synonym for either threat or vulnerability alone.',
      ),
      QuizQuestion(
        question: 'In quantitative risk assessment, how is Annualized Loss Expectancy (ALE) calculated?',
        options: [
          'ALE = Asset Value only',
          'ALE = Single Loss Expectancy (SLE) × Annualized Rate of Occurrence (ARO)',
          'ALE = Exposure Factor divided by Asset Value',
          'ALE is a fixed number set by regulators',
        ],
        correctIndex: 1,
        explanation: 'ALE = SLE × ARO, giving the expected yearly monetary cost of a given risk, which can then be compared against the cost of a proposed control.',
      ),
      QuizQuestion(
        question: 'Which of the four risk treatment options involves knowingly taking no further action because the cost of addressing the risk exceeds the risk itself?',
        options: [
          'Avoid',
          'Mitigate',
          'Transfer',
          'Accept',
        ],
        correctIndex: 3,
        explanation: 'Risk acceptance is a deliberate, documented decision to take no further action, made by someone with the authority to accept the risk on the organization\'s behalf.',
      ),
      QuizQuestion(
        question: 'What is the difference between inherent risk and residual risk?',
        options: [
          'They are the same measurement taken at different times of year',
          'Inherent risk exists before any controls are applied; residual risk is what remains after controls are in place',
          'Residual risk is always higher than inherent risk',
          'Inherent risk only applies to financial audits',
        ],
        correctIndex: 1,
        explanation: 'Inherent risk is the baseline risk level before controls; residual risk is what remains afterward — the gap between the two shows how much a control actually reduced risk.',
      ),
      QuizQuestion(
        question: 'Why is compliance NOT the same thing as security?',
        options: [
          'Compliance is always stricter than good security practice',
          'Compliance frameworks generally set a minimum baseline, so an organization can be fully compliant and still be insecure',
          'Security and compliance are legally identical terms',
          'Compliance only applies to government agencies',
        ],
        correctIndex: 1,
        explanation: 'Compliance frameworks typically establish a minimum floor, not a security ceiling — meeting them doesn\'t guarantee an organization is actually secure against real threats.',
      ),
      QuizQuestion(
        question: 'Which regulation specifically governs the protection of patient health information in the United States?',
        options: [
          'PCI DSS',
          'HIPAA',
          'SOX',
          'GDPR',
        ],
        correctIndex: 1,
        explanation: 'HIPAA (Health Insurance Portability and Accountability Act) is the U.S. regulation governing protection of patient health information.',
      ),
      QuizQuestion(
        question: 'What determines whether a specific regulation applies to a given organization?',
        options: [
          'Every organization must comply with every regulation regardless of industry',
          'Applicability generally depends on what data the organization handles, where its customers are located, and what industry it operates in',
          'Only publicly traded companies are ever subject to any regulation',
          'Regulations only apply to organizations headquartered in the regulation\'s country of origin',
        ],
        correctIndex: 1,
        explanation: 'Regulatory applicability is driven by factors like the type of data handled, customer location, and industry — not simply by where the organization happens to be based.',
      ),
      QuizQuestion(
        question: 'What is the key difference between a "framework" like NIST CSF and a "regulation" like GDPR?',
        options: [
          'There is no meaningful difference between the two',
          'Regulations are legally mandatory for organizations that meet certain criteria; frameworks are voluntary structures that can help an organization meet those regulations',
          'Frameworks are always more strict than regulations',
          'Regulations only apply to technical controls, while frameworks only apply to policy',
        ],
        correctIndex: 1,
        explanation: 'Regulations carry legal force for applicable organizations, while frameworks are voluntary structures adopted to help satisfy those and other requirements.',
      ),
      QuizQuestion(
        question: 'What does the NIST Cybersecurity Framework\'s "Identify" function primarily expect organizations to do?',
        options: [
          'Deploy firewalls exclusively',
          'Maintain an asset inventory and understand their risk environment',
          'Immediately terminate any employee who violates policy',
          'Only applies to financial reporting',
        ],
        correctIndex: 1,
        explanation: 'The Identify function focuses on understanding the organization\'s assets, environment, and risks — the foundation the other five functions build on.',
      ),
      QuizQuestion(
        question: 'Why do many mature organizations map controls across multiple frameworks rather than tracking each separately?',
        options: [
          'It is a legal requirement in every jurisdiction',
          'A single piece of evidence can satisfy multiple frameworks at once, reducing duplicated audit effort',
          'Mapping controls eliminates the need for any audits',
          'Frameworks cannot legally be combined',
        ],
        correctIndex: 1,
        explanation: 'Controls mapping/harmonization lets one piece of evidence satisfy several frameworks simultaneously, significantly reducing the burden of separate audit preparation for each.',
      ),
      QuizQuestion(
        question: 'What is "fourth-party risk"?',
        options: [
          'Risk introduced by the organization\'s own employees',
          'Risk introduced by a vendor\'s own subcontractors and suppliers, which the organization typically cannot see directly',
          'A risk category that only applies to government contracts',
          'The risk of losing a fourth vendor relationship',
        ],
        correctIndex: 1,
        explanation: 'Fourth-party risk comes from a vendor\'s own subcontractors — risk the organization doesn\'t directly contract for or see, but which can still cascade down to affect it.',
      ),
      QuizQuestion(
        question: 'Why should vendors be tiered by risk rather than assessed with identical scrutiny?',
        options: [
          'Tiering is only done to save money on audit fees',
          'Not every vendor relationship carries the same potential impact, so due diligence effort should scale with actual risk exposure',
          'Regulators require every vendor to receive identical treatment',
          'Tiering eliminates the need for any vendor contracts',
        ],
        correctIndex: 1,
        explanation: 'A vendor with deep access to sensitive data warrants far more scrutiny than a low-risk vendor, so tiering focuses limited due-diligence resources where they matter most.',
      ),
      QuizQuestion(
        question: 'Why is "continuous compliance" increasingly preferred over the traditional annual-audit-only approach?',
        options: [
          'Continuous compliance eliminates the need for any external audits',
          'It catches control gaps as they appear rather than discovering them months later during a scheduled audit',
          'Annual audits are illegal under most frameworks',
          'Continuous compliance is only relevant to very small organizations',
        ],
        correctIndex: 1,
        explanation: 'Continuous compliance monitors controls in near real time, catching gaps as they emerge instead of waiting for an annual audit to surface them.',
      ),
      QuizQuestion(
        question: 'Why does a security control that works but was never documented often still count as an audit failure?',
        options: [
          'Undocumented controls are always technically broken',
          'Auditors can only formally verify what evidence supports, so a working but undocumented control cannot be certified',
          'Documentation requirements only apply to failed controls',
          'This scenario never actually occurs in real audits',
        ],
        correctIndex: 1,
        explanation: 'Auditors certify based on verifiable evidence — a control that genuinely works but has no supporting documentation cannot be confirmed, and is treated the same as a control that doesn\'t exist.',
      ),
      QuizQuestion(
        question: 'Why is security awareness training considered a governance function rather than purely an HR task?',
        options: [
          'It has no real connection to GRC',
          'Many regulations and frameworks explicitly require documented, recurring training, and completion rates serve as standard audit evidence',
          'HR departments are never involved in security training',
          'Awareness training is only relevant to executive staff',
        ],
        correctIndex: 1,
        explanation: 'Regulatory and framework requirements often mandate documented training, making completion rates a governance control tracked and reported like any other compliance metric.',
      ),
      QuizQuestion(
        question: 'What distinguishes effective board-level GRC reporting from a purely technical security report?',
        options: [
          'Board reports should contain only raw technical statistics with no context',
          'Effective board reporting translates technical risk into business and financial language, tied to specific decisions the board needs to make',
          'Boards never need any visibility into cybersecurity risk',
          'Board reports and technical reports should be identical documents',
        ],
        correctIndex: 1,
        explanation: 'Board members are typically not security specialists, so effective reporting reframes technical data in business terms — risk exposure, financial impact, and what decisions leadership needs to make.',
      ),
      QuizQuestion(
        question: 'What best summarizes the relationship between GRC and the rest of a security program?',
        options: [
          'GRC replaces the need for technical security controls entirely',
          'GRC is the management structure that makes technical security work defensible, prioritized, and demonstrably effective — not a replacement for it',
          'GRC and technical security are completely unrelated disciplines',
          'Only large enterprises benefit from having a GRC function',
        ],
        correctIndex: 1,
        explanation: 'GRC provides the governance, risk prioritization, and compliance verification that make an organization\'s technical security investments defensible and effective, rather than substituting for the technical work itself.',
      ),
    ],
  ),
];
