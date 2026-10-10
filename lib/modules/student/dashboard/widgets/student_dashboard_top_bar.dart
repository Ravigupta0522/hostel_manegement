import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_dashboard_controller.dart';

class StudentDashboardTopBar extends GetView<StudentDashboardController>
    implements PreferredSizeWidget {
  const StudentDashboardTopBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.backgroundWhite,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Avatar with initials / student photo
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6366F1).withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'RS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Name and Room info
            Expanded(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${controller.studentGreeting.value}, ${controller.studentName.value}',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.textDarkNavy,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${controller.hostelName.value} • Room ${controller.roomNumber.value}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            // Notification Bell
            InkWell(
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notifications',
                              style: AppTextStyles.titleMedium
                                  .copyWith(color: AppColors.textDarkNavy),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close,
                                  color: AppColors.textSecondary),
                              onPressed: () => Get.back(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFFFEF3C7),
                            child:
                                Icon(Icons.payment, color: Color(0xFFD97706)),
                          ),
                          title: Text('Fee Due Reminder',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14)),
                          subtitle: Text('Fee of ₹4,500 due on 10 Oct 2024.',
                              style: TextStyle(fontSize: 12)),
                        ),
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFFDCFCE7),
                            child: Icon(Icons.restaurant,
                                color: Color(0xFF16A34A)),
                          ),
                          title: Text('Dinner Service Open',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14)),
                          subtitle: Text(
                              'Mess timing: 8:00 PM - 10:00 PM today.',
                              style: TextStyle(fontSize: 12)),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEF4444),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),

            // Logout / Quick Action button
            InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: 'Sign Out',
                  titleStyle: AppTextStyles.titleMedium,
                  middleText:
                      'Are you sure you want to sign out from the Student Portal?',
                  textConfirm: 'Sign Out',
                  textCancel: 'Cancel',
                  confirmTextColor: Colors.white,
                  buttonColor: AppColors.portalNavy,
                  onConfirm: () {
                    Get.back();
                    Get.offAllNamed('/role-selection');
                  },
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: AppColors.textSecondary,
                  size: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
