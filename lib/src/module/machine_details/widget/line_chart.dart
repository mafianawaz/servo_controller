import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_text_style.dart';

class CustomLineChart extends StatelessWidget {
  final String title;
  final List<FlSpot> spots; // chart data points
  final double minY;
  final double maxY;
  final List<String> xLabels; // time labels (00:00, 00:01...)

  const CustomLineChart({
    super.key,
    required this.title,
    required this.spots,
    required this.minY,
    required this.maxY,
    required this.xLabels,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chart title
          Text(
            title,
            style:  AppTextStyles.regularSansBody.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          Expanded(
            child: LineChart(
              LineChartData(
                minY: minY,
                maxY: maxY,
                gridData: FlGridData(show: true, horizontalInterval: 200),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40,),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < xLabels.length) {
                          return Text(
                            xLabels[index],
                            style: AppTextStyles.regularSansBody.copyWith(fontSize: 10),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                  left: BorderSide(color: Colors.grey, width: 1),   // Y axis
                  bottom: BorderSide(color: Colors.grey, width: 1), // X axis
                  right: BorderSide.none,
                  top: BorderSide.none,
                ),),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    barWidth: 2,
                    color: Colors.blue,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
