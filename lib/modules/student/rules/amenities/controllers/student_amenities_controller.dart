import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../models/amenity_item.dart';

class StudentAmenitiesController extends GetxController {
  final Rx<AmenityCategory> selectedCategory = AmenityCategory.all.obs;
  final RxSet<String> expandedGuidelines = <String>{}.obs;

  // Filter tab list
  final List<Map<String, dynamic>> categories = [
    {'category': AmenityCategory.all, 'label': 'All (6)'},
    {'category': AmenityCategory.essentials, 'label': 'Essentials'},
    {'category': AmenityCategory.lifestyle, 'label': 'Lifestyle'},
  ];

  // Full dataset matching screenshot
  final List<AmenityItem> allAmenities = const [
    // 1. Campus Fiber Wi-Fi
    AmenityItem(
      id: 'wifi',
      title: 'Campus Fiber Wi-Fi',
      locationOrSub: 'HostelNet-5G & HostelNet-Secure',
      statusBadge: 'Active • 1 Gbps',
      statusType: AmenityTagStatus.active,
      icon: Icons.wifi_rounded,
      category: AmenityCategory.essentials,
      bannerImageUrl: 'assets/images/wifi_amenity.png',
      bannerBadgeText: '150 Mbps / Room',
      description:
          'Dedicated 150 Mbps bandwidth per room, 24/7 connectivity, automated reconnect via student ID single sign-on.',
      guidelines: [
        'Personal wireless routers are strictly prohibited to prevent channel interference.',
        'Peer-to-peer torrenting and unverified VPN tunnels are bandwidth throttled.',
        'Report sudden latency drops or dead spots directly via IT Helpdesk.',
      ],
    ),

    // 2. Central Dining & Mess
    AmenityItem(
      id: 'mess',
      title: 'Central Dining & Mess',
      locationOrSub: 'Ground Floor, North Atrium',
      statusBadge: 'Open Now',
      statusType: AmenityTagStatus.openNow,
      icon: Icons.restaurant_rounded,
      category: AmenityCategory.essentials,
      bannerImageUrl: 'assets/images/mess_amenity.png',
      bannerBadgeText: '• Live Seat Audit',
      scheduleBadges: [
        'Breakfast: 07:30 - 09:30',
        'Lunch: 12:00 - 14:00',
        'Dinner: 19:30 - 21:30',
      ],
      description:
          "Today's Chef Specials: Nutritious balanced diet with vegetarian & halal live counters, organic salad bar, and seasonal dessert.",
      guidelines: [
        'Self-service dining trays must be deposited at conveyor belts.',
        'Mess utensils and crockery may not be taken to resident rooms.',
        'Meal cancelation for weekend rebates must be logged 24 hours prior.',
      ],
    ),

    // 3. Self-Service Laundry
    AmenityItem(
      id: 'laundry',
      title: 'Self-Service Laundry',
      locationOrSub: 'Basement Level 1 • 06:00 - 23:00',
      statusBadge: '4 of 8 Free',
      statusType: AmenityTagStatus.info,
      icon: Icons.local_laundry_service_rounded,
      category: AmenityCategory.essentials,
      laundrySlots: [
        LaundryMachineSlot(label: 'W-1', isAvailable: true),
        LaundryMachineSlot(label: 'W-2', isAvailable: true),
        LaundryMachineSlot(
            label: 'W-3', isAvailable: false, remainingTime: '14m'),
        LaundryMachineSlot(label: 'W-4', isAvailable: true),
        LaundryMachineSlot(label: 'W-5', isAvailable: true),
        LaundryMachineSlot(
            label: 'W-6', isAvailable: false, remainingTime: '28m'),
      ],
      description:
          'Commercial smart washer/dryers with digital cycle alerts and mobile token reservation directly via HostelFlow.',
      guidelines: [
        'Please collect finished laundry within 15 minutes of cycle completion.',
        'Use only liquid detergent pods for commercial front-load washers.',
        'Shoes and heavy carpets are strictly prohibited in washing machines.',
      ],
    ),

    // 4. 24/7 Biometric Security
    AmenityItem(
      id: 'security',
      title: '24/7 Biometric Security',
      locationOrSub: 'North & South Gate Checkpoints',
      statusBadge: 'Armed & Monitored',
      statusType: AmenityTagStatus.active,
      icon: Icons.verified_user_rounded,
      category: AmenityCategory.essentials,
      dutyContact: {
        'warden': 'Duty Warden: Capt. Ronald Vance',
        'extension': 'Emergency Intercom: Ext. 4101',
      },
      description:
          'Automated turnstiles equipped with high-speed facial recognition and NFC student card tap. Active campus warden and CCTV surveillance around the clock.',
      guidelines: [
        'Tailgating through turnstiles triggers security sirens and disciplinary review.',
        'Lost student ID cards must be deactivated immediately at the gate kiosk.',
        'After-hours entry past 11:00 PM requires biometric sign-in log.',
      ],
    ),

    // 5. Silent Study Hall
    AmenityItem(
      id: 'study',
      title: 'Silent Study Hall',
      locationOrSub: '2nd Floor East Wing • 24/7 AC',
      statusBadge: 'Open 24/7',
      statusType: AmenityTagStatus.openNow,
      icon: Icons.auto_stories_rounded,
      category: AmenityCategory.lifestyle,
      bannerImageUrl: 'assets/images/study_hall_amenity.png',
      bannerBadgeText: '45/60 Desks Occupied',
      description:
          '60 private carrels with individual surge-protected power outlets, dual-temp reading lights, and noise-damping acoustic panels.',
      guidelines: [
        'Strict whisper-free zone. Phone calls must be taken on balcony lobbies.',
        'Desks unattended for more than 45 minutes will be cleared by hall monitors.',
        'Only covered beverage tumblers permitted; no food allowed inside.',
      ],
    ),

    // 6. Recreation & Common Room
    AmenityItem(
      id: 'recreation',
      title: 'Recreation & Common Room',
      locationOrSub: 'Wing B Lounge • 08:00 - 22:30',
      statusBadge: 'Closing at 22:30',
      statusType: AmenityTagStatus.closingSoon,
      icon: Icons.sports_esports_rounded,
      category: AmenityCategory.lifestyle,
      featureTags: [
        {'icon': Icons.sports_tennis_rounded, 'label': '2 TT Tables'},
        {'icon': Icons.tv_rounded, 'label': "65'' Smart TV"},
        {'icon': Icons.local_cafe_rounded, 'label': 'Vending 24/7'},
      ],
      description:
          'Equipped with indoor table tennis, a 65" 4K TV lounge, foosball tables, a library of board games, and cashless snack vending stations.',
      guidelines: [
        'Return gaming controllers and TT racquets to the locker counter.',
        'Quiet hours begin promptly at 22:30 PM with automated TV shutdown.',
        'Common room furniture must not be relocated into private bedrooms.',
      ],
    ),
  ];

