import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  'Full Name',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: const Color(0xFF0F172A),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                Text(
                  'Official Legal Name',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: const Color(0xFF94A3B8),
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: controller.fullNameController,
              style: AppTextStyles.bodyMedium.copyWith(
                color: const Color(0xFF0F172A),
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: 'e.g. Marcus Richardson',
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF94A3B8),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                  color: Color(0xFF64748B),
                  size: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF00288E), width: 1.5),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your full name';
                }
                if (val.trim().length < 2) {
                  return 'Name must be at least 2 characters';
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
                  'Student ID / Roll No.',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: const Color(0xFF0F172A),
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
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: controller.studentIdController,
              textCapitalization: TextCapitalization.characters,
              style: AppTextStyles.bodyMedium.copyWith(
                color: const Color(0xFF0F172A),
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: 'E.G. 2025-ENG-4029',
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF94A3B8),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.numbers_rounded,
                  color: Color(0xFF64748B),
                  size: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF00288E), width: 1.5),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your student ID / roll number';
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
                  color: Color(0xFF10B981),
                ),
                const SizedBox(width: 5),
                Text(
                  'Matches academic registrar records',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── 3. Official Email
            Text(
              'Official Email',
              style: AppTextStyles.labelMedium.copyWith(
                color: const Color(0xFF0F172A),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.bodyMedium.copyWith(
                color: const Color(0xFF0F172A),
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: 'e.g. marcus.r@campus.edu',
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF94A3B8),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.mail_outline_rounded,
                  color: Color(0xFF64748B),
                  size: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF00288E), width: 1.5),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Email is required';
                }
                if (!GetUtils.isEmail(val.trim())) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 4),
            Text(
              'Must end in institutional domain (@campus.edu)',
              style: AppTextStyles.bodySmall.copyWith(
                color: const Color(0xFF64748B),
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 16),

            // ── 4. Phone Number
            Text(
              'Phone Number',
              style: AppTextStyles.labelMedium.copyWith(
                color: const Color(0xFF0F172A),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 7),
            const PhoneNumberField(),
            const SizedBox(height: 16),

            // ── 5. Password
            Text(
              'Password',
              style: AppTextStyles.labelMedium.copyWith(
                color: const Color(0xFF0F172A),
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
                  color: const Color(0xFF0F172A),
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: '••••••••••••',
                  hintStyle: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF94A3B8),
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Color(0xFF64748B),
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xFF64748B),
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
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Color(0xFF00288E), width: 1.5),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Password is required';
                  }
                  if (val.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
            ),
            const PasswordStrengthIndicator(),
            const SizedBox(height: 16),

            // ── 6. Confirm Password
            Text(
              'Confirm Password',
              style: AppTextStyles.labelMedium.copyWith(
                color: const Color(0xFF0F172A),
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
                  color: const Color(0xFF0F172A),
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: '••••••••••••',
                  hintStyle: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF94A3B8),
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.lock_reset_rounded,
                    color: Color(0xFF64748B),
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xFF64748B),
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
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Color(0xFF00288E), width: 1.5),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (val != controller.passwordController.text) {
                    return 'Passwords do not match';
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
                    color: const Color(0xFF00288E),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00288E).withValues(alpha: 0.28),
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
                              'Create Account',
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
