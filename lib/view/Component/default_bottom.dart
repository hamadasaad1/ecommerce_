import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';



//genral buttom use in any war
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.width=double.infinity,
  }) : super(key: key);
  final String text;
  final double width;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: KPrimaryColor,
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.white),
          )),
    );
  }
}
