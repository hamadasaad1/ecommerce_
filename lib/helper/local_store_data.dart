import 'dart:convert';

import 'package:eshtery/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LocalStoreData extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel model = await _getUserData();
      if (model == null) {
        return null;
      }
      return model;
    } catch (error) {
      print("Error Local " + error.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(KUserSharedPrefs);

    return UserModel.fromJson(json.decode(user));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //this to save data in shared by model
    await prefs.setString(KUserSharedPrefs, json.encode(userModel.toJson()));

    update();
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
