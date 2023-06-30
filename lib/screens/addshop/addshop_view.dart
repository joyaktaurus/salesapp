import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  const AddShopView({Key? key,}) : super(key: key);

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
                color: Colors.white,
                imagePath: AssetHelper.addShopImage,
                width: Get.width * .200,
                height: Get.height * .250,
                // child: Image.asset(
                //   AssetHelper.addShopImage,
                //   color: MyTheme.myBlueDark,
                // ),
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
                padding: EdgeInsets.only(top: Get.height * .280, left: 20, right: 20,bottom: 30),
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.shopnameCtrl,
                          focusNode: controller.shopnameCtrlfNode,
                          decoration: textBoxDecoration('Shop Name'),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a shop name';
                            }
                            if (value.length < 3) {
                              return 'Invalid name. Name must be at least 3 characters long.';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        TextFormField(
                          controller: controller.cusnameCtrl,
                          focusNode: controller.cusnameCtrlfNode,
                          decoration: textBoxDecoration('Customer Name'),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter customer name';
                            }
                            if (value.length < 3) {
                              return 'Invalid name. Name must be at least 3 characters long.';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: controller.phonenumCtrl,
                          focusNode: controller.phonenumCtrlfNode,
                          decoration: textBoxDecoration('Phone Number'),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            String patttern = r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)';
                            RegExp regExp = new RegExp(patttern);
                            if (value == null || value.isEmpty) {
                              return 'Please enter mobile number';
                            }
                            else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        TextFormField(
                          controller: controller.emailCtrl,
                          focusNode: controller.emailCtrlfNode,
                          decoration: textBoxDecoration('E-mail'),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value!))
                              return 'Enter Valid Email';
                            else
                              return null;
                          },
                        ),

                        SizedBox(height: Get.height * .01),
                        TextFormField(
                          controller: controller.addressoneCtrl,
                          focusNode: controller.addressoneCtrlfNode,
                          decoration: textBoxDecoration('Address Line 1'),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                            LengthLimitingTextInputFormatter(30),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter address';
                            }
                            if (value.length < 3) {
                              return 'Invalid address. Address must be at least 3 characters long.';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        TextFormField(
                          controller: controller.addresstwoCtrl,
                          focusNode: controller.addresstwoCtrlfNode,
                          decoration: textBoxDecoration('Address Line 2'),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                            LengthLimitingTextInputFormatter(30),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter address';
                            }
                            if (value.length < 3) {
                              return 'Invalid address. Address must be at least 3 characters long.';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: Get.height * .01),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: controller.pincodeCtrl,
                          focusNode: controller.pincodeCtrlfNode,
                          decoration: textBoxDecoration('Pincode'),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            String patttern = r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)';
                            RegExp regExp = new RegExp(patttern);
                            if (value == null || value.isEmpty) {
                              return 'Please enter pincode';
                            }
                            else {
                            return null;
                          }
                          }
                        ),
                        SizedBox(height: Get.height * .01),
                        TextFormField(
                          controller: controller.instructCtrl,
                          focusNode: controller.instructCtrlfNode,
                          decoration: textBoxDecoration('Instructions'),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                            LengthLimitingTextInputFormatter(100),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter instructions';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: Get.height * .03),
                        Center(
                          child: MAButton(
                            text: 'Submit',
                            buttonPress: () {
                              MyUtils.hideKeyboard();
                              if (controller.formKey.currentState!.validate()) {
                                // All fields are valid, perform the submit operation
                                errM(() => controller.shopRegister());
                              }
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
                      ],

                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: Get.height * .852),
              //   child: Center(
              //     child: MAButton(
              //       text: 'Submit',
              //       buttonPress: () {
              //         MyUtils.hideKeyboard();
              //         if (controller.formKey.currentState!.validate()) {
              //           // All fields are valid, perform the submit operation
              //           errM(() => controller.shopRegister());
              //         }
              //       },
              //       isEnabled: true,
              //       padding: const EdgeInsets.all(30),
              //       height: Get.height * 0.07,
              //       width: Get.width * 0.4,
              //       clipBehavior: 0,
              //       radius: 30,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
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
