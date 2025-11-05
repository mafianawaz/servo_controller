import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/responsive.dart';
import '../utils/app_text_style.dart';
import '../utils/constants.dart';

class CustomInputTextField extends StatelessWidget {
  final String? heading;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool autocorrect;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final String? leftIconPath;
  final Widget? rightIcon;
  final VoidCallback? onClick;
  final Function(String?)? onChange;
  final Function(String?)? onSubmit;
  final Function(String?)? validate;
  final VoidCallback? onTogglePasswordStatus;
  final bool? obscureText;
  final int? maxLines;
  final double? fieldLength;
  final Color? hintTextColor;

  const CustomInputTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onClick,
    this.onSubmit,
    this.keyboardType = TextInputType.text,
    this.obscureText,
    this.autocorrect = true,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.leftIconPath,
    this.rightIcon,
    this.heading, this.onChange, this.validate, this.onTogglePasswordStatus,
    this.maxLines, this.fieldLength, this.hintTextColor
  });

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;
    return Column(
      children: [
        if ((heading ?? '').isNotEmpty)
          SizedBox(
            width: r.wp(r.isMobile ? 80 : r.isTablet ? 50 : fieldLength ?? 25),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  heading!,
                  style: AppTextStyles.regularBody,
                ),
              ),
            ),
          ),
        SizedBox(
          width: r.wp(r.isMobile ? 80  : r.isTablet ? 50 : fieldLength ?? 25),
          child: TextFormField(
            controller: controller,
            onChanged: onChange,
            readOnly: readOnly,
            maxLines: maxLines ?? 1,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            validator: (value) {
              if (validate != null) {
                return validate!(value);
              }
              return null;
            },
            onTap: onClick,
            keyboardType: keyboardType,
            obscureText: obscureText??false,
            autocorrect: autocorrect,
            textCapitalization: textCapitalization,
            onSaved: onSubmit,
            style: AppTextStyles.regularBody.copyWith(
              color: hintTextColor ?? Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.regularGreyBody,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              prefixIcon: leftIconPath != null
                  ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                    leftIconPath!,
                    height: 5,
                    width: 5
                ),
              )
                  : null,
              suffixIcon:  (obscureText != null)
                  ? IconButton(
                icon: Icon(
                    obscureText == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: !obscureText!
                        ? primaryColor
                        : Colors.grey.shade200),
                onPressed: onTogglePasswordStatus,
                color: primaryColor,
              )
                  : rightIcon,
            ),
          ),
        ),
      ],
    );
  }
}