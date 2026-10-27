import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/leave_request_detail_controller.dart';

class AttachedMedicalRecordsCard extends GetView<LeaveRequestDetailController> {
  const AttachedMedicalRecordsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x060F172A),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
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
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.attachment_rounded,
                      size: 15,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Attached Medical Records',
                    style: AppTextStyles.titleSmall.copyWith(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                ],
              ),
              Text(
                '1 File',
                style: AppTextStyles.labelSmall.copyWith(
                  fontSize: 11,
                  color: AppColors.textSlate,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // File Box Item
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1F2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFE4E6)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFFFE4E6)),
                  ),
                  child: const Icon(
                    Icons.picture_as_pdf_rounded,
                    color: Color(0xFFE11D48),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.attachedFileName.value,
                          style: AppTextStyles.titleSmall.copyWith(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDarkNavy,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Obx(
                        () => Text(
                          controller.attachedFileSize.value,
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 10.5,
                            color: AppColors.textSlate,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: controller.viewMedicalRecord,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.visibility_outlined,
                          size: 13,
                          color: Color(0xFF1E40AF),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'View',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E40AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
