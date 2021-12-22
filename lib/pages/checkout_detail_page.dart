import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoescommerce/providers/auth_providers.dart';
import 'package:shoescommerce/providers/cart_provider.dart';
import 'package:shoescommerce/providers/transaction_provider.dart';
import 'package:shoescommerce/widgets/custom_text_button.dart';
import '../shared/theme.dart';
import '../widgets/card_checkout.dart';
import '../widgets/custom_appbar.dart';

class CheckoutDetailPage extends StatefulWidget {
  const CheckoutDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutDetailPage> createState() => _CheckoutDetailPageState();
}

class _CheckoutDetailPageState extends State<CheckoutDetailPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactonProvider transactionProvider =
        Provider.of<TransactonProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.checkout(
        authProvider.user!.token!,
        cartProvider.cart,
        cartProvider.totalPrice(),
      )) {
        cartProvider.cart = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
      setState(() {
        isLoading = false;
      });
    }

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
              '${cartProvider.totalItem()} Items',
            ),
            tilePaymentSummary(
              'Product Price',
              '\$${cartProvider.totalPrice()}',
            ),
            tilePaymentSummary(
              'Shipping',
              '\$10',
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
                    '\$${cartProvider.totalPrice() + 10}',
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
            Column(
              children: cartProvider.cart
                  .map(
                    (cart) => CardCheckout(cart: cart),
                  )
                  .toList(),
            ),
            cardAddressDetail(),
            cardPaymentSummary(),
            const SizedBox(height: 30),
            const Divider(
              thickness: 1,
              color: Color(0xff2E3141),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: isLoading
                  ? CustomTextButton(
                      name: 'Loading',
                      margin: EdgeInsets.only(top: defaultMargin),
                      onPressed: () {},
                      isAvailableLoading: true,
                    )
                  : CustomTextButton(
                      name: 'Checkout Now',
                      margin: EdgeInsets.only(top: defaultMargin),
                      onPressed: handleCheckout),
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
