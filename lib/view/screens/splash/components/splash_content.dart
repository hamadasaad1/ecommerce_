import 'package:eshtery/view/Component/custom_suffix_icon.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';



class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "ESHTERY",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: KPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        CustomSuffixIcon(
          iconPath: image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),

        ),
      ],
    );
  }
}
