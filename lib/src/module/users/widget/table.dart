import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<String> headers;
  final List<List<Widget>> rows;
  final VoidCallback? onPressed;

  const CustomTable({
    super.key,
    required this.headers,
    required this.rows,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: headers.map((h) => Expanded(
                child: Text(
                  h,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              )).toList(),
            ),
          ),
          // Data rows
          ...rows.map((cells) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: GestureDetector(
                onTap: onPressed,
                child: Row(
                  children: cells
                      .map((c) => Expanded(child: c))
                      .toList(),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
