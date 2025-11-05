import 'package:get/get.dart';

class DiagnosticsLogic extends GetxController{

  var selectedValue = RxnString();
  var selectedTriggerValue = RxnString();

  final searchQuery = ''.obs;

  final allDiagnostics = <Diagnostics>[
   Diagnostics(timeStamp: 'July 5, 10:20 AM', qNodeId: 'QNode-123', machine: 'Machine-A', status: 'Healthy', triggeredBy: 'Auto'),
   Diagnostics(timeStamp: 'July 5, 10:20 AM', qNodeId: 'QNode-456', machine: 'Machine-B', status: 'Warning', triggeredBy: 'Admin'),
   Diagnostics(timeStamp: 'July 5, 10:20 AM', qNodeId: 'QNode-789', machine: 'Machine-C', status: 'Critical', triggeredBy: 'Manual'),
  ].obs;

  List<Diagnostics> get filteredDiagnostics {
    return allDiagnostics.where((t) {
      final matchesSearch = t.machine.toLowerCase()
          .contains(searchQuery.value.toLowerCase());

      final selectedCategory = selectedValue.value?.toLowerCase();
      final selectedTrigger = selectedTriggerValue.value?.toLowerCase();

      final matchesStatus =
          selectedCategory == null ||
              selectedCategory == "all" ||
              t.status.toLowerCase() == selectedCategory;

      final matchesTrigger =
          selectedTrigger == null ||
              selectedTrigger == "all" ||
              t.triggeredBy.toLowerCase() == selectedTrigger;

      return matchesSearch && matchesStatus && matchesTrigger;
    }).toList();
  }



  void updateSearch(value) {
    searchQuery.value = value;
  }

  void updateSelectedStatus(String? value) {
    selectedValue.value = value;
  }
  void updateSelectedTriggerValue(String? value) {
    selectedTriggerValue.value = value;
  }
}


class Diagnostics {
  final String timeStamp;
  final String qNodeId;
  final String machine;
  final String status;
  final String triggeredBy;


  Diagnostics({
    required this.timeStamp,
    required this.qNodeId,
    required this.machine,
    required this.status,
    required this.triggeredBy,
  });
}