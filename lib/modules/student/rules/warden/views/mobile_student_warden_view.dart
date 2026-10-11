import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_warden_controller.dart';
import '../widgets/assistant_warden_card.dart';
import '../widgets/warden_emergency_banner.dart';
import '../widgets/warden_hero_card.dart';
import '../widgets/warden_message_desk_card.dart';
import '../widgets/warden_quick_actions.dart';
import '../widgets/warden_top_bar.dart';

class MobileStudentWardenView extends GetView<StudentWardenController> {
  const MobileStudentWardenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const WardenTopBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Card: Chief Warden Prof. Alan G. Thorne
            WardenHeroCard(warden: controller.chiefWarden),
            const SizedBox(height: 14),

            // 2. Quick Actions: Call Office, Send Email, Desk Chat
            WardenQuickActions(
              onCallOffice: controller.callOffice,
              onSendEmail: controller.sendEmail,
              onDeskChat: controller.deskChat,
            ),
            const SizedBox(height: 14),

            // 3. Assistant Warden Card: Dr. Robert Vance
            AssistantWardenCard(
              assistantWarden: controller.assistantWarden,
              onCall: controller.callAssistantWarden,
            ),
            const SizedBox(height: 14),

            // 4. Message Warden Desk Card
            const WardenMessageDeskCard(),
            const SizedBox(height: 14),

            // 5. 24/7 Campus Emergency Guard Banner
            WardenEmergencyBanner(onCallSos: controller.callEmergency),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
