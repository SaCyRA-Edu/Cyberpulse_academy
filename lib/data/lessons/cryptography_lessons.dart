import '../lesson_model.dart';
import '../../widgets/diagrams.dart';

const List<Lesson> cryptographyLessons = [
  // 1 ----------------------------------------------------------------------
  Lesson(
    title: 'Cryptographic Solutions',
    difficulty: LessonDifficulty.beginner,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'What Encryption Actually Does',
        body:
            'Encryption transforms readable data (plaintext) into an '
            'unreadable form (ciphertext) using a mathematical algorithm '
            'and a key, so that only someone possessing the correct key '
            'can reverse the process and recover the original data. This '
            'single capability underlies nearly every other cryptographic '
            'concept covered in this module.',
      ),
      LessonSection(
        heading: 'The Basic Encryption and Decryption Flow',
        body:
            'Every encryption scheme, regardless of algorithm, follows '
            'the same fundamental shape.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Plaintext', 'Encrypt with Key', 'Ciphertext', 'Decrypt with Key', 'Plaintext'],
          caption:
              'The same basic flow underlies every encryption scheme — '
              'what differs between algorithms is how the key works and '
              'how the encryption step is mathematically performed.',
        ),
      ),
      LessonSection(
        heading: 'Protecting Data at Rest',
        body:
            'Data at rest is data stored somewhere — on a hard drive, '
            'in a database, in cloud storage — not actively moving '
            'across a network. Full-disk encryption (like BitLocker, '
            'covered in the Windows Security module) and database-level '
            'encryption both protect data at rest, ensuring that even if '
            'the physical storage medium or a database backup is stolen, '
            'its contents remain unreadable without the encryption key.',
      ),
      LessonSection(
        heading: 'Protecting Data in Transit',
        body:
            'Data in transit is data actively moving across a network — '
            'a web request, an email being delivered, a file upload. '
            'TLS (covered in the Networking module) is the primary '
            'mechanism protecting data in transit, encrypting traffic so '
            'that interception along the way — a compromised router, a '
            'malicious actor on the same Wi-Fi — yields only unreadable '
            'ciphertext.',
      ),
      LessonSection(
        heading: 'Protecting Data in Use',
        body:
            'Data in use is data actively being processed in a system\'s '
            'memory — genuinely the hardest state to protect, because '
            'the data must be in a readable form for the processor to '
            'actually work with it. Technologies like secure enclaves '
            'and confidential computing (covered later in this module) '
            'address this specific gap, keeping data encrypted even '
            'during active processing, decrypting it only inside a '
            'protected, isolated hardware region.',
      ),
      LessonSection(
        heading: 'The Two Encryption Families',
        body:
            'Every encryption algorithm falls into one of two families, '
            'each explored in full depth in the next two lessons of this '
            'module.',
      ),
      LessonSection(
        diagram: DiagramSpec(type: DiagramType.symmetricAsymmetricTable),
      ),
      LessonSection(
        heading: 'Hashing: A Different Tool for a Different Job',
        body:
            'Unlike encryption, hashing is one-way — there\'s no key '
            'that reverses a hash back into its original input. A '
            'hashing algorithm converts data of any size into a '
            'fixed-length digest that acts as a unique fingerprint, '
            'used to verify integrity and to store passwords securely. '
            'A dedicated lesson later in this module covers hashing and '
            'password security in full detail.',
      ),
      LessonSection(
        heading: 'PKI and Key Management: The Missing Piece',
        body:
            'Encryption and hashing are algorithms — but using them '
            'safely at scale requires infrastructure: a way to generate, '
            'distribute, store, rotate, and revoke keys and certificates '
            'across potentially thousands of systems and users. Public '
            'Key Infrastructure (PKI) and key management systems, both '
            'covered later in this module, are exactly that '
            'infrastructure.',
      ),
      LessonSection(
        heading: 'A Real-World Example Tying It All Together',
        body:
            'When you visit a banking website over HTTPS, several of '
            'these pieces work together in seconds: asymmetric '
            'encryption (via the site\'s certificate, issued through '
            'PKI) securely negotiates a shared symmetric key, symmetric '
            'encryption then protects the actual session data in '
            'transit for speed, and hashing verifies that neither the '
            'certificate nor the session data has been tampered with '
            'along the way. Every concept in this module plays a '
            'specific, necessary role in that one everyday interaction.',
      ),
    ],
  ),

  // 2 ----------------------------------------------------------------------
  Lesson(
    title: 'Symmetric Encryption Algorithms',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'The Core Concept, With an Example',
        body:
            'Symmetric encryption uses exactly one key to both encrypt '
            'and decrypt data. Imagine two people sharing a physical '
            'lockbox and a single matching key: whoever has a copy of '
            'that key can lock or unlock the box. If you encrypt a file '
            'with a symmetric key and send it to a colleague who already '
            'has the same key, they can decrypt it immediately — the '
            'entire scheme hinges on both parties already possessing an '
            'identical copy of that one secret key.',
      ),
      LessonSection(
        heading: 'Key Distribution: Symmetric Encryption\'s Central Challenge',
        body:
            'The obvious problem: how do two parties who have never '
            'communicated before securely agree on a shared secret key '
            'in the first place, without an eavesdropper intercepting it '
            'during that very exchange? This key distribution problem is '
            'symmetric encryption\'s fundamental limitation, and it\'s '
            'exactly what asymmetric encryption — covered in the next '
            'lesson — was designed to solve.',
      ),
      LessonSection(
        heading: 'The Hybrid Approach: Best of Both Worlds',
        body:
            'Because symmetric encryption is fast but has a key '
            'distribution problem, and asymmetric encryption solves key '
            'distribution but is comparatively slow, virtually every '
            'real-world secure system — including TLS itself — uses a '
            'hybrid approach: asymmetric encryption securely negotiates '
            'a temporary symmetric key, then fast symmetric encryption '
            'protects the actual bulk data for the rest of the session. '
            'This combination is why the encryption behind a simple web '
            'page load feels instantaneous despite using genuinely '
            'strong cryptography throughout.',
      ),
      LessonSection(
        heading: 'Symmetric Algorithms You Need to Recognize',
        bullets: [
          'DES (Data Encryption Standard) — 56-bit key, block cipher; cryptographically broken and obsolete, included here only because it\'s historically foundational and still appears in legacy systems',
          '3DES (Triple DES) — applies DES three times with different keys to compensate for DES\'s weak key length; significantly stronger than DES but still slow and now deprecated in favor of AES',
          'IDEA (International Data Encryption Algorithm) — 128-bit key, block cipher; historically used in early PGP implementations, now largely superseded',
          'AES (Advanced Encryption Standard) — 128, 192, or 256-bit key, block cipher; the current global standard, and by a wide margin the algorithm you should default to using',
          'Blowfish — variable key length (32 to 448 bits), block cipher; fast and free to use, still seen in some legacy and embedded applications',
          'Twofish — 128, 192, or 256-bit key, block cipher; Blowfish\'s successor, was a finalist in the competition that ultimately selected AES',
          'RC4 — a stream cipher (not block-based) with variable key length; cryptographically broken and should never be used in new systems',
          'RC5/RC6 — block ciphers with variable key length and block size; RC6 was another AES competition finalist, though neither saw AES\'s level of adoption',
        ],
      ),
      LessonSection(
        heading: 'Block Ciphers vs. Stream Ciphers',
        body:
            'Most algorithms above are block ciphers, encrypting data in '
            'fixed-size chunks (commonly 128 bits) at a time, padding the '
            'final block if the data doesn\'t divide evenly. RC4 is '
            'instead a stream cipher, encrypting data one bit or byte at '
            'a time continuously. Block ciphers are generally preferred '
            'today for their stronger security properties, and RC4\'s '
            'known weaknesses are a significant part of why stream '
            'ciphers as a category are used far less often in new '
            'system design.',
      ),
      LessonSection(
        heading: 'Why AES Is the Standard You Should Default To',
        body:
            'AES was selected by NIST after an extensive, multi-year '
            'public competition specifically to replace DES, and it has '
            'withstood over two decades of intense cryptographic '
            'scrutiny with no practical break ever discovered against '
            'the full algorithm. AES-256 in particular is considered '
            'secure even against a well-resourced, patient attacker for '
            'the foreseeable future. Unless you have a very specific, '
            'documented reason to use something else, AES is almost '
            'always the correct default choice for symmetric encryption '
            'today.',
      ),
    ],
  ),

  // 3 ----------------------------------------------------------------------
  Lesson(
    title: 'Asymmetric Cryptography & Digital Signatures',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'The Core Concept, With an Example',
        body:
            'Asymmetric encryption uses two mathematically linked keys: '
            'a public key, freely shared with anyone, and a private key, '
            'kept permanently secret by its owner. Data encrypted with '
            'someone\'s public key can only be decrypted with their '
            'matching private key. Imagine a mailbox with a slot anyone '
            'can drop a letter into (the public key), but only the '
            'owner holding the physical key can open and read what\'s '
            'inside (the private key) — solving the key distribution '
            'problem entirely, since the public key never needs to be '
            'kept secret in the first place.',
      ),
      LessonSection(
        heading: 'What Asymmetric Cryptography Enables',
        bullets: [
          'Confidentiality — encrypting data with the recipient\'s public key so only their private key can decrypt it',
          'Authentication — proving identity, since only the legitimate holder of a private key could have performed certain operations',
          'Integrity — verifying data hasn\'t been altered, typically combined with hashing',
          'Non-repudiation — preventing someone from credibly denying an action, since a signature created with their private key could only have come from them',
          'Digital signatures — the mechanism that actually delivers authentication, integrity, and non-repudiation together',
        ],
      ),
      LessonSection(
        heading: 'How a Digital Signature Actually Works',
        body:
            'A sender first hashes their message, producing a fixed-'
            'length digest. They then encrypt that digest using their '
            'own private key — this encrypted digest is the digital '
            'signature. Anyone can verify it using the sender\'s public '
            'key: decrypt the signature to recover the digest, '
            'independently hash the received message, and compare the '
            'two digests. If they match, the message is confirmed to be '
            'unaltered and genuinely signed by the private key\'s owner.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Hash Message', 'Sign with Private Key', 'Attach Signature', 'Verify with Public Key'],
          caption:
              'This exact flow is what powers signed emails, signed '
              'software updates, and the certificate signatures behind '
              'every HTTPS connection.',
        ),
      ),
      LessonSection(
        heading: 'Diffie-Hellman',
        body:
            'Diffie-Hellman isn\'t used to encrypt data directly — it\'s '
            'a key exchange protocol that lets two parties who have '
            'never communicated before agree on a shared secret key over '
            'a public, potentially monitored channel, without ever '
            'actually transmitting that secret key itself. This is the '
            'foundational breakthrough that made secure communication '
            'between strangers over the open internet practical in the '
            'first place.',
      ),
      LessonSection(
        heading: 'RSA',
        body:
            'RSA is the most widely recognized asymmetric algorithm, '
            'based on the mathematical difficulty of factoring the '
            'product of two very large prime numbers. It\'s used '
            'directly for both encryption and digital signatures, and '
            'has been a foundational component of internet security for '
            'decades, though it requires comparatively large key sizes '
            '(2048 bits or larger) to remain secure.',
      ),
      LessonSection(
        heading: 'ECC (Elliptic Curve Cryptography)',
        body:
            'ECC achieves equivalent security to RSA using dramatically '
            'smaller key sizes, based on the mathematics of elliptic '
            'curves rather than prime factorization — a 256-bit ECC key '
            'provides roughly the same security level as a 3072-bit RSA '
            'key. Smaller keys mean faster computation and less '
            'bandwidth and storage overhead, which is exactly why ECC '
            'has become the preferred choice for mobile devices, IoT, '
            'and increasingly, modern web certificates.',
      ),
      LessonSection(
        heading: 'When to Use Symmetric vs. Asymmetric',
        bullets: [
          'Use symmetric encryption when you need to encrypt large volumes of data quickly and both parties can securely share a key (or have already established one via a hybrid exchange)',
          'Use asymmetric encryption when two parties have never securely communicated before and need to establish trust or exchange a key without a pre-existing shared secret',
          'Use asymmetric encryption (specifically digital signatures) whenever you need non-repudiation or to prove authorship — encrypting large data with asymmetric algorithms alone is simply too slow for practical use',
          'In practice, real systems almost always combine both: asymmetric for the initial handshake and identity verification, symmetric for the actual bulk data transfer that follows',
        ],
      ),
    ],
  ),

  // 4 ----------------------------------------------------------------------
  Lesson(
    title: 'Hashing & Password Security',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 11,
    sections: [
      LessonSection(
        heading: 'Hashing: A One-Way Digital Fingerprint',
        body:
            'A hash function takes an input of any size and produces a '
            'fixed-length output called a message digest — and '
            'critically, this process is one-way: there\'s no '
            'mathematical operation that reverses a digest back into '
            'its original input. Change even a single character of the '
            'input and the resulting digest changes completely and '
            'unpredictably, which is exactly what makes hashing useful '
            'as an integrity check — comparing digests before and after '
            'reveals whether anything changed, without needing to '
            'compare the (potentially huge) original data directly.',
      ),
      LessonSection(
        heading: 'Hashing and Non-Repudiation',
        body:
            'As covered in the previous lesson, hashing is the first '
            'step in creating a digital signature — the message is '
            'hashed, and that digest is what actually gets signed with '
            'the sender\'s private key. This combination is precisely '
            'how non-repudiation is achieved in practice: the hash '
            'proves the message wasn\'t altered, and the signature over '
            'that hash proves who created it.',
      ),
      LessonSection(
        heading: 'A Real-World Example: Verifying a Software Download',
        body:
            'Many software publishers post the SHA-256 hash of an '
            'official download alongside the download link itself. '
            'After downloading, a user can independently compute the '
            'hash of the file they received and compare it against the '
            'published value — if they match, the file is confirmed '
            'unaltered from what the publisher actually released, '
            'catching both accidental corruption during download and '
            'deliberate tampering by an attacker who might have replaced '
            'the file on a compromised mirror server.',
      ),
      LessonSection(
        heading: 'Why MD5 Should Never Be Used Anymore',
        body:
            'MD5, once extremely popular, is now considered '
            'cryptographically broken — researchers have demonstrated '
            'practical collision attacks (covered fully in the '
            'Cryptographic Attacks lesson later in this module), where '
            'two different inputs produce the identical hash, undermining '
            'the entire integrity guarantee hashing is supposed to '
            'provide. SHA-256 (part of the SHA-2 family) is the current '
            'standard replacement, with no practical collision attack '
            'known against it.',
      ),
      LessonSection(
        heading: 'Password Storage: Why Hashing Alone Isn\'t Enough',
        body:
            'Storing a simple hash of a password is a major improvement '
            'over storing the plaintext password directly, but it\'s '
            'still vulnerable to a rainbow table attack — a '
            'precomputed lookup table of hashes for enormous numbers of '
            'common passwords, letting an attacker instantly reverse-'
            'lookup a stolen hash back to its likely plaintext password '
            'without any real cracking effort at all.',
      ),
      LessonSection(
        heading: 'Salting',
        body:
            'A salt is a unique, random value generated for each '
            'individual password and combined with it before hashing. '
            'Because every user\'s salt is different, identical '
            'passwords produce entirely different stored hashes, which '
            'completely defeats precomputed rainbow tables — an '
            'attacker would need to build a separate table for every '
            'single salt value, which is computationally impractical at '
            'scale.',
      ),
      LessonSection(
        heading: 'Key Stretching',
        body:
            'Key stretching deliberately runs the hashing process '
            'thousands or millions of times in a row (or uses an '
            'algorithm specifically designed to be slow and '
            'resource-intensive, like bcrypt, scrypt, or Argon2) rather '
            'than hashing once quickly. This dramatically slows down '
            'brute-force attempts to guess a password by trial and '
            'error, since each individual guess now takes meaningfully '
            'longer to test — a cost that\'s negligible for one '
            'legitimate login but adds up enormously across billions of '
            'attempted guesses.',
      ),
      LessonSection(
        heading: 'Nonces',
        body:
            'A nonce ("number used once") is a random or unique value '
            'used only a single time, commonly incorporated into '
            'authentication protocols to prevent replay attacks — where '
            'an attacker captures a legitimate authentication exchange '
            'and simply re-sends it later to gain access. Because the '
            'nonce changes every time, a captured exchange becomes '
            'useless for a second attempt.',
      ),
      LessonSection(
        heading: 'Defending Against Pass-the-Hash Attacks',
        body:
            'As covered in the Windows Security module, pass-the-hash '
            'attacks let an attacker authenticate using a stolen '
            'password hash directly, without ever needing to actually '
            'crack it back into plaintext. Defenses include Credential '
            'Guard (isolating hashes in protected memory), enforcing the '
            'use of Kerberos over NTLM wherever possible, and applying '
            'least privilege so a stolen hash grants only limited '
            'access even if successfully reused.',
      ),
      LessonSection(
        heading: 'Defending Against Birthday Attacks',
        body:
            'A birthday attack exploits the "birthday paradox" from '
            'probability theory — in a room of just 23 people, there\'s '
            'already better than even odds two people share a birthday, '
            'because the number of possible pairs grows much faster than '
            'the number of people. Applied to hashing, this means '
            'finding any two inputs that produce the same hash '
            '(a collision) is mathematically easier than it intuitively '
            'seems. The defense is straightforward: use a hash algorithm '
            'with a sufficiently large output size, like SHA-256, where '
            'the number of possible hash values is so astronomically '
            'large that a birthday-attack collision remains '
            'computationally infeasible.',
      ),
      LessonSection(
        heading: 'Limiting Failed Login Attempts',
        body:
            'Beyond cryptographic hardening, a simple and highly '
            'effective operational control: locking an account, or '
            'progressively delaying responses, after a defined number '
            'of failed login attempts. This directly blunts both '
            'online brute-force attacks and credential-stuffing attempts '
            'using previously breached password lists, regardless of '
            'how strong the underlying password hashing is.',
      ),
    ],
  ),

  // 5 ----------------------------------------------------------------------
  Lesson(
    title: 'Public Key Infrastructure (PKI)',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 12,
    sections: [
      LessonSection(
        heading: 'Why PKI Exists',
        body:
            'Asymmetric cryptography solves key distribution, but it '
            'introduces a new problem: how do you actually know a public '
            'key genuinely belongs to the person or organization it '
            'claims to represent, rather than an attacker who generated '
            'their own key pair and simply claims to be that entity? '
            'Public Key Infrastructure (PKI) is the complete system of '
            'policies, roles, and technology built specifically to '
            'answer that question reliably at scale.',
      ),
      LessonSection(
        heading: 'Certificate Authorities and the Root of Trust',
        body:
            'A Certificate Authority (CA) is a trusted third party that '
            'verifies an entity\'s identity and then issues a digital '
            'certificate binding that verified identity to a specific '
            'public key. Every device ships with a built-in list of '
            'trusted root CAs — the root of trust — and any certificate '
            'ultimately signed by one of those trusted roots (often '
            'through one or more intermediate CAs) is automatically '
            'trusted by that device without any further manual '
            'verification needed.',
      ),
      LessonSection(
        heading: 'The Certificate Issuance Flow',
        body:
            'Obtaining a certificate follows a well-defined process.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Generate Key Pair', 'Submit CSR', 'CA Validates Identity', 'Certificate Issued'],
          caption:
              'A Certificate Signing Request (CSR) contains the public '
              'key and identity details the applicant wants certified — '
              'the CA validates those details before signing.',
        ),
      ),
      LessonSection(
        heading: 'Internal PKI vs. External PKI',
        body:
            'An external PKI relies on a public, commercially trusted '
            'CA (like DigiCert or Let\'s Encrypt) to issue certificates '
            'trusted by any device on the internet — essential for '
            'public-facing websites and services. An internal PKI, by '
            'contrast, is an organization\'s own private certificate '
            'authority, used to issue certificates trusted only within '
            'that organization\'s own devices and infrastructure — '
            'common for internal applications, VPN authentication, and '
            'device identity, where public trust isn\'t needed and '
            'running your own CA is more cost-effective and flexible at '
            'scale.',
      ),
      LessonSection(
        heading: 'X.509 Certificates and Their Key Fields',
        body:
            'X.509 is the standard format nearly all digital '
            'certificates follow, containing the subject\'s identity, '
            'the public key being certified, the issuing CA\'s '
            'identity, a validity period, and the CA\'s own digital '
            'signature over all of it.',
      ),
      LessonSection(
        heading: 'Wildcard and SAN Certificates',
        bullets: [
          'Wildcard certificate — covers an entire domain and all its subdomains with one certificate (e.g. *.example.com covers www.example.com, mail.example.com, and any other subdomain)',
          'SAN (Subject Alternative Name) certificate — covers multiple distinct domain names on one single certificate (e.g. example.com and example.net together), useful when an organization needs one certificate spanning several unrelated domains',
        ],
      ),
      LessonSection(
        heading: 'Checking Whether a Certificate Is Still Valid',
        bullets: [
          'CRL (Certificate Revocation List) — a published list of certificates a CA has revoked before their natural expiration, which clients can download and check against',
          'OCSP (Online Certificate Status Protocol) — a real-time alternative to CRLs, letting a client query a CA directly with "is this specific certificate still valid?" rather than downloading an entire revocation list',
          'OCSP stapling — the web server itself periodically queries the CA and attaches ("staples") a recent, signed OCSP response directly to its own certificate during the TLS handshake, so the client doesn\'t need to make a separate, potentially slow query to the CA itself',
        ],
      ),
      LessonSection(
        heading: 'Real-World Example: Google.com and Apple.com Certificates',
        body:
            'Visiting google.com over HTTPS typically presents a '
            'certificate using ECC with a 256-bit key, issued by '
            'Google\'s own trusted intermediate CA (Google operates its '
            'own CA infrastructure for its domains), listing '
            '"google.com" and its many related domains as subjects, '
            'often via a SAN certificate covering multiple Google '
            'properties at once. Visiting apple.com may instead present '
            'an RSA certificate with a 2048-bit key, issued through a '
            'commercial CA. Both certificates achieve genuinely '
            'comparable real-world security despite the very different '
            'numbers — a 256-bit ECC key and a 2048-bit RSA key are '
            'considered roughly equivalent in strength, illustrating '
            'directly why raw key size alone, without knowing the '
            'algorithm family behind it, isn\'t a meaningful way to '
            'compare certificate strength.',
      ),
    ],
  ),

  // 6 ----------------------------------------------------------------------
  Lesson(
    title: 'Blockchain',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'A Shared, Immutable Ledger',
        body:
            'A blockchain is a distributed digital ledger — a record of '
            'transactions — maintained not by any single central '
            'authority, but collectively across many participating '
            'nodes, each holding an identical copy. Once a transaction '
            'is recorded and confirmed, it becomes effectively '
            'immutable: altering it would require simultaneously '
            'changing that same record across a majority of every '
            'independent copy held by every participating node, which '
            'becomes computationally impractical as the network grows.',
      ),
      LessonSection(
        heading: 'How a Transaction Actually Gets Recorded',
        body:
            'New transactions are broadcast to the network, verified by '
            'participating nodes using cryptographic techniques (hashing '
            'and digital signatures, both covered earlier in this '
            'module), grouped together into a "block," and then that '
            'block is cryptographically linked to the previous block '
            'using its hash — forming the literal "chain" the technology '
            'is named for.',
      ),
      LessonSection(
        diagram: DiagramSpec(
          type: DiagramType.processFlow,
          steps: ['Transaction Broadcast', 'Nodes Validate', 'Added to Block', 'Block Chained'],
          caption:
              'Each new block references the previous block\'s hash, so '
              'altering any historical block would break every '
              'subsequent link in the chain — the source of blockchain\'s '
              'tamper resistance.',
        ),
      ),
      LessonSection(
        heading: 'Smart Contracts',
        body:
            'A smart contract is self-executing code stored directly on '
            'a blockchain, automatically carrying out predefined actions '
            'when specific conditions are met — for example, '
            'automatically releasing payment the moment a shipment\'s '
            'delivery confirmation is recorded on the chain, with no '
            'intermediary needed to manually verify and process the '
            'transaction.',
      ),
      LessonSection(
        heading: 'Public vs. Permissioned Networks',
        bullets: [
          'Public blockchain — anyone can join, participate in validation, and view the full ledger; cryptocurrencies like Bitcoin and Ethereum are the most widely known examples',
          'Permissioned (private/consortium) blockchain — participation is restricted to specifically approved organizations or individuals, commonly used in enterprise settings like supply chain tracking between known business partners, where full public visibility isn\'t desired but shared, tamper-resistant record-keeping still is',
        ],
      ),
      LessonSection(
        heading: 'A Real-World Example Beyond Cryptocurrency',
        body:
            'A global food distributor uses a permissioned blockchain '
            'to track a shipment of produce from farm to grocery shelf, '
            'with every participant in the supply chain — the farm, the '
            'processor, the shipping company, the retailer — recording '
            'their handoff on the shared ledger. If contamination is '
            'later discovered, the company can trace the exact origin '
            'and path of the affected batch in minutes by querying the '
            'immutable ledger, rather than the days or weeks such '
            'investigations traditionally take when relying on separate, '
            'unlinked paper or digital records kept by each individual '
            'company in the chain.',
      ),
    ],
  ),

  // 7 ----------------------------------------------------------------------
  Lesson(
    title: 'Encryption Tools',
    difficulty: LessonDifficulty.advanced,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Trusted Platform Module (TPM)',
        body:
            'A TPM is a dedicated hardware chip built into most modern '
            'computers, specifically designed to securely generate, '
            'store, and protect cryptographic keys entirely within the '
            'hardware itself, isolated from the operating system and '
            'any software running on it. As covered in the Windows '
            'Security module, BitLocker relies directly on a TPM to '
            'seal its encryption keys to the specific physical machine, '
            'detecting certain forms of hardware tampering in the '
            'process.',
      ),
      LessonSection(
        heading: 'Hardware Security Module (HSM)',
        body:
            'An HSM is essentially an enterprise-grade, dedicated '
            'version of the same concept as a TPM, typically a separate '
            'physical device or a specialized cloud service, purpose-'
            'built to generate, store, and manage cryptographic keys at '
            'much larger scale for an entire organization — protecting '
            'the keys used to sign every certificate a company\'s '
            'internal CA issues, for example, or the keys protecting an '
            'entire database of encrypted customer records.',
      ),
      LessonSection(
        heading: 'Key Management Systems (KMS)',
        body:
            'A KMS is the software and process layer for the full '
            'lifecycle of cryptographic keys — generation, secure '
            'storage, distribution to the systems that need them, '
            'scheduled rotation, and eventual, secure destruction when a '
            'key is retired. Cloud providers offer managed KMS services '
            'specifically so organizations don\'t need to build this '
            'infrastructure themselves, often backed by HSMs underneath '
            'for the actual physical key protection.',
      ),
      LessonSection(
        heading: 'Secure Enclaves',
        body:
            'A secure enclave is an isolated, protected region of a '
            'processor where code and data can be processed while '
            'remaining encrypted and inaccessible to the rest of the '
            'system — including, in principle, even to a compromised '
            'operating system. This directly addresses the "data in '
            'use" protection gap introduced in the first lesson of this '
            'module, and underlies technologies like Apple\'s Secure '
            'Enclave (protecting biometric data on iPhones) and cloud '
            'confidential computing offerings.',
      ),
      LessonSection(
        heading: 'How These Tools Work Together in a Real Enterprise',
        body:
            'A large enterprise might use TPMs on every employee laptop '
            'to protect local disk encryption keys, an HSM to protect '
            'the root keys of its internal CA, a cloud KMS to manage '
            'encryption keys for its cloud-hosted databases and storage, '
            'and secure enclaves specifically for the small subset of '
            'workloads processing especially sensitive data that must '
            'remain protected even during active computation. Each tool '
            'addresses a different layer of the same overall problem: '
            'keeping cryptographic keys — and, in the enclave\'s case, '
            'the data itself — out of reach even from someone who has '
            'otherwise compromised the surrounding system.',
      ),
    ],
  ),

  // 8 ----------------------------------------------------------------------
  Lesson(
    title: 'Obfuscation',
    difficulty: LessonDifficulty.intermediate,
    estimatedMinutes: 9,
    sections: [
      LessonSection(
        heading: 'Hiding Data Without Encrypting It',
        body:
            'Obfuscation techniques protect data by disguising, hiding, '
            'or substituting it, rather than mathematically transforming '
            'it with an encryption algorithm. This makes obfuscation '
            'faster and simpler to apply in many contexts, though it '
            'generally provides weaker guarantees than genuine '
            'encryption and is best used to reduce risk and exposure '
            'rather than as a sole protection for genuinely sensitive '
            'data.',
      ),
      LessonSection(
        heading: 'Steganography',
        body:
            'Steganography conceals data or a message within another, '
            'completely innocuous-looking file — classically, hiding '
            'text or a small file within the pixel data of an image in '
            'a way invisible to casual viewing. Unlike encryption, which '
            'makes data obviously unreadable, steganography\'s goal is '
            'making the very existence of hidden data undetectable in '
            'the first place. As covered in the Threat Actors module, '
            'attackers can also abuse steganography to smuggle malicious '
            'payloads past security tools that aren\'t specifically '
            'looking for hidden content inside ordinary-looking image '
            'files.',
      ),
      LessonSection(
        heading: 'Tokenization',
        body:
            'Tokenization substitutes a sensitive piece of data — a '
            'credit card number, a social security number — with a '
            'non-sensitive placeholder token that has no exploitable '
            'mathematical relationship to the original value. The '
            'mapping between token and original value is stored '
            'securely in a separate, tightly controlled system; systems '
            'that only ever need to reference the token, not the actual '
            'sensitive value, never need to store or handle the real '
            'data at all, dramatically shrinking the scope of what needs '
            'protecting.',
      ),
      LessonSection(
        heading: 'Data Masking',
        body:
            'Data masking replaces or obscures sensitive information '
            'with realistic-looking but fake data, commonly used when '
            'creating a copy of a production database for software '
            'testing or development — masking real customer names, '
            'emails, and payment details with plausible fake equivalents '
            'so developers can still test realistically, without ever '
            'exposing genuine sensitive customer data outside of '
            'tightly controlled production systems.',
      ),
      LessonSection(
        heading: 'A Real-World Lab Demonstration',
        body:
            'A retail company\'s development team needs a realistic '
            'dataset to test a new checkout feature. Rather than copying '
            'genuine customer payment data into a less-secured test '
            'environment, the security team applies tokenization to '
            'replace every real card number with a token before the '
            'data leaves production, and data masking to replace real '
            'customer names and addresses with realistic fictional '
            'equivalents. Developers get data that behaves exactly like '
            'the real thing for testing purposes, while the actual '
            'sensitive values never exist anywhere outside the original, '
            'properly protected production environment.',
      ),
    ],
  ),

  // 9 ----------------------------------------------------------------------
  Lesson(
    title: 'Cryptographic Attacks',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 10,
    sections: [
      LessonSection(
        heading: 'Downgrade Attacks',
        body:
            'A downgrade attack tricks two communicating parties into '
            'using a weaker, older version of a protocol or a weaker '
            'cipher than they would otherwise use, specifically so the '
            'attacker can more easily break the resulting weaker '
            'encryption. A classic example: an attacker manipulating the '
            'TLS handshake to force a connection to fall back to an '
            'older, vulnerable version of TLS or SSL, even though both '
            'the client and server would otherwise have successfully '
            'negotiated a much stronger, modern connection.',
      ),
      LessonSection(
        heading: 'Collision Attacks',
        body:
            'A collision attack finds two different inputs that produce '
            'the identical hash output — directly undermining the '
            'integrity guarantee hashing is supposed to provide, since an '
            'attacker could potentially substitute a malicious file for '
            'a legitimate one while both produce the same hash value, '
            'defeating a hash-based integrity check entirely. Practical '
            'collision attacks have been successfully demonstrated '
            'against MD5 and, more recently, against SHA-1, which is '
            'precisely why both are now considered cryptographically '
            'broken for security purposes and SHA-256 is the current '
            'recommended standard.',
      ),
      LessonSection(
        heading: 'The Quantum Computing Threat',
        body:
            'Sufficiently powerful quantum computers, once they exist at '
            'scale, could theoretically break the mathematical '
            'assumptions underlying widely deployed asymmetric '
            'algorithms — RSA\'s prime factorization and ECC\'s elliptic '
            'curve problem are both believed to be efficiently solvable '
            'by a large enough quantum computer running a specific known '
            'algorithm (Shor\'s algorithm). This wouldn\'t just be a '
            'theoretical concern going forward — data encrypted today '
            'and intercepted now could potentially be decrypted '
            'retroactively once sufficiently powerful quantum computing '
            'becomes available, a concern often called "harvest now, '
            'decrypt later."',
      ),
      LessonSection(
        heading: 'Post-Quantum Cryptography Standards',
        body:
            'In direct response to this threat, NIST has standardized '
            'new cryptographic algorithms specifically designed to '
            'remain secure even against quantum computers, based on '
            'entirely different mathematical problems believed to '
            'resist quantum attack.',
        bullets: [
          'Kyber — a key encapsulation mechanism (essentially a post-quantum replacement for RSA/ECC-based key exchange), selected by NIST as the primary standard for general encryption',
          'Dilithium — a digital signature algorithm selected as the primary post-quantum signature standard',
          'Falcon — an alternative post-quantum digital signature algorithm, offering smaller signature sizes than Dilithium at some cost in signing speed',
          'SPHINCS+ — a stateless, hash-based signature scheme, included specifically as a structurally very different backup option in case unexpected weaknesses are later found in the math underlying the other selected algorithms',
        ],
      ),
      LessonSection(
        heading: 'What This Means for Organizations Today',
        body:
            'Practical, large-scale quantum computers capable of '
            'breaking RSA or ECC don\'t exist yet, but the migration to '
            'post-quantum algorithms is already actively underway across '
            'the industry, precisely because of the "harvest now, decrypt '
            'later" risk — any sufficiently sensitive data that needs to '
            'remain confidential for many years into the future is '
            'already a candidate for post-quantum protection today, well '
            'before quantum computers capable of breaking current '
            'encryption are expected to exist.',
      ),
    ],
  ),

  // 10 -------------------------------------------------------------- Quiz
  Lesson(
    title: 'Practice Quiz',
    difficulty: LessonDifficulty.expert,
    estimatedMinutes: 15,
    quiz: [
      QuizQuestion(
        question: 'Which state of data does confidential computing / secure enclave technology specifically address?',
        options: ['Data at rest', 'Data in transit', 'Data in use', 'Data in the trash'],
        correctIndex: 2,
        explanation: 'Secure enclaves protect data while it is actively being processed in memory, the hardest state to protect.',
      ),
      QuizQuestion(
        question: 'What is the fundamental limitation of symmetric encryption?',
        options: [
          'It is too slow for practical use',
          'Key distribution — securely sharing the one secret key between parties who have never communicated before',
          'It cannot encrypt large files',
          'It requires a Certificate Authority',
        ],
        correctIndex: 1,
        explanation: 'Securely agreeing on a shared secret key without an eavesdropper intercepting it is symmetric encryption\'s core challenge.',
      ),
      QuizQuestion(
        question: 'Which symmetric algorithm is the current global standard and default choice?',
        options: ['DES', '3DES', 'AES', 'RC4'],
        correctIndex: 2,
        explanation: 'AES has withstood over two decades of scrutiny with no practical full break and is the recommended default.',
      ),
      QuizQuestion(
        question: 'Why should RC4 never be used in new systems?',
        options: [
          'It is too slow',
          'It is a cryptographically broken stream cipher with known weaknesses',
          'It requires too much bandwidth',
          'It only works with IPv6',
        ],
        correctIndex: 1,
        explanation: 'RC4 has known cryptographic weaknesses and is considered broken for security purposes.',
      ),
      QuizQuestion(
        question: 'A 256-bit ECC key provides roughly the same security as which RSA key size?',
        options: ['256-bit RSA', '1024-bit RSA', '3072-bit RSA', '8192-bit RSA'],
        correctIndex: 2,
        explanation: 'ECC achieves equivalent security to RSA using dramatically smaller keys — 256-bit ECC roughly matches 3072-bit RSA.',
      ),
      QuizQuestion(
        question: 'Diffie-Hellman is primarily used for:',
        options: [
          'Encrypting large files directly',
          'Securely agreeing on a shared secret key over a public channel without transmitting the key itself',
          'Hashing passwords',
          'Issuing digital certificates',
        ],
        correctIndex: 1,
        explanation: 'Diffie-Hellman is a key exchange protocol, not a direct encryption algorithm.',
      ),
      QuizQuestion(
        question: 'In a digital signature, what is actually encrypted with the sender\'s private key?',
        options: ['The entire original message', 'A hash digest of the message', 'The recipient\'s public key', 'The CA\'s root certificate'],
        correctIndex: 1,
        explanation: 'The message is hashed first, and that fixed-length digest is what gets signed with the private key.',
      ),
      QuizQuestion(
        question: 'What does salting a password before hashing specifically defeat?',
        options: [
          'Brute-force attacks entirely',
          'Precomputed rainbow table attacks, since identical passwords now produce different hashes per user',
          'Phishing attacks',
          'Man-in-the-middle attacks',
        ],
        correctIndex: 1,
        explanation: 'Unique salts per password mean an attacker cannot use one precomputed table across all stored hashes.',
      ),
      QuizQuestion(
        question: 'Key stretching (using bcrypt, scrypt, or Argon2) primarily defends against:',
        options: [
          'Man-in-the-middle attacks',
          'Brute-force password guessing, by making each individual guess computationally expensive to test',
          'DNS spoofing',
          'Phishing emails',
        ],
        correctIndex: 1,
        explanation: 'Deliberately slow hashing makes brute-forcing large numbers of password guesses impractically expensive.',
      ),
      QuizQuestion(
        question: 'A birthday attack exploits:',
        options: [
          'A flaw in TLS certificate validation',
          'The probability that two different inputs produce the same hash becomes surprisingly likely faster than intuition suggests',
          'A weakness in symmetric key exchange',
          'A default password left unchanged',
        ],
        correctIndex: 1,
        explanation: 'The birthday paradox shows collisions become likely faster than expected as the number of hashed inputs grows.',
      ),
      QuizQuestion(
        question: 'What is the purpose of a Certificate Signing Request (CSR)?',
        options: [
          'To revoke an existing certificate',
          'To submit a public key and identity details to a CA for validation and certificate issuance',
          'To encrypt a private key',
          'To generate a symmetric session key',
        ],
        correctIndex: 1,
        explanation: 'A CSR is what an applicant submits to a CA to request that a certificate be issued.',
      ),
      QuizQuestion(
        question: 'What is the key difference between an internal PKI and an external PKI?',
        options: [
          'Internal PKI cannot issue any certificates',
          'External PKI uses a publicly trusted CA recognized by any device; internal PKI uses a private CA trusted only within the organization',
          'They are functionally identical',
          'External PKI is always free',
        ],
        correctIndex: 1,
        explanation: 'Internal PKI is trusted only inside the organization; external PKI is trusted broadly by any device on the internet.',
      ),
      QuizQuestion(
        question: 'OCSP stapling improves on standard OCSP by:',
        options: [
          'Eliminating the need for a CA entirely',
          'Having the web server itself attach a recent signed status response to its own certificate during the TLS handshake, avoiding a separate client query to the CA',
          'Making certificates last forever',
          'Removing the need for a root of trust',
        ],
        correctIndex: 1,
        explanation: 'OCSP stapling avoids the client needing to separately contact the CA, improving speed and reducing CA load.',
      ),
      QuizQuestion(
        question: 'What makes a blockchain resistant to tampering with historical records?',
        options: [
          'A single trusted administrator reviews every change',
          'Each block is cryptographically linked to the previous block\'s hash, so altering history breaks every subsequent link across all copies',
          'Blocks are encrypted with a password',
          'Only government agencies can access it',
        ],
        correctIndex: 1,
        explanation: 'Tamper resistance comes from the chained hash structure combined with the ledger being replicated across many independent nodes.',
      ),
      QuizQuestion(
        question: 'A collision attack against a hash function:',
        options: [
          'Finds two different inputs that produce the identical hash output',
          'Decrypts encrypted data without a key',
          'Forces a downgrade to a weaker TLS version',
          'Steals a private key directly',
        ],
        correctIndex: 0,
        explanation: 'Collision attacks undermine the integrity guarantee of hashing by finding two inputs with the same hash.',
      ),
      QuizQuestion(
        question: 'Why is post-quantum cryptography being adopted before large-scale quantum computers actually exist?',
        options: [
          'It is required by all current web browsers already',
          'Because of "harvest now, decrypt later" — data intercepted today could be decrypted retroactively once quantum computing matures',
          'Quantum computers already exist at sufficient scale today',
          'Post-quantum algorithms are faster than current algorithms',
        ],
        correctIndex: 1,
        explanation: 'Sensitive data needing long-term confidentiality is already at risk from future quantum decryption of data intercepted now.',
      ),
    ],
  ),
];
