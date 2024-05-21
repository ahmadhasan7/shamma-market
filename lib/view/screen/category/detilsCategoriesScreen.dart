import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamamarket/core/constanat/colors.dart';
import 'package:get/get.dart';
import 'package:shamamarket/data/model/categoiesmodel.dart';
import 'package:shamamarket/view/widget/detels/coustomcard.dart';
import '../../../controller/category/detailscategoriescontroller.dart';
import '../../../controller/favoritecontroller.dart';
class DetilsCategoriesScreen extends StatelessWidget {
  const DetilsCategoriesScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController=Get.put(FavoriteController());
    DeteilscontrollerCategoriesImp controller =
    Get.put(DeteilscontrollerCategoriesImp());
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.greencolor,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                controller.data!.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Tejwal",
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: controller.data!.id.toString(),
                child: CachedNetworkImage(
                  imageUrl: controller.data!.categoryImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 80,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      Products product = controller.data!.products![index];
                      favoriteController.setfavorate(product.id!, "${product.isdiscount}");
                  return CoustomCard(
                    imageurl: "${product.images![0]}",
                    price: "${product.price}",
                    title: product.brand!,  onPressedCard: (){
                      controller.GotoProductDetils(product);
                  }, visible: product.visible!, isdiscount: product.isdiscount!,
                    discoundprice: '${product.discountPrice}', islove: false, productid: product.id!,
                  );
                },
                childCount: controller.data!.products!.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

