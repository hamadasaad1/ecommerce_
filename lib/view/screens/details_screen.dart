import 'package:eshtery/constants.dart';
import 'package:eshtery/core/view_model/cart_view_model.dart';
import 'package:eshtery/model/cart_product_model.dart';
import 'package:eshtery/model/products_model.dart';
import 'package:eshtery/size_config.dart';
import 'package:eshtery/view/Component/custom_text.dart';
import 'package:eshtery/view/Component/default_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;

  DetailsScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(300),
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            buildSizedBox(10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: model.name,
                        size: 26,
                      ),
                      buildSizedBox(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildContainerOfRowSizeAndColor(
                            text: "Size",
                            textValue: model.size,
                          ),
                          buildContainerOfRowColor(
                            text: "Color",
                            color: model.color,
                          ),
                        ],
                      ),
                      buildSizedBox(getProportionateScreenHeight(10)),
                      CustomText(
                        text: "Details",
                        size: 18,
                      ),
                      buildSizedBox(getProportionateScreenHeight(10)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: model.desc,
                          size: 16,
                          height: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(text: "Price "
                        , size: 18,),
                      GetBuilder<CartViewModel>(
                        init: Get.find(),
                        builder:(controller)=> CustomText(text: '\$' + model.price
                          , color: KPrimaryColor,
                          size: 18
                          ,),
                      ),

                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) =>
                        DefaultButton(
                          width: SizeConfig.screenWidth / 2.6,
                          text: "Add",
                          press: () {
                            controller.addProduct(CartProductModel(
                              productId: model.productId,
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                quantity: 1));
                          },
                        ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildContainerOfRowSizeAndColor({String text, String textValue}) {
    return Container(
      width: SizeConfig.screenWidth / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(20),
          ),
          border: Border.all(color: KPrimaryColor)),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: text),
            CustomText(text: textValue),
          ],
        ),
      ),
    );
  }

  buildContainerOfRowColor({String text, Color color}) {
    return Container(
      width: SizeConfig.screenWidth / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(20),
          ),
          border: Border.all(color: KPrimaryColor)),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: text),
            Container(
              width: getProportionateScreenWidth(30),
              height: getProportionateScreenHeight(20),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(10),
                  ),
                  color: color
              ),
            )
          ],
        ),
      ),
    );
  }

  buildSizedBox(double height) =>
      SizedBox(
        height: getProportionateScreenHeight(height),
      );
}
