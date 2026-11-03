import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/approved_leave_controller.dart';
import '../widgets/approved_leave_action_buttons.dart';
import '../widgets/approved_leave_biometric_qr_card.dart';
import '../widgets/approved_leave_credential_card.dart';
import '../widgets/approved_leave_hall_desk_help_card.dart';
import '../widgets/approved_leave_status_header.dart';
import '../widgets/approved_leave_timeline_card.dart';
import '../widgets/approved_leave_top_bar.dart';
import '../widgets/approved_leave_warden_remarks_card.dart';

class DesktopApprovedLeaveView extends GetView<ApprovedLeaveController> {
  const DesktopApprovedLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: const ApprovedLeaveTopBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1040),
          child: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ApprovedLeaveStatusHeader(),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column: Credential, QR, Buttons, Desk
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          ApprovedLeaveCredentialCard(),
                          SizedBox(height: 20),
                          ApprovedLeaveBiometricQrCard(),
                          SizedBox(height: 20),
                          ApprovedLeaveActionButtons(),
                          SizedBox(height: 20),
                          ApprovedLeaveHallDeskHelpCard(),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    // Right Column: Timeline & Warden Remarks
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          ApprovedLeaveTimelineCard(),
                          SizedBox(height: 20),
                          ApprovedLeaveWardenRemarksCard(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

