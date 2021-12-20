import 'package:flutter/material.dart';
import '../shared/theme.dart';
import 'custom_button.dart';

class BubbleText extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hasData;
  const BubbleText(
      {Key? key,
      required this.text,
      this.isSender = true,
      this.hasData = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget previewProduct() {
      return Container(
        width: 231,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor5,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(isSender ? 0 : 12),
            topLeft: Radius.circular(isSender ? 12 : 0),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/image_shoes.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COURT VISION 2.0 SHOES',
                        style: primaryTextStyle,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$57,15',
                        style: priceTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomButton(
                    onPressed: () {},
                    text: 'Add to Cart',
                    textColor: primaryColor,
                    backgroundColor: backgroundColor5),
                const SizedBox(width: 8),
                CustomButton(
                  onPressed: () {},
                  text: 'Buy Now',
                  textColor: backgroundColor5,
                  backgroundColor: primaryColor,
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasData ? previewProduct() : const SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  decoration: BoxDecoration(
                    color: isSender ? backgroundColor5 : backgroundColor4,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(isSender ? 0 : 12),
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
