import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../../core/class/crud.dart';



class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  PostSignUpdata(
      String password,String userid) async {
    var response =
    await crud.postData('https://shamma.onrender.com/api/password/reset-password/${userid}', {
      'password': password,
    },"");
    return response.fold((l) => l, (r) => r);
  }
}
