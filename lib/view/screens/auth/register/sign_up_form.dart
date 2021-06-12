import 'package:email_validator/email_validator.dart';
import 'package:eshtery/core/view_model/auth_view_model.dart';
import 'package:eshtery/view/Component/custom_suffix_icon.dart';
import 'package:eshtery/view/Component/default_bottom.dart';
import 'package:eshtery/view/Component/error_form.dart';

import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class SigUpForm extends StatefulWidget {
  @override
  _SigInFormState createState() => _SigInFormState();
}

class _SigInFormState extends State<SigUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email, password, name;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    AuthViewModel model = AuthViewModel();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildNameTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          ErrorForm(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Register",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                model.createAccountWithEmailPassword(email, password, name);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newObject) => password = newObject,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          iconPath: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (EmailValidator.validate(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!EmailValidator.validate(value) &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Enter Your E-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          iconPath: "assets/icons/Mail.svg",
        ),
      ),
    );
  }

  TextFormField buildNameTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameShortError)) {
          setState(() {
            errors.remove(kNameNullError);
            errors.remove(kNameShortError);
          });
        } else if (value.length < 8 && !errors.contains(kNameShortError)) {
          setState(() {
            errors.remove(kNameShortError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        } else if (value.length < 8 && !errors.contains(kNameShortError)) {
          setState(() {
            errors.add(kNameShortError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter Your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          iconPath: "assets/icons/User.svg",
        ),
      ),
    );
  }
}
