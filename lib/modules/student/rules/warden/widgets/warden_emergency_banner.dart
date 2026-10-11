import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';

class WardenEmergencyBanner extends StatelessWidget {
  final VoidCallback onCallSos;

  const WardenEmergencyBanner({
    super.key,
    required this.onCallSos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEE2E2).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFECDD3), width: 1.1),
      ),
      child: Row(
        children: [
          // Emergency Medical/Star Icon
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFB91C1C),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.emergency_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Titles
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '24/7 Campus Emergency Guard',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: const Color(0xFF991B1B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Immediate medical, fire, or safety support',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11,
                    color: const Color(0xFFB91C1C).withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Call SOS Button
          ElevatedButton(
            onPressed: onCallSos,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB91C1C),
              foregroundColor: Colors.white,
              minimumSize: const Size(78, 34),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Call SOS',
              style: AppTextStyles.labelSmall.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 11.5,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
