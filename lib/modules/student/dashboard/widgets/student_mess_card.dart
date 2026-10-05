import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_dashboard_controller.dart';

class StudentMessCard extends GetView<StudentDashboardController> {
  const StudentMessCard({super.key});

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
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.restaurant_outlined,
                      size: 18,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Today's Mess",
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF16A34A),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      controller.messStatus.value,
                      style: const TextStyle(
                        color: Color(0xFF16A34A),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Meals List
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.messSchedule.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: Color(0xFFE2E8F0),
                indent: 14,
                endIndent: 14,
              ),
              itemBuilder: (context, index) {
                final item = controller.messSchedule[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Row(
                    children: [
                      // Meal name
                      SizedBox(
                        width: 75,
                        child: Text(
                          item['meal'] ?? '',
                          style: const TextStyle(
                            color: AppColors.textDarkNavy,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      // Time
                      SizedBox(
                        width: 70,
                        child: Text(
                          item['time'] ?? '',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      // Menu items
                      Expanded(
                        child: Text(
                          item['menu'] ?? '',
                          style: const TextStyle(
                            color: AppColors.textDarkNavy,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),

          // Footer link
          InkWell(
            onTap: () {
              Get.snackbar(
                'Weekly Mess Menu',
                'View full Monday-Sunday hostel dining timetable.',
                backgroundColor: const Color(0xFFEFF6FF),
                colorText: AppColors.portalNavy,
                snackPosition: SnackPosition.TOP,
              );
            },
            child: const Row(
              children: [
                Text(
                  'View Full Menu',
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
}
