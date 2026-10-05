import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_dashboard_controller.dart';

class StudentRoomInfoCard extends GetView<StudentDashboardController> {
  const StudentRoomInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
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
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.door_sliding_outlined,
                      size: 18,
                      color: Color(0xFF4F46E5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Room Information',
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  'Allocated',
                  style: TextStyle(
                    color: Color(0xFF16A34A),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3 Column Grid (HOSTEL, BLOCK, ROOM)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: _buildInfoItem(
                    label: 'HOSTEL',
                    value: controller.hostelName.value,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _buildInfoItem(
                    label: 'BLOCK',
                    value: controller.blockName.value,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _buildInfoItem(
                    label: 'ROOM',
                    value: controller.roomNumber.value,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // 2 Column Grid (BED, ROOMMATES)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    label: 'BED',
                    value: controller.bedNumber.value,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    label: 'ROOMMATES',
                    value: controller.roommatesInfo.value,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Footer link
          InkWell(
            onTap: () {
              Get.snackbar(
                'Room Details',
                'Sunrise Hostel • Block A • Room 204 • 2 Roommates',
                backgroundColor: const Color(0xFFF0FDF4),
                colorText: const Color(0xFF166534),
                snackPosition: SnackPosition.TOP,
              );
            },
            child: const Row(
              children: [
                Text(
                  'View Room Details',
                  style: TextStyle(
                    color: AppColors.portalNavy,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11,
                  color: AppColors.portalNavy,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 9.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: AppTextStyles.labelMedium.copyWith(
            color: AppColors.textDarkNavy,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
