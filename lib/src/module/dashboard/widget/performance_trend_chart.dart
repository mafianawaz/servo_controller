import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_decorations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../utils/app_text_style.dart';



class ChartData {
  final String x;
  final double y;
  final Color color;
  ChartData(this.x, this.y, this.color);
}

class QNodesChart extends StatelessWidget {
  QNodesChart({super.key});

  final List<ChartData> chartData = [
    ChartData('Q-Nodes Online', 18, Colors.blue),
    ChartData('Machines', 12, Colors.black),
    ChartData('Pending Tasks', 5, Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1024;

        double paddingH = isMobile ? 12 : (isTablet ? 20 : 30);
        double paddingV = isMobile ? 20 : (isTablet ? 30 : 40);
        double legendSpacing = isMobile ? 8 : 12;
        String chartRadius = isMobile
            ? '70%'
            : isTablet
            ? '80%'
            : '85%';
        String innerRadius = isMobile
            ? '55%'
            : isTablet
            ? '60%'
            : '65%';

        return Container(
          decoration: AppDecorations.cardDecoration,
          padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Q-Node Performance Trends",
                style: AppTextStyles.heading3,
              ),
              const SizedBox(height: 20),
              if (isMobile)
                Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: SfCircularChart(
                        legend: Legend(isVisible: false),
                        series: <DoughnutSeries<ChartData, String>>[
                          DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) => data.color,
                            radius: chartRadius,
                            innerRadius: innerRadius,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildLegendList(legendSpacing),
                  ],
                )
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: SizedBox(
                        height: isTablet ? 250 : 280,
                        child: SfCircularChart(
                          legend: Legend(isVisible: false),
                          series: <DoughnutSeries<ChartData, String>>[
                            DoughnutSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              pointColorMapper: (ChartData data, _) => data.color,
                              radius: chartRadius,
                              innerRadius: innerRadius,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      fit: FlexFit.loose,
                      child: _buildLegendList(legendSpacing),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLegendList(double spacing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chartData
          .map(
            (data) => Padding(
          padding: EdgeInsets.only(bottom: spacing),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 10, height: 10, color: data.color),
              const SizedBox(width: 6),
              Text("${data.y} ${data.x}",
                  style: AppTextStyles.regularBody.copyWith(fontSize: 13)),
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}




