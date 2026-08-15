import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> cryptographyLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Introduction to Cryptography',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Protecting the Organization\'s Most Valuable Asset',
        body:
            'Information is one of the most valuable assets in any '
            'organization. Businesses store sensitive data such as '
            'customer records, financial transactions, intellectual '
            'property, healthcare information, and confidential '
            'communications in digital form. Protecting this information '
            'from unauthorized access, modification, or disclosure is '
            'one of the primary objectives of cybersecurity.',
      ),
      LessonSection(
        heading: 'What Cryptography Actually Does',
        body:
            'One of the most effective methods for securing information '
            'is cryptography. Cryptography transforms readable data into '
            'a protected format that can only be understood by '
            'authorized parties possessing the correct cryptographic '
            'key. It is used extensively across enterprise environments '
            'to secure data stored on devices, protect information '
            'transmitted over networks, verify user identities, and '
            'ensure that digital communications remain trustworthy.',
      ),
      LessonSection(
        body:
            'Cryptography forms the foundation of many modern security '
            'technologies, including HTTPS websites, Virtual Private '
            'Networks (VPNs), Wi-Fi security, digital certificates, '
            'secure email, cloud computing, mobile applications, and '
            'Identity and Access Management (IAM) systems. Without '
            'cryptography, organizations would be unable to securely '
            'conduct online transactions or protect sensitive '
            'information from cyber threats.',
      ),
      LessonSection(
        heading: 'What Is Cryptography?',
        body:
            'Cryptography is the science and practice of protecting '
            'information by converting it into a secure format that '
            'prevents unauthorized access while allowing authorized '
            'users to recover the original information. The word '
            '"cryptography" originates from the Greek words kryptos '
            '(hidden) and graphein (writing). Historically, cryptography '
            'involved simple techniques such as substitution ciphers '
            'used to conceal military messages. Modern cryptography '
            'relies on complex mathematical algorithms and cryptographic '
            'keys to provide strong security for digital information. '
            'Rather than hiding the existence of data, cryptography '
            'makes the data unreadable to anyone who does not possess '
            'the correct key.',
      ),
      LessonSection(
        body: 'Organizations use cryptography to protect:',
        bullets: [
          'Customer information',
          'Financial records',
          'Medical data',
          'Authentication credentials',
          'Intellectual property',
          'Government information',
          'Cloud storage',
          'Network communications',
          'Backup data',
        ],
      ),
      LessonSection(
        body:
            'Cryptography protects both data at rest (stored '
            'information) and data in transit (information being '
            'transmitted across networks).',
      ),
      LessonSection(
        heading: 'Why Cryptography Is Important',
        body:
            'Every day, organizations exchange millions of sensitive '
            'transactions across public and private networks. Without '
            'cryptographic protection, attackers could intercept '
            'communications, modify data, impersonate users, or steal '
            'confidential information.',
      ),
      LessonSection(
        body: 'Cryptography helps organizations:',
        bullets: [
          'Protect confidential information',
          'Secure online transactions',
          'Verify user identities',
          'Prevent unauthorized data modification',
          'Authenticate communication partners',
          'Meet regulatory compliance requirements',
          'Enable secure cloud computing',
          'Protect remote access connections',
        ],
      ),
      LessonSection(
        body: 'Examples of enterprise use include:',
        bullets: [
          'Encrypting laptop hard drives to protect data if a device is lost or stolen',
          'Securing online banking transactions using HTTPS',
          'Encrypting VPN connections for remote employees',
          'Protecting email communications with digital certificates',
          'Encrypting databases that store personally identifiable information (PII)',
          'Securing backups stored in cloud environments',
        ],
      ),
      LessonSection(
        body:
            'Without cryptography, these services would be vulnerable to '
            'interception and manipulation.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'The Security Objectives of Cryptography',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Four Essential Security Objectives',
        body:
            'Cryptography supports several essential security objectives '
            'that align closely with the principles of information '
            'security.',
      ),
      LessonSection(
        heading: 'Confidentiality',
        body:
            'Confidentiality ensures that information is accessible only '
            'to authorized users. Encryption protects confidentiality by '
            'converting readable information into an unreadable format '
            'known as ciphertext. Even if attackers intercept encrypted '
            'data, they cannot understand its contents without the '
            'correct cryptographic key.',
      ),
      LessonSection(
        body: 'Examples include:',
        bullets: [
          'Encrypted emails',
          'Full-disk encryption',
          'HTTPS web sessions',
          'Encrypted cloud storage',
        ],
      ),
      LessonSection(
        body:
            'Confidentiality helps prevent unauthorized disclosure of '
            'sensitive information.',
      ),
      LessonSection(
        heading: 'Integrity',
        body:
            'Integrity ensures that information has not been altered, '
            'intentionally or accidentally, during storage or '
            'transmission. Cryptographic hash functions generate unique '
            'values that allow systems to verify whether data has '
            'changed.',
      ),
      LessonSection(
        body: 'Integrity mechanisms help detect:',
        bullets: [
          'File tampering',
          'Unauthorized modifications',
          'Corrupted downloads',
          'Data transmission errors',
        ],
      ),
      LessonSection(
        body:
            'For example, software vendors publish cryptographic hash '
            'values that customers can compare after downloading '
            'installation files to verify that the files have not been '
            'modified.',
      ),
      LessonSection(
        heading: 'Authentication',
        body:
            'Authentication verifies the identity of users, devices, or '
            'systems participating in a communication. Cryptography '
            'supports authentication through mechanisms such as digital '
            'certificates, Public Key Infrastructure (PKI), digital '
            'signatures, and challenge-response authentication. '
            'Authentication helps organizations ensure that users and '
            'systems are communicating with legitimate parties rather '
            'than attackers.',
      ),
      LessonSection(
        heading: 'Non-Repudiation',
        body:
            'Non-repudiation prevents an individual from denying that '
            'they performed a specific action. Digital signatures '
            'provide evidence that a document or transaction originated '
            'from a particular user and has not been altered. '
            'Non-repudiation is especially important for electronic '
            'contracts, financial transactions, legal documents, '
            'software publishing, and regulatory compliance.',
      ),
      LessonSection(
        body:
            'For example, when an organization digitally signs software '
            'updates, users can verify both the publisher\'s identity and '
            'the integrity of the software before installation.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/four_security_objectives.jpg',
          caption:
              'Cryptography provides four fundamental security services '
              'that protect information and establish trust in digital '
              'communications.',
        ),
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Plaintext, Ciphertext & Strong Cryptography',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Plaintext and Ciphertext',
        body:
            'Before encryption takes place, information exists in its '
            'original readable form. This readable information is '
            'called plaintext. Examples of plaintext include email '
            'messages, Word documents, database records, credit card '
            'information, passwords before hashing, and text files.',
      ),
      LessonSection(
        body:
            'During encryption, a cryptographic algorithm and a key '
            'transform the plaintext into an unreadable format called '
            'ciphertext. Ciphertext appears as random characters and '
            'cannot be interpreted without the correct decryption key. '
            'After successful decryption, the ciphertext is converted '
            'back into its original plaintext form. This process ensures '
            'that sensitive information remains protected even if '
            'intercepted during transmission or accessed by unauthorized '
            'individuals.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/plaintext_ciphertext.jpg',
          caption:
              'Encryption transforms readable plaintext into protected '
              'ciphertext using a cryptographic key, while decryption '
              'restores the original information for authorized users.',
        ),
      ),
      LessonSection(
        heading: 'Characteristics of Strong Cryptography',
        body:
            'Effective cryptographic systems share several important '
            'characteristics that make them resistant to attack. A '
            'strong cryptographic solution should provide:',
        bullets: [
          'Confidentiality through encryption',
          'Reliable protection against unauthorized modification',
          'Secure key management',
          'Resistance to known cryptographic attacks',
          'Efficient performance suitable for enterprise workloads',
          'Scalability across cloud and on-premises environments',
          'Support for modern security standards and protocols',
        ],
      ),
      LessonSection(
        body:
            'Modern cryptographic algorithms are designed so that the '
            'security of encrypted data depends on the secrecy of the '
            'cryptographic key rather than the secrecy of the algorithm '
            'itself. This principle allows algorithms to be publicly '
            'reviewed and tested by the security community while '
            'maintaining strong protection through secure key '
            'management.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational healthcare provider stores patient records '
            'in encrypted databases and requires all web applications to '
            'use HTTPS for secure communication. Physicians accessing '
            'electronic health records authenticate using digital '
            'certificates and Multi-Factor Authentication, while '
            'encrypted VPN connections protect remote access to clinical '
            'systems.',
      ),
      LessonSection(
        body:
            'If an attacker intercepts network traffic between a '
            'physician\'s workstation and the hospital\'s servers, the '
            'transmitted data remains unreadable because it is '
            'encrypted. Additionally, digital certificates verify the '
            'identity of the hospital\'s systems, preventing users from '
            'unknowingly connecting to fraudulent websites. This layered '
            'use of cryptography protects patient confidentiality, '
            'maintains data integrity, and supports compliance with '
            'healthcare regulations.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Encrypt sensitive data both at rest and in transit',
          'Use industry-approved cryptographic algorithms',
          'Protect cryptographic keys throughout their lifecycle',
          'Replace deprecated algorithms with modern alternatives',
          'Verify software integrity using cryptographic hashes or digital signatures',
          'Use trusted digital certificates issued by recognized Certificate Authorities (CAs)',
          'Regularly review cryptographic configurations to ensure compliance with current standards',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Encryption is only as strong as its key management. Even '
            'the most secure cryptographic algorithm can be compromised '
            'if encryption keys are exposed, poorly protected, or '
            'improperly managed.',
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Encryption, Encoding & Hashing',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 14,
    sections: [
      LessonSection(
        heading: 'Three Terms That Aren\'t Interchangeable',
        body:
            'The terms encryption, encoding, and hashing are sometimes '
            'used interchangeably, but they serve entirely different '
            'purposes. Understanding the differences is essential when '
            'designing secure systems and selecting appropriate data '
            'protection techniques.',
      ),
      LessonSection(
        heading: 'Encryption',
        body:
            'Encryption is the process of converting readable '
            'information (plaintext) into an unreadable format '
            '(ciphertext) using a cryptographic algorithm and a key. The '
            'primary objective of encryption is confidentiality. Unlike '
            'encoding or hashing, encrypted data can be restored to its '
            'original form through a process known as decryption, '
            'provided the correct cryptographic key is available.',
      ),
      LessonSection(
        body: 'Common examples include:',
        bullets: [
          'Full-disk encryption',
          'HTTPS communication',
          'Virtual Private Networks (VPNs)',
          'Encrypted email',
          'Database encryption',
          'File encryption',
        ],
      ),
      LessonSection(
        body:
            'Encryption protects information from unauthorized '
            'disclosure while allowing authorized users to recover the '
            'original data.',
      ),
      LessonSection(
        heading: 'Encoding',
        body:
            'Encoding converts data into a standardized format that '
            'enables compatibility between different systems. Unlike '
            'encryption, encoding is not intended to provide security. '
            'Encoded information can easily be reversed using publicly '
            'known decoding methods because no secret key is involved. '
            'Examples of encoding include Base64 encoding, ASCII '
            'encoding, and Unicode (UTF-8).',
      ),
      LessonSection(
        heading: 'Hashing',
        body:
            'Hashing creates a fixed-length digest used for integrity '
            'verification. Unlike encryption, hashing is a one-way '
            'process — hashed data cannot be reversed to recover the '
            'original input.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/hash_function_diagram.jpg',
          caption:
              'Hashing produces a fixed-length digest that verifies '
              'integrity — unlike encryption, the process cannot be '
              'reversed to recover the original input.',
        ),
      ),
      LessonSection(
        heading: 'Key Terms at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Term', 'Description'],
          tableRows: [
            ['Plaintext', 'Original readable data'],
            ['Ciphertext', 'Encrypted unreadable data'],
            ['Encryption', 'Converts plaintext into ciphertext'],
            ['Decryption', 'Restores ciphertext to plaintext'],
            ['Encoding', 'Converts data into a standard format without providing security'],
            ['Hashing', 'Creates a fixed-length digest for integrity verification'],
            ['Cryptographic Key', 'Secret value used by an algorithm'],
            ['Cryptographic Algorithm', 'Mathematical procedure used to secure information'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Data Protection States',
        body:
            'Enterprise information typically exists in one of three '
            'states, each requiring different security controls: Data '
            'at Rest, Data in Transit, and Data in Use. Protecting all '
            'three states is a fundamental principle of enterprise '
            'security.',
      ),
      LessonSection(
        heading: 'Data at Rest',
        body:
            'Data at Rest refers to information stored on physical or '
            'virtual storage media — examples include hard drives, SSDs, '
            'databases, backup media, cloud storage, and USB drives. '
            'Although this data is not actively moving across networks, '
            'it remains vulnerable to theft, unauthorized access, or '
            'device loss. Organizations commonly protect data at rest '
            'using full-disk encryption, database encryption, file '
            'encryption, storage encryption, and hardware encryption.',
      ),
      LessonSection(
        heading: 'Data in Transit',
        body:
            'Data in Transit refers to information moving between '
            'systems across a network — examples include web browsing, '
            'email, VPN traffic, cloud synchronization, file transfers, '
            'and API communications. Without encryption, attackers may '
            'intercept or modify data during transmission. Organizations '
            'typically protect data in transit using TLS/HTTPS, SSH, '
            'IPsec, VPN encryption, and secure email protocols.',
      ),
      LessonSection(
        heading: 'Data in Use',
        body:
            'Data in Use refers to information currently being '
            'processed by applications or accessed by users — examples '
            'include documents opened on a workstation, data processed '
            'by applications, database queries, and files loaded into '
            'memory. Because data must often be decrypted before '
            'processing, protecting data in use is more challenging than '
            'protecting stored or transmitted information. Organizations '
            'use controls such as memory protection, Trusted Execution '
            'Environments (TEE), secure enclaves, application isolation, '
            'and access controls to reduce the risk of unauthorized '
            'access while data is actively being processed.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/data_protection_states.jpg',
          caption:
              'Enterprise information exists in three primary states, '
              'each requiring appropriate security controls and '
              'cryptographic protections.',
        ),
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Cryptographic Keys & Algorithms',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 13,
    sections: [
      LessonSection(
        heading: 'Cryptographic Keys',
        body:
            'A cryptographic key is a value used by an encryption '
            'algorithm to transform plaintext into ciphertext and, where '
            'applicable, restore ciphertext back into plaintext. The '
            'security of encrypted information depends primarily on the '
            'protection of the cryptographic key rather than the secrecy '
            'of the encryption algorithm.',
      ),
      LessonSection(
        body: 'Keys may be:',
        bullets: [
          'Shared between communicating parties (symmetric encryption)',
          'Public and private key pairs (asymmetric encryption)',
        ],
      ),
      LessonSection(
        body: 'Proper key management includes:',
        bullets: [
          'Secure generation',
          'Secure storage',
          'Controlled distribution',
          'Regular rotation',
          'Timely revocation',
          'Secure destruction',
        ],
      ),
      LessonSection(
        body:
            'Compromised cryptographic keys can render even the '
            'strongest encryption algorithms ineffective.',
      ),
      LessonSection(
        heading: 'Key Length',
        body:
            'The key length refers to the number of bits used in a '
            'cryptographic key. Generally, longer keys provide greater '
            'resistance to brute-force attacks because they increase the '
            'number of possible key combinations. Examples include '
            'AES-128, AES-192, AES-256, RSA-2048, RSA-3072, and '
            'RSA-4096. While longer keys improve security, they may also '
            'require additional processing resources. Organizations '
            'therefore select key lengths that balance security and '
            'performance based on their operational requirements.',
      ),
      LessonSection(
        heading: 'Cryptographic Algorithms',
        body:
            'A cryptographic algorithm is a mathematical procedure used '
            'to encrypt, decrypt, hash, or digitally sign information. '
            'Modern algorithms are publicly documented and extensively '
            'evaluated by the security community. Examples include AES, '
            'ChaCha20, RSA, Elliptic Curve Cryptography (ECC), SHA-256, '
            'and SHA-3. The security of these algorithms depends on '
            'proper implementation and secure key management rather than '
            'keeping the algorithm itself secret.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global financial institution encrypts customer databases '
            'using AES to protect data at rest, secures online banking '
            'sessions with TLS to protect data in transit, and stores '
            'user passwords as cryptographic hashes rather than '
            'plaintext. Email attachments are encoded using Base64 for '
            'reliable transmission, but the organization relies on '
            'encryption — not encoding — to protect confidential '
            'financial information.',
      ),
      LessonSection(
        body:
            'When auditors review the institution\'s security controls, '
            'they verify that encryption is applied to stored and '
            'transmitted data, password hashes are generated using '
            'approved hashing algorithms, and cryptographic keys are '
            'managed through centralized key management procedures.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use encryption to protect confidential information',
          'Do not rely on encoding for security',
          'Store passwords using strong cryptographic hashing algorithms',
          'Encrypt data at rest and data in transit',
          'Protect cryptographic keys throughout their lifecycle',
          'Use industry-approved algorithms and recommended key lengths',
          'Review cryptographic implementations periodically to ensure compliance with current security standards',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Encoding improves data compatibility, encryption protects '
            'confidentiality, and hashing verifies integrity. Selecting '
            'the correct technique for each security objective is '
            'essential to building secure enterprise systems.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Symmetric Encryption Fundamentals',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'What Is Symmetric Encryption?',
        body:
            'Symmetric encryption, also known as secret-key encryption, '
            'is a cryptographic technique in which the same secret key '
            'is used for both encryption and decryption. When a sender '
            'encrypts data, the encryption algorithm combines the '
            'plaintext with the secret key to produce ciphertext. The '
            'recipient then uses the identical key to reverse the '
            'process and recover the original plaintext. Because both '
            'parties must possess the same secret key, protecting and '
            'distributing that key securely is one of the most important '
            'challenges in symmetric cryptography.',
      ),
      LessonSection(
        body: 'The basic process consists of four steps:',
        bullets: [
          'The sender prepares the plaintext',
          'The plaintext is encrypted using a secret key',
          'The encrypted ciphertext is transmitted or stored',
          'The recipient decrypts the ciphertext using the same secret key',
        ],
      ),
      LessonSection(
        body:
            'If an unauthorized individual obtains the secret key, the '
            'confidentiality of the encrypted information is '
            'compromised.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/symmetric_encryption_process.jpg',
          caption:
              'In symmetric encryption, the same secret key is used to '
              'encrypt and decrypt information.',
        ),
      ),
      LessonSection(
        heading: 'High Performance & Efficient Resource Usage',
        body:
            'Symmetric algorithms are significantly faster than '
            'asymmetric algorithms because they require fewer '
            'mathematical operations. This makes them ideal for '
            'encrypting large files, database records, backup media, '
            'cloud storage, network traffic, and disk volumes. Symmetric '
            'encryption also consumes relatively little CPU and memory '
            'compared to public-key cryptography, allowing organizations '
            'to encrypt massive amounts of information without '
            'significantly affecting system performance.',
      ),
      LessonSection(
        heading: 'Strong Confidentiality & the Key Distribution Challenge',
        body:
            'Modern symmetric algorithms provide excellent protection '
            'against unauthorized disclosure when implemented correctly '
            'and combined with secure key management. Widely accepted '
            'algorithms such as AES are considered computationally '
            'secure against practical attacks when appropriate key '
            'lengths are used.',
      ),
      LessonSection(
        body:
            'One of the primary disadvantages of symmetric encryption is '
            'secure key distribution. Before encrypted communication can '
            'begin, both parties must possess the same secret key. '
            'Transmitting this key over an insecure network could expose '
            'it to attackers. Consequently, organizations often use '
            'asymmetric cryptography to exchange symmetric keys securely '
            'before encrypting data.',
      ),
      LessonSection(
        heading: 'Common Enterprise Uses',
        body:
            'Because of its speed and efficiency, symmetric encryption '
            'is used extensively throughout enterprise environments — '
            'full-disk encryption, database encryption, cloud storage '
            'encryption, file encryption, backup encryption, wireless '
            'network encryption, VPNs, secure messaging, and TLS session '
            'encryption. In many cases, users are unaware that symmetric '
            'encryption is protecting their information because the '
            'encryption and decryption processes occur automatically.',
      ),
      LessonSection(
        heading: 'Block Ciphers',
        body:
            'Most enterprise symmetric encryption algorithms are '
            'implemented as block ciphers. A block cipher divides '
            'plaintext into fixed-size blocks and encrypts each block '
            'individually. For example, the Advanced Encryption Standard '
            '(AES) processes data in 128-bit blocks, regardless of the '
            'encryption key length. Block ciphers are commonly used '
            'because they provide strong security and are well suited '
            'for encrypting files, storage devices, and structured data.',
      ),
      LessonSection(
        body: 'Characteristics of block ciphers include:',
        bullets: [
          'Fixed-size input blocks',
          'Predictable processing',
          'Strong resistance to cryptanalysis',
          'Efficient handling of stored data',
        ],
      ),
      LessonSection(
        body:
            'Because information is encrypted one block at a time, '
            'different operating modes (known as cipher modes) are used '
            'to improve security and performance.',
      ),
      LessonSection(
        heading: 'Stream Ciphers',
        body:
            'Unlike block ciphers, stream ciphers encrypt information '
            'one bit or one byte at a time as data is transmitted. '
            'Instead of dividing information into fixed-size blocks, '
            'stream ciphers generate a continuous stream of pseudorandom '
            'bits known as a keystream. Each bit of plaintext is '
            'combined with the keystream to produce ciphertext.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/stream_cipher_process.jpg',
          caption:
              'Stream ciphers combine plaintext with a continuous '
              'pseudorandom keystream, encrypting data one bit or byte '
              'at a time rather than in fixed blocks.',
        ),
      ),
      LessonSection(
        heading: 'Advanced Encryption Standard (AES)',
        body:
            'The Advanced Encryption Standard (AES) is the most widely '
            'used symmetric encryption algorithm in modern computing. '
            'AES was selected by the U.S. National Institute of '
            'Standards and Technology (NIST) in 2001 to replace the '
            'aging Data Encryption Standard (DES). Today, AES is used by '
            'governments, financial institutions, healthcare providers, '
            'cloud service providers, and enterprises worldwide.',
      ),
      LessonSection(
        body:
            'AES supports three key lengths — 128, 192, and 256 bits. '
            'Although all three variants use the same 128-bit block '
            'size, longer keys provide greater resistance to '
            'brute-force attacks. AES is used in numerous technologies, '
            'including HTTPS, TLS, BitLocker, FileVault, WPA2/WPA3, '
            'VPNs, cloud storage, and database encryption. Its '
            'combination of strong security, high performance, and '
            'widespread hardware support has made AES the industry '
            'standard for symmetric encryption.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational engineering company encrypts employee '
            'laptops using BitLocker with AES-256. Customer databases '
            'stored in the organization\'s private cloud are also '
            'encrypted using AES, while remote employees connect through '
            'VPN tunnels protected with symmetric session keys '
            'established during the TLS handshake.',
      ),
      LessonSection(
        body:
            'Because symmetric encryption provides high performance, '
            'employees experience minimal delay when opening encrypted '
            'files, accessing databases, or transmitting confidential '
            'engineering designs. At the same time, the organization '
            'protects sensitive intellectual property from unauthorized '
            'disclosure if devices are lost or network communications '
            'are intercepted.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use AES as the default symmetric encryption algorithm',
          'Protect secret keys using secure key management systems',
          'Replace DES and 3DES in legacy environments whenever possible',
          'Use strong key lengths appropriate for organizational requirements',
          'Combine symmetric encryption with secure key exchange mechanisms',
          'Rotate encryption keys according to organizational policy',
          'Encrypt sensitive information both at rest and in transit',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'The security of symmetric encryption depends not only on '
            'the strength of the algorithm but also on the protection of '
            'the secret key. Secure key generation, storage, '
            'distribution, and rotation are essential components of an '
            'effective encryption strategy.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Legacy Algorithms, Cipher Modes & IVs',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Data Encryption Standard (DES)',
        body:
            'The Data Encryption Standard (DES) was one of the first '
            'widely adopted symmetric encryption algorithms. Developed '
            'during the 1970s and standardized by the U.S. government in '
            '1977, DES became the dominant encryption algorithm for '
            'commercial and government applications for many years. DES '
            'characteristics include a symmetric block cipher design, a '
            '64-bit block size, a 56-bit effective key length, a Feistel '
            'network design, and sixteen encryption rounds.',
      ),
      LessonSection(
        body:
            'Although DES was considered highly secure when introduced, '
            'advances in computing power eventually made it vulnerable '
            'to brute-force attacks. Today, DES is considered obsolete '
            'and should not be used to protect sensitive information. '
            'Organizations may still encounter DES in legacy systems '
            'that have not yet been modernized.',
      ),
      LessonSection(
        heading: 'Triple DES (3DES)',
        body:
            'To extend the useful life of DES without completely '
            'redesigning the algorithm, Triple DES (3DES) was '
            'introduced. Rather than encrypting data once, 3DES performs '
            'the DES algorithm three consecutive times using either two '
            'or three cryptographic keys. This significantly increases '
            'security compared to DES while remaining compatible with '
            'existing implementations.',
      ),
      LessonSection(
        body:
            'Despite improvements such as a larger effective key length '
            'and greater resistance to brute-force attacks, 3DES has '
            'several disadvantages: slower performance than AES, higher '
            'computational requirements, a smaller block size than '
            'modern algorithms, and deprecation for many new '
            'implementations. Most organizations have now replaced 3DES '
            'with AES.',
      ),
      LessonSection(
        heading: 'ChaCha20',
        body:
            'ChaCha20 is a modern symmetric stream cipher designed to '
            'provide strong security with excellent performance across a '
            'wide range of hardware platforms. Unlike AES, which is a '
            'block cipher, ChaCha20 encrypts information as a continuous '
            'stream of data. ChaCha20 offers high performance on mobile '
            'devices, efficient software implementation, low memory '
            'requirements, strong resistance to known cryptographic '
            'attacks, and suitability for systems without hardware AES '
            'acceleration.',
      ),
      LessonSection(
        body:
            'ChaCha20 is commonly used in TLS communications, secure '
            'messaging applications, mobile devices, embedded systems, '
            'and Internet of Things (IoT) devices. Because of its '
            'efficiency, ChaCha20 is often preferred on devices where '
            'hardware acceleration for AES is unavailable.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Algorithm', 'Type', 'Status', 'Typical Use'],
          tableRows: [
            ['AES', 'Block Cipher', 'Current Standard', 'Enterprise encryption, VPNs, TLS, storage'],
            ['ChaCha20', 'Stream Cipher', 'Current Standard', 'Mobile devices, secure messaging, TLS'],
            ['3DES', 'Block Cipher', 'Legacy', 'Older enterprise applications'],
            ['DES', 'Block Cipher', 'Obsolete', 'Historical reference only'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Cipher Modes',
        body:
            'Block ciphers encrypt information in fixed-size blocks. '
            'However, simply encrypting one block after another is '
            'insufficient for many real-world applications. To improve '
            'security and support different operational requirements, '
            'block ciphers use cipher modes. A cipher mode defines how '
            'individual plaintext blocks are processed and how they '
            'relate to one another during encryption. Common cipher '
            'modes include ECB, CBC, CTR, and GCM — each offering '
            'different security and performance characteristics.',
      ),
      LessonSection(
        heading: 'Electronic Codebook (ECB)',
        body:
            'Electronic Codebook (ECB) encrypts each plaintext block '
            'independently using the same cryptographic key. Although '
            'ECB is simple and efficient, identical plaintext blocks '
            'produce identical ciphertext blocks. As a result, attackers '
            'may identify patterns within encrypted information. Because '
            'of this weakness, ECB is generally not recommended for '
            'encrypting sensitive enterprise data.',
      ),
      LessonSection(
        heading: 'Cipher Block Chaining (CBC)',
        body:
            'Cipher Block Chaining (CBC) improves security by combining '
            'each plaintext block with the previous ciphertext block '
            'before encryption. This process ensures that identical '
            'plaintext blocks generate different ciphertext when '
            'encrypted within different positions. CBC requires an '
            'Initialization Vector (IV) to encrypt the first block. CBC '
            'provides stronger confidentiality than ECB but cannot '
            'encrypt blocks independently, making parallel processing '
            'less efficient.',
      ),
      LessonSection(
        heading: 'Counter Mode (CTR)',
        body:
            'Counter Mode (CTR) converts a block cipher into a '
            'stream-like encryption process. Instead of encrypting '
            'plaintext directly, CTR encrypts a continuously changing '
            'counter value to generate a keystream. Advantages include '
            'high performance, parallel encryption, parallel decryption, '
            'and suitability for high-speed applications. CTR is widely '
            'used in enterprise systems requiring efficient encryption.',
      ),
      LessonSection(
        heading: 'Galois/Counter Mode (GCM)',
        body:
            'Galois/Counter Mode (GCM) combines the performance '
            'advantages of Counter Mode with built-in integrity '
            'verification. In addition to confidentiality, GCM provides '
            'authenticated encryption, allowing systems to detect '
            'unauthorized modifications. Benefits include high '
            'performance, parallel processing, confidentiality, '
            'integrity protection, and authentication.',
      ),
      LessonSection(
        body:
            'Because of these advantages, GCM is commonly used with '
            'TLS, HTTPS, VPNs, cloud services, and enterprise storage '
            'systems. Today, AES-GCM is one of the most widely deployed '
            'encryption configurations.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/cipher_modes_comparison.jpg',
          caption:
              'Different cipher modes provide varying levels of '
              'confidentiality, integrity, and performance depending on '
              'enterprise security requirements.',
        ),
      ),
      LessonSection(
        heading: 'Initialization Vectors (IVs)',
        body:
            'Many cipher modes require an Initialization Vector (IV). '
            'An IV is a random or unique value used during encryption to '
            'ensure that identical plaintext encrypted with the same key '
            'produces different ciphertext.',
      ),
      LessonSection(
        body: 'Important characteristics of Initialization Vectors include:',
        bullets: [
          'Unique for each encryption operation',
          'Not required to remain secret',
          'Prevent predictable ciphertext patterns',
          'Improve resistance against cryptographic attacks',
        ],
      ),
      LessonSection(
        body:
            'Reusing an IV with the same encryption key can '
            'significantly weaken security. Organizations should '
            'therefore generate IVs using secure random number '
            'generators.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/iv_randomness.jpg',
          caption:
              'Initialization Vectors introduce randomness into '
              'encryption operations, preventing identical plaintext '
              'blocks from producing identical ciphertext when the same '
              'key is reused.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Performance Considerations',
        body:
            'Selecting a symmetric encryption algorithm involves '
            'balancing security, performance, and compatibility. '
            'Organizations typically consider encryption speed, CPU '
            'utilization, memory consumption, hardware acceleration, '
            'scalability, regulatory requirements, and legacy '
            'compatibility. For example, AES is preferred for enterprise '
            'servers, storage systems, and hardware-accelerated '
            'environments; ChaCha20 performs particularly well on mobile '
            'devices and embedded systems without dedicated cryptographic '
            'hardware; and AES-GCM is commonly selected for secure '
            'network communications because it provides both '
            'confidentiality and integrity.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational financial institution encrypts customer '
            'databases using AES-256 in GCM mode to provide both '
            'confidentiality and integrity. Legacy payment processing '
            'systems that still depend on 3DES are isolated within '
            'dedicated network segments while migration plans are '
            'implemented.',
      ),
      LessonSection(
        body:
            'The institution also secures its mobile banking application '
            'using ChaCha20-Poly1305 on devices without hardware AES '
            'acceleration, ensuring efficient encryption without '
            'compromising security. Regular cryptographic assessments '
            'identify legacy algorithms and prioritize their replacement '
            'with modern standards.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use AES or ChaCha20 for new deployments',
          'Replace DES and 3DES wherever feasible',
          'Prefer authenticated encryption modes such as AES-GCM',
          'Never reuse Initialization Vectors with the same key',
          'Generate IVs using secure random number generators',
          'Protect encryption keys with centralized key management',
          'Review cryptographic configurations regularly to identify deprecated algorithms',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Selecting a strong encryption algorithm is only part of a '
            'secure implementation. Cipher modes, Initialization '
            'Vectors, and proper key management are equally important in '
            'ensuring the confidentiality and integrity of encrypted '
            'information.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Asymmetric Encryption Fundamentals',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'The Key Distribution Problem',
        body:
            'Symmetric encryption provides excellent performance and is '
            'ideal for protecting large volumes of data. However, it '
            'introduces a significant challenge: both communicating '
            'parties must securely exchange and protect the same secret '
            'key before encrypted communication can begin. As '
            'organizations expanded their networks and began '
            'communicating over the Internet, securely distributing '
            'secret keys became increasingly difficult. To address this '
            'limitation, cryptographers developed asymmetric encryption, '
            'also known as public-key cryptography.',
      ),
      LessonSection(
        body:
            'Unlike symmetric encryption, asymmetric encryption uses two '
            'mathematically related keys — a public key and a private '
            'key. This innovation allows secure communication without '
            'requiring the secret encryption key to be shared '
            'beforehand. Asymmetric encryption forms the foundation of '
            'many enterprise security technologies, including Public Key '
            'Infrastructure (PKI), digital certificates, Secure Sockets '
            'Layer/Transport Layer Security (SSL/TLS), digital '
            'signatures, secure email, VPN authentication, and secure '
            'software distribution.',
      ),
      LessonSection(
        heading: 'What Is Asymmetric Encryption?',
        body:
            'Asymmetric encryption is a cryptographic method that uses a '
            'pair of mathematically related keys — a public key and a '
            'private key. The public key can be shared openly with '
            'anyone and is typically used to encrypt data or verify '
            'digital signatures. The private key is kept secret by its '
            'owner and is used to decrypt encrypted data or create '
            'digital signatures. Although the keys are mathematically '
            'related, it is computationally impractical to derive the '
            'private key from the corresponding public key using current '
            'technology. This separation of keys eliminates the need to '
            'exchange secret encryption keys over untrusted networks.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/asymmetric_key_pair.jpg',
          caption:
              'In asymmetric encryption, data encrypted with the '
              'recipient\'s public key can only be decrypted using the '
              'corresponding private key.',
        ),
      ),
      LessonSection(
        heading: 'Public Key',
        body:
            'The public key is intended to be distributed freely. '
            'Organizations often publish public keys through digital '
            'certificates, Certificate Authorities (CAs), public key '
            'servers, enterprise directories, and web services. Because '
            'the public key is not secret, anyone can use it to encrypt '
            'information intended for its owner. However, possessing the '
            'public key does not allow someone to decrypt encrypted '
            'information — only the corresponding private key can '
            'perform that operation.',
      ),
      LessonSection(
        heading: 'Private Key',
        body:
            'The private key is the most sensitive component of an '
            'asymmetric cryptographic system. Only the key owner should '
            'have access to the private key. Organizations typically '
            'protect private keys using Hardware Security Modules '
            '(HSMs), Trusted Platform Modules (TPMs), secure key vaults, '
            'smart cards, and encrypted key stores. If a private key is '
            'compromised, attackers may decrypt confidential information '
            'or impersonate the legitimate owner. Protecting private '
            'keys is therefore one of the most important responsibilities '
            'within a Public Key Infrastructure (PKI).',
      ),
      LessonSection(
        heading: 'Key Pair Relationship',
        body:
            'The public and private keys together form a key pair. '
            'Although mathematically related, the two keys perform '
            'opposite operations: data encrypted with the public key can '
            'only be decrypted using the private key, and data digitally '
            'signed using the private key can be verified using the '
            'public key. This complementary relationship enables secure '
            'communication without requiring a shared secret key.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/public_private_key_pair.jpg',
          caption:
              'A public key and private key form a complementary key '
              'pair that enables secure encryption and digital '
              'signatures.',
        ),
      ),
      LessonSection(
        heading: 'How Asymmetric Encryption Works',
        body:
            'Suppose Alice wants to send confidential information to '
            'Bob. Bob generates a public/private key pair, shares his '
            'public key with Alice, and Alice encrypts the message using '
            'Bob\'s public key. The encrypted message is transmitted over '
            'the Internet, and Bob decrypts the message using his '
            'private key. Even if an attacker intercepts the encrypted '
            'message, it cannot be decrypted without Bob\'s private key. '
            'This capability makes asymmetric encryption particularly '
            'valuable for secure communications over untrusted networks.',
      ),
      LessonSection(
        heading: 'Advantages of Asymmetric Encryption',
        body:
            'Secure Key Distribution: public keys can be distributed '
            'openly without compromising security, eliminating the need '
            'to exchange secret encryption keys over insecure '
            'communication channels.',
      ),
      LessonSection(
        body:
            'Supports Digital Signatures: asymmetric cryptography '
            'enables digital signatures, allowing recipients to verify '
            'both the origin and integrity of information — widely used '
            'for software publishing, electronic contracts, secure '
            'email, financial transactions, and regulatory compliance.',
      ),
      LessonSection(
        body:
            'Authentication: public-key cryptography helps verify the '
            'identity of users, servers, and applications. Digital '
            'certificates use public keys to authenticate websites, VPN '
            'gateways, cloud services, and enterprise applications.',
      ),
      LessonSection(
        body:
            'Scalability: in large organizations, managing symmetric '
            'keys between thousands of users becomes impractical. '
            'Asymmetric encryption simplifies key management because '
            'each user maintains only one key pair, significantly '
            'improving scalability for enterprise deployments.',
      ),
      LessonSection(
        heading: 'Limitations of Asymmetric Encryption',
        body:
            'Slower Performance: public-key cryptography requires '
            'significantly more computational resources than symmetric '
            'encryption. Encrypting large files entirely with asymmetric '
            'algorithms would be inefficient.',
      ),
      LessonSection(
        body:
            'Larger Key Sizes: asymmetric algorithms require much larger '
            'keys than symmetric algorithms to provide comparable levels '
            'of security. For example, AES-256 uses a 256-bit key, while '
            'RSA commonly uses 2048-bit or 3072-bit keys.',
      ),
      LessonSection(
        heading: 'Hybrid Encryption',
        body:
            'Because of its computational cost, asymmetric encryption is '
            'typically used only for secure key exchange, authentication, '
            'and digital signatures. After a secure session has been '
            'established, a symmetric session key is exchanged and used '
            'for encrypting the actual data. This combination is known '
            'as hybrid encryption and is used extensively by TLS, HTTPS, '
            'VPNs, and many secure communication protocols.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Symmetric Encryption', 'Asymmetric Encryption'],
          tableRows: [
            ['Keys Used', 'One shared secret key', 'Public key and private key'],
            ['Encryption Speed', 'Very fast', 'Slower'],
            ['Key Distribution', 'Difficult', 'Easier'],
            ['Typical Use', 'Data encryption', 'Key exchange, authentication, digital signatures'],
            ['Scalability', 'Lower', 'Higher'],
            ['Enterprise Examples', 'AES, ChaCha20', 'RSA, ECC'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global e-commerce company secures customer transactions '
            'using HTTPS. When a customer visits the company\'s website, '
            'the web server presents a digital certificate containing '
            'its public key. The customer\'s browser verifies the '
            'certificate and uses the public key during the TLS '
            'handshake to establish a secure session. Once authentication '
            'and key exchange are complete, both the browser and server '
            'switch to symmetric encryption using a temporary session key '
            'to efficiently protect all subsequent communication.',
      ),
      LessonSection(
        body:
            'This hybrid approach combines the scalability of asymmetric '
            'cryptography with the performance of symmetric encryption, '
            'enabling secure and efficient online transactions.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Protect private keys using secure hardware or encrypted key storage',
          'Distribute public keys through trusted Certificate Authorities (CAs)',
          'Use asymmetric encryption primarily for key exchange, authentication, and digital signatures',
          'Combine asymmetric and symmetric encryption for optimal performance',
          'Use recommended key lengths that meet current security standards',
          'Rotate and revoke compromised key pairs promptly',
          'Monitor access to private keys and key management systems',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'The confidentiality of asymmetric encryption depends on '
            'protecting the private key. If a private key is exposed, '
            'attackers may decrypt confidential information or '
            'impersonate the legitimate key owner, even though the '
            'public key remains secure.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'RSA, Diffie-Hellman, ECC & ECDH',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'RSA',
        body:
            'RSA is one of the oldest and most widely deployed '
            'asymmetric cryptographic algorithms. Named after its '
            'inventors — Ron Rivest, Adi Shamir, and Leonard Adleman — '
            'RSA has been a cornerstone of enterprise security since its '
            'introduction in 1977. RSA supports both encryption and '
            'digital signatures. Unlike symmetric encryption, RSA uses a '
            'mathematically related public/private key pair.',
      ),
      LessonSection(
        body:
            'Typical RSA key sizes include 2048, 3072, and 4096 bits. '
            'Larger keys provide greater resistance against brute-force '
            'attacks but require additional processing time. RSA is '
            'commonly used for TLS certificates, secure email, digital '
            'signatures, Public Key Infrastructure (PKI), secure '
            'software updates, and VPN authentication.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/rsa_encryption.jpg',
          caption:
              'RSA uses the recipient\'s public key to encrypt '
              'information and the recipient\'s private key to decrypt '
              'it.',
        ),
      ),
      LessonSection(
        body:
            'Although RSA remains widely used, many organizations are '
            'gradually adopting Elliptic Curve Cryptography (ECC) '
            'because it provides equivalent security with much smaller '
            'keys.',
      ),
      LessonSection(
        heading: 'Diffie-Hellman (DH)',
        body:
            'Unlike RSA, Diffie-Hellman (DH) is not primarily an '
            'encryption algorithm. Instead, it is a key exchange '
            'algorithm that allows two parties to establish a shared '
            'secret over an untrusted network. Before Diffie-Hellman was '
            'developed, communicating parties needed to exchange '
            'encryption keys through secure channels. Diffie-Hellman '
            'enables both parties to independently calculate the same '
            'shared secret without transmitting that secret across the '
            'network. The shared secret is then used as the symmetric '
            'encryption key for subsequent communication.',
      ),
      LessonSection(
        body:
            'Diffie-Hellman is commonly used in TLS handshakes, VPN '
            'connections, SSH, and secure messaging applications. Because '
            'only public values are exchanged, attackers observing the '
            'communication cannot easily determine the shared secret.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/diffie_hellman_exchange.jpg',
          caption:
              'Diffie-Hellman allows two parties to independently '
              'calculate the same shared secret without transmitting the '
              'secret itself across the network.',
        ),
      ),
      LessonSection(
        heading: 'Elliptic Curve Cryptography (ECC)',
        body:
            'Elliptic Curve Cryptography (ECC) is a modern form of '
            'public-key cryptography based on the mathematics of '
            'elliptic curves. ECC provides security comparable to RSA '
            'while using much smaller key sizes — for example, ECC '
            '256-bit keys provide security roughly equivalent to RSA '
            '3072-bit keys.',
      ),
      LessonSection(
        body:
            'Advantages of ECC include smaller keys, faster '
            'computations, lower bandwidth requirements, reduced memory '
            'usage, and improved performance on mobile devices. Because '
            'of these benefits, ECC is widely adopted in mobile devices, '
            'smart cards, Internet of Things (IoT), cloud computing, '
            'wireless networks, and modern TLS implementations.',
      ),
      LessonSection(
        heading: 'Elliptic Curve Diffie-Hellman (ECDH)',
        body:
            'Elliptic Curve Diffie-Hellman (ECDH) combines the '
            'efficiency of elliptic curve mathematics with the '
            'Diffie-Hellman key exchange process. ECDH enables two '
            'parties to establish a shared secret while benefiting from '
            'ECC\'s smaller key sizes and improved performance. '
            'Advantages include faster key exchange, lower computational '
            'overhead, smaller certificates, better scalability, and '
            'improved mobile performance. ECDH is widely used in TLS '
            '1.3, HTTPS, VPNs, secure messaging applications, and cloud '
            'services.',
      ),
      LessonSection(
        heading: 'Hybrid Encryption in Practice',
        body:
            'Although asymmetric encryption provides secure key exchange '
            'and authentication, it is significantly slower than '
            'symmetric encryption. For this reason, modern secure '
            'communication protocols use a hybrid encryption approach. '
            'The process typically follows these steps:',
        bullets: [
          'The client obtains the server\'s public key through a digital certificate',
          'The client and server perform an asymmetric key exchange (such as RSA or ECDH)',
          'Both parties establish a temporary symmetric session key',
          'All subsequent application data is encrypted using a fast symmetric algorithm such as AES or ChaCha20',
        ],
      ),
      LessonSection(
        body:
            'This approach combines the strengths of both cryptographic '
            'methods: secure key exchange and efficient data encryption. '
            'Hybrid encryption is used in HTTPS, TLS, VPNs, secure '
            'email, and cloud services.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/hybrid_encryption_tls.jpg',
          caption:
              'Modern TLS uses asymmetric cryptography to establish a '
              'shared session key and symmetric encryption to protect '
              'subsequent communications.',
        ),
      ),
      LessonSection(
        heading: 'Comparing Common Asymmetric Algorithms',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Algorithm', 'Primary Purpose', 'Typical Enterprise Use'],
          tableRows: [
            ['RSA', 'Encryption and digital signatures', 'PKI, TLS certificates, secure email'],
            ['Diffie–Hellman (DH)', 'Key exchange', 'VPNs, SSH, TLS'],
            ['ECC', 'Encryption and digital signatures', 'Mobile devices, cloud services'],
            ['ECDH', 'Key exchange', 'TLS 1.3, HTTPS, VPNs'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Performance Considerations',
        body:
            'When selecting an asymmetric cryptographic algorithm, '
            'organizations evaluate security strength, key size, '
            'processing overhead, certificate size, network bandwidth, '
            'mobile device performance, and regulatory requirements. In '
            'many enterprise environments, RSA continues to support '
            'legacy applications and digital certificates, ECC is '
            'increasingly preferred for new deployments due to its '
            'smaller keys and improved efficiency, and ECDH has become '
            'the standard key exchange mechanism in TLS 1.3.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational cloud services provider secures customer '
            'connections using TLS 1.3. When a client connects to the '
            'provider\'s web portal, the server presents an ECC-based '
            'digital certificate. The client and server perform an '
            'Elliptic Curve Diffie-Hellman (ECDH) key exchange to '
            'establish a shared session key. Once the handshake is '
            'complete, all application traffic is encrypted using '
            'AES-GCM.',
      ),
      LessonSection(
        body:
            'By combining ECC, ECDH, and symmetric encryption, the '
            'provider delivers secure communication with reduced latency '
            'and improved performance for customers accessing services '
            'from desktop systems, mobile devices, and IoT platforms.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use RSA or ECC key sizes that meet current security recommendations',
          'Prefer ECC for new deployments when supported',
          'Use ECDH for secure key exchange in modern TLS implementations',
          'Protect private keys using Hardware Security Modules (HSMs) or secure key vaults',
          'Replace outdated cryptographic configurations during system upgrades',
          'Rotate key pairs according to organizational policy',
          'Regularly review certificate lifecycles and cryptographic standards',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Asymmetric cryptography is most effective when combined '
            'with symmetric encryption. Public-key algorithms establish '
            'trust and exchange keys securely, while symmetric '
            'algorithms provide the speed required to protect large '
            'volumes of enterprise data.',
      ),
    ],
  ),

  // 10 ---------------------------------------------------------------------
  Lesson(
    title: 'Cryptographic Hash Functions',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Beyond Confidentiality',
        body:
            'Encryption protects the confidentiality of information by '
            'preventing unauthorized users from reading sensitive data. '
            'However, encryption alone cannot determine whether data has '
            'been modified or verify who created it. Organizations also '
            'need mechanisms to ensure that information remains unchanged '
            'during storage or transmission and that the origin of '
            'digital content can be verified.',
      ),
      LessonSection(
        body:
            'To address these requirements, modern cryptographic systems '
            'use cryptographic hash functions and digital signatures. '
            'Hash functions provide a reliable method for verifying data '
            'integrity, while digital signatures combine hashing with '
            'asymmetric cryptography to authenticate the source of '
            'information and provide non-repudiation.',
      ),
      LessonSection(
        body:
            'Hashing is used extensively throughout enterprise '
            'environments. It protects passwords, verifies software '
            'downloads, detects file tampering, supports digital '
            'certificates, validates backups, and forms a critical '
            'component of Public Key Infrastructure (PKI). Understanding '
            'hashing is essential before learning how digital signatures '
            'and certificates establish trust in modern networks.',
      ),
      LessonSection(
        heading: 'What Is a Cryptographic Hash Function?',
        body:
            'A cryptographic hash function is a mathematical algorithm '
            'that converts data of any size into a fixed-length value '
            'called a hash, hash value, or message digest. Unlike '
            'encryption, hashing is a one-way process — once data has '
            'been transformed into a hash value, the original '
            'information cannot be reconstructed from the hash.',
      ),
      LessonSection(
        body:
            'A one-page document, a 10 GB database, a video file, and a '
            'password can all be processed by a hash function, producing '
            'fixed-length outputs depending on the algorithm used. '
            'Organizations use cryptographic hashes to verify that '
            'information has not been modified, intentionally or '
            'accidentally.',
      ),
      LessonSection(
        heading: 'How Hashing Works',
        body:
            'When a file or message is processed by a cryptographic hash '
            'function, the algorithm performs complex mathematical '
            'operations on the input data and generates a fixed-length '
            'hash value.',
      ),
      LessonSection(
        body: 'The process follows these basic steps:',
        bullets: [
          'Original data is supplied to the hash function',
          'The hash function performs mathematical transformations',
          'A fixed-length message digest is generated',
          'The resulting hash is stored or transmitted',
          'The receiving system calculates a new hash from the received data',
          'If both hash values match, the data is considered unchanged',
        ],
      ),
      LessonSection(
        body:
            'Because even the smallest modification produces a different '
            'hash value, organizations can quickly detect unauthorized '
            'changes.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/hash_function_process.jpg',
          caption:
              'A cryptographic hash function converts data of any size '
              'into a fixed-length hash value that uniquely represents '
              'the contents of the original data.',
        ),
      ),
      LessonSection(
        heading: 'Deterministic Output & Fixed-Length Output',
        body:
            'The same input always produces the same hash value — '
            'hashing an identical file multiple times using SHA-256 '
            'always generates the same output, enabling systems to '
            'verify file integrity reliably. Regardless of the size of '
            'the original input, the hash value always has the same '
            'length: SHA-256 produces a 256-bit hash, SHA-512 produces a '
            '512-bit hash, and this holds whether the original file is '
            'one kilobyte or several gigabytes.',
      ),
      LessonSection(
        heading: 'One-Way Function & Avalanche Effect',
        body:
            'Hash functions are designed so that it is computationally '
            'infeasible to recover the original data from the hash value '
            '— this property makes hashing suitable for password storage '
            'and integrity verification. A small change in the input '
            'data also produces a dramatically different hash value: '
            'changing a single character in a document results in an '
            'entirely different SHA-256 hash, enabling rapid detection of '
            'unauthorized modifications.',
      ),
      LessonSection(
        heading: 'Collision Resistance',
        body:
            'A collision occurs when two different inputs generate the '
            'same hash value. A secure cryptographic hash function makes '
            'finding such collisions computationally impractical. '
            'Collision resistance is essential for digital signatures, '
            'certificate validation, software verification, and password '
            'security.',
      ),
      LessonSection(
        heading: 'Common Applications of Hashing',
        body:
            'Hash functions are used throughout enterprise environments '
            'for many different security purposes.',
      ),
      LessonSection(
        heading: 'Password Storage & File Integrity Verification',
        body:
            'Modern operating systems store password hashes instead of '
            'plaintext passwords — when users log in, the entered '
            'password is hashed and compared with the stored hash. '
            'Software vendors also publish official hash values for '
            'downloadable software; after downloading the file, users '
            'calculate its hash and compare it with the published value, '
            'and matching hashes confirm that the file has not been '
            'modified.',
      ),
      LessonSection(
        heading: 'Digital Forensics & Backup Validation',
        body:
            'Investigators calculate hashes before and after collecting '
            'digital evidence — matching hashes demonstrate that the '
            'evidence has remained unchanged throughout the '
            'investigation. Organizations similarly verify backup '
            'integrity by comparing newly generated hashes with '
            'previously recorded values.',
      ),
      LessonSection(
        heading: 'Malware Detection',
        body:
            'Security products calculate hashes for executable files. '
            'Known malicious hashes can be compared against threat '
            'intelligence databases to identify malware quickly.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/malware_hash_detection.jpg',
          caption:
              'Matching cryptographic hash values confirm that a file '
              'has not been modified during storage or transmission.',
        ),
      ),
    ],
  ),

  // 11 ---------------------------------------------------------------------
  Lesson(
    title: 'Legacy Hashes, SHA-2/SHA-3 & HMAC',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'Legacy Hash Algorithms',
        body:
            'Over time, improvements in computing power have exposed '
            'weaknesses in some older hash algorithms.',
      ),
      LessonSection(
        heading: 'MD5',
        body:
            'Message Digest 5 (MD5) produces a 128-bit hash value. '
            'Although MD5 was widely used for many years, researchers '
            'discovered practical collision attacks that significantly '
            'weakened its security. Today, MD5 should not be used for '
            'security-sensitive applications such as digital signatures '
            'or certificate validation. However, it may still appear in '
            'legacy systems or for basic file checks where cryptographic '
            'security is not required.',
      ),
      LessonSection(
        heading: 'SHA-1',
        body:
            'Secure Hash Algorithm 1 (SHA-1) generates a 160-bit hash '
            'value. Like MD5, SHA-1 has been shown to be vulnerable to '
            'collision attacks and has been deprecated for most security '
            'applications. Modern organizations should migrate away from '
            'SHA-1 wherever possible.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Algorithm', 'Hash Length', 'Status', 'Typical Use'],
          tableRows: [
            ['MD5', '128 bits', 'Obsolete for security', 'Legacy file verification'],
            ['SHA-1', '160 bits', 'Deprecated', 'Legacy compatibility'],
            ['SHA-256', '256 bits', 'Current Standard', 'Digital signatures, certificates, integrity verification'],
            ['SHA-384', '384 bits', 'Current Standard', 'High-security applications'],
            ['SHA-512', '512 bits', 'Current Standard', 'High-security environments'],
          ],
        ),
      ),
      LessonSection(
        heading: 'SHA-2 and SHA-3 Families',
        body:
            'Following the discovery of weaknesses in MD5 and SHA-1, '
            'modern systems transitioned to stronger hashing algorithms. '
            'The SHA-2 family is currently the most widely used '
            'collection of cryptographic hash algorithms. Common SHA-2 '
            'variants include SHA-224, SHA-256, SHA-384, and SHA-512. '
            'These algorithms differ primarily in the length of the '
            'generated hash value and the level of security they '
            'provide.',
      ),
      LessonSection(
        body:
            'SHA-256 has become the de facto standard for many '
            'enterprise applications, including TLS certificates, '
            'software integrity verification, digital signatures, '
            'blockchain technologies, and file integrity monitoring. The '
            'SHA-3 family, standardized by NIST in 2015, provides an '
            'alternative hashing algorithm based on a different '
            'mathematical design. Although SHA-3 is not intended to '
            'replace SHA-2, it offers additional resilience and may be '
            'adopted in environments requiring algorithmic diversity.',
      ),
      LessonSection(
        heading: 'Hash-Based Message Authentication Code (HMAC)',
        body:
            'While a standard cryptographic hash verifies data '
            'integrity, it does not verify who created the data. To '
            'address this limitation, organizations use a Hash-Based '
            'Message Authentication Code (HMAC). An HMAC combines a '
            'cryptographic hash function with a shared secret key. Both '
            'communicating parties must possess the same secret key to '
            'generate and verify the HMAC.',
      ),
      LessonSection(
        body:
            'This provides both integrity and authentication. Because '
            'attackers do not know the secret key, they cannot generate '
            'a valid HMAC even if they know the hashing algorithm. '
            'Common examples include HMAC-SHA-256, HMAC-SHA-384, and '
            'HMAC-SHA-512. HMAC is widely used in REST APIs, cloud '
            'services, VPN protocols, TLS, and authentication tokens.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A software company distributes installation packages '
            'through its website. Alongside each download, it publishes '
            'an official SHA-256 hash value. After downloading the '
            'installer, customers calculate the SHA-256 hash locally and '
            'compare it with the published value. If the values match, '
            'they can be confident that the software has not been '
            'altered during download. If the hash values differ, the '
            'file may have been corrupted or maliciously modified, and '
            'installation should not proceed.',
      ),
      LessonSection(
        body:
            'Similarly, the organization\'s endpoint security platform '
            'continuously calculates hashes of newly downloaded '
            'executable files and compares them with known malware '
            'signatures and threat intelligence feeds to identify '
            'malicious software before execution.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use SHA-256 or stronger algorithms for integrity verification',
          'Avoid MD5 and SHA-1 for new security implementations',
          'Verify software downloads using published hash values',
          'Store passwords using secure password hashing mechanisms rather than general-purpose hashing alone',
          'Use hashes to validate backups and digital evidence',
          'Monitor enterprise systems for the continued use of deprecated hashing algorithms',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'A cryptographic hash does not encrypt data. Its primary '
            'purpose is to verify integrity by detecting whether '
            'information has changed, even if the modification is as '
            'small as a single bit.',
      ),
    ],
  ),

  // 12 ---------------------------------------------------------------------
  Lesson(
    title: 'Digital Signatures',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 15,
    sections: [
      LessonSection(
        heading: 'What Is a Digital Signature?',
        body:
            'A digital signature is a cryptographic mechanism that '
            'allows recipients to verify who created the data and '
            'whether the data has been modified. Unlike handwritten '
            'signatures, digital signatures are generated mathematically '
            'using asymmetric cryptography. The sender uses a private '
            'key to create the digital signature, and recipients verify '
            'the signature using the sender\'s public key.',
      ),
      LessonSection(
        body: 'Digital signatures provide three important security services:',
        bullets: [
          'Authentication',
          'Integrity',
          'Non-repudiation',
        ],
      ),
      LessonSection(
        heading: 'Digital Signature Creation',
        body:
            'Creating a digital signature involves several cryptographic '
            'operations:',
        bullets: [
          'The sender prepares the original document',
          'A cryptographic hash of the document is generated',
          'The sender encrypts the hash using their private key',
          'The encrypted hash becomes the digital signature',
          'The original document and digital signature are transmitted together',
        ],
      ),
      LessonSection(
        body:
            'Because only the sender possesses the private key, the '
            'signature uniquely identifies the sender.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/digital_signature_creation.jpg',
          caption:
              'A digital signature is created by hashing the original '
              'document and encrypting the hash with the sender\'s '
              'private key.',
        ),
      ),
      LessonSection(
        heading: 'Digital Signature Verification',
        body:
            'After receiving a signed document, the recipient verifies '
            'its authenticity:',
        bullets: [
          'The recipient calculates a new hash of the received document',
          'The recipient decrypts the digital signature using the sender\'s public key',
          'The decrypted hash is compared with the newly generated hash',
        ],
      ),
      LessonSection(
        body:
            'If both values match, the document is authentic and has '
            'not been modified. If the hash values differ, the document '
            'may have been altered or the signature may not belong to '
            'the claimed sender.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/digital_signature_verification.jpg',
          caption:
              'Recipients verify digital signatures by comparing a '
              'newly calculated hash with the decrypted signature hash.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Applications of Digital Signatures',
        body:
            'Digital signatures are used extensively across enterprise '
            'environments.',
      ),
      LessonSection(
        heading: 'Code Signing & Software Updates',
        body:
            'Software vendors digitally sign applications before '
            'distribution. Operating systems verify the signature before '
            'installation, helping users identify trusted publishers and '
            'detect unauthorized modifications. Operating systems and '
            'enterprise applications similarly verify digital signatures '
            'before installing updates, which prevents attackers from '
            'distributing malicious software disguised as legitimate '
            'updates.',
      ),
      LessonSection(
        heading: 'Secure Email & Electronic Documents',
        body:
            'Secure email solutions such as S/MIME use digital '
            'signatures to verify the identity of the sender and ensure '
            'that email contents have not been modified. Organizations '
            'also digitally sign contracts, financial documents, and '
            'regulatory submissions — digital signatures provide legal '
            'evidence of document authenticity in many jurisdictions.',
      ),
      LessonSection(
        heading: 'Certificate Authorities',
        body:
            'Certificate Authorities digitally sign digital certificates. '
            'Browsers verify these signatures before trusting websites '
            'and encrypted connections.',
      ),
      LessonSection(
        heading: 'Hashing vs Digital Signatures',
        body:
            'Hash functions verify integrity, while digital signatures '
            'additionally authenticate the sender and provide '
            'non-repudiation.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Feature', 'Cryptographic Hash', 'Digital Signature'],
          tableRows: [
            ['Verifies Integrity', 'Yes', 'Yes'],
            ['Verifies Sender Identity', 'No', 'Yes'],
            ['Provides Authentication', 'No', 'Yes'],
            ['Provides Non-Repudiation', 'No', 'Yes'],
            ['Uses Asymmetric Cryptography', 'No', 'Yes'],
            ['Typical Enterprise Uses', 'File verification, password hashing', 'Code signing, secure email, certificates'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A software company develops endpoint protection software '
            'for enterprise customers. Before publishing a new software '
            'update, the company generates a SHA-256 hash of the '
            'installation package and creates a digital signature using '
            'its private code-signing key.',
      ),
      LessonSection(
        body:
            'When customer systems download the update, they calculate '
            'a new SHA-256 hash and verify the digital signature using '
            'the company\'s public certificate. If the signature '
            'verification succeeds, the update is installed '
            'automatically. If verification fails, the update is '
            'rejected because it may have been modified or originated '
            'from an untrusted source.',
      ),
      LessonSection(
        body:
            'This process protects customers from installing malicious '
            'or tampered software while ensuring that updates originate '
            'from the legitimate software publisher.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use SHA-256 or stronger algorithms for digital signatures',
          'Protect private signing keys using Hardware Security Modules (HSMs)',
          'Replace SHA-1 and MD5 in all signing processes',
          'Digitally sign software releases and enterprise applications',
          'Verify digital signatures before installing software or updates',
          'Rotate signing certificates according to organizational policy',
          'Monitor certificate expiration and revocation status',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'A digital signature does not encrypt the document itself. '
            'Instead, it proves who signed the document and confirms '
            'that the contents have not changed since the signature was '
            'created.',
      ),
    ],
  ),

  // 13 ---------------------------------------------------------------------
  Lesson(
    title: 'Public Key Infrastructure (PKI)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Establishing Trust',
        body:
            'In the previous sections, we explored asymmetric '
            'cryptography, cryptographic hashing, and digital '
            'signatures. While these technologies provide the '
            'mathematical foundation for secure communications, '
            'organizations still require a trusted system for '
            'distributing public keys, issuing digital certificates, and '
            'verifying identities. Without such a trust framework, users '
            'would have no reliable way to determine whether a public '
            'key actually belongs to the organization or individual it '
            'claims to represent. This is the purpose of Public Key '
            'Infrastructure (PKI).',
      ),
      LessonSection(
        body:
            'PKI provides the policies, processes, hardware, software, '
            'and trusted entities that manage digital certificates and '
            'public keys throughout their lifecycle. It enables users, '
            'devices, and applications to establish trust, authenticate '
            'identities, and exchange encrypted information securely '
            'across enterprise networks and the Internet. PKI is one of '
            'the most important components of modern cybersecurity and '
            'is used extensively in HTTPS websites, VPNs, secure email, '
            'Wi-Fi authentication, code signing, cloud services, and '
            'enterprise identity management.',
      ),
      LessonSection(
        heading: 'What Is Public Key Infrastructure (PKI)?',
        body:
            'Public Key Infrastructure (PKI) is a framework that manages '
            'the creation, distribution, validation, renewal, and '
            'revocation of digital certificates and public keys. Rather '
            'than relying on users to manually exchange public keys, PKI '
            'establishes trust through trusted organizations known as '
            'Certificate Authorities (CAs).',
      ),
      LessonSection(
        body: 'PKI consists of:',
        bullets: [
          'Certificate Authorities (CA)',
          'Registration Authorities (RA)',
          'Digital Certificates',
          'Public and Private Keys',
          'Certificate Repositories',
          'Certificate Revocation Mechanisms',
          'Policies and Procedures',
        ],
      ),
      LessonSection(
        body:
            'Together, these components allow systems to verify '
            'identities before establishing secure communications.',
      ),
      LessonSection(
        heading: 'Why PKI Is Important',
        body:
            'Modern enterprises communicate continuously with employees, '
            'customers, partners, and cloud services. Without a trusted '
            'certificate infrastructure, attackers could impersonate '
            'legitimate servers, intercept encrypted communications, or '
            'distribute malicious software using fake identities.',
      ),
      LessonSection(
        body: 'PKI helps organizations:',
        bullets: [
          'Authenticate users and systems',
          'Secure HTTPS websites',
          'Protect email communications',
          'Enable VPN authentication',
          'Secure wireless networks',
          'Verify software publishers',
          'Protect cloud communications',
          'Support Zero Trust architectures',
        ],
      ),
      LessonSection(
        body: 'Nearly every secure Internet connection today depends on PKI.',
      ),
      LessonSection(
        heading: 'Certificate Authority (CA)',
        body:
            'A Certificate Authority (CA) is a trusted organization '
            'responsible for issuing and digitally signing digital '
            'certificates. Before issuing a certificate, the CA verifies '
            'the identity of the requesting entity according to '
            'established validation procedures. Once verified, the CA '
            'signs the certificate using its private key. Because '
            'operating systems and browsers already trust well-known '
            'Certificate Authorities, certificates issued by those CAs '
            'are automatically recognized as trustworthy.',
      ),
      LessonSection(
        body:
            'Certificate Authorities may issue certificates for '
            'websites, servers, users, devices, applications, network '
            'equipment, code signing, and email security. Examples of '
            'enterprise PKI deployments include both public CAs (used '
            'for Internet-facing services) and private enterprise CAs '
            '(used within an organization\'s internal network).',
      ),
      LessonSection(
        heading: 'Registration Authority (RA)',
        body:
            'A Registration Authority (RA) acts on behalf of a '
            'Certificate Authority by verifying the identity of '
            'certificate applicants. The RA does not issue certificates '
            'directly. Instead, it performs tasks such as identity '
            'verification, certificate request validation, user '
            'registration, device registration, and approval of '
            'certificate requests. Once verification is complete, the RA '
            'forwards the approved request to the Certificate Authority '
            'for certificate issuance. Separating the RA from the CA '
            'improves operational security by reducing direct exposure '
            'of the CA.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/pki_trust_model.jpg',
          caption:
              'Public Key Infrastructure establishes trust by verifying '
              'identities, issuing digital certificates, and enabling '
              'secure communications between enterprise systems.',
        ),
      ),
      LessonSection(
        heading: 'Digital Certificates',
        body:
            'A digital certificate is an electronic credential that '
            'binds a public key to the identity of an individual, '
            'organization, device, or application. Certificates allow '
            'recipients to trust that a public key truly belongs to the '
            'stated owner.',
      ),
      LessonSection(
        body: 'A typical digital certificate contains:',
        bullets: [
          'Subject name',
          'Public key',
          'Issuing Certificate Authority',
          'Certificate serial number',
          'Validity period',
          'Digital signature of the issuing CA',
          'Certificate version',
          'Supported key usage',
        ],
      ),
      LessonSection(
        body:
            'Most enterprise certificates follow the X.509 standard. '
            'Operating systems, browsers, and enterprise applications '
            'automatically validate X.509 certificates during secure '
            'communications.',
      ),
      LessonSection(
        heading: 'X.509 Certificates',
        body:
            'X.509 is the international standard that defines the '
            'format of digital certificates. Nearly all enterprise PKI '
            'deployments use X.509 certificates. These certificates '
            'support HTTPS, TLS, VPN authentication, secure email '
            '(S/MIME), code signing, Wi-Fi authentication (802.1X), and '
            'client authentication. Because X.509 provides a '
            'standardized certificate structure, systems from different '
            'vendors can securely exchange and validate certificates.',
      ),
      LessonSection(
        heading: 'Certificate Trust',
        body:
            'When a client receives a digital certificate, it must '
            'determine whether that certificate can be trusted. Trust is '
            'established by verifying the issuing Certificate Authority, '
            'the CA\'s digital signature, certificate validity dates, '
            'certificate revocation status, and the certificate chain. '
            'If all validation checks succeed, the client trusts the '
            'certificate and proceeds with secure communication. If '
            'validation fails, users typically receive certificate '
            'warnings indicating that the connection may not be secure.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/certificate_trust_validation.jpg',
          caption:
              'Clients validate a digital certificate by checking the '
              'issuing CA, digital signature, validity dates, revocation '
              'status, and full certificate chain before trusting a '
              'secure connection.',
        ),
      ),
      LessonSection(
        heading: 'PKI Components at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Component', 'Primary Responsibility'],
          tableRows: [
            ['Certificate Authority (CA)', 'Issues and signs digital certificates'],
            ['Registration Authority (RA)', 'Verifies certificate requests'],
            ['Digital Certificate', 'Associates a public key with an identity'],
            ['Certificate Repository', 'Stores and distributes certificates'],
            ['Public Key', 'Used for encryption and signature verification'],
            ['Private Key', 'Used for decryption and digital signatures'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational corporation deploys an internal Microsoft '
            'Active Directory Certificate Services (AD CS) environment '
            'to manage digital certificates for employees, servers, '
            'wireless networks, and VPN gateways. When a new employee '
            'joins the organization, the Registration Authority '
            'validates the employee\'s identity and forwards the '
            'certificate request to the internal Certificate Authority. '
            'After the certificate is issued, the employee\'s workstation '
            'automatically retrieves it and uses it for Wi-Fi '
            'authentication, VPN access, and secure email.',
      ),
      LessonSection(
        body:
            'Meanwhile, the organization\'s public-facing web servers use '
            'certificates issued by a trusted public Certificate '
            'Authority, allowing customers\' web browsers to establish '
            'secure HTTPS sessions without certificate warnings.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Protect Certificate Authority private keys using Hardware Security Modules (HSMs)',
          'Use separate Root and Issuing Certificate Authorities',
          'Validate certificate requests before issuance',
          'Regularly review certificate expiration dates',
          'Implement certificate revocation mechanisms',
          'Restrict administrative access to PKI systems',
          'Audit certificate issuance and lifecycle activities',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'The trustworthiness of an entire Public Key Infrastructure '
            'depends on the security of the Certificate Authority. If a '
            'CA\'s private key is compromised, every certificate issued '
            'by that CA may no longer be trusted.',
      ),
    ],
  ),

  // 14 ---------------------------------------------------------------------
  Lesson(
    title: 'CA Hierarchy & Certificate Lifecycle',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Root Certificate Authority (Root CA)',
        body:
            'A Root Certificate Authority (Root CA) is the highest level '
            'of trust within a PKI hierarchy. The Root CA issues '
            'certificates only to subordinate or Intermediate '
            'Certificate Authorities rather than directly issuing '
            'certificates to users or servers.',
      ),
      LessonSection(
        body:
            'Because the Root CA represents the foundation of trust, '
            'organizations typically keep it offline whenever possible, '
            'protect its private key using a Hardware Security Module '
            '(HSM), limit administrative access, and use it only for '
            'signing subordinate CA certificates. Compromise of a Root '
            'CA can invalidate the trust of every certificate beneath '
            'it.',
      ),
      LessonSection(
        heading: 'Intermediate Certificate Authority',
        body:
            'An Intermediate Certificate Authority sits between the Root '
            'CA and the Issuing Certificate Authority. Intermediate CAs '
            'improve security by isolating the Root CA from routine '
            'certificate operations. Benefits include reduced exposure '
            'of the Root CA, simplified certificate management, easier '
            'certificate revocation, and better scalability for large '
            'enterprises. Organizations commonly deploy multiple '
            'Intermediate CAs to support different business units, '
            'geographic regions, or certificate purposes.',
      ),
      LessonSection(
        heading: 'Issuing Certificate Authority',
        body:
            'The Issuing Certificate Authority is responsible for '
            'issuing certificates directly to end entities — web '
            'servers, employees, mobile devices, network appliances, VPN '
            'gateways, and enterprise applications. Issuing CAs perform '
            'daily certificate operations while the Root CA remains '
            'protected.',
      ),
      LessonSection(
        heading: 'Certificate Lifecycle',
        body:
            'Every digital certificate progresses through a well-defined '
            'lifecycle. Proper lifecycle management ensures that '
            'certificates remain valid, trustworthy, and compliant with '
            'organizational policies. The typical certificate lifecycle '
            'includes:',
        bullets: [
          'Certificate Request',
          'Identity Verification',
          'Certificate Issuance',
          'Certificate Installation',
          'Certificate Usage',
          'Certificate Renewal',
          'Certificate Revocation',
          'Certificate Expiration',
        ],
      ),
      LessonSection(
        body:
            'Organizations automate much of this process using '
            'enterprise certificate management platforms.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/certificate_lifecycle.jpg',
          caption:
              'Digital certificates progress through a managed '
              'lifecycle from initial request to renewal or revocation, '
              'ensuring continuous trust within enterprise environments.',
        ),
      ),
      LessonSection(
        heading: 'Certificate Enrollment',
        body:
            'Certificate enrollment is the process of requesting and '
            'obtaining a digital certificate. During enrollment, a '
            'certificate request is generated, the Registration '
            'Authority verifies the request, the Certificate Authority '
            'issues the certificate, and the certificate is installed on '
            'the requesting system.',
      ),
      LessonSection(
        body:
            'Enterprise environments often automate enrollment using '
            'technologies such as Microsoft Active Directory Certificate '
            'Services (AD CS), Simple Certificate Enrollment Protocol '
            '(SCEP), and Enrollment over Secure Transport (EST). '
            'Automation reduces administrative effort and minimizes '
            'configuration errors.',
      ),
      LessonSection(
        heading: 'Certificate Renewal',
        body:
            'Certificates have limited validity periods. Before a '
            'certificate expires, it must be renewed to maintain '
            'uninterrupted secure communications. Organizations '
            'typically configure automatic renewal for web servers, VPN '
            'gateways, Wi-Fi authentication, cloud services, and '
            'endpoint certificates. Failure to renew certificates before '
            'expiration can result in service outages, browser '
            'warnings, failed VPN connections, and authentication '
            'failures.',
      ),
      LessonSection(
        heading: 'Certificate Revocation',
        body:
            'Sometimes a certificate must be invalidated before its '
            'expiration date. This process is known as certificate '
            'revocation. Common reasons include private key compromise, '
            'employee termination, device loss or theft, incorrect '
            'certificate information, and suspected unauthorized use. '
            'Revoked certificates should never be trusted, even if they '
            'remain within their validity period.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/certificate_revocation.jpg',
          caption:
              'Certificate revocation prevents compromised or invalid '
              'certificates from being trusted by enterprise systems.',
        ),
      ),
      LessonSection(
        heading: 'Certificate Revocation List (CRL)',
        body:
            'A Certificate Revocation List (CRL) is a digitally signed '
            'list published by a Certificate Authority. The CRL contains '
            'certificates that are no longer trusted. Before accepting a '
            'certificate, clients may download the CRL and verify that '
            'the certificate serial number does not appear on the list. '
            'Advantages include simple implementation and broad support; '
            'limitations include large file sizes, periodic updates, and '
            'increased network traffic.',
      ),
      LessonSection(
        heading: 'Online Certificate Status Protocol (OCSP)',
        body:
            'The Online Certificate Status Protocol (OCSP) provides '
            'real-time certificate status checking. Instead of '
            'downloading an entire revocation list, clients send a query '
            'to an OCSP responder, which returns the certificate status: '
            'Good, Revoked, or Unknown. Advantages include real-time '
            'validation, reduced bandwidth, and faster certificate '
            'verification. Because of these benefits, OCSP is widely '
            'used by modern browsers and enterprise applications.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Mechanism', 'Description', 'Advantages', 'Limitations'],
          tableRows: [
            ['CRL', 'Downloaded list of revoked certificates', 'Simple, broadly supported', 'Large files, periodic updates'],
            ['OCSP', 'Real-time certificate status query', 'Fast, current status', 'Requires online responder availability'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global financial institution manages more than 150,000 '
            'digital certificates for web servers, VPN gateways, '
            'wireless infrastructure, employee smart cards, and cloud '
            'workloads. Automated certificate enrollment ensures that '
            'new systems receive certificates without manual '
            'intervention. The organization also uses automatic renewal '
            'to prevent certificate expiration from disrupting online '
            'banking services.',
      ),
      LessonSection(
        body:
            'When an administrator discovers that a VPN gateway\'s '
            'private key has been compromised, the corresponding '
            'certificate is immediately revoked. Browsers and VPN '
            'clients query the institution\'s OCSP responder before '
            'establishing secure sessions, ensuring that the compromised '
            'certificate is rejected even though it has not yet reached '
            'its expiration date.',
      ),
      LessonSection(
        body:
            'This combination of automated lifecycle management and '
            'real-time certificate validation helps maintain trust while '
            'reducing operational risk.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Keep Root CAs offline whenever practical',
          'Use Intermediate and Issuing CAs for daily operations',
          'Automate certificate enrollment and renewal',
          'Monitor certificate expiration dates proactively',
          'Revoke certificates immediately after key compromise',
          'Implement OCSP for real-time certificate validation',
          'Audit certificate issuance, renewal, and revocation regularly',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'An expired certificate can interrupt secure services, but a '
            'compromised certificate is a security risk. Effective PKI '
            'management requires both timely certificate renewal and '
            'immediate revocation when trust is lost.',
      ),
    ],
  ),

  // 15 ---------------------------------------------------------------------
  Lesson(
    title: 'Certificate Types & Selection',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 16,
    sections: [
      LessonSection(
        heading: 'Not All Certificates Serve the Same Purpose',
        body:
            'In the previous sections, we examined how Public Key '
            'Infrastructure (PKI) establishes trust and how digital '
            'certificates are issued, managed, renewed, and revoked '
            'throughout their lifecycle. However, not all certificates '
            'serve the same purpose. Different certificate types are '
            'designed to authenticate users, servers, software '
            'publishers, network devices, and applications.',
      ),
      LessonSection(
        body:
            'Selecting the correct certificate type is an important part '
            'of enterprise security architecture. Using an inappropriate '
            'certificate can lead to authentication failures, management '
            'complexity, or weakened security. Enterprise administrators '
            'must understand the purpose of each certificate type and '
            'how it supports secure communication across modern IT '
            'environments.',
      ),
      LessonSection(
        heading: 'Server Certificates',
        body:
            'A server certificate identifies a server and enables '
            'encrypted communication between clients and that server. '
            'When a user visits an HTTPS website, the web server '
            'presents its server certificate during the TLS handshake. '
            'The client\'s browser verifies the certificate before '
            'establishing an encrypted connection. Server certificates '
            'are commonly used for HTTPS websites, web applications, API '
            'endpoints, VPN gateways, email servers, and cloud services. '
            'A valid server certificate helps users verify that they are '
            'communicating with the intended server rather than an '
            'attacker impersonating it.',
      ),
      LessonSection(
        heading: 'Client Certificates',
        body:
            'A client certificate identifies an individual user or '
            'device rather than a server. Instead of authenticating a '
            'website, client certificates authenticate the connecting '
            'user or endpoint. Client certificates are widely used for '
            'VPN authentication, Wi-Fi (802.1X) authentication, device '
            'authentication, smart cards, Mutual TLS (mTLS), and '
            'enterprise endpoint authentication. Because authentication '
            'relies on certificate ownership rather than passwords '
            'alone, client certificates significantly strengthen '
            'identity verification.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/certificate_types.jpg',
          caption:
              'Different certificate types serve different '
              'authentication and trust requirements across enterprise '
              'environments.',
        ),
      ),
      LessonSection(
        heading: 'Self-Signed Certificates',
        body:
            'A self-signed certificate is digitally signed using its own '
            'private key rather than by a trusted Certificate Authority. '
            'Because no trusted third party verifies the certificate '
            'owner\'s identity, operating systems and web browsers do not '
            'trust self-signed certificates by default. Self-signed '
            'certificates are commonly used for laboratory environments, '
            'development systems, internal testing, and temporary '
            'deployments. They should generally not be used for '
            'public-facing production services because users receive '
            'certificate warnings and attackers could more easily '
            'impersonate services.',
      ),
      LessonSection(
        heading: 'Wildcard Certificates',
        body:
            'A wildcard certificate secures a domain and all of its '
            'first-level subdomains using a single certificate. For '
            'example, a wildcard certificate issued for *.example.com '
            'can secure www.example.com, mail.example.com, '
            'vpn.example.com, and portal.example.com. This reduces '
            'administrative effort because multiple servers can use one '
            'certificate. However, organizations must carefully protect '
            'wildcard certificate private keys because compromise could '
            'affect every covered subdomain.',
      ),
      LessonSection(
        heading: 'Subject Alternative Name (SAN) Certificates',
        body:
            'A Subject Alternative Name (SAN) certificate, also known as '
            'a multi-domain certificate, allows multiple domain names to '
            'be protected using a single certificate. For example, one '
            'SAN certificate may include company.com, company.net, '
            'company.org, api.company.com, and mail.company.com. SAN '
            'certificates simplify certificate management for '
            'organizations operating multiple websites or services. They '
            'are commonly used by Microsoft Exchange, Unified '
            'Communications platforms, reverse proxies, cloud '
            'applications, and multi-domain web services.',
      ),
      LessonSection(
        heading: 'Code Signing Certificates',
        body:
            'A code signing certificate verifies that software '
            'originates from a trusted publisher and has not been '
            'modified since it was signed. Before distributing software, '
            'the developer digitally signs the application using a code '
            'signing certificate. Operating systems verify this '
            'signature before installation or execution. Code signing '
            'certificates are widely used for desktop applications, '
            'mobile applications, drivers, scripts, firmware, and '
            'software updates. Unsigned or improperly signed software '
            'often generates security warnings because users cannot '
            'verify its authenticity.',
      ),
      LessonSection(
        heading: 'Certificate Types at a Glance',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Certificate Type', 'Primary Purpose', 'Typical Enterprise Use'],
          tableRows: [
            ['Server Certificate', 'Authenticate servers', 'HTTPS, VPNs, APIs'],
            ['Client Certificate', 'Authenticate users or devices', 'VPN, Wi-Fi, mTLS'],
            ['Wildcard Certificate', 'Protect multiple subdomains', 'Enterprise web services'],
            ['SAN Certificate', 'Protect multiple domain names', 'Multi-domain applications'],
            ['Code Signing Certificate', 'Verify software authenticity', 'Software publishing'],
            ['Self-Signed Certificate', 'Testing and development', 'Laboratories, internal testing'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Selecting the Appropriate Certificate',
        body:
            'Choosing the correct certificate depends on the intended '
            'use case. Organizations should consider the number of '
            'domains, authentication requirements, public versus '
            'internal deployment, management complexity, certificate '
            'lifecycle, and regulatory requirements.',
      ),
      LessonSection(
        body:
            'For example: public websites typically use server '
            'certificates issued by trusted public Certificate '
            'Authorities; enterprise VPN users commonly authenticate '
            'using client certificates; large organizations hosting '
            'numerous subdomains may deploy wildcard certificates; and '
            'software vendors require code signing certificates to '
            'establish trust with customers. Selecting the appropriate '
            'certificate type simplifies management while maintaining '
            'strong security.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/certificate_selection.jpg',
          caption:
              'Certificate selection depends on the intended '
              'authentication and deployment requirements.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational healthcare organization operates hundreds '
            'of public websites, internal portals, mobile applications, '
            'VPN gateways, and Wi-Fi networks. Public-facing websites '
            'use trusted server certificates issued by a commercial '
            'Certificate Authority. Employees authenticate to the '
            'corporate VPN and wireless network using client '
            'certificates distributed automatically through Microsoft '
            'Intune.',
      ),
      LessonSection(
        body:
            'Internal development environments use self-signed '
            'certificates for testing, while software developed by the '
            'organization\'s engineering team is digitally signed using a '
            'dedicated code signing certificate before deployment. This '
            'structured certificate management approach reduces '
            'administrative overhead while ensuring that every service '
            'uses certificates appropriate to its security requirements.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use publicly trusted CAs for Internet-facing services',
          'Restrict self-signed certificates to testing environments',
          'Protect wildcard and code-signing private keys with Hardware Security Modules (HSMs)',
          'Regularly inventory certificates across the enterprise',
          'Monitor certificate expiration dates proactively',
          'Use automated certificate deployment where possible',
          'Select certificate types based on business and security requirements',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Certificates establish trust only when their private keys '
            'remain secure. Regardless of certificate type, protecting '
            'private keys is essential to maintaining the integrity of '
            'enterprise authentication systems.',
      ),
    ],
  ),

  // 16 ---------------------------------------------------------------------
  Lesson(
    title: 'Advanced Certificate Management',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Beyond Choosing the Right Certificate',
        body:
            'In the previous section, we explored the different types '
            'of digital certificates used in enterprise environments, '
            'including server certificates, client certificates, '
            'wildcard certificates, SAN certificates, code signing '
            'certificates, and self-signed certificates. Selecting the '
            'appropriate certificate type is only one aspect of '
            'certificate management. Organizations must also protect '
            'certificates from misuse, ensure that certificate '
            'validation cannot be bypassed, and secure the private keys '
            'associated with each certificate.',
      ),
      LessonSection(
        body:
            'Modern enterprise environments use technologies such as '
            'Mutual TLS (mTLS), certificate pinning, certificate '
            'transparency, Hardware Security Modules (HSMs), and Trusted '
            'Platform Modules (TPMs) to strengthen certificate security '
            'and reduce the risk of impersonation or key compromise.',
      ),
      LessonSection(
        heading: 'Mutual TLS (mTLS)',
        body:
            'Traditional TLS authenticates only the server. The client '
            'verifies the server\'s certificate before establishing an '
            'encrypted session, but the server may authenticate the '
            'client using usernames, passwords, or other methods. Mutual '
            'TLS (mTLS) extends this process by requiring both the '
            'client and the server to present valid digital '
            'certificates.',
      ),
      LessonSection(
        body: 'During the TLS handshake:',
        bullets: [
          'The server presents its certificate',
          'The client validates the server certificate',
          'The server requests a client certificate',
          'The client presents its certificate',
          'The server validates the client certificate',
        ],
      ),
      LessonSection(
        body:
            'Both parties establish an encrypted session only if '
            'certificate validation succeeds. Because both endpoints '
            'authenticate one another, mTLS significantly reduces the '
            'risk of impersonation attacks. Common enterprise '
            'applications include business-to-business (B2B) APIs, '
            'microservices, financial systems, healthcare applications, '
            'enterprise VPNs, and Zero Trust architectures.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/mutual_tls.jpg',
          caption:
              'Mutual TLS authenticates both the client and the server '
              'before establishing an encrypted communication channel.',
        ),
      ),
      LessonSection(
        heading: 'Certificate Pinning',
        body:
            'Certificate pinning is a security technique that restricts '
            'an application to trusting only specific certificates or '
            'public keys. Instead of trusting every certificate issued '
            'by a public Certificate Authority, the application stores '
            '("pins") the expected certificate or public key. When a '
            'secure connection is established, the application compares '
            'the received certificate with the stored value. If the '
            'values do not match, the connection is rejected.',
      ),
      LessonSection(
        body: 'Certificate pinning helps protect against:',
        bullets: [
          'Rogue Certificate Authorities',
          'Fraudulent certificates',
          'Man-in-the-middle attacks',
          'Certificate substitution attacks',
        ],
      ),
      LessonSection(
        body:
            'Although highly secure, certificate pinning requires '
            'careful certificate lifecycle management because '
            'certificate changes must also update the pinned values.',
      ),
      LessonSection(
        heading: 'Certificate Transparency',
        body:
            'Certificate Transparency (CT) is an open framework that '
            'improves the visibility of publicly issued certificates. '
            'Whenever a trusted Certificate Authority issues a public '
            'certificate, the certificate is recorded in publicly '
            'accessible Certificate Transparency logs. Organizations can '
            'monitor these logs to identify unexpected certificate '
            'issuance, fraudulent certificates, misconfigured Certificate '
            'Authorities, and unauthorized domain registrations. Many '
            'modern browsers require publicly trusted certificates to '
            'appear in Certificate Transparency logs before they are '
            'considered valid.',
      ),
      LessonSection(
        heading: 'Hardware Security Modules (HSMs)',
        body:
            'A Hardware Security Module (HSM) is a dedicated hardware '
            'appliance designed to generate, store, and protect '
            'cryptographic keys. Unlike software-based key storage, '
            'HSMs prevent private keys from leaving the hardware in '
            'plaintext form. HSMs provide tamper-resistant hardware, '
            'secure key generation, secure key storage, cryptographic '
            'acceleration, and regulatory compliance. Organizations '
            'commonly use HSMs to protect Certificate Authority private '
            'keys, code signing keys, TLS private keys, database '
            'encryption keys, and payment processing keys. Because '
            'compromise of these keys could undermine enterprise trust, '
            'HSMs are considered a best practice for high-value '
            'cryptographic assets.',
      ),
      LessonSection(
        heading: 'Trusted Platform Module (TPM)',
        body:
            'A Trusted Platform Module (TPM) is a hardware security chip '
            'integrated into many modern computers. Unlike enterprise '
            'HSMs, TPMs primarily protect cryptographic keys belonging '
            'to individual devices. Common TPM uses include BitLocker '
            'drive encryption, Windows Hello, device identity, secure '
            'boot, client certificate protection, and credential '
            'protection. By storing private keys within tamper-resistant '
            'hardware, TPMs reduce the likelihood of key theft through '
            'malware or physical attacks.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/certificate_key_protection.jpg',
          caption:
              'Enterprise certificate management combines secure key '
              'storage, centralized certificate distribution, '
              'transparency monitoring, and continuous security '
              'oversight.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Certificate Monitoring',
        body:
            'Large organizations often manage tens of thousands of '
            'digital certificates. Continuous monitoring helps '
            'administrators identify expiring certificates, weak '
            'cryptographic algorithms, duplicate certificates, '
            'unauthorized certificate issuance, missing certificate '
            'renewals, and misconfigured certificate chains. Many '
            'enterprise monitoring platforms automatically generate '
            'alerts before certificates expire, reducing the risk of '
            'unexpected service outages.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A multinational pharmaceutical company operates more than '
            '80,000 digital certificates across cloud platforms, '
            'manufacturing systems, laboratory equipment, VPN gateways, '
            'and internal web applications. Certificate Authority '
            'private keys are protected within Hardware Security '
            'Modules, while employee laptops store client certificates '
            'in Trusted Platform Modules.',
      ),
      LessonSection(
        body:
            'Internal microservices authenticate each other using '
            'Mutual TLS, and the organization\'s security team '
            'continuously monitors Certificate Transparency logs for '
            'unauthorized certificates issued against company domains. '
            'Automated certificate lifecycle management alerts '
            'administrators 60 days before certificate expiration, '
            'ensuring uninterrupted operation of business-critical '
            'systems while maintaining compliance with regulatory '
            'requirements.',
      ),
      LessonSection(
        heading: 'Best Practices',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Practice', 'Security Benefit'],
          tableRows: [
            ['Use Hardware Security Modules (HSMs)', 'Protect high-value private keys'],
            ['Use Trusted Platform Modules (TPMs)', 'Protect device certificates and credentials'],
            ['Implement Mutual TLS where appropriate', 'Authenticate both client and server'],
            ['Monitor Certificate Transparency logs', 'Detect unauthorized certificate issuance'],
            ['Automate certificate renewal', 'Reduce service interruptions'],
            ['Regularly audit certificates', 'Identify weak or expired certificates'],
            ['Restrict administrative access', 'Reduce risk of unauthorized certificate changes'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'A digital certificate is only as trustworthy as the private '
            'key behind it. Strong key protection, continuous '
            'monitoring, and disciplined certificate lifecycle '
            'management are essential to maintaining enterprise trust.',
      ),
    ],
  ),

  // 17 ---------------------------------------------------------------------
  Lesson(
    title: 'Cryptographic Attacks: Common Techniques',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Attackers Don\'t Break Strong Algorithms',
        body:
            'Cryptographic algorithms form the foundation of modern '
            'cybersecurity. Technologies such as AES, RSA, SHA-256, and '
            'TLS are trusted because they are based on mathematically '
            'sound principles and have undergone extensive security '
            'analysis. However, the strength of a cryptographic system '
            'depends not only on the algorithm itself but also on how it '
            'is implemented, configured, and managed.',
      ),
      LessonSection(
        body:
            'Attackers rarely attempt to "break" strong encryption '
            'directly because doing so is computationally impractical '
            'with current technology. Instead, they target weaknesses '
            'such as poor key management, weak passwords, outdated '
            'protocols, implementation flaws, and configuration errors. '
            'Understanding common cryptographic attacks helps security '
            'professionals design stronger systems, identify potential '
            'weaknesses, and implement appropriate countermeasures.',
      ),
      LessonSection(
        heading: 'Brute-Force Attacks',
        body:
            'A brute-force attack attempts to discover an encryption key '
            'or password by systematically trying every possible '
            'combination until the correct one is found. The feasibility '
            'of a brute-force attack depends primarily on key length, '
            'available computing power, time available, and randomness '
            'of the key.',
      ),
      LessonSection(
        body:
            'For example, a 56-bit DES key can be broken using modern '
            'hardware, while a properly implemented AES-256 key would '
            'require an impractical amount of time to exhaust using '
            'current computing capabilities. Organizations defend '
            'against brute-force attacks by using strong cryptographic '
            'algorithms, long cryptographic keys, multi-factor '
            'authentication, account lockout policies, and rate '
            'limiting.',
      ),
      LessonSection(
        heading: 'Dictionary Attacks',
        body:
            'Unlike brute-force attacks, dictionary attacks do not '
            'attempt every possible combination. Instead, attackers try '
            'passwords or passphrases taken from predefined dictionaries '
            'containing common passwords, frequently used words, leaked '
            'credentials, and variations of known passwords. Dictionary '
            'attacks are particularly effective against users who select '
            'weak or predictable passwords. Enterprise defenses include '
            'password complexity policies, password managers, '
            'multi-factor authentication, and password breach '
            'monitoring.',
      ),
      LessonSection(
        heading: 'Birthday Attacks',
        body:
            'A birthday attack exploits the mathematical probability of '
            'finding two different inputs that produce the same '
            'cryptographic hash value. Rather than attempting to recover '
            'the original data, the attacker searches for a hash '
            'collision. Birthday attacks primarily affect weak or '
            'deprecated hash algorithms. Modern hash algorithms such as '
            'SHA-256 have extremely large hash spaces, making practical '
            'birthday attacks computationally infeasible with current '
            'technology. Birthday attacks are particularly relevant to '
            'digital signatures, certificate validation, and integrity '
            'verification.',
      ),
      LessonSection(
        heading: 'Collision Attacks',
        body:
            'A collision occurs when two different pieces of data '
            'generate the same hash value. If attackers can '
            'intentionally create collisions, they may be able to '
            'substitute malicious files while maintaining identical hash '
            'values. Collision attacks were successfully demonstrated '
            'against MD5 and SHA-1 — these weaknesses are the primary '
            'reason why both algorithms have been deprecated for '
            'security-sensitive applications. Modern organizations should '
            'use SHA-256, SHA-384, SHA-512, or SHA-3 for digital '
            'signatures and integrity verification.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/cryptographic_attack_techniques.jpg',
          caption:
              'Enterprise cryptographic systems face a variety of attack '
              'techniques targeting weak keys, protocols, '
              'implementations, and cryptographic algorithms.',
        ),
      ),
      LessonSection(
        heading: 'Weak Key Attacks',
        body:
            'Even strong cryptographic algorithms can become vulnerable '
            'when weak keys are used. Weak keys may result from poor '
            'random number generation, predictable passwords, short '
            'encryption keys, reused cryptographic keys, and default '
            'vendor keys. Attackers often search for systems using weak '
            'keys because they are significantly easier to compromise '
            'than properly generated cryptographic keys. Organizations '
            'should generate keys using cryptographically secure random '
            'number generators (CSPRNGs) and rotate keys according to '
            'organizational policy.',
      ),
      LessonSection(
        heading: 'Downgrade Attacks',
        body:
            'A downgrade attack attempts to force communicating systems '
            'to use older, weaker cryptographic protocols or algorithms. '
            'For example, an attacker may attempt to disable TLS 1.3, '
            'force TLS 1.0, negotiate weak cipher suites, or use '
            'deprecated hashing algorithms. Once weaker encryption is '
            'negotiated, the attacker may exploit known vulnerabilities. '
            'Modern enterprise systems defend against downgrade attacks '
            'by disabling obsolete protocols, removing weak cipher '
            'suites, enforcing minimum TLS versions, and using secure '
            'protocol negotiation mechanisms.',
      ),
      LessonSection(
        heading: 'Man-in-the-Middle (MITM) Attacks',
        body:
            'In a Man-in-the-Middle (MITM) attack, an attacker secretly '
            'intercepts communications between two legitimate parties. '
            'The attacker may attempt to read confidential information, '
            'modify transmitted data, inject malicious content, or steal '
            'authentication credentials. Improper certificate validation '
            'or acceptance of untrusted certificates significantly '
            'increases the risk of MITM attacks. Strong certificate '
            'validation, Public Key Infrastructure (PKI), certificate '
            'pinning, and Mutual TLS help defend against these attacks.',
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A financial services organization performs an annual '
            'cryptographic assessment of its public-facing applications. '
            'During testing, security engineers discover that one legacy '
            'web application still supports TLS 1.0 and weak cipher '
            'suites for compatibility with outdated clients. The '
            'application also accepts SHA-1 certificates.',
      ),
      LessonSection(
        body:
            'Although no compromise has occurred, the configuration '
            'increases the risk of downgrade attacks and weak '
            'cryptographic negotiations. The organization upgrades the '
            'application to support only TLS 1.3, removes deprecated '
            'cipher suites, replaces SHA-1 certificates with SHA-256 '
            'certificates, and enforces strong certificate validation '
            'across all client connections. This proactive approach '
            'reduces the organization\'s exposure to known cryptographic '
            'attacks while maintaining compliance with current industry '
            'standards.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use modern cryptographic algorithms such as AES-256, RSA-3072 or ECC, and SHA-256 or stronger',
          'Disable deprecated protocols and cipher suites',
          'Generate cryptographic keys using secure random number generators',
          'Rotate encryption keys periodically',
          'Protect private keys using HSMs or TPMs',
          'Enforce strong certificate validation',
          'Monitor cryptographic configurations through regular security assessments',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Most successful cryptographic attacks exploit weak '
            'implementations rather than breaking strong algorithms. '
            'Secure configuration, key management, and regular updates '
            'are just as important as choosing strong encryption '
            'algorithms.',
      ),
    ],
  ),

  // 18 ---------------------------------------------------------------------
  Lesson(
    title: 'Side-Channel Attacks, Quantum Computing & Crypto Agility',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 17,
    sections: [
      LessonSection(
        heading: 'Side-Channel Attacks',
        body:
            'A side-channel attack exploits information unintentionally '
            'leaked during cryptographic operations rather than '
            'attacking the encryption algorithm itself. Examples of '
            'leaked information include execution time, power '
            'consumption, electromagnetic emissions, CPU cache behavior, '
            'acoustic signals, and memory access patterns.',
      ),
      LessonSection(
        body:
            'By carefully measuring these characteristics, attackers may '
            'infer sensitive information such as encryption keys. For '
            'example, if an encryption operation consistently takes '
            'slightly longer when processing certain key values, an '
            'attacker may use timing analysis to gradually reconstruct '
            'the secret key. Side-channel attacks are particularly '
            'relevant to smart cards, Hardware Security Modules (HSMs), '
            'Trusted Platform Modules (TPMs), IoT devices, and embedded '
            'systems. Organizations reduce this risk by using hardware '
            'designed to resist side-channel analysis and by '
            'implementing constant-time cryptographic algorithms.',
      ),
      LessonSection(
        heading: 'Replay Attacks',
        body:
            'A replay attack occurs when an attacker captures legitimate '
            'network traffic and retransmits it later in an attempt to '
            'gain unauthorized access or repeat a valid transaction. '
            'Unlike a man-in-the-middle attack, the attacker does not '
            'necessarily modify the communication — instead, previously '
            'captured messages are replayed. Examples include reusing '
            'authentication tokens, replaying login requests, replaying '
            'financial transactions, and reusing session cookies.',
      ),
      LessonSection(
        body:
            'Enterprise systems defend against replay attacks using '
            'nonces, timestamps, session identifiers, challenge-response '
            'authentication, Mutual TLS, and short-lived authentication '
            'tokens. Modern authentication protocols such as Kerberos '
            'and OAuth incorporate replay protection mechanisms.',
      ),
      LessonSection(
        heading: 'Quantum Computing Considerations',
        body:
            'Current cryptographic algorithms are designed to withstand '
            'attacks from classical computers. However, advances in '
            'quantum computing introduce new challenges for asymmetric '
            'cryptography. Quantum algorithms, particularly Shor\'s '
            'Algorithm, could theoretically weaken widely used '
            'public-key algorithms such as RSA, Diffie-Hellman, and '
            'Elliptic Curve Cryptography (ECC).',
      ),
      LessonSection(
        body:
            'Symmetric encryption is less affected. While quantum '
            'computing could reduce the effective security of symmetric '
            'keys, increasing key lengths (for example, using AES-256) '
            'provides substantial resistance. Although practical '
            'large-scale quantum attacks are not yet a widespread '
            'enterprise threat, organizations are beginning to prepare '
            'for post-quantum cryptography (PQC).',
      ),
      LessonSection(
        heading: 'Post-Quantum Cryptography',
        body:
            'Post-Quantum Cryptography (PQC) refers to cryptographic '
            'algorithms designed to remain secure against both classical '
            'and quantum computers. Unlike quantum cryptography, PQC '
            'uses traditional computing systems while employing '
            'mathematical problems believed to be resistant to quantum '
            'attacks.',
      ),
      LessonSection(
        body:
            'Organizations are gradually evaluating post-quantum '
            'algorithms for Public Key Infrastructure, digital '
            'signatures, VPN authentication, secure communications, and '
            'long-term data protection. Government agencies and '
            'standards organizations are actively standardizing '
            'quantum-resistant algorithms to support future enterprise '
            'adoption.',
      ),
      LessonSection(
        heading: 'Cryptographic Agility',
        body:
            'One of the most important enterprise security principles is '
            'cryptographic agility. Cryptographic agility is the ability '
            'to replace cryptographic algorithms, keys, or protocols '
            'without requiring major system redesign.',
      ),
      LessonSection(
        body:
            'For example, organizations have transitioned over time from '
            'DES to AES, MD5 to SHA-256, SHA-1 to SHA-2, and TLS 1.0 to '
            'TLS 1.3. Future transitions may include migrating from RSA '
            'and ECC to post-quantum algorithms. Systems designed with '
            'cryptographic agility can adopt stronger standards more '
            'quickly when vulnerabilities or new technologies emerge.',
        diagram: DiagramSpec(
          type: DiagramType.assetImage,
          assetPath: 'assets/images/cryptography/cryptographic_lifecycle_management.jpg',
          caption:
              'Secure cryptography requires continuous lifecycle '
              'management, from algorithm selection to key rotation and '
              'periodic modernization.',
        ),
      ),
      LessonSection(
        heading: 'Enterprise Cryptographic Governance',
        body:
            'Strong cryptography requires more than selecting secure '
            'algorithms. Organizations must establish governance '
            'processes to ensure consistent implementation and ongoing '
            'compliance.',
      ),
      LessonSection(
        body: 'Effective governance includes:',
        bullets: [
          'Approved cryptographic standards',
          'Key management policies',
          'Certificate management procedures',
          'Cryptographic inventories',
          'Regular security assessments',
          'Compliance monitoring',
          'Incident response procedures',
        ],
      ),
      LessonSection(
        body:
            'Many organizations align cryptographic governance with '
            'frameworks such as the NIST Cybersecurity Framework (CSF), '
            'NIST SP 800-57 (Key Management), NIST SP 800-131A '
            '(Cryptographic Transitions), and ISO/IEC 27001. Governance '
            'helps ensure that cryptographic controls remain effective '
            'as technologies and threats evolve.',
      ),
      LessonSection(
        heading: 'Cryptographic Attack Mitigations',
        body:
            'Enterprise cryptographic attacks are mitigated through '
            'strong algorithms, secure implementations, and effective '
            'operational controls.',
        diagram: DiagramSpec(
          type: DiagramType.dataTable,
          tableHeaders: ['Attack', 'Primary Mitigation'],
          tableRows: [
            ['Brute-Force Attack', 'Strong algorithms and long keys'],
            ['Dictionary Attack', 'Strong passwords and MFA'],
            ['Birthday Attack', 'SHA-256 or stronger'],
            ['Collision Attack', 'Modern hash algorithms'],
            ['Downgrade Attack', 'Disable legacy protocols and cipher suites'],
            ['Man-in-the-Middle (MITM)', 'PKI, certificate validation, TLS, mTLS'],
            ['Weak Key Attack', 'Cryptographically secure random key generation'],
            ['Side-Channel Attack', 'Secure hardware and constant-time implementations'],
            ['Replay Attack', 'Nonces, timestamps, challenge-response authentication'],
          ],
        ),
      ),
      LessonSection(
        heading: 'Enterprise Example',
        body:
            'A global cloud service provider performs annual reviews of '
            'its cryptographic architecture. During one assessment, '
            'engineers identify several internal applications still '
            'using older TLS configurations and static cryptographic '
            'keys. Although no active compromise is detected, the '
            'organization updates all services to TLS 1.3, automates key '
            'rotation, deploys Hardware Security Modules for critical '
            'signing keys, and introduces a cryptographic inventory to '
            'monitor algorithm usage across thousands of systems.',
      ),
      LessonSection(
        body:
            'At the same time, the organization begins testing '
            'post-quantum cryptographic algorithms in a non-production '
            'environment to prepare for future standards. By adopting '
            'cryptographic agility and continuous governance, the '
            'company reduces operational risk while ensuring long-term '
            'protection of customer data.',
      ),
      LessonSection(
        heading: 'Best Practices',
        bullets: [
          'Use industry-approved cryptographic algorithms and key lengths',
          'Disable deprecated protocols, cipher suites, and hash algorithms',
          'Protect private keys using Hardware Security Modules (HSMs) or Trusted Platform Modules (TPMs)',
          'Implement automated key rotation and certificate lifecycle management',
          'Design systems with cryptographic agility to support future algorithm migration',
          'Monitor cryptographic configurations through regular security assessments',
          'Maintain a complete inventory of cryptographic assets',
          'Prepare for post-quantum cryptography by tracking emerging standards and vendor support',
        ],
      ),
      LessonSection(
        heading: 'Security Tip',
        body:
            'Cryptography is not a one-time implementation. Secure '
            'enterprise environments require continuous monitoring, '
            'regular algorithm updates, disciplined key management, and '
            'the flexibility to adopt stronger cryptographic standards '
            'as technology evolves.',
      ),
    ],
  ),

  // 19 — Practice Quiz -------------------------------------------------------
  Lesson(
    title: 'Practice Quiz: Cryptography',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 20,
    quiz: [
      QuizQuestion(
        question: 'What is the primary purpose of encryption, as distinct from encoding?',
        options: [
          'To improve compatibility between different systems',
          'To provide confidentiality by converting plaintext into ciphertext that requires a key to reverse',
          'To generate a fixed-length digest for integrity checks',
          'To compress data for faster transmission',
        ],
        correctIndex: 1,
        explanation: 'Encryption\'s primary objective is confidentiality — converting readable data into ciphertext that can only be reversed with the correct key, unlike encoding, which provides no security.',
      ),
      QuizQuestion(
        question: 'Which of the four security objectives of cryptography prevents someone from denying they performed a specific action?',
        options: [
          'Confidentiality',
          'Integrity',
          'Authentication',
          'Non-Repudiation',
        ],
        correctIndex: 3,
        explanation: 'Non-repudiation, typically provided by digital signatures, prevents an individual from denying that they performed a specific action, such as signing a document.',
      ),
      QuizQuestion(
        question: 'Why is protecting data "in use" considered more challenging than protecting data at rest or in transit?',
        options: [
          'Data in use is never encrypted under any circumstances',
          'Data must often be decrypted before an application can process it, exposing it during processing',
          'Data in use only exists on mobile devices',
          'There are no controls available to protect data in use',
        ],
        correctIndex: 1,
        explanation: 'Because data must typically be decrypted before applications can process it, protecting data in use requires controls like memory protection, secure enclaves, and Trusted Execution Environments.',
      ),
      QuizQuestion(
        question: 'What is the main disadvantage of symmetric encryption compared to asymmetric encryption?',
        options: [
          'It is significantly slower',
          'It requires much larger keys for equivalent security',
          'Securely distributing the shared secret key is difficult',
          'It cannot be used to encrypt large files',
        ],
        correctIndex: 2,
        explanation: 'Because both parties need the same secret key, securely distributing that key before communication begins is one of the primary challenges of symmetric encryption.',
      ),
      QuizQuestion(
        question: 'Which cipher mode combines the performance of Counter Mode with built-in integrity verification (authenticated encryption)?',
        options: [
          'ECB',
          'CBC',
          'CTR',
          'GCM',
        ],
        correctIndex: 3,
        explanation: 'Galois/Counter Mode (GCM) provides authenticated encryption — combining confidentiality, integrity, and authentication — and is widely used as AES-GCM in TLS and HTTPS.',
      ),
      QuizQuestion(
        question: 'Why is Electronic Codebook (ECB) mode generally not recommended for encrypting sensitive data?',
        options: [
          'It is too slow for enterprise use',
          'Identical plaintext blocks produce identical ciphertext blocks, allowing attackers to identify patterns',
          'It requires an Initialization Vector that is difficult to generate',
          'It cannot be used with AES',
        ],
        correctIndex: 1,
        explanation: 'ECB encrypts each block independently with the same key, so identical plaintext blocks always produce identical ciphertext, revealing patterns to an attacker.',
      ),
      QuizQuestion(
        question: 'What happens if an Initialization Vector (IV) is reused with the same encryption key?',
        options: [
          'Nothing — IVs do not need to be unique',
          'Security can be significantly weakened, since identical plaintext may no longer produce different ciphertext',
          'The encryption algorithm automatically generates a new key',
          'The ciphertext becomes permanently unrecoverable',
        ],
        correctIndex: 1,
        explanation: 'Reusing an IV with the same key can significantly weaken security, which is why IVs should always be generated using secure random number generators.',
      ),
      QuizQuestion(
        question: 'In asymmetric encryption, which key is used to decrypt data that was encrypted with the recipient\'s public key?',
        options: [
          'The sender\'s public key',
          'The sender\'s private key',
          'The recipient\'s private key',
          'A shared symmetric key',
        ],
        correctIndex: 2,
        explanation: 'Data encrypted with a recipient\'s public key can only be decrypted using that recipient\'s corresponding private key.',
      ),
      QuizQuestion(
        question: 'What is "hybrid encryption" in the context of protocols like TLS?',
        options: [
          'Using two symmetric algorithms simultaneously',
          'Using asymmetric encryption for key exchange/authentication and symmetric encryption for the actual data',
          'Encrypting data twice with the same algorithm',
          'A deprecated encryption technique no longer in use',
        ],
        correctIndex: 1,
        explanation: 'Hybrid encryption combines the secure key exchange and authentication strengths of asymmetric cryptography with the speed of symmetric encryption for bulk data.',
      ),
      QuizQuestion(
        question: 'Roughly how does a 256-bit ECC key compare in security strength to RSA?',
        options: [
          'It is much weaker than RSA-2048',
          'Roughly equivalent to an RSA 3072-bit key',
          'Exactly equivalent to an RSA 256-bit key',
          'ECC and RSA cannot be meaningfully compared',
        ],
        correctIndex: 1,
        explanation: 'ECC 256-bit keys provide security roughly equivalent to RSA 3072-bit keys, while using much smaller key sizes — a key reason ECC is increasingly preferred.',
      ),
      QuizQuestion(
        question: 'What does Diffie-Hellman (DH) primarily provide, as distinct from RSA?',
        options: [
          'Digital signatures only',
          'A key exchange mechanism allowing two parties to establish a shared secret without transmitting it',
          'File integrity verification',
          'Password hashing',
        ],
        correctIndex: 1,
        explanation: 'Diffie-Hellman is a key exchange algorithm, not primarily an encryption algorithm — it lets two parties independently calculate the same shared secret.',
      ),
      QuizQuestion(
        question: 'Which property of cryptographic hash functions means that changing a single character in a document produces an entirely different hash value?',
        options: [
          'Deterministic output',
          'Collision resistance',
          'The avalanche effect',
          'Fixed-length output',
        ],
        correctIndex: 2,
        explanation: 'The avalanche effect ensures that even a tiny change in input produces a dramatically different hash output, enabling rapid detection of modifications.',
      ),
      QuizQuestion(
        question: 'Why should MD5 and SHA-1 no longer be used for security-sensitive applications like digital signatures?',
        options: [
          'They are too slow for modern hardware',
          'Practical collision attacks have been demonstrated against both algorithms',
          'They produce hashes that are too long',
          'They require asymmetric key pairs',
        ],
        correctIndex: 1,
        explanation: 'Researchers have demonstrated practical collision attacks against both MD5 and SHA-1, which is why both have been deprecated for security-sensitive uses.',
      ),
      QuizQuestion(
        question: 'What does an HMAC (Hash-Based Message Authentication Code) provide that a standard cryptographic hash does not?',
        options: [
          'Faster computation speed',
          'Authentication, by combining a hash function with a shared secret key',
          'Reversibility of the hash value',
          'A shorter output length',
        ],
        correctIndex: 1,
        explanation: 'An HMAC combines a hash function with a shared secret key, so it verifies both integrity and who created the data — a standard hash alone does not provide authentication.',
      ),
      QuizQuestion(
        question: 'How is a digital signature created?',
        options: [
          'By encrypting the entire document with the recipient\'s public key',
          'By hashing the document and encrypting that hash with the sender\'s private key',
          'By encoding the document using Base64',
          'By hashing the document and encrypting that hash with the recipient\'s public key',
        ],
        correctIndex: 1,
        explanation: 'A digital signature is created by generating a hash of the document and encrypting that hash with the sender\'s private key — the recipient then verifies it with the sender\'s public key.',
      ),
      QuizQuestion(
        question: 'What is the role of a Registration Authority (RA) in a PKI deployment?',
        options: [
          'It issues and digitally signs certificates directly',
          'It verifies the identity of certificate applicants before forwarding approved requests to the CA',
          'It stores revoked certificates',
          'It generates all private keys for the organization',
        ],
        correctIndex: 1,
        explanation: 'An RA verifies identities and validates certificate requests on behalf of a CA, but does not issue certificates itself — separating these roles improves operational security.',
      ),
      QuizQuestion(
        question: 'Why do organizations typically keep the Root CA offline?',
        options: [
          'Root CAs are rarely used and offline storage saves money',
          'Because the Root CA represents the foundation of trust, and its compromise would invalidate every certificate beneath it',
          'Offline storage is required by law in all jurisdictions',
          'Root CAs cannot function while connected to a network',
        ],
        correctIndex: 1,
        explanation: 'Because the Root CA is the foundation of trust for the entire PKI hierarchy, keeping it offline and tightly protected limits exposure — compromise would invalidate every certificate it chains to.',
      ),
      QuizQuestion(
        question: 'What is the key advantage of OCSP over a traditional CRL for checking certificate revocation status?',
        options: [
          'OCSP requires no network connection at all',
          'OCSP provides real-time status checking rather than requiring a full list download',
          'OCSP eliminates the need for Certificate Authorities entirely',
          'OCSP never needs an online responder',
        ],
        correctIndex: 1,
        explanation: 'OCSP queries a responder in real time for a specific certificate\'s status, avoiding the bandwidth and staleness issues of downloading an entire CRL.',
      ),
      QuizQuestion(
        question: 'Which certificate type would be most appropriate for authenticating multiple subdomains of the same company domain with a single certificate?',
        options: [
          'Self-signed certificate',
          'Code signing certificate',
          'Wildcard certificate',
          'Client certificate',
        ],
        correctIndex: 2,
        explanation: 'A wildcard certificate (e.g., issued for *.example.com) secures a domain and all of its first-level subdomains using a single certificate.',
      ),
      QuizQuestion(
        question: 'What distinguishes Mutual TLS (mTLS) from traditional TLS?',
        options: [
          'mTLS uses a weaker encryption algorithm for speed',
          'mTLS requires both the client and server to present and validate certificates, not just the server',
          'mTLS eliminates the need for a Certificate Authority',
          'mTLS is only used for email encryption',
        ],
        correctIndex: 1,
        explanation: 'Traditional TLS authenticates only the server; Mutual TLS requires both the client and server to present valid certificates, significantly reducing impersonation risk.',
      ),
      QuizQuestion(
        question: 'What is the primary purpose of a Hardware Security Module (HSM)?',
        options: [
          'To speed up general network traffic',
          'To generate, store, and protect cryptographic keys in tamper-resistant hardware',
          'To replace the need for digital certificates',
          'To provide free public Wi-Fi authentication',
        ],
        correctIndex: 1,
        explanation: 'HSMs are dedicated hardware appliances that generate, store, and protect cryptographic keys, preventing private keys from ever leaving the hardware in plaintext form.',
      ),
      QuizQuestion(
        question: 'A brute-force attack against a properly implemented AES-256 key is considered impractical primarily because of what factor?',
        options: [
          'AES-256 cannot be attacked mathematically',
          'The enormous number of possible key combinations makes exhausting them computationally infeasible with current technology',
          'AES-256 automatically detects brute-force attempts',
          'Brute-force attacks only work against asymmetric algorithms',
        ],
        correctIndex: 1,
        explanation: 'The sheer size of the AES-256 keyspace makes brute-forcing it computationally infeasible with current technology, unlike shorter keys such as the 56-bit DES key.',
      ),
      QuizQuestion(
        question: 'What is a downgrade attack designed to accomplish?',
        options: [
          'Physically damage cryptographic hardware',
          'Force communicating systems to negotiate older, weaker protocols or cipher suites that can then be exploited',
          'Permanently delete encryption keys',
          'Slow down network traffic without any security impact',
        ],
        correctIndex: 1,
        explanation: 'A downgrade attack tries to force systems into using weaker legacy protocols (e.g., forcing TLS 1.0 instead of TLS 1.3) so the attacker can exploit known vulnerabilities in the weaker configuration.',
      ),
      QuizQuestion(
        question: 'What information does a side-channel attack exploit?',
        options: [
          'Weaknesses in the mathematical structure of the encryption algorithm itself',
          'Unintentionally leaked information such as execution time, power consumption, or electromagnetic emissions during cryptographic operations',
          'Publicly available source code',
          'User-chosen passwords',
        ],
        correctIndex: 1,
        explanation: 'Side-channel attacks exploit physical characteristics unintentionally leaked during cryptographic operations — like timing or power consumption — rather than attacking the algorithm mathematically.',
      ),
      QuizQuestion(
        question: 'Which asymmetric algorithms are considered most at risk from future large-scale quantum computing attacks (via Shor\'s Algorithm)?',
        options: [
          'AES and ChaCha20',
          'RSA, Diffie-Hellman, and Elliptic Curve Cryptography (ECC)',
          'SHA-256 and SHA-3',
          'HMAC-based algorithms only',
        ],
        correctIndex: 1,
        explanation: 'Shor\'s Algorithm could theoretically weaken widely used public-key algorithms such as RSA, Diffie-Hellman, and ECC, motivating interest in post-quantum cryptography.',
      ),
      QuizQuestion(
        question: 'What does "cryptographic agility" mean for an enterprise system?',
        options: [
          'The system uses the fastest possible encryption algorithm at all times',
          'The ability to replace cryptographic algorithms, keys, or protocols without requiring a major system redesign',
          'The system never needs to update its cryptographic configuration',
          'The system exclusively uses asymmetric cryptography',
        ],
        correctIndex: 1,
        explanation: 'Cryptographic agility is the ability to swap out algorithms or protocols (e.g., migrating from RSA to post-quantum algorithms) without a complete system redesign, letting organizations respond quickly to new vulnerabilities.',
      ),
      QuizQuestion(
        question: 'Which of the following is the best example of a replay attack defense?',
        options: [
          'Using a longer encryption key',
          'Incorporating nonces, timestamps, or short-lived tokens so captured messages cannot be reused later',
          'Disabling all logging',
          'Switching from AES to RSA',
        ],
        correctIndex: 1,
        explanation: 'Nonces, timestamps, session identifiers, and short-lived tokens ensure that a captured and retransmitted message will be rejected as invalid or expired.',
      ),
    ],
  ),
];
