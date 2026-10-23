import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/room_detail_controller.dart';

class RoomDetailHeroHeader extends GetView<RoomDetailController> {
  const RoomDetailHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final room = controller.room;
      final bool isAvailable = room['isAvailable'] == true;

      return SliverAppBar(
        expandedHeight: 230,
        pinned: true,
        backgroundColor: AppColors.primaryBlue,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: controller.shareRoom,
              icon: const Icon(Icons.share_rounded, color: Colors.white, size: 18),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Stack(
            fit: StackFit.expand,
            children: [
              // Gradient background to simulate room image
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1A3A8F),
                      Color(0xFF1D4ED8),
                      Color(0xFF2563EB),
                    ],
                  ),
                ),
              ),
              // Room image placeholder with network fallback
              Positioned.fill(
                child: Opacity(
                  opacity: 0.15,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=600&q=80',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(),
                  ),
                ),
              ),
              // Dark gradient at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xCC0F172A),
                      ],
                    ),
                  ),
                ),
              ),
              // Content overlay
              Positioned(
                bottom: 12,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Block / Floor / Room badges
                    Row(
                      children: [
                        RoomDetailHeaderPill(text: room['block'] as String? ?? 'Block B'),
                        const SizedBox(width: 6),
                        RoomDetailHeaderPill(text: room['floor'] as String? ?? 'Floor 3'),
                        const SizedBox(width: 6),
                        RoomDetailHeaderPill(text: room['id'] as String? ?? 'RM305'),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Wing subtitle
                    const Text(
                      'QUIET STUDY WING',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Room number
                    Text(
                      room['number'] as String? ?? 'Room #305',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Status badge top right in expanded view
              Positioned(
                top: 56,
                right: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: isAvailable
                        ? const Color(0xFF10B981)
                        : const Color(0xFF64748B),
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
                        isAvailable ? '1 Bed Vacant' : 'Fully Occupied',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class RoomDetailHeaderPill extends StatelessWidget {
  final String text;
  const RoomDetailHeaderPill({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
