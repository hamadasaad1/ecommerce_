import 'package:eshtery/core/view_model/profile_view_model.dart';
import 'package:eshtery/size_config.dart';
import 'package:eshtery/view/Component/custom_suffix_icon.dart';
import 'package:eshtery/view/Component/custom_text.dart';
import 'package:eshtery/view/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: getProportionateScreenWidth(120),
                              height: getProportionateScreenHeight(120),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                    image: controller.userModel.pic == null
                                        ? AssetImage(
                                            "assets/images/Profile Image.png")
                                        : controller.userModel.pic == ""
                                            ? AssetImage(
                                                "assets/images/Profile Image.png")
                                            : NetworkImage(
                                                controller.userModel.pic),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  CustomText(
                                    text: controller.userModel.name ?? "",
                                    size: getProportionateScreenWidth(30),
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  CustomText(
                                    text: controller.userModel.email ?? "",
                                    size: getProportionateScreenWidth(22),
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(100),
                      ),
                      buildContentContainer(
                          title: "Edit Profile",
                          image: "assets/icons/Settings.svg",
                          onPress: () {}),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      buildContentContainer(
                          title: "Shipping Address",
                          image: "assets/icons/Location point.svg",
                          onPress: () {}),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      buildContentContainer(
                          title: "Order History",
                          image: "assets/icons/Shop Icon.svg",
                          onPress: () {}),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      buildContentContainer(
                          title: "Carts",
                          image: "assets/icons/Cart Icon.svg",
                          onPress: () {}),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      buildContentContainer(
                          title: "Notifications",
                          image: "assets/icons/Bell.svg",
                          onPress: () {}),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      buildContentContainer(
                          title: "Log Out",
                          image: "assets/icons/Log out.svg",
                          onPress: () {
                            controller.userSignOut();

                            Get.offAll(SplashScreen());
                          }),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  buildContentContainer({
    String title,
    String image,
    Function onPress,
  }) {
    return Container(
      child: TextButton(
        onPressed: onPress,
        child: ListTile(
          title: CustomText(
            text: title,
          ),
          leading: CustomSuffixIcon(
            iconPath: image,
          ),
          trailing: CustomSuffixIcon(
            iconPath: "assets/icons/arrow_right.svg",
          ),
        ),
      ),
    );
  }
}
