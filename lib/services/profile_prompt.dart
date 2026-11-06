import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Asks each signed-in user ONCE for an optional age group and
/// location, so the Admin Report can show who the learners are.
/// Everything is optional ("Skip" is always available) and is stored
/// in the user's own progress/summary document, which the client is
/// already allowed to write.
///
/// Fields written (all optional): ageGroup, country, state, city.
/// `profilePromptedAt` is always written so the prompt never repeats.
class ProfilePrompt {
  static const ageGroups = ['Under 18', '18-24', '25-34', '35-44', '45-54', '55+'];

  static const indianStates = [
    'Andaman and Nicobar Islands', 'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar',
    'Chandigarh', 'Chhattisgarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Delhi', 'Goa',
    'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jammu and Kashmir', 'Jharkhand', 'Karnataka',
    'Kerala', 'Ladakh', 'Lakshadweep', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya',
    'Mizoram', 'Nagaland', 'Odisha', 'Puducherry', 'Punjab', 'Rajasthan', 'Sikkim',
    'Tamil Nadu', 'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal',
  ];

  static DocumentReference<Map<String, dynamic>>? _summaryRef() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    return FirebaseFirestore.instance.collection('users').doc(uid).collection('progress').doc('summary');
  }

  /// Shows the dialog if this user has never been asked. Safe to call
  /// on every home-screen launch; it exits quickly when already asked.
  static Future<void> maybeShow(BuildContext context) async {
    try {
      final ref = _summaryRef();
      if (ref == null) return;
      final doc = await ref.get();
      if (doc.data()?['profilePromptedAt'] != null) return;
      if (!context.mounted) return;

      final result = await showDialog<Map<String, String?>>(
        context: context,
        barrierDismissible: false,
        builder: (_) => const _ProfileDialog(),
      );

      final update = <String, dynamic>{'profilePromptedAt': FieldValue.serverTimestamp()};
      if (result != null) {
        for (final key in ['ageGroup', 'country', 'state', 'city']) {
          final value = result[key]?.trim();
          if (value != null && value.isNotEmpty) update[key] = value;
        }
      }
      await ref.set(update, SetOptions(merge: true));
    } catch (_) {
      // Best-effort — never block the home screen.
    }
  }
}

class _ProfileDialog extends StatefulWidget {
  const _ProfileDialog();

  @override
  State<_ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<_ProfileDialog> {
  String? _ageGroup;
  String _country = 'India';
  String? _state;
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Help us tailor CyberPulse'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Optional. This helps us understand who is learning and improve the course. You can skip.',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _ageGroup,
              decoration: const InputDecoration(labelText: 'Age group', border: OutlineInputBorder()),
              items: [
                for (final a in ProfilePrompt.ageGroups) DropdownMenuItem(value: a, child: Text(a)),
              ],
              onChanged: (v) => setState(() => _ageGroup = v),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _country,
              decoration: const InputDecoration(labelText: 'Country', border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'India', child: Text('India')),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (v) => setState(() {
                _country = v ?? 'India';
                if (_country != 'India') _state = null;
              }),
            ),
            if (_country == 'India') ...[
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _state,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'State / UT', border: OutlineInputBorder()),
                items: [
                  for (final s in ProfilePrompt.indianStates) DropdownMenuItem(value: s, child: Text(s)),
                ],
                onChanged: (v) => setState(() => _state = v),
              ),
            ],
            const SizedBox(height: 12),
            TextField(
              controller: _cityController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'City (optional)', border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Skip')),
        FilledButton(
          onPressed: () => Navigator.pop(context, {
            'ageGroup': _ageGroup,
            'country': _country,
            'state': _state,
            'city': _cityController.text,
          }),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
