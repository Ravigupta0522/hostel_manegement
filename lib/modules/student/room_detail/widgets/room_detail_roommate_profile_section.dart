import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/room_detail_controller.dart';

class RoomDetailRoommateProfileSection extends GetView<RoomDetailController> {
  const RoomDetailRoommateProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final room = controller.room;

      return Column(
        children: [
          // Profile header
          Row(
            children: [
              // Avatar
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1D4ED8), Color(0xFF7C3AED)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'TH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tyler Harris',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '3rd Year • Block B • ${room['type'] ?? '2-Bed Double'}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSlate,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        RoommateSmallBadge(
                          text: "⭐ Dean's List",
                          color: Color(0xFFFEF3C7),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Match score
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF6EE7B7)),
                    ),
                    child: const Text(
                      '91% Match',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF047857),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFF1F5F9), height: 1),
          const SizedBox(height: 12),

          // Traits
          const Row(
            children: [
              Expanded(
                child: RoommateTraitItem(
                  icon: Icons.nightlight_round,
                  label: 'Sleep Schedule',
                  value: '11:55 PM – 7:00 AM',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: RoommateTraitItem(
                  icon: Icons.volume_off_outlined,
                  label: 'Noise Policy',
                  value: 'Headphones Aft...',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Expanded(
                child: RoommateTraitItem(
                  icon: Icons.restaurant_outlined,
                  label: 'Preferences',
                  value: 'Strict Non-smoker',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: RoommateTraitItem(
                  icon: Icons.fitness_center_outlined,
                  label: 'Habits',
                  value: 'Early riser & gym',
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

class RoommateTraitItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const RoommateTraitItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 12, color: AppColors.textSlate),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 9.5,
                  color: AppColors.textSlate,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.textDarkNavy,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class RoommateSmallBadge extends StatelessWidget {
  final String text;
  final Color color;

  const RoommateSmallBadge({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(0xFF92400E),
        ),
      ),
    );
  }
}
