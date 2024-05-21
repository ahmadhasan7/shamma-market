
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamamarket/controller/favoritecontroller.dart';

class CoustomCard extends StatelessWidget {
  final String imageurl;
  final String price;
  final String title;
  final bool visible;
  final bool isdiscount;
  final bool islove;
  final String discoundprice;
  final String productid;
  final void Function() onPressedCard;

  CoustomCard({
    super.key,
    required this.imageurl,
    required this.price,
    required this.title,
    required this.onPressedCard,
    required this.visible,
    required this.isdiscount,
    required this.discoundprice,
    required this.islove,
    required this.productid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 15,
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(3, 3))
        ]),
        width: 200,
        height: 150,
        child: GestureDetector(
          onTap: onPressedCard,
          child: Stack(clipBehavior: Clip.none, children: [
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      title.substring(0, 6),
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    visible ? Text("متوفر") : Text("غير متوفر"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isdiscount
                            ? Row(
                                children: [
                                  Text(
                                    "${price}",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Text("${discoundprice}")
                                ],
                              )
                            : Text("${price}"),
                        GetBuilder<FavoriteController>(builder: (controller){
                          return IconButton(
                              onPressed: (){
                                if(controller.Myfavorate[productid]=='true'){
                                  controller.DeleteItem(productid);
                                  controller.setfavorate(productid, "false");
                                }
                                else{
                                  controller.AddItem(productid);

                                  controller.setfavorate(productid, "true");

                                }
                              },
                              icon: Icon(
                                controller.Myfavorate[productid]=='true'?
                                Icons.favorite:Icons.favorite_border,
                                color: Colors.red,
                              ));
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Positioned(
            //   right: 10.sp,
            //   bottom: 70.sp,
            //   child: Image.network(
            //     imageurl,
            //     height: 130.sp,
            //     width: 110.sp,
            //   ),
            // )
          ]),
        ));
  }
}
