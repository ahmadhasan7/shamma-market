import 'package:flutter/material.dart';
import 'package:shamamarket/core/constanat/colors.dart';

class CoustomElevetedButtom extends StatelessWidget {
  final String title;
  final  void Function()? onpressed;
  const CoustomElevetedButtom({super.key, required this.title, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greencolor),
            onPressed: onpressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Text(title),
            )));
  }
}
