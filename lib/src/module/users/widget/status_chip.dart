import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/constants.dart';
import '../../../utils/app_text_style.dart';

class UserRoleChip extends StatelessWidget {
  final String text;
  final Color bg;
  final Color textColor;
  const UserRoleChip({super.key, required this.text, required this.bg, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          border: text == "Viewer" ? Border.all(color: Colors.grey.shade300) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.regularSansBody.copyWith(color: textColor, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class UserStatusChip extends StatelessWidget {
  final String text;
  const UserStatusChip({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
        child: Row(
          children: [
            Image.asset(greenDot),
            SizedBox(width: 5,),
            Text(
              text,
              style: AppTextStyles.regularSansBody.copyWith(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
