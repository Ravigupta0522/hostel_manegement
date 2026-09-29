import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_register_controller.dart';

class TermsCheckboxCard extends GetView<StudentRegisterController> {
  const TermsCheckboxCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardLightAlt,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
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
                activeColor: AppColors.portalNavy,
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
                    color: AppColors.textDarkNavy,
                    fontSize: 12,
                    height: 1.4,
                  ),
                  children: const [
                    TextSpan(text: AppStrings.termsNoticePart1),
                    TextSpan(
                      text: AppStrings.hostelRulesTitle,
                      style: TextStyle(
                        color: AppColors.portalNavy,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: AppStrings.termsNoticePart2),
                    TextSpan(
                      text: AppStrings.privacyPolicyTitle,
                      style: TextStyle(
                        color: AppColors.portalNavy,
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
