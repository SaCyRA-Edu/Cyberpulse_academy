import 'package:flutter/material.dart';

class CertificateScreen extends StatefulWidget {
  final double scorePercentage;

  const CertificateScreen({super.key, required this.scorePercentage});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _generated = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String get _formattedDate {
    final now = DateTime.now();
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Certificate of Achievement')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _generated ? _buildCertificate() : _buildNameEntry(),
        ),
      ),
    );
  }

  Widget _buildNameEntry() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.workspace_premium, size: 64, color: Colors.amber),
        const SizedBox(height: 16),
        const Text(
          'Enter your name exactly as you\'d like it to appear on your certificate.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _nameController,
          textCapitalization: TextCapitalization.words,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            labelText: 'Full Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _nameController.text.trim().isEmpty
                ? null
                : () => setState(() => _generated = true),
            child: const Text('Generate Certificate'),
          ),
        ),
      ],
    );
  }

  Widget _buildCertificate() {
    final name = _nameController.text.trim();
    return Column(
      children: [
        Container(
          width: 340,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD4AF37), width: 4),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 16, offset: const Offset(0, 6)),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle),
                child: const Icon(Icons.shield, color: Colors.white, size: 32),
              ),
              const SizedBox(height: 12),
              const Text(
                'CERTIFICATE OF ACHIEVEMENT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Color(0xFF283593),
                ),
              ),
              const SizedBox(height: 4),
              const Text('LEARNING CYBERSECURITY', style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 1)),
              const SizedBox(height: 20),
              const Text('This certifies that', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 8),
              Container(height: 1, width: 180, color: Colors.grey.shade300),
              const SizedBox(height: 12),
              const Text(
                'has successfully passed the Final Certification Exam, '
                'demonstrating comprehensive knowledge across the full '
                'Learning Cybersecurity curriculum.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5, height: 1.5),
              ),
              const SizedBox(height: 16),
              Text(
                'Score: ${widget.scorePercentage.toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
              ),
              const SizedBox(height: 4),
              Text(_formattedDate, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(height: 1, width: 90, color: Colors.grey.shade400),
                      const SizedBox(height: 4),
                      const Text('Date Issued', style: TextStyle(fontSize: 9, color: Colors.grey)),
                    ],
                  ),
                  Column(
                    children: const [
                      Text('Learning', style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                      Text('Cybersecurity', style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                      Text('Issuing Authority', style: TextStyle(fontSize: 9, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: Colors.blue),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Take a screenshot to save or share your certificate.',
                  style: TextStyle(fontSize: 12.5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => _generated = false),
          child: const Text('Edit Name'),
        ),
      ],
    );
  }
}
