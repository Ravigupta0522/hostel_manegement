import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class ForgotPasswordHeroCard extends StatelessWidget {
  const ForgotPasswordHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEBF5FF),
              Color(0xFFF3F7FE),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFDBEAFE),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        child: Column(
          children: [
            // Center lock + reset circular illustration with shield badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Main circle
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDF0FC),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00288E).withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: 38,
                      color: Color(0xFF00288E),
                    ),
                  ),
                ),

                // Mini Shield badge at bottom right
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFF006591),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.shield_rounded,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              'Forgot Password?',
              style: AppTextStyles.titleLarge.copyWith(
                color: const Color(0xFF0F172A),
                fontWeight: FontWeight.w800,
                fontSize: 24,
                letterSpacing: -0.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Subtitle
            Text(
              "No worries! Enter your registered campus email or Student ID, and we'll send a 6-digit verification code to reset your password.",
              style: AppTextStyles.bodySmall.copyWith(
                color: const Color(0xFF64748B),
                fontSize: 12.5,
                height: 1.45,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),

            // Pill: Codes expire after 10 minutes
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EEFA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 14,
                    color: Color(0xFF475569),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Codes expire after 10 minutes',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF475569),
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
