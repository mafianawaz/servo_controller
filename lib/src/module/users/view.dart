import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/users/widget/status_chip.dart';
import 'package:servo_controller/src/module/users/widget/table.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import 'package:servo_controller/src/widget/custom_dropdown_button.dart';
import 'package:servo_controller/src/widget/custom_text_form_field.dart';
import 'package:servo_controller/src/widget/responsive_grid.dart';
import '../../utils/app_decorations.dart';
import '../dashboard/widget/dashboard_count_card.dart';
import '../user_details/view.dart';
import 'logic.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UsersLogic(),
      builder: (logic){
      return ResponsiveScaffold(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft,child: Text("Manage Users",style: AppTextStyles.heading2,)),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.topLeft,
              child: ResponsiveGrid(
                children: [
                  CountCard(title: 'Total Users', count: '4', icon: users,),
                  CountCard(title: 'Active Users', count: '3', icon: activeUser,),
                  CountCard(title: 'Disabled Users', count: '1', icon: disable,),
                ],
              ),
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
                        Text("User Directory",style: AppTextStyles.heading2.copyWith(fontWeight: FontWeight.w500),),
                        Wrap(
                          spacing: 5,
                          runSpacing: 10,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            CustomInputTextField(hintText: "Search by name or email",heading: 'Search',onChange: logic.updateSearch,leftIconPath: search,),
                            Obx(() => CustomDropdown<String>(
                              items: ["All","Admin", "Viewer", "Technician"],
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
                      ],
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      child: Obx(()=> CustomTable(
                        headers: ["Name", "Email", "Role", "Status", "Last Active", "Actions"],
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => UsersDetails()),
                          );
                        },
                        rows: logic.filteredUsers.map((user) {
                          return [
                            Text(user.name,style: AppTextStyles.regularSansBody.copyWith(fontWeight: FontWeight.w500),),
                            Text(user.email,style: AppTextStyles.regularGreySansBody,),
                            UserRoleChip(
                                text: user.role,
                                bg: user.role == "Admin" ? primaryColor : user.role == "Technician" ? Colors.grey.shade200: Colors.white,
                                textColor: user.role == "Admin" ? Colors.white : Colors.black),
                            UserStatusChip(text: user.status,),
                            Text(user.lastActive, style: AppTextStyles.regularSansBody,),
                            Align(alignment: Alignment.topLeft,child: Icon(Icons.more_horiz)),
                          ];
                        }).toList(),
                      ),),
                    ),
                  ]
                ),
              ),
            ),
          ],
        ),
      ));
    });
  }
}
