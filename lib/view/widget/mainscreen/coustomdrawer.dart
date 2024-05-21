import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamamarket/core/constanat/routing.dart';
import 'package:shamamarket/core/services/services.dart';
import 'package:get/get.dart';
import '../../../controller/drawercontroller.dart';

MyServices myServices = Get.find();

class CoustomDrawer extends StatelessWidget {
  const CoustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerPageController controller = Get.put(DrawerPageController());
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Image.asset("assets/images/shamalogo.png"),
          ),
          SizedBox(),
          Divider(),
          ListTile(
            title: Text(
              "الاعدادات",
              style: TextStyle(fontFamily: "Tejwal"),
            ),
            subtitle: Text(
              "المعلومات الشخصية, البيانات وغيرها",
              style: TextStyle(fontSize: 10.sp),
            ),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text(
              "الملف الشخصي",
              style: TextStyle(fontFamily: "Tejwal"),
            ),
            subtitle: Text(
              "",
              style: TextStyle(fontSize: 10.sp),
            ),
            leading: Icon(Icons.person),
          ),
          Divider(),
          ListTile(
            title: Text(
              "تسجيل الخروج",
              style: TextStyle(fontFamily: "Tejwal"),
            ),
            subtitle: Text(
              "",
              style: TextStyle(fontSize: 10.sp),
            ),
            leading: Icon(Icons.assignment_return_outlined),
            onTap: () {
              myServices.pref.clear();
              Get.to(AppRoute.signin);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "حول",
              style: TextStyle(fontFamily: "Tejwal"),
            ),
            subtitle: Text(
              "معلومات عن التطبيق",
              style: TextStyle(fontSize: 10.sp),
            ),
            leading: Icon(Icons.add_box_outlined),
          ),
          Divider(),
          ListTile(
            title: Text(
              "تواصل معنا",
              style: TextStyle(fontFamily: "Tejwal"),
            ),
            subtitle: Text(
              "",
              style: TextStyle(fontSize: 10.sp),
            ),
            leading: Icon(Icons.phone),
          ),
          TextButton(onPressed: (){controller.callwithphone();}, child: Text("عبر الهاتف")),
          TextButton(onPressed: (){controller.callwithwhatsapp();}, child: Text("عبر واتس أب"))

        ],
      ),
    );
  }
}
