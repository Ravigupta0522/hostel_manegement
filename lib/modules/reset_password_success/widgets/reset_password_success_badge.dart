import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ResetPasswordSuccessBadge extends StatelessWidget {
  const ResetPasswordSuccessBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Outer subtle glow container
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Container(
              width: 74,
              height: 74,
              decoration: const BoxDecoration(
                color: AppColors.successRingDark,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.successRingLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.textWhite,
                  size: 22,
                ),
              ),
            ),
          ),

          // Mini top-right Cyan Shield Badge
          Positioned(
            right: 0,
            top: 2,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.portalCyan,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.backgroundWhite, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.portalCyan.withValues(alpha: 0.35),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.shield_rounded,
                size: 13,
                color: AppColors.textWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
