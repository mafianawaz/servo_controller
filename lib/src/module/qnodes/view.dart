import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/qnode_details/view.dart';
import 'package:servo_controller/src/module/qnodes/widget/percentage_text.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import 'package:servo_controller/src/widget/responsive_grid.dart';
import '../../utils/app_decorations.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_text_form_field.dart';
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
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,child: Text("Q-Node Directory",style: AppTextStyles.heading2,)),
                SizedBox(height: 20,),
                ResponsiveGrid(
                  children: [
                    CountCard(title: 'Total Q-Nodes', count: '4', icon: signal,),
                    CountCard(title: 'Offline', count: '1', icon: noSignal,),
                    CountCard(title: 'Online', count: '3', icon: greenSignal,),
                    CountCard(title: 'Connectivity', count: '75%', icon: blueDot,),
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
                            Text("Device Status",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                CustomInputTextField(hintText: "Search by name",heading: 'Search',onChange: logic.updateSearch,),
                                Obx(() => CustomDropdown<String>(
                                  items: ["All","Online", "Offline", "Standby"],
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
                            headers: ["Q-Node", "Status", "Last Seen", "Connected Machine", "Signal","Battery", "Actions"],
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => QNodeDetailView()),
                              );

                            },
                            rows: logic.filteredQNodes.map((node) {
                              return [
                                ListTile(
                                  leading: node.status == "Offline" ?
                                  Icon(Icons.wifi_off, color: Colors.red,):
                                  node.status == "Standby" ?
                                  Icon(Icons.wifi, color: Colors.orange.shade400,):
                                  Icon(Icons.wifi, color: Colors.blue,),
                                  title: Text(node.qNode, style: AppTextStyles.regularBody),
                                  subtitle: Text(node.qNodeModel,style: AppTextStyles.regularGreyBody.copyWith(color: Colors.grey, fontSize: 12)),
                                ),
                                StatusChip(status: node.status),
                                Text(node.lastSeen,style: AppTextStyles.regularBody,),
                                CustomChip(text: node.connectedMachine, isOutline: true, color: Colors.black),
                                PercentText(value: node.signal),
                                PercentText(value: node.battery),
                                Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                              ];
                            }).toList(),


                          ),),
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
