import 'package:flutter/material.dart';

class IconStatusChip extends StatelessWidget {
  final String label;
  final MaterialColor color; // <-- MaterialColor, not Color
  final bool filled;
  final IconData? icon;

  const IconStatusChip({
    super.key,
    required this.label,
    required this.color,
    this.filled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bg = filled ? color.shade100 : color.withOpacity(0.08);
    final border = color.withOpacity(0.6);
    final text = filled ? color.shade800 : color;

    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: text),
            const SizedBox(width: 6),
          ],
          Text(label, style: TextStyle(color: text, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
