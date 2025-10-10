import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/qnodes/widget/percentage_text.dart';
import '../../utils/app_decorations.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/responsive_scaffold.dart';
import '../dashboard/widget/dashboard_count_card.dart';
import '../machines/widget/custom_chip.dart';
import '../users/widget/table.dart';
import 'logic.dart';

class QNodeView extends StatelessWidget {
  const QNodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: QNodeLogic(),
        builder: (logic){
          return ResponsiveScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text("Q-Node Directory",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: CountCard(title: 'Total Q-Nodes', count: '4', icon: '',)),
                      SizedBox(width: 20,),
                      Expanded(child: CountCard(title: 'Offline', count: '1', icon: '',)),
                      SizedBox(width: 20,),
                      Expanded(child: CountCard(title: 'Online', count: '3', icon: '',)),
                      SizedBox(width: 20,),
                      Expanded(child: CountCard(title: 'Connectivity', count: '75%', icon: '',)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: AppDecorations.cardDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Device Status",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInputTextField(hintText: "Search by name or email",heading: 'Search',),
                              SizedBox(width: 20,),
                              Obx(() => CustomDropdown<String>(
                                items: ["Online", "Offline", "Standby"],
                                value: logic.selectedValue.value,
                                itemLabel: (item) => item,
                                onChanged: (val) {
                                  logic.selectedValue.value = val;
                                },
                                hintText: "All Status",
                                heading: 'Status',
                              )),
                            ],
                          ),
                          SizedBox(height: 20,),
                          SingleChildScrollView(
                            child: CustomTable(
                              headers: ["Q-Node", "Status", "Last Seen", "Connected Machine", "Signal","Battery", "Actions"],
                              onPressed: (){Get.toNamed("/QNodeDetailView");},
                              rows: [
                                [
                                  ListTile(
                                    leading: Icon(Icons.wifi),
                                    title: Text("Primary Water Pump",style: TextStyle(fontSize: 14)),
                                    subtitle: Text("QN-A12",style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  ),
                                  StatusChip(status: "Online"),
                                  Text("2 min ago"),
                                  StatusChip(status: "PUMP-001"),
                                  PercentText(value: 88),
                                  PercentText(value: 92),
                                  Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                                ],
                                [
                                  ListTile(
                                    leading: Icon(Icons.wifi),
                                    title: Text("Primary Water Pump",style: TextStyle(fontSize: 14)),
                                    subtitle: Text("QN-A12",style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  ),
                                  StatusChip(status: "Offline"),
                                  Text("5 hours ago"),
                                  StatusChip(status: "COMP-001"),
                                  PercentText(value: 0),
                                  PercentText(value: 60),
                                  Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                                ],
                                [
                                  ListTile(
                                    leading: Icon(Icons.wifi),
                                    title: Text("Primary Water Pump",style: TextStyle(fontSize: 14)),
                                    subtitle: Text("QN-A12",style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  ),
                                  StatusChip(status: "Standby"),
                                  Text("2 hours ago"),
                                  StatusChip(status: "CONV-001"),
                                  PercentText(value: 65),
                                  PercentText(value: 16),
                                  Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),);
        });
  }
}
