import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/animated_page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Show notifications
            },
          ),
        ],
      ),
      body: AnimatedPageTransition(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome section with staggered animations
              const SizedBox(height: 16),
              Text(
                'Welcome to Collect',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
                
              const SizedBox(height: 8),
              Text(
                'Track your carbon footprint',
                style: theme.textTheme.titleLarge,
              ),
                
              const SizedBox(height: 32),
              
              // Carbon impact card with animated entrance
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.eco_outlined,
                            color: theme.colorScheme.primary,
                            size: 28,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Your Carbon Impact',
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Scan a receipt to get started tracking your carbon footprint. We\'ll analyze your purchases and show their environmental impact.',
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.go('/scan');
                          },
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Start Scanning'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                
              const SizedBox(height: 24),
              
              // Tips section with animation
              Text(
                'Eco Tips',
                style: theme.textTheme.titleLarge,
              ),
                
              const SizedBox(height: 16),
              
              _buildEcoTip(
                context,
                icon: Icons.shopping_bag_outlined,
                title: 'Reduce Plastic Bags',
                description: 'Bring reusable bags when shopping to reduce plastic waste.',
              ),
                
              const SizedBox(height: 16),
              
              _buildEcoTip(
                context,
                icon: Icons.local_drink_outlined,
                title: 'Reusable Water Bottles',
                description: 'Using a reusable water bottle can save hundreds of plastic bottles per year.',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildEcoTip(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}