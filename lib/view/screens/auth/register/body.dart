

import 'package:eshtery/core/view_model/auth_view_model.dart';
import 'package:eshtery/view/screens/auth/register/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';

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
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SigUpForm(),

                SizedBox(height: getProportionateScreenHeight(20)),
                //NoAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
