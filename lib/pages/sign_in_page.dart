import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/auth_providers.dart';
import '../shared/theme.dart';
import '../widgets/custom_input_text.dart';
import '../widgets/custom_tac.dart';
import '../widgets/custom_text_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      bool? register = await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (register ?? false) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Sign In to Countinue',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputTextFormField() {
      return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextFormField(
              title: 'Email Address',
              hiddenText: 'Your Email Address',
              imageUrl: 'assets/icon_email.png',
              textController: emailController,
            ),
            InputTextFormField(
              title: 'Password',
              hiddenText: 'Your Password',
              imageUrl: 'assets/icon_password.png',
              margin: 20,
              obsecure: true,
              textController: passwordController,
            ),
          ],
        ),
      );
    }

    Widget buttonSignIn() {
      return isLoading
          ? CustomTextButton(
              name: 'Loading',
              margin: EdgeInsets.only(top: defaultMargin),
              onPressed: () {},
              isAvailableLoading: true,
            )
          : CustomTextButton(
              name: 'Sign In',
              margin: EdgeInsets.only(top: defaultMargin),
              onPressed: handleSignIn);
    }

    Widget signUp() {
      return CustomTAC(
        onPressed: () => Navigator.pushNamed(context, '/sign-up'),
        text1: 'Dont have an account?  ',
        text2: 'Sign Up',
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              inputTextFormField(),
              buttonSignIn(),
              const Spacer(),
              signUp(),
            ],
          ),
        ),
      ),
    );
  }
}
