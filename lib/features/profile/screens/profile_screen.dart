import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'User Name',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'user@example.com',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Carbon stats
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Carbon Footprint Summary',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    _buildStatRow(
                      context,
                      'Total CO₂ Emissions',
                      '0 kg',
                      Icons.cloud_outlined,
                    ),
                    _buildStatRow(
                      context,
                      'Scans This Month',
                      '0',
                      Icons.receipt_outlined,
                    ),
                    _buildStatRow(
                      context,
                      'Carbon Saved',
                      '0 kg',
                      Icons.eco_outlined,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Profile options
            Card(
              child: Column(
                children: [
                  _buildProfileOption(
                    context,
                    'Edit Profile',
                    Icons.edit_outlined,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  _buildProfileOption(
                    context,
                    'Notification Settings',
                    Icons.notifications_outlined,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  _buildProfileOption(
                    context,
                    'Privacy Settings',
                    Icons.security_outlined,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  _buildProfileOption(
                    context,
                    'Help & Support',
                    Icons.help_outline,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  _buildProfileOption(
                    context,
                    'Log Out',
                    Icons.logout,
                    textColor: theme.colorScheme.error,
                    iconColor: theme.colorScheme.error,
                    onTap: () {
                      context.go('/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildStatRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context,
    String title,
    IconData icon, {
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? theme.colorScheme.primary,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: textColor,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}