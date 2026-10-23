import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class RoomDetailAtmosphereSection extends StatelessWidget {
  const RoomDetailAtmosphereSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Located in the dedicated academic/silent corridor on Block B, 3rd floor. Suitable for students who prioritize quiet evening study hours and early schedules.',
          style: TextStyle(
            fontSize: 12.5,
            height: 1.6,
            color: AppColors.textSlate,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        // Balcony image strip
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 90,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0F4C75), Color(0xFF1B6CA8)],
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1492546543252-6a03bb6bbc8b?w=600&q=80',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox(),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 8,
                  left: 10,
                  child: Row(
                    children: [
                      Icon(Icons.live_tv_outlined,
                          color: Colors.white, size: 12),
                      SizedBox(width: 4),
                      Text(
                        'Live balcony view towards Central Arboretum',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
