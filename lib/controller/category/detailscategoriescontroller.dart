import 'package:get/get.dart';
import 'package:shamamarket/controller/cartcontroller/cartcontroller.dart';
import 'package:shamamarket/core/constanat/routing.dart';
import 'package:shamamarket/data/model/categoiesmodel.dart';
abstract class DeteilscontrollerCategories extends GetxController {}
class DeteilscontrollerCategoriesImp extends DeteilscontrollerCategories {
  CartController controller=Get.put(CartController());
  var data;
  GotoProductDetils(Products product){
    Get.toNamed(AppRoute.detailscategoruyproduct,arguments: {'product': product});
  }

  InitData() {
    data = Get.arguments['data'] ;
  }

  @override
  void onInit() {
    InitData();
    super.onInit();
  }
}
