import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/available_rooms_controller.dart';

class AvailableRoomsSearchBar extends GetView<AvailableRoomsController> {
  const AvailableRoomsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller.searchController,
        onChanged: (val) => controller.searchQuery.value = val,
        decoration: InputDecoration(
          hintText: 'Search room, block (e.g. 205, Block B)...',
          hintStyle: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xFF64748B),
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.tune_rounded,
              color: Color(0xFF64748B),
              size: 20,
            ),
            onPressed: () {
              // Quick clear or filter toggle
              if (controller.searchController.text.isNotEmpty) {
                controller.searchController.clear();
                controller.searchQuery.value = '';
              }
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
