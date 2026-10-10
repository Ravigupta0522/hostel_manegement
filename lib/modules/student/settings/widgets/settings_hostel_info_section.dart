import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import 'settings_tile_components.dart';

class SettingsHostelInfoSection extends StatelessWidget {
  const SettingsHostelInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'HOSTEL INFORMATION'),
        SettingsCard(
          children: [
            SettingsTile(
              icon: Icons.home_work_outlined,
              iconBg: const Color(0xFFEFF6FF),
              iconColor: AppColors.portalNavy,
              title: 'Hostel Rules',
              subtitle: 'Curfew, conduct, mess & study lounge',
              trailing: const SettingsArrow(),
              onTap: () => Get.toNamed('/student/rules'),
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.event_seat_outlined,
              iconBg: const Color(0xFFF0FDF4),
              iconColor: const Color(0xFF16A34A),
              title: 'Facilities',
              subtitle: 'Wi-Fi 60mb, gym, laundry, study lounge',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.people_alt_outlined,
              iconBg: const Color(0xFFFFF7ED),
              iconColor: const Color(0xFFEA580C),
              title: 'Warden Details',
              subtitle: 'Vikram Sharma • +91-9930-XXXXXX',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
