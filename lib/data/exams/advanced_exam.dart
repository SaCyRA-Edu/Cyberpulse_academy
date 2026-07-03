import '../exam_model.dart';

const List<ExamQuestion> advancedExamBank = [
  // -- Easy -----------------------------------------------------------------
  ExamQuestion(
    question: 'Why is it recommended to avoid daily work as the root user '
        'on Linux?',
    options: [
      'Root accounts run slower',
      'Root has unrestricted access, so mistakes or compromises have far greater impact',
      'Root accounts cannot connect to the internet',
      'It is required by most package managers',
    ],
    correctIndex: 1,
    explanation:
        'Because root has unrestricted access, errors or compromises while '
        'using it affect the entire system.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What is the main benefit of sudo over logging in directly as root?',
    options: [
      'It disables all logging',
      'It allows fine-grained, auditable elevated access without sharing the root password',
      'It is required to install any software',
      'It automatically encrypts the file system',
    ],
    correctIndex: 1,
    explanation: 'sudo provides controlled, logged elevated access.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What is the primary purpose of a Security Operations Center (SOC)?',
    options: [
      'Writing marketing material',
      'Continuously monitoring systems and coordinating response to security incidents',
      'Managing payroll',
      'Designing new software features',
    ],
    correctIndex: 1,
    explanation: 'A SOC\'s core role is monitoring, detection, and response.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'Which SOC tier typically performs the first review of an incoming alert?',
    options: ['Tier 1', 'Tier 2', 'Tier 3', 'SOC Manager'],
    correctIndex: 0,
    explanation: 'Tier 1 analysts perform initial triage.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'What does a SIEM mainly help a SOC do?',
    options: [
      'Write security policies',
      'Collect and correlate logs from across the organization to surface potential incidents',
      'Encrypt laptops',
      'Manage employee onboarding',
    ],
    correctIndex: 1,
    explanation: 'A SIEM aggregates and correlates log data.',
    difficulty: Difficulty.easy,
  ),

  // -- Medium -----------------------------------------------------------------
  ExamQuestion(
    question: 'In a permission string "rwxr-xr--", what access does '
        '"everyone else" have?',
    options: [
      'Read, write, and execute',
      'Read and execute',
      'Read only',
      'No access at all',
    ],
    correctIndex: 2,
    explanation: 'The final three characters "r--" mean read-only.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Why is SSH key-based authentication generally more secure '
        'than password authentication?',
    options: [
      'Keys are shorter than passwords',
      'The private key never travels over the network and is far harder to brute-force',
      'Keys never need to be stored anywhere',
      'It removes the need for a firewall',
    ],
    correctIndex: 1,
    explanation:
        'The private key stays on the client, making key-based login much '
        'more resistant to brute-force attacks.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What is an "Indicator of Compromise" (IOC)?',
    options: [
      'A formal policy document',
      'An observable sign a system may be compromised, like a known-malicious IP',
      'A type of firewall rule',
      'A SOC performance metric',
    ],
    correctIndex: 1,
    explanation: 'IOCs are observable artifacts suggesting compromise.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'In the incident response lifecycle, what comes immediately '
        'after "Containment"?',
    options: ['Identification', 'Eradication', 'Preparation', 'Recovery'],
    correctIndex: 1,
    explanation: 'After containment comes eradication — removing the threat.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'What do SELinux and AppArmor both provide?',
    options: [
      'Disk encryption',
      'An additional layer of mandatory access control restricting what programs can do',
      'A graphical desktop environment',
      'A package manager replacement',
    ],
    correctIndex: 1,
    explanation: 'Both restrict program behavior beyond standard permissions.',
    difficulty: Difficulty.medium,
  ),

  // -- Hard -----------------------------------------------------------------
  ExamQuestion(
    question: 'A SOC analyst notices a failed login, an unusual file '
        'download, and a new outbound connection within minutes of each '
        'other on the same host. Individually each event is low-severity. '
        'What is this scenario illustrating?',
    options: [
      'Why MFA is unnecessary',
      'The value of correlation — combining weak individual signals into a stronger pattern',
      'A false positive that should always be ignored',
      'A reason to disable logging',
    ],
    correctIndex: 1,
    explanation:
        'SIEM correlation reveals patterns that no single log entry would '
        'show alone.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'A Linux admin grants every user broad sudo rights instead '
        'of disabling root, intending to improve security. What problem '
        'does this actually create?',
    options: [
      'It has no real downside',
      'It effectively recreates unrestricted root access under a different name',
      'It disables SSH entirely',
      'It removes the need for file permissions',
    ],
    correctIndex: 1,
    explanation:
        'Overly broad sudo access defeats the purpose of fine-grained, '
        'least-privilege control.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Why do many incident response processes include a '
        '"Lessons Learned" phase after recovery?',
    options: [
      'It is legally required everywhere',
      'To feed what was learned back into detection, policy, and training so gaps aren\'t exploited again',
      'To assign blame to specific employees',
      'It is optional and rarely useful',
    ],
    correctIndex: 1,
    explanation: 'Reviewing incidents helps close the gaps that were exploited.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'What is MITRE ATT&CK best described as, and why do SOC '
        'teams use it?',
    options: [
      'An antivirus product used to block malware automatically',
      'A knowledge base cataloging attacker tactics/techniques, giving analysts a shared vocabulary to map observed behavior',
      'A type of firewall configuration',
      'A password policy standard',
    ],
    correctIndex: 1,
    explanation:
        'ATT&CK provides a common language for describing and detecting '
        'attacker behavior.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'A SOC analyst sees the Security audit log was cleared on a critical server at 2am. Event ID 1102 fired. What should they do?',
    options: ['Ignore it — log rotation is normal', 'Immediately escalate as a high-priority incident — log clearing is a common attacker tactic', 'Wait for more evidence', 'Reboot the server'],
    correctIndex: 1,
    explanation: 'Log clearing (event 1102) is a major red flag indicating an attacker covering their tracks.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'The order of volatility in forensics means collecting which type of evidence first?',
    options: ['Disk images', 'RAM and running process state which disappears when power is lost', 'Log files', 'Configuration files'],
    correctIndex: 1,
    explanation: 'Volatile evidence in RAM disappears on power off and must be captured before disk images.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'find / -perm -4000 on Linux finds:',
    options: ['All world-writable files', 'All SUID binaries — a critical security audit step', 'All running processes', 'All open network connections'],
    correctIndex: 1,
    explanation: 'Unexpected SUID binaries especially writable ones are a common path to privilege escalation.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'An IPS differs from an IDS because:',
    options: ['IPS only monitors inbound traffic', 'IPS actively blocks suspicious traffic inline while IDS only alerts passively', 'IPS is always cloud-based', 'IPS requires more human intervention'],
    correctIndex: 1,
    explanation: 'An IPS is inline and blocks; an IDS is passive and only alerts.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'MITRE ATT&CK coverage gap analysis helps a SOC:',
    options: ['Find unmonitored attack techniques with no detection rules', 'Identify which employees need training', 'Measure SIEM performance', 'Count the number of alerts per day'],
    correctIndex: 0,
    explanation: 'Mapping detection rules to ATT&CK techniques reveals which attack methods have no coverage.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Credential Guard is specifically effective against:',
    options: ['Phishing attacks', 'Pass-the-hash and pass-the-ticket attacks by isolating credentials in a VBS enclave', 'Ransomware encrypting files', 'Network-level intrusions'],
    correctIndex: 1,
    explanation: 'Credential Guard prevents tools like Mimikatz from reading hashes and Kerberos tickets from memory.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Mandatory Access Control in SELinux or AppArmor is applied:',
    options: ['Only to root processes', 'At the kernel level overriding standard permissions for all processes', 'Only to network connections', 'Only on login'],
    correctIndex: 1,
    explanation: 'MAC is kernel-enforced — it applies to all processes regardless of user or standard permissions.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'The Preparation phase of incident response includes:',
    options: ['Writing the post-incident report', 'Having playbooks tools and trained staff ready before any incident occurs', 'Containing the breach', 'Eradicating malware'],
    correctIndex: 1,
    explanation: 'Preparation happens before an incident — it is everything that enables effective response.',
    difficulty: Difficulty.easy,
  ),
  ExamQuestion(
    question: 'AppArmor profiles are described as path-based meaning:',
    options: ['They follow network traffic paths', 'They define permissions based on file and directory paths rather than labels', 'They only apply to executables in /usr/bin', 'They use filesystem encryption paths'],
    correctIndex: 1,
    explanation: 'AppArmor uses file paths in profiles rather than SELinux-style labels making it simpler to manage.',
    difficulty: Difficulty.hard,
  ),
  ExamQuestion(
    question: 'Threat hunting differs from reactive alert triage because:',
    options: ['It uses the same process as triage', 'It proactively searches for hidden threats that automated detection missed rather than responding to fired alerts', 'It only examines network traffic', 'It requires admin access to endpoints'],
    correctIndex: 1,
    explanation: 'Threat hunting assumes a breach may already have occurred and searches proactively for evidence.',
    difficulty: Difficulty.medium,
  ),
  ExamQuestion(
    question: 'Why is centralized log forwarding to a remote SIEM critical in a compromised Linux environment?',
    options: ['Remote SIEM is faster to query', 'An attacker with root on the local machine can delete local logs but cannot retroactively delete logs already sent remotely', 'SIEM storage is cheaper', 'Required by GDPR'],
    correctIndex: 1,
    explanation: 'Once logs are on a remote server the local attacker cannot erase that evidence.',
    difficulty: Difficulty.hard,
  ),

];