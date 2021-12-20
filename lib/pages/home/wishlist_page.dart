import 'package:flutter/material.dart';
import '../../widgets/card_favorite.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../shared/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
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
            children: const [
              CardFavorite(),
              CardFavorite(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        const CustomAppBar(text: 'Favorite Shoes'),
        //emptyWishList(),
        content(),
      ],
    );
  }
}
