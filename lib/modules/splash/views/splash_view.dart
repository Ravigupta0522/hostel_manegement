import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/splash_controller.dart';
import 'mobile_splash_view.dart';
import 'desktop_splash_view.dart';

/// Main Splash Entry Point.
///
/// This view's ONLY responsibility is to decide which layout to render
/// based on the current screen size, using the [Responsive] utility.
///
/// - Mobile / Tablet  (< 1024px wide) → [MobileSplashView]
/// - Desktop          (≥ 1024px wide) → [DesktopSplashView]
///
/// Both views use the same [SplashController] for all state and logic.
class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Decide layout based on screen width
    if (Responsive.isDesktop(context)) {
      return const DesktopSplashView();
    }
    return const MobileSplashView();
  }
}
