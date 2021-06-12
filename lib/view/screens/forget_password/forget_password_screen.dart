import 'package:flutter/material.dart';

import 'component/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = "/forget_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ForgetPassword"),
      ),
      body: Body(),
    );
  }
}
