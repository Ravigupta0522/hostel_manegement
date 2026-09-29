import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ResetPasswordFooter extends StatelessWidget {
  const ResetPasswordFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.lock_rounded,
              size: 13,
              color: AppColors.badgeGreenText,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                AppStrings.encryptedStudentCredentialChannel,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSlate,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
