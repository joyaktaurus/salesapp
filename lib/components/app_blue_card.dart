import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/my_theme.dart';

class MyBlueCard extends StatelessWidget {
  final double clipBehavior;
  final double radius;
  final double height;
  final Widget child;
  final Color color;
  const MyBlueCard({
    super.key,
    required this.height,
    required this.child,
    required this.color,
    required this.clipBehavior,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
      child: Container(
        height: height,
        width: Get.width,
        color: color,
        child: child,
      ),
    );
  }
}
