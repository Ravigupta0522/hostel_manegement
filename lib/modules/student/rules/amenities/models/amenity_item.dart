import 'package:flutter/material.dart';

enum AmenityCategory {
  all,
  essentials,
  lifestyle,
}

enum AmenityTagStatus {
  active,
  openNow,
  info,
  closingSoon,
}

class LaundryMachineSlot {
  final String label;
  final bool isAvailable;
  final String? remainingTime;

  const LaundryMachineSlot({
    required this.label,
    required this.isAvailable,
    this.remainingTime,
  });
}

class AmenityItem {
  final String id;
  final String title;
  final String locationOrSub;
  final String statusBadge;
  final AmenityTagStatus statusType;
  final IconData icon;
  final AmenityCategory category;
  final String description;
  final String? bannerImageUrl;
  final String? bannerBadgeText;
  final List<String>? scheduleBadges;
  final List<LaundryMachineSlot>? laundrySlots;
  final Map<String, String>? dutyContact;
  final List<Map<String, dynamic>>? featureTags;
  final List<String> guidelines;

  const AmenityItem({
    required this.id,
    required this.title,
    required this.locationOrSub,
    required this.statusBadge,
    required this.statusType,
    required this.icon,
    required this.category,
    required this.description,
    this.bannerImageUrl,
    this.bannerBadgeText,
    this.scheduleBadges,
    this.laundrySlots,
    this.dutyContact,
    this.featureTags,
    this.guidelines = const [],
  });
}
