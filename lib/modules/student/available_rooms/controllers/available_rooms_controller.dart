import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Get.toNamed(AppRoutes.studentRoomDetail, arguments: room);
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
