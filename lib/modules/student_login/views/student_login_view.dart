import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/student_login_controller.dart';
import 'desktop_student_login_view.dart';
import 'mobile_student_login_view.dart';

class StudentLoginView extends GetView<StudentLoginController> {
  const StudentLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopStudentLoginView();
    }
    return const MobileStudentLoginView();
  }
}
