import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6C5CE7);
  static const primaryLight = Color(0xFFA29BFE);
  static const secondary = Color(0xFF00CECE);
  static const accent = Color(0xFFFD79A8);
  static const success = Color(0xFF00B894);
  static const error = Color(0xFFE17055);
  static const warning = Color(0xFFFDCB6E);
  static const background = Color(0xFFF8F9FA);
  static const card = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF2D3436);
  static const textSecondary = Color(0xFF636E72);
  static const border = Color(0xFFE0E0E0);
  static const skeleton = Color(0xFFE8E8E8);
}

class CategoryColors {
  static const electronics = Color(0xFF3498DB);
  static const books = Color(0xFFE67E22);
  static const clothing = Color(0xFFFD79A8);
  static const dormStuff = Color(0xFF6C5CE7);
  static const utilities = Color(0xFF636E72);
  static const sports = Color(0xFF00B894);
  static const tickets = Color(0xFFFDCB6E);
  static const other = Color(0xFFDFE6E9);

  static Color fromCategory(String category) {
    switch (category) {
      case 'electronics': return electronics;
      case 'books': return books;
      case 'clothing': return clothing;
      case 'dorm_stuff': return dormStuff;
      case 'utilities': return utilities;
      case 'sports': return sports;
      case 'tickets': return tickets;
      default: return other;
    }
  }
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.card,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
