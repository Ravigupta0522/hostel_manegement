import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/reset_password_success_controller.dart';

class ResetPasswordCtaButton extends GetView<ResetPasswordSuccessController> {
  const ResetPasswordCtaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: controller.backToLogin,
        child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.portalNavy,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.portalNavy.withValues(alpha: 0.28),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.backToLogin,
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.textWhite,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
