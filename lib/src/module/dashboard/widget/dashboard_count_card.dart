import 'package:flutter/material.dart';
import '../../../utils/app_decorations.dart';
import '../../../utils/app_text_style.dart';

class CountCard extends StatelessWidget {
  final String title;
  final String count;
  final String icon;
  const CountCard({
    super.key, required this.title, required this.count,required  this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: AppDecorations.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(title,style: AppTextStyles.regularGreyBody),
              subtitle: Text(count,style: AppTextStyles.regularBody.copyWith(fontSize: 18,fontWeight: FontWeight.w500),),
              trailing: Image.asset(icon,height: 20,width: 20,),
            ),
          ],
        ),
      ),
    );
  }
}
