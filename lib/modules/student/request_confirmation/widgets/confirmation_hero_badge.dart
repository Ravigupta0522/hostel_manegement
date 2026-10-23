import 'package:flutter/material.dart';

class ConfirmationHeroBadge extends StatelessWidget {
  const ConfirmationHeroBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        // Central Success Checkmark with floating accents
        Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Soft glowing teal background circle
                Container(
                  width: 106,
                  height: 106,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFFCCFBF1).withValues(alpha: 0.8),
                        const Color(0xFFD1FAE5).withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                // Outer circle border subtle
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE6F4EA).withValues(alpha: 0.7),
                  ),
                ),
                // Dark Emerald Green center circle
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF065F46),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF065F46).withValues(alpha: 0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                // Bottom-left mini check badge
                Positioned(
                  bottom: 24,
                  left: 20,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF34D399),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        size: 9,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Top-right subtle cyan chevron accent
                const Positioned(
                  top: 18,
                  right: 24,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 11,
                    color: Color(0xFF38BDF8),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        // Heading
        const Text(
          'Room Change Request\nSubmitted!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Color(0xFF0F172A),
            height: 1.25,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 10),
        // Subtitle
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Your relocation petition has been logged and forwarded to the Hostel Warden Office for verification.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: Color(0xFF64748B),
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
