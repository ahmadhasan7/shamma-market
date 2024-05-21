import 'package:flutter/material.dart';

class CoustomCard extends StatelessWidget {
  final String imageurl;
  final String productname;
  final String productprice;
  final String Totalamount;
  final void Function()? onPressedinc;
  final void Function()? onPresseddec;

  const CoustomCard({super.key, required this.imageurl, required this.productname, required this.productprice, required this.Totalamount,required this.onPressedinc,required this.onPresseddec});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                imageurl,
                height: 100,
                fit: BoxFit.cover,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(productname),
                subtitle: Text(
                  productprice,
                  style: TextStyle(color: Colors.red),
                ),
              )),
          Expanded(
              child: Column(
                children: [
                 //IconButton(onPressed: onPressedinc, icon: Icon(Icons.add)),
                  Text("الكمية"),
                 Text(Totalamount)
                 // IconButton(onPressed: onPresseddec, icon: Icon(Icons.remove))
                ],
              ))
        ],
      ),
    );
  }
}
