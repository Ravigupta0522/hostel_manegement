import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/reset_password_controller.dart';
import 'desktop_reset_password_view.dart';
import 'mobile_reset_password_view.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopResetPasswordView();
    }
    return const MobileResetPasswordView();
  }
}
