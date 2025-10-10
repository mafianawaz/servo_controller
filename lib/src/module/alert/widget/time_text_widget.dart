import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgoWidget extends StatelessWidget {
  final DateTime dateTime;
  final DateTime? mostRecentTime; // optional for marking the latest one

  const TimeAgoWidget({
    super.key,
    required this.dateTime,
    this.mostRecentTime,
  });

  @override
  Widget build(BuildContext context) {
    final isMostRecent = mostRecentTime != null && dateTime == mostRecentTime;
    final timeAgoText = timeago.format(dateTime, allowFromNow: true);

    return Row(
      children: [
        if (isMostRecent)
          Container(
            margin: const EdgeInsets.only(right: 6),
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        Text(
          timeAgoText,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
