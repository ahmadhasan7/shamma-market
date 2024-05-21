import 'package:flutter/material.dart';
import 'package:shamamarket/core/constanat/colors.dart';

class PriceProduct extends StatelessWidget {
  final String price;
  final void Function()? onPressedadd;
  final void Function()? onPressedremove;
  const PriceProduct({super.key, required this.price, required this.onPressedadd,required this.onPressedremove});

  @override
  Widget build(BuildContext context) {
    return            Row(
      children: [
        IconButton(onPressed: onPressedadd, icon: Icon(Icons.add)),
        Container(
          margin: EdgeInsets.all(5),
          width: 44,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Text(
            price,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(onPressed:onPressedremove, icon: Icon(Icons.remove)),


      ],
    );
  }
}
