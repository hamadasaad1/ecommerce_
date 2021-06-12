import 'package:eshtery/helper/local_store_data.dart';
import 'package:eshtery/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStoreData _storeData = Get.find();

  UserModel get userModel => _userModel;
  UserModel _userModel;
  ValueNotifier<bool> _loading=ValueNotifier(false);
  ValueNotifier<bool>get loading=>_loading;


  void getCurrentUser() async {
    _loading.value=true;
    await _storeData.getUser.then((value) {
      _userModel = value;
      _loading.value=false;
    });
    update();
  }

  Future<void> userSignOut() async {
    GoogleSignIn().signOut();
    //  FacebookLogin().logOut();
    FirebaseAuth.instance.signOut();
    _storeData.deleteUser();
    print(_storeData.getUser.toString());
  }
}
