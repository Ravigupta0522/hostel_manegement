import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/student_room_controller.dart';
import 'desktop_student_room_view.dart';
import 'mobile_student_room_view.dart';

class StudentRoomView extends GetView<StudentRoomController> {
  const StudentRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered if opened directly
    if (!Get.isRegistered<StudentRoomController>()) {
      Get.put(StudentRoomController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopStudentRoomView();
    }
    return const MobileStudentRoomView();
  }
}
