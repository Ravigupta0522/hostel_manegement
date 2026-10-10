import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_rules_controller.dart';

class RulesResidentPortals extends GetView<StudentRulesController> {
  const RulesResidentPortals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Text(
          AppStrings.rulesResidentPortals,
          style: AppTextStyles.titleSmall.copyWith(
            color: AppColors.textDarkNavy,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),

        // Portal List
        Container(
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
              // 1. Hostel Rules & Regulations
              _buildPortalTile(
                icon: Icons.shield_rounded,
                iconBg: AppColors.portalNavy,
                iconColor: AppColors.textWhite,
                title: 'Hostel Rules & Regulations',
                subtitle: 'Quiet hours, visitor passes & code of conduct',
                onTap: controller.showDetailedRulesSheet,
              ),
              const Divider(
                  height: 1, thickness: 1, color: AppColors.borderLight),

              // 2. Detailed Facilities & Timings
              _buildPortalTile(
                icon: Icons.access_time_filled_rounded,
                iconBg: AppColors.portalSky,
                iconColor: AppColors.textWhite,
                title: 'Detailed Facilities & Timings',
                subtitle:
                    'Mess meal slots, gym reservations, laundry shifts',
                onTap: controller.showFacilitiesTimingsSheet,
              ),
              const Divider(
                  height: 1, thickness: 1, color: AppColors.borderLight),

              // 3. Contact Warden & Hall Staff
              _buildPortalTile(
                icon: Icons.assignment_ind_rounded,
                iconBg: const Color(0xFF059669),
                iconColor: AppColors.textWhite,
                title: 'Contact Warden & Hall Staff',
                subtitle:
                    'Floor advisors, head proctor and maintenance leads',
                onTap: controller.showStaffContactSheet,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPortalTile({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: iconBg.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
