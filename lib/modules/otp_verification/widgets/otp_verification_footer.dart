import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OtpVerificationFooter extends StatelessWidget {
  const OtpVerificationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              size: 13,
              color: AppColors.textSlate,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                AppStrings.ssoSessionSecured,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSlate,
                  fontSize: 11,
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

