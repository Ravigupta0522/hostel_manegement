import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class StudentRoomController extends GetxController {
  // Room basic information
  final RxString roomNumber = '204'.obs;
  final RxString floor = 'Floor 2'.obs;
  final RxString orientation = 'Balcony Facing • Elevator & Stair Access'.obs;
  final RxString hostelName = 'Sunrise Hostel'.obs;
  final RxString blockName = 'Block A'.obs;
  final RxString residentStatus = 'Active Resident'.obs;

  // Allotment & Category
  final RxString allotmentBed = 'Bed B2'.obs;
  final RxString allotmentDesk = 'Window side desk unit'.obs;
  final RxString suiteCategory = 'Triple Sharing'.obs;
  final RxString suiteDesc = '3-Bed Modern Suite'.obs;

  // Occupancy
  final RxInt occupiedBeds = 2.obs;
  final RxInt totalBeds = 3.obs;
  final RxString allotmentDate = '14 Aug 2024 (Fall Semester)'.obs;
  final RxBool isVerified = true.obs;

  // Roommates
  final RxList<Map<String, dynamic>> roommates = <Map<String, dynamic>>[
    {
      'id': 'STU001',
      'name': 'Rahul Sharma',
      'isSelf': true,
      'degree': 'B.Tech CSE • 3rd Year • STU001',
      'bed': 'Bed B2',
      'status': 'Assigned',
      'avatarType': 'initials',
      'initials': 'RS',
    },
    {
      'id': 'STU014',
      'name': 'Marcus Vance',
      'isSelf': false,
      'degree': 'B.S. CS • 2nd Year • STU014',
      'bed': 'Bed A1',
      'status': 'Active',
      'avatarType': 'image',
      'avatar': 'assets/images/marcus_vance_avatar.jpg',
    },
    {
      'id': 'VAC001',
      'name': 'Vacant Bunk',
      'isSelf': false,
      'isVacant': true,
      'degree': 'Cleaned & Ready for Allotment',
      'bed': 'Bed C3',
      'status': 'Available',
      'avatarType': 'vacant',
    },
  ].obs;

  // Amenities
  final List<Map<String, dynamic>> amenities = const [
    {
      'title': 'Orthopedic Bed',
      'subtitle': 'Premium 6" mattress',
      'icon': Icons.single_bed_rounded,
    },
    {
      'title': 'Study Station',
      'subtitle': 'Desk + ergonomic chair',
      'icon': Icons.desk_rounded,
    },
    {
      'title': 'Lockable Wardrobe',
      'subtitle': 'Personal dual-tier key',
      'icon': Icons.lock_outline_rounded,
    },
    {
      'title': 'Dual AC & Fan',
      'subtitle': 'Climate-controlled',
      'icon': Icons.mode_fan_off_rounded,
    },
    {
      'title': 'Gigabit Wi-Fi 6',
      'subtitle': 'Uncapped 1 Gbps',
      'icon': Icons.wifi_rounded,
    },
    {
      'title': 'Surge Outlets',
      'subtitle': 'Dedicated desk panel',
      'icon': Icons.power_rounded,
    },
    {
      'title': 'Attached Bath',
      'subtitle': '24/7 Geyser heater',
      'icon': Icons.shower_rounded,
    },
    {
      'title': 'LED Ambience',
      'subtitle': 'Warm & daylight study',
      'icon': Icons.wb_sunny_outlined,
    },
  ];

  // Actions
  void openRoommateChat(String name) {
    final textController = TextEditingController();
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFFEFF6FF),
                        child: Icon(Icons.person_outline_rounded,
                            color: Color(0xFF1D4ED8)),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Message $name',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.textDarkNavy,
                            ),
                          ),
                          const Text(
                            'Room 204 • Bed A1',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close_rounded, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: textController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Type your message to $name...',
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF2563EB)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.back();
                    Get.snackbar(
                      'Message Sent',
                      'Your message was delivered to $name',
                      backgroundColor: const Color(0xFFDCFCE7),
                      colorText: const Color(0xFF166534),
                      icon: const Icon(Icons.check_circle_rounded,
                          color: Color(0xFF16A34A)),
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  icon: const Icon(Icons.send_rounded, size: 18),
                  label: const Text('Send Message',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D4ED8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showAvailableRoomsModal() {
    Get.bottomSheet(
      Container(
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.75,
        ),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Hostel Rooms',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Sunrise Hostel • Fall Term Allocations',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView(
                children: [
                  _buildRoomCard(
                    roomNo: 'Room #205',
                    floor: 'Floor 2',
                    category: 'Double Sharing',
                    vacancy: '1 Vacant Bed',
                    features: 'Garden Facing • Quiet Zone',
                  ),
                  _buildRoomCard(
                    roomNo: 'Room #310',
                    floor: 'Floor 3',
                    category: 'Triple Sharing',
                    vacancy: '2 Vacant Beds',
                    features: 'Corner Suite • High Ventilation',
                  ),
                  _buildRoomCard(
                    roomNo: 'Room #108',
                    floor: 'Floor 1',
                    category: 'Single Studio',
                    vacancy: '1 Vacant Bed',
                    features: 'Attached Washroom • Near Library',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildRoomCard({
    required String roomNo,
    required String floor,
    required String category,
    required String vacancy,
    required String features,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    roomNo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F2FE),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      floor,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0284C7),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  vacancy,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF16A34A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '$category • $features',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  void showRequestRoomChangeDialog() {
    final reasonController = TextEditingController();
    String selectedPref = 'Double Sharing';

    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Request Room Change',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: AppColors.textDarkNavy,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Application will be reviewed by Hostel Warden',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Preferred Room Type',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        'Single Studio',
                        'Double Sharing',
                        'Triple Sharing'
                      ].map((type) {
                        final isSel = selectedPref == type;
                        return ChoiceChip(
                          label: Text(type),
                          selected: isSel,
                          onSelected: (val) {
                            if (val) setState(() => selectedPref = type);
                          },
                          selectedColor: const Color(0xFF1D4ED8),
                          labelStyle: TextStyle(
                            color: isSel ? Colors.white : AppColors.textDarkNavy,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          backgroundColor: const Color(0xFFF1F5F9),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Reason for Room Change',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: reasonController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText:
                            'e.g. Need quieter study environment, floor preference...',
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          Get.snackbar(
                            'Request Submitted',
                            'Your room change request has been forwarded to the Warden.',
                            backgroundColor: const Color(0xFFDCFCE7),
                            colorText: const Color(0xFF166534),
                            icon: const Icon(Icons.check_circle_rounded,
                                color: Color(0xFF16A34A)),
                            snackPosition: SnackPosition.TOP,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D4ED8),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Submit Change Request',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }
}
