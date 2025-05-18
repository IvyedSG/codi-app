import 'package:flutter/material.dart';

/// Constants used across the app
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 350);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // Icon sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeExtraLarge = 48.0;

  // Standard opacities
  static const double disabledOpacity = 0.5;
  static const double overlayOpacity = 0.8;
  static const double hintOpacity = 0.6;

  // Standard shadows
  static List<BoxShadow> smallShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> largeShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  // Carbon footprint impact levels
  static const double lowImpactThreshold = 5.0;  // kg CO2
  static const double mediumImpactThreshold = 15.0;  // kg CO2

  // App-specific constants
  static const String appName = 'Codi';  // Changed from 'Collect'
  static const String appTagline = 'Track your carbon footprint';
  static const String appVersion = '1.0.0';

  // Asset paths
  static const String logoPath = 'assets/images/logo.png';
  static const String placeholderImagePath = 'assets/images/placeholder.png';
}