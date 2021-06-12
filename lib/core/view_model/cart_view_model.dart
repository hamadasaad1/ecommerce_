import 'package:eshtery/core/services/database/database_helper.dart';
import 'package:eshtery/model/cart_product_model.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;
  List<CartProductModel> _model = [];

  List<CartProductModel> get cartProduct => _model;
  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;
  var dbHelper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProduct();
  }

  void addProduct(CartProductModel cartProductModel) async {
    _model.forEach((element) async {
      if (element.productId == cartProductModel.productId) {
        print("ProductId Return=" + element.productId);
        return;
      }

    });

    await dbHelper.insertToDatabase(cartProductModel);
   // _model.add(cartProductModel);
    _model = await dbHelper.getDataFromDatabase();
    _totalPrice += (double.parse(dbHelper.priceItemInsert) * cartProductModel.quantity);

    update();
  }

  void getAllProduct() async {
    _loading.value = true;

    _model = await dbHelper.getDataFromDatabase();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    _model.forEach((element) {
      _totalPrice += (double.parse(element.price) * element.quantity);
      print("TotalPrice =$_totalPrice");
      update();
    });
  }
  void increaseQuantity(int index)async{
   _model[index].quantity++;

   _totalPrice += (double.parse( _model[index].price) );
   await dbHelper.updateProduct(_model[index]);
   update();
  }


  void decreaseQuantity(int index)async{
    if(_model[index].quantity<=1){
      return;
    }else{
      _model[index].quantity--;

      _totalPrice -= (double.parse( _model[index].price));
      await dbHelper.updateProduct(_model[index]);

    }

    update();
  }

  void deleteProducts(int index)async{
    _loading.value = true;
    await dbHelper.deleteProduct(_model[index]);
    _totalPrice -= (double.parse( _model[index].price));
    _model = await dbHelper.getDataFromDatabase();
    _loading.value = false;
    update();
  }

}
