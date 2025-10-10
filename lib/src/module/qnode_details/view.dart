import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/qnode_details/widget/score_progressBar.dart';
import 'package:servo_controller/src/module/qnode_details/widget/status_text.dart';
import '../../utils/app_decorations.dart';
import '../../widget/responsive_scaffold.dart';
import '../machine_details/widget/outline_icon_button.dart';
import 'logic.dart';

class QNodeDetailView extends StatelessWidget {
  const QNodeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: QNodeDetailLogic(),
        builder: (logic){
          return ResponsiveScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Q-Node Details",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      OutlineIconButton(text: 'Run Diagnostic', isFilled: true, icon: Icons.settings_outlined,fillColor: Colors.blue,),
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
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: AppDecorations.cardDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Q-Node Summary",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                        SizedBox(height: 25,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Q-Node ID",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                                  SizedBox(height: 5,),
                                                  Text("QNode12345",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),

                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Nickname",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                                  SizedBox(height: 5,),
                                                  Text("CNC Line 1",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Model Type",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                                  SizedBox(height: 5,),
                                                  Text("QN-VS-100",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),

                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Serial Number",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                                  SizedBox(height: 5,),
                                                  Text("SN-2453-8765",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Firmware Version",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                                  SizedBox(height: 5,),
                                                  Text("v1.2.7",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Container(
                                  decoration: AppDecorations.cardDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("AI Diagnostic View",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                        SizedBox(height: 25,),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.green,
                                            ),
                                            SizedBox(width: 10,),
                                            Text("Low Risk Level",style: TextStyle(fontSize: 14, color: Colors.grey),),
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        HealthProgressBar(completed: 10, total: 100,),
                                        SizedBox(height: 15,),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade50,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Recommended Actions:',style: TextStyle(fontSize: 14, color: Colors.black54),),
                                                    SizedBox(height: 8,),
                                                    Text('Regular monitoring - No immediate action required.',style: TextStyle(fontSize: 14, color: Colors.black54),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15,),
                                        Text("Last Prediction Run:",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black54),),
                                        SizedBox(height: 5,),
                                        Text("July 9, 2024",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: AppDecorations.cardDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Text("Live Status",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 8,
                                                        backgroundColor: Colors.blue,
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Text("Signal Strength",style: TextStyle(fontSize: 14, color: Colors.grey),),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 8,
                                                        backgroundColor: Colors.green,
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Text("Battery Level",style: TextStyle(fontSize: 14, color: Colors.grey),),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Text("85%",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.error_outline,color: Colors.red,),
                                                      SizedBox(width: 10,),
                                                      Text("Temperature",style: TextStyle(fontSize: 14, color: Colors.grey),),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Text("24 C",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 8,
                                                        backgroundColor: Colors.blue,
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Text("Heartbeat",style: TextStyle(fontSize: 14, color: Colors.grey),),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Text("Active",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Container(
                                  decoration: AppDecorations.cardDecoration,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Diagnostic History",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            Expanded(child: Text('Date/Time',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: Text('Machine',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: Text('Status',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: Text('Action',style: TextStyle(fontSize: 14, color: Colors.grey),)),

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Divider(color: Colors.grey.shade200,),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Expanded(child: Text('9 July, 10:00 AM',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: Text('Machine A',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: StatusText(status: 'Healthy',)),
                                            Expanded(child: Align(alignment: Alignment.topLeft,child: TextButton(onPressed: (){}, child: Text('View Report',style: TextStyle(fontSize: 14, color: Colors.blue),)))),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Expanded(child: Text('9 July, 10:00 AM',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: Text('Machine B',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: StatusText(status: 'Warning',)),
                                            Expanded(child: Align(alignment: Alignment.topLeft,child: TextButton(onPressed: (){}, child: Text('View Report',style: TextStyle(fontSize: 14, color: Colors.blue),)))),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Expanded(child: Text('9 July, 10:00 AM',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: Text('Machine C',style: TextStyle(fontSize: 14, color: Colors.grey),)),
                                            Expanded(child: StatusText(status: 'Critical',)),
                                            Expanded(child: Align(alignment: Alignment.topLeft,child: TextButton(onPressed: (){}, child: Text('View Report',style: TextStyle(fontSize: 14, color: Colors.blue),)))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: OutlineIconButton(text: 'Rename Device', isFilled: false, icon: Icons.edit_outlined,onPressed: (){},)),
                              SizedBox(width: 25,),
                              Expanded(child: OutlineIconButton(text: 'Report Issue', isFilled: false, icon: Icons.bug_report_outlined,onPressed: (){},)),
                              SizedBox(width: 25,),
                              Expanded(child: OutlineIconButton(text: 'Reboot Device', isFilled: false, icon: Icons.refresh,onPressed: (){},)),
                              SizedBox(width: 25,),
                              Expanded(child: OutlineIconButton(text: 'Unlink Device', isFilled: false, icon: Icons.delete_outline_outlined,onPressed: (){},)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),);
        });
  }
}
