import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../core/class/crud.dart';


class CategoryData {
  Crud crud;

  CategoryData(this.crud);

  GetCategorydata() async {
    var response =
    await crud.getdata('https://shamma.onrender.com/api/category',"");
    return response.fold((l) => l, (r) => r);
  }
  GetBrandData() async {
    var response =
    await crud.getdata('https://shamma.onrender.com/api/brand',"");
    return response.fold((l) => l, (r) => r);
  }
}
