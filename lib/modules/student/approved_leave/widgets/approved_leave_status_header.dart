import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/approved_leave_controller.dart';

class ApprovedLeaveStatusHeader extends GetView<ApprovedLeaveController> {
  const ApprovedLeaveStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Row: Pass ID & Status Badge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.luggage_rounded,
                    size: 19,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(width: 9),
                Obx(
                  () => Text(
                    controller.passId.value,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDarkNavy,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              final status = controller.status.value;
              final isApproved = status.toLowerCase().contains('approved');
              final isRejected = status.toLowerCase().contains('rejected');

              final Color bg = isApproved
                  ? const Color(0xFFD1FAE5)
                  : isRejected
                      ? const Color(0xFFFFE4E6)
                      : const Color(0xFFFEF3C7);
              final Color textColor = isApproved
                  ? const Color(0xFF047857)
                  : isRejected
                      ? const Color(0xFFDC2626)
                      : const Color(0xFFB45309);
              final Color dotColor = isApproved
                  ? const Color(0xFF10B981)
                  : isRejected
                      ? const Color(0xFFEF4444)
                      : const Color(0xFFF59E0B);

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),

        const SizedBox(height: 14),

        // Bottom: Status Segment Filter Bar (Approved, Pending, Rejected)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Obx(() {
            final active = controller.selectedTab.value;
            return Row(
              children: [
                _buildSegmentTab(
                  label: 'Approved',
                  isSelected: active == 'Approved',
                  onTap: () => controller.onTabSelected('Approved'),
                ),
                _buildSegmentTab(
                  label: 'Pending',
                  isSelected: active == 'Pending',
                  onTap: () => controller.onTabSelected('Pending'),
                ),
                _buildSegmentTab(
                  label: 'Rejected',
                  isSelected: active == 'Rejected',
                  onTap: () => controller.onTabSelected('Rejected'),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSegmentTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Color(0x0C0F172A),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? AppColors.textDarkNavy
                    : const Color(0xFF64748B),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

