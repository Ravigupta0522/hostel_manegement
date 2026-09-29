import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationHeroCard extends GetView<OtpVerificationController> {
  const OtpVerificationHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // ── Center Email 2FA Illustration
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Outer soft glow circle
              Container(
                width: 76,
                height: 76,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundSecondary,
                  shape: BoxShape.circle,
                ),
              ),

              // Inner deep navy circle with verified email envelope
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColors.portalNavy,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.portalNavy.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.mark_email_read_rounded,
                  color: AppColors.textWhite,
                  size: 28,
                ),
              ),

              // 2FA Key Pill Badge at bottom
              Positioned(
                bottom: -6,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.portalCyan,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.vpn_key_rounded,
                        color: AppColors.textWhite,
                        size: 11,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '2FA',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // ── Student Portal Verification Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5.5),
            decoration: BoxDecoration(
              color: AppColors.cardLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.shield_outlined,
                  size: 13,
                  color: AppColors.portalOcean,
                ),
                const SizedBox(width: 6),
                Text(
                  AppStrings.studentPortalVerification,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.portalOcean,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // ── Title
          Text(
            AppStrings.verifyCodeTitle,
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.textDarkNavy,
              fontWeight: FontWeight.w800,
              fontSize: 25,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 6),

          // ── Subtitle
          Text(
            AppStrings.verifyCodeSub,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSlate,
              fontSize: 13,
              height: 1.45,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // ── Target Email Pill with Edit link
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.cardLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.alternate_email_rounded,
                  size: 14,
                  color: AppColors.portalOcean,
                ),
                const SizedBox(width: 6),
                Obx(
                  () => Text(
                    controller.maskedEmail.value,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: controller.editEmail,
                  child: Text(
                    AppStrings.edit,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.portalNavy,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
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
