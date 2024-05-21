import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/controller/cartcontroller/cartservicescontroller.dart';
import 'package:shamamarket/core/class/stutusconntection.dart';
import 'package:shamamarket/core/constanat/colors.dart';
import 'package:shamamarket/core/services/services.dart';

class CartController extends GetxController {
  TextEditingController ammount = TextEditingController();
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CartServicesController cartServicesController =
      Get.put(CartServicesController());
////////////////services of cart/////////////////
  getallcart() {
    cartServicesController.getcart(
        services.pref.getString('id')!, services.pref.getString('token')!);
  }

  deleteitem(String productid) {
    cartServicesController.deleteitemfromcart(
        productid, services.pref.getString('token')!);

    Get.back();
  }

  updateammountitem(String productid) {

    cartServicesController.updataammountcart(
        ammount.text, services.pref.getString('token')!, productid);
    Get.back();
    getallcart();
    ammount.clear();
    update();
  }

  snackbarupdateAmount(String productid) {
    Get.defaultDialog(
        title: 'تعديل كمية المنتج',
        content: TextField(
          controller: ammount,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'ادخل الكمية المطلوبة',
          ),
        ),
        actions: [
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.greencolor),
            onPressed: () {
              Get.back();
            },
            child: Text('اغلاق'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangecolor),
            onPressed: () {
              updateammountitem(productid);

            },
            child: Text('متابعة'),
          )
        ]);
  }
////////////////////////////function of cart///////////////////////////
  longpresscard(String productid) {
    Get.bottomSheet(Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.edit, color: AppColors.greencolor),
              title: Text(
                'تعديل المنتج',
              ),
              onTap: () {
                snackbarupdateAmount(productid);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: AppColors.greencolor,
              ),
              title: Text('حذف المنتج'),
              onTap: () {
                deleteitem(productid);
                // Close bottom sheet
              },
            ),
          ],
        )));
  }

  @override
  void onInit() {
    getallcart();
    super.onInit();
  }
}
