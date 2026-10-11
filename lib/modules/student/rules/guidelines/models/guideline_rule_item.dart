import 'package:flutter/material.dart';

enum GuidelineTagType {
  strict,
  standard,
  notice,
}

class GuidelineRuleItem {
  final String id;
  final String categoryId;
  final String title;
  final String description;
  final GuidelineTagType tagType;
  final String tagLabel;
  final IconData icon;
  final String? footerText;
  final IconData? footerIcon;

  const GuidelineRuleItem({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.tagType,
    required this.tagLabel,
    required this.icon,
    this.footerText,
    this.footerIcon,
  });
}
