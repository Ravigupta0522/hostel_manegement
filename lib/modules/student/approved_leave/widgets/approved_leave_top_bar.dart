import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ApprovedLeaveTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;

  const ApprovedLeaveTopBar({super.key, this.onBackPressed});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundWhite,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.textDarkNavy,
          size: 22,
        ),
        onPressed: onBackPressed ?? () => Get.back(),
        tooltip: 'Back',
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.portalNavy.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.badge_outlined,
              size: 16,
              color: AppColors.portalNavy,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'HostelPass Digital',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.textDarkNavy,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEFF6FF),
                  border: Border.all(
                    color: AppColors.portalNavy.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.portalNavy,
                    size: 22,
                  ),
                ),
              ),
              Container(
                width: 11,
                height: 11,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: AppColors.borderLight,
          height: 1,
        ),
      ),
    );
  }
}

