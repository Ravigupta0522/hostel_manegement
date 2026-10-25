import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/apply_leave_controller.dart';
import 'desktop_apply_leave_view.dart';
import 'mobile_apply_leave_view.dart';

class ApplyLeaveView extends GetView<ApplyLeaveController> {
  const ApplyLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ApplyLeaveController>()) {
      Get.put(ApplyLeaveController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopApplyLeaveView();
    }
    return const MobileApplyLeaveView();
  }
}
