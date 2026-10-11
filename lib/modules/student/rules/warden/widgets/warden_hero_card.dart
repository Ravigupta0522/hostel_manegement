import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../models/warden_contact_models.dart';

class WardenHeroCard extends StatelessWidget {
  final WardenProfile warden;

  const WardenHeroCard({
    super.key,
    required this.warden,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. Top Photo Banner with Badges & Name ──
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Photo with fallback
                  Image.asset(
                    warden.photoAsset,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) => Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.person_rounded,
                            size: 64, color: Colors.white24),
                      ),
                    ),
                  ),

                  // Overlay Gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          Colors.black.withValues(alpha: 0.35),
                          Colors.black.withValues(alpha: 0.88),
                        ],
                        stops: const [0.0, 0.45, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  // "In Office Today" badge on top right
                  if (warden.isInOffice)
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'In Office Today',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Overlay Info at Bottom of Photo
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shield Badge
                        Row(
                          children: [
                            const Icon(
                              Icons.verified_user_rounded,
                              size: 13,
                              color: Color(0xFF38BDF8),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              warden.designation,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: const Color(0xFF38BDF8),
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),

                        // Full Name
                        Text(
                          warden.name,
                          style: AppTextStyles.titleLarge.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 2),

                        // Subtitle
                        Text(
                          warden.subTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── 2. Info Details Rows ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              children: [
                // Department Row
                _buildInfoRow(
                  icon: Icons.apartment_rounded,
                  label: 'DEPARTMENT',
                  primaryText: warden.department,
                ),
                const SizedBox(height: 14),

                // Office Location Row
                _buildInfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'OFFICE LOCATION',
                  primaryText: warden.officeLocation,
                  secondaryText: warden.locationDetails,
                ),
                const SizedBox(height: 14),

                // Office Visiting Hours Row
                _buildInfoRow(
                  icon: Icons.access_time_rounded,
                  label: 'OFFICE VISITING HOURS',
                  primaryText: warden.visitingHours,
                  secondaryText: warden.visitingHoursEvening,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String primaryText,
    String? secondaryText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 19,
            color: AppColors.portalNavy,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: const Color(0xFF64748B),
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                primaryText,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                  color: AppColors.textDarkNavy,
                ),
              ),
              if (secondaryText != null) ...[
                const SizedBox(height: 1),
                Text(
                  secondaryText,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11.5,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
