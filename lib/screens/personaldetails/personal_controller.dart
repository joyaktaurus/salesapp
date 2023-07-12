import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../app.dart';
import '../../presets/api_paths.dart';
import '../../services/update_services.dart';
import '../../utils/mydio.dart';


class PersonalController extends GetxController {
  var email = ''.obs;
  var phone = ''.obs;
  var isLoading = false.obs;
  RxBool isScreenProgress = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> updateProfile(String newEmail, String newPhone) async {
    try {
      // Make API call to update email and phone number
      isLoading.value = true;

      // Send the request using the Dio instance
      final response = await UpdateServices.updateUser(newEmail, newPhone);

      // Handle the response and update the values
      if (response.ok) {
        Get.snackbar(
          'Update Successfully Completed',
          'success',
          backgroundColor: Colors.white,
        );
        App.user.email = newEmail;
        App.user.phone = newPhone;

        // Trigger UI update
        update();
      } else {
        // Show an error message if the API request fails
        // You can display a snackbar or an alert box
        if (response.msgs.isNotEmpty) {
          Get.snackbar(
            'Update Failed',
            response.msgs.first.title,
            backgroundColor: Colors.white,
          );
        } else {
          Get.snackbar(
            'Update Failed',
            'Failed',
            backgroundColor: Colors.white,
          );
        }
      }
    } catch (error) {
      // Handle any error that occurs during the API call
      // You can display a snackbar or an alert box
      Get.snackbar('Update Failed', 'Failed', backgroundColor: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
