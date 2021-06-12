import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshtery/core/services/home_service.dart';
import 'package:eshtery/model/category_model.dart';
import 'package:eshtery/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  List<CategoryModel> _model = [];

  List<CategoryModel> get categoryModel => _model;
  ValueNotifier<bool>_loading=ValueNotifier(false);
  ValueNotifier <bool> get loading=>_loading;

  List<ProductModel> _modelProduct = [];

  List<ProductModel> get productModel => _modelProduct;

  HomeViewModel() {
    getCategory();
    getProduct();
  }

  getCategory() async {
    _loading.value=true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _model.add(CategoryModel.fromJson(value[i].data()));
        print(value[i].data().toString());
        _loading.value=false;

      }
      update();
    });
  }
  getProduct() async {
    _loading.value=true;
    HomeService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _modelProduct.add(ProductModel.fromJson(value[i].data()));
        print(value[i].data().toString());
        _loading.value=false;

      }
      update();
    });
  }
}
