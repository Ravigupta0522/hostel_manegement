import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_rules_controller.dart';

class RulesReassignmentButton extends GetView<StudentRulesController> {
  const RulesReassignmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primary PDF Download Button
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: controller.downloadRulesPdf,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: AppColors.textWhite,
              elevation: 3,
              shadowColor: AppColors.primaryBlue.withValues(alpha: 0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.picture_as_pdf_rounded,
                    color: AppColors.textWhite, size: 20),
                const SizedBox(width: 8),
                Text(
                  AppStrings.rulesDownloadPdf,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Secondary Option: Request Room Reassignment
        TextButton.icon(
          onPressed: controller.showReassignmentDialog,
          icon: const Icon(Icons.swap_horiz_rounded,
              size: 16, color: AppColors.linkBlue),
          label: Text(
            AppStrings.rulesReassignmentInquiry,
            style: AppTextStyles.labelMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.linkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
