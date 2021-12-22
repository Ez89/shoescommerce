import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoescommerce/providers/wishlist_provider.dart';
import 'package:shoescommerce/widgets/card_wishlist.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../shared/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget emptyWishList() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_wishlist.png',
                width: 74,
              ),
              const SizedBox(height: 23),
              Text(
                ' You don\'t have dream shoes?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text('Let\'s find your favorite shoes',
                  style: secondaryTextStyle),
              const SizedBox(height: 20),
              CustomButton(
                  onPressed: () {},
                  text: 'Explore Now',
                  textColor: primaryTextColor,
                  backgroundColor: primaryColor,
                  textSize: 16,
                  fontWeight: medium),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: ListView(
              children: wishlistProvider.wishlist
                  .map(
                    (product) => WishlistCard(product: product),
                  )
                  .toList()),
        ),
      );
    }

    return Column(
      children: [
        const CustomAppBar(text: 'Favorite Shoes'),
        wishlistProvider.wishlist.isEmpty ? emptyWishList() : content(),
      ],
    );
  }
}
