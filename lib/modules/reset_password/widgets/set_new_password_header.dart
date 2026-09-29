import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SetNewPasswordHeader extends StatelessWidget {
  const SetNewPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            AppStrings.setNewPasswordTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.displayLarge.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.textDarkNavy,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.setNewPasswordSub,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
