import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/class/handlingrequstveiw.dart';
import 'package:shamamarket/core/constanat/colors.dart';
import 'package:shamamarket/core/functions/validetor.dart';
import 'package:shamamarket/view/widget/bording/coustombuttonauth.dart';
import '../../../controller/auth/signup.dart';
import '../../widget/auth/customtextformauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpContollerImp());
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: GetBuilder<SignUpContollerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: ListView(
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
                    height: MediaQuery.of(context).size.height * 0.05,
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
                        const Center(
                          child: Text(
                            "سجل معنا",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.greencolor,
                                fontSize: 25,
                                fontFamily: "Tejwal"),
                          ),
                        ),
                        Text(
                          " اسم المستخدم",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.orangecolor,
                              fontFamily: "Tejwal"),
                        ),
                        CustomTextFormAuth(
                          hinttext: 'اسم المستخدم',
                          mycontroller: controller.username,
                          valid: (val) {
                            Validetor("username", 5, 25, val!);
                          },
                          isNumber: false,
                        ),
                        Text(
                          " البريد الإلكتروني",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.orangecolor,
                              fontFamily: "Tejwal"),
                        ),
                        CustomTextFormAuth(
                          hinttext: 'البريد الإلكتروني',
                          mycontroller: controller.email,
                          valid: (val) {
                            Validetor("email", 3, 100, val!);
                          },
                          isNumber: false,
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
                          mycontroller: controller.number,
                          valid: (val) {
                            Validetor("phone", 10, 10, val!);
                          },
                          isNumber: true,
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
                          mycontroller: controller.password,
                          valid: (val) {
                            Validetor("password", 10, 10, val!);
                          },
                          isNumber: false,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        CoustomButtom(
                            title: "تسجيل الدخول",
                            onpress: () {
                              controller.signUp();
                            }),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
