import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/otp_verification_controller.dart';

class OtpPasscodeCard extends GetView<OtpVerificationController> {
  const OtpPasscodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 14,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.securityPasscode,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSlate,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5,
                    letterSpacing: 0.5,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.badgeGreenBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.badgeGreenDot,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        AppStrings.expiringSoon,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.badgeGreenText,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── 6-Digit Passcode Boxes Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return _buildDigitBox(context, index);
              }),
            ),
            const SizedBox(height: 16),

            // ── Timer & Resend Strip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.fieldBgLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 15,
                        color: AppColors.textSlate,
                      ),
                      const SizedBox(width: 6),
                      Obx(() {
                        final secs = controller.resendSeconds.value;
                        final timerStr = secs > 0
                            ? '00:${secs.toString().padLeft(2, '0')}'
                            : '00:00';
                        return Text(
                          '${AppStrings.resendCodeIn}$timerStr',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSlate,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.5,
                          ),
                        );
                      }),
                    ],
                  ),
                  InkWell(
                    onTap: controller.resendOtp,
                    child: Text(
                      AppStrings.resendOtpNow,
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
      ),
    );
  }

  Widget _buildDigitBox(BuildContext context, int index) {
    return SizedBox(
      width: 44,
      height: 56,
      child: TextFormField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.textDarkNavy,
          fontWeight: FontWeight.w800,
          fontSize: 22,
        ),
        onChanged: (val) => controller.onDigitChanged(index, val),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.fieldBg,
          hintText: '•',
          hintStyle: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.borderLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.borderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.portalNavy, width: 1.8),
          ),
        ),
      ),
    );
  }
}
