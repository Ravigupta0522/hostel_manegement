import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/reset_password_success_controller.dart';

class SessionsSecuredCard extends GetView<ResetPasswordSuccessController> {
  const SessionsSecuredCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Shield Icon inside soft blue circle
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.cardLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shield_outlined,
                color: AppColors.portalOcean,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),

            // Content Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Info Icon Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.sessionsSecured,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textDarkNavy,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5,
                        ),
                      ),
                      InkWell(
                        onTap: controller.showSecurityDetails,
                        child: const Icon(
                          Icons.info_outline_rounded,
                          size: 16,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Explanation
                  Text(
                    AppStrings.sessionsSecuredNotice,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSlate,
                      fontSize: 11.5,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Contact IT Support Desk Link
                  InkWell(
                    onTap: controller.contactItDesk,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.support_agent_rounded,
                          size: 14,
                          color: AppColors.portalOcean,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.contactItSupportDesk,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.portalOcean,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
