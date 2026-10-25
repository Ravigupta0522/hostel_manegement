import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/apply_leave_controller.dart';

class ApplyLeaveBottomActions extends GetView<ApplyLeaveController> {
  const ApplyLeaveBottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Before you submit Alert Box
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.softBlue,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.softBlueBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.shield_outlined,
                size: 18,
                color: AppColors.linkBlue,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.beforeYouSubmitTitle,
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      AppStrings.beforeYouSubmitDesc,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 11,
                        color: AppColors.textSlate,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        // ── Submit Leave Request Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: controller.submitLeaveRequest,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: AppColors.textWhite,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(0, 50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.submitLeaveRequest,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 18,
                  color: AppColors.textWhite,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ── Cancel & Discard Draft Button
        SizedBox(
          width: double.infinity,
          height: 44,
          child: OutlinedButton(
            onPressed: controller.discardDraft,
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.backgroundWhite,
              foregroundColor: AppColors.textDarkNavy,
              side: const BorderSide(color: AppColors.borderLight),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              AppStrings.cancelDiscardDraft,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSlate,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
