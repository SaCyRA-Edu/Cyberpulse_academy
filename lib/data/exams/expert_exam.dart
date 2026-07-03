import '../exam_model.dart';

const List<ExamQuestion> expertExamBank = [
  // -- Easy -----------------------------------------------------------------
  ExamQuestion(
    question: 'What does "defense in depth" mean?',
    options: [
      'Relying on a single very strong control',
      'Layering multiple independent controls so one failure doesn\'t mean total compromise',
      'Only securing the network perimeter',
      'Avoiding the use of firewalls',
    ],
    correctIndex: 1,
    explanation:
        'Defense in depth layers controls so a failure at one layer is '
        'caught by another.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What single thing legally separates a penetration tester '
        'from an attacker?',
    options: [
      'Using more advanced tools',
      'Explicit, written authorization to test',
      'Working only at night',
      'Being employed by a large company',
    ],
    correctIndex: 1,
    explanation: 'Authorization is what makes testing legal and legitimate.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Which principle is central to a Zero Trust architecture?',
    options: [
      'Trust everything inside the network perimeter',
      'Verify every request explicitly, regardless of origin',
      'Disable all authentication for internal traffic',
      'Rely on a single perimeter firewall',
    ],
    correctIndex: 1,
    explanation: 'Zero Trust verifies every request rather than assuming internal traffic is safe.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'In GRC, what does the "C" stand for?',
    options: ['Cryptography', 'Compliance', 'Connectivity', 'Containment'],
    correctIndex: 1,
    explanation: 'GRC stands for Governance, Risk, and Compliance.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Why is this course described as vendor-neutral?',
    options: [
      'It only covers free software',
      'The core concepts apply across platforms and aren\'t tied to a specific product or certification body',
      'It avoids teaching technical detail',
      'It only covers one operating system',
    ],
    correctIndex: 1,
    explanation:
        'Concepts like the CIA Triad and Zero Trust apply regardless of '
        'vendor or platform.',
    difficulty: Difficulty.easy,
  ),

  // -- Medium -----------------------------------------------------------------
  ExamQuestion(
    question: 'In the STRIDE threat model, "Repudiation" refers to:',
    options: [
      'Denying having performed an action',
      'Gaining capabilities beyond what was granted',
      'Degrading system availability',
      'Pretending to be another identity',
    ],
    correctIndex: 0,
    explanation: 'Repudiation is denying responsibility for an action.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'In digital forensics, what does "order of volatility" guide?',
    options: [
      'Which evidence to collect first, based on how easily it could be lost',
      'The order employees are interviewed',
      'How systems are renamed',
      'The order software updates are installed',
    ],
    correctIndex: 0,
    explanation:
        'More volatile evidence, like memory contents, should be '
        'collected before more persistent evidence like disk data.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Why is "compliance" not the same thing as "security"?',
    options: [
      'They are exactly the same',
      'Passing an audit confirms a defined baseline was met, not that the organization is fully secure',
      'Compliance only applies to small companies',
      'Security frameworks never include compliance requirements',
    ],
    correctIndex: 1,
    explanation: 'Compliance is a floor, not a guarantee of full security.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'A red team simulates attackers and a blue team defends. '
        'What is "purple teaming"?',
    options: [
      'A third, independent team that ignores both',
      'Combining red and blue efforts for shared learning and faster improvement',
      'A team that only performs compliance audits',
      'A replacement for digital forensics',
    ],
    correctIndex: 1,
    explanation:
        'Purple teaming blends offensive and defensive collaboration.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Cloud adoption and remote work are commonly cited as drivers '
        'behind the shift toward which architecture model?',
    options: ['Perimeter-only defense', 'Zero Trust', 'Air-gapping', 'Single sign-on alone'],
    correctIndex: 1,
    explanation:
        'As users and data spread beyond a single network perimeter, '
        'Zero Trust\'s "verify everything" model became necessary.',
    difficulty: Difficulty.medium,
  ),

  // -- Hard (cross-cutting, drawing on earlier levels too) ------------------
  ExamQuestion(
    question: 'A phishing email bypasses a spam filter, but the resulting '
        'malware is blocked by endpoint protection, and any traffic that '
        'did get through is limited by network segmentation. This scenario '
        'is a practical example of which concept?',
    options: ['Zero Trust alone', 'Defense in depth', 'GRC', 'Chain of custody'],
    correctIndex: 1,
    explanation:
        'Multiple independent layers each catching what the others missed '
        'is the essence of defense in depth.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'An organization adopts least-privilege access, verifies '
        'every request regardless of network location, and designs '
        'systems assuming a breach will eventually occur. Which '
        'architecture model are they following?',
    options: ['Perimeter security', 'Zero Trust', 'Defense-only networking', 'Air-gapped systems'],
    correctIndex: 1,
    explanation:
        'Least privilege, explicit verification, and assuming breach are '
        'the three core Zero Trust principles.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'A SOC analyst investigating an incident also documents '
        'who handled each piece of evidence, in what order, and with '
        'hashes to prove nothing was altered. This overlaps most directly '
        'with which discipline from this course?',
    options: ['Digital forensics', 'Risk transfer', 'DNS resolution', 'NTFS permissions'],
    correctIndex: 0,
    explanation:
        'Chain of custody and evidence integrity are core forensic '
        'principles, often applied during real-time incident response.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Which best describes why frameworks like the NIST '
        'Cybersecurity Framework or ISO/IEC 27001 are considered '
        'vendor-neutral?',
    options: [
      'They are free to read online',
      'They describe what a mature security program should cover without dictating specific products',
      'They only apply to government agencies',
      'They replace the need for risk management entirely',
    ],
    correctIndex: 1,
    explanation:
        'These frameworks define outcomes and practices, not specific '
        'vendor tools.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Defense in depth assumes:',
    options: ['One strong perimeter control is sufficient', 'Any individual control can eventually fail so multiple independent layers are required', 'Only technical controls matter', 'Defense is only needed at the network perimeter'],
    correctIndex: 1,
    explanation: 'Defense in depth designs for failure of any single control by layering multiple independent ones.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'STRIDE Spoofing threatens which security property?',
    options: ['Integrity', 'Availability', 'Authentication and Identity', 'Confidentiality'],
    correctIndex: 2,
    explanation: 'Spoofing pretends to be a different identity — it is an authentication and identity threat.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'A CASB enforces security policies on:',
    options: ['Physical access control', 'Cloud service usage between users and cloud applications', 'DNS resolution', 'Email routing'],
    correctIndex: 1,
    explanation: 'A CASB sits between users and cloud services enforcing visibility compliance and threat protection.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Zero Trust microsegmentation means:',
    options: ['Dividing the physical data center into zones', 'Applying fine-grained network access controls so east-west traffic between workloads is also verified and restricted', 'Only allowing outbound traffic', 'Blocking all internal communications'],
    correctIndex: 1,
    explanation: 'Microsegmentation extends Zero Trust to east-west internal traffic not just north-south perimeter traffic.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'GRC governance in a security context defines:',
    options: ['The technical firewall configuration', 'The decision-making structures policies and accountability frameworks that direct the security program', 'The SIEM query language', 'The patch management schedule'],
    correctIndex: 1,
    explanation: 'Governance provides the organizational structure and accountability that guides the entire security program.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'During a threat model workshop you identify a trust boundary crossing. You should ask:',
    options: ['What font should we use in the diagram', 'What could go wrong at this boundary and does an existing control address it', 'Who created this system', 'How much did this system cost'],
    correctIndex: 1,
    explanation: 'Trust boundaries are where STRIDE threats should be systematically applied in a threat model.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'A mature security program at Level 4 Adaptive is characterized by:',
    options: ['Basic antivirus only', 'Continuous improvement threat intelligence integration and advanced automation', 'Having a SIEM deployed', 'Annual penetration tests only'],
    correctIndex: 1,
    explanation: 'Level 4 moves beyond reactive and proactive to continuous learning and improvement.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Rules of Engagement (RoE) in ethical hacking define:',
    options: ['How attackers should behave in general', 'The specific scope permitted techniques emergency contacts and data handling for a specific engagement', 'The marketing materials for the test', 'The payment terms only'],
    correctIndex: 1,
    explanation: 'RoE is the contract that makes testing legal and defines exactly what is authorized.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'ISO 27001 certification means an organization:',
    options: ['Has never had a security incident', 'Has implemented and had audited an Information Security Management System meeting the standard requirements', 'Uses only ISO-approved software', 'Has passed a one-time security test'],
    correctIndex: 1,
    explanation: 'ISO 27001 certification means an ISMS was implemented and audited against the standard — not a guarantee of zero incidents.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Just-In-Time (JIT) access is a Zero Trust concept that:',
    options: ['Gives permanent admin access to all staff', 'Grants elevated permissions only when needed and removes them automatically after use', 'Allows access without authentication', 'Provides network access based on time of day only'],
    correctIndex: 1,
    explanation: 'JIT minimizes standing privilege by granting elevated access only for the duration it is actually needed.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'The Identification phase of incident response is when:',
    options: ['All systems are restored', 'The team detects and confirms that a security incident is occurring', 'The attacker is removed', 'Post-incident reports are written'],
    correctIndex: 1,
    explanation: 'Identification is the detection and confirmation step — distinguishing real incidents from false positives.',
    difficulty: Difficulty.easy,
  ),

];