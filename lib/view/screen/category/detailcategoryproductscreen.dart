import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamamarket/core/class/handlingrequstveiw.dart';
import 'package:shamamarket/core/constanat/colors.dart';

import '../../../controller/category/detailcategoriesproductcontroller.dart';

import 'package:get/get.dart';

import '../../widget/detels/priceproduxt.dart';
import '../../widget/imageslider.dart';

class DetailCategoryProductScreen extends StatelessWidget {
  const DetailCategoryProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsCatrgoryControllerImp controller =
        Get.put(DetailsCatrgoryControllerImp());
    return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            controller.addtocart();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.sp),
                color: AppColors.greencolor),
            margin: EdgeInsets.only(left: 25.sp),
            padding: EdgeInsets.all(15.sp),
            child: Text(
              "إضافة للسلة",
              style: TextStyle(color: Colors.white, fontFamily: "Tejwal"),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "المنتجات ",
          ),
          backgroundColor: AppColors.greencolor,
        ),
        body: SafeArea(
            child: ListView(padding: EdgeInsets.all(20.sp), children: [
          // ImageSlider(
          // imageUrls: controller.product!.images!,
          //),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                )),
            child: Column(
              children: [
                Text(
                  controller.product!.brand!,
                  style: TextStyle(
                      color: AppColors.greencolor,
                      fontSize: 25.sp,
                      fontFamily: "TejwalBold"),
                ),
                Text(
                  "${controller.product!.price} ل.س",
                  style: TextStyle(
                      color: AppColors.orangecolor,
                      fontSize: 25.sp,
                      fontFamily: "Tejwal"),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GetBuilder<DetailsCatrgoryControllerImp>(builder: (controller) {
                return PriceProduct(
                    price: "${controller.amount}",
                    onPressedadd: () {
                      controller.add();
                    },
                    onPressedremove: () {
                      controller.remove();
                    });
              }),
              Text(
                "حالة المنتج",
                style: TextStyle(
                    color: AppColors.greencolor,
                    fontFamily: "TejwalBold",
                    fontSize: 15.sp),
              ),
              controller.product!.visible!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "متوفر",
                          style: TextStyle(color: AppColors.orangecolor),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.orangecolor,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "غير متوفر",
                          style: TextStyle(color: AppColors.orangecolor),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.orangecolor,
                        )
                      ],
                    ),
              Divider(),
              Text(
                "وصف المنتج",
                style: TextStyle(
                    color: AppColors.greencolor,
                    fontFamily: "TejwalBold",
                    fontSize: 15.sp),
              ),
              Text(
                "منتج من منجات شركة براند العالمية يحتوي هذا المنتج على علبة لبن وجبنة وزبدة وزن الامالي للمنتج حوالي 250 كيلو غرام بالاضافة لذلك يمكنك طلب المنتج منتجين سويا لذلك ما بعرف شو لسا بدي اكت صناعة سورية لامنتااار",
                textAlign: TextAlign.end,
              ),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                "الكمية المتاحة للطلب",
                style: TextStyle(
                    color: AppColors.greencolor,
                    fontFamily: "TejwalBold",
                    fontSize: 15.sp),
              ),
              Text("قطعة${controller.product!.amount} ")
            ],
          )
        ])));
  }
}
