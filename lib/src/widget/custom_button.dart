import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/responsive.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
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
        color: Colors.blue,
        borderRadius: BorderRadius.circular(r.dp(10)),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: r.dp(15)),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(r.dp(10)),
          ),
        ),
        child: isLoading
            ? SizedBox(
          height: r.dp(20),
          width: r.dp(20),
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: r.sp(16),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
