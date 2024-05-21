import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/routing.dart';

import '../../../core/class/stutusconntection.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/remote/auth/forgetpassword/verifycoderesetpasseorddata.dart';
abstract class VerifycodeForgetPasswordController extends GetxController{
  gotoresetpassword(String verifycode);
}
class VerifycodeForgetPasswordrControllerImp extends VerifycodeForgetPasswordController{
  String? userid;

  VerifyCodeForgetPasswordData _VerifyCodeForgetPasswordData=VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  @override
  gotoresetpassword( String verifycode)async{
    print(userid);
    statusRequest = StatusRequest.loading;
    update() ;
    print("00000000000000000000000000000000000000000000000");
    var response = await _VerifyCodeForgetPasswordData.PostSignUpdata(
        verifycode,userid!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    update() ;
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      if (response['success'] ==true) {
      Get.offNamed(AppRoute.resetpassword,arguments: {'id':userid});
      }
    }
    if(response==StatusRequest.serverfailure){
      Get.defaultDialog(title: "تحذير" , middleText: "الكود المدخل غير صحيح") ;
      print(statusRequest);
      statusRequest = StatusRequest.failure;
      update();
    }
    update();
  }
  @override
  void onInit() {
    userid=Get.arguments['id'];
    super.onInit();
  }
}