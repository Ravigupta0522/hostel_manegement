import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

/// Role type supported by the app.
enum UserRole { student, admin }

/// Data model for a single role card.
class RoleCardData {
  final UserRole role;
  final String badge;       // pill text e.g. "Resident Access"
  final String title;       // "Student / Resident"
  final String subtitle;    // description
  final List<String> features; // feature chip labels
  final String buttonLabel;
  final Color buttonColor;
  final Color badgeBgColor;
  final Color badgeTextColor;
  final Color iconBgColor;
  final Color iconColor;

  const RoleCardData({
    required this.role,
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.features,
    required this.buttonLabel,
    required this.buttonColor,
    required this.badgeBgColor,
    required this.badgeTextColor,
    required this.iconBgColor,
    required this.iconColor,
  });
}

class RoleSelectionController extends GetxController {
  final Rx<UserRole?> selectedRole = Rx<UserRole?>(null);

  final List<RoleCardData> roles = const [
    RoleCardData(
      role: UserRole.student,
      badge: 'Resident Access',
      title: 'Student / Resident',
      subtitle:
          'View room allocation, make online fee payments, raise maintenance requests, and track attendance & mess menu.',
      features: ['Room Details', 'Fee Receipts', 'Leave Requests'],
      buttonLabel: 'Continue as Student',
      buttonColor: Color(0xFF006591), // Exact color from user screenshot
      badgeBgColor: Color(0xFFCDE9FC),
      badgeTextColor: Color(0xFF006591),
      iconBgColor: Color(0xFFDDF2FD),
      iconColor: Color(0xFF0F172A),
    ),
    RoleCardData(
      role: UserRole.admin,
      badge: 'Staff & Management',
      title: 'Hostel Admin / Warden',
      subtitle:
          'Oversee hostel wings, manage bed allotments, monitor security & curfew, track fee collections, and resolve complaints.',
      features: ['Wing Management', 'Dues Tracking', 'Notice Broadcast'],
      buttonLabel: 'Continue as Admin',
      buttonColor: Color(0xFF00288E), // Deep navy from design
      badgeBgColor: Color(0xFFDDE3FC),
      badgeTextColor: Color(0xFF1D3B9B),
      iconBgColor: Color(0xFFE4E8FC),
      iconColor: Color(0xFF0F172A),
    ),
  ];

  void selectRole(UserRole role) {
    selectedRole.value = role;
    if (role == UserRole.student) {
      Get.toNamed(AppRoutes.studentLogin);
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }

  void goBack() => Get.back();
}
