import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/student_leave_controller.dart';

class LeaveUpcomingOutpassCard extends GetView<StudentLeaveController> {
  const LeaveUpcomingOutpassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Get.toNamed(
          AppRoutes.studentOutpassDetail,
          arguments: controller.upcomingOutpass,
        ),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.softGreenBorder),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D10B981),
                blurRadius: 12,
                offset: Offset(0, 3),
              ),
            ],
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: AppColors.liveGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppStrings.leaveUpcomingOutpass,
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.badgeGreenText,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.badgeMintBg,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    controller.upcomingOutpass['passId'] as String,
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: AppColors.badgeMintText,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Title, Dates & QR Code Box
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        controller.upcomingOutpass['title'] as String,
                        style: AppTextStyles.titleSmall.copyWith(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Obx(
                      () => Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 13,
                            color: AppColors.textSlate,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${controller.upcomingOutpass['dates']} • ${controller.upcomingOutpass['duration']}',
                            style: AppTextStyles.bodySmall.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSlate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // QR Code Box (Clickable)
              InkWell(
                onTap: () => Get.toNamed(
                  AppRoutes.studentOutpassDetail,
                  arguments: controller.upcomingOutpass,
                ),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.leaveQrBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.softBlueBorderAlt),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.qr_code_2_rounded,
                        size: 26,
                        color: AppColors.primaryBlue,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppStrings.leaveViewQr,
                        style: AppTextStyles.labelSmall.copyWith(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryBlue,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ── Bottom Verifications Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.fieldBgLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  size: 13,
                  color: AppColors.badgeGreenText,
                ),
                const SizedBox(width: 5),
                Text(
                  AppStrings.leaveParentVerified,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.badgeGreenText,
                  ),
                ),
                const SizedBox(width: 8),
                const Text('•', style: TextStyle(color: AppColors.textMuted)),
                const SizedBox(width: 8),
                const Icon(
                  Icons.security_rounded,
                  size: 13,
                  color: AppColors.portalSky,
                ),
                const SizedBox(width: 5),
                Text(
                  AppStrings.leaveGateAuthorized,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.portalSky,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
}
