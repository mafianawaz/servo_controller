import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/machine_details/view.dart';
import 'package:servo_controller/src/module/machines/widget/custom_chip.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import 'package:servo_controller/src/widget/responsive_grid.dart';
import '../../utils/app_decorations.dart';
import '../../utils/constants.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_text_form_field.dart';
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
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,child: Text("Machines",style: AppTextStyles.heading2,)),
                SizedBox(height: 20,),
                ResponsiveGrid(
                  children: [
                    CountCard(title: 'Total Machines', count: '4', icon: bug,),
                    CountCard(title: 'Healthy', count: '3', icon: redDot,),
                    CountCard(title: 'Warning', count: '1', icon: orangeDot,),
                    CountCard(title: 'Critical', count: '1', icon: alert,),
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
                        ResponsiveGrid(
                          spacing: 10,
                          mobileCrossAxisCount: 1,
                          tabletCrossAxisCount: 2,
                          desktopCrossAxisCount: 1,
                          children: [
                            Text("Machine Directory",style: AppTextStyles.heading3,),
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                CustomInputTextField(hintText: "Search by name or email",heading: 'Search',onChange: logic.updateSearch,),
                                Obx(() => CustomDropdown<String>(
                                  items: ["All","Idle", "Running", "Maintenance"],
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
                          ],
                        ),
                        SizedBox(height: 20,),
                        SingleChildScrollView(
                          child: Obx(()=> CustomTable(
                            headers: ["Machine", "Status", "Q-Node", "Last Diagnostic", "Health","Alert", "Actions"],
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => MachineDetailsView()),
                              );
                            },
                            rows: logic.filteredMachines.map((machine) {
                              return  [
                                ListTile(
                                  title: Text(machine.machine, style: AppTextStyles.regularBody,),
                                  subtitle: Text(machine.machineModel, style: AppTextStyles.regularGreyBody,),
                                ),
                                StatusChip(status: machine.status),
                                CustomChip(text: machine.qNode, isOutline: true, color: Colors.black),
                                Text(machine.lastDiagnostic, style: AppTextStyles.regularGreyBody,),
                                HealthChip(health: machine.health),
                                AlertChip(count: machine.alert),
                                Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                              ];
                            }).toList(),
                          ),)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
        });
  }
}
