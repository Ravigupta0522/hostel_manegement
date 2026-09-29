import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/desktop_top_bar.dart';
import '../widgets/desktop_left_panel.dart';
import '../widgets/desktop_right_panel.dart';
import '../widgets/desktop_bottom_bar.dart';

/// Desktop Splash View — Wide two-panel landscape layout.
///
/// Composes all desktop-specific widgets from the [splash/widgets] directory.
/// Left panel → branding/hero. Right panel → loading/status.
class DesktopSplashView extends StatelessWidget {
  const DesktopSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Column(
        children: [
          // ── Full-width top bar
          const DesktopTopBar(),

          // ── Main two-panel row
          Expanded(
            child: Row(
              children: [
                // ── Left panel — Branding / Hero (flex 5)
                const Expanded(
                  flex: 5,
                  child: DesktopLeftPanel(),
                ),

                // ── Vertical divider
                Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(vertical: 48),
                  color: AppColors.border,
                ),

                // ── Right panel — Loading / Status (flex 4)
                const Expanded(
                  flex: 4,
                  child: DesktopRightPanel(),
                ),
              ],
            ),
          ),

          // ── Full-width bottom bar
          const DesktopBottomBar(),
        ],
      ),
    );
  }
}
