import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class CardCheckout extends StatelessWidget {
  const CardCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terrex Urban Low',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                const SizedBox(height: 2),
                Text('\$143,98', style: priceTextStyle),
              ],
            ),
          ),
          Text(
            '2 Items',
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
