import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SetNewPasswordHeroBadge extends StatelessWidget {
  const SetNewPasswordHeroBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main circular container with shield
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.badgeBlueBg,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.portalNavy.withValues(alpha: 0.10),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.shield_rounded,
                size: 38,
                color: AppColors.portalNavy,
              ),
            ),
          ),

          // Mini Key badge at bottom right
          Positioned(
            right: -2,
            bottom: -2,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.portalOcean,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.backgroundWhite, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.portalOcean.withValues(alpha: 0.35),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.vpn_key_rounded,
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
