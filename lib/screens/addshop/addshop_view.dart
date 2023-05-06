import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/personaldetails/personal_controller.dart';
import '../../components/app_body_view.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';

class AddShopView extends GetView<PersonalController> {
  const AddShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: Stack(children: [
              BodyView(
                color: Colors.grey[300],
                width: Get.width * .200,
                height: Get.height * .250,
                child: Image.asset(
                  AssetHelper.addShopImage,
                  color: MyTheme.myBlueDark,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * .220),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ADD A SHOP",
                      style: MyTheme.regularTextStyle(
                        fontWeight: FontWeight.w600,
                        color: MyTheme.myBlueDark,
                        fontSize: Get.height * .027,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * .280, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Shop Name'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Customer Name'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Phone Number'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('E-mail'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Address Line 1'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Address Line 2'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Pincode'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        // controller: controller.userCtrl,
                        // focusNode: controller.userCtrlfocusNode,
                        decoration: textBoxDecoration('Instructions'),
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * .852),
                child: Center(
                  child: MAButton(
                    text: 'Submit',
                    buttonPress: () {
                      Get.offNamed(Routes.dashBoardPage);
                    },
                    isEnabled: true,
                    padding: const EdgeInsets.all(30),
                    height: Get.height * 0.07,
                    width: Get.width * 0.4,
                    clipBehavior: 0,
                    radius: 30,
                    fontSize: 20,
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
    hintStyle: MyTheme.regularTextStyle(fontSize: Get.height * .018, color: Colors.black),
  );
}
