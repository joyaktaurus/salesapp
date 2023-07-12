//
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:salesapp/utils/my_extensions.dart';
//
// import '../../app.dart';
// import '../../models/api_resp.dart';
// import '../../models/login_resp.dart';
// import '../../routes.dart';
// import '../../services/login_services.dart';
// import '../../services/privilege_services.dart';
// import '../../services/privileges_resp.dart';
// import '../../utils/err_m.dart';
// import '../../utils/local_store.dart';
// import '../../utils/my_utils.dart';
//
// class LoginViewController extends GetxController {
//   final TextEditingController userCtrl = TextEditingController(text: '');
//
//   final TextEditingController pswdCtrl = TextEditingController(text: '');
//
//   final FocusNode userCtrlfocusNode = FocusNode();
//
//   final FocusNode pswdCtrlfocusNode = FocusNode();
//
//   RxBool isLoggingProgress = false.obs;
//
//   void doLogin() async {
//     LocalStore.clearData();
//     log("do login called");
//     isLoggingProgress.value = true;
//     final String username = userCtrl.text;
//     final String password = pswdCtrl.text;
//
//     if (!username.isValidEmail()) {
//       userCtrlfocusNode.requestFocus();
//       showMsg('Please provide a valid User Name', 'Invalid');
//       isLoggingProgress.value = false;
//     } else if (!password.isValidPassword()['isValid']) {
//       pswdCtrlfocusNode.requestFocus();
//       showMsg(password.isValidPassword()['message'], 'Invalid');
//       isLoggingProgress.value = false;
//     } else {
//       final ApiResp resp = await LoginServices.fetchUser(username, password);
//       if (resp.ok == false) {
//         MyUtils.msg(resp.msgs);
//         isLoggingProgress.value = false;
//         return;
//       }
//       User user = User.fromJson(resp.rdata);
//       // user.email = username;
//       // App.token = user.apiToken ?? '';
//       LocalStore.setData('user_id', user.employeeDetails!.userId);
//       LocalStore.setData('token', user.employeeDetails!.apiToken);
//       LocalStore.setData('name', user.employeeDetails!.name);
//       LocalStore.setData('user_lastname', user.employeeDetails!.dob);
//       LocalStore.setData('user_email_verified', user.employeeDetails!.email);
//       LocalStore.setData('user_two_factor_required', user.employeeDetails!.phone);
//       LocalStore.setData('user_rolename', user.employeeDetails!.gender);
//       App.user = user.employeeDetails!;
//
//       // isLoggingProgress.value = false;
//
//       if (App.token.isEmpty == false) {
//         Get.snackbar("Failed", "Login failed", backgroundColor: Colors.white);
//         isLoggingProgress.value = false;
//         return;
//       }
//       if (user.employeeDetails!.phone!.isEmpty) {
//         Get.snackbar("Failed", "Login failed", backgroundColor: Colors.white);
//         isLoggingProgress.value = false;
//         return;
//       } else {
//         // Save the login session flag
//         LocalStore.setData('isLoggedIn', true);
//         LocalStore.setData('employeeId', user.employeeDetails!.employeeId);
//         Get.offAllNamed(Routes.dashBoardPage);
//       }
//     }
//   }
// }
//
//




//.........................................................
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:salesapp/utils/my_extensions.dart';

import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/login_resp.dart';
import '../../routes.dart';
import '../../services/login_services.dart';
import '../../services/privilege_services.dart';
import '../../services/privileges_resp.dart';
import '../../utils/err_m.dart';
import '../../utils/local_store.dart';
import '../../utils/my_utils.dart';

class LoginViewController extends GetxController {
  final TextEditingController userCtrl = TextEditingController(text: '');

  final TextEditingController pswdCtrl = TextEditingController(text: '');

  final FocusNode userCtrlfocusNode = FocusNode();

  final FocusNode pswdCtrlfocusNode = FocusNode();

