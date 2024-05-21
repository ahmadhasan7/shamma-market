import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shamamarket/controller/cartcontroller/cartservicescontroller.dart';
import 'package:shamamarket/core/services/services.dart';

import '../../data/model/categoiesmodel.dart';

class DetailsCatrgoryController extends GetxController {}

class DetailsCatrgoryControllerImp extends DetailsCatrgoryController {
  MyServices myServices = Get.find();
  CartServicesController cartController = Get.put(CartServicesController());
  Products? product;
  int amount = 0;

  add() {
    if (amount >= 0) {
      amount++;
      update();
    }
  }

  remove() {
    if (amount > 0) {
      amount--;
      update();
    }
  }

  addtocart() {
    amount > 0
        ? cartController.addtocart(product!.sId!, amount.toString(),
            myServices.pref.getString("token")!)
        : Fluttertoast.showToast(
            msg: "الرجاء تحديد كمية المنتج أولا",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
  }

  void initialdata() {
    product = Get.arguments['product'] as Products?;
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }
}
