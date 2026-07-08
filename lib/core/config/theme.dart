import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF177E68);
  static const Color secondaryGreen = Color(0xFF155A4A);
  static const Color darkGreen = Color(0xFF105C46);

  static const Color lightGreen = Color(0xFF19CCA3);
  static const Color lime = Color(0xFF1FCFC3);
  static const Color backgroundClean = Colors.white;
  static const Color cardBackground = Color(0xFFF5F5F5);

  static const Color textDark = Color(0xFF1A1A1A);
  static const Color darkShadow = Color(0xFF000000);
  static const Color textLight = Colors.white;
  static const Color textMuted = Colors.white70;
  static const Color grey = Color(0xFFD3D1D2);
  static const Color darkGrey = Color(0xFFBDBDBD);

  static const Color errorRed = Color(0xFFE53935);
  static const Color warningYellow = Color(0xFFFFC107);
  static const Color gold = Color(0xFFF59E0B);
  static const Color orange = Color(0xFFC5681C);
  static const Color spanBlue = Color(0xFF1E88E5);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundClean,
      primaryColor: AppColors.primaryGreen,

      fontFamily: 'Gabarito',

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textLight,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors.textDark,
        ),
        labelSmall: TextStyle(fontSize: 14, color: AppColors.textMuted),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

extension CustomTextTheme on TextTheme {
  TextStyle get bodyMuted => const TextStyle(
    fontSize: 14,
    color: AppColors.textMuted,
    fontWeight: FontWeight.w500,
  );
}
