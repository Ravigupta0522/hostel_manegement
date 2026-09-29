import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CampusPortalCard extends StatelessWidget {
  const CampusPortalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardLight,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Campus building thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/hostel_building_banner.png',
                width: 52,
                height: 52,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // Information Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.domain_rounded,
                        size: 15,
                        color: AppColors.portalNavy,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          AppStrings.campusPortalTitle,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.textDarkNavy,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    AppStrings.residencyAccessDetails,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSlate,
                      fontSize: 11.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    AppStrings.ssoActive,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.portalOcean,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
