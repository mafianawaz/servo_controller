import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/responsive.dart';
import '../utils/constants.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomOutlineButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;

    return Container(
      width: r.wp(r.isMobile ? 80 : 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.dp(10)),
      ),
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade300,width: 1),
          padding: EdgeInsets.symmetric(vertical: r.dp(15)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(r.dp(10)),
          ),
        ),
        child: isLoading
            ? SizedBox(
          height: r.dp(20),
          width: r.dp(20),
          child:  CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: r.sp(16),
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
