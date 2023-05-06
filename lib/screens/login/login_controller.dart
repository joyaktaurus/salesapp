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
      showMsg(password.isValidPassword()['message'], 'Invalid');
      isLoggingProgress.value = false;
    } else {
      final ApiResp resp = await LoginServices.fetchUser(username, password);
      if (resp.ok == false) {
        MyUtils.msg(resp.msgs);
        isLoggingProgress.value = false;
        return;
      }

      User user = User.fromJson(resp.rdata);
      user.username = username;
      App.token = user.token ?? '';

      LocalStore.setData('user_id', user.userid);
      LocalStore.setData('token', user.token);
      LocalStore.setData('user_firstname', user.firstname);
      LocalStore.setData('user_lastname', user.lastname);
      LocalStore.setData('user_email_verified', user.emailVerified);
      LocalStore.setData('user_two_factor_required', user.twoFactorRequired);
      LocalStore.setData('user_rolename', user.rolename);
      LocalStore.setData('user_cust_id', user.custid);
      LocalStore.setData('user_cust_name', user.custname);
      LocalStore.setData('user_root', user.root);
      LocalStore.setData('user_role_id', user.roleid);
      LocalStore.setData('user_name', username);

      App.user = user;

      // isLoggingProgress.value = false;

      if (App.token.isEmpty) {
        Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
        isLoggingProgress.value = false;
        return;
      } else {
        Get.offAllNamed(Routes.dashBoardPage);
      }

      // if (App.token.isNotEmpty) {
      //   final ApiResp privilegesResp =
      //       await PrivilegeServices.fetchCurrentUserPrivileges();
      //   if (privilegesResp.ok == false) {
      //     isLoggingProgress.value = false;
      //     return;
      //   }
      //
      //   if (user.emailVerified == true) {
      //     Get.offAllNamed(Routes.dashBoardPage);
      //   } else {
      //     showMsg("Email not verified", "Failed");
      //   }
      // }
    }
  }
}
