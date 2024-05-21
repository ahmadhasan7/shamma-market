import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/routing.dart';
import '../../core/class/stutusconntection.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/remote/auth/signup.dart';

abstract class SignUpcontroller extends GetxController{
  signUp();
}
class SignUpContollerImp extends SignUpcontroller{
  late TextEditingController number;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  List<Map<String,dynamic>> data=[];
  SignupData signupdata=SignupData(Get.find());
  String? userid;
  StatusRequest statusRequest=StatusRequest.none;
  @override
  void onInit() {
    number=TextEditingController();
    password=TextEditingController();
    email=TextEditingController();
    username=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    username.dispose();
    number.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  signUp() async{
    print(username.text);
    statusRequest = StatusRequest.loading;
    print(statusRequest);
    update() ;
    var response = await signupdata.PostSignUpdata(
        username.text, password.text, number.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    update() ;
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      if (response['success'] ==true) {
        userid=response['userId'];
        print(userid);
        Get.offNamed(AppRoute.verifycodesignup ,arguments: {'userId':userid} );
      } else {
        Get.defaultDialog(title: "تحذير" , middleText: "رقم الهاتف أو الأيميل مستخدم من قبل") ;
        print(statusRequest);
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }
}