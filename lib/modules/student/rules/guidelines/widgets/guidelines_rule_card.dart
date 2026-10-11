import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../models/guideline_rule_item.dart';

class GuidelinesRuleCard extends StatelessWidget {
  final GuidelineRuleItem rule;

  const GuidelinesRuleCard({
    super.key,
    required this.rule,
  });

  @override
  Widget build(BuildContext context) {
    Color tagBg;
    Color tagText;
    Color tagBorder;

    switch (rule.tagType) {
      case GuidelineTagType.strict:
        tagBg = const Color(0xFFFFEEEE);
        tagText = const Color(0xFFE11D48);
        tagBorder = const Color(0xFFFFCCD3);
        break;
      case GuidelineTagType.notice:
        tagBg = const Color(0xFFE0F2FE);
        tagText = const Color(0xFF0284C7);
        tagBorder = const Color(0xFFBAE6FD);
        break;
      case GuidelineTagType.standard:
        tagBg = const Color(0xFFEFF6FF);
        tagText = const Color(0xFF1D4ED8);
        tagBorder = const Color(0xFFBFDBFE);
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Icon + Title + Status Tag
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.softBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  rule.icon,
                  color: AppColors.primaryBlue,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  rule.title,
                  style: AppTextStyles.labelLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDarkNavy,
                    fontSize: 13.5,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: tagBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: tagBorder),
                ),
                child: Text(
                  rule.tagLabel,
                  style: TextStyle(
                    color: tagText,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Description
          Text(
            rule.description,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11.5,
              height: 1.4,
            ),
          ),

          // Optional Footer
          if (rule.footerText != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                if (rule.footerIcon != null) ...[
                  Icon(
                    rule.footerIcon,
                    size: 12,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  rule.footerText!,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
