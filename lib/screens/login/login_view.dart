import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:salesapp/components/whitecard.dart';
import '../../my_theme.dart';
import '../../utils/my_utils.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginViewController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 128, 1),
            body: Stack(children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .137,
                    ),
                    Text(
                      "welcome".toUpperCase(),
                      style: MyTheme.regularTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * .043,
                      ),
                    ),
                    Text(
                      "Sign in to Continue",
                      style: MyTheme.regularTextStyle(
                        fontSize: Get.height * .022,
                      ),
                    ),
                  ],
                ),
              ),
              WhiteCard(
                height: Get.height * .727,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * .1),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('User Name'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                          height: Get.height * .03),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Password'),
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}

InputDecoration textBoxDecoration(hintText) {
  return InputDecoration(
    hintText: hintText,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    hintStyle: MyTheme.regularTextStyle(fontSize: 18, color: Colors.black),
  );
}
