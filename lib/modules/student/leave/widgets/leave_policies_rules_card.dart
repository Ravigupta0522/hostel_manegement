import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class LeavePoliciesRulesCard extends StatelessWidget {
  const LeavePoliciesRulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.softBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info_outline_rounded,
                  size: 18,
                  color: AppColors.linkBlue,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                AppStrings.leavePoliciesTitle,
                style: AppTextStyles.titleSmall.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Rule 1: 24 hours advance
          _buildPolicyRow(
            icon: Icons.access_time_rounded,
            iconColor: AppColors.textSlate,
            spans: const [
              TextSpan(text: 'Requests must be submitted at least '),
              TextSpan(
                text: '24 hours in advance',
                style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.pdfDarkBar),
              ),
              TextSpan(text: ' of departure time.'),
            ],
          ),
          const SizedBox(height: 12),

          // Rule 2: Guardian SMS OTP
          _buildPolicyRow(
            icon: Icons.chat_bubble_outline_rounded,
            iconColor: AppColors.textSlate,
            spans: const [
              TextSpan(text: 'Home visits automatically trigger a '),
              TextSpan(
                text: 'Guardian SMS OTP',
                style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.pdfDarkBar),
              ),
              TextSpan(text: ' required before Warden approval.'),
            ],
          ),
          const SizedBox(height: 12),

          // Rule 3: Medical doctor certificate
          _buildPolicyRow(
            icon: Icons.description_outlined,
            iconColor: AppColors.textSlate,
            spans: const [
              TextSpan(text: 'Medical leaves exceeding 2 days require a signed '),
              TextSpan(
                text: "doctor's certificate",
                style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.pdfDarkBar),
              ),
              TextSpan(text: ' attached at submission.'),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 12),

          // Footer info row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.leaveCurfewHours,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSlate,
                ),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening Hostel Handbook (PDF)...'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.leaveHostelHandbook,
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.linkBlue,
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Icon(
                      Icons.arrow_outward_rounded,
                      size: 14,
                      color: AppColors.linkBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyRow({
    required IconData icon,
    required Color iconColor,
    required List<TextSpan> spans,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12.5,
                color: AppColors.textSecondary,
                height: 1.35,
              ),
              children: spans,
            ),
          ),
        ),
      ],
    );
  }
}
