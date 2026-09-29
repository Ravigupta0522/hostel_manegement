import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Small chip showing a feature label inside a role card.
class RoleFeatureChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const RoleFeatureChip({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF5FF),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFD6E4F8).withValues(alpha: 0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: const Color(0xFF28557F)),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: const Color(0xFF28557F),
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
