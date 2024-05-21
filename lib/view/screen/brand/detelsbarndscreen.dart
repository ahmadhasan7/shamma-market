import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shamamarket/core/constanat/colors.dart';
import 'package:get/get.dart';
import '../../../controller/brand/detailscontrollerbrand.dart';

class DetilsBrandScreen extends StatelessWidget {
  const DetilsBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeteilscontrollerBrandsImp controller =Get.put(DeteilscontrollerBrandsImp());
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
                style: TextStyle(color: Colors.white,fontFamily: "Tejwal",shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2,2),
                    blurRadius: 5
                  )
                ]),
              ),
              background: Hero(
                tag: controller.data!.id.toString(),
                child:CachedNetworkImage(
                  imageUrl:controller.data!.brandImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
