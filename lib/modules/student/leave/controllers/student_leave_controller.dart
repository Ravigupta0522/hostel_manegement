import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../routes/app_routes.dart';

class StudentLeaveController extends GetxController {
  // Balance Metrics
  final RxInt totalPetitions = 4.obs;
  final RxInt pendingPetitions = 1.obs;
  final RxInt approvedPetitions = 2.obs;
  final RxInt rejectedPetitions = 1.obs;
  final RxString semester = AppStrings.leaveSemester.obs;

  // Student Room info
  final RxString hostelBlock = 'Hostel Block B'.obs;
  final RxString roomNumber = 'Room 304'.obs;

  // Upcoming Outpass
  final RxMap<String, dynamic> upcomingOutpass = <String, dynamic>{
    'passId': AppStrings.leavePassNumber,
    'title': AppStrings.leaveDiwaliBreakVacation,
    'dates': 'Oct 28 - Nov 02, 2026',
    'duration': '6 Days',
    'parentVerified': true,
    'gateAuthorized': true,
    'qrCode': 'OP8821-STU304-DIWALI2026-AUTH',
  }.obs;

  // Recent Requests List
  final RxList<Map<String, dynamic>> recentRequests = <Map<String, dynamic>>[
    {
      'type': 'Medical Leave',
      'ref': 'Ref: #REQ-9420',
      'status': 'Pending Review',
      'dates': '24 Oct - 26 Oct 2026 (3 Days)',
      'submittedDate': 'Submitted 22 Oct',
      'reason':
          'Scheduled wisdom tooth extraction and recovery as per dental clinic prescription uploaded.',
      'hasDocument': true,
      'documentText': '1 Document Attached',
      'icon': Icons.medical_services_outlined,
      'iconColor': AppColors.amberIcon,
      'iconBg': AppColors.softAmber,
      'statusColor': AppColors.leaveReviewText,
      'statusBg': AppColors.leaveReviewBg,
      'wardenRemark': null,
    },
    {
      'type': 'Home Visit',
      'ref': 'Ref: #REQ-9382',
      'status': AppStrings.leaveApproved,
      'dates': '12 Oct - 15 Oct 2026 (4 Days)',
      'submittedDate': 'Submitted 08 Oct',
      'reason': 'Visiting parents for family religious function.',
      'hasDocument': false,
      'documentText': null,
      'icon': Icons.home_outlined,
      'iconColor': AppColors.badgeGreenText,
      'iconBg': AppColors.badgeGreenBg,
      'statusColor': AppColors.badgeGreenText,
      'statusBg': AppColors.badgeMintBg,
      'wardenRemark':
          'Parent confirmed via SMS token. Approved by Chief Warden.',
    },
    {
      'type': 'Personal Leave',
      'ref': 'Ref: #REQ-9104',
      'status': 'Completed',
      'dates': '15 Sep - 17 Sep 2026 (3 Days)',
      'submittedDate': 'Gate Verified',
      'reason': 'Academic conference and seminar attendance.',
      'hasDocument': false,
      'documentText': null,
      'icon': Icons.flight_takeoff_rounded,
      'iconColor': AppColors.linkBlue,
      'iconBg': AppColors.softBlue,
      'statusColor': AppColors.primaryBlue,
      'statusBg': AppColors.cardLight,
      'wardenRemark': null,
      'checkedIn': 'Checked In on 17 Sep, 18:45',
    },
  ].obs;

  void openNewLeaveBottomSheet() {
    Get.toNamed(AppRoutes.studentApplyLeave);
  }

  void showQrOutpassDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Digital Outpass QR',
                    style: AppTextStyles.titleSmall.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.fieldBgLight,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Icon(
                  Icons.qr_code_2_rounded,
                  size: 160,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                upcomingOutpass['title'] as String,
                style: AppTextStyles.titleSmall.copyWith(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDarkNavy,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${upcomingOutpass['passId']} • Valid at Security Gate',
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 11,
                  color: AppColors.textSlate,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: AppColors.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(0, 44),
                  ),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showOutpassSlipDialog(Map<String, dynamic> req) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Approved Outpass Slip',
                    style: AppTextStyles.titleSmall.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _slipRow('Type', req['type'] as String),
              _slipRow('Reference', req['ref'] as String),
              _slipRow('Validity', req['dates'] as String),
              _slipRow('Status', 'Approved & Token Verified'),
              if (req['wardenRemark'] != null)
                _slipRow('Remark', req['wardenRemark'] as String),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: AppColors.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(0, 44),
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

  Widget _slipRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                fontSize: 11.5,
                color: AppColors.textSlate,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 12,
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
