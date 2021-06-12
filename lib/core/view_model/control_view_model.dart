import 'package:eshtery/view/screens/cart_screen.dart';
import 'package:eshtery/view/screens/home_view.dart';
import 'package:eshtery/view/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _currentIndex = 0;
  Widget _currentScreen = HomeView();
  List _screen = [
    HomeView(),
    CartScreen(),
    SettingScreen(),
  ];

 Widget get currentScreen => _currentScreen;

  get currentIndex => _currentIndex;

  void changeIndex(index) {
    print(index.toString());
    _currentIndex = index;
    // switch (index) {
    //   case 0:
    //     _currentScreen = HomeView();
    //
    //     break;
    //   case 1:
    //     _currentScreen = CartScreen();
    //
    //     break;
    //
    //   case 2:
    //     _currentScreen = SettingScreen();
    //
    //     break;
    // }
    _currentScreen = _screen[index];
    update();
  }
}
