import 'package:get/get.dart';
import 'package:shamamarket/data/model/brandmodul.dart';
import 'package:shamamarket/data/model/categoiesmodel.dart';

abstract class DeteilscontrollerBrand extends GetxController {}
class DeteilscontrollerBrandsImp extends DeteilscontrollerBrand {
  BrandModel? data;
  InitData() {
    data = Get.arguments as BrandModel;
  }

  @override
  void onInit() {
    InitData();
    super.onInit();
  }
}
