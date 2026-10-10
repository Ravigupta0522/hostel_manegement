import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RulesHeroBanner extends StatelessWidget {
  const RulesHeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image with Fallback Gradient
            Image.asset(
              'assets/images/residence_hall_banner.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.pdfDarkBar, AppColors.pdfDarkNavy],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.apartment_rounded,
                      size: 64, color: Colors.white24),
                ),
              ),
            ),

            // Gradient Overlay for Readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.25),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.82),
                  ],
                  stops: const [0.0, 0.35, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Content on Card
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top Row: Certified Badge & Action Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Certified Resident Hall Pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.pdfDarkNavy.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.success.withValues(alpha: 0.6),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle_rounded,
                                color: AppColors.success, size: 14),
                            const SizedBox(width: 6),
                            Text(
                              AppStrings.rulesCertifiedHallBadge,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Top Right Translucent Pill Button
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.info_outline_rounded,
                          color: AppColors.textWhite,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  // Bottom Info: Campus Tag + Headline + Location
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cyan/Blue Campus Zone Tag
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.portalSky.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.domain_rounded,
                                color: AppColors.textWhite, size: 12),
                            const SizedBox(width: 4),
                            Text(
                              AppStrings.rulesDefaultCampusZone,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Bold Hall Name
                      Text(
                        AppStrings.rulesDefaultHallName,
                        style: AppTextStyles.titleLarge.copyWith(
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.4,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Address with Pin
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 13,
                              color: AppColors.textWhite.withValues(alpha: 0.85)),
                          const SizedBox(width: 4),
                          Text(
                            AppStrings.rulesDefaultHallLocation,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textWhite.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
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
