import 'package:flutter/material.dart';

/// App theme configuration for Codi
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Brand colors - Updated to match Figma design
  static const Color primaryGreen = Color(0xFF9AE1B7); // Verde Primary
  static const Color secondaryGreen = Color(0xFF1C6734); // Verde Secondary
  static const Color accentColor =
      Color(0xFF9AE1B7); // Using primaryGreen as accent
  static const Color surfaceColor = Color(0xFFEEF6F6); // Fondo
  static const Color backgroundDark = Color(0xFF282727); // Color Negro

  // Neutral colors
  static const Color textDark = Color(0xFF282727); // Using Negro for text
  static const Color textMedium = Color(0xFF757575);
  static const Color textLight = Color(0xFFBDBDBD);
  static const Color dividerColor = Color(0xFFE0E0E0);

  // Semantic colors
  static const Color successColor = Color(0xFF9AE1B7); // Using primaryGreen
  static const Color warningColor =
      Color(0xFFFFC107); // Keeping yellow for warning
  static const Color errorColor = Color(0xFFE53935); // Keeping red for error
  static const Color infoColor = Color(0xFF2196F3); // Keeping blue for info

  // Additional environmental colors for visualization
  static const Color lowImpactColor = Color(0xFF9AE1B7); // Using primaryGreen
  static const Color mediumImpactColor = Color(0xFFFFC107); // Keeping yellow
  static const Color highImpactColor = Color(0xFFFF5722); // Keeping orange

  // Paddings
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  // Border radii
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusExtraLarge = 24.0;

  // Fonts
  static const String primaryFontFamily = 'Roboto';
  static const String secondaryFontFamily = 'Montserrat';

  /// Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: primaryGreen,
      primaryContainer: primaryGreen.withOpacity(0.1),
      onPrimary: textDark, // Texto oscuro sobre verde claro
      secondary: secondaryGreen,
      secondaryContainer: secondaryGreen.withOpacity(0.1),
      onSecondary: Colors.white, // Texto blanco sobre verde oscuro
      surface: surfaceColor,
      background: surfaceColor, // Fondo principal #EEF6F6
      error: errorColor,
      onBackground: textDark,
      onSurface: textDark,
      onError: Colors.white,
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 1, // Elevación sutil como en Figma
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
      ),
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceColor, // Fondo claro #EEF6F6
      foregroundColor: textDark,
      elevation: 0,
      centerTitle: true, // Títulos centrados como en Figma
      titleTextStyle: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textDark,
      ),
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: textDark, // Texto negro sobre botones verdes
        backgroundColor: primaryGreen,
        padding: const EdgeInsets.symmetric(
          horizontal: paddingLarge,
          vertical: paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
        elevation: 0, // Sin sombra como en Figma
        textStyle: const TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: secondaryGreen,
        side: const BorderSide(color: secondaryGreen, width: 1.5),
        padding: const EdgeInsets.symmetric(
          horizontal: paddingLarge,
          vertical: paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
        textStyle: const TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: secondaryGreen,
        textStyle: const TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
        ),
      ),
    ),

    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryGreen,
      foregroundColor: textDark, // Iconos oscuros sobre FAB verde
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusLarge),
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(paddingMedium),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: BorderSide(color: textLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: BorderSide(color: dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: BorderSide(color: secondaryGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: BorderSide(color: errorColor),
      ),
      labelStyle: TextStyle(color: textMedium),
      hintStyle: TextStyle(color: textLight),
    ),

    // Text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      displayMedium: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      displaySmall: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textDark,
      ),
      headlineLarge: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textDark,
      ),
      headlineMedium: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textDark,
      ),
      headlineSmall: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textDark,
      ),
      titleLarge: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: textDark,
      ),
      titleMedium: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textDark,
      ),
      bodyLarge: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textDark,
      ),
      bodyMedium: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textDark,
      ),
      bodySmall: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textMedium,
      ),
      labelLarge: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: textDark,
      ),
    ),

    // Tab bar theme
    tabBarTheme: TabBarThemeData(
      labelColor: secondaryGreen,
      unselectedLabelColor: textMedium,
      indicatorColor: secondaryGreen,
      labelStyle: const TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Divider theme
    dividerTheme: DividerThemeData(
      color: dividerColor,
      thickness: 1,
      space: 1,
    ),

    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: surfaceColor,
      selectedColor: primaryGreen.withOpacity(0.2),
      secondarySelectedColor: secondaryGreen,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        color: textDark,
      ),
      secondaryLabelStyle: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        color: secondaryGreen,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
      ),
    ),

    // Snackbar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: textDark,
      contentTextStyle: const TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );

  /// Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: primaryGreen,
      primaryContainer: primaryGreen.withOpacity(0.15),
      onPrimary: backgroundDark, // Texto oscuro sobre verde
      secondary: secondaryGreen,
      secondaryContainer: secondaryGreen.withOpacity(0.15),
      onSecondary: Colors.white,
      surface: backgroundDark,
      background: backgroundDark, // Fondo principal #282727
      error: errorColor,
      onBackground: Colors.white,
      onSurface: Colors.white,
      onError: Colors.white,
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: const Color(0xFF333333), // Un poco más claro que el fondo
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
      ),
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: textDark, // Texto oscuro sobre verde
        backgroundColor: primaryGreen,
        padding: const EdgeInsets.symmetric(
          horizontal: paddingLarge,
          vertical: paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
        elevation: 0,
        textStyle: const TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryGreen,
        side: const BorderSide(color: primaryGreen, width: 1.5),
        padding: const EdgeInsets.symmetric(
          horizontal: paddingLarge,
          vertical: paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
        textStyle: const TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryGreen,
        textStyle: const TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
        ),
      ),
    ),

    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryGreen,
      foregroundColor: textDark, // Iconos oscuros sobre FAB verde
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusLarge),
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF333333), // Un poco más claro que el fondo
      contentPadding: const EdgeInsets.all(paddingMedium),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: const BorderSide(color: Color(0xFF424242)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: const BorderSide(color: Color(0xFF424242)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: BorderSide(color: primaryGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: BorderSide(color: errorColor),
      ),
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white38),
    ),

    // Text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      labelLarge: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: Colors.white,
      ),
    ),

    // Tab bar theme
    tabBarTheme: TabBarThemeData(
      labelColor: primaryGreen,
      unselectedLabelColor: Colors.white70,
      indicatorColor: primaryGreen,
      labelStyle: const TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: Color(0xFF424242),
      thickness: 1,
      space: 1,
    ),

    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: Color(0xFF333333),
      selectedColor: primaryGreen.withOpacity(0.3),
      secondarySelectedColor: primaryGreen,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: const TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        color: Colors.white,
      ),
      secondaryLabelStyle: TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        color: primaryGreen,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
      ),
    ),

    // Snackbar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xFF333333),
      contentTextStyle: const TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: 14,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
