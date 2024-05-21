import 'package:flutter/material.dart';

import 'coustomelevetebuttom.dart';

class CoustomNavBarCard extends StatelessWidget {
 final void Function() onpressed;
  final String price;
  final String total;
  final String allprice;

   CoustomNavBarCard(
      {super.key,
      required this.price,
      required this.total,
      required this.allprice, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("عدد القطع"), Text(price)],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("السعر"), Text(total)],
          ),
          const Divider(
            color: Colors.black,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("السعر الاجمالي"), Text(allprice)],
          ),
          CoustomElevetedButtom(
            title: "تأكيد الطلب",
            onpressed: onpressed,
          )
        ],
      ),
    );
  }
}
