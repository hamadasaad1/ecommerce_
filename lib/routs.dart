import 'package:eshtery/view/controller_view.dart';
import 'package:eshtery/view/screens/auth/register/register_screen.dart';
import 'package:flutter/widgets.dart';

import 'view/screens/auth/sign_in_screen.dart';
import 'view/screens/forget_password/forget_password_screen.dart';

import 'view/screens/splash/splash_screen.dart';

//here use all route to move butween page
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Controller.routeName: (context) => Controller(),
  SignInScreen.routeName: (context) => SignInScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen()
};
