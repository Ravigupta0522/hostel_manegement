import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../routes/app_routes.dart';

class OutpassDetailController extends GetxController {
  // Tab Selection: 'Approved', 'Pending', 'Rejected'
  final RxString selectedTab = 'Approved'.obs;

  // Pass Information
  final RxString passId = 'Pass #LV-2024-884'.obs;
  final RxString status = 'Approved'.obs;
  final RxString credentialTitle = 'Weekend Home Visit'.obs;
  final RxString destination = 'Seattle, WA (Registered Residence)'.obs;
  final RxString departureDate = 'Fri, Oct 04'.obs;
  final RxString departureTime = '04:00 PM'.obs;
  final RxString curfewDate = 'Sun, Oct 06'.obs;
  final RxString curfewTime = '09:00 PM Sharp'.obs;
  final RxString totalAllocation = '53 Hours'.obs;

  // Biometric Token & QR Info
  final RxString passToken = 'GP-9921-A'.obs;
  final RxString biometricGateInstruction =
      'Show this code at campus turnstile biometric scanner at South Gate.'.obs;
  final RxBool isTokenRefreshing = false.obs;

  // Student Details
  final RxString studentName = 'Marcus Vance'.obs;
  final RxString studentRoom = 'Room D-204'.obs;

  // Warden Remarks
  final RxString wardenRemarks =
      'Approved for standard weekend leave. Student must log biometric check-in at Floor 2 terminal before 09:00 PM Sunday. Safe travels Marcus!'
          .obs;
  final RxString wardenName = 'Dr. Robert Vance'.obs;
  final RxString wardenRole = 'Chief Warden, Westwood Hall • Ext #4410'.obs;

  // Approval Timeline Items
  final RxList<Map<String, dynamic>> timelineSteps = <Map<String, dynamic>>[
    {
      'title': 'Request Submitted',
      'time': 'Oct 03, 10:15 AM',
      'description': 'Initiated by Student Marcus Vance (Room D-204)',
      'status': 'completed', // completed, active, pending
      'isCompleted': true,
      'isCurrent': false,
      'isPending': false,
    },
    {
      'title': 'Guardian Verification',
      'time': 'Oct 03, 11:30 AM',
      'description':
          'SMS counter-approval confirmed by David Richardson (Parent)',
      'status': 'completed',
      'isCompleted': true,
      'isCurrent': false,
      'isPending': false,
    },
    {
      'title': 'Warden Approval',
      'time': 'Oct 03, 04:15 PM',
      'description': 'Sanctioned by Chief Warden Dr. Robert Vance',
      'status': 'completed',
      'isCompleted': true,
      'isCurrent': false,
      'isPending': false,
    },
    {
      'title': 'Gate Departure',
      'time': 'Scheduled Oct 04, 04:00 PM',
      'description': 'Scheduled Oct 04, 04:00 PM • South Turnstile Gate 2',
      'badge': 'Next Event',
      'status': 'active',
      'isCompleted': false,
      'isCurrent': true,
      'isPending': false,
    },
    {
      'title': 'Curfew Check-in',
      'time': 'Oct 06, 09:00 PM',
      'description':
          'Pending biometric scanner log at Westwood Floor 2 Terminal',
      'status': 'pending',
      'isCompleted': false,
      'isCurrent': false,
      'isPending': true,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFromArguments();
  }

  void _loadFromArguments() {
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map<String, dynamic>;
      if (args['passId'] != null) {
        passId.value = args['passId'].toString();
      }
      if (args['title'] != null) {
        credentialTitle.value = args['title'].toString();
      }
      if (args['dates'] != null && args['duration'] != null) {
        totalAllocation.value = args['duration'].toString();
      }
      if (args['status'] != null) {
        status.value = args['status'].toString();
      }
    }
  }

  void setTab(String tab) {
    selectedTab.value = tab;
    if (tab == 'Approved') {
      status.value = 'Approved';
      passId.value = 'Pass #LV-2024-884';
      credentialTitle.value = 'Weekend Home Visit';
    } else if (tab == 'Pending') {
      status.value = 'Pending';
      passId.value = 'Pass #LV-2024-892';
      credentialTitle.value = 'Library Research Clearance';
      Get.toNamed(AppRoutes.studentLeaveRequestDetail);
    } else if (tab == 'Rejected') {
      status.value = 'Rejected';
      passId.value = 'Pass #LV-2024-810';
      credentialTitle.value = 'Late Night Outpass';
    }
  }

  Future<void> refreshToken() async {
    isTokenRefreshing.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    final randomSuffix = (1000 + (DateTime.now().millisecond % 8999));
    passToken.value = 'GP-$randomSuffix-A';
    isTokenRefreshing.value = false;

    Get.snackbar(
      'Token Refreshed',
      'New biometric turnstile key generated: ${passToken.value}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalNavy,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
      duration: const Duration(seconds: 2),
    );
  }

  void downloadPdf() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
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
                  decoration: const BoxDecoration(
                    color: AppColors.badgeMintBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.badgeGreenText,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Outpass PDF Ready',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Official digital pass cryptographically signed by Westwood Hall Warden Office.',
                        style: TextStyle(
                          fontSize: 12,
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
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.fieldBgLight,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf_rounded,
                      color: Colors.redAccent, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${passId.value.replaceAll('#', '')}_MarcusVance.pdf',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDarkNavy,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '148 KB • Verified Security Pass',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textSlate,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Downloaded Successfully',
                    'File saved to downloads. Ready for security turnstile inspection.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.portalNavy,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                    icon: const Icon(Icons.download_done_rounded,
                        color: Colors.white),
                  );
                },
                icon: const Icon(Icons.file_download_rounded, color: Colors.white),
                label: const Text(
                  'Save to Device',
                  style: TextStyle(
                    fontSize: 14,
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

  void shareWithGuardian() {
    Get.snackbar(
      'Pass Shared with Guardian',
      'SMS notification & pass token GP-9921-A sent to David Richardson (Parent).',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryBlue,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.share_rounded, color: Colors.white),
      duration: const Duration(seconds: 3),
    );
  }

  void cancelOrEarlyReturn() {
    Get.defaultDialog(
      title: 'Cancel / Early Return',
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
            'Are you sure you want to cancel this leave pass or log an unscheduled early hostel return?',
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
      textConfirm: 'Confirm Action',
      confirmTextColor: Colors.white,
      cancelTextColor: AppColors.textSlate,
      buttonColor: AppColors.rosePrimary,
      onConfirm: () {
        Get.back();
        status.value = 'Cancelled';
        Get.snackbar(
          'Request Submitted',
          'Warden office notified of your early return.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.rosePrimary,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
        );
      },
    );
  }

  void callWestwoodDesk() {
    Get.snackbar(
      'Westwood Hall Desk',
      'Connecting to 24/7 Security & Warden Desk: +1 (800) 555-WEST',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalOcean,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.phone_in_talk_rounded, color: Colors.white),
    );
  }
}
