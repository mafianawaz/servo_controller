import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/app_text_style.dart';

class CircularProgressBar extends StatelessWidget {
  final double percent; // value between 0 and 1
  final String label;
  final Color progressColor;
  final Color backgroundColor;
  final double radius;
  final double lineWidth;

  const CircularProgressBar({
    super.key,
    required this.percent,
    this.label = "",
    this.progressColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.radius = 80,
    this.lineWidth = 10,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: lineWidth,
      animation: true,
      percent: percent,
      center: Text(
        label.isNotEmpty ? label : "${(percent * 100).toInt()}%",
        style:  AppTextStyles.regularSansBody.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: backgroundColor.withOpacity(0.2),
      progressColor: progressColor,
    );
  }
}
