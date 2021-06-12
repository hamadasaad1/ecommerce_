import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';



class ErrorForm extends StatelessWidget {
  const ErrorForm({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => errorFormText(error: errors[index])));
  }

  Row errorFormText({String error}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(15),
          width: getProportionateScreenWidth(15),
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(error),
        )
      ],
    );
  }
}
