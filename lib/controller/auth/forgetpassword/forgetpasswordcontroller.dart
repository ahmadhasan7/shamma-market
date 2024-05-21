import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/routing.dart';
import 'package:shamamarket/data/remote/auth/forgetpassword/forgetpassword.dart';

import '../../../core/class/stutusconntection.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import 'package:get/get.dart';
abstract class ForgetPasswordController extends GetxController{
  ForgetPassword();
}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  late TextEditingController phone;
  String?id;
  MyServices services=Get.find();
  ForgetPasswordData ForgetpasswordData=ForgetPasswordData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  @override
  ForgetPassword() async{
      statusRequest = StatusRequest.loading;
      update() ;
      print("00000000000000000000000000000000000000000000000");
      var response = await ForgetpasswordData.PostSignUpdata(
          phone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      update() ;
      print(statusRequest);
      if (statusRequest == StatusRequest.seccess) {
        if (response['success'] ==true) {
          id=response['id'];
          Get.offNamed(AppRoute.verifycodeforgetpasswors,arguments: {'id':id});
        }
      }
      if(response==StatusRequest.serverfailure){
        Get.defaultDialog(title: "تحذير" , middleText: "الرقم المدخل لا ينتمي لأي حساب") ;
        print(statusRequest);
        statusRequest = StatusRequest.failure;
        update();
      }
      update();
    }

  @override
  void onInit() {
  phone=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }
}