import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../controllers/student_warden_controller.dart';
import '../models/warden_contact_models.dart';

class WardenMessageDeskCard extends GetView<StudentWardenController> {
  const WardenMessageDeskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Message Warden Desk',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: AppColors.textDarkNavy,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.help_outline_rounded,
                  size: 19,
                  color: Color(0xFF64748B),
                ),
                onPressed: () {
                  Get.snackbar(
                    'Official Desk Ticket',
                    'Messages submitted here are permanently logged into your student residency record and assigned a tracking receipt.',
                    backgroundColor: const Color(0xFFF8FAFC),
                    colorText: AppColors.textDarkNavy,
                    snackPosition: SnackPosition.TOP,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            'Logged inquiry with official record receipt',
            style: AppTextStyles.bodySmall.copyWith(
              color: const Color(0xFF64748B),
              fontSize: 11.5,
            ),
          ),
          const SizedBox(height: 16),

          // Inquiry Category Header
          Text(
            'INQUIRY CATEGORY',
            style: AppTextStyles.labelSmall.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 10.5,
              color: const Color(0xFF64748B),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),

          // Chips Wrap
          Obx(() {
            final current = controller.selectedCategory.value;
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: InquiryCategory.values.map((cat) {
                final isSelected = current == cat;
                return InkWell(
                  onTap: () => controller.selectCategory(cat),
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.portalNavy
                          : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.portalNavy
                            : const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      cat.label,
                      style: AppTextStyles.labelSmall.copyWith(
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w600,
                        fontSize: 11.5,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF475569),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
          const SizedBox(height: 18),

          // Message Field Header
          Text(
            'YOUR MESSAGE',
            style: AppTextStyles.labelSmall.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 10.5,
              color: const Color(0xFF64748B),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),

          // Input Box
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: TextField(
              controller: controller.messageController,
              maxLines: 4,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 13,
                color: AppColors.textDarkNavy,
              ),
              decoration: InputDecoration(
                hintText:
                    'State your room number, student ID, and brief request...',
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF94A3B8),
                  fontSize: 12.5,
                ),
                contentPadding: const EdgeInsets.all(14),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Send Button
          Obx(() {
            final isBusy = controller.isSending.value;
            return SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: isBusy ? null : controller.sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: isBusy
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        Icons.send_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                label: Text(
                  'Send Message to Warden Desk',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
