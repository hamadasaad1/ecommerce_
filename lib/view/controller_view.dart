import 'package:eshtery/core/view_model/auth_view_model.dart';
import 'package:eshtery/core/view_model/control_view_model.dart';
import 'package:eshtery/view/screens/cart_screen.dart';
import 'package:eshtery/view/screens/home_view.dart';
import 'package:eshtery/view/screens/profile_screen.dart';
import 'package:eshtery/view/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'Component/custom_suffix_icon.dart';

class Controller extends GetWidget<AuthViewModel> {
  static String routeName = "/controller";

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? SplashScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: buildBottomNavigationBar(),
              ),
            );
    });
  }

  buildBottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find( ),
        builder: (controller) => BottomNavigationBar(
              elevation: 0,
              onTap: (index) {
                controller.changeIndex(index);  
              },
              selectedItemColor: KPrimaryColor,
              unselectedItemColor: KAccentColor,
              currentIndex: controller.currentIndex,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Text("                                                                                                                                    Home"),
                  label: "",
                  icon:
                      CustomSuffixIcon(iconPath: "assets/icons/Gift Icon.svg"),
                ),
                BottomNavigationBarItem(
                  activeIcon: Text("Cart"),
                  label: "",
                  icon:
                      CustomSuffixIcon(iconPath: "assets/icons/Cart Icon.svg"),
                ),
                BottomNavigationBarItem(
                  activeIcon: Text("Profile"),
                  label: "",
                  icon: CustomSuffixIcon(iconPath: "assets/icons/User.svg"),
                ),
              ],
            ));
  }
}
