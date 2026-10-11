enum InquiryCategory {
  gatePass,
  maintenance,
  curfew,
  general,
}

extension InquiryCategoryExt on InquiryCategory {
  String get label {
    switch (this) {
      case InquiryCategory.gatePass:
        return 'Gate Pass Query';
      case InquiryCategory.maintenance:
        return 'Maintenance Escalation';
      case InquiryCategory.curfew:
        return 'Curfew Exemption';
      case InquiryCategory.general:
        return 'General Inquiry';
    }
  }
}

class WardenProfile {
  final String name;
  final String designation;
  final String subTitle;
  final String department;
  final String officeLocation;
  final String locationDetails;
  final String visitingHours;
  final String visitingHoursEvening;
  final String photoAsset;
  final String phoneExtension;
  final String email;
  final bool isInOffice;

  const WardenProfile({
    required this.name,
    required this.designation,
    required this.subTitle,
    required this.department,
    required this.officeLocation,
    required this.locationDetails,
    required this.visitingHours,
    required this.visitingHoursEvening,
    required this.photoAsset,
    required this.phoneExtension,
    required this.email,
    this.isInOffice = true,
  });
}

class AssistantWardenInfo {
  final String name;
  final String initials;
  final String designation;
  final String responsibilities;
  final String phoneNumber;
  final bool isOnline;

  const AssistantWardenInfo({
    required this.name,
    required this.initials,
    required this.designation,
    required this.responsibilities,
    required this.phoneNumber,
    this.isOnline = true,
  });
}
