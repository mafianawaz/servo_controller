import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardLogic extends GetxController{
var alerts = <AlertItem>[].obs;

@override
void onInit() {
  super.onInit();

  // Mock data
  alerts.value = [
    AlertItem(
      time: DateTime.now().subtract(const Duration(minutes: 5)),
      message: "QNODE-456 failed diagnostics",
      type: "Critical",
      color: Colors.red,
      isNew: true,
    ),
    AlertItem(
      time: DateTime.now().subtract(const Duration(hours: 25)),
      message: "Machine-B has degraded performance",
      type: "Warning",
      color: Colors.orange,
    ),
    AlertItem(
      time: DateTime.now().subtract(const Duration(days: 2)),
      message: "Scheduled maintenance completed",
      type: "Info",
      color: Colors.blue,
    ),
    AlertItem(
      time: DateTime.now().subtract(const Duration(days: 3)),
      message: "QNODE-789 connection lost",
      type: "Critical",
      color: Colors.red,
    ),
  ];
}

// mark alert as read
void markAsRead(int index) {
  alerts[index].isNew = false;
  alerts.refresh();
}

int get newAlertsCount => alerts.where((a) => a.isNew).length;
}

class AlertItem {
  final DateTime time;
  final String message;
  final String type;
  final Color color;
  bool isNew; // to track blue dot

  AlertItem({
    required this.time,
    required this.message,
    required this.type,
    required this.color,
    this.isNew = false,
  });
}