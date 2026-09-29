import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header
          _buildHeader(),

          const SizedBox(height: 32),

          // ── Role selector
          _buildRoleSelector(),

          const SizedBox(height: 28),

          // ── Form
          Form(
            key: controller.loginFormKey,
            child: Column(
              children: [
                AppTextField(
                  label: 'Email Address',
                  hint: 'Enter your email',
                  controller: controller.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Email is required';
                    if (!GetUtils.isEmail(value)) return 'Enter a valid email';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                PasswordTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: controller.loginPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Password is required';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextLinkButton(
                    label: 'Forgot Password?',
                    onPressed: controller.goToForgotPassword,
                  ),
                ),

                const SizedBox(height: 8),

                // Error message
                Obx(() => controller.errorMessage.value.isNotEmpty
                    ? _buildErrorMessage(controller.errorMessage.value)
                    : const SizedBox.shrink()),

                const SizedBox(height: 20),

                // Login button
                Obx(() => PrimaryButton(
                      label: 'Sign In',
                      isLoading: controller.isLoading.value,
                      onPressed: controller.login,
                    )),

                const SizedBox(height: 24),

                // Register link
                _buildRegisterRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo row
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.home_work_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hostel',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Flow',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        Text('Welcome back', style: AppTextStyles.displayMedium),
        const SizedBox(height: 4),
        Text(
          'Sign in to continue to your account',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  //  ROLE SELECTOR
  // ─────────────────────────────────────────
  Widget _buildRoleSelector() {
    return Obx(() => Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundSecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              _roleTab('Student', 'student', Icons.school_outlined),
              _roleTab('Admin', 'admin', Icons.admin_panel_settings_outlined),
            ],
          ),
        ));
  }

  Widget _roleTab(String label, String role, IconData icon) {
    return Obx(() {
      final isSelected = controller.selectedRole.value == role;
      return Expanded(
        child: GestureDetector(
          onTap: () => controller.selectRole(role),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.backgroundWhite : Colors.transparent,
              borderRadius: BorderRadius.circular(9),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // ─────────────────────────────────────────
  //  ERROR MESSAGE
  // ─────────────────────────────────────────
  Widget _buildErrorMessage(String message) {
    return Container(
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
    );
  }

  // ─────────────────────────────────────────
  //  REGISTER ROW
  // ─────────────────────────────────────────
  Widget _buildRegisterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
        ),
        TextLinkButton(
          label: 'Register',
          onPressed: controller.goToRegister,
        ),
      ],
    );
  }
}
