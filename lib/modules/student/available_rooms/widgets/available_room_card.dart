import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/available_rooms_controller.dart';

class AvailableRoomCard extends GetView<AvailableRoomsController> {
  final Map<String, dynamic> room;

  const AvailableRoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAvailable = room['isAvailable'] == true;
    final List<Map<String, dynamic>> amenities =
        (room['amenities'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];

    return Obx(() {
      final bool isSelected =
          controller.selectedRoom.value?['id'] == room['id'];

      return Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF1D4ED8)
                : const Color(0xFFE2E8F0),
            width: isSelected ? 1.8 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xFF1D4ED8).withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.02),
              blurRadius: isSelected ? 12 : 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Top Header Row (Room Number, Status Badge, Type Pill)
            Row(
              children: [
                Text(
                  room['number'] as String,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: isAvailable
                        ? AppColors.textDarkNavy
                        : const Color(0xFF64748B),
                  ),
                ),
                const SizedBox(width: 8),
                // Status Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: isAvailable
                        ? const Color(0xFFD1FAE5)
                        : const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isAvailable) ...[
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF10B981),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        room['status'] as String,
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: isAvailable
                              ? const Color(0xFF047857)
                              : const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Category Pill
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    room['type'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4338CA),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),

            // ── 2. Location Subtitle
            Text(
              room['location'] as String,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 10),

            // ── 3. Bed Allotment Sub-Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFF1F5F9)),
              ),
              child: Row(
                children: [
                  Icon(
                    isAvailable
                        ? Icons.single_bed_outlined
                        : Icons.bed_outlined,
                    size: 18,
                    color: isAvailable
                        ? const Color(0xFF1D4ED8)
                        : const Color(0xFF94A3B8),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room['bedOpen'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: isAvailable
                                ? AppColors.textDarkNavy
                                : const Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          room['occupantInfo'] as String,
                          style: const TextStyle(
                            fontSize: 10.5,
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
                  // Occupancy Dots & Counter
                  _buildOccupancyDots(
                    occupied: room['occupiedBeds'] as int,
                    total: room['totalBeds'] as int,
                    isAvailable: isAvailable,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // ── 4. Amenities Pills
            if (amenities.isNotEmpty) ...[
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: amenities.map((am) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          am['icon'] as IconData,
                          size: 12,
                          color: const Color(0xFF4F46E5),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          am['title'] as String,
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF334155),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
            ],

            // ── 5. Action Buttons Row
            if (isAvailable) ...[
              Row(
                children: [
                  // View Details Button
                  Expanded(
                    child: SizedBox(
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () => controller.viewRoomDetails(room),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEEF2FF),
                          foregroundColor: AppColors.textDarkNavy,
                          minimumSize: const Size(0, 38),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDarkNavy,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Select Room Button
                  Expanded(
                    child: SizedBox(
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () => controller.selectRoom(room),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? const Color(0xFF047857)
                              : const Color(0xFF1D4ED8),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(0, 38),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isSelected) ...[
                              const Icon(Icons.check,
                                  size: 14, color: Colors.white),
                              const SizedBox(width: 4),
                            ],
                            Text(
                              isSelected ? 'Selected' : 'Select Room',
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              // Fully Occupied: Not Selectable Button
              SizedBox(
                width: double.infinity,
                height: 38,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Not Selectable',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    });
  }

  Widget _buildOccupancyDots({
    required int occupied,
    required int total,
    required bool isAvailable,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < total; i++) ...[
          Container(
            width: 7,
            height: 7,
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              color: i < occupied
                  ? (isAvailable
                      ? const Color(0xFF16A34A)
                      : const Color(0xFF94A3B8))
                  : const Color(0xFFCBD5E1),
              shape: BoxShape.circle,
            ),
          ),
        ],
        const SizedBox(width: 4),
        Text(
          '$occupied / $total',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF475569),
          ),
        ),
      ],
    );
  }
}
