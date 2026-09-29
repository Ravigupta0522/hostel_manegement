import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/onboarding_controller.dart';
import 'mobile_onboarding_view.dart';
import 'desktop_onboarding_view.dart';

/// Onboarding Entry Point — shown once after Splash, before Login.
///
/// This view's ONLY responsibility is to decide which layout to render
/// based on the current screen size, using the [Responsive] utility.
///
/// - Mobile / Tablet  (< 1024px wide) → [MobileOnboardingView]
/// - Desktop          (≥ 1024px wide) → [DesktopOnboardingView]
///
/// Both views use the same [OnboardingController] for all state and logic.
class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopOnboardingView();
    }
    return const MobileOnboardingView();
  }
}
