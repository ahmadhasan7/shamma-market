import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamamarket/controller/mainpagecontroller.dart';
import 'package:shamamarket/core/constanat/colors.dart';
import 'package:get/get.dart';
import 'package:shamamarket/data/model/brandmodul.dart';
import 'package:shamamarket/view/widget/mainscreen/coustom_container.dart';

import '../../core/class/handlingrequstveiw.dart';
import '../../data/model/categoiesmodel.dart';
import '../widget/imageslider.dart';
import '../widget/mainscreen/coustomdrawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(MaainPageControllerImp());
    return Scaffold(
      drawer: CoustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.greencolor,
        title: Text(
          "الرئيسية",
          style: TextStyle(
              fontSize: 15, fontFamily: "Tejwal", fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_active_outlined))
        ],
      ),
      body: GetBuilder<MaainPageControllerImp>(
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.all(18),
            children: [
              ImageSlider(imageUrls: controller.Images),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "تصنيفات شما ماركت",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontFamily: "TejwalBold",
                    fontSize: 17.sp),
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.Alldata.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.9.sp,
                          crossAxisSpacing: 6.sp,
                          mainAxisSpacing: 29.sp,
                        ),
                        itemBuilder: (context, index) {
                          var data = controller.Alldata[index];
                          return InkWell(
                            onTap: () {
                              controller.gotodetilsscreen(data);
                            },
                            child: Hero(
                              tag: data.id.toString(),
                              child: CoustomContainer(
                                  image:data.categoryImage!, title: data.name!),
                            ),
                          );
                        }),
                    SizedBox(height: 10.sp,),
                    Divider(),
                    Text(
                      "تسوق حسب الماركة",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: "TejwalBold",
                          fontSize: 17.sp),
                    ),
                    SizedBox(height: 10.sp,),

                    GridView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.AllBrand.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.sp,
                          crossAxisSpacing: 7.sp,
                          mainAxisSpacing: 30.sp,
                        ),
                        itemBuilder: (context, index) {
                          var branddata = controller.AllBrand[index];
                          return InkWell(
                            onTap: () {
                              controller.gotodetilsScreen2(branddata);
                            },
                            child: Hero(
                              tag: branddata.id.toString(),
                              child: CoustomContainer(
                                  image: branddata.brandImage!, title: branddata.name!),
                            ),
                          );
                        }),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
