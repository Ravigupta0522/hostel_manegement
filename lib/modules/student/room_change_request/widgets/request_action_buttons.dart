import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/room_change_request_controller.dart';

class RequestActionButtons extends GetView<RoomChangeRequestController> {
  const RequestActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── 1. Submit Request Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: controller.submitRequest,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D4ED8),
              foregroundColor: Colors.white,
              minimumSize: const Size(0, 48),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Submit Request',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 17,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),

        // ── 2. Cancel Button
        TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF64748B),
            minimumSize: const Size(100, 36),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDarkNavy,
            ),
          ),
        ),
      ],
    );
  }
}
