import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StudentSettingsVerifiedStrip extends StatelessWidget {
  const StudentSettingsVerifiedStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.badgeMintBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF6EE7B7)),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_rounded, color: Color(0xFF059669), size: 18),
          const SizedBox(width: 8),
          Text(
            'Hostel ${AppStrings.onboardingVerified} Resident',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.badgeMintText,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          Text(
            AppStrings.onboardingVerified,
            style: AppTextStyles.labelSmall.copyWith(
              color: const Color(0xFF059669),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
