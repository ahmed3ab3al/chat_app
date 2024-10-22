import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final double containerHeight;
  final GestureTapCallback onTap;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? firstLinearColor;
  final Color? secondLinearColor;
  final Alignment? firstLinearAlignment;
  final AlignmentGeometry? secondLinearAlignment;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.containerHeight,
    this.width, this.radius, this.textStyle, this.buttonColor,
    this.firstLinearColor, this.secondLinearColor, this.firstLinearAlignment, this.secondLinearAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              firstLinearColor!,
              secondLinearColor!,
            ],
            begin:firstLinearAlignment!,
            end: secondLinearAlignment!,
          ),
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:textStyle
            ),
          ],
        ),
      ),
    );
  }
}
