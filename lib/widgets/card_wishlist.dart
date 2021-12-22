import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoescommerce/models/product_model.dart';
import 'package:shoescommerce/providers/wishlist_provider.dart';
import '../shared/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  const WishlistCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
      ),
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(product.galleries![0].url!,
                width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: secondaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  wishlistProvider.setProduct(product);
                },
                child: Icon(
                  Icons.favorite_rounded,
                  size: 17,
                  color: primaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
