import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'settings_tile_components.dart';

class SettingsDocumentsSection extends StatelessWidget {
  const SettingsDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionLabel(label: 'MY DOCUMENTS'),
        SettingsCard(
          children: [
            SettingsTile(
              icon: Icons.folder_copy_outlined,
              iconBg: const Color(0xFFEFF6FF),
              iconColor: AppColors.portalNavy,
              title: 'All Documents',
              subtitle: 'ID card, fee receipts, pass PDF',
              trailing: const SettingsCountBadge(text: '4 files'),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.upload_file_outlined,
              iconBg: const Color(0xFFF0FDF4),
              iconColor: const Color(0xFF16A34A),
              title: 'Upload Document',
              subtitle: 'Medical fitness, identity proof upload',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
            const SettingsDivider(),
            SettingsTile(
              icon: Icons.picture_as_pdf_outlined,
              iconBg: const Color(0xFFFFF7ED),
              iconColor: const Color(0xFFEA580C),
              title: 'Download Document',
              subtitle: 'Room allotment slip, mess PDF',
              trailing: const SettingsArrow(),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
