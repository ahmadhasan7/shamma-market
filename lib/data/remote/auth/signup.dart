import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../core/class/crud.dart';


class SignupData {
  Crud crud;

  SignupData(this.crud);

  PostSignUpdata(
      String username, String password, String phone) async {
    var response =
    await crud.postData('https://shamma.onrender.com/api/auth/register', {
      'username': username,
      'password': password,
      'mobilenumber': phone,
    },"");
    print(ApiLink.rigestar);
    return response.fold((l) => l, (r) => r);
  }
}
