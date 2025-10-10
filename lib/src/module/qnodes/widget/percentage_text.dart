import 'package:flutter/material.dart';

class PercentText extends StatelessWidget {
  final int value;
  final double fontSize;

  const PercentText({
    super.key,
    required this.value,
    this.fontSize = 14,
  });

  Color _getColor() {
    if (value <= 20) return Colors.red;                // 🔴 low
    if (value < 80) return Colors.amber.shade600;     // 🟠 mid
    return Colors.blue;                              // 🔵 high
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$value%",
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: _getColor(),
      ),
    );
  }
}
