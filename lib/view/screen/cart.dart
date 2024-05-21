import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamamarket/core/class/handlingrequstveiw.dart';
import '../../controller/cartcontroller/cartcontroller.dart';
import '../../controller/cartcontroller/cartservicescontroller.dart';
import '../../data/model/cartmodel.dart';
import '../widget/cart/coustomButtombarcart.dart';
import '../widget/cart/coustomappbar.dart';
import '../widget/cart/coustomcard.dart';
import '../widget/cart/coustomtopcontainer.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
          bottomNavigationBar: CoustomNavBarCard(
            price: "${controller.cartServicesController.productdata.length}",
            total: "${controller.cartServicesController.Totalprice}",
            allprice: "${controller.cartServicesController.Totalprice}",
            onpressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endContained,
          body: ListView(
            padding: EdgeInsets.all(15.sp),
            children: [
              SizedBox(
                height: 15.sp,
              ),
              CoustomAppBar(title: "سلة المشتريات", onPressed: () {}),
              SizedBox(
                height: 15,
              ),
              CoustomTopContainer(
                cartnumber:
                    "${controller.cartServicesController.productdata.length}",
              ),
              HandlingDataView(
                statusRequest: controller.cartServicesController.statusRequest,
                widget: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.cartServicesController.productdata.length,
                    itemBuilder: (context, index) {
                      ProductCartModel AllProduct = controller
                          .cartServicesController.productdata[index];
                      return InkWell(
                        onLongPress: () {
                          controller.longpresscard(AllProduct.productId!);
                        },
                        child: CoustomCard(
                          imageurl: "assets/images/sedi.png",
                          productname: AllProduct.sId!,
                          productprice: "${AllProduct.quantity}",
                          Totalamount: "${AllProduct.quantity}",
                          onPressedinc: () {},
                          onPresseddec: () {},
                        ),
                      );
                    }),
              )
            ],
          ));
    });
  }
}
