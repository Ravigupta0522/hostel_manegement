import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_settings_controller.dart';
import 'settings_tile_components.dart';

class SettingsAccountActionsSection extends GetView<StudentSettingsController> {
  const SettingsAccountActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'ACCOUNT ACTIONS'),
        SettingsCard(
          children: [
            SettingsTile(
              icon: Icons.logout_rounded,
              iconBg: const Color(0xFFFFEEEE),
              iconColor: const Color(0xFFEF4444),
              title: 'Log Out of Account',
              subtitle: '',
              titleColor: const Color(0xFFEF4444),
              trailing: const SettingsArrow(color: Color(0xFFEF4444)),
              onTap: controller.onLogout,
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.delete_forever_outlined,
              iconBg: const Color(0xFFFFEEEE),
              iconColor: const Color(0xFFEF4444),
              title: 'Request Account Delete',
              subtitle: 'Permanently remove your data',
              titleColor: const Color(0xFFEF4444),
              trailing: const SettingsArrow(color: Color(0xFFEF4444)),
              onTap: controller.onDeleteAccount,
            ),
          ],
        ),
      ],
    );
  }
}
