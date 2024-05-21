import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../../core/class/crud.dart';



class ForgetPasswordData {
  Crud crud;

  ForgetPasswordData(this.crud);

  PostSignUpdata(
       String phone) async {
    var response =
    await crud.postData('https://shamma.onrender.com/api/password/reset-password/send-number', {
      'mobilenumber': phone,
    },"");
    return response.fold((l) => l, (r) => r);
  }
}
