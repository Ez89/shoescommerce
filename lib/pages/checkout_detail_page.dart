import 'package:flutter/material.dart';
import '../shared/theme.dart';
import '../widgets/card_checkout.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';

class CheckoutDetailPage extends StatelessWidget {
  const CheckoutDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cardAddressDetail() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address Details',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset('assets/icon_store_location.png', width: 40),
                    Image.asset('assets/icon_line.png', width: 1, height: 30),
                    Image.asset('assets/icon_your_address.png', width: 40),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      'Store Location',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      'Adidas Core',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Youre Address',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      'DagoPakar',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget tilePaymentSummary(String name, String text) {
      return Container(
        margin: const EdgeInsets.only(top: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              text,
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
              ),
            )
          ],
        ),
      );
    }

    Widget cardPaymentSummary() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            tilePaymentSummary(
              'Product Quantity',
              '2 Items',
            ),
            tilePaymentSummary(
              'Product Price',
              '\$575.96',
            ),
            tilePaymentSummary(
              'Shipping',
              'Free',
            ),
            const SizedBox(height: 11),
            const Divider(
              thickness: 0.5,
              color: Color(0xff2E3141),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: priceTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                    '\$575.92',
                    style: priceTextStyle.copyWith(fontWeight: semiBold),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List Items',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const CardCheckout(),
            const CardCheckout(),
            cardAddressDetail(),
            cardPaymentSummary(),
            const SizedBox(height: 30),
            const Divider(
              thickness: 1,
              color: Color(0xff2E3141),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/checkout-success', (route) => false),
                text: 'Checkout Now',
                textColor: primaryTextColor,
                backgroundColor: primaryColor,
                textSize: 16,
                fontWeight: semiBold,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      body: ListView(
        children: [
          const CustomAppBar(
            text: 'Checkout Details',
            isAllowLeading: true,
          ),
          content(),
        ],
      ),
    );
  }
}
