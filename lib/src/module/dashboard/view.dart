import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servo_controller/src/module/dashboard/widget/dashboard_count_card.dart';
import 'package:servo_controller/src/module/dashboard/widget/performance_trend_chart.dart';
import 'package:servo_controller/src/module/dashboard/widget/recent_alerts.dart';
import 'package:servo_controller/src/module/dashboard/widget/system_overview.dart';
import 'package:servo_controller/src/utils/responsive_scaffold.dart';
import 'package:servo_controller/src/widget/responsive_grid.dart';
import '../../utils/app_text_style.dart';
import '../../utils/constants.dart';
import 'logic.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardLogic(),
      builder: (logic) {
        return ResponsiveScaffold(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topLeft,child: Text("Dashboard",style: AppTextStyles.heading2,)),
              SizedBox(height: 20,),
              ResponsiveGrid(
                children: [
                  CountCard(title: 'Total Users', count: '122', icon: users,),
                  CountCard(title: 'Active Q-Nodes', count: '45', icon: active,),
                  CountCard(title: 'Machine Registered', count: '35', icon: machine,),
                  CountCard(title: 'Critical Alerts', count: '6', icon: alert,),
                ],
              ),
              SizedBox(height: 20,),
              SystemStatusOverview(),
              SizedBox(height: 20,),
              SingleChildScrollView(
                child: ResponsiveGrid(
                  spacing: 15,
                  mobileCrossAxisCount: 1,
                  tabletCrossAxisCount: 2,
                  desktopCrossAxisCount: 2,
                  children: [
                    QNodesChart(),
                    RecentAlerts(logic: logic),
                  ],
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}

