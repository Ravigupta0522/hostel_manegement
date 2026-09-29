import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordFooter extends GetView<ForgotPasswordController> {
  const ForgotPasswordFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Back to Login link
          InkWell(
            onTap: controller.goToLogin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back_rounded,
                  size: 15,
                  color: AppColors.portalNavy,
                ),
                const SizedBox(width: 6),
                Text(
                  AppStrings.backToLogin,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.portalNavy,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Security pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.badgeGreenBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.shield_outlined,
                  size: 14,
                  color: AppColors.badgeGreenDot,
                ),
                const SizedBox(width: 6),
                Text(
                  AppStrings.securedCampusIdentity,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.badgeGreenText,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
