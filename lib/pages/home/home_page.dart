import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoescommerce/providers/product_provider.dart';
import '../../models/user_model.dart';
import '../../providers/auth_providers.dart';
import '../../widgets/card_product.dart';
import '../../widgets/custom_categories.dart';
import '../../widgets/tile_product.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
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
                    'Hallo, ${user!.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '${user.username}',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.profilePhotoUrl!),
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
            Row(
              children: productProvider.products
                  .map(
                    (product) => ProductCard(product: product),
                  )
                  .toList(),
            ),
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
          children: productProvider.products
              .map(
                (product) => ProductTile(product: product),
              )
              .toList(),
        ),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          header(),
          categories(),
          popularProductTitle(),
          popularProduct(),
          newArrivalTitle(),
          newArrival()
        ],
      ),
    );
  }
}
