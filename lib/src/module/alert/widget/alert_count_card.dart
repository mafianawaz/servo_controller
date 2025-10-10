import 'package:flutter/material.dart';

class AlertCountCard extends StatelessWidget {
  final String status; // critical, warning, unread
  final int count;

  const AlertCountCard({
    super.key,
    required this.status,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    // Default values
    Color borderColor = Colors.grey;
    Color bgColor = Colors.grey.shade50;
    Color iconBgColor = Colors.grey.shade100;
    IconData icon = Icons.info_outline;
    String title = status;

    // Customize based on status
    switch (status.toLowerCase()) {
      case 'critical':
        borderColor = Colors.red.shade300;
        bgColor = Colors.red.shade50;
        iconBgColor = Colors.red.shade100;
        icon = Icons.warning_amber_outlined;
        title = "Critical Alert";
        break;

      case 'warning':
        borderColor = Colors.orange.shade500;
        bgColor = Colors.orange.shade50;
        iconBgColor = Colors.orange.shade100;
        icon = Icons.warning_amber_outlined;
        title = "Warning";
        break;

      case 'unread':
        borderColor = Colors.blue.shade300;
        bgColor = Colors.blue.shade50;
        iconBgColor = Colors.blue.shade100;
        icon = Icons.check_circle_outline;
        title = "Unread";
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: borderColor),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: borderColor,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
