import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leave_request_detail_controller.dart';
import '../widgets/attached_medical_records_card.dart';
import '../widgets/automatic_turnstile_card.dart';
import '../widgets/leave_request_action_buttons.dart';
import '../widgets/leave_request_status_card.dart';
import '../widgets/leave_request_top_bar.dart';
import '../widgets/leave_review_timeline_card.dart';
import '../widgets/official_warden_notes_card.dart';
import '../widgets/security_post_help_footer.dart';

class DesktopLeaveRequestDetailView
    extends GetView<LeaveRequestDetailController> {
  const DesktopLeaveRequestDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: const LeaveRequestTopBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1040),
          child: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          LeaveRequestStatusCard(),
                          SizedBox(height: 20),
                          AutomaticTurnstileCard(),
                          SizedBox(height: 20),
                          AttachedMedicalRecordsCard(),
                          SizedBox(height: 20),
                          LeaveRequestActionButtons(),
                          SizedBox(height: 16),
                          SecurityPostHelpFooter(),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    // Right Column
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          LeaveReviewTimelineCard(),
                          SizedBox(height: 20),
                          OfficialWardenNotesCard(),
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
