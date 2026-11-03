import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../routes/app_routes.dart';

class ApprovedLeaveController extends GetxController {
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
  final RxString studentRoom = 'Room R-204'.obs;

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
      'time': 'Oct 03, 10:14 AM',
      'description': 'Initiated by Student Marcus Vance (Room R-204)',
      'status': 'completed',
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
      'time': 'Oct 03, 04:14 PM',
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
      } else if (args['id'] != null) {
        passId.value = 'Pass ${args['id']}';
      } else if (args['ref'] != null) {
        passId.value = 'Pass ${args['ref']}';
      }

      if (args['type'] != null) {
        credentialTitle.value = args['type'].toString();
      }
      if (args['destination'] != null) {
        destination.value = args['destination'].toString();
      }
      if (args['duration'] != null) {
        final d = args['duration'].toString();
        final parts = d.split('–').isEmpty ? d.split('-') : d.split('–');
        if (parts.length >= 2) {
          departureDate.value = parts[0].trim();
          curfewDate.value = parts[1].trim();
        }
      }
      if (args['wardenRemark'] != null &&
          args['wardenRemark'].toString().isNotEmpty) {
        wardenRemarks.value = args['wardenRemark'].toString();
      }
    }
  }

  void onTabSelected(String tab) {
    selectedTab.value = tab;
    if (tab == 'Pending') {
      Get.toNamed(AppRoutes.studentLeaveRequestDetail);
    } else if (tab == 'Rejected') {
      Get.toNamed(AppRoutes.studentAllLeaveRequests);
    }
  }

  Future<void> refreshToken() async {
    if (isTokenRefreshing.value) return;
    isTokenRefreshing.value = true;
    HapticFeedback.lightImpact();

    await Future.delayed(const Duration(milliseconds: 900));

    // Generate dynamic refresh token
    final randomSuffix = (1000 + DateTime.now().millisecond % 9000).toString();
    passToken.value = 'GP-$randomSuffix-A';
    isTokenRefreshing.value = false;

    Get.snackbar(
      'Token Refreshed',
      'Gate token re-synchronized with Campus Turnstile Security.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalNavy,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.sync_rounded, color: Colors.white, size: 20),
    );
  }

  void downloadPdfPass() {
    HapticFeedback.mediumImpact();
    Get.snackbar(
      'Downloading Leave Pass PDF',
      'Generating digitally signed pass #${passId.value}...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.textGreenDark,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.download_done_rounded, color: Colors.white),
    );
  }

  void sharePassWithGuardian() {
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.share_rounded,
                    color: Color(0xFF2563EB),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Share Leave Outpass Slip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Send digital verified gate pass to parent',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSlate,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildShareOption(
              icon: Icons.sms_rounded,
              title: 'SMS Parent Dispatch',
              subtitle: 'Send direct confirmation SMS to David Richardson',
              onTap: () {
                Get.back();
                Get.snackbar(
                    'SMS Sent', 'Gate pass link dispatched to parent.');
              },
            ),
            const SizedBox(height: 10),
            _buildShareOption(
              icon: Icons.mark_email_read_rounded,
              title: 'Guardian Email Copy',
              subtitle: 'Dispatches signed PDF to registered parent email',
              onTap: () {
                Get.back();
                Get.snackbar('Email Sent', 'Dispatched copy to parent email.');
              },
            ),
            const SizedBox(height: 10),
            _buildShareOption(
              icon: Icons.copy_rounded,
              title: 'Copy Digital Pass Link',
              subtitle: 'Direct security verification link to clipboard',
              onTap: () {
                Get.back();
                Clipboard.setData(
                  ClipboardData(
                      text: 'https://hostelflow.campus/pass/${passId.value}'),
                );
                Get.snackbar(
                    'Copied', 'Pass verification link copied to clipboard.');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20, color: const Color(0xFF1D4ED8)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
                color: Color(0xFF94A3B8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cancelOrRequestEarlyReturn() {
    Get.defaultDialog(
      title: 'Request Early Return / Cancel',
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Color(0xFF0F172A),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      middleText:
          'Are you sure you want to cancel or log an early return for ${passId.value}? Security desk and warden will be notified.',
      middleTextStyle: const TextStyle(
        fontSize: 13,
        color: Color(0xFF475569),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          status.value = 'Cancelled';
          Get.snackbar(
            'Request Logged',
            'Your cancellation/early return notice has been submitted.',
            backgroundColor: const Color(0xFFE11D48),
            colorText: Colors.white,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE11D48),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('Confirm Notice'),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('Back'),
      ),
    );
  }

  void callWestwoodHallDesk() {
    Get.snackbar(
      'Calling 24/7 Hall Desk',
      'Dialing Westwood Hall Security Terminal (+1 800 441-2099)...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalNavy,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.phone_in_talk_rounded, color: Colors.white),
    );
  }
}
