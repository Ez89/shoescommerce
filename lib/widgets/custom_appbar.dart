import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final bool isAllowLeading;
  const CustomAppBar(
      {Key? key, required this.text, this.isAllowLeading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: isAllowLeading ? true : false,
      leading: isAllowLeading
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.chevron_left,
                color: primaryTextColor,
              ),
            )
          : const SizedBox(),
      elevation: 0,
      backgroundColor: backgroundColor1,
      title: Text(
        text,
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
    );
  }
}
