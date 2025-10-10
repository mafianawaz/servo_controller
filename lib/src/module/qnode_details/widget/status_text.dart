import 'package:flutter/material.dart';

class StatusText extends StatelessWidget {
  final String status;
  const StatusText({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case "healthy":
        color = Colors.green;
        break;
      case "warning":
        color = Colors.orange;
        break;
      case "critical":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return Text(status, style: TextStyle(color: color,fontSize: 14
    ),);
  }
}
