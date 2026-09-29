import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/otp_verification_controller.dart';
import 'desktop_otp_verification_view.dart';
import 'mobile_otp_verification_view.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopOtpVerificationView();
    }
    return const MobileOtpVerificationView();
  }
}
