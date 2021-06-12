import 'package:email_validator/email_validator.dart';
import 'package:eshtery/core/view_model/auth_view_model.dart';
import 'package:eshtery/view/Component/custom_suffix_icon.dart';
import 'package:eshtery/view/Component/default_bottom.dart';
import 'package:eshtery/view/Component/error_form.dart';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../forget_password/forget_password_screen.dart';

class SigInForm extends StatefulWidget {
  @override
  _SigInFormState createState() => _SigInFormState();
}

class _SigInFormState extends State<SigInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email, password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    AuthViewModel model = AuthViewModel();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildEmailTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordTextField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: <Widget>[
              Checkbox(
                value: remember,
                activeColor: KPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember Me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, ForgetPasswordScreen.routeName),
                child: Text(
                  "Forget Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          ErrorForm(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                model.signInWithEmailPassword(email, password);
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
}
