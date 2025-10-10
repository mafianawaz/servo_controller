import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/machines/widget/custom_chip.dart';
import '../../utils/app_decorations.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/responsive_scaffold.dart';
import '../dashboard/widget/dashboard_count_card.dart';
import '../users/widget/table.dart';
import 'logic.dart';

class MachineView extends StatelessWidget {
  const MachineView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MachineLogic(),
        builder: (logic){
          return ResponsiveScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text("Machines",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: CountCard(title: 'Total Machines', count: '4', icon: '',)),
                      SizedBox(width: 20,),
                      Expanded(child: CountCard(title: 'Healthy', count: '3', icon: '',)),
                      SizedBox(width: 20,),
                      Expanded(child: CountCard(title: 'Warning', count: '1', icon: '',)),
                      SizedBox(width: 20,),
                      Expanded(child: CountCard(title: 'Critical', count: '1', icon: '',)),
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
                          Text("Machine Directory",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInputTextField(hintText: "Search by name or email",heading: 'Search',),
                              SizedBox(width: 20,),
                              Obx(() => CustomDropdown<String>(
                                items: ["Idle", "Running", "Maintenance"],
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
                              headers: ["Machine", "Status", "Q-Node", "Last Diagnostic", "Health","Alert", "Actions"],
                              onPressed: (){Get.toNamed("/MachineDetailsView");},
                              rows: [
                                [
                                  Text("Primary Water Pump"),
                                  const StatusChip(status: "Running"),
                                  CustomChip(text: 'QN-A12', color: Colors.grey),
                                  Text("2 hours ago"),
                                  const HealthChip(health: "Good"),
                                  const AlertChip(count: 0),
                                  Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                                ],
                                [
                                  Text("Primary Water Pump"),
                                  const StatusChip(status: "Idle"),
                                  CustomChip(text: 'QN-A12', color: Colors.grey),
                                  Text("2 hours ago"),
                                  const HealthChip(health: "Warning"),
                                  const AlertChip(count: 5),
                                  Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                                ],
                                [
                                  Text("Primary Water Pump"),
                                  const StatusChip(status: "Maintenance"),
                                  CustomChip(text: 'QN-A12', color: Colors.grey),
                                  Text("2 hours ago"),
                                  const HealthChip(health: "Critical"),
                                  const AlertChip(count: 0),
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
