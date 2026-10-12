import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/available_rooms_controller.dart';
import '../widgets/available_rooms_top_bar.dart';
import '../widgets/available_rooms_search_bar.dart';
import '../widgets/available_rooms_filter_chips.dart';
import '../widgets/available_rooms_count_banner.dart';
import '../widgets/available_room_card.dart';
import '../widgets/available_rooms_bottom_bar.dart';

class MobileAvailableRoomsView extends GetView<AvailableRoomsController> {
  const MobileAvailableRoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const AvailableRoomsTopBar(),
      bottomNavigationBar: const AvailableRoomsBottomBar(),
      body: Column(
        children: [
          // ── Search & Filter Controls
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

          // ── Transfer Counter Strip
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
            child: AvailableRoomsCountBanner(),
          ),

          // ── Room Cards List
          Expanded(
            child: Obx(() {
              final rooms = controller.filteredRooms;
              if (rooms.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 48,
                          color: Color(0xFF94A3B8),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'No available rooms found',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF475569),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Try clearing search or changing block filter',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  return AvailableRoomCard(room: rooms[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
