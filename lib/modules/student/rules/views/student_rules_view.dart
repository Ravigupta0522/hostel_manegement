import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/student_rules_controller.dart';
import 'desktop_student_rules_view.dart';
import 'mobile_student_rules_view.dart';

class StudentRulesView extends GetView<StudentRulesController> {
  const StudentRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<StudentRulesController>()) {
      Get.put(StudentRulesController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopStudentRulesView();
    }
    return const MobileStudentRulesView();
  }
}
