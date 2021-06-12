
import 'package:flutter/material.dart';


import '../../../size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    //to use size config shuild calll in starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
