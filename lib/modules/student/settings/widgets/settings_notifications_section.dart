import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_settings_controller.dart';
import 'settings_tile_components.dart';

class SettingsNotificationsSection extends GetView<StudentSettingsController> {
  const SettingsNotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'NOTIFICATIONS & ALERTS'),
        SettingsCard(
          children: [
            SettingsToggleTile(
              icon: Icons.notifications_active_outlined,
              iconBg: const Color(0xFFFEF3C7),
              iconColor: const Color(0xFFD97706),
              title: 'Push Notifications',
              subtitle: 'Device push alerts, gate pass delivered',
              value: controller.pushNotif,
            ),
            const SettingsDivider(),
            SettingsToggleTile(
              icon: Icons.restaurant_outlined,
              iconBg: const Color(0xFFF0FDF4),
              iconColor: const Color(0xFF16A34A),
              title: 'Mess Alerts',
              subtitle: 'Inform mess timings & menu changes',
              value: controller.messAlerts,
            ),
            const SettingsDivider(),
            SettingsToggleTile(
              icon: Icons.event_note_outlined,
              iconBg: const Color(0xFFEFF6FF),
              iconColor: AppColors.portalNavy,
              title: 'Leave & Notices Digest',
              subtitle: 'Daily leave & noticeboard alerts',
              value: controller.leaveUpdates,
            ),
            const SettingsDivider(),
            SettingsToggleTile(
              icon: Icons.verified_outlined,
              iconBg: const Color(0xFFF0FDF4),
              iconColor: const Color(0xFF059669),
              title: 'Updates & Alerts',
              subtitle: 'Confirm gate pass, attendance & more',
              value: controller.confirmAlerts,
            ),
          ],
        ),
      ],
    );
  }
}