  List<AmenityItem> get filteredAmenities {
    if (selectedCategory.value == AmenityCategory.all) {
      return allAmenities;
    }
    return allAmenities
        .where((item) => item.category == selectedCategory.value)
        .toList();
  }

  void selectCategory(AmenityCategory cat) {
    selectedCategory.value = cat;
  }

  void toggleGuidelines(String id) {
    if (expandedGuidelines.contains(id)) {
      expandedGuidelines.remove(id);
    } else {
      expandedGuidelines.add(id);
    }
  }

  void callDutyDesk() {
    Get.snackbar(
      'Emergency Dispatch Desk',
      'Connecting to Ext. 4101 (Capt. Ronald Vance)...',
      backgroundColor: const Color(0xFFEFF6FF),
      colorText: AppColors.portalNavy,
      icon: const Icon(Icons.phone_in_talk_rounded, color: AppColors.portalNavy),
      snackPosition: SnackPosition.TOP,
    );
  }

  void openReportIssueDialog(AmenityItem item) {
    final textController = TextEditingController();
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item.icon, color: AppColors.portalNavy, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Report: ${item.title}',
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                      Text(
                        item.locationOrSub,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Describe the malfunction or issue:',
              style: AppTextStyles.labelMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textDarkNavy,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: textController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'e.g. Wi-Fi packet drops, washing machine leak, etc.',
                hintStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderLight),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primaryBlue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Ticket Created',
                    'Report for ${item.title} has been routed to Facility Maintenance.',
                    backgroundColor: const Color(0xFFECFDF5),
                    colorText: const Color(0xFF065F46),
                    icon: const Icon(Icons.check_circle_rounded, color: Color(0xFF059669)),
                    snackPosition: SnackPosition.TOP,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Submit Issue Report',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void openMaintenanceTicket() {
    Get.snackbar(
      'Maintenance Dispatch Desk',
      'Opening 24/7 Facility Service Portal ticket form...',
      backgroundColor: const Color(0xFFEFF6FF),
      colorText: AppColors.portalNavy,
      icon: const Icon(Icons.handyman_rounded, color: AppColors.portalNavy),
      snackPosition: SnackPosition.TOP,
    );
  }
}
