import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/room_detail_controller.dart';
import 'desktop_room_detail_view.dart';
import 'mobile_room_detail_view.dart';

class RoomDetailView extends GetView<RoomDetailController> {
  const RoomDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered if opened directly without route binding
    if (!Get.isRegistered<RoomDetailController>()) {
      Get.put(RoomDetailController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopRoomDetailView();
    }
    return const MobileRoomDetailView();
  }
}
