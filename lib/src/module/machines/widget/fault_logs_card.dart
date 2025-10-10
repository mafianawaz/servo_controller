import 'package:flutter/material.dart';

import '../../../utils/app_decorations.dart';

class FaultLogsCard extends StatelessWidget {
  final String timeStamp;
  final String faultType;
  final String severity;
  final String status;
  final Color color;
  const FaultLogsCard({
    super.key, required this.timeStamp, required this.faultType, required this.severity, required this.status, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fault Logs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: Text('Timestamp', style: TextStyle(fontSize: 12, color: Colors.grey),)),
                Expanded(child: Text('Fault Type', style: TextStyle(fontSize: 12, color: Colors.grey),)),
                Expanded(child: Text('Severity', style: TextStyle(fontSize: 12, color: Colors.grey),)),
                Expanded(child: Text('Status', style: TextStyle(fontSize: 12, color: Colors.grey),)),
              ],
            ),
            Divider(color: Colors.grey.shade200,),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: Text(timeStamp, style: TextStyle(fontSize: 12, color: Colors.grey),)),
                Expanded(child: Text(faultType, style: TextStyle(fontSize: 12),)),
                Expanded(child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        border: Border.all(color: color),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(severity, style: TextStyle(fontSize: 12, color: color),)),
                )),
                Expanded(child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        border: Border.all(color: color),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(status, style: TextStyle(fontSize: 12, color: color),)),
                )),                                  ],
            ),

          ],
        ),
      ),
    );
  }
}
