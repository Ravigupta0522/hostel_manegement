import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_leave_controller.dart';

class LeaveBalanceStatusGrid extends GetView<StudentLeaveController> {
  const LeaveBalanceStatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.leaveBalanceStatusTitle,
                style: AppTextStyles.labelSmall.copyWith(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textSlate,
                  letterSpacing: 0.6,
                ),
              ),
              Obx(
                () => Text(
                  controller.semester.value,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // 2x2 Cards Grid
        Row(
          children: [
            // Card 1: Total Petitions
            Expanded(
              child: Obx(
                () => _buildStatusCard(
                  title: AppStrings.leaveTotalPetitions,
                  trailing: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.softBlue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.folder_open_rounded,
                      size: 14,
                      color: AppColors.linkBlue,
                    ),
                  ),
                  count: '${controller.totalPetitions.value}',
                  countColor: AppColors.textDarkNavy,
                  caption: AppStrings.leaveLogged,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Card 2: Pending
            Expanded(
              child: Obx(
                () => _buildStatusCard(
                  title: AppStrings.leavePending,
                  trailing: _buildBadge(
                    text: '● ${AppStrings.leaveReviewBadge}',
                    bg: AppColors.leaveReviewBg,
                    color: AppColors.leaveReviewText,
                  ),
                  count: '${controller.pendingPetitions.value}',
                  countColor: AppColors.amberIcon,
                  caption: AppStrings.leaveAwaitingWarden,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            // Card 3: Approved
            Expanded(
              child: Obx(
                () => _buildStatusCard(
                  title: AppStrings.leaveApproved,
                  trailing: _buildBadge(
                    text: '✓ ${AppStrings.leavePassBadge}',
                    bg: AppColors.leavePassBg,
                    color: AppColors.leavePassText,
                  ),
                  count: '${controller.approvedPetitions.value}',
                  countColor: AppColors.liveGreen,
                  caption: AppStrings.leaveReadyToUse,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Card 4: Rejected
            Expanded(
              child: Obx(
                () => _buildStatusCard(
                  title: AppStrings.leaveRejected,
                  trailing: _buildBadge(
                    text: '✕ ${AppStrings.leaveClosedBadge}',
                    bg: AppColors.leaveClosedBg,
                    color: AppColors.leaveClosedText,
                  ),
                  count: '${controller.rejectedPetitions.value}',
                  countColor: AppColors.error,
                  caption: AppStrings.leaveParentDenied,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusCard({
    required String title,
    required Widget trailing,
    required String count,
    required Color countColor,
    required String caption,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.labelSmall.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSlate,
                ),
              ),
              trailing,
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                count,
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: countColor,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  caption,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSlate,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge({
    required String text,
    required Color bg,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: AppTextStyles.labelSmall.copyWith(
          fontSize: 9.5,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
    );
  }
}
