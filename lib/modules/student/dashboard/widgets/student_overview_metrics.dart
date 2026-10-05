import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_dashboard_controller.dart';

class StudentOverviewMetrics extends GetView<StudentDashboardController> {
  const StudentOverviewMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: 3 cards (ROOM, FEE, ATTENDANCE)
        Row(
          children: [
            // ROOM Card
            Expanded(
              child: _buildMetricCard(
                label: 'ROOM',
                trailing: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.meeting_room_outlined,
                    size: 15,
                    color: Color(0xFF6366F1),
                  ),
                ),
                value: Obx(() => Text(
                      controller.roomNumber.value,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textDarkNavy,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    )),
                subtitle: Obx(() => Text(
                      controller.blockName.value,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ),
            const SizedBox(width: 8),

            // FEE Card
            Expanded(
              child: _buildMetricCard(
                label: 'FEE',
                trailing: _buildPillBadge(
                  text: 'Pending',
                  bgColor: const Color(0xFFFEF3C7),
                  textColor: const Color(0xFFD97706),
                ),
                value: Obx(() => Text(
                      controller.feePendingAmount.value,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textDarkNavy,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    )),
                subtitle: Obx(() => Text(
                      controller.feeDueDate.value,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: const Color(0xFFD97706),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
            ),
            const SizedBox(width: 8),

            // ATTENDANCE Card
            Expanded(
              child: _buildMetricCard(
                label: 'ATTENDANCE',
                trailing: _buildPillBadge(
                  text: '87%',
                  bgColor: const Color(0xFFDCFCE7),
                  textColor: const Color(0xFF16A34A),
                ),
                value: Obx(() => Text(
                      controller.attendancePercent.value,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textDarkNavy,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    )),
                subtitle: Text(
                  'Compliant',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF16A34A),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Row 2: 2 cards (LEAVE, COMPLAINTS)
        Row(
          children: [
            // LEAVE Card
            Expanded(
              child: _buildMetricCard(
                label: 'LEAVE',
                trailing: _buildPillBadge(
                  text: 'Pending',
                  bgColor: const Color(0xFFE0F2FE),
                  textColor: const Color(0xFF0284C7),
                ),
                value: Obx(() => Text(
                      controller.leaveRequestsCount.value,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textDarkNavy,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    )),
                subtitle: Text(
                  'Under Review',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // COMPLAINTS Card
            Expanded(
              child: _buildMetricCard(
                label: 'COMPLAINTS',
                trailing: _buildPillBadge(
                  text: '2 Open',
                  bgColor: const Color(0xFFFFE4E6),
                  textColor: const Color(0xFFE11D48),
                ),
                value: Obx(() => Text(
                      controller.activeComplaintsCount.value,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textDarkNavy,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    )),
                subtitle: Text(
                  '1 In Progress',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFFE11D48),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String label,
    required Widget trailing,
    required Widget value,
    required Widget subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              trailing,
            ],
          ),
          const SizedBox(height: 8),

          // Main value
          value,
          const SizedBox(height: 3),

          // Subtitle
          subtitle,
        ],
      ),
    );
  }

  Widget _buildPillBadge({
    required String text,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 9.5,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
