import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/student_register_controller.dart';
import 'desktop_student_register_view.dart';
import 'mobile_student_register_view.dart';

class StudentRegisterView extends GetView<StudentRegisterController> {
  const StudentRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopStudentRegisterView();
    }
    return const MobileStudentRegisterView();
  }
}
