import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/my_theme.dart';
import 'package:salesapp/utils/asset_helper.dart';
import '../app.dart';
import '../routes.dart';
import '../utils/err_m.dart';
import '../utils/local_store.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await FetchDataFromLocalStore().userData();
      App.token = App.user.apiToken ?? '';
      log("token>>${App.user.apiToken}");
      errM(() => checkAlreadyLogged());
    });
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

  Future<void> checkAlreadyLogged() async {
    Future.delayed(
      const Duration(milliseconds: 1400),
          () async {
        if (App.token.isEmpty) {
          Get.offNamed(Routes.login);
        } else {
          Get.offNamed(Routes.dashBoardPage);
        }
      },
    );
  }

}
