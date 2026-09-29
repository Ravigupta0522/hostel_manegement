import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Shared widget — Splash tagline text.
/// Mobile: centered, smaller font.
/// Desktop: left-aligned, larger font, plain Text (no RichText needed).
class SplashTagline extends StatelessWidget {
  final double fontSize;
  final TextAlign textAlign;
  final double? lineHeight;

  const SplashTagline({
    super.key,
    required this.fontSize,
    this.textAlign = TextAlign.center,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Smart Campus Living & ',
            style: AppTextStyles.splashTagline.copyWith(
              fontSize: fontSize,
              height: lineHeight,
            ),
          ),
          TextSpan(
            text: 'Hostel\n',
            style: AppTextStyles.splashTagline.copyWith(
              fontSize: fontSize,
              height: lineHeight,
              color: AppColors.primary,
            ),
          ),
          TextSpan(
            text: 'Operations Made Effortless',
            style: AppTextStyles.splashTagline.copyWith(
              fontSize: fontSize,
              height: lineHeight,
            ),
          ),
        ],
      ),
    );
  }
}
