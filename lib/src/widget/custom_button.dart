import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/responsive.dart';

import '../utils/app_text_style.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? fieldLength;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    super.key, this.fieldLength,
  });

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;

    return Container(
      width: r.wp(r.isMobile ? 80 : r.isTablet ? 50 : fieldLength ?? 25),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(r.dp(12)),
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
          style: AppTextStyles.regularBody.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
