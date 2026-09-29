import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'splash_app_icon.dart';
import 'splash_app_name.dart';
import 'splash_tagline.dart';
import 'desktop_feature_chip.dart';

/// Desktop-only widget — Left branding panel with large icon, name, tagline, and feature chips.
class DesktopLeftPanel extends StatelessWidget {
  const DesktopLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.splashBackground,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Large app icon
              SplashAppIcon(
                iconSize: 110,
                iconInner: 54,
                borderRadius: 28,
                badgeSize: 32,
                badgeIconSize: 16,
                badgeBorder: 3,
                badgeOffset: -8,
              ),

              SizedBox(height: 36),

              // App name — large on desktop, left-aligned
              SplashAppName(
                fontSize: 40,
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 12),

              // Tagline — left-aligned
              SplashTagline(
                fontSize: 15,
                textAlign: TextAlign.left,
                lineHeight: 1.6,
              ),

              SizedBox(height: 40),

              // Feature chips
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  DesktopFeatureChip(
                    icon: Icons.people_alt_outlined,
                    label: 'Student Management',
                  ),
                  DesktopFeatureChip(
                    icon: Icons.meeting_room_outlined,
                    label: 'Room Management',
                  ),
                  DesktopFeatureChip(
                    icon: Icons.receipt_long_outlined,
                    label: 'Fee Tracking',
                  ),
                  DesktopFeatureChip(
                    icon: Icons.restaurant_outlined,
                    label: 'Mess Management',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
