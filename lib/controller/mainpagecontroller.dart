import 'package:get/get.dart';
import 'package:shamamarket/core/class/handlingrequstveiw.dart';
import 'package:shamamarket/core/class/stutusconntection.dart';
import 'package:shamamarket/core/constanat/routing.dart';
import 'package:shamamarket/data/model/categoiesmodel.dart';
import 'package:shamamarket/data/remote/categorydata.dart';

import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/model/brandmodul.dart';
import '../view/screen/brand/detelsbarndscreen.dart';
import '../view/screen/category/detilsCategoriesScreen.dart';

abstract class MainPageController extends GetxController {
  gotodetilsscreen(var data);
}

class MaainPageControllerImp extends MainPageController {
  List<CategoryModel> Alldata = [];
  List<BrandModel> AllBrand = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();
  CategoryData categoryData = CategoryData(Get.find());
  List<String> Images = [
    "assets/images/test.jpg",
    "assets/images/test.jpg",
    "assets/images/test.jpg",
    "assets/images/test.jpg",
    "assets/images/test.jpg",
  ];

  @override
  gotodetilsscreen(var subdata) {
    print(subdata);
    Get.to(DetilsCategoriesScreen(), arguments: {'data': subdata});
  }

  gotodetilsScreen2(BrandModel subdata) {
    Get.toNamed(AppRoute.detilsscreeen2, arguments: subdata);
  }

  GetProduct() async {
    statusRequest = StatusRequest.loading;
    var response = await categoryData.GetCategorydata();
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      Alldata = List.from(response)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    }
    update();
  }

  GetBrands() async {
    statusRequest = StatusRequest.loading;
    var response = await categoryData.GetBrandData();
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      AllBrand =
          List.from(response).map((json) => BrandModel.fromJson(json)).toList();
    }
    update();
  }

  @override
  void onInit() async {
    await GetBrands();
    GetProduct();
    super.onInit();
  }
}
