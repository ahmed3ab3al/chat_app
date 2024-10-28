import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double containerHeight;
  final GestureTapCallback onTap;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;
  final Color? buttonColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.containerHeight,
    this.width,
    this.radius,
    this.textStyle,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}
