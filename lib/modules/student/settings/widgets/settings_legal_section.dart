import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_settings_controller.dart';
import 'settings_tile_components.dart';

class SettingsLegalSection extends GetView<StudentSettingsController> {
  const SettingsLegalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'ABOUT & LEGAL'),
        SettingsCard(
          children: [
            Obx(() => SettingsTile(
                  icon: Icons.info_outline_rounded,
                  iconBg: const Color(0xFFEFF6FF),
                  iconColor: AppColors.portalNavy,
                  title: 'App Version',
                  subtitle: 'Hostel Portal ${controller.appVersion.value}',
                  trailing: const SizedBox.shrink(),
                  onTap: () {},
                )),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.privacy_tip_outlined,
              iconBg: const Color(0xFFF0FDF4),
              iconColor: const Color(0xFF059669),
              title: 'Privacy Policy',
              subtitle: 'campus.student.edu/privacy-policy',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.gavel_rounded,
              iconBg: const Color(0xFFFFF7ED),
              iconColor: const Color(0xFFEA580C),
              title: 'Terms & Conditions',
              subtitle: 'Hostel Booking Contract & Tenancy policy',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
