import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:shamamarket/view/screen/auth/signup.dart';
import 'package:shamamarket/view/screen/cart.dart';
import 'package:shamamarket/view/screen/favorite.dart';
import 'package:shamamarket/view/screen/mainscreen.dart';
import 'package:shamamarket/view/screen/point.dart';

import 'cartcontroller/cartcontroller.dart';

abstract class HomePageController extends GetxController {}

class HomePageControllerImp extends HomePageController {
  int page = 0;
  List<Widget> pages=[
    MainScreen(),
    Favorite(),
    Cart(),
    Point(),
  ];
  onpress(int index) {
    page = index;
    if(index == 2) {
      CartController cartController = Get.find<CartController>();
      cartController.getallcart();
    }
    update();

    update();
  }


  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
}
