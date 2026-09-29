import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Desktop-only widget — Full-width bottom bar with version info on left, edition text on right.
class DesktopBottomBar extends StatelessWidget {
  const DesktopBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: secure network + version
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.textLight,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Secure Campus Network',
                style: AppTextStyles.splashVersion,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 3,
                height: 3,
                decoration: const BoxDecoration(
                  color: AppColors.textLight,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                'v2.4.0',
                style: AppTextStyles.splashVersion.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          // Right: edition info
          Text(
            'Enterprise Cloud Edition  •  High Reliability Multi-Tenant',
            style: AppTextStyles.splashVersion,
          ),
        ],
      ),
    );
  }
}
