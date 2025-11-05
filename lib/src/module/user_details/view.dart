import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/user_details/widget/user_info_card.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import '../../utils/app_decorations.dart';
import '../users/widget/table.dart';
import 'logic.dart';

class UsersDetails extends StatelessWidget {
  const UsersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserDetails(),
        builder: (logic){
          return ResponsiveScaffold(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,child: Text("User Name",style: AppTextStyles.heading2,)),
                SizedBox(height: 20,),
                UserInfoCard(username: 'Name', role: 'Technician', email: 'name@gmail.com', status: 'Active', lastActive: '2 hours ago', createdOn: 'January 10, 2025',),
                SizedBox(height: 20,),
                Container(
                  decoration: AppDecorations.cardDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Activity Logs (Last 7 Days)",style: AppTextStyles.heading2,),
                      SizedBox(height: 20,),
                      SingleChildScrollView(
                        child: CustomTable(
                          headers: ["Date", "Action", "Details"],
                          rows: [
                            [
                               Text("July 29, 2025", style: AppTextStyles.regularSansBody),
                               Text("Logged In", style: AppTextStyles.regularGreySansBody),
                               Text("From IP: 192.168.1.15", style: AppTextStyles.regularGreySansBody),
                            ],
                            [
                               Text("July 29, 2025", style: AppTextStyles.regularSansBody),
                               Text("Logged In", style: AppTextStyles.regularGreySansBody),
                               Text("From IP: 192.168.1.15", style: AppTextStyles.regularGreySansBody),
                            ],
                            [
                               Text("July 29, 2025", style: AppTextStyles.regularSansBody),
                               Text("Logged In", style: AppTextStyles.regularGreySansBody),
                               Text("From IP: 192.168.1.15", style: AppTextStyles.regularGreySansBody),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: AppDecorations.cardDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Assigned Machines & Q-Nodes",style: AppTextStyles.heading2,),
                      SizedBox(height: 20,),
                      SingleChildScrollView(
                        child: CustomTable(
                          headers: ["Machine Name", "Q-Node ID", "Status", "Linked Since"],
                          rows: [
                            [
                               Text("Machine-A", style: AppTextStyles.regularSansBody.copyWith(fontWeight: FontWeight.w600),),
                               Text("Q-Node 123", style: AppTextStyles.regularGreySansBody),
                               Text("Online", style: AppTextStyles.regularGreySansBody.copyWith(color: greenColor)),
                               Text("Jan 12, 2025", style: AppTextStyles.regularGreySansBody),
                            ],
                            [
                               Text("Machine-A", style: AppTextStyles.regularSansBody.copyWith(fontWeight: FontWeight.w600),),
                               Text("Q-Node 123", style: AppTextStyles.regularGreySansBody),
                               Text("Online", style: AppTextStyles.regularGreySansBody.copyWith(color: greenColor)),
                               Text("Jan 12, 2025", style: AppTextStyles.regularGreySansBody),
                            ],
                            [
                               Text("Machine-A", style: AppTextStyles.regularSansBody.copyWith(fontWeight: FontWeight.w600),),
                               Text("Q-Node 123", style: AppTextStyles.regularGreySansBody),
                               Text("Online", style: AppTextStyles.regularGreySansBody.copyWith(color: greenColor)),
                               Text("Jan 12, 2025", style: AppTextStyles.regularGreySansBody),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ));
       }
    );
  }

}

