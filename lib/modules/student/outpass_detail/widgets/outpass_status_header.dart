import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/outpass_detail_controller.dart';

class OutpassStatusHeader extends GetView<OutpassDetailController> {
  const OutpassStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Row: Pass ID & Status Badge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.badge_rounded,
                    size: 18,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(width: 8),
                Obx(
                  () => Text(
                    controller.passId.value,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDarkNavy,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              final status = controller.status.value;
              final isApproved = status.toLowerCase().contains('approved');
              final isRejected = status.toLowerCase().contains('rejected');

              Color bg = isApproved
                  ? const Color(0xFFD1FAE5)
                  : isRejected
                      ? const Color(0xFFFFE4E6)
                      : const Color(0xFFFEF3C7);
              Color textColor = isApproved
                  ? const Color(0xFF047857)
                  : isRejected
                      ? const Color(0xFFDC2626)
                      : const Color(0xFFB45309);
              Color dotColor = isApproved
                  ? const Color(0xFF10B981)
                  : isRejected
                      ? const Color(0xFFEF4444)
                      : const Color(0xFFF59E0B);

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),

        const SizedBox(height: 12),

        // Filter Tabs: Approved / Pending / Rejected
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _buildSegmentTab('Approved'),
              _buildSegmentTab('Pending'),
              _buildSegmentTab('Rejected'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentTab(String tabName) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedTab.value == tabName;
        return GestureDetector(
          onTap: () => controller.setTab(tabName),
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: isSelected
                  ? const [
                      BoxShadow(
                        color: Color(0x120F172A),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                tabName,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 12.5,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? AppColors.textDarkNavy
                      : AppColors.textSlate,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
