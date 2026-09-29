import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StudentRegisterHeaderCard extends StatelessWidget {
  const StudentRegisterHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.cardLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.borderSubtle,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // Background watermark building icon
            const Positioned(
              right: 14,
              top: 10,
              bottom: 10,
              child: Opacity(
                opacity: 0.12,
                child: Icon(
                  Icons.domain_rounded,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.createStudentAccount,
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w800,
                      fontSize: 23,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    AppStrings.createStudentAccountSub,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSlate,
                      fontSize: 12.5,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
