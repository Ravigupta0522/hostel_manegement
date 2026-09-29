import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Shared widget — "HostelFlow" rich-text app name.
/// Used in both Mobile and Desktop splash layouts.
class SplashAppName extends StatelessWidget {
  final double fontSize;
  final TextAlign textAlign;

  const SplashAppName({
    super.key,
    required this.fontSize,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Hostel',
            style: AppTextStyles.splashAppName.copyWith(
              fontSize: fontSize,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: 'Flow',
            style: AppTextStyles.splashAppName.copyWith(
              fontSize: fontSize,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
