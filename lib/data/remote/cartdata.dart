import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/apilink.dart';

import '../../../core/class/crud.dart';


class CartData {
  Crud crud;

  CartData(this.crud);

  AddToCart(String productId, String quantity, String token) async {
    var response =
    await crud.postData('https://shamma.onrender.com/api/cart/addtocart',{
      'productId': productId,
      'quantity':quantity
    },token);
    return response.fold((l) => l, (r) => r);
  }
GetCard(String userid, String token) async {
  var response=await crud.getdataasmap('https://shamma.onrender.com/api/cart/${userid}',token);
  return response.fold((l) => l, (r) => r);

}
  deletecart(String productId, String token) async {
    var response =
    await crud.putdata('https://shamma.onrender.com/api/cart/delete-item',{
      'productId': productId,
    },token);
    return response.fold((l) => l, (r) => r);
  }
  updateamountcart(String quantity, String token,String productId) async {
    var response =
    await crud.putdata('https://shamma.onrender.com/api/cart/update-amount',{
      'productId': productId,
      'quantity':quantity
    },token);
    return response.fold((l) => l, (r) => r);
  }

}
