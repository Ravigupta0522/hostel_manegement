import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/room_change_request_controller.dart';
import '../widgets/request_top_bar.dart';
import '../widgets/request_step_indicator.dart';
import '../widgets/request_transfer_summary_card.dart';
import '../widgets/request_primary_reason_selector.dart';
import '../widgets/request_detailed_explanation_field.dart';
import '../widgets/request_supporting_documents_card.dart';
import '../widgets/request_agreement_checkbox.dart';
import '../widgets/request_action_buttons.dart';

class MobileRoomChangeRequestView
    extends GetView<RoomChangeRequestController> {
  const MobileRoomChangeRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: RequestTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Step Indicator
            RequestStepIndicator(),
            SizedBox(height: 14),

            // 2. Transfer Summary Card
            RequestTransferSummaryCard(),
            SizedBox(height: 14),

            // 3. Primary Reason Selector
            RequestPrimaryReasonSelector(),
            SizedBox(height: 14),

            // 4. Detailed Explanation Field
            RequestDetailedExplanationField(),
            SizedBox(height: 14),

            // 5. Supporting Documents
            RequestSupportingDocumentsCard(),
            SizedBox(height: 14),

            // 6. Agreement Checkbox
            RequestAgreementCheckbox(),
            SizedBox(height: 16),

            // 7. Action Buttons (Submit & Cancel)
            RequestActionButtons(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
