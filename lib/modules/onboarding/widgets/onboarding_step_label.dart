import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/onboarding_controller.dart';

/// Bottom navigation row: "< Previous" (left) | "Step X of Y" (right).
///
/// "< Previous" hidden on the first page.
class OnboardingStepLabel extends GetView<OnboardingController> {
  const OnboardingStepLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous link (hidden on page 0)
          controller.isFirstPage
              ? const SizedBox(width: 80)
              : GestureDetector(
                  onTap: controller.previousPage,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.chevron_left_rounded,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      Text(
                        'Previous',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

          // Step label
          Text(
            controller.stepLabel,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      );
    });
  }
}
