import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/class/handlingrequstveiw.dart';
import 'package:shamamarket/core/constanat/colors.dart';
import 'package:shamamarket/core/functions/validetor.dart';
import 'package:shamamarket/view/widget/bording/coustombuttonauth.dart';

import '../../../controller/auth/signincontroller.dart';
import '../../widget/auth/customtextformauth.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(SignInContollerImp());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body:GetBuilder<SignInContollerImp>(
        builder: (contoller){
          return HandlingDataRequest(statusRequest: contoller.statusRequest, widget:  ListView(
            padding: EdgeInsets.all(14),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.asset(
                "assets/images/shamalogo.png",
                width: 100.sp,
                height: 100.sp,
                //fit: BoxFit.fill,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(25),
                width: 400.sp,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(4, 4),
                        blurRadius: 15)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.greencolor,
                            fontSize: 25,
                            fontFamily: "Tejwal"),
                      ),
                    ),
                    Text(
                      " ادخل رقم الهاتف",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.orangecolor,
                          fontFamily: "Tejwal"),
                    ),
                    CustomTextFormAuth(
                      hinttext: 'رقم الهاتف',
                      mycontroller: contoller.number,
                      valid: (val) {
                        Validetor("phone", 10, 10, val!);
                      },
                      isNumber: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      " ادخل كلمة السر ",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.orangecolor,
                          fontFamily: "Tejwal"),
                    ),
                    CustomTextFormAuth(
                      hinttext: 'كلمة السر',
                      mycontroller: contoller.password,
                      valid: (val) {
                        Validetor("password", 10, 10, val!);
                      },
                      isNumber: false,
                    ),
                    CoustomButtom(title: "تسجيل الدخول", onpress: () {
                      contoller.signin();
                    }),
                   const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              contoller.gotoforgetpassword();
                            },
                            child:const Text(
                              "اضغط هنا",
                              style: TextStyle(color: AppColors.orangecolor),
                            )),
                       const Text(
                          "هل نسيت كلمة السر؟",
                          style: TextStyle(color: AppColors.greencolor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "أو يمكنك تسجل الدخول من خلال",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.greencolor,
                          fontFamily: "Tejwa;"),
                    ),
                   const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            contoller.signinwithfacebook();
                          },
                          child: Image.asset(
                            "assets/images/Facebook_Logo_(2019).png",
                            width: 25.sp,
                            height: 25.sp,
                          ),
                        ),
                      const  SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            contoller.signinwithlinkedin();
                          },
                          child: Image.asset(
                            "assets/images/LinkedIn_icon.svg.png",
                            width: 25.sp,
                            height: 25.sp,
                          ),
                        ),
                        SizedBox(
                          width: 15.sp,
                        ),
                        InkWell(
                          onTap: () {
                            contoller.signinwithinsta();
                          },
                          child: Image.asset(
                            "assets/images/new-Instagram-logo-png-full-colour-glyph.png",
                            width: 25.sp,
                            height: 25.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ));
        },
      )
    );
  }
}
