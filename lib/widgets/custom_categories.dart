import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomCategories extends StatelessWidget {
  final String name;
  final Color textColor;
  final Color backgroundColor;
  const CustomCategories(
      {Key? key,
      required this.name,
      required this.textColor,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: subtitleColor),
      ),
      child: Text(
        name,
        style: primaryTextStyle.copyWith(
          fontSize: 13,
          fontWeight: medium,
          color: textColor,
        ),
      ),
    );
  }
}
