import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_register_controller.dart';

class StudentRegisterFooter extends GetView<StudentRegisterController> {
  const StudentRegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // ── OR divider
          Row(
            children: [
              const Expanded(
                child: Divider(color: Color(0xFFE2E8F0), thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'OR',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF94A3B8),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(color: Color(0xFFE2E8F0), thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Already registered? Log in
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already registered? ',
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF64748B),
                  fontSize: 13,
                ),
              ),
              InkWell(
                onTap: controller.goToLogin,
                child: Text(
                  'Log in',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: const Color(0xFF00288E),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 256-Bit Encrypted Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.lock_rounded,
                  size: 13,
                  color: Color(0xFF006591),
                ),
                const SizedBox(width: 6),
                Text(
                  '256-Bit Encrypted Campus Student Portal',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: const Color(0xFF006591),
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
