import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/class/stutusconntection.dart';
import 'package:shamamarket/core/services/services.dart';
import 'package:shamamarket/data/remote/favoritedata.dart';
import '../core/functions/handingdatacontroller.dart';

class FavoriteController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  Map Myfavorate = {};

  setfavorate(String id, String value) {
    Myfavorate[id] = value;
    update();
  }

  FavoriteData favoriteData = FavoriteData(Get.find());

  DeleteItem(String productId) async {
    print(productId);
    print(myServices.pref.getString('token'));
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.RemoveItemFromToFavorite(
        productId, myServices.pref.getString('token')!);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      Fluttertoast.showToast(
          msg: "تمت العملية بنجاح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
  }

  AddItem(String productid) async {
    print(productid);
    print(myServices.pref.getString('token'));
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.AddItemToFavorite(
        productid, myServices.pref.getString('token')!);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      Fluttertoast.showToast(
          msg: "تمت اضافة عنصر بنجاح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
  }

  GetFavorite() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.GetFavoriteList(
        myServices.pref.getString('id')!, myServices.pref.getString('token')!);

    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.seccess){
      
    }

  }
}
