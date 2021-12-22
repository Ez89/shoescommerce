import 'package:flutter/material.dart';
import 'package:shoescommerce/models/cart_model.dart';
import '../shared/theme.dart';

class CardCheckout extends StatelessWidget {
  final CartModel cart;
  const CardCheckout({Key? key, required this.cart}) : super(key: key);

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
            child: Image.network(
              cart.product!.galleries![0].url!,
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
                  cart.product!.name!,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                Text('\$${cart.product!.price}', style: priceTextStyle),
              ],
            ),
          ),
          Text(
            '${cart.quantity} Items',
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
