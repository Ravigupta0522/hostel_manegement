import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/room_change_request_controller.dart';
import '../widgets/request_top_bar.dart';
import '../widgets/request_step_indicator.dart';
import '../widgets/request_transfer_summary_card.dart';
import '../widgets/request_primary_reason_selector.dart';
import '../widgets/request_detailed_explanation_field.dart';
import '../widgets/request_supporting_documents_card.dart';
import '../widgets/request_agreement_checkbox.dart';
import '../widgets/request_action_buttons.dart';

class DesktopRoomChangeRequestView
    extends GetView<RoomChangeRequestController> {
  const DesktopRoomChangeRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Container(
            width: 520,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Bar
                RequestTopBar(),

                // Scrollable Content
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 24),
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

                      // 7. Action Buttons
                      RequestActionButtons(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
