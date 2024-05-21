import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamamarket/controller/auth/bordingcontroller.dart';
import 'package:shamamarket/core/constanat/colors.dart';
import 'package:shamamarket/core/constanat/titles.dart';
import 'package:shamamarket/view/widget/bording/coustombuttonauth.dart';

class Bordingscreen extends StatelessWidget {
  const Bordingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    BordingcontrollernImp controller=Get.put(BordingcontrollernImp());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/shamalogo.png",
                width: 300.sp,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                AppTitels.lable,
                style: TextStyle(
                    color: AppColors.greencolor,
                    fontSize: 30.sp,
                    fontFamily: "TejwalBold",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                AppTitels.subtitle,
                style: TextStyle(
                    color: AppColors.greencolor,
                    fontSize: 13.sp,
                    fontFamily: "TejwalBold"),
                textAlign: TextAlign.center,
              ),
              Text(
                AppTitels.title1,
                style: TextStyle(
                    color: AppColors.orangecolor,
                    fontSize: 13.sp,
                    fontFamily: "TejwalBold",),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.orangecolor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text("تسوق من هاتفك وطلبك واصل لعندك مجانا",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontFamily: "TejwalBold")),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              CoustomButtom(title: "تسجيل دخول",onpress: (){
                controller.gotosignin();
              },),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              CoustomButtom(title: "انشاء حساب",onpress: (){
                controller.gotosignup();
              },),

            ],
          ),
        ),
      ),
    );
  }
}
