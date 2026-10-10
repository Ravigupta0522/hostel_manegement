import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RulesResidenceProfileCard extends StatelessWidget {
  const RulesResidenceProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.rulesResidenceProfile,
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'North Quad Zone',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.linkBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Profile Container Card
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // 1. Accommodation Mode
              _buildProfileItem(
                icon: Icons.apartment_rounded,
                category: 'ACCOMMODATION MODE',
                title: 'Co-ed Residence (Wing-Separated)',
                description:
                    'Dedicated biometric security partitioning for North & South courtyards.',
              ),
              const Divider(
                  height: 1, thickness: 1, color: AppColors.borderLight),

              // 2. Eligible Cohorts
              _buildProfileItem(
                icon: Icons.school_outlined,
                category: 'ELIGIBLE COHORTS',
                title: 'Undergraduate & Postgraduate',
                description:
                    'Phases 1-3, UG Scholars + Phases 4-5, PG & Doctoral Fellows.',
              ),
              const Divider(
                  height: 1, thickness: 1, color: AppColors.borderLight),

              // 3. Location
              _buildProfileItem(
                icon: Icons.location_on_outlined,
                category: 'LOCATION',
                title: '412 University Boulevard',
                description:
                    'Campus North District • 3 min walk to Science Quad & Cafeteria.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String category,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.softBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryBlue, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.primaryBlue,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  title,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.textDarkNavy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
