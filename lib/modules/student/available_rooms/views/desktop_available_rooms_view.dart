import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/available_rooms_controller.dart';
import '../widgets/available_rooms_top_bar.dart';
import '../widgets/available_rooms_search_bar.dart';
import '../widgets/available_rooms_filter_chips.dart';
import '../widgets/available_rooms_count_banner.dart';
import '../widgets/available_room_card.dart';
import '../widgets/available_rooms_bottom_bar.dart';

class DesktopAvailableRoomsView extends GetView<AvailableRoomsController> {
  const DesktopAvailableRoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: Container(
          width: 520,
          margin: const EdgeInsets.symmetric(vertical: 20),
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
              // Top Bar
              const AvailableRoomsTopBar(),

              // Search & Filter Section
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
                child: const Column(
                  children: [
                    AvailableRoomsSearchBar(),
                    SizedBox(height: 10),
                    AvailableRoomsFilterChips(),
                  ],
                ),
              ),

              // Counter Banner
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
                child: AvailableRoomsCountBanner(),
              ),

              // Rooms List
              Expanded(
                child: Obx(() {
                  final rooms = controller.filteredRooms;
                  if (rooms.isEmpty) {
                    return const Center(
                      child: Text(
                        'No available rooms found',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      return AvailableRoomCard(room: rooms[index]);
                    },
                  );
                }),
              ),

              // Bottom Allocation Bar
              const AvailableRoomsBottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
