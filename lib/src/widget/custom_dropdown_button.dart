import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/app_text_style.dart';
import 'package:servo_controller/src/utils/responsive.dart';
import '../utils/constants.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String hintText;
  final Function(T?) onChanged;
  final String Function(T) itemLabel;
  final String? heading;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemLabel,
    this.hintText = "Select option",
    this.heading,
  });

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;
    return Column(
      children: [
        if ((heading ?? '').isNotEmpty)
          SizedBox(
            width: r.wp(r.isMobile ? 80 : 25),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  heading!,
                  style: AppTextStyles.regularBody.copyWith(
                    fontSize: 14,
                    color: Colors.black, // Use the optional textColor
                  ),
                ),
              ),
            ),
          ),
        Container(
          width: r.wp(r.isMobile ? 80 : 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: DropdownButtonFormField(
            value: value,
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(itemLabel(item),style: AppTextStyles.regularBody,),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.regularGreyBody,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
