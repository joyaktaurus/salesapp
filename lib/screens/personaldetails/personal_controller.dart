import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PersonalController extends GetxController {

  var email = ''.obs;
  var phone = ''.obs;
  var isLoading = false.obs;

  void updateProfile(String newEmail, newPhone) {
    // Make API call to update address information
    // Assuming you are using Dio for API requests

    // Simulating API call delay
    Future.delayed(Duration(seconds: 2), () {
      // Update the address variable with the new address value
      email.value = newEmail;
      phone.value = newPhone;
    });
  }

}