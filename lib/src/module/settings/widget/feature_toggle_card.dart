import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';
import '../../../utils/app_decorations.dart';
import '../../../widget/custom_toggle_button.dart';
import '../logic.dart';

class FeatureCard extends StatelessWidget {
  final SettingsLogic logic;
  const FeatureCard({
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
            Row(
              children: [
                Image.asset(feature),
                SizedBox(width: 5,),
                Text("Feature Toggles",style: AppTextStyles.heading3),
              ],
            ),
            SizedBox(height: 5,),
            Text("Enable or disable platform features",style: AppTextStyles.regularGreySansBody,),
            SizedBox(height: 20,),
            ListTile(
              title: Text("AI Features",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
              subtitle: Text("Enable AI-powered diagnostics and prediction",style: AppTextStyles.regularGreySansBody,),
              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.aiFeatures.value = value;},initialValue: logic.aiFeatures.value,)),
            ),
            Divider(color: Colors.grey.shade200,),
            SizedBox(height: 20,),
            ListTile(
              title: Text("System Logs",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
              subtitle: Text("Enable comprehensive system logging",style: AppTextStyles.regularGreySansBody,),
              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.systemLogs.value = value;},initialValue: logic.systemLogs.value,)),
            ),
            Divider(color: Colors.grey.shade200,),
            SizedBox(height: 20,),
            ListTile(
              title: Text("Alert System",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
              subtitle: Text("Enable automated alerting and notifications",style: AppTextStyles.regularGreySansBody,),
              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.alertSystem.value = value;},initialValue: logic.alertSystem.value,)),
            ),
            Divider(color: Colors.grey.shade200,),
            SizedBox(height: 20,),
            ListTile(
              title: Text("Auto Backup",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16),),
              subtitle: Text("Automatically backup system data daily",style: AppTextStyles.regularGreySansBody,),
              trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.autoBackup.value = value;},initialValue: logic.autoBackup.value,)),
            ),
            Divider(color: Colors.grey.shade200,),
          ],
        ),
      ),
    );
  }
}
