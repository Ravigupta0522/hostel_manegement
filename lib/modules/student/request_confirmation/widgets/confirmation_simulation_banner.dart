import 'package:flutter/material.dart';

class ConfirmationSimulationBanner extends StatelessWidget {
  const ConfirmationSimulationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC7D2FE)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 18,
            color: Color(0xFF4F46E5),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HostelFlow Simulation Mode',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E1B4B),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Demo Simulation: This is an active UI demonstration within HostelFlow OS. No actual bed reallocation has been executed on the production registrar server.',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF4338CA),
                    height: 1.4,
                    fontWeight: FontWeight.w500,
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
