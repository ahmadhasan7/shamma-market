import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../core/class/crud.dart';


class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  PostSignUpdata(
      String userId, String code) async {
    var response =
    await crud.postData('https://shamma.onrender.com/api/password/reset-password/send-code/${userId}', {
      'code': code,
    },"");
    return response.fold((l) => l, (r) => r);
  }
}
