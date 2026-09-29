import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  segmentColor = const Color(0xFFE2E8F0);
                } else if (strength == 1) {
                  segmentColor = index == 0
                      ? const Color(0xFFEF4444)
                      : const Color(0xFFE2E8F0);
                } else if (strength == 2) {
                  segmentColor = index < 2
                      ? const Color(0xFF3B82F6)
                      : const Color(0xFFE2E8F0);
                } else {
                  segmentColor = const Color(0xFF10B981);
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
              color: Color(0xFF64748B),
            ),
            const SizedBox(width: 5),
            Text(
              'Minimum 8 characters with numbers & symbols',
              style: AppTextStyles.bodySmall.copyWith(
                color: const Color(0xFF64748B),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
