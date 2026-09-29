import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/reset_password_controller.dart';

class SetNewPasswordForm extends GetView<ResetPasswordController> {
  const SetNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ─── Field 1: New Password ──────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.newPassword,
                style: AppTextStyles.labelMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDarkNavy,
                  fontSize: 14,
                ),
              ),
              Text(
                AppStrings.requiredLabel,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.portalOcean,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Obx(
            () => Container(
              decoration: BoxDecoration(
                color: AppColors.fieldBg,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderLight, width: 1.2),
              ),
              child: TextFormField(
                controller: controller.newPasswordController,
                obscureText: !controller.isNewPasswordVisible.value,
                onChanged: controller.onPasswordChanged,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDarkNavy,
                  fontWeight: FontWeight.w600,
                  letterSpacing: controller.isNewPasswordVisible.value ? 0 : 2,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isNewPasswordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    onPressed: controller.toggleNewPasswordVisibility,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // ─── Security Strength Indicator ────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.securityStrength,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textDarkNavy,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              Obx(
                () => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: controller.strengthColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    controller.strengthLabel,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 4-Segment Strength Bars
          Obx(
            () => Row(
              children: List.generate(4, (index) {
                final isFilled = controller.passwordStrength.value > index;
                return Expanded(
                  child: Container(
                    height: 5,
                    margin: EdgeInsets.only(
                      right: index < 3 ? 6.0 : 0.0,
                    ),
                    decoration: BoxDecoration(
                      color: isFilled
                          ? controller.strengthColor
                          : AppColors.borderLight,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 18),

          // ─── Field 2: Confirm New Password ──────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.confirmNewPassword,
                style: AppTextStyles.labelMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDarkNavy,
                  fontSize: 14,
                ),
              ),
              Obx(
                () => controller.passwordsMatch.value
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_circle_outline_rounded,
                            size: 14,
                            color: AppColors.badgeMintText,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppStrings.matched,
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.badgeMintText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Obx(
            () => Container(
              decoration: BoxDecoration(
                color: AppColors.fieldBg,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderLight, width: 1.2),
              ),
              child: TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: !controller.isConfirmPasswordVisible.value,
                onChanged: controller.onConfirmPasswordChanged,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDarkNavy,
                  fontWeight: FontWeight.w600,
                  letterSpacing:
                      controller.isConfirmPasswordVisible.value ? 0 : 2,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_clock_outlined,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (controller.passwordsMatch.value)
                        const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(
                            Icons.check_circle_outline_rounded,
                            color: AppColors.badgeMintText,
                            size: 18,
                          ),
                        ),
                      IconButton(
                        icon: Icon(
                          controller.isConfirmPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                        onPressed: controller.toggleConfirmPasswordVisibility,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),

          // ─── Password Requirements Card ─────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.passwordRequirements,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => _buildRequirementRow(
                    isMet: controller.hasMin8Chars.value,
                    label: AppStrings.reqMin8Chars,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => _buildRequirementRow(
                    isMet: controller.hasNumericOrSpecial.value,
                    label: AppStrings.reqOneNumeric,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => _buildRequirementRow(
                    isMet: controller.passwordsMatch.value,
                    label: AppStrings.reqMatchConfirmed,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),

          // ─── Reset Password Button ──────────────────────────────
          Obx(
            () => SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.submitResetPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  foregroundColor: AppColors.textWhite,
                  elevation: 2,
                  shadowColor: AppColors.portalNavy.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.textWhite,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.resetPasswordAction,
                            style: AppTextStyles.labelLarge.copyWith(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: AppColors.textWhite,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementRow({
    required bool isMet,
    required String label,
  }) {
    return Row(
      children: [
        Icon(
          isMet
              ? Icons.check_circle_rounded
              : Icons.radio_button_unchecked_rounded,
          size: 18,
          color: isMet ? AppColors.badgeMintText : AppColors.textLight,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isMet ? AppColors.textDarkNavy : AppColors.textSecondary,
              fontSize: 13,
              fontWeight: isMet ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
