import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class InputTextFormField extends StatelessWidget {
  final String title;
  final String hiddenText;
  final String imageUrl;
  final double margin;
  final bool obsecure;
  final TextEditingController textController;
  const InputTextFormField({
    Key? key,
    required this.title,
    required this.hiddenText,
    required this.imageUrl,
    this.margin = 0,
    this.obsecure = false,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor2),
            child: Center(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: 17,
                    height: 12,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imageUrl)),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      obscureText: obsecure,
                      style: primaryTextStyle,
                      controller: textController,
                      decoration: InputDecoration.collapsed(
                        hintText: hiddenText,
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
