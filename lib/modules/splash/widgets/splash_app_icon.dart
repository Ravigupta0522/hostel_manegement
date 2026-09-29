import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Shared widget — App icon with person badge.
/// Used in both Mobile and Desktop splash layouts.
class SplashAppIcon extends StatelessWidget {
  final double iconSize;
  final double iconInner;
  final double borderRadius;
  final double badgeSize;
  final double badgeIconSize;
  final double badgeBorder;
  final double badgeOffset;

  const SplashAppIcon({
    super.key,
    required this.iconSize,
    required this.iconInner,
    required this.borderRadius,
    this.badgeSize = 26,
    this.badgeIconSize = 13,
    this.badgeBorder = 2.5,
    this.badgeOffset = -6,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main icon box
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.28),
                blurRadius: 28,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Icon(
            Icons.home_work_rounded,
            color: Colors.white,
            size: iconInner,
          ),
        ),

        // Person badge — bottom right
        Positioned(
          bottom: badgeOffset,
          right: badgeOffset,
          child: Container(
            width: badgeSize,
            height: badgeSize,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.splashBackground,
                width: badgeBorder,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: badgeIconSize,
            ),
          ),
        ),
      ],
    );
  }
}
