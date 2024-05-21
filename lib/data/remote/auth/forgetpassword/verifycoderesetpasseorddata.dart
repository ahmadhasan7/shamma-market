import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../../core/class/crud.dart';



class VerifyCodeForgetPasswordData {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  PostSignUpdata(
      String code,String userid) async {
    var response =
    await crud.postData('https://shamma.onrender.com/api/password/reset-password/send-code/${userid}', {
      'code': code,
    },"");
    return response.fold((l) => l, (r) => r);
  }
}
