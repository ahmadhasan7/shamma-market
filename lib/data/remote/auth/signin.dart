import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../core/class/crud.dart';


class SignInData {
  Crud crud;

  SignInData(this.crud);

  PostSignUpdata(
       String password, String phone) async {
    var response =
    await crud.postData('https://shamma.onrender.com/api/auth/login', {
      'password': password,
      'mobilenumber': phone,
    },
      ""
    );
    return response.fold((l) => l, (r) => r);
  }
}
