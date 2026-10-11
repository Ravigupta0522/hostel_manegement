import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/community_guidelines_controller.dart';
import '../widgets/guidelines_download_pdf_bar.dart';
import '../widgets/guidelines_filter_bar.dart';
import '../widgets/guidelines_header.dart';
import '../widgets/guidelines_quiet_hours_banner.dart';
import '../widgets/guidelines_sections_list.dart';
import '../widgets/guidelines_top_bar.dart';

class DesktopCommunityGuidelinesView
    extends GetView<CommunityGuidelinesController> {
  const DesktopCommunityGuidelinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: const GuidelinesTopBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Scaffold(
                backgroundColor: Color(0xFFF8FAFC),
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GuidelinesHeader(),
                      SizedBox(height: 18),
                      GuidelinesQuietHoursBanner(),
                      SizedBox(height: 20),
                      GuidelinesFilterBar(),
                      SizedBox(height: 22),
                      GuidelinesSectionsList(),
                    ],
                  ),
                ),
                bottomNavigationBar: GuidelinesDownloadPdfBar(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
