import 'package:get/get.dart';
import 'package:servo_controller/src/module/alert/widget/status_chip.dart';

class AlertLogic extends GetxController{

  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final alerts = <AlertRow>[
    AlertRow(
      time: DateTime.now().subtract(const Duration(days: 1)),
      status: StatusType.info,
      relatedTo: "QNode-A456",
      message: "Failed last 3 diagnostics",
      isRead: false,
    ),
    AlertRow(
      time: DateTime.now(),
      status: StatusType.warning,
      relatedTo: "QNode-A456",
      message: "Failed last 3 diagnostics",
      isRead: true,
    ),
    AlertRow(
      time: DateTime.now().subtract(const Duration(minutes: 30)),
      status: StatusType.critical,
      relatedTo: "QNode-A456",
      message: "Failed last 3 diagnostics",
      isRead: false,
    ),
  ].obs;
}


class AlertRow {
  final DateTime time;
  final StatusType status;
  final String relatedTo;
  final String message;
  final bool isRead;

  AlertRow({
    required this.time,
    required this.status,
    required this.relatedTo,
    required this.message,
    this.isRead = false,
  });
}