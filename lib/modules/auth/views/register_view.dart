import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          GestureDetector(
            onTap: Get.back,
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios_rounded, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text(
                  'Back to Login',
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Header
          Text('Create Account', style: AppTextStyles.displayMedium),
          const SizedBox(height: 4),
          Text(
            'Register to access HostelFlow',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),

          const SizedBox(height: 32),

          // Form
          Form(
            key: controller.registerFormKey,
            child: Column(
              children: [
                AppTextField(
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  controller: controller.registerNameController,
                  prefixIcon: Icons.person_outline_rounded,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Name is required';
                    if (v.trim().length < 2) return 'Name must be at least 2 characters';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                AppTextField(
                  label: 'Email Address',
                  hint: 'Enter your email',
                  controller: controller.registerEmailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Email is required';
                    if (!GetUtils.isEmail(v)) return 'Enter a valid email';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                PasswordTextField(
                  label: 'Password',
                  hint: 'Create a password',
                  controller: controller.registerPasswordController,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Password is required';
                    if (v.length < 8) return 'Password must be at least 8 characters';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                PasswordTextField(
                  label: 'Confirm Password',
                  hint: 'Re-enter your password',
                  controller: controller.registerConfirmPasswordController,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please confirm your password';
                    if (v != controller.registerPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                Obx(() => controller.errorMessage.value.isNotEmpty
                    ? _buildErrorMessage(controller.errorMessage.value)
                    : const SizedBox.shrink()),

                const SizedBox(height: 20),

                Obx(() => PrimaryButton(
                      label: 'Create Account',
                      isLoading: controller.isLoading.value,
                      onPressed: controller.register,
                    )),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                    ),
                    TextLinkButton(
                      label: 'Sign In',
                      onPressed: controller.goToLogin,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            const Icon(Icons.error_outline_rounded, size: 16, color: AppColors.error),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
