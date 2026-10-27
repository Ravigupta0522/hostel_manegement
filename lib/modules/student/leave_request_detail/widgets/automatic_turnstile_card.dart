import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AutomaticTurnstileCard extends StatelessWidget {
  const AutomaticTurnstileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF0F2D6B),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.sensors_rounded,
                size: 19,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Automatic Turnstile Integration',
                  style: AppTextStyles.titleSmall.copyWith(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDarkNavy,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Once approved, your campus gate pass automatically authorizes exit via turnstile RFID card and facial scanner between 06:00 AM (24 Oct) and 21:00 PM (26 Oct).',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11,
                    color: AppColors.textSlate,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
