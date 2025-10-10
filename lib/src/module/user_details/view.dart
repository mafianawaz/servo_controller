import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:servo_controller/src/module/user_details/widget/user_info_card.dart';
import '../../utils/app_decorations.dart';
import '../../widget/responsive_scaffold.dart';
import '../users/widget/table.dart';
import 'logic.dart';

class UsersDetails extends StatelessWidget {
  const UsersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserDetails(),
        builder: (logic){
          return ResponsiveScaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft,child: Text("User Name",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 20,),
                    UserInfoCard(username: 'Name', role: 'Technician', email: 'name@gmail.com', status: 'Active', lastActive: '2 hours ago', createdOn: 'January 10, 2025',),
                    SizedBox(height: 20,),
                    Container(
                      decoration: AppDecorations.cardDecoration,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Activity Logs (Last 7 Days)",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 20,),
                          SingleChildScrollView(
                            child: CustomTable(
                              headers: ["Date", "Action", "Details"],
                              rows: [
                                [
                                  const Text("July 29, 2025", style: TextStyle(color: Colors.black)),
                                  const Text("Logged In", style: TextStyle(color: Colors.grey)),
                                  const Text("From IP: 192.168.1.15", style: TextStyle(color: Colors.grey)),
                                ],
                                [
                                  const Text("July 29, 2025", style: TextStyle(color: Colors.black)),
                                  const Text("Logged In", style: TextStyle(color: Colors.grey)),
                                  const Text("From IP: 192.168.1.15", style: TextStyle(color: Colors.grey)),
                                ],
                                [
                                  const Text("July 29, 2025", style: TextStyle(color: Colors.black)),
                                  const Text("Logged In", style: TextStyle(color: Colors.grey)),
                                  const Text("From IP: 192.168.1.15", style: TextStyle(color: Colors.grey)),
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
                          Text("Assigned Machines & Q-Nodes",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 20,),
                          SingleChildScrollView(
                            child: CustomTable(
                              headers: ["Machine Name", "Q-Node ID", "Status", "Linked Since"],
                              rows: [
                                [
                                  const Text("Machine-A", style: TextStyle(fontWeight: FontWeight.w600),),
                                  const Text("Q-Node 123", style: TextStyle(color: Colors.grey)),
                                  const Text("Online", style: TextStyle(color: Colors.green)),
                                  const Text("Jan 12, 2025", style: TextStyle(color: Colors.grey)),
                                ],
                                [
                                  const Text("Machine-A", style: TextStyle(fontWeight: FontWeight.w600),),
                                  const Text("Q-Node 123", style: TextStyle(color: Colors.grey)),
                                  const Text("Online", style: TextStyle(color: Colors.green)),
                                  const Text("Jan 12, 2025", style: TextStyle(color: Colors.grey)),
                                ],
                                [
                                  const Text("Machine-A", style: TextStyle(fontWeight: FontWeight.w600),),
                                  const Text("Q-Node 123", style: TextStyle(color: Colors.grey)),
                                  const Text("Online", style: TextStyle(color: Colors.green)),
                                  const Text("Jan 12, 2025", style: TextStyle(color: Colors.grey)),
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
              ),
            ),
          );
       }
    );
  }

}

