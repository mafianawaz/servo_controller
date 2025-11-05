import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/alert/widget/alert_count_card.dart';
import 'package:servo_controller/src/module/alert/widget/status_chip.dart';
import 'package:servo_controller/src/module/alert/widget/tab_bar_widget.dart';
import 'package:servo_controller/src/module/alert/widget/time_text_widget.dart';
import 'package:servo_controller/src/module/machine_details/widget/outline_icon_button.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import '../../utils/app_decorations.dart';
import '../../widget/responsive_grid.dart';
import '../machines/widget/custom_chip.dart';
import '../users/widget/table.dart';
import 'logic.dart';

class AlertView extends StatelessWidget {
  const AlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AlertLogic(),
        builder: (logic){
          return ResponsiveScaffold(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.topLeft,child: Text("Alert and Notifications",style: AppTextStyles.heading2,)),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topLeft,
                  child: ResponsiveGrid(
                    children: [
                      AlertCountCard(status: 'Critical', count: 2,),
                      AlertCountCard(status: 'Warning', count: 2,),
                      AlertCountCard(status: 'Unread', count: 2,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              Container(
                decoration: AppDecorations.cardDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
              ResponsiveGrid(
                      spacing: 10,
                      mobileCrossAxisCount: 1,
                      tabletCrossAxisCount: 2,
                      desktopCrossAxisCount: 2,
                    children: [
                    ListTile(
                    title: Text(
                      "Alert History",
                      style: AppTextStyles.heading3,
                    ),
                    subtitle: Text(
                      "Recent System Alerts and Notifications",
                      style: AppTextStyles.regularGreySansBody,
                    ),
                    ),
                   Wrap(
                    spacing: 5,
                    runSpacing: 10, // spacing between rows when wrapped
                    alignment: WrapAlignment.end,
                    children: [
                      OutlineIconButton(
                        text: 'Mark All Read',
                        isFilled: false,
                        icon: Icons.check_circle_outline,
                      ),
                      OutlineIconButton(
                        text: 'Archive',
                        isFilled: false,
                        icon: Icons.delete_outline_outlined,
                      ),
                    ],
                  ),
                  ],
                ),
              SizedBox(height: 20,),
              Obx(() => CustomToggle(
               options: ["All", "Critical", "Warning", "Info"],
               selectedIndex: logic.selectedIndex.value,
               onChanged: logic.changeIndex,
               )),
              SizedBox(height: 20,),
               Obx(() {
                List<AlertRow> filtered = logic.alerts;
                switch (logic.selectedIndex.value) {
                  case 1:
                    filtered = logic.alerts.where((a) => a.status == StatusType.critical).toList();
                  break;
                  case 2:
                    filtered = logic.alerts.where((a) => a.status == StatusType.warning).toList();
                    break;
                  case 3:
                    filtered = logic.alerts.where((a) => a.status == StatusType.info).toList();
                    break;
                  default:
                    filtered = logic.alerts; // All
                }
                return SingleChildScrollView(
                  child: CustomTable(
                    headers: ["Time", "Type", "Related To", "Message", "Status", "Action"],
                    rows: filtered.map((row) {
                      return [
                        TimeAgoWidget(dateTime: row.time, mostRecentTime: logic.alerts.first.time),
                        StatusTypeChip(status: row.status),
                        CustomChip(text: row.relatedTo, isOutline: true, color: Colors.black),
                        Text(row.message, style: AppTextStyles.regularSansBody,),
                        CustomChip(
                          text: row.isRead ? "Read" : "Unread",
                          color: row.isRead ? Colors.grey : Colors.green,
                        ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          if (!row.isRead)
                            TextButton.icon(
                              icon: Icon(Icons.check_circle_outline, size: 18, color: Colors.black87,),
                              onPressed: () {},
                              label: Text("Read", style: AppTextStyles.regularSansBody.copyWith(color: Colors.black87)),
                            ),
                          TextButton.icon(
                            icon: Icon(Icons.delete_outline, size: 18, color: Colors.black87,),
                            onPressed: () {},
                            label: Text("Archive" ,style: AppTextStyles.regularSansBody.copyWith(color: Colors.black87)),
                          ),
                        ],
                      ),
                      ];
                    }).toList(),
                  ),
                );
               })
                   ],),
                  ),
                ),
              ],
            ),
          ));
        }
    );
  }
}
