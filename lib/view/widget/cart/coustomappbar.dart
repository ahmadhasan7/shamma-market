import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CoustomAppBar({super.key, required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: onPressed,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),

        Container(
          width: MediaQuery.of(context).size.width / 10,
        )
      ],
    );
  }
}
