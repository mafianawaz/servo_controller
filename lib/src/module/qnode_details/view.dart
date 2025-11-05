import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/qnode_details/widget/score_progressBar.dart';
import 'package:servo_controller/src/module/qnode_details/widget/summary_items.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import '../../utils/app_decorations.dart';
import '../../widget/responsive_grid.dart';
import '../machine_details/widget/outline_icon_button.dart';
import 'logic.dart';

class QNodeDetailView extends StatelessWidget {
  const QNodeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: QNodeDetailLogic(),
        builder: (logic){
          return ResponsiveScaffold(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ResponsiveGrid(
                  spacing: 20,
                  mobileCrossAxisCount: 1,
                  tabletCrossAxisCount: 1,
                  desktopCrossAxisCount: 2,
                  children: [
                    Text("Q-Node Details",style: AppTextStyles.heading2,),
                    Align(alignment: Alignment.topRight ,child: OutlineIconButton(text: 'Run Diagnostic', isFilled: true, icon: Icons.settings_outlined,fillColor: Colors.blue,)),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: AppDecorations.cardDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                      ResponsiveGrid(
                      spacing: 20,
                      mobileCrossAxisCount: 1,
                      tabletCrossAxisCount: 1,
                      desktopCrossAxisCount: 2,
                      children: [
                        /// Q-Node Summary Card
                        Container(
                          decoration: AppDecorations.cardDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Q-Node Summary", style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                                SizedBox(height: 25),
                                buildSummaryItem("Q-Node ID", "QNode12345"),
                                SizedBox(height: 15),
                                buildSummaryItem("Nickname", "CNC Line 1"),
                                SizedBox(height: 15),
                                buildSummaryItem("Model Type", "QN-VS-100"),
                                SizedBox(height: 15),
                                buildSummaryItem("Serial Number", "SN-2453-8765"),
                                SizedBox(height: 15),
                                buildSummaryItem("Firmware Version", "v1.2.7"),
                              ],
                            ),
                          ),
                        ),

                        /// AI Diagnostic View Card
                        Container(
                          decoration: AppDecorations.cardDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("AI Diagnostic View",
                                    style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    CircleAvatar(radius: 5, backgroundColor: Colors.green),
                                    SizedBox(width: 10),
                                    Text("Low Risk Level",
                                        style: AppTextStyles.regularGreySansBody),
                                  ],
                                ),
                                SizedBox(height: 15),
                                HealthProgressBar(completed: 10, total: 100),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      'Recommended Actions:\nRegular monitoring - No immediate action required.',
                                      style: AppTextStyles.regularSansBody.copyWith(color: Colors.black54),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text("Last Prediction Run:",
                                    style: AppTextStyles.regularSansBody.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54)),
                                SizedBox(height: 5),
                                Text("July 9, 2024",
                                    style: AppTextStyles.regularSansBody.copyWith(fontSize: 13,)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                        SizedBox(height: 20,),
                    ResponsiveGrid(
                      spacing: 20,
                      mobileCrossAxisCount: 1,
                      tabletCrossAxisCount: 1,
                      desktopCrossAxisCount: 2,
                      children: [
                        /// Live Status Card
                        Container(
                          decoration: AppDecorations.cardDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Live Status", style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                                SizedBox(height: 20),
                                ResponsiveGrid(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(radius: 8, backgroundColor: Colors.blue),
                                            SizedBox(width: 10),
                                            Text("Signal Strength",
                                                style: AppTextStyles.regularGreySansBody),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(radius: 8, backgroundColor: Colors.green),
                                            SizedBox(width: 10),
                                            Text("Battery Level",
                                                style: AppTextStyles.regularGreySansBody),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text("85%", style: AppTextStyles.regularSansBody.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                ResponsiveGrid(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.error_outline, color: Colors.red),
                                            SizedBox(width: 10),
                                            Text("Temperature",
                                                style: AppTextStyles.regularGreySansBody),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text("24 C",
                                            style: AppTextStyles.regularSansBody.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(radius: 8, backgroundColor: Colors.blue),
                                            SizedBox(width: 10),
                                            Text("Heartbeat",
                                                style: AppTextStyles.regularGreySansBody),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text("Active",
                                            style: AppTextStyles.regularGreySansBody.copyWith(fontSize: 16,)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// Diagnostic History Card
                        Container(
                          decoration: AppDecorations.cardDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Diagnostic History",
                                    style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
                                SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(child: Text('Date/Time', style: AppTextStyles.regularGreySansBody)),
                                    Expanded(child: Text('Machine', style: AppTextStyles.regularGreySansBody)),
                                    Expanded(child: Text('Status', style: AppTextStyles.regularGreySansBody)),
                                    Expanded(child: Text('Action', style: AppTextStyles.regularGreySansBody)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(color: Colors.grey.shade200),
                                SizedBox(height: 10),

                                historyRow("9 July, 10:00 AM", "Machine A", "Healthy"),
                                SizedBox(height: 10),
                                historyRow("9 July, 10:00 AM", "Machine B", "Warning"),
                                SizedBox(height: 10),
                                historyRow("9 July, 10:00 AM", "Machine C", "Critical"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                        SizedBox(height: 20,),
                        ResponsiveGrid(
                          children: [
                            OutlineIconButton(text: 'Rename Device', isFilled: false, icon: Icons.edit_outlined,onPressed: (){},),
                            OutlineIconButton(text: 'Report Issue', isFilled: false, icon: Icons.bug_report_outlined,onPressed: (){},),
                            OutlineIconButton(text: 'Reboot Device', isFilled: false, icon: Icons.refresh,onPressed: (){},),
                            OutlineIconButton(text: 'Unlink Device', isFilled: false, icon: Icons.delete_outline_outlined,onPressed: (){},),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ));
        });
  }
}
