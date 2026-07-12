import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.currentUser;
    final name = (user?.displayName?.trim().isNotEmpty ?? false) ? user!.displayName! : 'Learner';
    final email = user?.email ?? 'No email on file';
    final photoUrl = user?.photoURL;
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Scaffold(
      appBar: AppBar(title: const Text('My Account')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.indigo,
                  backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
                  child: photoUrl == null
                      ? Text(initial, style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold))
                      : null,
                ),
                const SizedBox(height: 14),
                Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(email, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Card(
            child: Column(
              children: [
                _InfoTile(
                  icon: Icons.badge_outlined,
                  label: 'Sign-in method',
                  value: _signInMethodLabel(user?.providerData),
                ),
                const Divider(height: 1),
                _InfoTile(
                  icon: Icons.calendar_today_outlined,
                  label: 'Member since',
                  value: _formatDate(user?.metadata.creationTime),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Sign Out?'),
                    content: const Text('You can sign back in anytime with the same account.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                      FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Sign Out')),
                    ],
                  ),
                );
                if (confirmed == true) {
                  await AuthService.signOut();
                  // main.dart's authStateChanges StreamBuilder automatically
                  // routes back to the sign-in screen once this completes.
                  if (context.mounted) Navigator.of(context).popUntil((route) => route.isFirst);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String _signInMethodLabel(List<dynamic>? providerData) {
    if (providerData == null || providerData.isEmpty) return 'Unknown';
    final providerId = providerData.first.providerId as String?;
    switch (providerId) {
      case 'google.com':
        return 'Google';
      case 'facebook.com':
        return 'Facebook';
      case 'password':
        return 'Email & Password';
      default:
        return providerId ?? 'Unknown';
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Unknown';
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(label, style: const TextStyle(fontSize: 13)),
      trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
