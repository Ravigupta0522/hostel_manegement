import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_top_bar.dart';
import '../widgets/onboarding_page_content.dart';
import '../widgets/onboarding_page_dots.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_step_label.dart';

/// Mobile Onboarding View — Portrait-optimized single-column layout.
///
/// Layout:
///  ┌─────────────────────────────┐
///  │  ← | CAMPUS PAY SAFE | Skip │  ← OnboardingTopBar
///  ├─────────────────────────────┤
///  │     Mock UI Card            │  ─┐
///  │     (page-specific)         │   │ PageView
///  │  Badge + Title + Subtitle   │  ─┘
///  ├─────────────────────────────┤
///  │         ● ─ ●               │  ← Dots
///  │  [Continue to Verification →]  ← Button
///  │  < Previous       Step 2 of 3  ← StepLabel
///  └─────────────────────────────┘
class MobileOnboardingView extends GetView<OnboardingController> {
  const MobileOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar: Back | Badge | Skip
            const OnboardingTopBar(),

            // ── Swipeable page content
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.pages.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return OnboardingPageContent(
                    page: controller.pages[index],
                    pageIndex: index,
                    isMobile: true,
                  );
                },
              ),
            ),

            // ── Bottom section
            Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
              decoration: const BoxDecoration(
                color: AppColors.background,
              ),
              child: Column(
                children: [
                  // Animated dot indicators
                  const OnboardingPageDots(),
                  const SizedBox(height: 20),

                  // CTA button (per-page label)
                  const OnboardingNextButton(),
                  const SizedBox(height: 14),

                  // < Previous | Step X of Y
                  const OnboardingStepLabel(),

                  // Footer note — amber text on last page
                  Obx(() {
                    final note = controller.footerNote;
                    if (note == null) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        note,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
