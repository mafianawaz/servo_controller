import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/widget/custom_dropdown_button.dart';
import 'package:servo_controller/src/widget/custom_text_form_field.dart';
import 'package:servo_controller/src/widget/custom_toggle_button.dart';
import '../../utils/app_decorations.dart';
import '../../widget/custom_button.dart';
import '../../widget/responsive_scaffold.dart';
import '../alert/widget/tab_bar_widget.dart';
import 'logic.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SettingsLogic(),
        builder: (logic){
          return ResponsiveScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text("System Settings",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Obx(() => CustomToggle(
                    options: ["Features", "Users", "Notifications", "Data", "Security"],
                    optionIcons: [Icons.settings_outlined, Icons.person, Icons.notifications_none, Icons.data_saver_off, Icons.security_outlined],
                    selectedIndex: logic.selectedIndex.value,
                    onChanged: logic.changeIndex,
                    showIcon: true,
                  )),
                  SizedBox(height: 20,),
                  Obx((){
                   if (logic.selectedIndex.value == 0){
                     return Container(
                         decoration: AppDecorations.cardDecoration,
                         child: Padding(
                           padding: const EdgeInsets.all(20),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [
                                   Icon(Icons.settings_outlined, size: 20,),
                                   SizedBox(width: 15,),
                                   Text("Feature Toggles",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Text("Enable or disable platform features",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                               SizedBox(height: 20,),
                               ListTile(
                                   title: Text("AI Features",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                                   subtitle: Text("Enable AI-powered diagnostics and prediction",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                                   trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.aiFeatures.value = value;},initialValue: logic.aiFeatures.value,)),
                               ),
                               Divider(color: Colors.grey.shade200,),
                               SizedBox(height: 20,),
                               ListTile(
                                   title: Text("System Logs",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                                   subtitle: Text("Enable comprehensive system logging",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                                   trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.systemLogs.value = value;},initialValue: logic.systemLogs.value,)),
                               ),
                               Divider(color: Colors.grey.shade200,),
                               SizedBox(height: 20,),
                               ListTile(
                                   title: Text("Alert System",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                                   subtitle: Text("Enable automated alerting and notifications",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                                   trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.alertSystem.value = value;},initialValue: logic.alertSystem.value,)),
                               ),
                               Divider(color: Colors.grey.shade200,),
                               SizedBox(height: 20,),
                               ListTile(
                                   title: Text("Auto Backup",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                                   subtitle: Text("Automatically backup system data daily",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                                   trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.autoBackup.value = value;},initialValue: logic.autoBackup.value,)),
                               ),
                               Divider(color: Colors.grey.shade200,),
                             ],
                           ),
                         ),
                       );
                   }
                   if(logic.selectedIndex.value == 1){
                     return Container(
                       decoration: AppDecorations.cardDecoration,
                       child: Padding(
                         padding: const EdgeInsets.all(20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Icon(Icons.perm_identity, size: 20,),
                                 SizedBox(width: 15,),
                                 Text("Users Role Management",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                               ],
                             ),
                             SizedBox(height: 5,),
                             Text("Define custom permissions and roles for users",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                             SizedBox(height: 20,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Obx(() => CustomDropdown<String>(
                                   items: ["Admin", "Viewer", "Technician"],
                                   value: logic.selectedUserValue.value,
                                   itemLabel: (item) => item,
                                   onChanged: (val) {
                                     logic.selectedUserValue.value = val;
                                   },
                                   hintText: "All Roles",
                                   heading: 'Default User Role',
                                 )),
                                 SizedBox(width: 20,),
                                 CustomInputTextField(heading: 'Max Concurrent Users',hintText: '50',controller: logic.maxUserController,)
                               ],
                             ),
                           ],
                         ),
                       ),
                     );
                   }
                   if(logic.selectedIndex.value == 2){
                     return Container(
                       decoration: AppDecorations.cardDecoration,
                       child: Padding(
                         padding: const EdgeInsets.all(20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Icon(Icons.notifications_none, size: 20,),
                                 SizedBox(width: 15,),
                                 Text("Notification Preferences",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                               ],
                             ),
                             SizedBox(height: 5,),
                             Text("Configure how and when notifications are sent",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                             SizedBox(height: 20,),
                             ListTile(
                               title: Text("Email Notifications",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                               subtitle: Text("Receive alerts via emails",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                               trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.emailNotifications.value = value;},initialValue: logic.emailNotifications.value,)),
                             ),
                             Divider(color: Colors.grey.shade200,),
                             SizedBox(height: 20,),
                             ListTile(
                               title: Text("SMS Notifications",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                               subtitle: Text("Receive critical alerts via SMS",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                               trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.smsNotifications.value = value;},initialValue: logic.smsNotifications.value,)),
                             ),
                             Divider(color: Colors.grey.shade200,),
                             SizedBox(height: 20,),
                             ListTile(
                               title: Text("Critical Alerts Only",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                               subtitle: Text("Only send critical priority notifications",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                               trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.criticalAlertsOnly.value = value;},initialValue: logic.criticalAlertsOnly.value,)),
                             ),
                             Divider(color: Colors.grey.shade200,),
                           ],
                         ),
                       ),
                     );
                   }
                   if(logic.selectedIndex.value == 3){
                     return Container(
                       decoration: AppDecorations.cardDecoration,
                       child: Padding(
                         padding: const EdgeInsets.all(20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Icon(Icons.data_saver_off, size: 20,),
                                 SizedBox(width: 15,),
                                 Text("Data Retention Policy",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                               ],
                             ),
                             SizedBox(height: 5,),
                             Text("Configure how long the data is store in system",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                             SizedBox(height: 25,),
                             Row(
                               children: [
                                 CustomInputTextField(hintText: '30',controller: logic.logsRetentionController,heading: 'System Logs Retention (Days)',),
                                 SizedBox(width: 25,),
                                 CustomInputTextField(hintText: '90',controller: logic.historyRetentionController,heading: 'Alert History Retention (Days)',),
                                 SizedBox(width: 25,),
                                 CustomInputTextField(hintText: '365',controller: logic.dataRetentionController,heading: 'Diagnostic Data Retention (Days)',),
                               ],
                             )
                           ],
                         ),
                       ),
                     );
                   }
                    else{
                    return Container(
                      decoration: AppDecorations.cardDecoration,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.security_outlined, size: 20,),
                                SizedBox(width: 15,),
                                Text("Security Configuration",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text("Manage security policies and authentication settings",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                            SizedBox(height: 20,),
                            ListTile(
                              title: Text("Two-Factor Authentication",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),),
                              subtitle: Text("Required 2FA for all admin users",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.adminUser.value = value;},initialValue: logic.adminUser.value,)),
                            ),
                            SizedBox(height: 20,),
                            Divider(color: Colors.grey.shade200,),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomInputTextField(hintText: '30',controller: logic.sessionTimeoutController,heading: 'Session Timeout (minutes)',),
                                SizedBox(width: 25,),
                                CustomInputTextField(hintText: '90',controller: logic.passwordExpiryController,heading: 'Password Expiry (Days)',),
                              ],
                            )

                          ])
                      ),
                    );
                    }
                  }),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.topRight,child: SizedBox(width : 150,child: CustomButton(text: 'Save Settings', onPressed: (){}))),
                ],
              ),
            ),
          );
        }
    );
  }
}
