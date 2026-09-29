import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_register_controller.dart';
import 'password_strength_indicator.dart';
import 'phone_number_field.dart';
import 'terms_checkbox_card.dart';

class StudentRegisterForm extends GetView<StudentRegisterController> {
  const StudentRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Full Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.fieldFullName,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textDarkNavy,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                Text(
                  AppStrings.officialLegalName,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: controller.fullNameController,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textDarkNavy,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: AppStrings.fullNameHint,
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
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
                      const BorderSide(color: AppColors.portalNavy, width: 1.5),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return AppStrings.validationRequired;
                }
                if (val.trim().length < 2) {
                  return AppStrings.validationNameMin;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // ── 2. Student ID / Roll No.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.studentIdRollNo,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textDarkNavy,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.snackbar(
                      'Roll Number Format',
                      'Found on your campus identity card (e.g., 2025-ENG-4029)',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: const Icon(
                    Icons.help_outline_rounded,
                    size: 16,
                    color: AppColors.textSlate,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: controller.studentIdController,
              textCapitalization: TextCapitalization.characters,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textDarkNavy,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: AppStrings.studentIdHint,
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.numbers_rounded,
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
                      const BorderSide(color: AppColors.portalNavy, width: 1.5),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return AppStrings.validationRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  size: 13,
                  color: AppColors.badgeGreenDot,
                ),
                const SizedBox(width: 5),
                Text(
                  AppStrings.matchesRegistrar,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSlate,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── 3. Official Email
            Text(
              AppStrings.officialEmail,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textDarkNavy,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: AppStrings.officialEmailHint,
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.mail_outline_rounded,
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
                      const BorderSide(color: AppColors.portalNavy, width: 1.5),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return AppStrings.validationRequired;
                }
                if (!GetUtils.isEmail(val.trim())) {
                  return AppStrings.validationEmailInvalid;
                }
                return null;
              },
            ),
            const SizedBox(height: 4),
            Text(
              AppStrings.institutionalDomainHint,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSlate,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 16),

            // ── 4. Phone Number
            Text(
              AppStrings.fieldPhone,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 7),
            const PhoneNumberField(),
            const SizedBox(height: 16),

            // ── 5. Password
            Text(
              AppStrings.fieldPassword,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 7),
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                obscureText: !controller.isPasswordVisible.value,
                onChanged: controller.onPasswordChanged,
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
                  fillColor: Colors.white,
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
                        const BorderSide(color: AppColors.portalNavy, width: 1.5),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.validationRequired;
                  }
                  if (val.length < 8) {
                    return AppStrings.validationPasswordMin;
                  }
                  return null;
                },
              ),
            ),
            const PasswordStrengthIndicator(),
            const SizedBox(height: 16),

            // ── 6. Confirm Password
            Text(
              AppStrings.fieldConfirmPassword,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textDarkNavy,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 7),
            Obx(
              () => TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: !controller.isConfirmPasswordVisible.value,
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
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.lock_reset_rounded,
                    color: AppColors.textSlate,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.textSlate,
                      size: 20,
                    ),
                    onPressed: controller.toggleConfirmPasswordVisibility,
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
                        const BorderSide(color: AppColors.portalNavy, width: 1.5),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.validationRequired;
                  }
                  if (val != controller.passwordController.text) {
                    return AppStrings.validationPasswordMismatch;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),

            // ── 7. Terms & Agreement Card
            const TermsCheckboxCard(),
            const SizedBox(height: 20),

            // ── 8. Create Account CTA Button
            Obx(
              () => GestureDetector(
                onTap: controller.isLoading.value
                    ? null
                    : controller.createAccount,
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
                              AppStrings.createAccountButton,
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
    );
  }
}
