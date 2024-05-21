import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/class/stutusconntection.dart';
import 'package:shamamarket/data/remote/cartdata.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/model/cartmodel.dart';

class CartServicesController extends GetxController {
  late StatusRequest statusRequest ;
  CartData cartData = CartData(Get.find());
  List<ProductCartModel> productdata=[];
  int Totalprice=0;

  addtocart(String userId, String quantity, String token) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.AddToCart(userId, quantity, token);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      Fluttertoast.showToast(
          msg: "تم اضافة المنتج الى السلة",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      update();
    }
  }

  getcart(String userId, String token)async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.GetCard(userId, token);
    statusRequest = handlingData(response);
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      if (response is Map<String, dynamic> && response.containsKey('products')) {
        List<dynamic> productList = response['products'];
        Totalprice = response['cost'];

        productdata = productList
            .map((productJson) => ProductCartModel.fromJson(productJson))
            .toList();
        update();
      }
    }
    update();
  }
  deleteitemfromcart(String productid, String token){
    productdata.clear();
    var response =  cartData.deletecart(productid, token);
    if (statusRequest == StatusRequest.seccess) {
      productdata.removeWhere((item) => item.productId == productid);
      update();
      Fluttertoast.showToast(
          msg: "تم حذف المنتج بنجاح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      update();
    }
  }
  updataammountcart(String quantity,String token,String productid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.updateamountcart(quantity, token,productid);
    statusRequest = handlingData(response);
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      Fluttertoast.showToast(
          msg: "تم تعديل الكمية",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      update();

    }

  }
}
