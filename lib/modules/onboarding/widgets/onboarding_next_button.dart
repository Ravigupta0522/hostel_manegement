import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/onboarding_controller.dart';

/// Full-width CTA button — label changes per page.
class OnboardingNextButton extends GetView<OnboardingController> {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: controller.nextPage,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.30),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.nextButtonLabel,
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.textWhite,
                  fontSize: 15,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.textWhite,
                size: 17,
              ),
            ],
          ),
        ),
      );
    });
  }
}
