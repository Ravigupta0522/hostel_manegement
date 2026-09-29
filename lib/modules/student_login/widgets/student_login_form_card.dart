import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_login_controller.dart';

class StudentLoginFormCard extends GetView<StudentLoginController> {
  const StudentLoginFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                AppStrings.studentLoginTitle,
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.textDarkNavy,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),

              // Subtitle
              Text(
                AppStrings.studentLoginSubtitle,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSlate,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),

              // ── Field 1: Email / Student ID
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.studentEmailOrId,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    AppStrings.studentEmailOrIdFormat,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.portalOcean,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: controller.emailOrIdController,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDarkNavy,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: AppStrings.studentEmailOrIdHint,
                  hintStyle: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 13.5,
                  ),
                  filled: true,
                  fillColor: AppColors.fieldBg,
                  prefixIcon: const Icon(
                    Icons.badge_outlined,
                    color: AppColors.textSlate,
                    size: 20,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
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
                    borderSide:
                        const BorderSide(color: AppColors.portalOcean, width: 1.5),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return AppStrings.validationRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ── Field 2: Password
              Text(
                AppStrings.fieldPassword,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textDarkNavy,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),

              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textDarkNavy,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: AppStrings.studentPasswordHint,
                    hintStyle: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                    filled: true,
                    fillColor: AppColors.fieldBg,
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.textSlate,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textSlate,
                        size: 20,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
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
                      borderSide:
                          const BorderSide(color: AppColors.portalOcean, width: 1.5),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.validationRequired;
                    }
                    if (val.length < 6) {
                      return AppStrings.validationPasswordMin;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),

              // ── Remember me & Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember me
                  Obx(
                    () => InkWell(
                      onTap: controller.toggleRememberMe,
                      borderRadius: BorderRadius.circular(6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 22,
                            height: 22,
                            child: Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: (_) => controller.toggleRememberMe(),
                              activeColor: AppColors.portalNavy,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppStrings.studentRememberMe,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSlate,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Forgot password
                  InkWell(
                    onTap: controller.goToForgotPassword,
                    child: Text(
                      AppStrings.studentForgotPassword,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.portalOcean,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ── Sign In to Portal Button
              Obx(
                () => GestureDetector(
                  onTap: controller.isLoading.value ? null : controller.signIn,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.portalNavy,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.portalNavy.withValues(alpha: 0.28),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.studentSignInButton,
                                style: AppTextStyles.labelLarge.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
