import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoescommerce/models/cart_model.dart';
import 'package:shoescommerce/providers/cart_provider.dart';
import '../shared/theme.dart';

class CardCart extends StatelessWidget {
  final CartModel cart;
  const CardCart({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
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
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '\$${cart.product!.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/button_add.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {
                      cartProvider.minQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/button_min.png',
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              cartProvider.removeProduct(cart.id!);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_remove.png',
                  width: 10,
                ),
                const SizedBox(width: 4),
                Text(
                  'Remove',
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: light),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
