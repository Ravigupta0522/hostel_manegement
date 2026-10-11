import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/community_guidelines_controller.dart';
import '../widgets/guidelines_download_pdf_bar.dart';
import '../widgets/guidelines_filter_bar.dart';
import '../widgets/guidelines_header.dart';
import '../widgets/guidelines_quiet_hours_banner.dart';
import '../widgets/guidelines_sections_list.dart';
import '../widgets/guidelines_top_bar.dart';

class MobileCommunityGuidelinesView
    extends GetView<CommunityGuidelinesController> {
  const MobileCommunityGuidelinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: GuidelinesTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with tags, AY badge, title and subtitle
            GuidelinesHeader(),
            SizedBox(height: 16),

            // Zero Disruption Zone Banner
            GuidelinesQuietHoursBanner(),
            SizedBox(height: 18),

            // Horizontal Filter Chips
            GuidelinesFilterBar(),
            SizedBox(height: 20),

            // All Sections and Rule Cards
            GuidelinesSectionsList(),
          ],
        ),
      ),
      bottomNavigationBar: GuidelinesDownloadPdfBar(),
    );
  }
}
