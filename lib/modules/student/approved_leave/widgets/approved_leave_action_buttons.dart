import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/approved_leave_controller.dart';

class ApprovedLeaveActionButtons extends GetView<ApprovedLeaveController> {
  const ApprovedLeaveActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Primary Button: Download Leave Pass (PDF)
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: controller.downloadPdfPass,
            icon: const Icon(
              Icons.download_rounded,
              size: 19,
              color: Colors.white,
            ),
            label: Text(
              'Download Leave Pass (PDF)',
              style: AppTextStyles.labelMedium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // 2. Secondary Button: Share Pass with Guardian
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: controller.sharePassWithGuardian,
            icon: const Icon(
              Icons.phone_android_rounded,
              size: 18,
              color: Color(0xFF1D4ED8),
            ),
            label: Text(
              'Share Pass with Guardian',
              style: AppTextStyles.labelMedium.copyWith(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textDarkNavy,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFE2E8F0)),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // 3. Destructive / Warning Link: Cancel / Request Early Return
        TextButton.icon(
          onPressed: controller.cancelOrRequestEarlyReturn,
          icon: const Icon(
            Icons.warning_amber_rounded,
            size: 16,
            color: Color(0xFFD97706),
          ),
          label: Text(
            'Cancel / Request Early Return',
            style: AppTextStyles.labelSmall.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFB45309),
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
    );
  }
}

