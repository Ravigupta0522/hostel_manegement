import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordFormCard extends GetView<ForgotPasswordController> {
  const ForgotPasswordFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(18),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email or Student ID',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Campus Active',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF0284C7),
                      fontWeight: FontWeight.w600,
                      fontSize: 11.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // ── Input Field
              TextFormField(
                controller: controller.emailOrIdController,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: const Color(0xFF0F172A),
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'e.g. student.id@campus.edu',
                  hintStyle: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF94A3B8),
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
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
                        const BorderSide(color: Color(0xFF00288E), width: 1.5),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter your campus email or student ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),

              // ── Sub-hint
              Text(
                'Use the credential assigned during hostel room allotment.',
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF64748B),
                  fontSize: 11.5,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 18),

              // ── Send Verification Code Button
              Obx(
                () => GestureDetector(
                  onTap: controller.isLoading.value
                      ? null
                      : controller.sendVerificationCode,
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
                          blurRadius: 10,
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
                              const Icon(
                                Icons.near_me_rounded,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Send Verification Code',
                                style: AppTextStyles.labelLarge.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.5,
                                ),
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
