import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/my_theme.dart';
import 'package:salesapp/utils/asset_helper.dart';
import '../app.dart';
import '../models/login_resp.dart';
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
    await Future.delayed(const Duration(milliseconds: 1400));

    if (App.token.isNotEmpty) {
      Get.offAllNamed(Routes.dashBoardPage);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

}

// Future<void> checkAlreadyLogged() async {
//     await Future.delayed(const Duration(milliseconds: 1400));
//
//     bool isLoggedIn = LocalStore.getData('isLoggedIn') ?? false;
//     String employeeId = LocalStore.getData('employeeId') ?? '';
//
//     if (isLoggedIn && employeeId.isNotEmpty) {
//       // Retrieve the employee details from local storage
//       String userId = LocalStore.getData('user_id') ?? '';
//       String token = LocalStore.getData('token') ?? '';
//       String name = LocalStore.getData('name') ?? '';
//       String employeeId = LocalStore.getData('employeeId') ?? '';
//       String email = LocalStore.getData('user_email_verified') ?? '';
//       String phone = LocalStore.getData('user_two_factor_required') ?? '';
//       String gender = LocalStore.getData('user_rolename') ?? '';
//       String? dob = LocalStore.getData('dob') ?? '';
//
//       // Set the employee details in the App.user object
//       App.user = EmployeeDetails(
//         userId: userId,
//         apiToken: token,
//         name: name,
//         employeeId:employeeId,
//         email: email,
//         phone: phone,
//         gender: gender,
//         dob: dob,
//       );
//
//       Get.offNamed(Routes.dashBoardPage);
//     } else {
//       Get.offNamed(Routes.login);
//     }
//   }
//
//
//   bool isLoggedIn() {
//     // Check if the user object and API token are present
//     return App.user != null && App.user.apiToken != null && App.user.apiToken!.isNotEmpty;
//   }
