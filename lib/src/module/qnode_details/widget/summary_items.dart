import 'package:flutter/material.dart';
import 'package:servo_controller/src/module/qnode_details/widget/status_text.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';

Widget buildSummaryItem(String title, String value) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AppTextStyles.regularGreySansBody),
            SizedBox(height: 5),
            Text(value,
                style: AppTextStyles.regularSansBody.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    ],
  );
}

Widget buildStatusRow({
  required Widget icon,
  required String label,
  String? value,
  TextStyle? valueStyle,
}) {
  return Row(
    children: [
      Expanded(
        child: Row(
          children: [
            icon,
            SizedBox(width: 10),
            Text(label,
                style: AppTextStyles.regularGreySansBody),
          ],
        ),
      ),
      if (value != null)
        Expanded(
          child: Text(
            value,
            style: valueStyle ??
                AppTextStyles.regularSansBody.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
    ],
  );
}

Widget buildHistoryHeader() {
  return Row(
    children: [
      Expanded(child: Text('Date/Time', style: AppTextStyles.regularGreySansBody)),
      Expanded(child: Text('Machine', style: AppTextStyles.regularGreySansBody)),
      Expanded(child: Text('Status', style: AppTextStyles.regularGreySansBody)),
      Expanded(child: Text('Action', style: AppTextStyles.regularGreySansBody)),
    ],
  );
}

Widget buildHistoryRow(String time, String machine, String status) {
  return Row(
    children: [
      Expanded(child: Text(time, style: AppTextStyles.regularGreySansBody)),
      Expanded(child: Text(machine, style: AppTextStyles.regularGreySansBody)),
      Expanded(child: StatusText(status: status)),
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: Text('View Report', style: AppTextStyles.regularGreySansBody.copyWith(color: Colors.blue)),
          ),
        ),
      ),
    ],
  );
}

Widget historyRow(String time, String machine, String status) {
  return Row(
    children: [
      Expanded(child: Text(time, style: AppTextStyles.regularGreySansBody)),
      Expanded(child: Text(machine, style: AppTextStyles.regularGreySansBody)),
      Expanded(child: StatusText(status: status)),
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: Text('View Report',
                style: AppTextStyles.regularGreySansBody.copyWith(color: Colors.blue)),
          ),
        ),
      ),
    ],
  );
}
