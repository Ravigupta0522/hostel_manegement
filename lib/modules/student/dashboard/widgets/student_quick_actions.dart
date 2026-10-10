import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_dashboard_controller.dart';

class StudentQuickActions extends GetView<StudentDashboardController> {
  const StudentQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'QUICK ACTIONS',
          style: TextStyle(
            color: AppColors.textDarkNavy,
            fontSize: 12.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 14),

        // 5 items in a row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActionButton(
              label: 'Pay Fee',
              icon: Icons.account_balance_wallet_outlined,
              onTap: controller.showPayNowDialog,
            ),
            _buildActionButton(
              label: 'Apply Leave',
              icon: Icons.calendar_month_outlined,
              onTap: controller.showApplyLeaveDialog,
            ),
            _buildActionButton(
              label: 'Submit Complaint',
              icon: Icons.build_outlined,
              onTap: controller.showSubmitComplaintDialog,
            ),
            _buildActionButton(
              label: 'View Room',
              icon: Icons.door_front_door_outlined,
              onTap: () {
                Get.snackbar(
                  'Room Information',
                  'Sunrise Hostel • Room 204 • Bed B2',
                  backgroundColor: const Color(0xFFF1F5F9),
                  colorText: AppColors.textDarkNavy,
                  snackPosition: SnackPosition.TOP,
                );
              },
            ),
            _buildActionButton(
              label: 'Attendance',
              icon: Icons.fact_check_outlined,
              onTap: () {
                Get.snackbar(
                  'Attendance Record',
                  '87% Compliant (22 Present, 2 Absent, 1 Leave)',
                  backgroundColor: const Color(0xFFDCFCE7),
                  colorText: const Color(0xFF166534),
                  snackPosition: SnackPosition.TOP,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFDEECFF),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFF93C5FD),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3B82F6).withValues(alpha: 0.18),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: const Color(0xFF1D4ED8),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDarkNavy,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
