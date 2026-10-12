import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/available_rooms_controller.dart';
import 'desktop_available_rooms_view.dart';
import 'mobile_available_rooms_view.dart';

class AvailableRoomsView extends GetView<AvailableRoomsController> {
  const AvailableRoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered if opened directly
    if (!Get.isRegistered<AvailableRoomsController>()) {
      Get.put(AvailableRoomsController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopAvailableRoomsView();
    }
    return const MobileAvailableRoomsView();
  }
}
