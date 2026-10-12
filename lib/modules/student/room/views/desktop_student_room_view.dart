import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_room_controller.dart';
import '../widgets/room_top_bar.dart';
import '../widgets/room_header_chips.dart';
import '../widgets/room_details_card.dart';
import '../widgets/room_photo_card.dart';
import '../widgets/roommates_card.dart';
import '../widgets/room_amenities_grid.dart';
import '../widgets/room_transfer_notice.dart';
import '../widgets/room_action_buttons.dart';

class DesktopStudentRoomView extends GetView<StudentRoomController> {
  const DesktopStudentRoomView({super.key});

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
                RoomTopBar(isDesktop: true),

                // Scrollable Content
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Tags / Chips
                      RoomHeaderChips(),
                      SizedBox(height: 14),

                      // 2. Room Main Hero Card
                      RoomDetailsCard(),
                      SizedBox(height: 14),

                      // 3. Room Interior Photo Card
                      RoomPhotoCard(),
                      SizedBox(height: 18),

                      // 4. Roommates Section
                      RoommatesCard(),
                      SizedBox(height: 18),

                      // 5. Room Amenities Section
                      RoomAmenitiesGrid(),
                      SizedBox(height: 16),

                      // 6. Transfer Notice Banner
                      RoomTransferNotice(),
                      SizedBox(height: 16),

                      // 7. Action Buttons
                      RoomActionButtons(),
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
