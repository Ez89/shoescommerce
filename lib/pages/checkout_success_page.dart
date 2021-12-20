import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../shared/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Expanded(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon_empty_cart.png', width: 80),
              const SizedBox(height: 20),
              Text(
                'You made a transaction',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(height: 12),
              Text('Stay at home while we prepare your dream shoes',
                  style: subtitleTextStyle),
              const SizedBox(height: 30),
              SizedBox(
                width: 196,
                child: CustomButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false),
                  text: 'Order Other Shoes',
                  backgroundColor: primaryColor,
                  textColor: primaryTextColor,
                  textSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 196,
                child: CustomButton(
                  onPressed: () {},
                  text: 'View My Order',
                  backgroundColor: const Color(0xff39374B),
                  textColor: primaryTextColor,
                  textSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      body: Column(
        children: [
          const CustomAppBar(text: 'Checkout Success'),
          content(),
        ],
      ),
    );
  }
}
