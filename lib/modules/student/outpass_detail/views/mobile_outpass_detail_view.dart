import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/outpass_detail_controller.dart';
import '../widgets/biometric_gate_key_card.dart';
import '../widgets/hall_desk_help_card.dart';
import '../widgets/outpass_action_buttons.dart';
import '../widgets/outpass_credential_card.dart';
import '../widgets/outpass_status_header.dart';
import '../widgets/outpass_timeline_card.dart';
import '../widgets/outpass_top_bar.dart';
import '../widgets/warden_remarks_card.dart';

class MobileOutpassDetailView extends GetView<OutpassDetailController> {
  const MobileOutpassDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldLight,
      appBar: OutpassTopBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Pass ID Header & Status Filter Tabs
              OutpassStatusHeader(),
              SizedBox(height: 16),

              // 2. Student Leave Credential Glowing Blue Card
              OutpassCredentialCard(),
              SizedBox(height: 16),

              // 3. Biometric Gate Key & QR Scanner Card
              BiometricGateKeyCard(),
              SizedBox(height: 16),

              // 4. Approval Timeline (5 Steps)
              OutpassTimelineCard(),
              SizedBox(height: 16),

              // 5. Warden Remarks & Profile Card
              WardenRemarksCard(),
              SizedBox(height: 20),

              // 6. Action Buttons: Download PDF, Share Pass, Cancel Return
              OutpassActionButtons(),
              SizedBox(height: 16),

              // 7. Hall Desk 24/7 Support Banner
              HallDeskHelpCard(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
