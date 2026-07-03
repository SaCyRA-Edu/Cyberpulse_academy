import '../exam_model.dart';

const List<ExamQuestion> beginnerExamBank = [
  // -- Easy -----------------------------------------------------------------
  ExamQuestion(
    question: 'What does the "C" in the CIA Triad stand for?',
    options: ['Cryptography', 'Confidentiality', 'Compliance', 'Control'],
    correctIndex: 1,
    explanation: 'Confidentiality means only authorized people can access data.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'A phishing email is best described as:',
    options: [
      'A deceptive message trying to trick you into giving up information',
      'A type of firewall rule',
      'A backup strategy',
      'An encryption algorithm',
    ],
    correctIndex: 0,
    explanation:
        'Phishing relies on deception to get the recipient to act against '
        'their own interest.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What is malware?',
    options: [
      'A type of network cable',
      'Malicious software designed to damage or exploit systems',
      'A password policy',
      'A backup file format',
    ],
    correctIndex: 1,
    explanation: 'Malware is software intentionally built to cause harm.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Which protocol is used to send email between mail servers?',
    options: ['SMTP', 'DNS', 'SSH', 'HTTP'],
    correctIndex: 0,
    explanation: 'SMTP (Simple Mail Transfer Protocol) relays outgoing email.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Multi-Factor Authentication (MFA) requires:',
    options: [
      'Only a username',
      'Two or more proof factors, like a password plus a phone code',
      'A faster internet connection',
      'A longer email address',
    ],
    correctIndex: 1,
    explanation: 'MFA combines multiple authentication factors.',
    difficulty: Difficulty.easy,
  ),

  // -- Medium -----------------------------------------------------------------
  ExamQuestion(
    question: 'A hospital\'s patient records system goes offline during a '
        'shift. Which part of the CIA Triad was most directly affected?',
    options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
    correctIndex: 2,
    explanation: 'Systems being inaccessible when needed is an availability failure.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Which of these is the clearest red flag of a phishing email?',
    options: [
      'A normal company logo',
      'Urgent pressure to act immediately on a financial request',
      'A short subject line',
      'An email sent during business hours',
    ],
    correctIndex: 1,
    explanation:
        'Urgency designed to bypass normal judgment is one of the most '
        'common phishing tactics.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What is the key difference between a threat and a vulnerability?',
    options: [
      'They mean the same thing',
      'A threat is a weakness; a vulnerability is anything that could cause harm',
      'A threat is anything that could cause harm; a vulnerability is a weakness that could be exploited',
      'A vulnerability only applies to hardware',
    ],
    correctIndex: 2,
    explanation:
        'A threat is a potential danger; a vulnerability is the gap a '
        'threat could exploit.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Why might an organization purchase cyber insurance instead '
        'of building extra defenses for a low-probability risk?',
    options: [
      'To avoid the risk entirely',
      'To transfer the financial impact of the risk to a third party',
      'To accept the risk without any action',
      'To mitigate the risk technically',
    ],
    correctIndex: 1,
    explanation: 'Insurance is a classic example of risk transfer.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What is the main purpose of a digital certificate?',
    options: [
      'To speed up internet connections',
      'To bind a public key to a verified identity, like a website',
      'To store passwords in plaintext',
      'To compress data',
    ],
    correctIndex: 1,
    explanation:
        'A digital certificate lets your browser confirm it\'s really '
        'talking to the entity it claims to be.',
    difficulty: Difficulty.medium,
  ),

  // -- Hard -----------------------------------------------------------------
  ExamQuestion(
    question: 'An attacker registers "examp1e.com" (with a "1" instead of '
        'an "l") and sends invoices from it impersonating a real vendor. '
        'This combines which two concepts?',
    options: [
      'Typosquatting and phishing',
      'Hashing and encryption',
      'Risk transfer and risk avoidance',
      'NTFS permissions and MFA',
    ],
    correctIndex: 0,
    explanation:
        'A near-identical domain is typosquatting; using it to deceive a '
        'recipient is phishing.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Which email authentication mechanism specifically tells '
        'receiving servers what action to take (quarantine, reject, or '
        'report) when a message fails sender verification checks?',
    options: ['SPF', 'DKIM', 'DMARC', 'TLS'],
    correctIndex: 2,
    explanation:
        'DMARC builds on SPF and DKIM to define the enforcement policy for '
        'failed checks.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Why does hashing, rather than encryption, get used for '
        'storing passwords on a server?',
    options: [
      'Hashing is faster to type',
      'Hashing is reversible, making recovery easier for users',
      'Hashing is one-way, so even if the stored value leaks, the original password isn\'t directly recoverable',
      'Hashing requires no algorithm at all',
    ],
    correctIndex: 2,
    explanation:
        'Because hashing can\'t be reversed, a leaked password database '
        'doesn\'t hand attackers the plaintext passwords directly.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'A security policy requires data to be labeled by '
        'sensitivity before it\'s stored or shared. Which policy type is this?',
    options: [
      'Acceptable Use Policy',
      'Data Classification Policy',
      'Incident Response Policy',
      'BYOD Policy',
    ],
    correctIndex: 1,
    explanation:
        'Data Classification Policies define how to label and handle data '
        'based on sensitivity.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'An attacker modifies a financial record without authorization. Which CIA property failed?',
    options: ['Confidentiality', 'Integrity', 'Availability', 'Authentication'],
    correctIndex: 1,
    explanation: 'Unauthorized modification is an Integrity failure.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Ransomware primarily attacks which CIA Triad property?',
    options: ['Confidentiality', 'Integrity', 'Availability', 'Non-repudiation'],
    correctIndex: 2,
    explanation: 'Ransomware denies access to data — an Availability failure.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Which control most directly prevents account takeover when a password is stolen?',
    options: ['Firewall', 'Antivirus', 'Multi-factor authentication', 'Disk encryption'],
    correctIndex: 2,
    explanation: 'MFA means a stolen password alone is not enough to log in.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'An email display name shows "CEO John Smith" but the actual sending address is ceo@randomdomain.xyz. This is an example of:',
    options: ['SPF failure', 'Display name spoofing', 'DKIM failure', 'DNS poisoning'],
    correctIndex: 1,
    explanation: 'Display name spoofing shows a trusted name while hiding a malicious address.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Which risk treatment accepts the risk because the cost to fix it exceeds the potential loss?',
    options: ['Avoid', 'Mitigate', 'Transfer', 'Accept'],
    correctIndex: 3,
    explanation: 'Risk acceptance is a conscious decision to live with a risk because addressing it is not cost-effective.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Why should security policies be reviewed periodically rather than set once?',
    options: [
      'To give the security team more work',
      'Because risks technology and regulations change making old policies outdated',
      'It is a legal requirement in all countries',
      'Policies never need updating',
    ],
    correctIndex: 1,
    explanation: 'The threat landscape and business environment evolve — policies must keep pace.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'A phishing email uses urgent language claiming your account will be deleted in 24 hours unless you click immediately. What technique is being exploited?',
    options: ['DNS poisoning', 'Urgency and fear to bypass rational judgment', 'DKIM failure', 'Password spraying'],
    correctIndex: 1,
    explanation: 'Creating urgency is a classic social engineering technique that bypasses critical thinking.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Asymmetric encryption solves what problem that symmetric encryption has?',
    options: ['Speed', 'The key exchange problem — parties can share public keys openly without risking compromise', 'Key length', 'Compatibility'],
    correctIndex: 1,
    explanation: 'Asymmetric encryption eliminates the need to securely exchange a shared secret key.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'An insider threat is dangerous because:',
    options: ['Insiders are always malicious', 'Insiders already have legitimate access making their activity harder to distinguish from normal use', 'Insiders cannot access sensitive data', 'Insider attacks are always financially motivated'],
    correctIndex: 1,
    explanation: 'Legitimate access makes insider threat behavior blend in with normal activity.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What does the availability requirement mean for a hospital patient records system?',
    options: ['Only doctors can read records', 'Records must be accessible to authorized staff whenever needed including during emergencies', 'Records must be encrypted at rest', 'Records must be backed up monthly'],
    correctIndex: 1,
    explanation: 'Availability ensures critical systems are accessible when needed — especially critical in healthcare.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Which statement about zero-day vulnerabilities is correct?',
    options: ['They are always found by the vendor first', 'They are unknown to the vendor so no patch exists at the time of exploitation', 'They only affect old software', 'They are always low severity'],
    correctIndex: 1,
    explanation: 'Zero-days are exploited before the vendor knows about them leaving defenders with no patch.',
    difficulty: Difficulty.hard,
  ),

];