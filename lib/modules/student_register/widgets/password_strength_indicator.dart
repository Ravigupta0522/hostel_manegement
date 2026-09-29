import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_register_controller.dart';

class PasswordStrengthIndicator extends GetView<StudentRegisterController> {
  const PasswordStrengthIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        // 3 Segmented Bars
        Obx(
          () {
            final strength = controller.passwordStrength.value;
            return Row(
              children: List.generate(3, (index) {
                Color segmentColor;
                if (strength == 0) {
                  segmentColor = AppColors.borderLight;
                } else if (strength == 1) {
                  segmentColor = index == 0
                      ? AppColors.error
                      : AppColors.borderLight;
                } else if (strength == 2) {
                  segmentColor = index < 2
                      ? AppColors.info
                      : AppColors.borderLight;
                } else {
                  segmentColor = AppColors.badgeGreenDot;
                }

                return Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 4,
                      right: index == 2 ? 0 : 4,
                    ),
                    decoration: BoxDecoration(
                      color: segmentColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            );
          },
        ),
        const SizedBox(height: 6),

        // Hint label
        Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              size: 13,
              color: AppColors.textSlate,
            ),
            const SizedBox(width: 5),
            Text(
              AppStrings.min8CharsHint,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSlate,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
