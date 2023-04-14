import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/my_theme.dart';

class WhiteCard extends StatelessWidget {
  final double height;
  final Widget child;
  const WhiteCard({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
        child: Container(
          height: height,
          width: Get.width,
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}
