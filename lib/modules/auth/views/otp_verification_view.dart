import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/auth_controller.dart';

class OtpVerificationView extends GetView<AuthController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: Get.back,
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios_rounded, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text('Back', style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.mark_email_read_outlined, color: AppColors.primary, size: 28),
          ),

          const SizedBox(height: 20),

          Text('Check your email', style: AppTextStyles.displayMedium),
          const SizedBox(height: 6),
          Obx(() => Text(
                'We sent a 6-digit OTP to ${controller.otpEmail.value}',
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
              )),

          const SizedBox(height: 32),

          // OTP input row
          Text(
            'Enter OTP',
            style: AppTextStyles.labelMedium.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) => _buildOtpBox(context, index)),
          ),

          const SizedBox(height: 12),

          Obx(() => controller.errorMessage.value.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    controller.errorMessage.value,
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
                  ),
                )
              : const SizedBox.shrink()),

          const SizedBox(height: 24),

          Obx(() => PrimaryButton(
                label: 'Verify OTP',
                isLoading: controller.isLoading.value,
                onPressed: controller.verifyOtp,
              )),

          const SizedBox(height: 20),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Didn't receive OTP? ",
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                TextButton(
                  onPressed: controller.forgotPassword,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Resend',
                    style: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, int index) {
    return SizedBox(
      width: 46,
      height: 52,
      child: TextFormField(
        controller: controller.otpControllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: AppTextStyles.titleMedium.copyWith(color: AppColors.primary),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
