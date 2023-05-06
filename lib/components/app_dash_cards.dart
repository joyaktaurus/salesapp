import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashBoardCards extends StatelessWidget {
  final double width;
  final double height;
  final String text;

//  final String svg;
  final String image;
  final GestureTapCallback? onTap;

  const DashBoardCards({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    // required this.svg,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                spreadRadius: 7,
                blurRadius: 1,
                offset: Offset(
                    2, 5), // changes position of shadow
              )
            ],
            color: Colors.white,
          ),
          height: height,
          width: width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                SizedBox(height: Get.height * 0.01),
                Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
