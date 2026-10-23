import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/request_confirmation_controller.dart';
import 'desktop_request_confirmation_view.dart';
import 'mobile_request_confirmation_view.dart';

class RequestConfirmationView extends GetView<RequestConfirmationController> {
  const RequestConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<RequestConfirmationController>()) {
      Get.put(RequestConfirmationController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopRequestConfirmationView();
    }
    return const MobileRequestConfirmationView();
  }
}
