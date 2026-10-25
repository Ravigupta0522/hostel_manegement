import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/student_leave_controller.dart';

class LeaveHeroBanner extends GetView<StudentLeaveController> {
  const LeaveHeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Room & Block location pill
        Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
            decoration: BoxDecoration(
              color: AppColors.softBlue,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.softBlueBorder),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.linkBlue,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${controller.hostelBlock.value} • ${controller.roomNumber.value}',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ── Title: Leave Management
        Text(
          AppStrings.leaveManagementTitle,
          style: AppTextStyles.displayLarge.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.textDarkNavy,
            letterSpacing: -0.5,
          ),
        ),

        const SizedBox(height: 5),

        // ── Subtitle Description
        Text(
          AppStrings.leaveManagementSubtitle,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.5,
            color: AppColors.textSlate,
            height: 1.45,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 16),

        // ── + New Leave Request Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.studentApplyLeave),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: AppColors.textWhite,
              elevation: 0,
              minimumSize: const Size(0, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_circle_outline_rounded,
                  size: 18,
                  color: AppColors.textWhite,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.leaveNewRequestButton,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
