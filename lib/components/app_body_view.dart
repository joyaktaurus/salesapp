import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/utils/asset_helper.dart';
import '../my_theme.dart';

class BodyView extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final String? imagePath;

  const BodyView({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.child,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // height: Get.height * .300,
          color: MyTheme.myBlueDark,
        ),
        Padding(
          padding: EdgeInsets.only(top: 300),
          child: Container(
            color: Colors.grey[200],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height * .135),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(117)),
              color: Colors.grey[200],
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: Get.height * .0091),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 17,
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ],
                  border: Border.all(
                    width: Get.width * .006,
                    color: MyTheme.whiteColor,
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath!),
                  ),
                ),
                child: child,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
