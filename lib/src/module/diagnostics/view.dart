import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/diagnostics/widget/diagnostic_status.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import 'package:servo_controller/src/widget/custom_button.dart';
import '../../utils/app_decorations.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/responsive_grid.dart';
import '../machines/widget/custom_chip.dart';
import '../users/widget/table.dart';
import 'logic.dart';

class DiagnosticView extends StatelessWidget {
  const DiagnosticView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DiagnosticsLogic(),
        builder: (logic){
          return ResponsiveScaffold(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,child: Text("Diagnostic",style: AppTextStyles.heading2,)),
                SizedBox(height: 20,),
                Container(
                  decoration: AppDecorations.cardDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.filter_alt_outlined),
                            SizedBox(width: 10,),
                            Text("Filter & Search",style: AppTextStyles.regularSansBody.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: ResponsiveGrid(
                            children: [
                              CustomInputTextField(hintText: "Search by machine name",heading: 'Search',onChange: logic.updateSearch,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  width: 200,
                                  child: Obx(() => CustomDropdown<String>(
                                    items: ["All","Healthy", "Critical", "Warning"],
                                    value: logic.selectedValue.value,
                                    itemLabel: (item) => item,
                                    onChanged: (val) {
                                      logic.selectedValue.value = val;
                                    },
                                    hintText: "All Status",
                                    heading: 'Status',
                                  )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  width: 200,
                                  child: Obx(() => CustomDropdown<String>(
                                    items: ["All","Manual", "Auto", "Admin"],
                                    value: logic.selectedTriggerValue.value,
                                    itemLabel: (item) => item,
                                    onChanged: (val) {
                                      logic.selectedTriggerValue.value = val;
                                    },
                                    hintText: "All Types",
                                    heading: 'Trigger Type',
                                  )),
                                ),
                              ),
                            ],
                          ),
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Diagnostic Logs",style: AppTextStyles.heading3,),
                            SizedBox(
                                width: 100,
                                child: CustomButton(text: 'Export', onPressed: (){})),
                          ],
                        ),
                        SizedBox(height: 20,),
                        SingleChildScrollView(
                          child: Obx(()=> CustomTable(
                            headers: ["Timestamp", "Q-Node ID", "Machine", "Status", "Triggered By","Report",],
                            rows: logic.filteredDiagnostics.map((diagnostic) {
                             return [
                                Text(diagnostic.timeStamp, style: AppTextStyles.regularSansBody,),
                                CustomChip(text: diagnostic.qNodeId, isOutline: true, color: Colors.black,),
                                Text(diagnostic.machine, style: AppTextStyles.regularSansBody,),
                                DiagnosticStatus(status: diagnostic.status,),
                               Align(
                                 alignment: Alignment.topLeft,
                                 child: Container(
                                   width: 80,
                                   decoration: BoxDecoration(
                                     color: diagnostic.triggeredBy == 'Auto' ? Colors.blue.shade50 :  Colors.purple.shade50,
                                     border: Border.all(color: diagnostic.triggeredBy == 'Auto' ? Colors.blue.shade100 :  Colors.purple.shade100),
                                     borderRadius: BorderRadius.circular(15),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                     child: Center(child: Text(diagnostic.triggeredBy,style:
                                     AppTextStyles.regularSansBody.copyWith(color: diagnostic.triggeredBy == 'Auto' ? Colors.blue.shade700 :  Colors.purple.shade700),))
                                   ),
                                 ),
                               ),
                                Align(alignment: Alignment.topLeft,child: TextButton.icon(onPressed: (){}, label: Text('View',
                                  style: AppTextStyles.regularSansBody.copyWith(color: Colors.black87),), icon: Icon(Icons.visibility,color: Colors.black87))),
                              ];
                            }).toList(),
                          )),
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

