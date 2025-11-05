import 'package:get/get.dart';

class QNodeLogic extends GetxController{

  final searchQuery = ''.obs;
  var selectedValue = RxnString();

  final allQNodes = <QNodes>[
   QNodes(qNode: 'Primary Water Pump', qNodeModel: 'QN-A12', status: 'Online', lastSeen: '2 min ago', connectedMachine: 'PUMP-001', signal: 88, battery: 92),
   QNodes(qNode: 'Primary Water Pump', qNodeModel: 'QN-A13', status: 'Offline', lastSeen: '5 hours ago', connectedMachine: 'PUMP-001', signal: 0, battery: 60),
   QNodes(qNode: 'Primary Water Pump', qNodeModel: 'QN-A14', status: 'Standby', lastSeen: '2 min ago', connectedMachine: 'PUMP-001', signal: 65, battery: 16),
  ].obs;

  List<QNodes> get filteredQNodes {
    return allQNodes.where((t) {
      final matchesSearch = t.qNode.toLowerCase()
          .contains(searchQuery.value.toLowerCase());

      final selectedStatus = selectedValue.value?.toLowerCase();

      final matchesStatus =
          selectedStatus == null ||
              selectedStatus == "all" ||
              t.status.toLowerCase() == selectedStatus;

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


class QNodes {
  final String qNode;
  final String qNodeModel;
  final String status;
  final String lastSeen;
  final String connectedMachine;
  final int signal;
  final int battery;



  QNodes({
    required this.qNode,
    required this.qNodeModel,
    required this.status,
    required this.lastSeen,
    required this.connectedMachine,
    required this.signal,
    required this.battery,

  });
}