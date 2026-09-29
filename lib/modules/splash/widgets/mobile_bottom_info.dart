import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Mobile-only widget — Bottom info row with secure network + version + edition text.
class MobileBottomInfo extends StatelessWidget {
  const MobileBottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
      child: Column(
        children: [
          // Secure Network + version dot row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                margin: const EdgeInsets.symmetric(horizontal: 8),
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

          const SizedBox(height: 6),

          // Edition label
          Text(
            'Enterprise Cloud Edition  •  High Reliability Multi-Tenant',
            style: AppTextStyles.splashVersion,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
