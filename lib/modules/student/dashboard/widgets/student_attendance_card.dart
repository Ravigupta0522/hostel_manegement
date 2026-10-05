import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_dashboard_controller.dart';

class StudentAttendanceCard extends GetView<StudentDashboardController> {
  const StudentAttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.donut_large_rounded,
                      size: 18,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Attendance',
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Text(
                  controller.minAttendanceRequirement.value,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Content Row: Circular Gauge on left, 3 Status boxes on right
          Row(
            children: [
              // Circular progress indicator with center text
              SizedBox(
                width: 76,
                height: 76,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 76,
                      height: 76,
                      child: CircularProgressIndicator(
                        value: controller.attendanceValue.value,
                        strokeWidth: 7,
                        backgroundColor: const Color(0xFFE2E8F0),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF10B981),
                        ),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          controller.attendancePercent.value,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDarkNavy,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          controller.attendanceQuality.value,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF10B981),
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),

              // 3 Status chips (Present, Absent, Leave)
              Expanded(
                child: Row(
                  children: [
                    // Present
                    Expanded(
                      child: _buildAttendanceStatusBox(
                        count: '${controller.presentDays.value}',
                        label: 'Present',
                        bgColor: const Color(0xFFF0FDF4),
                        accentColor: const Color(0xFF16A34A),
                      ),
                    ),
                    const SizedBox(width: 6),

                    // Absent
                    Expanded(
                      child: _buildAttendanceStatusBox(
                        count: '${controller.absentDays.value}',
                        label: 'Absent',
                        bgColor: const Color(0xFFFEF2F2),
                        accentColor: const Color(0xFFDC2626),
                      ),
                    ),
                    const SizedBox(width: 6),

                    // Leave
                    Expanded(
                      child: _buildAttendanceStatusBox(
                        count: '${controller.leaveDays.value}',
                        label: 'Leave',
                        bgColor: const Color(0xFFF0F9FF),
                        accentColor: const Color(0xFF0284C7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Footer link
          InkWell(
            onTap: () {
              Get.snackbar(
                'Attendance History',
                'Overall attendance: 87% (Meets minimum 75% criteria)',
                backgroundColor: const Color(0xFFDCFCE7),
                colorText: const Color(0xFF166534),
                snackPosition: SnackPosition.TOP,
              );
            },
            child: const Row(
              children: [
                Text(
                  'View Attendance',
                  style: TextStyle(
                    color: AppColors.portalNavy,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11,
                  color: AppColors.portalNavy,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceStatusBox({
    required String count,
    required String label,
    required Color bgColor,
    required Color accentColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accentColor.withValues(alpha: 0.15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count,
            style: TextStyle(
              color: accentColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: accentColor,
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
