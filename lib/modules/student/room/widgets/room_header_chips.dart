import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_room_controller.dart';

class RoomHeaderChips extends GetView<StudentRoomController> {
  const RoomHeaderChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          // 1. Active Resident Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFD1FAE5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFF10B981),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Obx(
                  () => Text(
                    controller.residentStatus.value,
                    style: const TextStyle(
                      color: Color(0xFF047857),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // 2. Sunrise Hostel Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.apartment_rounded,
                  size: 14,
                  color: Color(0xFF4F46E5),
                ),
                const SizedBox(width: 6),
                Obx(
                  () => Text(
                    controller.hostelName.value,
                    style: const TextStyle(
                      color: Color(0xFF3730A3),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // 3. Block A Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.grid_view_rounded,
                  size: 13,
                  color: Color(0xFF475569),
                ),
                const SizedBox(width: 6),
                Obx(
                  () => Text(
                    controller.blockName.value,
                    style: const TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
