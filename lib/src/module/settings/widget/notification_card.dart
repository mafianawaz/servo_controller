import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:servo_controller/src/utils/constants.dart';
import '../../../utils/app_decorations.dart';
import '../../../utils/app_text_style.dart';
import '../../../widget/custom_toggle_button.dart';
import '../logic.dart';

class NotificationCard extends StatelessWidget {
  final SettingsLogic logic;
  const NotificationCard({
    super.key, required this.logic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(notification,color: Colors.black,),
              title: Text("Notification Preferences",style: AppTextStyles.heading3,),
            ),
            SizedBox(height: 5,),
            Text("Configure how and when notifications are sent",style: AppTextStyles.regularGreySansBody,),
            SizedBox(height: 20,),
            ListTile(
              title: Text("Email Notifications",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
              subtitle: Text("Receive alerts via emails",style: AppTextStyles.regularGreySansBody,),
              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.emailNotifications.value = value;},initialValue: logic.emailNotifications.value,)),
            ),
            Divider(color: Colors.grey.shade200,),
            SizedBox(height: 20,),
            ListTile(
              title: Text("SMS Notifications",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
              subtitle: Text("Receive critical alerts via SMS",style: AppTextStyles.regularGreySansBody,),
              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.smsNotifications.value = value;},initialValue: logic.smsNotifications.value,)),
            ),
            Divider(color: Colors.grey.shade200,),
            SizedBox(height: 20,),
            ListTile(
              title: Text("Critical Alerts Only",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
              subtitle: Text("Only send critical priority notifications",style: AppTextStyles.regularGreySansBody,),
              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.criticalAlertsOnly.value = value;},initialValue: logic.criticalAlertsOnly.value,)),
            ),
            Divider(color: Colors.grey.shade200,),
          ],
        ),
      ),
    );
  }
}
