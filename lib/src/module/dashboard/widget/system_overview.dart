import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_decorations.dart';

class SystemStatusOverview extends StatelessWidget {
  const SystemStatusOverview({super.key});

  // Get color based on status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "healthy":
        return Colors.green;
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 120),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
            const Text(
              "System Status Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          ],
        ),
      ),
    );
  }
}
