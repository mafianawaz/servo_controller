import 'package:flutter/material.dart';

class ParameterCountCard extends StatelessWidget {
  final String title;
  final String count;
  const ParameterCountCard({
    super.key, required this.title, required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(height: 10,),
            Text(count,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}