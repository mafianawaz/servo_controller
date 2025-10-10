import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String status;
  const StatusCard({
    super.key, required this.title, required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade50
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle_outline,color: Colors.blue.shade300,),
                SizedBox(width: 10,),
                Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.blue.shade300),),
              ],
            ),
            SizedBox(height: 10,),
            Text(status,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.blue.shade300),),
          ],
        ),
      ),
    );
  }
}