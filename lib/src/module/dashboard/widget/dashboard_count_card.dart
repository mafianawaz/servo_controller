import 'package:flutter/material.dart';
import '../../../utils/app_decorations.dart';

class CountCard extends StatelessWidget {
  final String title;
  final String count;
  final String? icon;
  const CountCard({
    super.key, required this.title, required this.count,  this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 120,
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(fontSize: 16, color: Colors.grey),),
                Icon(Icons.person, size: 20,),
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
