import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/request_confirmation_controller.dart';
import '../widgets/confirmation_action_buttons.dart';
import '../widgets/confirmation_hero_badge.dart';
import '../widgets/confirmation_itinerary_card.dart';
import '../widgets/confirmation_simulation_banner.dart';
import '../widgets/confirmation_ticket_card.dart';

class MobileRequestConfirmationView
    extends GetView<RequestConfirmationController> {
  const MobileRequestConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF0F172A),
            ),
            onPressed: () => Get.back(),
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.apartment_rounded,
                  size: 16,
                  color: Color(0xFF1D4ED8),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Request Confirmation',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(16, 4, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Success Circle Badge and Title
              ConfirmationHeroBadge(),

              // 2. Reference Ticket ID Card
              ConfirmationTicketCard(),
              SizedBox(height: 16),

              // 3. Relocation Itinerary Card
              ConfirmationItineraryCard(),
              SizedBox(height: 16),

              // 4. Simulation Mode Disclaimer Banner
              ConfirmationSimulationBanner(),
              SizedBox(height: 24),

              // 5. Action Buttons (View Details & Back)
              ConfirmationActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
