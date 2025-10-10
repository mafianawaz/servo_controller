import 'package:flutter/material.dart';

class TaskProgressBar extends StatelessWidget {
  final int completed;
  final int total;
  final Color color;
  final double height;

  const TaskProgressBar({
    super.key,
    required this.completed,
    required this.total,
    this.color = const Color(0xff3ba8f6),
    this.height = 12,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : completed / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

      ],
    );
  }
}
