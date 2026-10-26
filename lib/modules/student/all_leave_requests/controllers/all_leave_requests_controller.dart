import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../leave/controllers/student_leave_controller.dart';

class AllLeaveRequestsController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  // Status Filter: 'All', 'Pending', 'Approved', 'Rejected'
  final RxString selectedStatus = 'All'.obs;

  // Type Filter: 'Any', 'Medical', 'Home Visit', 'Personal', 'Emergency'
  final RxString selectedType = 'Any'.obs;

  final List<String> statusTabs = const [
    'All',
    'Pending',
    'Approved',
    'Rejected',
  ];

  final List<String> typeFilters = const [
    'Any',
    'Medical',
    'Home Visit',
    'Personal',
    'Emergency',
  ];

  // Base list of all leave petitions
  final RxList<Map<String, dynamic>> allRequests = <Map<String, dynamic>>[
    {
      'id': '#LV-2026-0891',
      'type': 'Medical Leave',
      'status': 'Pending Review',
      'duration': '24 Oct – 26 Oct 2026',
      'totalDays': '3 Days',
      'reason':
          'Scheduled wisdom tooth extraction and recovery under specialist care at City Dental Hospital.',
      'submittedDate': 'Submitted 22 Oct 2026',
      'wardenRemark': null,
      'rejectionNote': null,
      'hasDocument': true,
      'docName': 'dental_clinic_prescription.pdf',
      'destination': 'Flat 402, Greenfield Heights, New Delhi',
      'guardianContact': '+91 98765 43210 (Father)',
    },
    {
      'id': '#LV-2026-0742',
      'type': 'Home Visit',
      'status': 'Approved',
      'duration': '12 Oct – 15 Oct 2026',
      'totalDays': '4 Days',
      'reason':
          'Family festive gathering for Diwali celebrations and sibling wedding preparation.',
      'submittedDate': 'Submitted 08 Oct 2026',
      'wardenRemark': 'Parent verified. Outpass token #OP-742 active.',
      'rejectionNote': null,
      'hasDocument': false,
      'docName': null,
      'destination': 'House No 12, Civil Lines, Jaipur',
      'guardianContact': '+91 98765 43210 (Father)',
    },
    {
      'id': '#LV-2026-0518',
      'type': 'Personal Leave',
      'status': 'Approved',
      'duration': '15 Sep – 17 Sep 2026',
      'totalDays': '3 Days',
      'reason':
          'Attending state inter-college robotics hackathon held at Tech Hub Innovation Park.',
      'submittedDate': 'Submitted 11 Sep 2026',
      'wardenRemark': null,
      'rejectionNote': null,
      'hasDocument': false,
      'docName': null,
      'destination': 'Tech Hub Innovation Campus, Bengaluru',
      'guardianContact': '+91 98765 43210 (Father)',
    },
    {
      'id': '#LV-2026-0310',
      'type': 'Emergency Leave',
      'status': 'Rejected',
      'duration': '02 Aug – 03 Aug 2026',
      'totalDays': '2 Days',
      'reason':
          'Unverified emergency contact number; student requested to visit warden office.',
      'submittedDate': 'Submitted 01 Aug 2026',
      'wardenRemark': null,
      'rejectionNote':
          'Unverified emergency contact number; student requested to visit warden office.',
      'hasDocument': false,
      'docName': null,
      'destination': 'District Hospital, Lucknow',
      'guardianContact': '+91 91234 56789',
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      searchQuery.value = searchController.text.trim();
    });

    // Check if StudentLeaveController has freshly submitted leave items
    _syncFreshLeaves();
  }

  void _syncFreshLeaves() {
    if (Get.isRegistered<StudentLeaveController>()) {
      final leaveCtrl = Get.find<StudentLeaveController>();
      for (final req in leaveCtrl.recentRequests) {
        final ref = req['ref']?.toString().replaceAll('Ref: ', '') ?? '';
        final exists = allRequests.any((e) => e['id'] == ref);
        if (!exists && ref.isNotEmpty) {
          allRequests.insert(0, {
            'id': ref,
            'type': req['type'] ?? 'Personal Leave',
            'status': req['status'] ?? 'Pending Review',
            'duration': req['dates'] ?? 'Upcoming Dates',
            'totalDays': '3 Days',
            'reason': req['reason'] ?? '',
            'submittedDate': req['submittedDate'] ?? 'Submitted Today',
            'wardenRemark': req['wardenRemark'],
            'rejectionNote': null,
            'hasDocument': req['hasDocument'] ?? false,
            'docName': req['hasDocument'] == true ? 'Supporting_Document.pdf' : null,
            'destination': 'Registered Permanent Address',
            'guardianContact': '+91 98765 43210 (Guardian)',
          });
        }
      }
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // Counts for tabs
  int get totalCount => allRequests.length;

  int get pendingCount => allRequests
      .where((e) => e['status'].toString().toLowerCase().contains('pending'))
      .length;

  int get approvedCount => allRequests
      .where((e) => e['status'].toString().toLowerCase().contains('approved'))
      .length;

  int get rejectedCount => allRequests
      .where((e) => e['status'].toString().toLowerCase().contains('rejected'))
      .length;

  int getCountForStatus(String status) {
    switch (status) {
      case 'Pending':
        return pendingCount;
      case 'Approved':
        return approvedCount;
      case 'Rejected':
        return rejectedCount;
      case 'All':
      default:
        return totalCount;
    }
  }

  // Filtered requests list
  List<Map<String, dynamic>> get filteredRequests {
    return allRequests.where((req) {
      // 1. Status Filter
      if (selectedStatus.value != 'All') {
        final reqStatus = req['status'].toString().toLowerCase();
        if (!reqStatus.contains(selectedStatus.value.toLowerCase())) {
          return false;
        }
      }

      // 2. Type Filter
      if (selectedType.value != 'Any') {
        final reqType = req['type'].toString().toLowerCase();
        if (!reqType.contains(selectedType.value.toLowerCase())) {
          return false;
        }
      }

      // 3. Search Query
      if (searchQuery.isNotEmpty) {
        final q = searchQuery.value.toLowerCase();
        final id = req['id'].toString().toLowerCase();
        final type = req['type'].toString().toLowerCase();
        final reason = req['reason'].toString().toLowerCase();
        final status = req['status'].toString().toLowerCase();
        final matches = id.contains(q) ||
            type.contains(q) ||
            reason.contains(q) ||
            status.contains(q);
        if (!matches) return false;
      }

      return true;
    }).toList();
  }

  void setStatusTab(String status) {
    selectedStatus.value = status;
  }

  void setTypeFilter(String type) {
    selectedType.value = type;
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
  }
}
