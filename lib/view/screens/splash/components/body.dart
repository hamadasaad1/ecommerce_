import 'package:eshtery/core/view_model/splash_view_model.dart';
import 'package:eshtery/view/Component/default_bottom.dart';
import 'package:eshtery/view/screens/auth/sign_in_screen.dart';

import 'package:eshtery/view/screens/splash/components/splash_content.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashViewModel>(
      init: SplashViewModel(),
      builder: (controller) => SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    controller.changeIndex(value);
                  },
                  itemCount: controller.splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: controller.splashData[index]["image"],
                    text: controller.splashData[index]["text"],
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      DefaultButton(
                        text: "Continue",
                        press: () {
                          Get.offAll(SignInScreen());

                          // (context, SignInScreen.routeName);
                        },
                      ),
                      Spacer()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildDot({int index}) {
    return GetBuilder<SplashViewModel>(
      init: Get.find(),
      builder: (controller) => AnimatedContainer(
        duration: AinmationDuration,
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: controller.currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: controller.currentPage == index
              ? KPrimaryColor
              : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
