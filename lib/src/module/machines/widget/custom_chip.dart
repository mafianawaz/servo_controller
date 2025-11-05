import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;
  final bool isOutline;
  final bool isIcon;

  const CustomChip({
    super.key,
    required this.text,
    required this.color,
    this.icon,
     this.isOutline = false,
     this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: isOutline ? Colors.white : color.withOpacity(0.1),
          border: Border.all(color: isOutline ? Colors.grey.shade300 : color, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: isIcon ?
              Row(
                children: [
                  Icon(icon, size: 14,),
                  const SizedBox(width: 4),
                  Text(
                    text,
                    style: AppTextStyles.regularBody.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isOutline ? Colors.black : color,
                    ),
                  ),
                ],
              ) :
          Text(
            text,
            style: AppTextStyles.regularBody.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isOutline ? Colors.black : color,
            ),
          ),
        ),
      ),
    );
  }
}


class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case "running"|| "online":
        color = Colors.blue;
        break;
      case "offline":
        color = Colors.red;
        break;
      case "idle":
        color = Colors.grey;
        break;
      case "maintenance" || "standby":
        color = Colors.orange;
        break;
      default:
        color = Colors.black;
    }
    return CustomChip(text: status, color: color);
  }
}


class HealthChip extends StatelessWidget {
  final String health;
  const HealthChip({super.key, required this.health});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (health.toLowerCase()) {
      case "good":
        color = Colors.blue;
        break;
      case "warning":
        color = Colors.amber;
        break;
      case "critical":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return CustomChip(text: health, color: color);
  }
}


class AlertChip extends StatelessWidget {
  final int count;
  const AlertChip({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      return  Text(
        "None",
        style: AppTextStyles.regularGreyBody.copyWith(fontSize: 12,),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.warning_amber_rounded,
            size: 14, color: Colors.red),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: AppTextStyles.regularBody.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

