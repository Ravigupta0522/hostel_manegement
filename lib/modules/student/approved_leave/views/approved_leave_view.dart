import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/approved_leave_controller.dart';
import 'desktop_approved_leave_view.dart';
import 'mobile_approved_leave_view.dart';

class ApprovedLeaveView extends GetView<ApprovedLeaveController> {
  const ApprovedLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ApprovedLeaveController>()) {
      Get.put(ApprovedLeaveController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopApprovedLeaveView();
    }
    return const MobileApprovedLeaveView();
  }
}