  RxBool isLoggingProgress = false.obs;
  RxBool showPassword = false.obs; // Added this line

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  void doLogin() async {
    LocalStore.clearData();
    log("do login called");
    isLoggingProgress.value = true;
    final String username = userCtrl.text;
    final String password = pswdCtrl.text;

    if (!username.isValidEmail()) {
      userCtrlfocusNode.requestFocus();
      showMsg('Please provide a valid User Name', 'Invalid');
      isLoggingProgress.value = false;
    } else if (!password.isValidPassword()['isValid']) {
      pswdCtrlfocusNode.requestFocus();
      showMsg('Please provide a valid Password', 'Invalid');
      isLoggingProgress.value = false;
    } else {
      final ApiResp resp = await LoginServices.fetchUser(username, password);
      if (resp.ok == false) {
        Get.snackbar(
          "Incorrect credentials",
          "Please check your username and password",
          backgroundColor: Colors.white,
        );
        isLoggingProgress.value = false;
        return;
      }
      User user = User.fromJson(resp.rdata);
      LocalStore.setData('user_id', user.employeeDetails!.userId);
      LocalStore.setData('token', user.employeeDetails!.apiToken);
      LocalStore.setData('name', user.employeeDetails!.name);
      LocalStore.setData('user_lastname', user.employeeDetails!.dob);
      LocalStore.setData('user_email_verified', user.employeeDetails!.email);
      LocalStore.setData('user_two_factor_required', user.employeeDetails!.phone);
      LocalStore.setData('user_rolename', user.employeeDetails!.gender);
      LocalStore.setData('user_rolename', user.employeeDetails!.profilePic);

      App.user = user.employeeDetails!;

      if (user.employeeDetails?.apiToken?.isEmpty == true || user.employeeDetails?.name?.isEmpty == true) {
        Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
        isLoggingProgress.value = false;
        return;
      } else {
        Get.offAllNamed(Routes.dashBoardPage);
      }
      // App.user = user.employeeDetails!;
      //
      // if (App.token.isEmpty == false) {
      //   Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
      //   isLoggingProgress.value = false;
      //   return;
      // }
      //
      // if (user.employeeDetails!.name!.isEmpty) {
      //   Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
      //   isLoggingProgress.value = false;
      //   return;
      // } else {
      //   Get.offAllNamed(Routes.dashBoardPage);
      // }
    }
  }


// void doLogin() async {
  //   LocalStore.clearData();
  //   log("do login called");
  //   isLoggingProgress.value = true;
  //   final String username = userCtrl.text;
  //   final String password = pswdCtrl.text;
  //   if (!username.isValidEmail()) {
  //     userCtrlfocusNode.requestFocus();
  //     showMsg('Please provide a valid User Name', 'Invalid');
  //     isLoggingProgress.value = false;
  //   } else if (!password.isValidPassword()['isValid']) {
  //     pswdCtrlfocusNode.requestFocus();
  //     showMsg('Please provide a valid Paaword', 'Invalid');
  //     isLoggingProgress.value = false;
  //   } else {
  //     final ApiResp resp = await LoginServices.fetchUser(username, password);
  //     if (resp.ok == false) {
  //       MyUtils.msg(resp.msgs);
  //       isLoggingProgress.value = false;
  //       return;
  //     }
  //     User user = User.fromJson(resp.rdata);
  //     // user.name = username;
  //     // App.token = user.apiToken ?? '';
  //     LocalStore.setData('user_id', user.employeeDetails!.userId);
  //     LocalStore.setData('token', user.employeeDetails!.apiToken);
  //     LocalStore.setData('name', user.employeeDetails!.name);
  //     LocalStore.setData('user_lastname', user.employeeDetails!.dob);
  //     LocalStore.setData('user_email_verified', user.employeeDetails!.email);
  //     LocalStore.setData('user_two_factor_required', user.employeeDetails!.phone);
  //     LocalStore.setData('user_rolename', user.employeeDetails!.gender);
  //
  //
  //     App.user = user.employeeDetails!;
  //
  //     // isLoggingProgress.value = false;
  //
  //
  //     if (App.token.isEmpty == false) {
  //       Get.snackbar("Failed", "Login failed", backgroundColor: Colors.white);
  //       isLoggingProgress.value = false;
  //       return;
  //     }
  //     //
  //     if (user.employeeDetails!.name!.isEmpty) {
  //       Get.snackbar("Failed", "Login failed", backgroundColor: Colors.white);
  //       isLoggingProgress.value = false;
  //       return;
  //     } else {
  //       Get.offAllNamed(Routes.dashBoardPage);
  //     }
  //
  //   }
  // }
}