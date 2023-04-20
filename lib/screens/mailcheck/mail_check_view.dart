import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import 'mail_check_controller.dart';

class MailCheckView extends GetView<MailCheckController> {
  const MailCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            backgroundColor: MyTheme.myBlueDark,
            body: Stack(children: [
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
                        height: Get.height * .12,
                        width: Get.width * .18,
                        child: Image.asset(AssetHelper.mailCheck)),
                    SizedBox(height: Get.height * .0032),
                    Text(
                      "check your email".toUpperCase(),
                      style: MyTheme.regularTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * .034,
                      ),
                    ),
                    SizedBox(height: Get.height * .0019),
                    Text(
                      "We have sent to a reset password \n link to your email address",
                      style: MyTheme.regularTextStyle(
                        fontSize: Get.height * .020,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ])));
  }
}
