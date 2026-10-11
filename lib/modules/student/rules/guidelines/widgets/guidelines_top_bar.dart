import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../controllers/community_guidelines_controller.dart';

class GuidelinesTopBar extends GetView<CommunityGuidelinesController>
    implements PreferredSizeWidget {
  const GuidelinesTopBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundWhite,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            children: [
              // Back Button
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 22,
                  color: AppColors.textDarkNavy,
                ),
                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              ),
              const SizedBox(width: 4),

              // Brand Icon
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.portalNavy, AppColors.linkBlue],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.apartment_rounded,
                  color: AppColors.textWhite,
                  size: 18,
                ),
              ),
              const SizedBox(width: 8),

              // Brand Name
              Text(
                AppStrings.appName,
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDarkNavy,
                  fontSize: 17,
                  letterSpacing: -0.3,
                ),
              ),

              const Spacer(),

              // Quick PDF Download Top Action Button
              InkWell(
                onTap: controller.downloadGuidelinesPdf,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.softBlue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.softBlueBorder),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.picture_as_pdf_rounded,
                        color: AppColors.primaryBlue,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'PDF',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Resident Room Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.fieldBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Text(
                  'Ro. 204',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // User Avatar
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), AppColors.info],
                  ),
                  border: Border.all(
                    color: AppColors.backgroundWhite,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'RS',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
