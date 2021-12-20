import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomTAC extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onPressed;

  const CustomTAC({ Key? key, required this.onPressed, this. text1 = '', this.text2 = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.only(bottom: defaultMargin),
          child: Column(
            children: [
              TextButton(
                onPressed: onPressed,
                child: Text.rich(
                  TextSpan(
                    text: text1,
                    style: subtitleTextStyle.copyWith(fontSize: 12),
                    children: [
                      TextSpan(
                        text: text2,
                        style: purpleTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}