
import 'package:eshtery/view/screens/auth/register/body.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Body(),
    );
  }
}
