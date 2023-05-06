import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/my_theme.dart';
import 'package:salesapp/utils/asset_helper.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Get.offNamed(Routes.login)
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = Get.mediaQuery;
    // final screenWidth = mediaQueryData.size.width;
    // final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 128, 1),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/splash.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: Get. height *.12,
                    width: Get. width *.18,
                    child: Image.asset(AssetHelper.splashIcon)),
                SizedBox(height: Get. height * 0.002),
                Text(
                  "Sales executive app".toUpperCase(),
                  style: MyTheme.regularTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Get.height*.033,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
