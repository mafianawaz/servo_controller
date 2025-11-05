import 'package:flutter/material.dart';

import '../../../utils/app_text_style.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(title,style: AppTextStyles.regularGreyBody,),
              subtitle: Text(count,style: AppTextStyles.regularSansBody.copyWith(fontSize: 18, fontWeight: FontWeight.w500),),
            ),

          ],
        ),
      ),
    );
  }
}