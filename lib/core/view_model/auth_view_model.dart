import 'package:eshtery/core/services/firestore_user.dart';
import 'package:eshtery/helper/local_store_data.dart';
import 'package:eshtery/model/user_model.dart';
import 'package:eshtery/view/controller_view.dart';
import 'package:eshtery/view/screens/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  //this to login  by google
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  //get instance from firebase to save users
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //this to login  by facebook
  FacebookLogin _facebookLogin = FacebookLogin();

  String email, password;
  Rxn<User> firebaseUser = Rxn<User>();

  String get user => firebaseUser.value?.email;
  //get instance from Local shared prefrenc  to save users
  final LocalStoreData _localStoreData = Get.find();

  @override
  void onInit() {
    firebaseUser.bindStream(_firebaseAuth.authStateChanges());
    if (_firebaseAuth.currentUser !=null) {
      getCurrentUserData(_firebaseAuth.currentUser.uid);
      
    }  
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //method for sign by google

  void googleSignIn() async {
    //this to access for account in google

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    //access to auth
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    //get credential by auth to access idToken And accessToken
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    //pass credential to firebase auth
    await _firebaseAuth.signInWithCredential(credential).then((user) async {
      saveUserFireStore(user);
    });
  }

//method for sign by google
  void facebookSignIn() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(['email', 'public_profile']);

    print(result.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      final accessToken = result.accessToken.token;
      print("done ${accessToken.length}");
      final credential = FacebookAuthProvider.credential(accessToken);
      await _firebaseAuth.signInWithCredential(credential);
    } else {
      print("Error " + result.errorMessage);

      Get.snackbar(
        "Error Login Account",
        result.errorMessage,

        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
           getCurrentUserData(value.user.uid);
        // await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
        //   setUser(UserModel.fromJson(value.data()));
        // });
        print(value);
        Get.offAll(Controller());
      });
    } catch (error) {
      print("Error" + error.toString());
      Get.snackbar(
        "Error Login Account",
        error.message,

        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        print(user);
        UserModel userModel = UserModel(
          userId: user.user.uid,
          email: user.user.email,
          name: name,
          pic: '',
        );
        await FireStoreUser().addUserToFireStore(userModel);
        Get.offAll(Controller());
      });
    } catch (error) {
      print("Error" + error.toString());
      Get.snackbar(
        "Error Login Account",
        error.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUserFireStore(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: user.user.displayName ?? "",
      pic: user.user.photoURL ?? "",
    );
    await FireStoreUser()
        .addUserToFireStore(userModel)
        .then((value) => Get.offAll(Controller()));
    setUser(userModel);
  }

  setUser(UserModel model) async {
    print("Name Save *="+model.name);
    await _localStoreData.setUser(model);
  }
  void getCurrentUserData(String uid)async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()));
    });
  }
}
