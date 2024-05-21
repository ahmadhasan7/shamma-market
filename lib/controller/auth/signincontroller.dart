import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/services/services.dart';
import 'package:shamamarket/view/screen/auth/signin.dart';

import '../../core/class/stutusconntection.dart';
import '../../core/constanat/routing.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/remote/auth/signin.dart';

abstract class SignIncontroller extends GetxController{
  signin();
  forgetpassword();
  signinwithlinkedin();
  signinwithfacebook();
  signinwithinsta();
  gotoforgetpassword();
}
class SignInContollerImp extends SignIncontroller{
  late TextEditingController number;
  late TextEditingController password;
  List<Map<String,dynamic>> data=[];
  MyServices services=Get.find();
  SignInData signindata=SignInData(Get.find());
  String? userid;
  StatusRequest statusRequest=StatusRequest.none;
  @override
  void onInit() {

    number=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    number.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signin() async{
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await signindata.PostSignUpdata(
         password.text, number.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    update() ;
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      if (response['success'] ==true) {
        services.pref.setString("id", response['_id']);
        services.pref.setString("token", response['token']);
        services.pref.setString("login", "1");
        Get.toNamed(AppRoute.homepage  );
      }
    }
    if(response==StatusRequest.serverfailure){
      Get.defaultDialog(title: "تحذير" , middleText: "البريد الالكتروني او كلمة السر خاطئ") ;
      print(statusRequest);
      statusRequest = StatusRequest.failure;
      update();
    }
    update();
  }

  @override
  signinwithfacebook() {
  }

  @override
  signinwithinsta() {
  }

  @override
  signinwithlinkedin() {
  }
  @override
  gotoforgetpassword() {

    Get.toNamed(AppRoute.forgetpassword);  }


  @override
  forgetpassword() {
    // TODO: implement forgetpassword
    throw UnimplementedError();
  }
}