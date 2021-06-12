
import 'package:get/get.dart';

class SplashViewModel extends GetxController{
  int _currentPage = 0;
  int get currentPage => _currentPage;

  List<Map<String, String>> splashData = [
    {
      "image": "assets/icons/shop_one.svg",
      "text": "Welcome To Eshtery, Let's Shop!",
    },
    {
      "image": "assets/icons/shop_two.svg",
      "text": "We help people to connect with store \naround Upper Eygpt",
    },
    {
      "image": "assets/icons/shop_three.svg",
      "text": "We show the easy way to shop.\nJust stay at home with us ",
    },
  ];
  void changeIndex(index){
    _currentPage=index;
    update();
  }
}