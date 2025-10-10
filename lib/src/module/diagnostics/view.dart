import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/widget/custom_button.dart';
import '../../utils/app_decorations.dart';
import '../../widget/custom_dropdown_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/responsive_scaffold.dart';
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
          return ResponsiveScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text("Diagnostic",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
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
                              Text("Filter & Search",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              CustomInputTextField(hintText: "Search by name or email",heading: 'Search',),
                              SizedBox(width: 15,),
                              SizedBox(
                                width: 200,
                                child: Obx(() => CustomDropdown<String>(
                                  items: ["Healthy", "Critical", "Warning"],
                                  value: logic.selectedValue.value,
                                  itemLabel: (item) => item,
                                  onChanged: (val) {
                                    logic.selectedValue.value = val;
                                  },
                                  hintText: "All Status",
                                  heading: 'Status',
                                )),
                              ),
                              SizedBox(width: 15,),
                              SizedBox(
                                width: 200,
                                child: Obx(() => CustomDropdown<String>(
                                  items: ["Manual", "Auto", "Admin"],
                                  value: logic.selectedTriggerValue.value,
                                  itemLabel: (item) => item,
                                  onChanged: (val) {
                                    logic.selectedTriggerValue.value = val;
                                  },
                                  hintText: "All Types",
                                  heading: 'Trigger Type',
                                )),
                              ),
                            ],
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
                              Text("Diagnostic Logs",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                              SizedBox(
                                width: 100,
                                  child: CustomButton(text: 'Export', onPressed: (){})),
                            ],
                          ),
                          SizedBox(height: 20,),
                          SingleChildScrollView(
                            child: CustomTable(
                              headers: ["Timestamp", "Q-Node ID", "Machine", "Status", "Triggered By","Report",],
                              rows: [
                                [
                                  Text("July 8, 10:20 AM"),
                                  CustomChip(text: 'QN-A12', isOutline: true, color: Colors.black,),
                                  Text('Machine A'),
                                  // const IconStatusChip(label: 'Healthy', color: Colors.green,icon: Icons.check_circle_outline,filled: true,),
                                  CustomChip(text: 'Auto', color: Colors.deepPurpleAccent),
                                  Align(alignment: Alignment.topLeft,child: TextButton.icon(onPressed: (){}, label: Text('View', style: TextStyle(color: Colors.black87),), icon: Icon(Icons.visibility,color: Colors.black87))),
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
