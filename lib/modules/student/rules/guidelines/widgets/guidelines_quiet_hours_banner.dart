import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class GuidelinesQuietHoursBanner extends StatelessWidget {
  const GuidelinesQuietHoursBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F2B82),
            Color(0xFF133B9E),
            Color(0xFF1E4AB8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F2B82).withValues(alpha: 0.28),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Subtle background building / window grid illustration
          const Positioned(
            right: -10,
            bottom: -15,
            child: Opacity(
              opacity: 0.12,
              child: Icon(
                Icons.apartment_rounded,
                size: 110,
                color: Colors.white,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Zero Disruption Zone Badge
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.security_rounded,
                    color: Color(0xFF34D399),
                    size: 15,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'ZERO DISRUPTION ZONE',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF34D399),
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Title
              Text(
                'Quiet Hours commence at 11:00 PM',
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 4),

              // Subtitle
              Text(
                'Please keep hallway conversations low and turnstile passes updated.',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 11.5,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
