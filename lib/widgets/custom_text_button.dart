import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String name;
  final EdgeInsets margin;
  final Function() onPressed;
  final double width;
  final bool isAvailableLoading;

  const CustomTextButton({
    Key? key,
    required this.name,
    required this.margin,
    required this.onPressed,
    this.width = double.infinity,
    this.isAvailableLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isAvailableLoading
                ? Container(
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.only(right: 4),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(primaryTextColor),
                    ),
                  )
                : const SizedBox(),
            Text(
              name,
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }
}
