import 'package:eshtery/constants.dart';
import 'package:eshtery/core/view_model/cart_view_model.dart';
import 'package:eshtery/view/Component/custom_suffix_icon.dart';
import 'package:eshtery/view/Component/custom_text.dart';
import 'package:eshtery/view/Component/default_bottom.dart';
import 'package:eshtery/view/screens/check_out/ckeck_out_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../size_config.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.cartProduct.length == 0
                ? buildSVGCart()
                : Column(children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Dismissible(
                                key: UniqueKey(),
                                onDismissed: (DismissDirection direction) {
                                  controller.deleteProducts(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(100),
                                        width: getProportionateScreenWidth(120),
                                        child: Image.network(
                                          controller.cartProduct[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: controller
                                                  .cartProduct[index].name,
                                              size: 18,
                                            ),
                                            buildSizedBox(5),
                                            CustomText(
                                              text:
                                                  "\$${controller.cartProduct[index].price}",
                                              color: KPrimaryColor,
                                            ),
                                            buildSizedBox(10),
                                            Container(
                                              //padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getProportionateScreenHeight(
                                                      20),
                                                ),
                                                color: Colors.grey.shade300,
                                              ),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                    icon: Icon(Icons.add),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: CustomText(
                                                      text:
                                                          "${controller.cartProduct[index].quantity}",
                                                      size: 18,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .decreaseQuantity(
                                                                index);
                                                      },
                                                      icon:
                                                          Icon(Icons.minimize),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => Container(
                                width: SizeConfig.screenWidth,
                                height: getProportionateScreenHeight(.5),
                                color: KPrimaryColor,
                              ),
                          itemCount: controller.cartProduct.length),
                    ),
                    Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: "Total ",
                                size: 18,
                              ),
                              buildSizedBox(10),
                              CustomText(
                                text: '\$ ${controller.totalPrice}',
                                color: KPrimaryColor,
                                size: 18,
                              ),
                            ],
                          ),
                          DefaultButton(
                            width: SizeConfig.screenWidth / 2.6,
                            text: "CheckOut",
                            press: () {
                              Get.to(CheckOutScreen());
                            },
                          )
                        ],
                      ),
                    )
                  ]),
      ),
    );
  }

  buildSVGCart() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSuffixIcon(
              iconPath: "assets/icons/empty_cart.svg",
              height: getProportionateScreenWidth(150),
              width: getProportionateScreenWidth(150),
            ),
            buildSizedBox(10),
            CustomText(
              text: "Cart Empty!!!",
              size: 20,
              color: KPrimaryColor,
            )
          ],
        ),
      ),
    );
  }

  buildSizedBox(double height) => SizedBox(
        height: getProportionateScreenHeight(height),
      );
}
