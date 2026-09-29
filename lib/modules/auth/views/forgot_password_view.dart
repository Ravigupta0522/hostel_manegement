import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/auth_controller.dart';

class ForgotPasswordView extends GetView<AuthController> {
  const ForgotPasswordView({super.key});

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

          // Icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.lock_reset_rounded, color: AppColors.primary, size: 28),
          ),

          const SizedBox(height: 20),

          Text('Forgot Password?', style: AppTextStyles.displayMedium),
          const SizedBox(height: 6),
          Text(
            'Enter your registered email address. We will send you an OTP to reset your password.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),

          const SizedBox(height: 32),

          Form(
            key: controller.forgotFormKey,
            child: Column(
              children: [
                AppTextField(
                  label: 'Email Address',
                  hint: 'Enter your registered email',
                  controller: controller.forgotEmailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Email is required';
                    if (!GetUtils.isEmail(v)) return 'Enter a valid email';
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                Obx(() => controller.errorMessage.value.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.error.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                          ),
                          child: Text(
                            controller.errorMessage.value,
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
                          ),
                        ),
                      )
                    : const SizedBox.shrink()),

                const SizedBox(height: 20),

                Obx(() => PrimaryButton(
                      label: 'Send OTP',
                      isLoading: controller.isLoading.value,
                      onPressed: controller.forgotPassword,
                      icon: Icons.send_rounded,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
