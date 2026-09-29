import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/splash_controller.dart';

/// Mobile-only widget — Progress bar with spinning status indicator below it.
class MobileProgressSection extends GetView<SplashController> {
  const MobileProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Linear progress bar
        Obx(
          () => ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: controller.progress.value,
              minHeight: 3,
              backgroundColor: AppColors.border,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.splashProgressBar,
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Spinner + status text row
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.textSecondary,
                  ),
                  value: controller.progress.value < 1.0 ? null : 1.0,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                controller.statusText.value,
                style: AppTextStyles.splashStatus,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
