import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';

enum StatusType { critical, warning, info }

class StatusTypeChip extends StatelessWidget {
  final StatusType status;

  const StatusTypeChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    IconData icon;
    String label;

    switch (status) {
      case StatusType.critical:
        bgColor = Colors.red.shade600;
        textColor = Colors.white;
        icon = Icons.error_outline;
        label = "Critical";
        break;
      case StatusType.warning:
        bgColor = Colors.orange.shade600;
        textColor = Colors.white;
        icon = Icons.warning_amber_outlined;
        label = "Warning";
        break;
      case StatusType.info:
      bgColor = Colors.blue.shade100;
        textColor = Colors.blue.shade700;
        icon = Icons.info_outline;
        label = "Info";
        break;
    }

    return Row(
      children: [
        Icon(icon, size: 20, color: bgColor),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: bgColor.withOpacity(status == StatusType.info ? 0.2 : 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: AppTextStyles.regularSansBody.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
