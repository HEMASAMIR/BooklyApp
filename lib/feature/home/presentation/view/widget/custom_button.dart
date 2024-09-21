import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.bgColor,
    this.borderRadius,
    required this.textColor,
    required this.onPressed,
    required this.text,
  });
  final Color bgColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        child: Center(
            child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor),
          ),
        )));
  }
}
