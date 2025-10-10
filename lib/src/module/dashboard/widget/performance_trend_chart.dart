import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_decorations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class QNodesChart extends StatelessWidget {
  QNodesChart({super.key});

  // Mock data for donut chart
  final List<ChartData> chartData = [
    ChartData('Q-Nodes Online', 18, Colors.blue),
    ChartData('Machines', 12, Colors.black),
    ChartData('Pending Tasks', 5, Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
          flex: 1,
          child: Container(
            decoration: AppDecorations.cardDecoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Q-Node Performance Trends",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SfCircularChart(
                          legend: Legend(isVisible: false),
                          series: <DoughnutSeries<ChartData, String>>[
                            DoughnutSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              pointColorMapper: (ChartData data, _) =>
                              data.color,
                              radius: '80%',
                              innerRadius: '60%',
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: chartData
                            .map((data) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                color: data.color,
                              ),
                              const SizedBox(width: 6),
                              Text("${data.y} ${data.x}"),
                            ],
                          ),
                        ))
                            .toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

  }
}

class ChartData {
  final String x;
  final int y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}
