import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_room_controller.dart';

class RoommatesCard extends GetView<StudentRoomController> {
  const RoommatesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section Header
        Row(
          children: [
            const Text(
              'Roommates',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textDarkNavy,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                '3 Beds',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF475569),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Fall Cohort',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2563EB),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Roommate 1: Rahul Sharma (You)
        _buildRoommateTile(
          avatarWidget: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFFDBEAFE),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'RS',
                    style: TextStyle(
                      color: Color(0xFF1D4ED8),
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -1,
                right: -1,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Color(0xFF16A34A),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 9,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          name: 'Rahul Sharma',
          badgeText: 'You',
          badgeColor: const Color(0xFFEEF2FF),
          badgeTextColor: const Color(0xFF4F46E5),
          subtitle: 'B.Tech CSE • 3rd Year • STU001',
          trailingWidget: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              _BedBadge(bedText: 'Bed B2'),
              SizedBox(height: 3),
              Text(
                'Assigned',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // ── Roommate 2: Marcus Vance
        _buildRoommateTile(
          avatarWidget: ClipOval(
            child: Image.asset(
              'assets/images/marcus_vance_avatar.jpg',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 44,
                  height: 44,
                  color: const Color(0xFFFEF3C7),
                  child: const Center(
                    child: Text(
                      'MV',
                      style: TextStyle(
                        color: Color(0xFFD97706),
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          name: 'Marcus Vance',
          subtitle: 'B.S. CS • 2nd Year • STU014',
          trailingWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _BedBadge(bedText: 'Bed A1'),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => controller.openRoommateChat('Marcus Vance'),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFDBEAFE)),
                  ),
                  child: const Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 16,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // ── Roommate 3: Vacant Bunk
        _buildRoommateTile(
          avatarWidget: Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFFEEF2FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_add_alt_outlined,
              size: 20,
              color: Color(0xFF6366F1),
            ),
          ),
          name: 'Vacant Bunk',
          badgeText: 'Available',
          badgeColor: const Color(0xFFE0F2FE),
          badgeTextColor: const Color(0xFF0284C7),
          subtitleWidget: const Row(
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                size: 13,
                color: Color(0xFF16A34A),
              ),
              SizedBox(width: 4),
              Text(
                'Cleaned & Ready for Allotment',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF16A34A),
                ),
              ),
            ],
          ),
          trailingWidget: const _BedBadge(bedText: 'Bed C3'),
        ),
      ],
    );
  }

  Widget _buildRoommateTile({
    required Widget avatarWidget,
    required String name,
    String? badgeText,
    Color? badgeColor,
    Color? badgeTextColor,
    String? subtitle,
    Widget? subtitleWidget,
    required Widget trailingWidget,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          avatarWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDarkNavy,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (badgeText != null) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: badgeColor ?? const Color(0xFFEEF2FF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          badgeText,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: badgeTextColor ?? const Color(0xFF4F46E5),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 3),
                if (subtitleWidget != null)
                  subtitleWidget
                else if (subtitle != null)
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          trailingWidget,
        ],
      ),
    );
  }
}

class _BedBadge extends StatelessWidget {
  final String bedText;
  const _BedBadge({required this.bedText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        bedText,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Color(0xFF334155),
        ),
      ),
    );
  }
}
