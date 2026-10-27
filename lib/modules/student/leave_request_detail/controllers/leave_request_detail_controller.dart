import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class LeaveRequestDetailController extends GetxController {
  // Request metadata
  final RxString requestId = 'TLV-2026-MK91'.obs;
  final RxString leaveType = 'MEDICAL LEAVE'.obs;
  final RxString requestStatus = 'Under Review'.obs;
  final RxString travelWindow = '24 Oct – 26 Oct 2026'.obs;
  final RxString travelDuration = '3 Days'.obs;

  // Student info
  final RxString studentName = 'Marcus Vance'.obs;
  final RxString roomNumber = 'Room D-204'.obs;

  // Timeline Stage
  final RxString currentStage = 'Stage 3 of 4'.obs;

  // Assistant Warden Info
  final RxString wardenName = 'Dr. Ramesh Sharma'.obs;
  final RxString wardenRole = 'Assistant Warden • Block A'.obs;
  final RxString wardenInitials = 'RS'.obs;
  final RxString wardenNoteTimestamp = 'Oct 22, 11:20 AM'.obs;
  final RxString wardenNoteText =
      'Medical prescription verified with campus health unit. Verification call completed with parent. Pending final entry into warden ledger before 18:00.'
          .obs;

  // Attached Document
  final RxString attachedFileName = 'CityClinic_Rx_Oct2026.pdf'.obs;
  final RxString attachedFileSize = '1.8 MB • Signed & Stamped'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadArguments();
  }

  void _loadArguments() {
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map<String, dynamic>;
      if (args['ref'] != null) {
        requestId.value = args['ref'].toString().replaceAll('Ref: ', '').replaceAll('#', '');
      } else if (args['id'] != null) {
        requestId.value = args['id'].toString();
      }
      if (args['type'] != null) {
        leaveType.value = args['type'].toString().toUpperCase();
      }
      if (args['dates'] != null) {
        travelWindow.value = args['dates'].toString();
      }
      if (args['status'] != null) {
        requestStatus.value = args['status'].toString();
      }
    }
  }

  void copyRequestId() {
    Get.snackbar(
      'Copied to Clipboard',
      'Request ID: ${requestId.value}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalNavy,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.copy_rounded, color: Colors.white, size: 18),
    );
  }

  void viewMedicalRecord() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.softRose,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.picture_as_pdf_rounded,
                    color: AppColors.rosePrimary,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attachedFileName.value,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        attachedFileSize.value,
                        style: const TextStyle(
                          fontSize: 11.5,
                          color: AppColors.textSlate,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.fieldBgLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: const Row(
                children: [
                  Icon(Icons.verified_outlined,
                      color: AppColors.badgeGreenText, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Verified by Campus Health Center Dr. K. Nair on Oct 22 at 10:45 AM.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textDarkNavy,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Opening Document',
                    'Displaying ${attachedFileName.value}...',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.portalNavy,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                },
                icon: const Icon(Icons.open_in_new_rounded,
                    color: Colors.white, size: 18),
                label: const Text(
                  'Open Full Prescription PDF',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void viewFullApplication() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Full Leave Application Record',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDarkNavy,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Petition ID: ${requestId.value} • ${leaveType.value}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSlate,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Applicant', '${studentName.value} (${roomNumber.value})'),
              _buildDetailRow('Leave Category', leaveType.value),
              _buildDetailRow('Requested Window', travelWindow.value),
              _buildDetailRow('Total Duration', travelDuration.value),
              _buildDetailRow('Emergency Contact', 'Rajesh Sharma (+91 98765 48912)'),
              _buildDetailRow('Destination', 'Home Residence (Pune, Maharashtra)'),
              _buildDetailRow('Reason', 'Scheduled wisdom tooth extraction & clinic rest.'),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSlate,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12.5,
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void callWardenOffice() {
    Get.snackbar(
      'Warden Office Desk',
      'Connecting to Block A Assistant Warden Dr. Ramesh Sharma (+91 800-441-0021)...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalNavy,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.phone_in_talk_rounded, color: Colors.white),
    );
  }

  void cancelRequest() {
    Get.defaultDialog(
      title: 'Cancel Leave Request',
      titleStyle: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w800,
        color: AppColors.textDarkNavy,
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      content: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.softRose,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: AppColors.rosePrimary,
              size: 32,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Are you sure you want to withdraw this medical leave request? This action cannot be reversed.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSlate,
              height: 1.4,
            ),
          ),
        ],
      ),
      textCancel: 'Dismiss',
      textConfirm: 'Confirm Withdrawal',
      confirmTextColor: Colors.white,
      cancelTextColor: AppColors.textSlate,
      buttonColor: AppColors.rosePrimary,
      onConfirm: () {
        Get.back();
        requestStatus.value = 'Withdrawn';
        Get.snackbar(
          'Request Cancelled',
          'Your leave petition ${requestId.value} has been withdrawn.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.rosePrimary,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
        );
      },
    );
  }

  void contactSecurityPost() {
    Get.snackbar(
      'Main Security Post',
      'Contacting Campus Main Security Gate Turnstile Supervisor: Ext #9910',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalOcean,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.shield_outlined, color: Colors.white),
    );
  }
}
