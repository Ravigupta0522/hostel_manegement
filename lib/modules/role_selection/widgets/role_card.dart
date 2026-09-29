import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/role_selection_controller.dart';
import 'role_feature_chip.dart';

/// A single role selection card (Student or Admin).
///
/// Shows: icon | badge | title | amber subtitle | feature chips | CTA button.
class RoleCard extends StatelessWidget {
  final RoleCardData data;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.data,
    required this.onTap,
  });

  // Map feature label → icon
  static const Map<String, IconData> _featureIcons = {
    'Room Details': Icons.bed_rounded,
    'Fee Receipts': Icons.receipt_rounded,
    'Leave Requests': Icons.exit_to_app_rounded,
    'Wing Management': Icons.business_rounded,
    'Dues Tracking': Icons.account_balance_wallet_rounded,
    'Notice Broadcast': Icons.campaign_rounded,
  };

  IconData _iconForRole(UserRole role) => role == UserRole.student
      ? Icons.school_rounded
      : Icons.admin_panel_settings_rounded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Row: Icon + Badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: data.iconBgColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    _iconForRole(data.role),
                    size: 24,
                    color: data.iconColor,
                  ),
                ),
                const Spacer(),
                // Badge pill
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: data.badgeBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: data.badgeTextColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        data.badge,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: data.badgeTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // ── Title
            Text(
              data.title,
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 6),

            // ── Subtitle (Soft dark grey as in image)
            Text(
              data.subtitle,
              style: AppTextStyles.bodySmall.copyWith(
                color: const Color(0xFF5F6B7A),
                height: 1.45,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 14),

            // ── Feature chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: data.features
                  .map((f) => RoleFeatureChip(
                        label: f,
                        icon: _featureIcons[f] ?? Icons.check_circle_outline,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 18),

            // ── CTA Button (Using exact image button color #006591)
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: data.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: data.buttonColor.withValues(alpha: 0.28),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.buttonLabel,
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.textWhite,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_rounded,
                        color: AppColors.textWhite, size: 17),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
