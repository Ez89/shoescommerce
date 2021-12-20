import 'package:flutter/material.dart';
import '../widgets/card_cart.dart';
import '../widgets/custom_button.dart';
import '../shared/theme.dart';
import '../widgets/custom_appbar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Widget emptyCart() {
      return Expanded(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icon_empty_cart.png', width: 80),
                const SizedBox(height: 20),
                Text(
                  'Opss! Your Cart is Empty',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Let\'s find your favorite shoes',
                    style: secondaryTextStyle),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  ),
                  text: 'Explore Store',
                  textColor: primaryTextColor,
                  backgroundColor: primaryColor,
                  textSize: 16,
                  fontWeight: medium,
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: const [
              CardCart(),
              CardCart(),
            ],
          ),
        ),
      );
    }

    Widget customBottomNavbar() {
      return SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$287,96',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Divider(
              thickness: 0.2,
              color: subtitleColor,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(defaultMargin),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/checkout'),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: primaryTextColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor3,
        bottomNavigationBar: customBottomNavbar(),
        body: Column(
          children: [
            const CustomAppBar(
              text: 'Your Cart',
              isAllowLeading: true,
            ),
            content(),
          ],
        ));
  }
}
