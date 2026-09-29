import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/splash_controller.dart';
import 'desktop_status_check_item.dart';

/// Desktop-only widget — Right loading panel with progress bar, percentage, and status checklist.
class DesktopRightPanel extends GetView<SplashController> {
  const DesktopRightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundWhite,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // System status header row
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'System Status',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text('Initializing\nHostelFlow', style: AppTextStyles.titleLarge),

              const SizedBox(height: 8),

              Text(
                'Please wait while we set up your campus management environment.',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 36),

              // Progress bar with percentage label
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.statusText.value,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          '${(controller.progress.value * 100).toInt()}%',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: LinearProgressIndicator(
                        value: controller.progress.value,
                        minHeight: 6,
                        backgroundColor: AppColors.border,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.splashProgressBar,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Animated status checklist
              Obx(() {
                final progress = controller.progress.value;
                return Column(
                  children: [
                    DesktopStatusCheckItem(
                      label: 'Loading core services',
                      isDone: progress >= 0.30,
                    ),
                    const SizedBox(height: 12),
                    DesktopStatusCheckItem(
                      label: 'Applying configuration',
                      isDone: progress >= 0.60,
                    ),
                    const SizedBox(height: 12),
                    DesktopStatusCheckItem(
                      label: 'System ready',
                      isDone: progress >= 1.0,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
