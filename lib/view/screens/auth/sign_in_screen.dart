
import 'package:flutter/material.dart';



import 'component/body.dart';

class SignInScreen extends  StatelessWidget{
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SigIn"),
      ),
      body: Body(),
    );
  }
}
