import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/request_confirmation_controller.dart';
import '../widgets/confirmation_action_buttons.dart';
import '../widgets/confirmation_hero_badge.dart';
import '../widgets/confirmation_itinerary_card.dart';
import '../widgets/confirmation_simulation_banner.dart';
import '../widgets/confirmation_ticket_card.dart';

class DesktopRequestConfirmationView
    extends GetView<RequestConfirmationController> {
  const DesktopRequestConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: Container(
          width: 520,
          margin: const EdgeInsets.symmetric(vertical: 24),
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
          child: Column(
            children: [
              // Header App Bar inside card
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF0F172A),
                      ),
                      onPressed: () => Get.back(),
                    ),
                    const SizedBox(width: 4),
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
              const Divider(height: 1, color: Color(0xFFE2E8F0)),

              // Scrollable body
              const Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ConfirmationHeroBadge(),
                      ConfirmationTicketCard(),
                      SizedBox(height: 16),
                      ConfirmationItineraryCard(),
                      SizedBox(height: 16),
                      ConfirmationSimulationBanner(),
                      SizedBox(height: 24),
                      ConfirmationActionButtons(),
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
