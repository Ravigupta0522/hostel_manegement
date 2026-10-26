import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/all_leave_requests_controller.dart';
import 'desktop_all_leave_requests_view.dart';
import 'mobile_all_leave_requests_view.dart';

class AllLeaveRequestsView extends GetView<AllLeaveRequestsController> {
  const AllLeaveRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<AllLeaveRequestsController>()) {
      Get.put(AllLeaveRequestsController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopAllLeaveRequestsView();
    }
    return const MobileAllLeaveRequestsView();
  }
}
