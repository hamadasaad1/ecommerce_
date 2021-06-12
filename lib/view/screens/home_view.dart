import 'package:eshtery/constants.dart';
import 'package:eshtery/core/view_model/home_view_model.dart';
import 'package:eshtery/view/Component/custom_suffix_icon.dart';
import 'package:eshtery/view/Component/custom_text.dart';
import 'package:eshtery/view/screens/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../size_config.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(70),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSearchTextFormField(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomText(
                  text: "Category",
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildListViewCategory(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildRowText(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildListViewBestSell(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: "Best Selling "),
        CustomText(text: "See All "),
      ],
    );
  }

  TextFormField buildSearchTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search Item",
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomSuffixIcon(
            iconPath: "assets/icons/Search Icon.svg",
          ),
        ),
      ),
    );
  }

  buildListViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? LinearProgressIndicator(
              color: KPrimaryColor,
            )
          : Container(
              height: getProportionateScreenHeight(130),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(60),
                        width: getProportionateScreenWidth(70),
                        margin: EdgeInsets.all(getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenHeight(10)),
                            color: Colors.grey.shade100),
                        child: Image.network(
                          controller.categoryModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      buildTextBestSell(
                        controller.categoryModel[index].name,
                      )
                    ],
                  );
                },
                itemCount: controller.categoryModel.length,
              ),
            ),
    );
  }

  buildListViewBestSell() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? LinearProgressIndicator(
              color: KPrimaryColor,
            )
          : Container(
              height: getProportionateScreenHeight(300),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailsScreen(controller.productModel[index]));
                    },
                    child: Container(
                      margin: EdgeInsets.all(getProportionateScreenWidth(5)),
                      child: Column(
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(10)),
                                color: Colors.grey.shade100),
                            height: getProportionateScreenHeight(150),
                            width: getProportionateScreenWidth(100),
                            margin:
                                EdgeInsets.all(getProportionateScreenWidth(10)),
                            child: Image.network(
                              controller.productModel[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          buildTextBestSell(
                              controller.productModel[index].name),
                          // SizedBox(
                          //   height: getProportionateScreenHeight(5),
                          // ),
                          // buildTextBestSell(controller.productModel[index].desc,
                          //     color: Colors.grey,
                          // line: 1),

                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          buildTextBestSell(
                              "\$${controller.productModel[index].price}",
                              color: KPrimaryColor),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.productModel.length,
              ),
            ),
    );
  }

  Text buildTextBestSell(text, {color,line}) {
    return Text(
      text,
      maxLines:line ,
      textAlign: TextAlign.left,
      style: TextStyle(color: color
      ),
    );
  }
}
