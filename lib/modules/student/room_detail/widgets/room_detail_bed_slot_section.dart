import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/room_detail_controller.dart';

class RoomDetailBedSlotSection extends GetView<RoomDetailController> {
  const RoomDetailBedSlotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final room = controller.room;
      final String bedOpen = room['bedOpen'] as String? ?? 'Bed B Open';
      final String occupantInfo =
          room['occupantInfo'] as String? ?? 'No current occupant';
      final String selectedBed = controller.selectedBedSlot.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tap on an open bed to add it to your transfer request',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textSlate,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),

          // Occupied bed (Bed A)
          RoomDetailBedSlotTile(
            bedLabel: 'Bed Slot A',
            status: 'Occupied',
            isOccupied: true,
            detail: occupantInfo,
            isSelected: selectedBed == 'Bed A',
            onTap: null, // occupied cannot be selected
          ),
          const SizedBox(height: 8),

          // Open bed (Bed B - Window Side) with AVAILABLE badge
          RoomDetailBedSlotTile(
            bedLabel: bedOpen,
            status: 'AVAILABLE',
            isOccupied: false,
            detail: 'Includes garden view & wooden study desk',
            isSelected: selectedBed == 'Bed B',
            onTap: () => controller.selectBedSlot('Bed B'),
          ),

          const SizedBox(height: 10),

          // Student info row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Row(
              children: [
                Icon(Icons.school_outlined,
                    size: 14, color: AppColors.textSlate),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'B.S. Computer Science • Year 3  •  Assigned Term: 24',
                    style: TextStyle(
                      fontSize: 10.5,
                      color: AppColors.textSlate,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class RoomDetailBedSlotTile extends StatelessWidget {
  final String bedLabel;
  final String status;
  final bool isOccupied;
  final String detail;
  final bool isSelected;
  final VoidCallback? onTap;

  const RoomDetailBedSlotTile({
    super.key,
    required this.bedLabel,
    required this.status,
    required this.isOccupied,
    required this.detail,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFEFF6FF)
              : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryBlue
                : const Color(0xFFE2E8F0),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Bed icon
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isOccupied
                    ? const Color(0xFFE2E8F0)
                    : const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.single_bed_rounded,
                size: 20,
                color: isOccupied
                    ? const Color(0xFF94A3B8)
                    : AppColors.primaryBlue,
              ),
            ),
            const SizedBox(width: 10),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          bedLabel,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: isOccupied
                                ? AppColors.textSlate
                                : AppColors.textDarkNavy,
                          ),
                        ),
                      ),
                      // Status badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: isOccupied
                              ? const Color(0xFFF1F5F9)
                              : const Color(0xFFD1FAE5),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            color: isOccupied
                                ? AppColors.textSlate
                                : const Color(0xFF047857),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    detail,
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: AppColors.textSlate,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.primaryBlue, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}
