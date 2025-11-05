import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_decorations.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/constants.dart';

class SystemStatusOverview extends StatelessWidget {
  const SystemStatusOverview({super.key});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "healthy":
        return greenColor;
      case "warning":
        return Colors.orange;
      case "critical":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildStatusItem({
    required String title,
    required String value,
    required String status,
  }) {
    final color = _getStatusColor(status);

    return Container(
      width: 365, // 👈 fixed width to keep consistent shape in grid
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regularGreyBody,
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: AppTextStyles.heading3,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                status == "Healthy" ?
                Image.asset(greenDot):
                status == "Warning" ?
                Image.asset(yellowDot):
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 6,),
                Text(
                  status,
                  style: AppTextStyles.regularBody.copyWith(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "System Status Overview",
              style: AppTextStyles.heading3,
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                // 🔹 Adjust width dynamically based on available space
                // double availableWidth = constraints.maxWidth;
                // int crossAxisCount = (availableWidth ~/ 270).clamp(1, 4);

                return Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    _buildStatusItem(
                      title: "Q-Nodes Online",
                      value: "42/45",
                      status: "Healthy",
                    ),
                    _buildStatusItem(
                      title: "System Uptime",
                      value: "99.8%",
                      status: "Healthy",
                    ),
                    _buildStatusItem(
                      title: "Avg Response Time",
                      value: "120ms",
                      status: "Healthy",
                    ),
                    _buildStatusItem(
                      title: "Data Throughput",
                      value: "2.4GB/hr",
                      status: "Warning",
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
