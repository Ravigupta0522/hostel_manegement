import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/outpass_detail_controller.dart';
import '../widgets/biometric_gate_key_card.dart';
import '../widgets/hall_desk_help_card.dart';
import '../widgets/outpass_action_buttons.dart';
import '../widgets/outpass_credential_card.dart';
import '../widgets/outpass_status_header.dart';
import '../widgets/outpass_timeline_card.dart';
import '../widgets/outpass_top_bar.dart';
import '../widgets/warden_remarks_card.dart';

class DesktopOutpassDetailView extends GetView<OutpassDetailController> {
  const DesktopOutpassDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: const OutpassTopBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1040),
          child: const SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutpassStatusHeader(),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column: Credential, QR, Buttons, Desk
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          OutpassCredentialCard(),
                          SizedBox(height: 20),
                          BiometricGateKeyCard(),
                          SizedBox(height: 20),
                          OutpassActionButtons(),
                          SizedBox(height: 20),
                          HallDeskHelpCard(),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    // Right Column: Timeline & Warden Remarks
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          OutpassTimelineCard(),
                          SizedBox(height: 20),
                          WardenRemarksCard(),
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
