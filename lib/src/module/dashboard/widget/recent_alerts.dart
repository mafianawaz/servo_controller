import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/dashboard/logic.dart';
import 'package:servo_controller/src/widget/custom_outline_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../utils/app_decorations.dart';

class RecentAlerts extends StatelessWidget {
  final DashboardLogic logic;
  const RecentAlerts({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: AppDecorations.cardDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Recent Alerts",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10,),
                    if (logic.newAlertsCount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${logic.newAlertsCount} New",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 330,
                  child: ListView.builder(
                    itemCount: logic.alerts.length,
                    itemBuilder: (context, index) {
                      final alert = logic.alerts[index];

                      return GestureDetector(
                        onTap: () => logic.markAsRead(index),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: alert.isNew
                                  ? Colors.blue.shade50
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade200)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_time, size: 18, color: Colors.blueGrey),
                                        SizedBox(width: 10,),
                                        Text(timeago.format(alert.time), style: const TextStyle(fontSize: 14,color: Colors.blueGrey),),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: alert.color.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        alert.type,
                                        style: TextStyle(
                                            color: alert.color, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  alert.message,
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 10),
                                if (alert.isNew)
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                              ],
                            ),
                          ),

                        ),
                      );
                    },
                  ),
                ),


                const SizedBox(height: 10),
                Center(child: CustomOutlineButton(text: 'View All Alerts', onPressed: (){})),
              ],
            );
          }),
        ),
      ),
    );
  }
}
