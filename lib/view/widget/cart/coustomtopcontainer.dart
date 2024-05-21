import 'package:flutter/material.dart';
import 'package:shamamarket/core/constanat/colors.dart';


class CoustomTopContainer extends StatelessWidget {
  final String cartnumber;
  const CoustomTopContainer({super.key, required this.cartnumber});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.greencolor,
          borderRadius: BorderRadius.circular(15)),
      child: Text("يوجد لديك${cartnumber} منتجات داخل السلة ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontFamily: "Tejwal")),
    );
  }
}
