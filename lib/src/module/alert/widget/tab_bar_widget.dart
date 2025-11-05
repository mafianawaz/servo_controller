import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';



class CustomToggle extends StatelessWidget {
  final List<String> options;
  final List<String>? optionIcons;
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Responsive scaling factors
        double fontSize;
        double spacing;
        double containerHeight;

        if (width < 400) {
          // Mobile
          fontSize = 12;
          spacing = 4;
          containerHeight = 40;
        } else if (width < 800) {
          // Tablet
          fontSize = 14;
          spacing = 6;
          containerHeight = 45;
        } else {
          // Desktop
          fontSize = 16;
          spacing = 8;
          containerHeight = 50;
        }

        return Container(
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.shade50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(options.length, (index) {
              final isSelected = index == selectedIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color:
                      isSelected ? Colors.white : Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        )
                      ]
                          : [],
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: containerHeight * 0.1,
                          horizontal: spacing),
                      child: showIcon
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            optionIcons![index],
                            color: isSelected
                                ? Colors.black
                                : Colors.grey,
                          ),
                          SizedBox(width: spacing),
                          Flexible(
                            child: Text(
                              options[index],
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.regularSansBody.copyWith(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                          : Text(
                        options[index],
                        style: AppTextStyles.regularSansBody.copyWith(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
