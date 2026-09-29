import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_register_controller.dart';

class TermsCheckboxCard extends GetView<StudentRegisterController> {
  const TermsCheckboxCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Checkbox
          Obx(
            () => SizedBox(
              width: 22,
              height: 22,
              child: Checkbox(
                value: controller.agreeToTerms.value,
                onChanged: (_) => controller.toggleTerms(),
                activeColor: const Color(0xFF00288E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Terms text
          Expanded(
            child: InkWell(
              onTap: controller.toggleTerms,
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF334155),
                    fontSize: 12,
                    height: 1.4,
                  ),
                  children: const [
                    TextSpan(text: 'I agree to the '),
                    TextSpan(
                      text: 'Hostel Rules & Terms of Residence',
                      style: TextStyle(
                        color: Color(0xFF00288E),
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and acknowledge the university '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF00288E),
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
