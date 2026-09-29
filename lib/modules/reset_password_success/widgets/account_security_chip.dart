import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AccountSecurityChip extends StatelessWidget {
  const AccountSecurityChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5.5),
        decoration: BoxDecoration(
          color: AppColors.badgeMintBg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.badgeGreenDot,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              AppStrings.accountSecurityUpdated,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.badgeMintText,
                fontWeight: FontWeight.w700,
                fontSize: 11,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
