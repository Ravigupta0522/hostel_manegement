import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/apply_leave_controller.dart';
import '../widgets/apply_leave_top_bar.dart';
import '../widgets/apply_leave_header.dart';
import '../widgets/step1_leave_information_card.dart';
import '../widgets/step2_leave_details_card.dart';
import '../widgets/step3_parent_verification_card.dart';
import '../widgets/step4_supporting_document_card.dart';
import '../widgets/apply_leave_bottom_actions.dart';

class MobileApplyLeaveView extends GetView<ApplyLeaveController> {
  const MobileApplyLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldLight,
      appBar: ApplyLeaveTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Apply Leave + Term 2026-27
            ApplyLeaveHeader(),
            SizedBox(height: 18),

            // Step 1: Leave Information
            Step1LeaveInformationCard(),
            SizedBox(height: 16),

            // Step 2: Leave Details
            Step2LeaveDetailsCard(),
            SizedBox(height: 16),

            // Step 3: Parent / Guardian Verification
            Step3ParentVerificationCard(),
            SizedBox(height: 16),

            // Step 4: Supporting Document (Only shown when Medical Leave is chosen)
            Step4SupportingDocumentCard(),

            // Before You Submit Box & Action Buttons
            ApplyLeaveBottomActions(),
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
