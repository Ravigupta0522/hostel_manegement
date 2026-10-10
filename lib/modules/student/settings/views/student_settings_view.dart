import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/student_settings_controller.dart';
import 'desktop_student_settings_view.dart';
import 'mobile_student_settings_view.dart';

class StudentSettingsView extends GetView<StudentSettingsController> {
  const StudentSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered if opened directly (no binding)
    if (!Get.isRegistered<StudentSettingsController>()) {
      Get.put(StudentSettingsController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopStudentSettingsView();
    }
    return const MobileStudentSettingsView();
  }
}
