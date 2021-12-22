import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_providers.dart';
import '../shared/theme.dart';
import '../widgets/custom_input_text.dart';
import '../widgets/custom_tac.dart';
import '../widgets/custom_text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController usernameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      bool? register = await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (register ?? false) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            duration: const Duration(seconds: 5),
            content: const Text(
              'Gagal Register !',
              textAlign: TextAlign.center,
            ),
          ),
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
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Register and Happy Shoping',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputTextFormField() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextFormField(
              title: 'Fullname',
              hiddenText: 'Your Fullname',
              imageUrl: 'assets/icon_name.png',
              textController: nameController,
            ),
            InputTextFormField(
              title: 'Username',
              hiddenText: 'Your Username',
              imageUrl: 'assets/icon_username.png',
              margin: 20,
              textController: usernameController,
            ),
            InputTextFormField(
              title: 'Email Address',
              hiddenText: 'Your Email Address',
              imageUrl: 'assets/icon_email.png',
              margin: 20,
              textController: emailController,
            ),
            InputTextFormField(
              title: 'Password',
              hiddenText: 'Your Password',
              imageUrl: 'assets/icon_password.png',
              margin: 20,
              obsecure: true,
              textController: passwordController,
            )
          ],
        ),
      );
    }

    Widget buttonSignUp() {
      return isLoading
          ? CustomTextButton(
              onPressed: () {},
              name: 'Loading',
              margin: EdgeInsets.only(top: defaultMargin),
              isAvailableLoading: true)
          : CustomTextButton(
              name: 'Sign Up',
              margin: EdgeInsets.only(top: defaultMargin),
              onPressed: handleSignUp,
            );
    }

    Widget signIn() {
      return CustomTac(
        onPressed: () {
          Navigator.pop(context);
        },
        text1: 'Already have an account? ',
        text2: 'Sign In',
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
              buttonSignUp(),
              const Spacer(),
              signIn(),
            ],
          ),
        ),
      ),
    );
  }
}
