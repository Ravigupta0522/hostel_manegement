import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/mobile_top_bar.dart';
import '../widgets/splash_app_icon.dart';
import '../widgets/splash_app_name.dart';
import '../widgets/splash_tagline.dart';
import '../widgets/mobile_progress_section.dart';
import '../widgets/mobile_bottom_info.dart';

/// Mobile Splash View — Portrait optimized layout (matching the design image).
///
/// Composes all mobile-specific widgets from the [splash/widgets] directory.
/// Uses [SplashController] via each widget independently (GetView pattern).
class MobileSplashView extends StatelessWidget {
  const MobileSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar: Campus Cloud + SSL
            MobileTopBar(),

            // ── Center content
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App icon with badge
                      SplashAppIcon(
                        iconSize: 88,
                        iconInner: 44,
                        borderRadius: 22,
                      ),

                      SizedBox(height: 28),

                      // HostelFlow name
                      SplashAppName(fontSize: 28),

                      SizedBox(height: 8),

                      // Tagline
                      SplashTagline(fontSize: 13),

                      SizedBox(height: 40),

                      // Progress bar + spinner + status
                      MobileProgressSection(),
                    ],
                  ),
                ),
              ),
            ),

            // ── Bottom version info
            MobileBottomInfo(),
          ],
        ),
      ),
    );
  }
}
