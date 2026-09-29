import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_register_controller.dart';

class StudentRegisterFooter extends GetView<StudentRegisterController> {
  const StudentRegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // ── OR divider
          Row(
            children: [
              const Expanded(
                child: Divider(color: AppColors.borderLight, thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'OR',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(color: AppColors.borderLight, thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Already registered? Log in
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.alreadyRegistered,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSlate,
                  fontSize: 13,
                ),
              ),
              InkWell(
                onTap: controller.goToLogin,
                child: Text(
                  AppStrings.logIn,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.portalNavy,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 256-Bit Encrypted Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.cardLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.lock_rounded,
                  size: 13,
                  color: AppColors.portalOcean,
                ),
                const SizedBox(width: 6),
                Text(
                  AppStrings.encryptedBadge,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.portalOcean,
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
