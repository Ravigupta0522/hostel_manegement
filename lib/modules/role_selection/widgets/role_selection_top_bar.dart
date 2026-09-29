import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/role_selection_controller.dart';

/// Top bar: Back arrow | "Role Selection" title | Profile icon.
class RoleSelectionTopBar extends GetView<RoleSelectionController> {
  const RoleSelectionTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: controller.goBack,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 16,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Title
          Expanded(
            child: Text(
              'Role Selection',
              textAlign: TextAlign.center,
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Profile icon
          Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_rounded,
              size: 18,
              color: AppColors.textWhite,
            ),
          ),
        ],
      ),
    );
  }
}
