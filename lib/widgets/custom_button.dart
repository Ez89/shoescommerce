import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double textSize;
  final FontWeight fontWeight;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.purple,
    this.textSize = 14,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: background5TextStyle.copyWith(
          color: textColor,
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
