import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_settings_controller.dart';
import 'settings_tile_components.dart';

class SettingsSecuritySection extends GetView<StudentSettingsController> {
  const SettingsSecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'SECURITY & PRIVACY'),
        SettingsCard(
          children: [
            SettingsTile(
              icon: Icons.lock_outline_rounded,
              iconBg: const Color(0xFFEFF6FF),
              iconColor: AppColors.portalNavy,
              title: 'Change Password',
              subtitle: 'Last updated 12 days ago',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsToggleTile(
              icon: Icons.fingerprint_rounded,
              iconBg: const Color(0xFFF0FDF4),
              iconColor: const Color(0xFF059669),
              title: 'Biometric Lock',
              subtitle: 'Fingerprint or face to resume access',
              value: controller.biometric,
            ),
            const SettingsDivider(),
            SettingsToggleTile(
              icon: Icons.timer_outlined,
              iconBg: const Color(0xFFFEF3C7),
              iconColor: const Color(0xFFD97706),
              title: 'Login Activity',
              subtitle: 'Galaxy S22 Ultra • Active Now',
              value: controller.loginActivity,
            ),
          ],
        ),
      ],
    );
  }
}
