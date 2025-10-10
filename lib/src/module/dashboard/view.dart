import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/dashboard/widget/dashboard_count_card.dart';
import 'package:servo_controller/src/module/dashboard/widget/performance_trend_chart.dart';
import 'package:servo_controller/src/module/dashboard/widget/recent_alerts.dart';
import 'package:servo_controller/src/module/dashboard/widget/system_overview.dart';
import '../../widget/responsive_scaffold.dart';
import 'logic.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardLogic(),
      builder: (logic) {
        return ResponsiveScaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft,child: Text("Dashboard",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: CountCard(title: 'Total Users', count: '122', icon: '',)),
                    SizedBox(width: 10,),
                    Expanded(child: CountCard(title: 'Active Q-Nodes', count: '45', icon: '',)),
                    SizedBox(width: 10,),
                    Expanded(child: CountCard(title: 'Machine Registered', count: '35', icon: '',)),
                    SizedBox(width: 10,),
                    Expanded(child: CountCard(title: 'Critical Alerts', count: '6', icon: '',)),
                  ],
                ),
                SizedBox(height: 20,),
                SystemStatusOverview(),
                SizedBox(height: 20,),
                Row(
                  children: [
                    QNodesChart(),
                    SizedBox(width: 15,),
                    RecentAlerts(logic: logic,),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

