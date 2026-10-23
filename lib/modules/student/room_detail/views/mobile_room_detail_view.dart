import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/room_detail_controller.dart';
import '../widgets/room_detail_atmosphere_section.dart';
import '../widgets/room_detail_bed_slot_section.dart';
import '../widgets/room_detail_bottom_bar.dart';
import '../widgets/room_detail_config_section.dart';
import '../widgets/room_detail_facilities_section.dart';
import '../widgets/room_detail_hero_header.dart';
import '../widgets/room_detail_roommate_profile_section.dart';
import '../widgets/room_detail_section_card.dart';

class MobileRoomDetailView extends GetView<RoomDetailController> {
  const MobileRoomDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Color(0xFFF8FAFC),
        body: Stack(
          children: [
            // ── Scrollable content
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                // ── Hero Header
                RoomDetailHeroHeader(),

                // ── Body sections
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Configuration Section
                        RoomDetailSectionCard(
                          icon: Icons.meeting_room_outlined,
                          label: 'CONFIGURATION',
                          child: RoomDetailConfigSection(),
                        ),
                        SizedBox(height: 14),

                        // Desired Bed Slot
                        RoomDetailSectionCard(
                          icon: Icons.bed_outlined,
                          label: 'SELECT DESIRED BED SLOT',
                          child: RoomDetailBedSlotSection(),
                        ),
                        SizedBox(height: 14),

                        // Roommate Profile
                        RoomDetailSectionCard(
                          icon: Icons.person_outline_rounded,
                          label: 'ROOMMATE PROFILE',
                          child: RoomDetailRoommateProfileSection(),
                        ),
                        SizedBox(height: 14),

                        // Included Facilities
                        RoomDetailSectionCard(
                          icon: Icons.verified_outlined,
                          label: 'INCLUDED FACILITIES',
                          child: RoomDetailFacilitiesSection(),
                        ),
                        SizedBox(height: 14),

                        // Atmosphere & Quiet Hours
                        RoomDetailSectionCard(
                          icon: Icons.self_improvement_outlined,
                          label: 'ATMOSPHERE & QUIET HOURS',
                          child: RoomDetailAtmosphereSection(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // ── Bottom CTA Bar (pinned)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: RoomDetailBottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}
