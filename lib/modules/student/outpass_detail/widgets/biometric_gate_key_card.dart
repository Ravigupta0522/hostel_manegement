import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/outpass_detail_controller.dart';

class BiometricGateKeyCard extends GetView<OutpassDetailController> {
  const BiometricGateKeyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Label & Refresh Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BIOMETRIC GATE KEY',
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textSlate,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () => Text(
                      'Pass Token: ${controller.passToken.value}',
                      style: AppTextStyles.titleMedium.copyWith(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: controller.isTokenRefreshing.value
                        ? null
                        : controller.refreshToken,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: AppColors.fieldBgLight,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.borderLight),
                      ),
                      child: controller.isTokenRefreshing.value
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primaryBlue,
                              ),
                            )
                          : const Icon(
                              Icons.refresh_rounded,
                              size: 16,
                              color: AppColors.textSlate,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Center QR Code Container with Center Badge
          Center(
            child: Container(
              width: 170,
              height: 170,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1.2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x080F172A),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(146, 146),
                    painter: _ModernQrPainter(),
                  ),
                  // Center Accent Badge (as in Image 1: soft blue pill with up-arrow)
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF818CF8),
                        width: 1.2,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x203730A3),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_upward_rounded,
                      size: 18,
                      color: Color(0xFF3730A3),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Turnstile Guidance Info Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.sensors_rounded,
                    size: 16,
                    color: Color(0xFF2563EB),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 11.5,
                        color: const Color(0xFF1E40AF),
                        height: 1.35,
                      ),
                      children: const [
                        TextSpan(
                          text:
                              'Show this code at campus turnstile biometric scanner at ',
                        ),
                        TextSpan(
                          text: 'South Gate.',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernQrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final darkPaint = Paint()..color = const Color(0xFF0F172A);
    final tealPaint = Paint()..color = const Color(0xFF006591);
    final bluePaint = Paint()..color = const Color(0xFF1D4ED8);

    final double step = size.width / 13;

    // Corner Finder 1 (Top Left)
    _drawFinder(canvas, 0, 0, step, darkPaint);
    // Corner Finder 2 (Top Right)
    _drawFinder(canvas, 8 * step, 0, step, darkPaint);
    // Corner Finder 3 (Bottom Left)
    _drawFinder(canvas, 0, 8 * step, step, darkPaint);

    // Decorative Data Blocks matching the aesthetic in screenshot 1
    final dataPoints = [
      // Top row between finders
      Rect.fromLTWH(6 * step, 1 * step, step, step),
      Rect.fromLTWH(5 * step, 2 * step, step * 1.8, step * 0.9),
      // Left vertical between finders
      Rect.fromLTWH(1 * step, 6 * step, step, step),
      Rect.fromLTWH(2 * step, 5 * step, step * 0.9, step * 1.8),
      // Center area surrounding badge
      Rect.fromLTWH(5 * step, 5 * step, step, step),
      Rect.fromLTWH(7 * step, 5 * step, step, step),
      Rect.fromLTWH(5 * step, 7 * step, step, step),
      Rect.fromLTWH(7 * step, 7 * step, step, step),
      // Right edge blocks
      Rect.fromLTWH(9 * step, 5 * step, step * 2, step),
      Rect.fromLTWH(11 * step, 6 * step, step, step * 2),
      Rect.fromLTWH(10 * step, 9 * step, step * 1.5, step),
      Rect.fromLTWH(10 * step, 11 * step, step * 2, step * 1.2),
      // Bottom edge blocks
      Rect.fromLTWH(5 * step, 9 * step, step, step * 2),
      Rect.fromLTWH(6 * step, 11 * step, step * 2, step),
    ];

    for (var r in dataPoints) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(r, const Radius.circular(2)),
        darkPaint,
      );
    }

    // A couple of teal / blue accent blocks as seen in Image 1
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(8 * step, 9 * step, step * 1.2, step * 1.6),
        const Radius.circular(3),
      ),
      tealPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(7 * step, 11 * step, step * 1.5, step),
        const Radius.circular(2),
      ),
      bluePaint,
    );
  }

  void _drawFinder(Canvas canvas, double x, double y, double step, Paint paint) {
    // Outer square (5x5)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, 5 * step, 5 * step),
        const Radius.circular(4),
      ),
      paint,
    );
    // Inner white cutout (3x3)
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(x + step, y + step, 3 * step, 3 * step),
        const Radius.circular(3),
      ),
      whitePaint,
    );
    // Center square (1.8 x 1.8)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(x + 1.6 * step, y + 1.6 * step, 1.8 * step, 1.8 * step),
        const Radius.circular(2),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
