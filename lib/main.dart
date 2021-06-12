import 'package:eshtery/core/view_model/cart_view_model.dart';
import 'package:eshtery/routs.dart';

import 'package:eshtery/theme.dart';
import 'package:eshtery/view/controller_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/binding.dart';
import 'view/screens/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());//this to make share in all app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,

      theme: buildThemeData(),
      //home: SplashScreen());
      //this to use routes to move butween page
      initialRoute: Controller.routeName,
      routes: routes,
    );
  }
}
