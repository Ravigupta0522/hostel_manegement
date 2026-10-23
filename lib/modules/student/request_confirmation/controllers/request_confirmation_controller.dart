import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class RequestConfirmationController extends GetxController {
  final RxString ticketId = '#RCR-2024-0982'.obs;
  final RxString submissionTime = 'Today, Oct 04, 2024 • 10:45 AM'.obs;
  final RxString status = 'Pending Review'.obs;

  final RxString currentRoom = 'Room #204 (Bed B2)'.obs;
  final RxString currentLocation = 'Block A • Second Floor North'.obs;

  final RxString requestedRoom = 'Room #305 (Bed B)'.obs;
  final RxString requestedLocation = 'Block B • Third Floor Garden Wing'.obs;

  final RxString statedReason = 'Medical / Quiet Study Environment'.obs;
  final RxString expectedDecision = 'Within 48–72 hours (by Oct 07, 2024)'.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      if (args['ticketId'] != null) ticketId.value = args['ticketId'].toString();
      if (args['currentRoom'] != null) currentRoom.value = args['currentRoom'].toString();
      if (args['currentLocation'] != null) currentLocation.value = args['currentLocation'].toString();
      if (args['requestedRoom'] != null) requestedRoom.value = args['requestedRoom'].toString();
      if (args['requestedLocation'] != null) requestedLocation.value = args['requestedLocation'].toString();
      if (args['statedReason'] != null) statedReason.value = args['statedReason'].toString();
    }
  }

  void copyTicketId() {
    Clipboard.setData(ClipboardData(text: ticketId.value));
    Get.snackbar(
      'Copied to Clipboard',
      'Ticket ID ${ticketId.value} copied!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF0F172A),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void viewRequestDetails() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Relocation Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status.value,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFB45309),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _detailRow('Ticket ID', ticketId.value),
              _detailRow('Current', '${currentRoom.value} (${currentLocation.value})'),
              _detailRow('Target', '${requestedRoom.value} (${requestedLocation.value})'),
              _detailRow('Reason', statedReason.value),
              _detailRow('Review Time', expectedDecision.value),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D4ED8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(0, 46),
                  ),
                  child: const Text('Close Details'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12.5,
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void backToRoomDetails() {
    if (Navigator.canPop(Get.context!)) {
      Get.back();
    } else {
      Get.offNamed(AppRoutes.studentRoomDetail);
    }
  }
}
