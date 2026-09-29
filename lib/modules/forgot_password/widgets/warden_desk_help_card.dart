import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/forgot_password_controller.dart';

class WardenDeskHelpCard extends GetView<ForgotPasswordController> {
  const WardenDeskHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardLight,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            // Headset help icon circle
            Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: AppColors.badgeBlueBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.support_agent_rounded,
                color: AppColors.portalNavy,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),

            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.havingTroubleWarden,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    AppStrings.visitWardenDesk,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSlate,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Desk Info button
            InkWell(
              onTap: controller.showDeskInfo,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: AppColors.badgeBlueBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  AppStrings.deskInfo,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.portalNavy,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
