import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/leave_request_detail_controller.dart';
import 'desktop_leave_request_detail_view.dart';
import 'mobile_leave_request_detail_view.dart';

class LeaveRequestDetailView extends GetView<LeaveRequestDetailController> {
  const LeaveRequestDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<LeaveRequestDetailController>()) {
      Get.put(LeaveRequestDetailController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopLeaveRequestDetailView();
    }
    return const MobileLeaveRequestDetailView();
  }
}
