import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/personaldetails/personal_controller.dart';
import '../../components/app_body_view.dart';
import '../../components/app_buttons.dart';
import '../../components/app_textfield.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/err_m.dart';
import '../../utils/my_utils.dart';
import 'addshop_controller.dart';

class AddShopView extends GetView<AddShopController> {
  const AddShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddShopController());
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
                         controller: controller.shopnameCtrl,
                         focusNode: controller.shopnameCtrlfNode,
                        decoration: textBoxDecoration('Shop Name'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        controller: controller.cusnameCtrl,
                        focusNode: controller.cusnameCtrlfNode,
                        decoration: textBoxDecoration('Customer Name'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        controller: controller.phonenumCtrl,
                        focusNode: controller.phonenumCtrlfNode,
                        decoration: textBoxDecoration('Phone Number'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        controller: controller.emailCtrl,
                        focusNode: controller.emailCtrlfNode,
                        decoration: textBoxDecoration('E-mail'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        controller: controller.addressoneCtrl,
                        focusNode: controller.addressoneCtrlfNode,
                        decoration: textBoxDecoration('Address Line 1'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        controller: controller.addresstwoCtrl,
                        focusNode: controller.addresstwoCtrlfNode,
                        decoration: textBoxDecoration('Address Line 2'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        controller: controller.pincodeCtrl,
                        focusNode: controller.pincodeCtrlfNode,
                        decoration: textBoxDecoration('Pincode'),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Get.height * .01),
                      TextFormField(
                        controller: controller.instructCtrl,
                        focusNode: controller.instructCtrlfNode,
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
                      MyUtils.hideKeyboard();
                      errM(() => controller.shopRegister());
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
