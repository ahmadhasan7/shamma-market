import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shamamarket/data/remote/auth/forgetpassword/resetpasswordata.dart';

import '../../../core/class/stutusconntection.dart';
import '../../../core/constanat/routing.dart';
import '../../../core/functions/handingdatacontroller.dart';

abstract class ResetPassword extends GetxController{
  ResetEndPassword();
}
class ResetPasswordControllerImp extends ResetPassword{
   TextEditingController newpassword=TextEditingController();
   String? userid;
   ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
   StatusRequest statusRequest=StatusRequest.none;

  @override
  void onInit() {
    userid=Get.arguments['id'];
    super.onInit();
  }
  @override
  void dispose() {
    newpassword.dispose();
    super.dispose();
  }

  @override
  ResetEndPassword()
    async{
      print(userid);
      statusRequest = StatusRequest.loading;
      update() ;
      print("00000000000000000000000000000000000000000000000");
      var response = await resetPasswordData.PostSignUpdata(
          newpassword.text,userid!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      update() ;
      print(statusRequest);
      if (statusRequest == StatusRequest.seccess) {
        if (response['success'] ==true) {
          Get.offNamed(AppRoute.signin);
        }
      }
      if(response==StatusRequest.serverfailure){
        Get.defaultDialog(title: "تحذير" , middleText: "عذراالطلب خاطئ") ;
        print(statusRequest);
        statusRequest = StatusRequest.failure;
        update();
      }
      update();
    }

}