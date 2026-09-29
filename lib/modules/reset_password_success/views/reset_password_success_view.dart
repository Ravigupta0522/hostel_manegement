import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/reset_password_success_controller.dart';
import 'desktop_reset_password_success_view.dart';
import 'mobile_reset_password_success_view.dart';

class ResetPasswordSuccessView
    extends GetView<ResetPasswordSuccessController> {
  const ResetPasswordSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopResetPasswordSuccessView();
    }
    return const MobileResetPasswordSuccessView();
  }
}
