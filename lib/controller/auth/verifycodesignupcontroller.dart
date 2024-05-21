import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/routing.dart';
import 'package:shamamarket/data/remote/auth/verifycodedata.dart';

import '../../core/class/stutusconntection.dart';
import '../../core/functions/handingdatacontroller.dart';
abstract class Verifycodesignup extends GetxController{
  verifyaccound(String verify);
}
class VerifyCodeSignUpcontollerImp extends Verifycodesignup{
  String? userId;
  List<Map<String,dynamic>> data=[];
  VerifyCodeSignUpData verifyCodeSignUpData=VerifyCodeSignUpData(Get.find());
  late StatusRequest statusRequest;
  @override
  void onInit() {
    userId=Get.arguments['userId'];
    print(userId);
    super.onInit();
  }
  @override
  verifyaccound(String verify) async{
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await verifyCodeSignUpData.PostSignUpdata(
      userId.toString(),verify
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.seccess == statusRequest) {
      if (response['success'] ==true) {
        Fluttertoast.showToast(
            msg: "تمت العملية بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0
        );
        Get.offNamed(AppRoute.signin);
      }
    }

    else {
    Get.defaultDialog(title: "تحذير" , middleText: "الكود المدخل غير صحيح") ;
    statusRequest = StatusRequest.failure;
    }
    if(response==StatusRequest.serverfailure){
      Get.defaultDialog(title: "تحذير" , middleText: "الكود المدخل غير صحيح") ;
    }
    update();

  }
}