import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_settings_controller.dart';
import 'settings_tile_components.dart';

class SettingsEmergencySection extends GetView<StudentSettingsController> {
  const SettingsEmergencySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'SOS & EMERGENCY'),
        SettingsCard(
          children: [
            SettingsTile(
              icon: Icons.sos_rounded,
              iconBg: const Color(0xFFFFEEEE),
              iconColor: const Color(0xFFEF4444),
              title: 'SOS Alert',
              subtitle: 'Send emergency contact & location',
              trailing: const SettingsArrow(),
              onTap: controller.onSosTap,
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.contacts_rounded,
              iconBg: const Color(0xFFFEF3C7),
              iconColor: const Color(0xFFD97706),
              title: 'Emergency Contacts',
              subtitle: 'Manage your emergency contact list',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
