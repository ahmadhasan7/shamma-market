

import '../../../core/class/crud.dart';


class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  RemoveItemFromToFavorite(String productId ,String Token) async {


    var response =
    await crud.postData('http://shamma.onrender.com/api/product/removefromfav',{
      'productId':productId,
    },Token);
    return response.fold((l) => l, (r) => r);
  }
  AddItemToFavorite(String productId ,String Token) async {
    var response =
    await crud.postData('http://shamma.onrender.com/api/product/addtofav',{
      'productId':productId,
    },Token);
    return response.fold((l) => l, (r) => r);
  }

  GetFavoriteList(String userid,String Token) async {
    var response =
    await crud.getdata('http://shamma.onrender.com/api/users/${userid}/favorites',Token);
    return response.fold((l) => l, (r) => r);
  }
}
