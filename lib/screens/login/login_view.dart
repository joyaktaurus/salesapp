import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:salesapp/components/mycards.dart';
import '../../components/app_buttons.dart';
import '../../components/rounded_loader.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/err_m.dart';
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
            backgroundColor: MyTheme.myBlueDark,
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
                    SizedBox(
                      height: Get.height * .024,
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
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: MyCard(
                  height: Get.height * .727,
                  color: MyTheme.whiteColor,
                  clipBehavior: 0,
                  radius: 100,
                  child: Padding(
                    padding: EdgeInsets.all(Get.height * .027),
                    child: Container(
                      child: Stack(children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: Get.height * .1),
                              TextFormField(
                                controller: controller.userCtrl,
                                focusNode: controller.userCtrlfocusNode,
                                decoration: textBoxDecoration('User Name'),
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(height: Get.height * .04),
                              TextFormField(
                                controller: controller.pswdCtrl,
                                focusNode: controller.pswdCtrlfocusNode,
                                decoration: textBoxDecoration('Password'),
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(height: Get.height * .03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.forgotPassPage);
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: MyTheme.regularTextStyle(
                                          fontSize: Get.height * .018,
                                          color: MyTheme.myBlueDark),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Center(
                            child: Obx(
                                () => controller.isLoggingProgress.value == true
                                    ? const RoundedLoader()
                                    : MAButton(
                                      text: 'Sign In',
                                      buttonPress: () {
                                       // Get.toNamed(Routes.dashBoardPage);
                                        MyUtils.hideKeyboard();
                                        errM(() => controller.doLogin());
                                      },
                                      isEnabled: true,
                                      padding: const EdgeInsets.all(30),
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.4,
                                      clipBehavior: 0,
                                      radius: 30,
                                      fontSize: 20,
                                    )),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
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
