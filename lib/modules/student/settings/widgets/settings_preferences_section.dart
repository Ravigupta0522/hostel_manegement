import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_settings_controller.dart';
import 'settings_tile_components.dart';

class SettingsPreferencesSection extends GetView<StudentSettingsController> {
  const SettingsPreferencesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'APP PREFERENCES'),
        SettingsCard(
          children: [
            SettingsTile(
              icon: Icons.language_rounded,
              iconBg: const Color(0xFFEFF6FF),
              iconColor: AppColors.portalNavy,
              title: 'Language',
              subtitle: 'Current display language',
              trailing: Obx(() =>
                  SettingsChipLabel(text: controller.selectedLanguage.value)),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsToggleTile(
              icon: Icons.dark_mode_outlined,
              iconBg: const Color(0xFF1E293B),
              iconColor: Colors.white,
              title: 'Theme',
              subtitle: 'Visual appearance mode',
              value: controller.isDarkMode,
              activeLabel: 'Dark Mode',
              inactiveLabel: 'Light Mode',
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.calendar_today_outlined,
              iconBg: const Color(0xFFFFF7ED),
              iconColor: const Color(0xFFEA580C),
              title: 'Date Format',
              subtitle: 'Hostel date display formatting',
              trailing: Obx(
                  () => SettingsChipLabel(text: controller.dateFormat.value)),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
