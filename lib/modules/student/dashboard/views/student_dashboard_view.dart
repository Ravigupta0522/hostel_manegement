import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Placeholder — will be fully implemented in student module phase
class StudentDashboardView extends StatelessWidget {
  const StudentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hostel',
                style: AppTextStyles.titleSmall.copyWith(color: AppColors.textPrimary),
              ),
              TextSpan(
                text: 'Flow',
                style: AppTextStyles.titleSmall.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('Student Dashboard — Coming Soon'),
      ),
    );
  }
}
