import 'package:flutter/material.dart';
import '../../widgets/card_product.dart';
import '../../widgets/custom_categories.dart';
import '../../widgets/tile_product.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ez',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '@ezsltn',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            CustomCategories(
              name: 'All Shoes',
              textColor: primaryTextColor,
              backgroundColor: primaryColor,
            ),
            CustomCategories(
              name: 'Running',
              textColor: subtitleColor,
              backgroundColor: transparentColor,
            ),
            CustomCategories(
              name: 'Training',
              textColor: subtitleColor,
              backgroundColor: transparentColor,
            ),
            CustomCategories(
              name: 'Basket Ball',
              textColor: subtitleColor,
              backgroundColor: transparentColor,
            ),
            CustomCategories(
              name: 'Hiking',
              textColor: subtitleColor,
              backgroundColor: transparentColor,
            ),
          ],
        ),
      );
    }

    Widget popularProductTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          bottom: 14,
          left: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProduct() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: defaultMargin,
            ),
            const CardProduct(),
            const CardProduct(),
            const CardProduct(),
          ],
        ),
      );
    }

    Widget newArrivalTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          bottom: 14,
          left: defaultMargin,
        ),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrival() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: const [
            TileProduct(),
            TileProduct(),
            TileProduct(),
            TileProduct(),
            TileProduct(),
            TileProduct(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductTitle(),
        popularProduct(),
        newArrivalTitle(),
        newArrival()
      ],
    );
  }
}
