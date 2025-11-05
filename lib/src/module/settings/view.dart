import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/settings/widget/data_retention_card.dart';
import 'package:servo_controller/src/module/settings/widget/feature_toggle_card.dart';
import 'package:servo_controller/src/module/settings/widget/notification_card.dart';
import 'package:servo_controller/src/module/settings/widget/security_card.dart';
import 'package:servo_controller/src/module/settings/widget/user_card.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import '../../widget/custom_button.dart';
import '../alert/widget/tab_bar_widget.dart';
import 'logic.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SettingsLogic(),
        builder: (logic){
          return ResponsiveScaffold(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,child: Text("System Settings",style: AppTextStyles.heading2)),
                SizedBox(height: 20,),
                Obx(() => CustomToggle(
                  options: ["Features", "Users", "Notifications", "Data", "Security"],
                  optionIcons: [feature, users, notification, data, security],
                  selectedIndex: logic.selectedIndex.value,
                  onChanged: logic.changeIndex,
                  showIcon: true,
                )),
                SizedBox(height: 20,),
                Obx((){
                  if (logic.selectedIndex.value == 0){
                    return FeatureCard(logic: logic,);
                  }
                  if(logic.selectedIndex.value == 1){
                    return UserManagementCard(logic: logic,);
                  }
                  if(logic.selectedIndex.value == 2){
                    return NotificationCard(logic: logic,);
                  }
                  if(logic.selectedIndex.value == 3){
                    return DataRetentionCard(logic: logic,);
                  }
                  else{
                    return SecurityCard(logic: logic);
                  }
                }),
                SizedBox(height: 20,),
                Align(alignment: Alignment.topRight,child: SizedBox(width : 150,child: CustomButton(text: 'Save Settings', onPressed: (){}))),
              ],
            ),
          ));
        }
    );
  }
}





