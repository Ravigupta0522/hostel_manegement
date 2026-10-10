import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_rules_controller.dart';

class RulesStaffHelpDesk extends GetView<StudentRulesController> {
  const RulesStaffHelpDesk({super.key});

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
              AppStrings.rulesStaffHelpDesk,
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.softAmber,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.softAmberBorder),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time_rounded,
                      size: 11, color: AppColors.amberIcon),
                  const SizedBox(width: 4),
                  Text(
                    '24/7 ROE',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.amberText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // 1. Warden Office Desk (Light Blue Card)
        _buildDeskCard(
          bgColor: AppColors.softBlue,
          borderColor: AppColors.softBlueBorder,
          icon: Icons.person_pin_circle_outlined,
          iconBg: AppColors.backgroundWhite,
          iconColor: AppColors.primaryBlue,
          title: AppStrings.rulesWardenDesk,
          subtitle: '+1 (555) 019-4820 • Office 102',
          trailingIcon: Icons.phone_rounded,
          trailingColor: AppColors.primaryBlue,
          onTap: controller.onCallWarden,
        ),
        const SizedBox(height: 10),

        // 2. Campus Security Dispatch (Light Peach Card)
        _buildDeskCard(
          bgColor: AppColors.softRose,
          borderColor: AppColors.softRoseBorder,
          icon: Icons.crisis_alert_rounded,
          iconBg: AppColors.backgroundWhite,
          iconColor: AppColors.rosePrimary,
          title: AppStrings.rulesCampusSecurityDispatch,
          subtitle: 'Immediate residential assistance',
          trailingIcon: Icons.phone_rounded,
          trailingColor: AppColors.rosePrimary,
          onTap: controller.onCallSecurity,
        ),
        const SizedBox(height: 10),

        // 3. Administrative Desk (Soft Gray/Blue Card)
        _buildDeskCard(
          bgColor: AppColors.fieldBgLight,
          borderColor: AppColors.borderLight,
          icon: Icons.mail_outline_rounded,
          iconBg: AppColors.backgroundWhite,
          iconColor: AppColors.textSlate,
          title: AppStrings.rulesAdminDesk,
          subtitle: 'helpdesk@campus.hostelflow.edu',
          trailingIcon: Icons.chevron_right_rounded,
          trailingColor: AppColors.textMuted,
          onTap: controller.onEmailAdmin,
        ),
      ],
    );
  }

  Widget _buildDeskCard({
    required Color bgColor,
    required Color borderColor,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required IconData trailingIcon,
    required Color trailingColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
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
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                shape: BoxShape.circle,
                border: Border.all(color: borderColor),
              ),
              child: Icon(trailingIcon, color: trailingColor, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
