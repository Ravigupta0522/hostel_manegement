import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Base font
  static TextStyle _base({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.textPrimary,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Display / Headlines
  static TextStyle get displayLarge => _base(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.5,
      );

  static TextStyle get displayMedium => _base(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.3,
      );

  // Titles
  static TextStyle get titleLarge => _base(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.3,
        letterSpacing: -0.2,
      );

  static TextStyle get titleMedium => _base(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.35,
      );

  static TextStyle get titleSmall => _base(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  // Body
  static TextStyle get bodyLarge => _base(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodyMedium => _base(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodySmall => _base(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  // Labels
  static TextStyle get labelLarge => _base(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 0.1,
      );

  static TextStyle get labelMedium => _base(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.2,
      );

  static TextStyle get labelSmall => _base(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.3,
      );

  // Splash specific
  static TextStyle get splashAppName => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
        height: 1.1,
      );

  static TextStyle get splashTagline => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
        letterSpacing: 0.1,
      );

  static TextStyle get splashStatus => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0.2,
      );

  static TextStyle get splashBadge => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.textWhite,
        letterSpacing: 0.5,
      );

  static TextStyle get splashVersion => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textLight,
        letterSpacing: 0.1,
      );
}
