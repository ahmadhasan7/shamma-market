import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constanat/colors.dart';

class CoustomButtom extends StatelessWidget {
  final String title;
  final void Function()? onpress;
  const CoustomButtom({super.key, required this.title,required this.onpress});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:onpress ,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3),
        width: 300.sp,
        height: 30.sp,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(3, 4),
                blurRadius: 5),
          ],
          color: AppColors.greencolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
