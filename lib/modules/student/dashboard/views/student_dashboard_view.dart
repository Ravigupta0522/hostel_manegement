import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/student_dashboard_controller.dart';
import 'desktop_student_dashboard_view.dart';
import 'mobile_student_dashboard_view.dart';

class StudentDashboardView extends GetView<StudentDashboardController> {
  const StudentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered if opened directly (no binding)
    if (!Get.isRegistered<StudentDashboardController>()) {
      Get.put(StudentDashboardController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopStudentDashboardView();
    }
    return const MobileStudentDashboardView();
  }
}
