import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RulesFacilitiesGrid extends StatelessWidget {
  const RulesFacilitiesGrid({super.key});

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
              AppStrings.rulesCommunityFacilities,
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '6 Amenities',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.linkBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // 2-Column Grid
        Row(
          children: [
            Expanded(
              child: _buildFacilityCard(
                icon: Icons.wifi_rounded,
                title: 'Gigabit Wi-Fi',
                subtitle: 'Campus mesh coverage',
                hasActiveDot: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildFacilityCard(
                icon: Icons.restaurant_rounded,
                title: 'Central Mess',
                subtitle: 'Diet - flexible meal hall',
                badgeText: '7AM - 10PM',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildFacilityCard(
                icon: Icons.local_laundry_service_rounded,
                title: 'Laundry Hub',
                subtitle: 'App token washers',
                badgeText: 'B1 Level',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildFacilityCard(
                icon: Icons.verified_user_rounded,
                title: 'Smart Security',
                subtitle: 'Biometric turnstiles',
                badgeText: '24/7',
                badgeIsGreen: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildFacilityCard(
                icon: Icons.menu_book_rounded,
                title: 'Study Library',
                subtitle: 'Acoustic study pods',
                badgeText: 'Silent',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildFacilityCard(
                icon: Icons.weekend_rounded,
                title: 'Rec Lounge',
                subtitle: 'Pool tables & screens',
                badgeText: 'Level 2',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFacilityCard({
    required IconData icon,
    required String title,
    required String subtitle,
    String? badgeText,
    bool badgeIsGreen = false,
    bool hasActiveDot = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Icon container + Badge or Active Dot
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.softBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.primaryBlue, size: 20),
              ),
              if (hasActiveDot)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.liveGreen,
                    shape: BoxShape.circle,
                  ),
                )
              else if (badgeText != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: badgeIsGreen
                        ? AppColors.badgeMintText
                        : AppColors.softBlue,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: badgeIsGreen
                          ? AppColors.badgeGreenDot
                          : AppColors.softBlueBorderAlt,
                    ),
                  ),
                  child: Text(
                    badgeText,
                    style: AppTextStyles.labelSmall.copyWith(
                      fontWeight: FontWeight.w700,
                      color: badgeIsGreen
                          ? const Color(0xFF6EE7B7)
                          : AppColors.primaryBlue,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Title
          Text(
            title,
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.textDarkNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),

          // Subtitle
          Text(
            subtitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
