import 'package:get/get.dart';

class MachineLogic extends GetxController{

  final searchQuery = ''.obs;
  var selectedValue = RxnString();

  final allMachines = <Machines>[
   Machines(machine: 'Primary Water Pump',machineModel: 'PUMP-001', status: 'Running', qNode: 'QN-01', lastDiagnostic: '1 day ago', health: 'Good', alert: 4),
   Machines(machine: 'Primary Water Pump',machineModel: 'COMP-01', status: 'Idle', qNode: 'QN-02', lastDiagnostic: '1 day ago', health: 'Warning', alert: 0),
   Machines(machine: 'Primary Water Pump',machineModel: 'CONV-003', status: 'Maintenance', qNode: 'QN-03', lastDiagnostic: '1 day ago', health: 'Critical', alert: 5),
  ].obs;

  List<Machines> get filteredMachines {
    return allMachines.where((t) {
      final matchesSearch = t.machine.toLowerCase()
          .contains(searchQuery.value.toLowerCase());

      final selectedCategory = selectedValue.value?.toLowerCase();

      final matchesStatus =
          selectedCategory == null ||
              selectedCategory == "all" ||
              t.status.toLowerCase() == selectedCategory;

      return matchesSearch && matchesStatus;
    }).toList();
  }


  void updateSearch(value) {
    searchQuery.value = value;
  }

  void updateSelectedStatus(String? value) {
    selectedValue.value = value;
  }
}


class Machines {
  final String machine;
  final String machineModel;
  final String status;
  final String qNode;
  final String lastDiagnostic;
  final String health;
  final int alert;



  Machines({
    required this.machine,
    required this.machineModel,
    required this.status,
    required this.qNode,
    required this.lastDiagnostic,
    required this.health,
    required this.alert,

  });
}