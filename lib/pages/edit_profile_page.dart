import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoescommerce/models/user_model.dart';
import 'package:shoescommerce/providers/auth_providers.dart';
import '../shared/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    Widget customTextField(String title, String username) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: username,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(child: Image.network(user!.profilePhotoUrl!)),
            const SizedBox(height: 30),
            customTextField('Name', '${user.name}'),
            customTextField('Username', '@${user.username}'),
            customTextField('Email Address', '@${user.email}')
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              Icons.check,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
