import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/student_room_controller.dart';

class RoomActionButtons extends GetView<StudentRoomController> {
  const RoomActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── 1. View Available Rooms Button (Primary Blue)
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: () => Get.toNamed(AppRoutes.studentAvailableRooms),
            icon: const Icon(
              Icons.explore_outlined,
              size: 19,
              color: Colors.white,
            ),
            label: const Text(
              'View Available Rooms',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.2,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D4ED8),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              shadowColor: const Color(0xFF1D4ED8).withValues(alpha: 0.4),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // ── 2. Request Room Change Button (Secondary / Swap)
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: () => Get.toNamed(AppRoutes.studentRoomChangeRequest),
            icon: const Icon(
              Icons.swap_horiz_rounded,
              size: 20,
              color: Color(0xFF1D4ED8),
            ),
            label: const Text(
              'Request Room Change',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1D4ED8),
                letterSpacing: 0.2,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFBFDBFE), width: 1.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
