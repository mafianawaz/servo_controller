import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/constants.dart';
import '../../../utils/app_decorations.dart';
import '../../../utils/app_text_style.dart';
import '../../../widget/custom_text_form_field.dart';
import '../../../widget/responsive_grid.dart';
import '../logic.dart';

class DataRetentionCard extends StatelessWidget {
  final SettingsLogic logic;
  const DataRetentionCard({
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
              leading: Image.asset(data),
              title: Text("Data Retention Policy",style: AppTextStyles.heading3),
            ),
            SizedBox(height: 5,),
            Text("Configure how long the data is store in system",style: AppTextStyles.regularGreySansBody),
            SizedBox(height: 25,),
            ResponsiveGrid(
              children: [
                CustomInputTextField(hintText: '30',controller: logic.logsRetentionController,heading: 'System Logs Retention (Days)',),
                CustomInputTextField(hintText: '90',controller: logic.historyRetentionController,heading: 'Alert History Retention (Days)',),
                CustomInputTextField(hintText: '365',controller: logic.dataRetentionController,heading: 'Diagnostic Data Retention (Days)',),
              ],
            )
          ],
        ),
      ),
    );
  }
}
