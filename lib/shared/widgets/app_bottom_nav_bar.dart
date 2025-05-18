import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    // Colors for the navigation bar
    final activeColor = theme.colorScheme.primary;
    final backgroundColor = isDarkMode 
        ? const Color(0xFF1A1A1A) 
        : Colors.white;
    final inactiveColor = isDarkMode 
        ? Colors.white60 
        : AppTheme.textMedium;
    
    return ConvexAppBar(
      backgroundColor: backgroundColor,
      activeColor: activeColor,
      color: inactiveColor,
      items: [
        const TabItem(icon: Icons.home_outlined, title: 'Home'),
        const TabItem(icon: Icons.insights_outlined, title: 'Results'),
        const TabItem(icon: Icons.camera_alt, title: 'Scan'),
        const TabItem(icon: Icons.history_outlined, title: 'History'),
        const TabItem(icon: Icons.person_outline, title: 'Profile'),
      ],
      initialActiveIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      style: TabStyle.fixed, // Simple style without animations
      height: 60,
      top: -20, // Raises center tab slightly
      curveSize: 80, // Controls the curve size
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (currentIndex == index) return;
    
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/results');
        break;
      case 2:
        context.go('/scan');
        break;
      case 3:
        context.go('/history');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }
}