import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsLogic extends GetxController{
  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  var aiFeatures = true.obs;
  var systemLogs = true.obs;
  var alertSystem = false.obs;
  var autoBackup = false.obs;
  var emailNotifications = true.obs;
  var smsNotifications = true.obs;
  var criticalAlertsOnly = false.obs;
  var adminUser = true.obs;

  var selectedUserValue = RxnString();
  TextEditingController maxUserController = TextEditingController();
  TextEditingController logsRetentionController = TextEditingController();
  TextEditingController historyRetentionController = TextEditingController();
  TextEditingController dataRetentionController = TextEditingController();
  TextEditingController sessionTimeoutController = TextEditingController();
  TextEditingController passwordExpiryController = TextEditingController();
}