import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/users/widget/table.dart';
import 'package:servo_controller/src/widget/custom_dropdown_button.dart';
import 'package:servo_controller/src/widget/custom_text_form_field.dart';
import '../../utils/app_decorations.dart';
import '../../widget/responsive_scaffold.dart';
import '../dashboard/widget/dashboard_count_card.dart';
import 'logic.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UsersLogic(),
      builder: (logic){
      return ResponsiveScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
          children: [
            Align(alignment: Alignment.topLeft,child: Text("Manage Users",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: CountCard(title: 'Total Users', count: '4', icon: '',)),
                SizedBox(width: 20,),
                Expanded(child: CountCard(title: 'Active Users', count: '3', icon: '',)),
                SizedBox(width: 20,),
                Expanded(child: CountCard(title: 'Disabled Users', count: '1', icon: '',)),
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
                    Text("User Directory",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomInputTextField(hintText: "Search by name or email",heading: 'Search',),
                        SizedBox(width: 20,),
                        Obx(() => CustomDropdown<String>(
                          items: ["Admin", "Viewer", "Technician"],
                          value: logic.selectedValue.value,
                          itemLabel: (item) => item,
                          onChanged: (val) {
                            logic.selectedValue.value = val;
                          },
                          hintText: "All Roles",
                          heading: 'Roles',
                        )),
                      ],
                    ),
                    SizedBox(height: 20,),
                  SingleChildScrollView(
                  child: CustomTable(
                    headers: ["Name", "Email", "Role", "Status", "Last Active", "Actions"],
                    onPressed: (){Get.toNamed("/UsersDetails");},
                    rows: [
                      [
                        const Text("Sarah Khan",style: TextStyle(fontWeight: FontWeight.w500),),
                        const Text("sarah@example.com"),
                        statusChip("Technician", Colors.grey.shade200, Colors.black87),
                        statusChip("Active", Colors.green, Colors.white),
                        const Text("2 hours ago"),
                        Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                      ],
                      [
                        const Text("Imran Patel"),
                        const Text("imran@example.com"),
                        statusChip("Viewer", Colors.grey.shade200, Colors.black87),
                        statusChip("Disabled", Colors.grey.shade200, Colors.black87),
                        const Text("1 week ago"),
                        Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                      ],
                      [
                        const Text("Ahmed Hassan"),
                        const Text("ahmed@example.com"),
                        statusChip("Admin", Colors.blue, Colors.white),
                        statusChip("Active", Colors.green, Colors.white),
                        const Text("1 hour ago"),
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

  static Widget statusChip(String text, Color bg, Color textColor) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
