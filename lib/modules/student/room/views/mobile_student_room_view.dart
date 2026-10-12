import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_room_controller.dart';
import '../widgets/room_top_bar.dart';
import '../widgets/room_header_chips.dart';
import '../widgets/room_details_card.dart';
import '../widgets/room_photo_card.dart';
import '../widgets/roommates_card.dart';
import '../widgets/room_amenities_grid.dart';
import '../widgets/room_transfer_notice.dart';
import '../widgets/room_action_buttons.dart';

class MobileStudentRoomView extends GetView<StudentRoomController> {
  const MobileStudentRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: RoomTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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

            // 7. Action Buttons (View Available Rooms & Request Room Change)
            RoomActionButtons(),
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
