import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/routing.dart';
import 'package:shamamarket/view/screen/auth/bordingscreen.dart';
import 'package:shamamarket/view/screen/brand/detelsbarndscreen.dart';
import 'package:shamamarket/view/screen/category/detilsCategoriesScreen.dart';
import 'package:shamamarket/view/screen/homepage.dart';
import 'package:shamamarket/view/screen/auth/signin.dart';
import 'package:shamamarket/view/screen/auth/signup.dart';
import 'package:shamamarket/view/screen/auth/verifycodesignup.dart';
import '../../view/screen/auth/forgetpassword/forgetpassword.dart';
import '../../view/screen/auth/forgetpassword/resetpassword.dart';
import '../../view/screen/auth/forgetpassword/verifycodeforgetpassword.dart';
import '../../view/screen/category/detailcategoryproductscreen.dart';
import '../middleware/mymiddleware.dart';

class Routers {
  List<GetPage<dynamic>>? routers = [
    GetPage(name: '/', page: () => Bordingscreen(),middlewares: [
      MyMiddleWare()
    ]),
    GetPage(name: AppRoute.signin, page: () => SignIn()),
    GetPage(name: AppRoute.signup, page: () => SignUp()),
    GetPage(name: AppRoute.verifycodesignup, page: () => Verifycodesignup()),
    GetPage(name: AppRoute.forgetpassword, page: ()=>ForgetPassword()),
    GetPage(name: AppRoute.verifycodeforgetpasswors, page:()=> VerifycodeForgetPassword()),
    GetPage(name: AppRoute.resetpassword, page: ()=>ResetPasswordScreen()),
    ///home
    GetPage(name: AppRoute.homepage, page: ()=>HomePage()),
    GetPage(name: AppRoute.detilsscreeen,page: ()=>DetilsCategoriesScreen()),
    GetPage(name: AppRoute.detilsscreeen2, page: ()=>DetilsBrandScreen()),
    GetPage(name: AppRoute.detailscategoruyproduct, page: ()=>DetailCategoryProductScreen())
  ];
}
