import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class GuidelinesHeader extends StatelessWidget {
  const GuidelinesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Tag
        Text(
          'CAMPUS RESIDENCE CODE',
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1,
            fontSize: 10.5,
          ),
        ),
        const SizedBox(height: 6),

        // Main Title Row + Badge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Community Guidelines',
                style: AppTextStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDarkNavy,
                  fontSize: 22,
                  letterSpacing: -0.4,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.softBlue,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.softBlueBorderAlt),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.verified_rounded,
                    color: AppColors.primaryBlue,
                    size: 13,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'AY 2024 - 25',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // Subtitle Description
        Text(
          'Fostering safety, shared respect, and balanced student living across all campus halls.',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
