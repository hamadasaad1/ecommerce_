

import 'package:eshtery/core/view_model/auth_view_model.dart';
import 'package:eshtery/view/Component/no_account.dart';
import 'package:eshtery/view/Component/social_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../sign_in_form.dart';

class Body extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in with your E-mail and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SigInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        controller.googleSignIn();
                      },
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                        controller.facebookSignIn();
                      },
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
