import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Desktop-only widget — Single animated check-list item in the right loading panel.
class DesktopStatusCheckItem extends StatelessWidget {
  final String label;
  final bool isDone;

  const DesktopStatusCheckItem({
    super.key,
    required this.label,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Animated circle indicator
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isDone ? AppColors.success : AppColors.backgroundSecondary,
            shape: BoxShape.circle,
            border: Border.all(
              color: isDone ? AppColors.success : AppColors.border,
              width: 1.5,
            ),
          ),
          child: isDone
              ? const Icon(Icons.check_rounded, size: 12, color: Colors.white)
              : null,
        ),

        const SizedBox(width: 12),

        // Label
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: isDone ? AppColors.textPrimary : AppColors.textLight,
            fontWeight: isDone ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
