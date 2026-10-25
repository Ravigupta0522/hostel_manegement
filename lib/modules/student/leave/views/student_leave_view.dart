import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/student_leave_controller.dart';
import 'desktop_student_leave_view.dart';
import 'mobile_student_leave_view.dart';

class StudentLeaveView extends GetView<StudentLeaveController> {
  const StudentLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<StudentLeaveController>()) {
      Get.put(StudentLeaveController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopStudentLeaveView();
    }
    return const MobileStudentLeaveView();
  }
}
