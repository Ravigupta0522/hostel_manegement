import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_warden_controller.dart';
import 'desktop_student_warden_view.dart';
import 'mobile_student_warden_view.dart';

class StudentWardenView extends GetView<StudentWardenController> {
  const StudentWardenView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<StudentWardenController>()) {
      Get.put(StudentWardenController());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return const DesktopStudentWardenView();
        }
        return const MobileStudentWardenView();
      },
    );
  }
}
