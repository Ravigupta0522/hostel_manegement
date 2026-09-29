import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/otp_verification_controller.dart';

class OtpTroubleshootCard extends GetView<OtpVerificationController> {
  const OtpTroubleshootCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question mark icon circle
            Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Color(0xFFDCE8FA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.help_outline_rounded,
                color: AppColors.portalNavy,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),

            // Content column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.didntReceiveEmail,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.spamFilterAdvice,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSlate,
                      fontSize: 11.5,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Option 1: Contact Hostel Warden Office
                  InkWell(
                    onTap: controller.contactWarden,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.support_agent_rounded,
                          size: 15,
                          color: AppColors.portalNavy,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppStrings.contactWardenOffice,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.portalNavy,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Option 2: Try receiving passcode via SMS instead
                  InkWell(
                    onTap: controller.resendViaSms,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 14,
                          color: AppColors.portalNavy,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppStrings.tryViaSms,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.portalNavy,
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
