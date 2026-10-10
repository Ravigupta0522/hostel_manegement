import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'settings_tile_components.dart';

class SettingsSupportSection extends StatelessWidget {
  const SettingsSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'HELP & SUPPORT'),
        SettingsCard(
          children: [
            SettingsTile(
              icon: Icons.help_outline_rounded,
              iconBg: const Color(0xFFEFF6FF),
              iconColor: AppColors.portalNavy,
              title: 'Help Center',
              subtitle: 'FAQs, guides & tutorial access',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.support_agent_rounded,
              iconBg: const Color(0xFFF0FDF4),
              iconColor: const Color(0xFF059669),
              title: 'Contact Support',
              subtitle: 'Common requests about fees & admissions',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.shield_outlined,
              iconBg: const Color(0xFFFEF3C7),
              iconColor: const Color(0xFFD97706),
              title: 'Live Chat Support',
              subtitle: 'Live chat & 24/7 security alerts',
              trailing: const SettingsOnlineBadge(),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
