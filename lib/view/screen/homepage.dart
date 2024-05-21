import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamamarket/controller/homepagecontroller.dart';
import 'package:get/get.dart';
import 'package:shamamarket/core/constanat/colors.dart';

import '../../controller/cartcontroller/cartcontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Get.put(CartController());
    return GetBuilder<HomePageControllerImp>(builder:(controller){
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: homePageControllerImp.bottomNavigationKey,
          index: 0,
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.favorite_border),
              label: 'المفضلة',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.add_shopping_cart),
              label: 'سلة المشتريات',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.control_point),
              label: 'النقاط',
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor:AppColors.greencolor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            homePageControllerImp.onpress(index);
          },
          letIndexChange: (index) => true,
        ),
        body: homePageControllerImp.pages[homePageControllerImp.page],





      );
    } );
  }
}
