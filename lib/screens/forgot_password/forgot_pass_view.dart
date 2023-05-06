import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:salesapp/components/mycards.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/my_utils.dart';
import 'forgot_pass_controller.dart';

class ForgotPassView extends GetView<ForgotViewController> {
  const ForgotPassView({Key? key}) : super(key: key);

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
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * .137,
                    ),
                    Text(
                      "forgot password".toUpperCase(),
                      style: MyTheme.regularTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * .034,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .021,
                    ),
                    Text(
                      "Enter your email address and \n we would send you a link \n to reset your password",
                      style: MyTheme.regularTextStyle(
                        fontSize: Get.height * .020,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 290),
                child: MyCard(
                  height: Get.height * .727,
                  color: MyTheme.whiteColor,
                  clipBehavior: 0,
                  radius: 100,
                  child: Padding(
                    padding: EdgeInsets.all(Get.height * .027),
                    child: Container(
                      child: Stack(
                          children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: Get.height * .1),
                              TextFormField(
                                // controller: controller.userCtrl,
                                // focusNode: controller.userCtrlfocusNode,
                                decoration: textBoxDecoration('Email'),
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(height: Get.height * .070),
                              MAButton(
                                text: 'Send Mail',
                                buttonPress: () {
                                   Get.offNamed(Routes.mailCheckPage);
                                },
                                isEnabled: true,
                                padding: const EdgeInsets.all(30),
                                height: Get.height * 0.07,
                                width: Get.width * 0.4,
                                clipBehavior: 0,
                                radius: 30, fontSize: 20,
                              ),
                            ],
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
