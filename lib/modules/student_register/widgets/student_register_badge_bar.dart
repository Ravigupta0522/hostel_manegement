import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class StudentRegisterBadgeBar extends StatelessWidget {
  const StudentRegisterBadgeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Registration identity badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
            decoration: BoxDecoration(
              color: const Color(0xFFDFF0FD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.badge_outlined,
                  size: 14,
                  color: Color(0xFF006591),
                ),
                const SizedBox(width: 5),
                Text(
                  'RESIDENT REGISTRATION',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: const Color(0xFF006591),
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          // Term pill badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3FD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF10B981),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Term Fall 2025',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: const Color(0xFF475569),
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
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
