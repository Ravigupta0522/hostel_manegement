import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class ForgotPasswordStepBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ForgotPasswordStepBar({
    super.key,
    this.currentStep = 1,
    this.totalSteps = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Step progress indicators
          Row(
            children: List.generate(totalSteps, (index) {
              final isCurrent = index + 1 == currentStep;
              return Container(
                margin: const EdgeInsets.only(right: 5),
                width: isCurrent ? 24 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: isCurrent
                      ? const Color(0xFF00288E)
                      : const Color(0xFFD0E2FB),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),

          // Step count text
          Text(
            'STEP $currentStep OF $totalSteps',
            style: AppTextStyles.labelSmall.copyWith(
              color: const Color(0xFF1E3A8A),
              fontWeight: FontWeight.w800,
              fontSize: 11,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
