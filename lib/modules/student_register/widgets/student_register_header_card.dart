import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class StudentRegisterHeaderCard extends StatelessWidget {
  const StudentRegisterHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFEFF6FF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFDBEAFE),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // Background watermark building icon
            const Positioned(
              right: 14,
              top: 10,
              bottom: 10,
              child: Opacity(
                opacity: 0.12,
                child: Icon(
                  Icons.domain_rounded,
                  size: 80,
                  color: Color(0xFF1E40AF),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Student Account',
                    style: AppTextStyles.titleLarge.copyWith(
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.w800,
                      fontSize: 23,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Register with your official campus enrollment details to access your dorm & hostel pass.',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF64748B),
                      fontSize: 12.5,
                      height: 1.45,
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
