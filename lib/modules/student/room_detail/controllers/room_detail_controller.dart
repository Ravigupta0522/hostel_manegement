import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../available_rooms/controllers/available_rooms_controller.dart';
import '../../request_confirmation/bindings/request_confirmation_binding.dart';
import '../../request_confirmation/views/request_confirmation_view.dart';
import '../../room_change_request/bindings/room_change_request_binding.dart';
import '../../room_change_request/views/room_change_request_view.dart';

class RoomDetailController extends GetxController {
  final RxMap<String, dynamic> room = <String, dynamic>{}.obs;
  final RxString selectedBedSlot = 'Bed B'.obs;
  final RxBool isLocallySelected = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      room.assignAll(args);
    } else {
      // Fallback default room data
      room.assignAll({
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
      });
    }

    // Set initial bed slot
    final bedOpen = room['bedOpen'] as String?;
    if (bedOpen != null && bedOpen.contains('Bed B')) {
      selectedBedSlot.value = 'Bed B';
    } else if (bedOpen != null && bedOpen.contains('Bed A')) {
      selectedBedSlot.value = 'Bed A';
    } else if (bedOpen != null && bedOpen.contains('Bed C')) {
      selectedBedSlot.value = 'Bed C';
    }
  }

  bool get isSelected {
    if (Get.isRegistered<AvailableRoomsController>()) {
      final availableCtrl = Get.find<AvailableRoomsController>();
      return availableCtrl.selectedRoom.value?['id'] == room['id'];
    }
    return isLocallySelected.value;
  }

  void selectBedSlot(String slot) {
    selectedBedSlot.value = slot;
  }

  void toggleSelectRoom() {
    if (Get.isRegistered<AvailableRoomsController>()) {
      Get.find<AvailableRoomsController>()
          .selectRoom(Map<String, dynamic>.from(room));
    } else {
      isLocallySelected.toggle();
    }
    update();
  }

  void shareRoom() {
    Get.snackbar(
      'Share Room',
      'Room details link copied to clipboard!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF1E293B),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void proceedToAllocation() {
    toggleSelectRoom();
    final data = Map<String, dynamic>.from(room);
    data['bedOpen'] = selectedBedSlot.value;
    Get.to(
      () => const RoomChangeRequestView(),
      binding: RoomChangeRequestBinding(),
      arguments: data,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }

  void submitRoomRequest() {
    toggleSelectRoom();
    Get.to(
      () => const RequestConfirmationView(),
      binding: RequestConfirmationBinding(),
      arguments: {
        'ticketId': '#RCR-2024-0982',
        'currentRoom': 'Room #204 (Bed B2)',
        'currentLocation': 'Block A • Second Floor North',
        'requestedRoom':
            '${room['number'] ?? 'Room #305'} (${selectedBedSlot.value})',
        'requestedLocation':
            room['location'] ?? 'Block B • Third Floor Garden Wing',
        'statedReason': 'Medical / Quiet Study Environment',
      },
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }
}
