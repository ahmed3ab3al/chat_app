import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextInputType? type;
  final double? borderRadius;
  final Widget? prefixIcon;
  final String? hint;
  final String? label;
  final TextEditingController? customController;
  final bool? secure;
  final Widget? suffixIcon;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? inputTextStyle;
  final Color? borderColor;
  final Color? cursorColor;
  final String? Function(String?) validator;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormFiled({
    super.key,
    this.hint,
    required this.customController,
    this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.secure = false,
    this.hintTextStyle,
    this.label,
    this.labelTextStyle,
    this.borderRadius,
    this.inputTextStyle,
    this.borderColor,
    this.cursorColor,
    required this.validator,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      style: inputTextStyle,
      cursorColor: cursorColor,
      validator: validator,
      controller: customController,
      keyboardType: type,
      obscureText: secure!,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: borderColor!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: borderColor!,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: borderColor!,
            ),
          ),
          hintText: hint,
          hintStyle: hintTextStyle,
          labelStyle: labelTextStyle,
          labelText: label,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}
