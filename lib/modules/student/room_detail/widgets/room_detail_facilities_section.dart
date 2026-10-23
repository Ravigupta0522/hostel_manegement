import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class RoomDetailFacilitiesSection extends StatelessWidget {
  const RoomDetailFacilitiesSection({super.key});

  List<Map<String, dynamic>> get _allFacilities => [
        {'icon': Icons.bed_rounded, 'label': 'Orthopedic Mattress'},
        {'icon': Icons.desk_rounded, 'label': 'Ergonomic Study Desk'},
        {'icon': Icons.lock_outline_rounded, 'label': 'Lockable Steel Wardrobe'},
        {'icon': Icons.electrical_services_outlined, 'label': 'AC & Dual Inverter'},
        {'icon': Icons.bathroom_outlined, 'label': 'En-suite Bath + Shower'},
        {'icon': Icons.deck_outlined, 'label': 'Private Garden Balcony'},
        {
          'icon': Icons.wifi_rounded,
          'label': 'High Speed Wi-Fi Dedicated AP (500 Mbps)',
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFF6EE7B7)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_rounded,
                    size: 12,
                    color: Color(0xFF047857),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'All Verified',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF047857),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ..._allFacilities.map(
          (f) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    f['icon'] as IconData,
                    size: 15,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    f['label'] as String,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.check_rounded,
                  size: 16,
                  color: Color(0xFF10B981),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
