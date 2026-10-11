import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../controllers/community_guidelines_controller.dart';

class GuidelinesFilterBar extends GetView<CommunityGuidelinesController> {
  const GuidelinesFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.filterCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = controller.filterCategories[index];
          final catId = cat['id']!;
          final catLabel = cat['label']!;

          return Obx(() {
            final isSelected = controller.selectedCategory.value == catId;

            return InkWell(
              onTap: () => controller.selectCategory(catId),
              borderRadius: BorderRadius.circular(20),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.portalNavy
                      : const Color(0xFFF1F5FD),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.portalNavy
                        : const Color(0xFFE2E8F0),
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.portalNavy
                                .withValues(alpha: 0.22),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    catLabel,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: isSelected
                          ? AppColors.textWhite
                          : AppColors.textSecondary,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
