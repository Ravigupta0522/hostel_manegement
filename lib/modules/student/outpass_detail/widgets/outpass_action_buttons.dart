import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/outpass_detail_controller.dart';

class OutpassActionButtons extends GetView<OutpassDetailController> {
  const OutpassActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Primary Button: Download Leave Pass (PDF)
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: controller.downloadPdf,
            icon: const Icon(Icons.file_download_outlined, size: 20),
            label: Text(
              'Download Leave Pass (PDF)',
              style: AppTextStyles.labelMedium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.portalNavy,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // 2. Secondary Button: Share Pass with Guardian
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: controller.shareWithGuardian,
            icon: const Icon(
              Icons.share_outlined,
              size: 19,
              color: Color(0xFF2563EB),
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

        const SizedBox(height: 14),

        // 3. Danger Link: Cancel / Request Early Return
        InkWell(
          onTap: controller.cancelOrEarlyReturn,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.cancel_outlined,
                  size: 15,
                  color: Color(0xFFE11D48),
                ),
                const SizedBox(width: 6),
                Text(
                  'Cancel / Request Early Return',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFE11D48),
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
