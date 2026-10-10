import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StudentDashboardController extends GetxController {
  // Navigation
  final RxInt selectedNavIndex = 0.obs;

  // Student Profile Info
  final RxString studentName = 'Rahul Sharma'.obs;
  final RxString studentGreeting = 'Good Morning'.obs;
  final RxString hostelName = 'Sunrise Hostel'.obs;
  final RxString roomNumber = '204'.obs;
  final RxString blockName = 'A Block'.obs;
  final RxString bedNumber = 'B2 (Window side)'.obs;
  final RxString roommatesInfo = '2 / 3 (1 vacant bunk)'.obs;
  final RxString residentStatus = 'Hostel Active Resident'.obs;

  // Overview Metrics
  final RxString feePendingAmount = '₹4,500'.obs;
  final RxString feeDueDate = 'Due Oct 10'.obs;
  final RxString attendancePercent = '87%'.obs;
  final RxString leaveRequestsCount = '1 Request'.obs;
  final RxString activeComplaintsCount = '2 Active'.obs;

  // Fee Details
  final RxString totalFee = '₹25,000'.obs;
  final RxString paidFee = '₹20,500'.obs;
  final RxString dueFeeDateFull = '10 Oct 2024'.obs;
  final RxString feeSemesterTerm = 'Semester Term 1'.obs;

  // Attendance Stats
  final RxDouble attendanceValue = 0.87.obs;
  final RxString attendanceQuality = 'GOOD'.obs;
  final RxInt presentDays = 22.obs;
  final RxInt absentDays = 2.obs;
  final RxInt leaveDays = 1.obs;
  final RxString minAttendanceRequirement = 'Min. Required 75%'.obs;

  // Leave Request
  final RxString leaveType = 'Personal Leave'.obs;
  final RxString leaveDuration = '05 Oct - 07 Oct'.obs;
  final RxString leaveAuthority = 'Hostel Warden Office'.obs;
  final RxString leaveStatus = 'Pending'.obs;

  // Recent Complaint
  final RxString complaintCategory = 'Room Fan Issue (Electrical)'.obs;
  final RxString complaintSubmittedDate = '02 Oct'.obs;
  final RxString complaintTechnician = 'Assigned (Ramesh Kumar)'.obs;
  final RxString complaintStatus = 'In Progress'.obs;

  // Today's Mess
  final RxString messStatus = 'Open Now'.obs;
  final List<Map<String, String>> messSchedule = [
    {
      'meal': 'Breakfast',
      'time': '8:00 AM',
      'menu': 'Poha + Tea',
    },
    {
      'meal': 'Lunch',
      'time': '1:00 PM',
      'menu': 'Rice + Dal + Sabzi',
    },
    {
      'meal': 'Snacks',
      'time': '5:00 PM',
      'menu': 'Tea + Biscuits',
    },
    {
      'meal': 'Dinner',
      'time': '8:00 PM',
      'menu': 'Roti + Paneer + Rice',
    },
  ];

  // Notices
  final List<Map<String, dynamic>> notices = [
    {
      'title': 'Hostel Maintenance Notice',
      'desc': 'Scheduled plumbing maintenance in Block A restrooms.',
      'date': '01 Oct 2024',
      'color': const Color(0xFF2563EB), // Blue
    },
    {
      'title': 'Mess Timing Update',
      'desc': 'Revised weekend breakfast schedule effective this Saturday.',
      'date': '30 Sep 2024',
      'color': const Color(0xFFF59E0B), // Amber
    },
    {
      'title': 'Annual Hostel Meeting',
      'desc':
          'All residents requested to assemble in the auditorium at 6:00 PM.',
      'date': '28 Sep 2024',
      'color': const Color(0xFF10B981), // Green
    },
  ];

  void setNavIndex(int index) {
    selectedNavIndex.value = index;
    if (index == 2) {
      showGatePassDialog();
    } else if (index == 3) {
      showHostelRulesDialog();
    } else if (index == 4) {
      showSettingsDialog();
    }
  }

  // Action Handlers
  void showPayNowDialog() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pay Hostel Fees',
                  style: AppTextStyles.titleMedium
                      .copyWith(color: AppColors.textDarkNavy),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF3C7).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFDE68A)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Pending',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: const Color(0xFF92400E)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        feePendingAmount.value,
                        style: AppTextStyles.titleLarge.copyWith(
                          color: const Color(0xFFB45309),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Term 1',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Payment Successful',
                    'Fee payment of ₹4,500 recorded successfully.',
                    backgroundColor: const Color(0xFFDCFCE7),
                    colorText: const Color(0xFF166534),
                    icon: const Icon(Icons.check_circle_rounded,
                        color: Color(0xFF166534)),
                    snackPosition: SnackPosition.TOP,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Proceed to Payment Gateway',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showApplyLeaveDialog() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Apply for Leave',
                  style: AppTextStyles.titleMedium
                      .copyWith(color: AppColors.textDarkNavy),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Submit a digital leave request to Warden Office.',
              style: AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Leave Reason',
                hintText: 'e.g. Family Function / Medical',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Leave Request Submitted',
                    'Your leave request has been sent for Warden approval.',
                    backgroundColor: const Color(0xFFE0F2FE),
                    colorText: const Color(0xFF0369A1),
                    icon: const Icon(Icons.assignment_turned_in,
                        color: Color(0xFF0369A1)),
                    snackPosition: SnackPosition.TOP,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit Application',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showSubmitComplaintDialog() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Submit New Complaint',
                  style: AppTextStyles.titleMedium
                      .copyWith(color: AppColors.textDarkNavy),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Issue Description',
                hintText: 'e.g. Electrical fan regulator repair',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Complaint Logged',
                    'Ticket #HF-409 created. Electrician assigned.',
                    backgroundColor: const Color(0xFFFEF3C7),
                    colorText: const Color(0xFFB45309),
                    icon: const Icon(Icons.build_circle,
                        color: Color(0xFFB45309)),
                    snackPosition: SnackPosition.TOP,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit Ticket',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showGatePassDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: AppColors.cardLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.qr_code_2_rounded,
                  size: 40,
                  color: AppColors.portalNavy,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Hostel Gate Entry Pass',
                style: AppTextStyles.titleMedium
                    .copyWith(color: AppColors.textDarkNavy),
              ),
              const SizedBox(height: 6),
              Text(
                'Show this QR code at main security gate',
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  size: 160,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Rahul Sharma • Room 204 • Block A',
                style: AppTextStyles.labelMedium
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
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

  void showHostelRulesDialog() {
    Get.toNamed('/student/rules');
  }


  void showSettingsDialog() {
    Get.toNamed('/student/settings');
  }
}
