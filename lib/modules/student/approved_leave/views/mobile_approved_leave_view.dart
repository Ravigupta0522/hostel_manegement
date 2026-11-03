import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/approved_leave_controller.dart';
import '../widgets/approved_leave_action_buttons.dart';
import '../widgets/approved_leave_biometric_qr_card.dart';
import '../widgets/approved_leave_credential_card.dart';
import '../widgets/approved_leave_hall_desk_help_card.dart';
import '../widgets/approved_leave_status_header.dart';
import '../widgets/approved_leave_timeline_card.dart';
import '../widgets/approved_leave_top_bar.dart';
import '../widgets/approved_leave_warden_remarks_card.dart';

class MobileApprovedLeaveView extends GetView<ApprovedLeaveController> {
  const MobileApprovedLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldLight,
      appBar: ApprovedLeaveTopBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Pass ID Header & Status Filter Tabs
              ApprovedLeaveStatusHeader(),
              SizedBox(height: 16),

              // 2. Student Leave Credential Glowing Blue Card
              ApprovedLeaveCredentialCard(),
              SizedBox(height: 16),

              // 3. Biometric Gate Key & QR Scanner Card
              ApprovedLeaveBiometricQrCard(),
              SizedBox(height: 16),

              // 4. Approval Timeline (5 Steps with tracked progress)
              ApprovedLeaveTimelineCard(),
              SizedBox(height: 16),

              // 5. Warden Remarks & Profile Card
              ApprovedLeaveWardenRemarksCard(),
              SizedBox(height: 20),

              // 6. Action Buttons: Download PDF, Share Pass, Cancel Return
              ApprovedLeaveActionButtons(),
              SizedBox(height: 16),

              // 7. Hall Desk 24/7 Support Banner
              ApprovedLeaveHallDeskHelpCard(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
