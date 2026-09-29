import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_top_bar.dart';
import '../widgets/onboarding_page_content.dart';
import '../widgets/desktop_onboarding_bottom_bar.dart';

/// Desktop Onboarding View — Wide landscape two-panel layout.
///
/// Composes all onboarding widgets from [onboarding/widgets].
/// Uses [OnboardingController] via GetView pattern.
///
/// Layout:
///  ┌──────────────────────────────────────┐
///  │  TopBar (Logo + Skip)                │
///  ├────────────────────┬─────────────────┤
///  │  Text: badge +     │  Mock UI Card   │
///  │  title + subtitle  │                 │
///  ├────────────────────┴─────────────────┤
///  │  StepLabel   ● ● ●   [Next →]        │
///  └──────────────────────────────────────┘
class DesktopOnboardingView extends GetView<OnboardingController> {
  const DesktopOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.07),
                  blurRadius: 40,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              children: [
                // ── Top bar: Logo + Skip
                const OnboardingTopBar(),

                const Divider(height: 0, color: AppColors.border),

                // ── Swipeable pages (landscape: text | card)
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.pages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPageContent(
                        page: controller.pages[index],
                        pageIndex: index,
                        isMobile: false,
                      );
                    },
                  ),
                ),

                // ── Bottom bar: step label + dots + next button
                const DesktopOnboardingBottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
