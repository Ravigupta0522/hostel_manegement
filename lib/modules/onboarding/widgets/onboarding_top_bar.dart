import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../controllers/onboarding_controller.dart';

/// Top bar: Back arrow | Centered badge/step | Skip.
///
/// - Normal pages   → shield icon + thematic badge ("CAMPUS PAY SAFE")
/// - Last page      → "STEP 3 OF 3" in primary blue bold
class OnboardingTopBar extends GetView<OnboardingController> {
  const OnboardingTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Obx(() {
        return Row(
          children: [
            // ── Back button (hidden on page 0)
            SizedBox(
              width: 52,
              child: controller.isFirstPage
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: controller.previousPage,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
            ),

            // ── Center: step label or thematic badge
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.currentPageData.topBadgeIsStep
                    ? _StepCenterLabel(
                        key: ValueKey('step_${controller.currentPage.value}'),
                        label: controller.currentPageData.topBadge,
                      )
                    : _ThematicBadge(
                        key: ValueKey('badge_${controller.currentPage.value}'),
                        label: controller.currentPageData.topBadge,
                      ),
              ),
            ),

            // ── Skip (hidden on last page)
            SizedBox(
              width: 52,
              child: controller.isLastPage
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: controller.skipOnboarding,
                        child: Text(
                          AppStrings.onboardingSkip,
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        );
      }),
    );
  }
}

// ── "STEP 3 OF 3" — bold blue, used on last page
class _StepCenterLabel extends StatelessWidget {
  final String label;
  const _StepCenterLabel({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: AppTextStyles.labelMedium.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.8,
      ),
    );
  }
}

// ── Shield + thematic text — used on pages 1 & 2
class _ThematicBadge extends StatelessWidget {
  final String label;
  const _ThematicBadge({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.shield_rounded, size: 13, color: AppColors.primary),
        const SizedBox(width: 5),
        Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: AppColors.textSecondary,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
