import 'package:flutter/material.dart';
import '../../../utils/app_text_style.dart';

class OutlineIconButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final IconData icon;
  final Color fillColor;
  final VoidCallback? onPressed;

  const OutlineIconButton({super.key,
    required this.text,
    required this.isFilled,
    required this.icon,
    this.fillColor = Colors.red,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon:  Icon(icon, size: 18,color: isFilled ? Colors.white : Colors.black,),
      label:  Text(text, style: AppTextStyles.regularSansBody.copyWith(color: isFilled ? Colors.white : Colors.black)),
      style: OutlinedButton.styleFrom(
        backgroundColor: isFilled ? fillColor : Colors.white,
        side:  BorderSide(color: isFilled ? fillColor : Colors.grey.shade400, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }
}
