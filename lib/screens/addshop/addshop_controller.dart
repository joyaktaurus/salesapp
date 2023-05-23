import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/api_resp.dart';
import '../../models/shop_res.dart' as item;
import '../../models/shop_res.dart';
import '../../services/addashop_services.dart';
import '../../utils/my_utils.dart';

class AddShopController extends GetxController {

  RxList additionalFields = [].obs;

  final TextEditingController shopnameCtrl = TextEditingController(text: '');
  final TextEditingController cusnameCtrl = TextEditingController(text: '');
  final TextEditingController phonenumCtrl = TextEditingController(text: '');
  final TextEditingController emailCtrl = TextEditingController(text: '');
  final TextEditingController addressoneCtrl = TextEditingController(text: '');
  final TextEditingController addresstwoCtrl = TextEditingController(text: '');
  final TextEditingController pincodeCtrl = TextEditingController(text: '');
  final TextEditingController instructCtrl = TextEditingController(text: '');
  final TextEditingController additionalFieldKeyCtrl =
  TextEditingController(text: '');

  final FocusNode shopnameCtrlfNode = FocusNode();
  final FocusNode cusnameCtrlfNode = FocusNode();
  final FocusNode phonenumCtrlfNode = FocusNode();
  final FocusNode emailCtrlfNode = FocusNode();
  final FocusNode addressoneCtrlfNode = FocusNode();
  final FocusNode addresstwoCtrlfNode = FocusNode();
  final FocusNode pincodeCtrlfNode = FocusNode();
  final FocusNode instructCtrlfNode = FocusNode();

  void shopRegister() async {
    log("Shop registraion called");
    ApiResp resp = await ShopRegisterServices.fetchUser(
        shopname: shopnameCtrl.text,
        customername: cusnameCtrl.text,
        phonenumber: phonenumCtrl.text,
        email: emailCtrl.text,
        addressline1: addressoneCtrl.text,
        addressline2: addresstwoCtrl.text,
        pincode: pincodeCtrl.text,
        instructions: instructCtrl.text);
    if (resp.ok == false) {
      MyUtils.msg(resp.msgs);
      return;
    }
    Shop shop = Shop.fromJson(resp.rdata);
   // Get.snackbar(shop.message, 'success', backgroundColor: Colors.white);
    if (shop.message == 'Shop Details Entered Successfully') {
      shopnameCtrl.clear();
      cusnameCtrl.clear();
      phonenumCtrl.clear();
      emailCtrl.clear();
      addressoneCtrl.clear();
      addresstwoCtrl.clear();
      pincodeCtrl.clear();
      instructCtrl.clear();
    }
  }

  // addAdditionalField() {
  //   additionalFields.add(
  //     item.Shop(
  //       message: additionalFieldKeyCtrl.text,
  //     ),
  //   );
  //   Get.back();
  // }
}