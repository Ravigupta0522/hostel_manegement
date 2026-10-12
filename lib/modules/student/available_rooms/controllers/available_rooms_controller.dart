import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../routes/app_routes.dart';

class AvailableRoomsController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final RxString selectedFilter = 'All Blocks'.obs;

  final List<String> filterChips = [
    'All Blocks',
    'Block A',
    'Block B',
    'Block C',
    'Floor 1',
    'Floor 2',
    'Floor 3',
    'Floor 4',
  ];

  final Rxn<Map<String, dynamic>> selectedRoom = Rxn<Map<String, dynamic>>();

  final List<Map<String, dynamic>> allRooms = [
    {
      'id': 'RM305',
      'number': 'Room #305',
      'status': 'Available',
      'type': '2-Bed Double',
      'location': 'Block B • 3rd Floor • Quiet Study Wing',
      'block': 'Block B',
      'floor': 'Floor 3',
      'bedOpen': 'Bed B Open (Window Side)',
      'occupantInfo': 'Occupant in Bed A: CS Major (Yr 2)',
      'occupiedBeds': 1,
      'totalBeds': 2,
      'isAvailable': true,
      'amenities': [
        {'title': 'Attached Bath', 'icon': Icons.bathtub_outlined},
        {'title': 'AC', 'icon': Icons.ac_unit_rounded},
        {'title': 'Wi-Fi', 'icon': Icons.wifi_rounded},
        {'title': 'Balcony', 'icon': Icons.balcony_rounded},
      ],
    },
    {
      'id': 'RM412',
      'number': 'Room #412',
      'status': 'Available',
      'type': '2-Bed Deluxe',
      'location': 'Block A • 4th Floor • Silent Wing',
      'block': 'Block A',
      'floor': 'Floor 4',
      'bedOpen': 'Bed A Open',
      'occupantInfo': 'Occupant in Bed B: BioTech (Yr 3)',
      'occupiedBeds': 1,
      'totalBeds': 2,
      'isAvailable': true,
      'amenities': [
        {'title': 'Attached Bath', 'icon': Icons.bathtub_outlined},
        {'title': 'Dual AC', 'icon': Icons.ac_unit_rounded},
        {'title': 'Ergonomic Desks', 'icon': Icons.desk_rounded},
      ],
    },
    {
      'id': 'RM108',
      'number': 'Room #108',
      'status': 'Available',
      'type': '3-Bed Suite',
      'location': 'Block A • 1st Floor • North Facing',
      'block': 'Block A',
      'floor': 'Floor 1',
      'bedOpen': 'Bed C Open (Study Corner)',
      'occupantInfo': 'Occupants: Math & Physics (Yr 1)',
      'occupiedBeds': 2,
      'totalBeds': 3,
      'isAvailable': true,
      'amenities': [
        {'title': 'Shared Balcony', 'icon': Icons.balcony_rounded},
        {'title': 'Attached Bath', 'icon': Icons.bathtub_outlined},
        {'title': 'Wi-Fi 6', 'icon': Icons.wifi_rounded},
      ],
    },
    {
      'id': 'RM202',
      'number': 'Room #202',
      'status': 'Fully Occupied',
      'type': '2-Bed Double',
      'location': 'Block C • 2nd Floor',
      'block': 'Block C',
      'floor': 'Floor 2',
      'bedOpen': 'No Vacancies',
      'occupantInfo': 'Both beds currently locked',
      'occupiedBeds': 2,
      'totalBeds': 2,
      'isAvailable': false,
      'amenities': <Map<String, dynamic>>[],
    },
  ];

  List<Map<String, dynamic>> get filteredRooms {
    return allRooms.where((room) {
      final query = searchQuery.value.toLowerCase().trim();
      final number = (room['number'] as String).toLowerCase();
      final location = (room['location'] as String).toLowerCase();
      final matchesSearch =
          query.isEmpty || number.contains(query) || location.contains(query);

      final filter = selectedFilter.value;
      final matchesFilter = filter == 'All Blocks' ||
          room['block'] == filter ||
          room['floor'] == filter;

      return matchesSearch && matchesFilter;
    }).toList();
  }

  void selectRoom(Map<String, dynamic> room) {
    if (room['isAvailable'] != true) return;
    if (selectedRoom.value?['id'] == room['id']) {
      selectedRoom.value = null; // deselect
    } else {
      selectedRoom.value = room;
    }
  }

  void viewRoomDetails(Map<String, dynamic> room) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        room['number'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: room['isAvailable'] == true
                              ? const Color(0xFFD1FAE5)
                              : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          room['status'] as String,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: room['isAvailable'] == true
                                ? const Color(0xFF047857)
                                : const Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${room['type']} • ${room['location']}',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room['bedOpen'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      room['occupantInfo'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              if (room['isAvailable'] == true) ...[
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      selectRoom(room);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D4ED8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      selectedRoom.value?['id'] == room['id']
                          ? 'Deselect Room'
                          : 'Select this Room',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void proceedAllocation() {
    if (selectedRoom.value == null) return;
    final room = selectedRoom.value!;
    Get.toNamed(AppRoutes.studentRoomChangeRequest, arguments: room);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
