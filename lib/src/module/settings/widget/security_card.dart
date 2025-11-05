import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:servo_controller/src/utils/constants.dart';
import '../../../utils/app_decorations.dart';
import '../../../utils/app_text_style.dart';
import '../../../widget/custom_text_form_field.dart';
import '../../../widget/custom_toggle_button.dart';
import '../../../widget/responsive_grid.dart';
import '../logic.dart';

class SecurityCard extends StatelessWidget {
  final SettingsLogic logic;
  const SecurityCard({
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
                  leading: Image.asset(security),
                  title: Text("Security Configuration",style: AppTextStyles.heading3,),
                ),
                SizedBox(height: 5,),
                Text("Manage security policies and authentication settings",style: AppTextStyles.regularGreySansBody),
                SizedBox(height: 20,),
                ListTile(
                  title: Text("Two-Factor Authentication",style: AppTextStyles.regularSansBody.copyWith(fontSize: 16,),),
                  subtitle: Text("Required 2FA for all admin users",style: AppTextStyles.regularGreySansBody),
                  trailing: Obx(()=> CustomToggleButton(onChanged: (value){logic.adminUser.value = value;},initialValue: logic.adminUser.value,)),
                ),
                SizedBox(height: 20,),
                Divider(color: Colors.grey.shade200,),
                SizedBox(height: 15,),
                ResponsiveGrid(
                  desktopCrossAxisCount: 2,
                  children: [
                    Align(alignment: Alignment.topLeft,child: CustomInputTextField(hintText: '30',controller: logic.sessionTimeoutController,heading: 'Session Timeout (minutes)',)),
                    CustomInputTextField(hintText: '90',controller: logic.passwordExpiryController,heading: 'Password Expiry (Days)',),
                  ],
                )

              ])
      ),
    );
  }
}
