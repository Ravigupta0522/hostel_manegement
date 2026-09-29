import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/forgot_password_controller.dart';
import 'desktop_forgot_password_view.dart';
import 'mobile_forgot_password_view.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopForgotPasswordView();
    }
    return const MobileForgotPasswordView();
  }
}
