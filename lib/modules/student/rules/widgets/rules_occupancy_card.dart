import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_rules_controller.dart';

class RulesOccupancyCard extends GetView<StudentRulesController> {
  const RulesOccupancyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Status Indicator & Term Pill
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.circle, color: AppColors.liveGreen, size: 10),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.rulesLiveOccupancy,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.softBlue,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.softBlueBorderAlt),
                ),
                child: Text(
                  'Term 2024 - 2025',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Occupancy Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Obx(
              () => LinearProgressIndicator(
                value: controller.occupancyPercent.value,
                minHeight: 10,
                backgroundColor: AppColors.borderLight,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 3 Metric Stat Columns
          Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  count: '${controller.totalBeds.value}',
                  label: AppStrings.rulesTotalBeds,
                  color: AppColors.textDarkNavy,
                ),
              ),
              Container(width: 1, height: 36, color: AppColors.borderLight),
              Expanded(
                child: _buildMetricTile(
                  count: '${controller.bookedBeds.value}',
                  label: '96% ${AppStrings.rulesBookedBeds}',
                  color: AppColors.primaryBlue,
                ),
              ),
              Container(width: 1, height: 36, color: AppColors.borderLight),
              Expanded(
                child: _buildMetricTile(
                  count: '${controller.vacancies.value}',
                  label: AppStrings.rulesVacancies,
                  color: AppColors.portalSky,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile({
    required String count,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          count,
          style: AppTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w800,
            color: color,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
