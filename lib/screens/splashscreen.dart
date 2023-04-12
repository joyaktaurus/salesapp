import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     await FetchDataFromLocalStore().userData();
  //     App.token = App.user.token ?? '';
  //     log("token>>${App.user.token}");
  //     errM(() => checkAlreadyLogged());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                // CircleAvatar(
                //   radius: 100,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       shape: BoxShape.circle,
                //       boxShadow: [
                //         BoxShadow(
                //             blurRadius: 50, color: Colors.white)
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> checkAlreadyLogged() async {
  //   Future.delayed(
  //     const Duration(milliseconds: 1400),
  //         () async {
  //       if (App.token.isEmpty) {
  //         Get.offNamed(Routes.login);
  //       } else {
  //         Get.offNamed(Routes.dashBoardPage);
  //       }
  //     },
  //   );
  // }
}
