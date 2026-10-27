import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/leave_request_detail_controller.dart';
import '../widgets/attached_medical_records_card.dart';
import '../widgets/automatic_turnstile_card.dart';
import '../widgets/leave_request_action_buttons.dart';
import '../widgets/leave_request_status_card.dart';
import '../widgets/leave_request_top_bar.dart';
import '../widgets/leave_review_timeline_card.dart';
import '../widgets/official_warden_notes_card.dart';
import '../widgets/security_post_help_footer.dart';

class MobileLeaveRequestDetailView
    extends GetView<LeaveRequestDetailController> {
  const MobileLeaveRequestDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldLight,
      appBar: const LeaveRequestTopBar(),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Request ID, Category, Under Review Status & Travel Window
              LeaveRequestStatusCard(),
              SizedBox(height: 16),

              // 2. Approval Timeline (4 Stages)
              LeaveReviewTimelineCard(),
              SizedBox(height: 16),

              // 3. Official Warden Notes
              OfficialWardenNotesCard(),
              SizedBox(height: 16),

              // 4. Automatic Turnstile Integration Info Box
              AutomaticTurnstileCard(),
              SizedBox(height: 16),

              // 5. Attached Medical Records Box
              AttachedMedicalRecordsCard(),
              SizedBox(height: 20),

              // 6. Action Buttons: View Full App, Call Warden, Cancel
              LeaveRequestActionButtons(),
              SizedBox(height: 14),

              // 7. Security Clearance Footer
              SecurityPostHelpFooter(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
