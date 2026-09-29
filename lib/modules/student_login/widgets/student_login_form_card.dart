import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          border: Border.all(color: const Color(0xFFE2E8F0)),
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
                'Welcome Back',
                style: AppTextStyles.titleLarge.copyWith(
                  color: const Color(0xFF0F172A),
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),

              // Subtitle
              Text(
                'Enter your campus credentials to access your hostel account.',
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF64748B),
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
                    'Email / Student ID',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Format: 2024-CS-108',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF006591),
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
                  color: const Color(0xFF0F172A),
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'student.id@campus.edu or 2024-CS-10',
                  hintStyle: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF94A3B8),
                    fontSize: 13.5,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF3F6FA),
                  prefixIcon: const Icon(
                    Icons.badge_outlined,
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
                        const BorderSide(color: Color(0xFF006591), width: 1.5),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter your student email or roll number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ── Field 2: Password
              Text(
                'Password',
                style: AppTextStyles.labelMedium.copyWith(
                  color: const Color(0xFF0F172A),
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
                    fillColor: const Color(0xFFF3F6FA),
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
                          const BorderSide(color: Color(0xFF006591), width: 1.5),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (val.length < 6) {
                      return 'Password must be at least 6 characters';
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
                              activeColor: const Color(0xFF00288E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Remember me',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: const Color(0xFF475569),
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
                      'Forgot password?',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: const Color(0xFF006591),
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
                      color: const Color(0xFF00288E),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color:
                              const Color(0xFF00288E).withValues(alpha: 0.28),
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
                                'Sign In to Portal',
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
