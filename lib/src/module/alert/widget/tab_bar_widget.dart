import 'package:flutter/material.dart';

class CustomToggle extends StatelessWidget {
  final List<String> options;
  final List<IconData>? optionIcons;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final bool showIcon;

  const CustomToggle({
    super.key,
    required this.options,
    required this.selectedIndex,
     this.optionIcons,
     this.showIcon = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.shade50,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) {
          final isSelected = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: showIcon ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      optionIcons![index],
                      color: isSelected ? Colors.black : Colors.grey,
                      size: 15,
                    ),
                    SizedBox(width: 8),
                    Text(
                      options[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ):
                Text(
                  options[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
