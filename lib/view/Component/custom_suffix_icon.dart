import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  final String iconPath;

  final double height;
  final double width;

  const CustomSuffixIcon({
    Key key,
    @required this.iconPath,
    this.height = 18,
    this.width=18
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        iconPath,
        height: getProportionateScreenWidth(height),
        width: getProportionateScreenWidth(width),

      ),
    );
  }
}
