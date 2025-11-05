import 'package:flutter/material.dart';
import '../../../utils/app_text_style.dart';

class HealthProgressBar extends StatelessWidget {
  final int completed;
  final int total;
  final Color color;
  final double height;

  const HealthProgressBar({
    super.key,
    required this.completed,
    required this.total,
    this.color = Colors.blue,
    this.height = 8,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : completed / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Health Score", style: AppTextStyles.regularGreySansBody,),
            Text("${(progress * 100).toInt()}%",style: AppTextStyles.regularGreySansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.blue),),
          ],
        ),
        const SizedBox(height: 6),

        // Progress Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              // Background
              Container(
                height: height,
                color: Colors.grey.shade200,
              ),
              // Filled part
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: height,
                width: MediaQuery.of(context).size.width * progress,
                color: color,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),

      ],
    );
  }
}
