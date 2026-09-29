import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.lock_open_rounded, color: AppColors.success, size: 28),
          ),

          const SizedBox(height: 20),

          Text('Reset Password', style: AppTextStyles.displayMedium),
          const SizedBox(height: 6),
          Text(
            'Create a new strong password for your account.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),

          const SizedBox(height: 32),

          Form(
            key: controller.resetFormKey,
            child: Column(
              children: [
                _buildPasswordField(
                  label: 'New Password',
                  hint: 'Enter new password',
                  controller: controller.resetPasswordController,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Password is required';
                    if (v.length < 8) return 'Must be at least 8 characters';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                _buildPasswordField(
                  label: 'Confirm New Password',
                  hint: 'Re-enter new password',
                  controller: controller.resetConfirmPasswordController,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please confirm password';
                    if (v != controller.resetPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
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

                const SizedBox(height: 20),

                Obx(() => PrimaryButton(
                      label: 'Reset Password',
                      isLoading: controller.isLoading.value,
                      onPressed: controller.resetPassword,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputAction textInputAction = TextInputAction.done,
    String? Function(String?)? validator,
  }) {
    return _PasswordField(
      label: label,
      hint: hint,
      ctrl: controller,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}

class _PasswordField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController ctrl;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const _PasswordField({
    required this.label,
    required this.hint,
    required this.ctrl,
    required this.textInputAction,
    this.validator,
  });

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.labelMedium.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.ctrl,
          obscureText: _obscure,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: const Icon(Icons.lock_outline_rounded, size: 18, color: AppColors.textLight),
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(
                _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                size: 18,
                color: AppColors.textLight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
