import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/leave_request_detail_controller.dart';

class OfficialWardenNotesCard extends GetView<LeaveRequestDetailController> {
  const OfficialWardenNotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
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
                      color: const Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.note_alt_outlined,
                      size: 15,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Official Warden Notes',
                    style: AppTextStyles.titleSmall.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Text(
                  controller.wardenNoteTimestamp.value,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 10.5,
                    color: AppColors.textSlate,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Italic Quote
          Obx(
            () => Text(
              '"${controller.wardenNoteText.value}"',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF475569),
                height: 1.45,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Footer Row: Recorded by & Read-only Log lock
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  '— Recorded by ${controller.wardenName.value}',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 11,
                    color: AppColors.textSlate,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.lock_outline_rounded,
                    size: 12,
                    color: Color(0xFFD97706),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Read-only Log',
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFD97706),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
