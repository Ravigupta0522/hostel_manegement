import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/request_confirmation_controller.dart';

class ConfirmationActionButtons
    extends GetView<RequestConfirmationController> {
  const ConfirmationActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primary Button: View Request Details ->
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: controller.viewRequestDetails,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D4ED8),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View Request Details',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Secondary Button: <- Back to Room Details
        SizedBox(
          width: double.infinity,
          height: 44,
          child: TextButton(
            onPressed: controller.backToRoomDetails,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF0F172A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 44),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_rounded,
                  size: 16,
                  color: Color(0xFF0F172A),
                ),
                SizedBox(width: 8),
                Text(
                  'Back to Room Details',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
