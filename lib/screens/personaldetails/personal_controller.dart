import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PersonalController extends GetxController {

  var email = ''.obs;
  var phone = ''.obs;
  var isLoading = false.obs;

  void updateProfile() async {
    isLoading.value = true;
    try {
      var dio = Dio();
      var response = await dio.put(
        'https://seowebdesign.in/Sales_Executive/api/v1/update',
        data: {
          'email': email.value,
          'phone': phone.value,
        },
      );
      // Handle the response as needed, e.g. show a success message
    } catch (e) {
      // Handle errors, e.g. show an error message
    } finally {
      isLoading.value = false;
    }
  }

}