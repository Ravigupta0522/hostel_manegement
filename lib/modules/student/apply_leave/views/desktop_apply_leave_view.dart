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

class DesktopApplyLeaveView extends GetView<ApplyLeaveController> {
  const DesktopApplyLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: Container(
          width: 540,
          margin: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: AppColors.scaffoldLight,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 24,
                offset: Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: const Column(
            children: [
              ApplyLeaveTopBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ApplyLeaveHeader(),
                      SizedBox(height: 20),
                      Step1LeaveInformationCard(),
                      SizedBox(height: 18),
                      Step2LeaveDetailsCard(),
                      SizedBox(height: 18),
                      Step3ParentVerificationCard(),
                      Step4SupportingDocumentCard(),
                      ApplyLeaveBottomActions(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
