import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/alert/widget/alert_count_card.dart';
import 'package:servo_controller/src/module/alert/widget/status_chip.dart';
import 'package:servo_controller/src/module/alert/widget/tab_bar_widget.dart';
import 'package:servo_controller/src/module/alert/widget/time_text_widget.dart';
import 'package:servo_controller/src/module/machine_details/widget/outline_icon_button.dart';
import '../../utils/app_decorations.dart';
import '../../widget/responsive_scaffold.dart';
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
          return ResponsiveScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text("Alert and Notifications",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: AlertCountCard(status: 'Critical', count: 2,)),
                      SizedBox(width: 20,),
                      Expanded(child: AlertCountCard(status: 'Warning', count: 2,)),
                      SizedBox(width: 20,),
                      Expanded(child: AlertCountCard(status: 'Unread', count: 2,)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: AppDecorations.cardDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text("Alert History",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                                  subtitle: Text("Recent System Alerts and Notifications",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: Colors.grey),),
                                ),
                              ),
                              Row(
                                children: [
                                  OutlineIconButton(text: 'Mark All Read', isFilled: false, icon: Icons.check_circle_outline),
                                  SizedBox(width: 20,),
                                  OutlineIconButton(text: 'Archive', isFilled: false, icon: Icons.delete_outline_outlined),
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
                            // Apply filter based on toggle
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
                                    Text(row.message),
                                    CustomChip(
                                      text: row.isRead ? "Read" : "Unread",
                                      color: row.isRead ? Colors.grey : Colors.green,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        row.isRead ? SizedBox() :
                                        TextButton.icon(
                                          onPressed: () {},
                                          label: const Text("Read", style: TextStyle(color: Colors.black87)),
                                          icon: const Icon(Icons.check_circle_outline, color: Colors.black87),
                                        ),
                                        const SizedBox(width: 10),
                                        TextButton.icon(
                                          onPressed: () {},
                                          label: const Text("Archive", style: TextStyle(color: Colors.black87)),
                                          icon: const Icon(Icons.delete_outline_outlined, color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ];
                                }).toList(),
                              ),
                            );
                          })

                        ],
                      ),
                    ),

                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
