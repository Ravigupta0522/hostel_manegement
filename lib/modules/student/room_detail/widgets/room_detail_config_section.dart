import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/room_detail_controller.dart';

class RoomDetailConfigSection extends GetView<RoomDetailController> {
  const RoomDetailConfigSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final room = controller.room;
      final String type = room['type'] as String? ?? '2-Bed Double';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Room type badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEEF2FF), Color(0xFFE0E7FF)],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.ac_unit_rounded,
                  size: 14,
                  color: Color(0xFF4F46E5),
                ),
                const SizedBox(width: 6),
                Text(
                  '$type (Air Conditioned)',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3730A3),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          // Config attributes row
          const Row(
            children: [
              RoomConfigItem(
                icon: Icons.elevator_outlined,
                label: 'Lift Adj.',
                sub: '3rd Floor',
              ),
              SizedBox(width: 10),
              RoomConfigItem(
                icon: Icons.wb_sunny_outlined,
                label: 'Orientation',
                sub: 'Morning Sun',
              ),
            ],
          ),
        ],
      );
    });
  }
}

class RoomConfigItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sub;

  const RoomConfigItem({
    super.key,
    required this.icon,
    required this.label,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: AppColors.primaryBlue),
            const SizedBox(height: 4),
            Text(
              sub,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textDarkNavy,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10.5,
                color: AppColors.textSlate,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
