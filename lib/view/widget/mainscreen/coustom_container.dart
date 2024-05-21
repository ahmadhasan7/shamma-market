import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomContainer extends StatelessWidget {
  final String image;
  final String title;
  const CoustomContainer({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Column(
        children: [
          CachedNetworkImage(imageUrl:image,height: 60.sp,fit: BoxFit.cover,width: double.infinity, placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),),
          SizedBox(height: 10.sp,),
          Text(title,style: TextStyle(color: Colors.white,fontFamily: "Tejwal",fontSize: 15.sp),)
        ],
      ),
    );
  }
}
