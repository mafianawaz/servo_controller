import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/machine_details/widget/line_chart.dart';
import 'package:servo_controller/src/module/machine_details/widget/outline_icon_button.dart';
import 'package:servo_controller/src/module/machine_details/widget/parameter_count_card.dart';
import 'package:servo_controller/src/module/machine_details/widget/progress_bar.dart';
import 'package:servo_controller/src/module/machine_details/widget/status_card.dart';
import 'package:servo_controller/src/utils/app_decorations.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import '../../widget/responsive_grid.dart';
import '../machines/widget/fault_logs_card.dart';
import 'logic.dart';

class MachineDetailsView extends StatelessWidget {
  const MachineDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MachineDetailsLogic(),
        builder: (logic){
          return ResponsiveScaffold(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text("Machines",style: AppTextStyles.heading2,)),
                  SizedBox(height: 20,),
                  Container(
                    decoration: AppDecorations.cardDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ResponsiveGrid(
                        spacing: 20,
                        mobileCrossAxisCount: 1,
                        tabletCrossAxisCount: 1,
                        desktopCrossAxisCount: 2,
                        children: [
                          Container(
                            decoration: AppDecorations.cardDecoration,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Live Sensor Stream', style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500),),
                                const SizedBox(height: 20),
                                // ✅ Charts become responsive grid items
                                ResponsiveGrid(
                                  spacing: 20,
                                  mobileCrossAxisCount: 1,
                                  tabletCrossAxisCount: 2,
                                  desktopCrossAxisCount: 2,
                                  children: [
                                    CustomLineChart(
                                      title: "RPM",
                                      minY: 1000, maxY: 1400,
                                      spots: [
                                        FlSpot(0, 1220), FlSpot(1, 1260),
                                        FlSpot(2, 1200), FlSpot(3, 1250),
                                        FlSpot(4, 1210),
                                      ],
                                      xLabels: ["00:00","00:01","00:02","00:03","00:04"],
                                    ),
                                    CustomLineChart(
                                      title: "Torque",
                                      minY: 1000, maxY: 1400,
                                      spots: [
                                        FlSpot(0, 1220), FlSpot(1, 1260),
                                        FlSpot(2, 1200), FlSpot(3, 1250),
                                        FlSpot(4, 1210),
                                      ],
                                      xLabels: ["00:00","00:01","00:02","00:03","00:04"],
                                    ),
                                    CustomLineChart(
                                      title: "Load",
                                      minY: 1000, maxY: 1400,
                                      spots: [
                                        FlSpot(0, 1220), FlSpot(1, 1260),
                                        FlSpot(2, 1200), FlSpot(3, 1250),
                                        FlSpot(4, 1210),
                                      ],
                                      xLabels: ["00:00","00:01","00:02","00:03","00:04"],
                                    ),
                                    CustomLineChart(
                                      title: "Temperature",
                                      minY: 1000, maxY: 1400,
                                      spots: [
                                        FlSpot(0, 1220), FlSpot(1, 1260),
                                        FlSpot(2, 1200), FlSpot(3, 1250),
                                        FlSpot(4, 1210),
                                      ],
                                      xLabels: ["00:00","00:01","00:02","00:03","00:04"],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // ✅ Fault logs as a separate grid item
                          FaultLogsCard(
                            timeStamp: 'Sept 10, 10 AM',
                            faultType: 'Overload Spike',
                            severity: 'Medium',
                            status: 'Resolved',
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                  decoration: AppDecorations.cardDecoration,
                  child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ResponsiveGrid(
                    spacing: 20,
                    mobileCrossAxisCount: 1,
                    tabletCrossAxisCount: 1,
                    desktopCrossAxisCount: 2,
                    children: [

                      /// ✅ Left side card (Live Sensor Stream)
                      Container(
                        decoration: AppDecorations.cardDecoration,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Live Sensor Stream',
                              style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 30),
                            Center(
                              child: CircularProgressBar(
                                percent: 0.87,
                                progressColor: Colors.blue,
                                radius: 50,
                                lineWidth: 8,
                              ),
                            ),
                            SizedBox(height: 20),
                            StatusCard(
                              title: 'AI Status',
                              status: 'No predicted fault within next 7 days',
                            ),
                            SizedBox(height: 20),
                            ListTile(
                              leading: Icon(Icons.check_circle_outline, color: Colors.grey.shade400),
                              title: Text(
                                'Q-Node Last Heartbeat',
                                style: AppTextStyles.regularSansBody.copyWith(color: Colors.grey.shade400),
                              ),
                              trailing: Text(
                                '2 min ago',
                                style: AppTextStyles.regularSansBody.copyWith(color: Colors.grey.shade400),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.check_circle_outline, color: Colors.grey.shade400),
                              title: Text(
                                'Session Duration',
                                style: AppTextStyles.regularSansBody.copyWith(color: Colors.grey.shade400),
                              ),
                              trailing: Text(
                                '2 min ago',
                                style: AppTextStyles.regularSansBody.copyWith(color: Colors.grey.shade400),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ✅ Right side card (Servo Parameters)
                      Container(
                        decoration: AppDecorations.cardDecoration,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Servo Parameters',
                              style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 20),

                            ResponsiveGrid(
                              spacing: 20,
                              mobileCrossAxisCount: 1,
                              tabletCrossAxisCount: 2,
                              desktopCrossAxisCount: 2,
                              children: [
                                ParameterCountCard(title: 'Input Voltage', count: '220V'),
                                ParameterCountCard(title: 'Feedback Signals', count: 'Active'),
                                ParameterCountCard(title: 'Cycle Count', count: '1230'),
                                ParameterCountCard(title: 'Runtime Hours', count: '1567'),
                                ParameterCountCard(title: 'Sync Loss Matrics', count: '0.0001%'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ResponsiveGrid(
                      children: [
                        OutlineIconButton(text: 'Export Logs CSV', isFilled: false, icon: Icons.file_download_outlined,),
                        OutlineIconButton(text: 'Download Diagnostic Report PDF', isFilled: false, icon: Icons.picture_as_pdf_outlined,),
                        OutlineIconButton(text: 'End Session', isFilled: true, icon: Icons.stop_circle_outlined,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ));
        });
  }
}

