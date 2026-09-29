import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'onboarding_page_dots.dart';
import 'onboarding_next_button.dart';
import 'onboarding_step_label.dart';

/// Desktop bottom bar: Previous + Step label | Dots | Next button.
class DesktopOnboardingBottomBar extends StatelessWidget {
  const DesktopOnboardingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
      decoration: const BoxDecoration(
        color: AppColors.backgroundWhite,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          // Previous + Step label (left)
          const Expanded(child: OnboardingStepLabel()),

          // Dots (center)
          const OnboardingPageDots(),

          // Next button (right, fixed width)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 220,
                child: const OnboardingNextButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
