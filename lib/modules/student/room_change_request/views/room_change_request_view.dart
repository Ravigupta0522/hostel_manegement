import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/room_change_request_controller.dart';
import 'desktop_room_change_request_view.dart';
import 'mobile_room_change_request_view.dart';

class RoomChangeRequestView extends GetView<RoomChangeRequestController> {
  const RoomChangeRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered if opened directly
    if (!Get.isRegistered<RoomChangeRequestController>()) {
      Get.put(RoomChangeRequestController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopRoomChangeRequestView();
    }
    return const MobileRoomChangeRequestView();
  }
}
