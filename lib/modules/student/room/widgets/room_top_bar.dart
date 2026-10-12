import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class RoomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDesktop;

  const RoomTopBar({
    super.key,
    this.isDesktop = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              // Back Button
              IconButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Get.back();
                  } else {
                    Get.offAllNamed('/student/dashboard');
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textDarkNavy,
                  size: 22,
                ),
                tooltip: 'Back',
              ),

              // Home / Hostel Badge
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),

              // Title: Current Room Details
              const Expanded(
                child: Text(
                  'Current Room Details',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDarkNavy,
                    letterSpacing: -0.2,
                  ),
                ),
              ),

              // Right Profile Avatar
              ClipOval(
                child: Image.asset(
                  'assets/images/warden_prof_thorne.jpg',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDBEAFE),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'RS',
                          style: TextStyle(
                            color: Color(0xFF1D4ED8),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
